import os
import requests
import time

def test_microservice(url: str, expected_status_code: int, retries: int = 10, wait: int = 5):
    for i in range(retries):
        response = requests.get(url)
        if response.status_code == expected_status_code:
            print(f'Microservice returned {response.status_code}')
            return
        else:
            print(f'Microservice returned {response.status_code}. Retrying in {wait} seconds...')
            time.sleep(wait)
    assert response.status_code == expected_status_code, f'Microservice returned {response.status_code}'

if __name__ == '__main__':
    test_microservice("http://localhost:5000", 200)
