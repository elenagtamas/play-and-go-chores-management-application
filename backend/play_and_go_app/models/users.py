from sqlalchemy import Column, DateTime, ForeignKey, Integer, String
from play_and_go_app.db.base import Base
from datetime import datetime

class User(Base):
    __tablename__ = "User"

    userID = Column(Integer, primary_key=True, autoincrement=True)
    userName = Column(String(50), nullable=True)
    password = Column(String(100), nullable=True)
    email = Column(String(100), nullable=True)
    accountStatus = Column(String(50), nullable=False, default="active")
    registerDate = Column(DateTime, nullable=False, default=datetime.utcnow)
    
    google_email = Column(String(100), unique=True, nullable=True)
    name = Column(String(100), nullable=True)
    google_id = Column(String(255), unique=True, nullable=True)
    
    householdID = Column(Integer, ForeignKey("Household.householdID"), nullable=True)