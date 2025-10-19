---
id: prm.db-implement-crud-sql
type: prompt
title: Implement CRUD Endpoint with Raw SQL
tags: [api, crud, sql, fastapi, rapid-development]
role: user
summary: Complete prompt template for generating FastAPI CRUD endpoints using raw SQL queries - enables rapid API development without waiting for ORM models.
vars:
  - { name: entity_name, required: true, description: "Singular entity name (e.g., 'company', 'customer')" }
  - { name: table_name, required: true, description: "Database table name (e.g., 'companies', 'customers')" }
  - { name: fields, required: true, description: "Comma-separated column list (e.g., 'id, name, industry, created_at')" }
  - { name: entity_plural, required: false, description: "Plural form (defaults to entity_name + 's')" }
merge:
  - rule.api-raw-sql-fallback
version: 1
---

# Implement CRUD Endpoint with Raw SQL

Create a complete FastAPI CRUD API endpoint for **{{entity_name}}** using raw SQL queries. This allows rapid API development without waiting for ORM model generation.

---

## Requirements

**Entity:** {{entity_name}}  
**Table:** {{table_name}}  
**Fields:** {{fields}}  
**Plural:** {{entity_plural|default(entity_name + 's')}}

---

## Implementation Steps

### 1. Create Router File

**File:** `app/api/routes/{{entity_plural}}.py`

```python
"""
{{entity_name|title}} API endpoints.

Using raw SQL queries until ORM models are generated.
TODO: Migrate to ORM models for better type safety and relationships.
"""
from fastapi import APIRouter, Depends, HTTPException, status, Query
from sqlalchemy import text
from sqlalchemy.ext.asyncio import AsyncSession
from typing import List, Dict, Any, Optional
from pydantic import BaseModel, Field

from app.api.deps import get_db

router = APIRouter(
    prefix="/{{entity_plural}}",
    tags=["{{entity_plural}}"]
)
```

### 2. Define Pydantic Schemas

```python
# Request/Response models

class {{entity_name|title}}Base(BaseModel):
    """Base {{entity_name}} schema."""
    # Add your fields here based on {{fields}}
    # Example:
    # name: str = Field(..., min_length=1, max_length=100)
    # industry: str
    pass

class {{entity_name|title}}Create({{entity_name|title}}Base):
    """Schema for creating {{entity_name}}."""
    pass

class {{entity_name|title}}Update(BaseModel):
    """Schema for updating {{entity_name}} (all fields optional)."""
    # Make all fields optional for PATCH-style updates
    # Example:
    # name: Optional[str] = Field(None, min_length=1, max_length=100)
    # industry: Optional[str] = None
    pass

class {{entity_name|title}}Response({{entity_name|title}}Base):
    """Schema for {{entity_name}} response."""
    id: int
    created_at: str
    updated_at: Optional[str] = None
```

### 3. Implement GET List Endpoint

```python
@router.get("", response_model=List[Dict[str, Any]])
async def list_{{entity_plural}}(
    skip: int = Query(0, ge=0, description="Number of records to skip"),
    limit: int = Query(100, ge=1, le=1000, description="Max records to return"),
    # Add filter parameters as needed
    # industry: Optional[str] = Query(None, description="Filter by industry"),
    db: AsyncSession = Depends(get_db)
):
    """
    Get all {{entity_plural}} with pagination.
    
    - **skip**: Number of records to skip (for pagination)
    - **limit**: Maximum number of records to return
    """
    query = text("""
        SELECT {{fields}}
        FROM {{table_name}}
        ORDER BY created_at DESC
        LIMIT :limit OFFSET :skip
    """)
    
    result = await db.execute(query, {"limit": limit, "skip": skip})
    
    return [dict(row._mapping) for row in result]
```

### 4. Implement GET by ID Endpoint

