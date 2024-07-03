from fastapi import FastAPI, Depends, HTTPException
from sqlalchemy import create_engine, Column, String, Integer
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker, Session
from typing import List
from pydantic import BaseModel
from fastapi.middleware.cors import CORSMiddleware

DATABASE_URL = "postgresql://user:password@db/db"

app = FastAPI()
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:3000"],  # Add your Next.js app's URL
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)
# SQLAlchemy setup
engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
Base = declarative_base()

class AllergyBase(BaseModel):
    allergic_to: str
    reaction: str
    notes: str

class AllergyCreate(AllergyBase):
    pass

class AllergyResponse(AllergyBase):
    id: int

    class Config:
        orm_mode = True

class Allergy(Base):
    __tablename__ = "allergies"
    id = Column(Integer, primary_key=True, index=True)
    allergic_to = Column(String, index=True)
    reaction = Column(String)
    notes = Column(String)

Base.metadata.create_all(bind=engine)

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@app.get("/allergies/", response_model=List[AllergyResponse])
def read_allergies(db: Session = Depends(get_db)):
    allergies = db.query(Allergy).all()
    return allergies