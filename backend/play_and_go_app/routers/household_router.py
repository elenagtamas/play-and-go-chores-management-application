from fastapi import APIRouter

router = APIRouter(
    prefix="/household",
    tags=["Household"]
)

@router.get("/test")
def test_household():
    return {"message": "Household router is working properly!"}