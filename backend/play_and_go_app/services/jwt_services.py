from jose import jwt
from datetime import datetime, timedelta, timezone
from typing import Any, Dict
import os
from dotenv import load_dotenv

load_dotenv()

SECRET_KEY: str | None = os.getenv("SECRET_KEY")

if SECRET_KEY is None:
    raise RuntimeError("SECRET_KEY is not set in environment variables")

ALGORITHM = "HS256"


def create_access_token(data: Dict[str, Any], expires_minutes: int = 60) -> str:
    to_encode = data.copy()

    now = datetime.now(timezone.utc)
    expire = now + timedelta(minutes=expires_minutes)

    to_encode.update({
        "exp": expire,
        "iat": now
    })

    return jwt.encode(to_encode, SECRET_KEY, algorithm=ALGORITHM) # type: ignore