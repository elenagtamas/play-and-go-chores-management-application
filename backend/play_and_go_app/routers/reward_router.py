from fastapi import APIRouter

router = APIRouter(
    prefix="/reward",
    tags=["Reward"]
)

@router.get("/test")
def test_reward():
    return {"message": "Reward router is working properly!"}