from sql import DatabasePostgres
from utils import Utils
from tqdm import tqdm
import pandas as pd


if __name__ == "__main__":
    print('ETL process started')
    sql = DatabasePostgres()

    # read order 
    file_config= Utils.read_yaml(file_path='db/ddl/ddl.yaml')

    # create tables
    print('ETL: Creating tables')
    for file in tqdm(file_config['ddl']):
        file  = f"db/ddl/{file}"
        query = Utils.read_file(file)
        sql.execute(query = query)  
    
    # insert data
    print('ETL: Inserting data')
    for file in tqdm(file_config['insert']):
        sql.copy_from_file(file_path=f"data/{file}", table_name=file.replace('.csv', ''))
        