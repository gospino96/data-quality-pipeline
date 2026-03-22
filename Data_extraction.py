import pandas as pd
from sqlalchemy import create_engine

engine=create_engine("mysql+pymysql://root:12345@localhost/project_pipeline")

df=pd.read_sql("select*from clean_orders",engine)

print(df)
