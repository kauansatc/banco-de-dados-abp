import pyodbc
server = ''
database = ''
username = ''
password = ''
driver = '{ODBC Driver 17 for SQL Server}'


class __Database:
    def __init__(self):
        self.conn = pyodbc.connect('DRIVER='+driver+';SERVER=tcp:'+server +
                                   ';PORT=1433;DATABASE='+database+';UID='+username+';PWD=' + password)

        if self.conn:
            print("Conectado com sucesso!")

    def get_menu(self):
        with self.conn.cursor() as cursor:
            cursor.execute(
                "SELECT codigo_menu, nome, preco, descricao FROM menu")
            return cursor.fetchall()

    def get_menu_item(self, codigo):
        with self.conn.cursor() as cursor:
            cursor.execute(
                "SELECT codigo_menu, nome, preco, descricao FROM menu WHERE codigo_menu = ?", codigo)
            return cursor.fetchone()

    def edit_menu_item(self, codigo, nome, preco, descricao):
        with self.conn.cursor() as cursor:
            try:
                cursor.execute(
                    "UPDATE menu SET nome = ?, preco = ?, descricao = ? WHERE codigo_menu = ?", nome, preco, descricao, codigo)
            except:
                cursor.rollback()


database = __Database()
