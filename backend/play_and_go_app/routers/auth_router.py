from fastapi import APIRouter, HTTPException, Depends
from pydantic import BaseModel
from google.oauth2 import id_token
from google.auth.transport import requests
from play_and_go_app.models.users import User
from play_and_go_app.db.session import get_db
from sqlalchemy.orm import Session
from jose import jwt
from datetime import datetime, timedelta, timezone
import os

router = APIRouter(prefix="/auth", tags=["Auth"])

SECRET_KEY = os.getenv("SECRET_KEY")
GOOGLE_CLIENT_ID = os.getenv("GOOGLE_CLIENT_ID")

if not SECRET_KEY:
    raise ValueError("SECRET_KEY is not set")

if not GOOGLE_CLIENT_ID:
    raise ValueError("GOOGLE_CLIENT_ID is not set")

def create_access_token(data: dict, expires_minutes: int = 60):
    to_encode = data.copy()
    expire = datetime.now(timezone.utc) + timedelta(minutes=expires_minutes)
    to_encode.update({"exp": expire, "iat": datetime.now(timezone.utc)})
    return jwt.encode(to_encode, SECRET_KEY, algorithm="HS256") # type: ignore

class TokenSchema(BaseModel):
    token: str

def get_or_create_user(db: Session, email: str, name: str, google_id: str) -> User:
    user = db.query(User).filter(User.google_email == email).first()
    
    if not user:
        user = db.query(User).filter(User.google_id == google_id).first()

    if not user:
        user = User(google_email=email, name=name, google_id=google_id, 
                    accountStatus="active", registerDate=datetime.utcnow())
        db.add(user)
        db.commit()
        db.refresh(user)
        print(f"New User Created: {email}")
    else:
        user.google_email = email # type: ignore
        user.name = name # type: ignore
        user.google_id = google_id # type: ignore
        db.commit()
        db.refresh(user)
        print(f"User Updated: {email}")
    
    return user

@router.post("/google")
def google_login(data: TokenSchema, db: Session = Depends(get_db)):
    try:
        print(f"Token Received: {data.token[:50]}...")
        
        idinfo = id_token.verify_oauth2_token(data.token, requests.Request(), GOOGLE_CLIENT_ID)
        email = idinfo.get("email")
        name = idinfo.get("name") or "Unknown"
        google_id = idinfo.get("sub")

        if not email:
            raise HTTPException(status_code=400, detail="Email not found in Google token")
        
        print(f"Google user: {email} / {name}")
        user = get_or_create_user(db, email, name, google_id) # type: ignore
        access_token = create_access_token({"sub": str(user.userID)})
        return {"access_token": access_token, "token_type": "bearer", 
                "user_id": user.userID, "email": user.google_email, "name": user.name}

    except ValueError as e:
        print(f"Verification Token Error: {e}")
        raise HTTPException(status_code=401, detail="Invalid Google token")
    except Exception as e:
        print(f"Unexpected Error: {e}")
        raise HTTPException(status_code=500, detail=str(e))