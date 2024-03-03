from flask import Flask
import os
import sys
import threading
import time


app = Flask('demo')
port = 8000


@app.route('/')
def hello_world():
    return f'Hello, {port}!\n'
    

def kill_flask():
    time.sleep(2)
    os.kill(os.getpid(), 9)  # Terminate the Flask process


# Endpoint to kill the Flask app
@app.route('/kill')
def kill_flask_endpoint():
    # Start a new thread to execute the kill_flask function
    thread = threading.Thread(target=kill_flask)
    thread.start()
    return "Flask app termination request received. Terminating..."


if __name__ == '__main__':
    port = sys.argv[1]
    app.run(host='127.0.0.1', port=port)