import psycopg2

def delete_db(conn):
    with conn.cursor() as cur:
        cur.execute("""
            DROP TABLE phones;
            DROP TABLE client
            """)
    
def create_db(conn):
    with conn.cursor() as cur:
        cur.execute("""
        CREATE TABLE IF NOT EXISTS client(
        client_id SERIAL PRIMARY KEY,
        first_name VARCHAR(40) NOT NULL,
        last_name VARCHAR(40) NOT NULL,
        email VARCHAR(80) UNIQUE NOT NULL);
        """)
        
        cur.execute("""
        CREATE TABLE IF NOT EXISTS phones(
        phone_id SERIAL PRIMARY KEY,
        link_client INTEGER NOT NULL REFERENCES client(client_id),
        phone TEXT UNIQUE);
        """)
        
def add_client(conn, first_name, last_name, email, phone=None):
    with conn.cursor() as cur:
        cur.execute("""
        INSERT INTO client(first_name, last_name, email)
        VALUES(%s, %s, %s)
        RETURNING client_id;
        """, (first_name, last_name, email,))
        link_client = cur.fetchone()
        if phone is not None:
            cur.execute("""
            INSERT INTO phones(link_client, phone)
            VALUES(%s, %s);
             """, (link_client, phone,))
                  
def add_phone(conn, client_id, phone):
    with conn.cursor() as cur:
        cur.execute("""
        SELECT client_id FROM client
        WHERE client_id = %s;
        """, (client_id,))
        print('fetchone', cur.fetchone())
        cur.execute("""
        INSERT INTO phones(link_client, phone)
        VALUES(%s, %s);
         """, (client_id, phone,))

        
def change_client(conn, client_id, first_name=None, last_name=None, email=None):
    with conn.cursor() as cur:
        if last_name is None and email is None:
            cur.execute("""
            UPDATE client
            SET first_name = %s
            WHERE client_id = %s;
            """, (first_name, client_id,))
        elif first_name is None and email is None:
            cur.execute("""
            UPDATE client
            SET last_name = %s
            WHERE client_id = %s;
            """, (last_name, client_id,))
        elif first_name is None and last_name is None:
            cur.execute("""
            UPDATE client
            SET email = %s
            WHERE client_id = %s;
            """, (email, client_id,))
        if first_name is None:
            cur.execute("""
            UPDATE client
            SET last_name = %s, email = %s
            WHERE client_id = %s;
            """, (last_name, email, client_id,))
        elif last_name is None:
            cur.execute("""
            UPDATE client
            SET first_name = %s, email = %s
            WHERE client_id = %s;
            """, (first_name, email, client_id,))
        elif email is None:
            cur.execute("""
            UPDATE client
            SET first_name = %s, last_name = %s
            WHERE client_id = %s;
            """, (first_name, last_name, client_id,))
        else:
            cur.execute("""
            UPDATE client
            SET first_name=%s, last_name = %s, email = %s
            WHERE client_id = %s;
            """, (first_name, last_name, email, client_id,))            


def delete_phone(conn, client_id, phone):
    with conn.cursor() as cur:
        cur.execute("""
            SELECT client_id FROM client
            WHERE client_id = %s;
            """, (client_id,))
        cur.execute("""
            DELETE FROM phones
            WHERE phone = %s;
            """, (phone,))
         
         
def delete_client(conn, client_id):
    with conn.cursor() as cur:
        cur.execute("""
            DELETE FROM phones
            WHERE link_client = %s;
            """, (client_id,))
        cur.execute("""
            DELETE FROM client
            WHERE client_id = %s;
            """, (client_id,))
   
   

        
        
with psycopg2.connect(database="clients_db", user="postgres", password="1112") as conn:
    delete_db(conn)
    create_db(conn)
    add_client(conn, "Roma", "Zaverskiy", "Zaverskiy333@gmail.com", "8-995-595-87-44")
    add_client(conn, "Вася", "Пупкин", "Pupkin@gmail.com")
    add_client(conn, "Иван", "Иванов", "Ivanov@gmail.com")
    add_phone(conn, 1, "8-950-019-55-87")
    add_phone(conn, 2, "8-099-444-87-23")
    add_phone(conn, 1, "8-045-665-32-55")
    change_client(conn, 2, "ccccc", None, "ccccdd")
    delete_phone(conn, 1, "8-995-595-87-44")
    delete_client(conn, 3)
    
    
    

