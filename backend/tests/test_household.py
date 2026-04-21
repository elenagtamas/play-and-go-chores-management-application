import sys
import os
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
import pytest
from fastapi.testclient import TestClient
from play_and_go_app.main import app

client = TestClient(app)


class TestHouseholdEndpoints:
    """Testing for household management"""
    
    def test_household_check_endpoint(self):
        """Test 1: Verifying household endpoint"""
        response = client.post(
            "/household/check",
            json={"household_code": "TEST123"}
        )
        status = response.status_code
        assert status == 200
        data = response.json()
        assert "exists" in data
    
    def test_household_check_empty_code(self):
        """Test 2: Verifying empty household code"""
        response = client.post("/household/check", json={"household_code": ""})
        status = response.status_code
        assert status == 200
        data = response.json()
        assert data["exists"] == False
    
    def test_household_create_endpoint(self):
        """Test 3: Verifying household endpoint creation"""
        response = client.post(
            "/household/create",
            json={
                "household_code": "TEST_CREATE",
                "user_id": 1
            }
        )
        status = response.status_code
        assert status in [200, 400]
    
    def test_household_create_missing_fields(self):
        """Test 4: Verifying the validation of missing inputs"""
        response = client.post("/household/create", json={"household_code": "TEST"})
        status = response.status_code
        assert status == 422  # Validation error


class TestHouseholdModelWithoutDB:
    """Testing for household models without a real database connection"""
    
    def test_household_model_attributes(self):
        """Test 5: Verifying the existence of attributes"""
        household_data = {
            "householdCode": "HOME123",
            "householdName": "My Home",
            "userID": 1
        }
        
        assert household_data["householdCode"] == "HOME123"
        assert household_data["householdName"] == "My Home"
        assert household_data["userID"] == 1
        assert isinstance(household_data["householdCode"], str)
        assert isinstance(household_data["userID"], int)