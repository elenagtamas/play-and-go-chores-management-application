from fastapi import APIRouter, HTTPException
from pydantic import BaseModel
from google.oauth2 import id_token
from google.auth.transport import requests
from jose import jwt
from datetime import datetime, timedelta, timezone
import os

SECRET_KEY = os.getenv("SECRET_KEY")

if not SECRET_KEY:
    raise ValueError("SECRET_KEY is not set")

def create_access_token(data: dict, expires_minutes: int = 60):
    to_encode = data.copy()

    expire = datetime.now(timezone.utc) + timedelta(minutes=expires_minutes)

    to_encode.update({
        "exp": expire,
        "iat": datetime.now(timezone.utc)
    })

    return jwt.encode(to_encode, SECRET_KEY, algorithm="HS256") # type: ignore

router = APIRouter(prefix="/auth", tags=["Auth"])

GOOGLE_CLIENT_ID = os.getenv("GOOGLE_CLIENT_ID")

class TokenSchema(BaseModel):
    token: str

@router.post("/google")
def google_login(data: TokenSchema):
    try:
        idinfo = id_token.verify_oauth2_token(
            data.token,
            requests.Request(),
            GOOGLE_CLIENT_ID
        )

        email = idinfo.get("email")
        name = idinfo.get("name")

        if not email:
            raise HTTPException(status_code=400, detail="Email not found in Google token")

        access_token = create_access_token({"sub": email})

        return {
            "access_token": access_token,
            "token_type": "bearer",
            "email": email,
            "name": name
        }

    except ValueError:
        raise HTTPException(status_code=401, detail="Invalid Google token")