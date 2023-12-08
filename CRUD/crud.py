import pyodbc
server = 'MELLERNOTEBOOK\SQLMELLER'
database = 'master'
driver = '{ODBC Driver 17 for SQL Server}'


class __Database:
    def __init__(self):
        self.conn = pyodbc.connect(
            f'DRIVER={driver};SERVER={server};' f'DATABASE={database};Trusted_Connection=yes;')

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
            except Exception as e:
                cursor.rollback()
                raise Exception("Erro ao editar item") from e

    def add_menu_item(self):
        with self.conn.cursor() as cursor:
            try:
                cursor.execute(
                    "SET NOCOUNT ON; INSERT INTO menu (nome, preco, descricao) VALUES (?, ?, ?); SELECT @@IDENTITY AS codigo_menu", "Item não catalogado", 0.0, "sem descrição")
                return cursor.fetchone()[0]
            except Exception as e:
                cursor.rollback()
                raise Exception("Erro ao inserir item") from e

    def delete_menu_item(self, codigo):
        with self.conn.cursor() as cursor:
            try:
                cursor.execute(
                    "DELETE FROM menu WHERE codigo_menu = ?", codigo)
            except Exception as e:
                cursor.rollback()
                raise Exception("Erro ao editar item") from e


database = __Database()
