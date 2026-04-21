from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session

from play_and_go_app.db.session import get_db
from play_and_go_app.schemas.profile import ProfileCreate
from play_and_go_app.models.profile import Profile

router = APIRouter(prefix="/profiles", tags=["Profiles"])


@router.post("/")
def create_profile(data: ProfileCreate, db: Session = Depends(get_db)):

    profile = Profile(
        profileName=data.profileName,
        avatar=data.avatar,
        password="1234",
        isChild=False,
        householdID=1)

    db.add(profile)
    db.commit()
    db.refresh(profile)

    return profile

def get_profiles(db: Session):
    return db.query(Profile).all()