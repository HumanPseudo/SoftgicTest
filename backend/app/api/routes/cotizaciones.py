import uuid
from typing import Any

from fastapi import APIRouter, Depends, HTTPException
from sqlmodel import select, func

from app.api.deps import CurrentUser, SessionDep
from app.models_softgic import cotizaciones, PlanCreate, PlanRead, planes

router = APIRouter()


@router.get("/", response_model=list[cotizaciones])
def read_items(
    session: SessionDep, current_user: CurrentUser, skip: int = 0, limit: int = 100
) -> Any:
    """
    Retrieve cotizaciones.
    """
    statement = select(cotizaciones).offset(skip).limit(limit)
    results = session.exec(statement).all()
    return results

@router.get("/planes", response_model=list[planes])
def read_planes(
    session: SessionDep, current_user: CurrentUser, skip: int = 0, limit: int = 100
) -> Any:
    """
    Retrieve planes.
    """
    statement = select(planes).offset(skip).limit(limit)
    results = session.exec(statement).all()
    return results

@router.post("/planes", response_model=PlanRead)
def create_plan(
    session: SessionDep,
    current_user: CurrentUser,
    plan: PlanCreate
) -> Any:
    """
    Create plan.
    """
    new_plan = planes.from_orm(plan)
    session.add(new_plan)
    session.commit()
    session.refresh(new_plan)
    return new_plan

@router.put("/planes/{plan_id}", response_model=PlanRead)
def update_plan(
    plan_id: uuid.UUID,
    session: SessionDep,
    current_user: CurrentUser,
    plan_update: PlanCreate
) -> Any:
    """
    Update a plan by ID.
    """
    plan = session.get(planes, plan_id)
    if not plan:
        raise HTTPException(status_code=404, detail="Plan not found")

    plan.valor = plan_update.valor
    session.add(plan)
    session.commit()
    session.refresh(plan)
    return plan

@router.delete("/planes/{plan_id}", response_model=PlanRead)
def delete_plan(
    plan_id: uuid.UUID,
    session: SessionDep,
    current_user: CurrentUser
) -> Any:
    """
    Delete a plan by ID.
    """
    plan = session.get(planes, plan_id)
    if not plan:
        raise HTTPException(status_code=404, detail="Plan not found")

    session.delete(plan)
    session.commit()
    return plan