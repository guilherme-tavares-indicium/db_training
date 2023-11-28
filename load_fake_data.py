from faker import Faker
import psycopg2
from dotenv import dotenv_values

config = dotenv_values(".env")
fake = Faker()

conn = psycopg2.connect(
    host=config["PGHOST"],
    database=config["PGDB"],
    user=config["PGUSER"],
    password=config["PGPASSWORD"],
)

cursor = conn.cursor()


# create fake data 1

## Create the table if it doesn't exist
create_table_query = """
    DROP TABLE IF EXISTS employee;
    CREATE TABLE employee (
        id SERIAL PRIMARY KEY,
        name VARCHAR(100),
        address VARCHAR(200),
        email VARCHAR(100)
    )
"""
cursor = conn.cursor()
cursor.execute(create_table_query)
conn.commit()

for _ in range(20):  # Generate 20 fake records
    name = fake.name()
    address = fake.address()
    email = fake.email()

    insert_query = "INSERT INTO employee (name, address, email) VALUES (%s, %s, %s)"
    cursor.execute(insert_query, (name, address, email))

conn.commit()


# create fake data 2

## Create the table if it doesn't exist
create_table_query = """
    DROP TABLE IF EXISTS products;
    CREATE TABLE products (
        id SERIAL PRIMARY KEY,
        name VARCHAR(100),
        price FLOAT,
        description TEXT
    )
"""
cursor = conn.cursor()
cursor.execute(create_table_query)
conn.commit()

for _ in range(20):  # Generate 20 fake records
    name = fake.name()
    price = fake.random_number(digits=2)
    description = fake.text()

    insert_query = "INSERT INTO products (name, price, description) VALUES (%s, %s, %s)"
    cursor.execute(insert_query, (name, price, description))

conn.commit()


# create fake data 2

## Create the table if it doesn't exist
create_table_query = """
    DROP TABLE IF EXISTS events;
    CREATE TABLE events (
        id SERIAL PRIMARY KEY,
        name VARCHAR(100),
        date DATE,
        location VARCHAR(200)
    )
"""
cursor = conn.cursor()
cursor.execute(create_table_query)
conn.commit()

for _ in range(20):  # Generate 20 fake records
    name = fake.name()
    date = fake.date_this_decade()
    location = fake.address()

    insert_query = "INSERT INTO events (name, date, location) VALUES (%s, %s, %s)"
    cursor.execute(insert_query, (name, date, location))

conn.commit()


# create target table

## Create the table if it doesn't exist
create_table_query = """
    DROP TABLE IF EXISTS issues;
    CREATE TABLE issues (
    url TEXT,
    repository_url TEXT,
    labels_url TEXT,
    comments_url TEXT,
    events_url TEXT,
    html_url TEXT,
    id TEXT,
    node_id TEXT,
    number TEXT,
    title TEXT,
    state TEXT,
    locked TEXT,
    assignee TEXT,
    milestone TEXT,
    comments TEXT,
    created_at TEXT,
    updated_at TEXT,
    closed_at TEXT,
    author_association TEXT,
    active_lock_reason TEXT,
    body TEXT,
    timeline_url TEXT,
    performed_via_github_app TEXT,
    state_reason TEXT
    );
"""
cursor = conn.cursor()
cursor.execute(create_table_query)
conn.commit()