```python
@router.get("/{{{entity_name}}_id}", response_model=Dict[str, Any])
async def get_{{entity_name}}(
    {{entity_name}}_id: int,
    db: AsyncSession = Depends(get_db)
):
    """
    Get {{entity_name}} by ID.
    
    - **{{entity_name}}_id**: Unique identifier
    """
    query = text("""
        SELECT {{fields}}
        FROM {{table_name}}
        WHERE id = :id
    """)
    
    result = await db.execute(query, {"id": {{entity_name}}_id})
    row = result.first()
    
    if not row:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=f"{{entity_name|title}} {{{entity_name}}_id} not found"
        )
    
    return dict(row._mapping)
```

### 5. Implement POST (Create) Endpoint

```python
@router.post("", response_model=Dict[str, Any], status_code=status.HTTP_201_CREATED)
async def create_{{entity_name}}(
    {{entity_name}}: {{entity_name|title}}Create,
    db: AsyncSession = Depends(get_db)
):
    """
    Create new {{entity_name}}.
    
    Provide all required fields in request body.
    """
    query = text("""
        INSERT INTO {{table_name}} (
            -- List your columns here (excluding id, created_at, updated_at)
            -- Example: name, industry, employee_count
        )
        VALUES (
            -- List your parameters here
            -- Example: :name, :industry, :employee_count
        )
        RETURNING {{fields}}
    """)
    
    try:
        result = await db.execute(query, {{entity_name}}.dict())
        await db.commit()
        
        row = result.first()
        return dict(row._mapping)
    
    except IntegrityError as e:
        await db.rollback()
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail=f"{{entity_name|title}} with this data already exists: {str(e)}"
        )
```

### 6. Implement PUT (Update) Endpoint

```python
@router.put("/{{{entity_name}}_id}", response_model=Dict[str, Any])
async def update_{{entity_name}}(
    {{entity_name}}_id: int,
    {{entity_name}}: {{entity_name|title}}Update,
    db: AsyncSession = Depends(get_db)
):
    """
    Update {{entity_name}} by ID.
    
    Only provided fields will be updated (PATCH-style).
    """
    # Build dynamic UPDATE query based on provided fields
    updates = []
    params = {"id": {{entity_name}}_id}
    
    for field, value in {{entity_name}}.dict(exclude_unset=True).items():
        updates.append(f"{field} = :{field}")
        params[field] = value
    
    if not updates:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="No fields provided for update"
        )
    
    # Add updated_at timestamp
    updates.append("updated_at = NOW()")
    
    query = text(f"""
        UPDATE {{table_name}}
        SET {", ".join(updates)}
        WHERE id = :id
        RETURNING {{fields}}
    """)
    
    try:
        result = await db.execute(query, params)
        await db.commit()
        
        row = result.first()
        if not row:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail=f"{{entity_name|title}} {{{entity_name}}_id} not found"
            )
        
        return dict(row._mapping)
    
    except IntegrityError as e:
        await db.rollback()
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail=f"Update failed: {str(e)}"
        )
```

### 7. Implement DELETE Endpoint

```python
@router.delete("/{{{entity_name}}_id}", status_code=status.HTTP_204_NO_CONTENT)
async def delete_{{entity_name}}(
    {{entity_name}}_id: int,
    db: AsyncSession = Depends(get_db)
):
    """
    Delete {{entity_name}} by ID.
    
    This operation cannot be undone.
    """
    query = text("""
        DELETE FROM {{table_name}}
        WHERE id = :id
        RETURNING id
    """)
    
    result = await db.execute(query, {"id": {{entity_name}}_id})
    await db.commit()
    
    row = result.first()
    if not row:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=f"{{entity_name|title}} {{{entity_name}}_id} not found"
        )
    
    return None
```

### 8. Register Router in Main App

**File:** `app/main.py`

```python
from app.api.routes import {{entity_plural}}

app.include_router(
    {{entity_plural}}.router,
    prefix="/api/v1",
    tags=["{{entity_plural}}"]
)
```

