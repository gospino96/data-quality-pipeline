import pandas as pd
import random
from sqlalchemy import create_engine
engine = create_engine("mysql+pymysql://root:12345@localhost/project_pipeline")
data=[]
for i in range(200):
    data.append({'order_id':i,
                 'customer_id':random.choice([1001,1002,1003,1004,None]),
                                             'amount':random.choice([100,250,350,500,None]),
                 'product':random.choice(['A','B','C','D'])})
df=pd.DataFrame(data)
df=pd.concat([df,df.iloc[:10]])
print(df)

df.to_sql("raw_orders", engine, if_exists="replace", index=False)
