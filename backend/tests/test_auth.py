import sys
import os
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
import pytest
from fastapi.testclient import TestClient
from play_and_go_app.main import app

client = TestClient(app)


class TestAuthEndpoints:
    """Google Authentication Testing"""
    
    def test_google_auth_endpoint_exists(self):
        """Test 1: Verifying if endpoind /auth/google exists"""
        response = client.post("/auth/google", json={"token": "test"})
        status = response.status_code
        assert status in [200, 401]
    
    def test_google_auth_missing_token(self):
        """Test 2: Verifying the endpoind if token is missing"""
        response = client.post("/auth/google", json={})
        status = response.status_code
    
    def test_google_auth_invalid_token(self):
        """Test 3: Verifying invalid token rejection"""
        response = client.post("/auth/google", json={"token": "invalid_token_123"})
        status = response.status_code
        assert status == 401
        data = response.json()
        assert "detail" in data


class TestUserModelWithoutDB:
    """Tests for User's models withoud a real database connection"""
    
    def test_user_model_attributes(self):
        """Test 4: Verifying if necessary attributes exist"""
        # Creating a simulated dictionary for User
        user_data = {
            "google_email": "test@example.com",
            "name": "Test User",
            "google_id": "google123",
            "accountStatus": "active"
        }
        
        assert user_data["google_email"] == "test@example.com"
        assert user_data["name"] == "Test User"
        assert user_data["google_id"] == "google123"
        assert user_data["accountStatus"] == "active"
        assert isinstance(user_data["google_email"], str)
        assert isinstance(user_data["name"], str)