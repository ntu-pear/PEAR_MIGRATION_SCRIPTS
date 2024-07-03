from fastapi import APIRouter
from app.api.v1.endpoints import allergies

api_router = APIRouter()
api_router.include_router(allergies.router, prefix="/allergies", tags=["allergies"])
