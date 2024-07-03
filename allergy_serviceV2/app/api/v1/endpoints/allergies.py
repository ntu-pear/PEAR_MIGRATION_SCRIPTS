from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from typing import List
from app.models.allergy import Allergy
from app.schemas.allergy import AllergyResponse
from app.core.db import get_db

router = APIRouter()

@router.get("/", response_model=List[AllergyResponse])
def read_allergies(db: Session = Depends(get_db)):
    allergies = db.query(Allergy).all()
    return allergies
