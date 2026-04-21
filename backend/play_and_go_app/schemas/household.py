from pydantic import BaseModel

class HouseholdCreate(BaseModel):
    householdID: int
    householdName: str
    userID: int
    householdCode: str


class HouseholdResponse(BaseModel):
    householdID: int
    householdName: str
    userID: int
    householdCode: str

    class Config:
        from_attributes = True