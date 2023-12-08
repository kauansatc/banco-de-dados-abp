from flask import Flask, render_template
from crud import database

app = Flask(__name__)


@app.route("/")
def index():
    menu = database.get_menu()
    return render_template("index.html", menu=menu)


app.run(debug=True)