---

## Testing

### 1. Manual Testing with curl

```bash
# Test GET list
curl http://localhost:8000/api/v1/{{entity_plural}} | jq

# Test GET by ID
curl http://localhost:8000/api/v1/{{entity_plural}}/1 | jq

# Test POST (create)
curl -X POST http://localhost:8000/api/v1/{{entity_plural}} \
  -H "Content-Type: application/json" \
  -d '{
    # Add your field data here
  }' | jq

# Test PUT (update)
curl -X PUT http://localhost:8000/api/v1/{{entity_plural}}/1 \
  -H "Content-Type: application/json" \
  -d '{
    # Add fields to update
  }' | jq

# Test DELETE
curl -X DELETE http://localhost:8000/api/v1/{{entity_plural}}/1 -v

# Test 404
curl http://localhost:8000/api/v1/{{entity_plural}}/99999 | jq
```

### 2. Unit Tests

**File:** `tests/test_{{entity_plural}}.py`

```python
import pytest
from httpx import AsyncClient
from app.main import app

@pytest.mark.asyncio
async def test_list_{{entity_plural}}():
    """Test listing {{entity_plural}}."""
    async with AsyncClient(app=app, base_url="http://test") as client:
        response = await client.get("/api/v1/{{entity_plural}}")
        assert response.status_code == 200
        data = response.json()
        assert isinstance(data, list)

@pytest.mark.asyncio
async def test_create_{{entity_name}}():
    """Test creating {{entity_name}}."""
    async with AsyncClient(app=app, base_url="http://test") as client:
        response = await client.post(
            "/api/v1/{{entity_plural}}",
            json={
                # Add your test data here
            }
        )
        assert response.status_code == 201
        data = response.json()
        assert "id" in data

@pytest.mark.asyncio
async def test_get_{{entity_name}}():
    """Test getting {{entity_name}} by ID."""
    async with AsyncClient(app=app, base_url="http://test") as client:
        # First create one
        create_response = await client.post(
            "/api/v1/{{entity_plural}}",
            json={/* test data */}
        )
        {{entity_name}}_id = create_response.json()["id"]
        
        # Then get it
        response = await client.get(f"/api/v1/{{entity_plural}}/{{{entity_name}}_id}")
        assert response.status_code == 200

@pytest.mark.asyncio
async def test_get_{{entity_name}}_not_found():
    """Test 404 handling."""
    async with AsyncClient(app=app, base_url="http://test") as client:
        response = await client.get("/api/v1/{{entity_plural}}/99999")
        assert response.status_code == 404

@pytest.mark.asyncio
async def test_update_{{entity_name}}():
    """Test updating {{entity_name}}."""
    async with AsyncClient(app=app, base_url="http://test") as client:
        # Create first
        create_response = await client.post(
            "/api/v1/{{entity_plural}}",
            json={/* test data */}
        )
        {{entity_name}}_id = create_response.json()["id"]
        
        # Update
        response = await client.put(
            f"/api/v1/{{entity_plural}}/{{{entity_name}}_id}",
            json={/* update data */}
        )
        assert response.status_code == 200

@pytest.mark.asyncio
async def test_delete_{{entity_name}}():
    """Test deleting {{entity_name}}."""
    async with AsyncClient(app=app, base_url="http://test") as client:
        # Create first
        create_response = await client.post(
            "/api/v1/{{entity_plural}}",
            json={/* test data */}
        )
        {{entity_name}}_id = create_response.json()["id"]
        
        # Delete
        response = await client.delete(f"/api/v1/{{entity_plural}}/{{{entity_name}}_id}")
        assert response.status_code == 204
        
        # Verify deleted
        get_response = await client.get(f"/api/v1/{{entity_plural}}/{{{entity_name}}_id}")
        assert get_response.status_code == 404
```

---

## Additional Features (Optional)

### Add Pagination Metadata

