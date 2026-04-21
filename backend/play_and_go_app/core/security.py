import os
from datetime import datetime, timedelta

from fastapi import Depends, HTTPException
from fastapi.security import OAuth2PasswordBearer
from jose import jwt, JWTError

SECRET_KEY = os.getenv("SECRET_KEY")

if not SECRET_KEY:
    raise RuntimeError("SECRET_KEY is not set in environment variables")

ALGORITHM = "HS256"

oauth2_scheme = OAuth2PasswordBearer(tokenUrl="auth/google")

def create_access_token(user_id: int):
    expire = datetime.utcnow() + timedelta(days=7)

    payload = {"user_id": user_id, "exp": expire}

    return jwt.encode(payload, SECRET_KEY, algorithm=ALGORITHM) # type: ignore

def get_current_user(token: str = Depends(oauth2_scheme)) -> int:
    try:
        payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM]) # type: ignore
        user_id = payload.get("user_id")

        if user_id is None:
            raise HTTPException(status_code=401, detail="Invalid token: missing user_id")
        return int(user_id)

    except JWTError:
        raise HTTPException(status_code=401, detail="Could not validate token")