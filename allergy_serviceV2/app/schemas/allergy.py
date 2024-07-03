from pydantic import BaseModel

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
