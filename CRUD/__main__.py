from flask import Flask, render_template, request, redirect
from crud import database

app = Flask(__name__)


@app.route("/")
def index():

    menu = database.get_menu()
    return render_template("index.html", menu=menu)


@app.route("/menu/<codigo>")
def menu(codigo):
    menu_item = database.get_menu_item(codigo)
    return render_template("menu.html", item=menu_item)


@app.route("/edit")
def edit():
    args = request.args.to_dict()

    print(args)

    args["codigo"] = int(args["codigo"])
    args["preco"] = float(args["preco"])
    database.edit_menu_item(**args)

    return redirect("/")


@app.route("/add")
def add():
    codigo = database.add_menu_item()
    return redirect(f"/menu/{codigo}")


app.run(debug=True)
