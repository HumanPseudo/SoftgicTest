import uuid
from typing import Any, List
from pydantic import BaseModel, Field as PydanticField
from sqlmodel import SQLModel, Field
from fastapi import APIRouter, Depends, HTTPException
from sqlmodel import select, func
from app.api.deps import CurrentUser, SessionDep

# Modelos SQLAlchemy
class cotizacion(SQLModel, table=True):
    idConvenio: uuid.UUID = Field(default_factory=uuid.uuid4, primary_key=True)
    suClave: str = Field(min_length=8, max_length=40)
    suNombre: str = Field(min_length=8, max_length=40)
    distribuidorClave: int
    distribuidorEmail: str = Field(min_length=8, max_length=40)
    cotizaciones: uuid.UUID = Field(foreign_key="cotizaciones.idCotizacion", nullable=False, ondelete="CASCADE")

class cotizaciones(SQLModel, table=True):
    idCotizacion: uuid.UUID = Field(default_factory=uuid.uuid4, primary_key=True)
    planComercial: str 
    detSolicitudes: uuid.UUID = Field(foreign_key="solicitudes.idSolicitudes", nullable=False, ondelete="CASCADE")

class solicitudes(SQLModel, table=True):
    idSolicitudes: uuid.UUID = Field(default_factory=uuid.uuid4, primary_key=True)
    plan: uuid.UUID = Field(foreign_key="planes.idPlan", nullable=False, ondelete="CASCADE")
    renovacion: str = Field(min_length=8, max_length=40)
    tipo: str = Field(min_length=8, max_length=40)
    paquete: str = Field(min_length=8, max_length=40)
    fechaNacimiento: str = Field(min_length=8, max_length=40)
    iniVigReportada: str = Field(min_length=8, max_length=40)
    finVigReportada: str = Field(min_length=8, max_length=40)
    plazoReportado: int
    tipoVig: int
    sumAseg4: int
    sumAseg5: int
    sumAseg6: int
    coberturasPrimaNeta: uuid.UUID = Field(foreign_key="coberturas.idCobertura", nullable=False, ondelete="CASCADE")

class coberturas(SQLModel, table=True):
    idCobertura: uuid.UUID = Field(default_factory=uuid.uuid4, primary_key=True)
    claveCobertura: str = Field(min_length=8, max_length=40)
    prima: int

class planes(SQLModel, table=True):
    idPlan: uuid.UUID = Field(default_factory=uuid.uuid4, primary_key=True)
    valor: str = Field(min_length=8, max_length=40)

# Modelos Pydantic para validación de datos
class PlanCreate(BaseModel):
    valor: str = PydanticField(..., min_length=8, max_length=40)

class PlanRead(BaseModel):
    idPlan: uuid.UUID
    valor: str
