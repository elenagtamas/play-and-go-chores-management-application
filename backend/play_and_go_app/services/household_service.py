from sqlalchemy.orm import Session
from play_and_go_app.models.household import Household
from play_and_go_app.models.users import User


def join_or_create_household(db: Session, householdID: int, householdName: str, householdCode: str, userID: int):

    household = db.query(Household).filter(
        Household.householdName == householdName
    ).first()

    if not household:
        household = Household(householdName=householdName)
        db.add(household)
        db.commit()
        db.refresh(household)

    user = db.query(User).filter(User.userID == userID).first()

    if user:
        user.householdID = household.householdID
        db.commit()

    return household