from fastapi import FastAPI
from contextlib import asynccontextmanager
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from google.oauth2 import id_token
from google.auth.transport import requests
from dotenv import load_dotenv
import os
import play_and_go_app.models
load_dotenv()

from play_and_go_app.db.session import engine
from play_and_go_app.routers import auth_router, user_router, household_router, chore_router, reward_router, profile_router
from play_and_go_app.db.base import Base

GOOGLE_CLIENT_ID = os.getenv("GOOGLE_CLIENT_ID")

class TokenRequest(BaseModel):
    token: str

@asynccontextmanager
async def lifespan(app: FastAPI):
    Base.metadata.create_all(bind=engine)
    print("Database tables created")
    yield
    print("App is shutting down")

app = FastAPI(lifespan=lifespan)

app.include_router(profile_router.router)
app.include_router(auth_router.router)
app.include_router(user_router.router)
app.include_router(household_router.router)
app.include_router(chore_router.router)
app.include_router(reward_router.router)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/")
def root():
    return {"message": "API is running properly!"}

@app.post("/auth/google")
def google_auth(data: TokenRequest):
    try:
        idinfo = id_token.verify_oauth2_token(
            data.token,
            requests.Request(),
            GOOGLE_CLIENT_ID
        )

        email = idinfo.get("email")
        name = idinfo.get("name")

        return {
            "status": "success",
            "email": email,
            "name": name
        }

    except Exception as e:
        return {
            "status": "error",
            "message": str(e)
        }