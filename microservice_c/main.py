import os
from flask import Flask, jsonify
app = Flask(__name__)

port = int(os.getenv('LISTEN_PORT', '5000'))
exit_code = int(os.getenv('EXIT_CODE', '500'))

@app.route('/')
def hello_world():
    return jsonify(message="cause i am bad guy"), exit_code

if __name__ == '__main__':
    app.run(port=port, host='0.0.0.0')
