from play_and_go_app.db.session import engine
from play_and_go_app.db.base import Base

def init_db():
    Base.metadata.create_all(bind=engine)