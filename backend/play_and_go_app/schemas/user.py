from pydantic import BaseModel

class GoogleAuth(BaseModel):
    id_token: str

class UserOut(BaseModel):
    id: int
    email: str
    name: str
    picture: str
    
    class Config:
        orm_mode = True