import mysql.connector
from mysql.connector import Error

class Database:
    connection: mysql.MySQLConnection

    def __init__(self, **connection_args):
        try:
            self.connection = mysql.connector.connect(**connection_args)
            print("Connected to MySQL Server version ", self.connection.get_server_info())
        except Error as err:
            print("Error while connecting to MySQL", err)
            # REVIEW raise err
            
    def __read(self, query):
        cursor = self.connection.cursor()
        res = None
        try:
            cursor.execute(query)
            res = cursor.fetchall()
            return res
        except:
            raise # TODO feedback do erro
    
    def get_all_items(self):
        return self.__read("SELECT * FROM item")
