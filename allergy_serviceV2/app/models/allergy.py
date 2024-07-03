from sqlalchemy import Column, String, Integer
from app.core.db import Base

class Allergy(Base):
    __tablename__ = "allergies"
    id = Column(Integer, primary_key=True, index=True)
    allergic_to = Column(String, index=True)
    reaction = Column(String)
    notes = Column(String)
