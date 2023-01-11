import os
import requests
import time

def test_microservice(url: str, expected_status_code: int, port: int = 5000, retries: int = 3, wait: int = 5):
    for i in range(retries):
        response = requests.get(f'{url}:{port}')
        if response.status_code == expected_status_code:
            print(f'Microservice returned {response.status_code}')
            return
        else:
            print(f'Microservice returned {response.status_code}. Retrying in {wait} seconds...')
            time.sleep(wait)
    assert response.status_code == expected_status_code, f'Microservice returned {response.status_code}'

if __name__ == '__main__':
    test_microservice("http://localhost", 200,port= int(sys.argv[1]))
