from play_and_go_app.db.session import engine
from play_and_go_app.db.base import Base

from play_and_go_app.models import users, household, profile, rooms, chores, reward, feedback, notification

def init_db():
    Base.metadata.create_all(bind=engine)