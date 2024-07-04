from fastapi import FastAPI, HTTPException, Depends, status
from pydantic import BaseModel
from typing import Annotated, Optional
import models
from database import engine, SessionLocal
from sqlalchemy.orm import Session
from datetime import datetime

app = FastAPI()
models.Base.metadata.create_all(bind=engine)

def get_db():
    db=SessionLocal()
    try:
        yield db
    finally:
        db.close()

class ProblemBase(BaseModel):
    PatientID: int 
    Problem: str
    ProblemLogRemarks: Optional[str] = ""

class ProblemUpdate(BaseModel):
    ProblemID : int
    PatientID: int 
    ProblemLogListID: int
    ProblemLogRemarks: Optional[str]
    # ProblemLogID:int 

dp_dependency = Annotated[Session, Depends(get_db)]

@app.post("/api/ProblemLog/add",status_code=status.HTTP_201_CREATED, 
          summary="Add new problem log", tags=["ProblemLog"])
async def create_activity(problem:ProblemBase, db:dp_dependency):
    db_problem=models.Problem(**problem.model_dump())
    db.add(db_problem)
    db.commit()

@app.get("/api/ProblemLog/PatientProblemLog/{patientid}", status_code=status.HTTP_200_OK, 
         summary="Get all problem log of specified patient",tags=["ProblemLog"])
async def get_problem(patientid:int,db:dp_dependency):
    problems=db.query(models.Problem).filter(models.Problem.PatientID==patientid & (not models.Problem.IsDeleted)).all()
    if len(problems)==0: 
        raise HTTPException(status_code=404,detail="Patient has no problems")
    else: 
        return problems
    
@app.get("/api/ProblemLog/{problemID}", status_code=status.HTTP_200_OK, 
         summary="Get specified problem/Get all problem logs",tags=["ProblemLog"])
async def get_problem(problemID:int,db:dp_dependency):
    if problemID==0: return db.query(models.Problem)
    problem = db.query(models.Problem).filter(models.Problem.ProblemID==problemID & (not models.Problem.IsDeleted)).first()
    if problem is None: 
        raise HTTPException(status_code=404,detail="Problem could not be found")
    else: 
        return problem

@app.put("/api/ProblemLog/update",status_code=status.HTTP_200_OK, 
         summary="Update existing problem Log", tags=["ProblemLog"])
async def update_problem(new_problem:ProblemUpdate, db:dp_dependency):
    db.query(models.Problem).filter(models.Problem.ProblemID==new_problem.ProblemID).update(new_problem.__dict__)
    db.commit()

@app.put("/api/ProblemLog/delete/{problemID}",status_code=status.HTTP_200_OK, 
         summary="Mark existing problem as deleted", tags=["ProblemLog"])
async def delete_problem(problemID:int,db:dp_dependency):
    problem=db.query(models.Problem).filter(models.Problem.ProblemID==problemID).first()
    problem.IsDeleted=True
    db.commit()
