from fastapi import FastAPI, Depends, HTTPException
from sqlalchemy import create_engine, Column, String, Integer, Float, Boolean
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

class VitalSignBase(BaseModel):
    date: str
    time: str
    temperature: float
    weight: float
    height: float
    systolic_bp: int
    diastolic_bp: int
    heart_rate: int
    spo2: int
    blood_sugar_level: float
    after_meal: bool
    remark: str

class VitalSignCreate(VitalSignBase):
    pass

class VitalSignResponse(VitalSignBase):
    id: int

    class Config:
        orm_mode = True

class VitalSign(Base):
    __tablename__ = "vital_signs"
    id = Column(Integer, primary_key=True, index=True)
    date = Column(String)
    time = Column(String)
    temperature = Column(Float)
    weight = Column(Float)
    height = Column(Float)
    systolic_bp = Column(Integer)
    diastolic_bp = Column(Integer)
    heart_rate = Column(Integer)
    spo2 = Column(Integer)
    blood_sugar_level = Column(Float)
    after_meal = Column(Boolean)
    remark = Column(String)

Base.metadata.create_all(bind=engine)

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@app.get("/vital-signs/", response_model=List[VitalSignResponse])
def read_vital_signs(db: Session = Depends(get_db)):
    vital_signs = db.query(VitalSign).all()
    return vital_signs