```python
from math import ceil

@router.get("", response_model=Dict[str, Any])
async def list_{{entity_plural}}(
    skip: int = 0,
    limit: int = 100,
    db: AsyncSession = Depends(get_db)
):
    """Get {{entity_plural}} with pagination metadata."""
    
    # Get total count
    count_query = text("SELECT COUNT(*) FROM {{table_name}}")
    count_result = await db.execute(count_query)
    total = count_result.scalar()
    
    # Get data
    query = text("""
        SELECT {{fields}}
        FROM {{table_name}}
        ORDER BY created_at DESC
        LIMIT :limit OFFSET :skip
    """)
    result = await db.execute(query, {"limit": limit, "skip": skip})
    data = [dict(row._mapping) for row in result]
    
    return {
        "data": data,
        "pagination": {
            "total": total,
            "skip": skip,
            "limit": limit,
            "pages": ceil(total / limit) if limit > 0 else 0
        }
    }
```

### Add Filtering

```python
@router.get("", response_model=List[Dict[str, Any]])
async def list_{{entity_plural}}(
    skip: int = 0,
    limit: int = 100,
    search: Optional[str] = Query(None, description="Search in name"),
    # Add field-specific filters
    # industry: Optional[str] = Query(None, description="Filter by industry"),
    db: AsyncSession = Depends(get_db)
):
    """Get {{entity_plural}} with optional filters."""
    
    # Build dynamic WHERE clause
    where_clauses = []
    params = {"limit": limit, "skip": skip}
    
    if search:
        where_clauses.append("name ILIKE :search")
        params["search"] = f"%{search}%"
    
    # Add more filters as needed
    
    where_sql = f"WHERE {' AND '.join(where_clauses)}" if where_clauses else ""
    
    query = text(f"""
        SELECT {{fields}}
        FROM {{table_name}}
        {where_sql}
        ORDER BY created_at DESC
        LIMIT :limit OFFSET :skip
    """)
    
    result = await db.execute(query, params)
    return [dict(row._mapping) for row in result]
```

### Add Sorting

```python
from enum import Enum

class {{entity_name|title}}SortField(str, Enum):
    """Allowed sort fields for {{entity_plural}}."""
    name = "name"
    created_at = "created_at"
    updated_at = "updated_at"

@router.get("", response_model=List[Dict[str, Any]])
async def list_{{entity_plural}}(
    skip: int = 0,
    limit: int = 100,
    sort_by: {{entity_name|title}}SortField = {{entity_name|title}}SortField.created_at,
    sort_desc: bool = True,
    db: AsyncSession = Depends(get_db)
):
    """Get {{entity_plural}} with sorting."""
    
    sort_direction = "DESC" if sort_desc else "ASC"
    
    query = text(f"""
        SELECT {{fields}}
        FROM {{table_name}}
        ORDER BY {sort_by.value} {sort_direction}
        LIMIT :limit OFFSET :skip
    """)
    
    result = await db.execute(query, {"limit": limit, "skip": skip})
    return [dict(row._mapping) for row in result]
```

---

## Best Practices Checklist

- [ ] All SQL queries use parameterized queries (`:param` syntax)
- [ ] Input validation with Pydantic models
- [ ] Proper HTTP status codes (200, 201, 204, 400, 404)
- [ ] Error handling for database errors
- [ ] 404 responses for missing resources
- [ ] Transaction management (commit/rollback)
- [ ] TODO comment about migrating to ORM
- [ ] Docstrings on all endpoints
- [ ] Manual testing with curl completed
- [ ] Unit tests written and passing
- [ ] Router registered in main app
- [ ] Tested locally against staging database

---

## Follow rule.api-raw-sql-fallback for:
- SQL injection prevention patterns
- Dict mapping from rows
- Type hints and return types
- Error handling best practices
- Migration path to ORM models

**Result: Functional CRUD API in 20 minutes!** ⚡
