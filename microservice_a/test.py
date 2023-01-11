import os
import requests

def test_microservice(url: str, expected_status_code: int):
    response = requests.get(url)
    assert response.status_code == expected_status_code, f'Microservice returned {response.status_code}'
    print(f'Microservice returned {response.status_code}')

if __name__ == '__main__':
    test_microservice("http://localhost:5000", 200)
