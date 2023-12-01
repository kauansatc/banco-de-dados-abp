from flask import Flask, render_template
from crud import Database

app = Flask(__name__)
db = Database() # TODO passar os argumentos de conexão

@app.route("/")
def index():
    menu_items = db.get_all_items() 

    return render_template("index.html", menu_items=menu_items)

app.run(debug=True)
