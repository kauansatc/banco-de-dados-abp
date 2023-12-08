import pyodbc
server = 'r8.database.windows.net'
database = 'dados'
username = 'r8'
password = 'satc@2023'
driver = '{ODBC Driver 17 for SQL Server}'


class __Database:
    def __init__(self):
        self.conn = pyodbc.connect('DRIVER='+driver+';SERVER=tcp:'+server +
                                   ';PORT=1433;DATABASE='+database+';UID='+username+';PWD=' + password)

        if self.conn:
            print("Conectado com sucesso!")

    def get_menu(self):
        with self.conn.cursor() as cursor:
            cursor.execute("SELECT * FROM menu")
            return cursor.fetchall()


database = __Database()
