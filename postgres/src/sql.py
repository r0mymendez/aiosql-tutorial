import psycopg2
from psycopg2.extras import execute_batch
from utils import Utils

class DatabasePostgres:
    
    @staticmethod
    def connection():
        conn = Utils.read_yaml('secret/secret.yaml')['postgres']
        return psycopg2.connect(host=conn['host'],
                                user=conn['username'],
                                password=conn['password'],
                                dbname=conn['database'],
                                port=conn['port'])

    @staticmethod
    def insert(query: str, data: list) -> int:
        conn = DatabasePostgres.connection()
        with conn.cursor() as cursor:
            execute_batch(cursor, query, data)
            conn.commit()
            return cursor.rowcount

    @staticmethod
    def execute(query: str) -> int:
        conn = DatabasePostgres.connection()
        with conn.cursor() as cursor:
            cursor.execute(query)
            conn.commit()
            return cursor.rowcount
        
    @staticmethod
    def copy_from_file(file_path: str, table_name: str) -> None:
        conn = DatabasePostgres.connection()
        with conn.cursor() as cursor:
          with open(file_path, 'r') as f:
            query = f"COPY hospital.{table_name} FROM STDIN WITH DELIMITER ',' CSV HEADER"
            cursor.copy_expert(query, f)
        conn.commit()

