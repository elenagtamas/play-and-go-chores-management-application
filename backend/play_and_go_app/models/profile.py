from pydantic import BaseModel
from sqlalchemy import Boolean, Column, Integer, String
from play_and_go_app.db.base import Base

class Profile(Base):
    __tablename__ = "Profile"

    profileID = Column(Integer, primary_key=True)
    profileName = Column(String, nullable=False)
    password = Column(String, nullable=False)
    avatar = Column(String, nullable=False)
    isChild = Column(Boolean, nullable=False)
    householdID = Column(Integer, nullable=False)

class ProfileCreate(BaseModel):
    profileName: str
    avatar: str    