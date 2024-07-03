import os

class Settings:
    DATABASE_URL: str = os.getenv("DATABASE_URL")
    ALLOW_ORIGINS: str = os.getenv("ALLOW_ORIGINS", "http://localhost:3000")

settings = Settings()
