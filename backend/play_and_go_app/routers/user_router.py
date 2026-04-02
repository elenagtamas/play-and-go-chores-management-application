from fastapi import APIRouter

router = APIRouter(
    prefix="/users",
    tags=["Users"]
)

@router.get("/test")
def test_user():
    return {"message": "User router is working properly!"}