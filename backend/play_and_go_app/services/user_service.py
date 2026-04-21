from google.oauth2 import id_token
from google.auth.transport import requests
from play_and_go_app.models.users import User
import os

GOOGLE_CLIENT_ID = os.getenv("GOOGLE_CLIENT_ID")

def verify_google_token(token: str):
    idinfo = id_token.verify_oauth2_token(token, requests.Request(), GOOGLE_CLIENT_ID)
    return idinfo


def get_or_create_user(db, google_data):
    user = db.query(User).filter(User.google_id == google_data["sub"]).first()

    if not user:
        user = User(
            google_id=google_data["sub"],
            email=google_data["email"],
            name=google_data["name"],
            picture=google_data["picture"],
        )
        db.add(user)
        db.commit()
        db.refresh(user)

    return user