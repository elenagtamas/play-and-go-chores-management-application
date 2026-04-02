from fastapi import APIRouter

router = APIRouter(
    prefix="/chores",
    tags=["Chores"]
)

@router.get("/test")
def test_chore():
    return {"message": "Chore router is working properly!"}