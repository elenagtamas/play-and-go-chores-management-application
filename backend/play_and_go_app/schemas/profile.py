from pydantic import BaseModel
from typing import Optional

class ProfileCreate(BaseModel):
    profileID: int
    profileName: str
    avatar: str

class ProfileOut(BaseModel):
    profileID: int
    profileName: str
    avatar: str

    class Config:
        from_attributes = True
