from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from play_and_go_app.models.household import Household
from play_and_go_app.models.users import User
from play_and_go_app.db.session import get_db
from pydantic import BaseModel

router = APIRouter(prefix="/household", tags=["Household"])

class HouseholdCode(BaseModel):
    household_code: str

class CreateHouseholdRequest(BaseModel):
    household_code: str
    user_id: int

@router.post("/check")
def check_household(data: HouseholdCode, db: Session = Depends(get_db)):
    try:
        household = db.query(Household).filter(Household.householdCode == data.household_code).first()
        return {"exists": household is not None}
    except Exception as e:
        print(f"Error in /check: {e}")
        return {"exists": False, "error": str(e)}

@router.post("/create")
def create_household(data: CreateHouseholdRequest, db: Session = Depends(get_db)):
    try:
        existing = db.query(Household).filter(Household.householdCode == data.household_code).first()
        if existing:
            return {"success": False, "error": "Household already exists"}
        
        # Create a new household
        household = Household(
            householdCode=data.household_code,
            householdName=f"Household {data.household_code}",
            userID=data.user_id
        )
        db.add(household)
        db.commit()
        db.refresh(household)
        
        # Update user
        user = db.query(User).filter(User.userID == data.user_id).first()
        if user:
            user.householdID = household.householdID
            db.commit()
        
        return {"success": True, "household_id": household.householdID}
    except Exception as e:
        db.rollback()
        print(f"Error in /create: {e}")
        return {"success": False, "error": str(e)}

@router.post("/join")
def join_household(data: CreateHouseholdRequest, db: Session = Depends(get_db)):
    try:
        household = db.query(Household).filter(Household.householdCode == data.household_code).first()
        if not household:
            return {"success": False, "error": "Household not found"}
        
        user = db.query(User).filter(User.userID == data.user_id).first()
        if user:
            user.householdID = household.householdID
            db.commit()
        
        return {"success": True, "household_id": household.householdID}
    except Exception as e:
        db.rollback()
        print(f"Error in /join: {e}")
        return {"success": False, "error": str(e)}