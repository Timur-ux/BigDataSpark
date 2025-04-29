import pyspark
from pyspark.sql import SparkSession
import os
import pandas as pd

spark:SparkSession = SparkSession.builder \
    .appName("Spark SQL with PostgreSQL and ClickHouse") \
    .config("spark.jars", "postgresql-42.6.0.jar,,clickhouse-jdbc-0.4.6.jar")\
    .getOrCreate()

pg_jdbc_url = "jdbc:postgresql://postgres:5432/spark_db"
properties = {
    "user": "spark_user",
    "password": "spark_password",
    "driver": "org.postgresql.Driver"
}

products = spark.read.jdbc(url=pg_jdbc_url, table="products", properties=properties)
sales = spark.read.jdbc(url=pg_jdbc_url, table="sales", properties=properties)

sales.createOrReplaceTempView("sales")

most_salling_products = spark.sql("select product_id, count(product_id) as sales from sales group by product_id order by sales desc limit 10")

# 6. Останавливаем SparkSession
spark.stop()
