from flask import Flask
from flask import jsonify
from flask import request
import os

app = Flask(__name__)

@app.route('/convertirTemperatura', methods=['POST'])
def convertirTemperatura():
    centigrados = request.json["centigrados"]
    fahrenheit = 1.8 * centigrados + 32
    return jsonify({ "fahrenheit": fahrenheit })

if __name__ == "__main__":
    puerto = int(os.environ.get('PORT', 80))
    app.run(debug=True, host='0.0.0.0', port = puerto)
