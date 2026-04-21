from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from play_and_go_app.db.session import get_db
from play_and_go_app.models.profile import Profile
from play_and_go_app.schemas.profile import ProfileCreate, ProfileOut
from play_and_go_app.models.users import User
from fastapi.security import OAuth2PasswordBearer
from jose import jwt
import os

router = APIRouter(prefix="/profiles", tags=["Profiles"])
SECRET_KEY = os.getenv("SECRET_KEY")
oauth2_scheme = OAuth2PasswordBearer(tokenUrl="auth/google")

def get_current_user(token: str = Depends(oauth2_scheme), db: Session = Depends(get_db)) -> User:
    try:
        payload = jwt.decode(token, "SECRET_KEY", algorithms=["HS256"])
        sub = payload.get("sub")
        if sub is None:
            raise HTTPException(status_code=401, detail="Token missing 'sub'")
        
        user_id = int(sub)
        user = db.query(User).filter(User.id == user_id).first()
        if not user:
            raise HTTPException(status_code=401, detail="User not found")
        return user
    except Exception:
        raise HTTPException(status_code=401, detail="Invalid token")

@router.get("/", response_model=list[ProfileOut])
def list_profiles(current_user: User = Depends(get_current_user)):
    return current_user.profiles

@router.post("/", response_model=ProfileOut)
def create_profile(data: ProfileCreate, db: Session = Depends(get_db), user_id: int = Depends(get_current_user)):
    return create_profile