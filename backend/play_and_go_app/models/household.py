from sqlalchemy import Column, Integer, String
from play_and_go_app.db.base import Base

class Household(Base):
    __tablename__ = "Household"

    householdID = Column(Integer, primary_key=True)
    householdName = Column(String)