from sqlalchemy import Boolean, Column, Integer, String, DateTime
from database import Base
from datetime import datetime

class Problem(Base):
    __tablename__ = 'problems'

    ProblemID = Column(Integer, primary_key=True, index=True)
    PatientID= Column(Integer)
    Problem=Column(String(50))
    ProblemLogListID= Column(Integer)
    ProblemLogRemarks= Column(String(200))
    IsDeleted= Column(Boolean,default=False)
    CreatedDateTime= Column(DateTime,default=datetime.now)
    UpdatedDateTime= Column(DateTime,default=datetime.now)
    
