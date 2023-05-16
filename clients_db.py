import psycopg2


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
        if cur.fetchone() is None:
            print("the keys are not found")
        else:
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
        elif first_name is None:
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
        if cur.fetchone() is None:
            print("the keys are not found")
        cur.execute("""
        SELECT phone FROM phones
        WHERE phone = %s;
        """, (phone,))
        if cur.fetchone() is None:
            print("the phone was not found")
        else:
            cur.execute("""
            DELETE FROM phones
            WHERE phone = %s;
            """, (phone,))
            
            
def delete_client(conn, client_id):
    with conn.cursor() as cur:
        cur.execute("""
        SELECT client_id FROM client
        WHERE client_id = %s;
        """, (client_id,))
        if cur.fetchone() is None:
            print("the keys are not found")
        else:
            cur.execute("""
            DELETE FROM phones
            WHERE link_client = %s;
            """, (client_id,))
            cur.execute("""
            DELETE FROM client
            WHERE client_id = %s;
            """, (client_id,))
        
        
def find_client(conn, first_name=None, last_name=None, email=None, phone=None):
    with conn.cursor() as cur:
        if last_name is None and email is None and phone is None:
            cur.execute("""
            SELECT last_name, email FROM client
            WHERE first_name = %s;
            """, (first_name,))
            print(cur.fetchall())
            cur.execute("""
            SELECT last_name, email, phone FROM client c
            JOIN phones p ON c.client_id = p.link_client
            WHERE first_name = %s;
            """, (first_name,))
            print(cur.fetchall())
        elif first_name is None and email is None and phone is None:
            cur.execute("""
            SELECT first_name, email FROM client
            WHERE last_name = %s;
            """, (last_name,))
            print(cur.fetchall())
            cur.execute("""
            SELECT phone FROM client c
            JOIN phones p ON c.client_id = p.link_client
            WHERE last_name = %s;
            """, (last_name,))
            print(cur.fetchall())
        elif first_name is None and last_name is None and phone is None:
            cur.execute("""
            SELECT first_name, last_name FROM client
            WHERE email = %s;
            """, (email,))
            print(cur.fetchall())
            cur.execute("""
            SELECT phone FROM client c
            JOIN phones p ON c.client_id = p.link_client
            WHERE email = %s;
            """, (email,))
            print(cur.fetchall())
        elif first_name is None and last_name is None and email is None:
            cur.execute("""
            SELECT first_name, last_name, email FROM phones p
            JOIN client c ON p.link_client = c.client_id
            WHERE phone = %s;
            """, (phone,))
            print(cur.fetchall())
        elif first_name is None and phone is None:
            cur.execute("""
            SELECT first_name FROM client
            WHERE last_name = %s AND email = %s;
            """, (last_name, email,))
            print(cur.fetchall())
            cur.execute("""
            SELECT phone FROM client c
            JOIN phones p ON c.client_id = p.link_client
            WHERE last_name = %s AND email = %s;
            """, (last_name, email,))
            print(cur.fetchall())
        elif last_name is None and phone is None:
            cur.execute("""
            SELECT last_name FROM client
            WHERE first_name = %s AND email = %s;
            """, (first_name, email,))
            print(cur.fetchall())
            cur.execute("""
            SELECT phone FROM client c
            JOIN phones p ON c.client_id = p.link_client
            WHERE first_name = %s AND email = %s;
            """, (first_name, email,))
            print(cur.fetchall())
        elif email is None and phone is None:
            cur.execute("""
            SELECT email FROM client
            WHERE first_name = %s AND last_name = %s;
            """, (first_name, last_name,))
            print(cur.fetchall())
            cur.execute("""
            SELECT phone FROM client c
            JOIN phones p ON c.client_id = p.link_client
            WHERE first_name = %s AND last_name = %s;
            """, (first_name, last_name))
            print(cur.fetchall())
        elif last_name is None and email is None:
            cur.execute("""
            SELECT last_name, email FROM client c
            JOIN phones p ON c.client_id = p.link_client
            WHERE first_name = %s AND phone = %s;
            """, (first_name, phone))
            print(cur.fetchall())
        elif first_name is None and email is None:
            cur.execute("""
            SELECT first_name, email FROM client c
            JOIN phones p ON c.client_id = p.link_client
            WHERE last_name = %s AND phone = %s;
            """, (last_name, phone))
            print(cur.fetchall())
        elif first_name is None and last_name is None:
            cur.execute("""
            SELECT first_name, last_name FROM client c
            JOIN phones p ON c.client_id = p.link_client
            WHERE email = %s AND phone = %s;
            """, (email, phone))
            print(cur.fetchall())
        elif phone is None:
            cur.execute("""
            SELECT phone FROM client c
            JOIN phones p ON c.client_id = p.link_client
            WHERE first_name = %s AND last_name = %s AND email = %s;
            """, (first_name, last_name, email,))
            print(cur.fetchall())
        elif first_name is None:
            cur.execute("""
            SELECT first_name FROM client c
            JOIN phones p ON c.client_id = p.link_client
            WHERE last_name = %s AND email = %s AND phone = %s;
            """, (last_name, email, phone,))
            print(cur.fetchall())
        elif last_name is None:
            cur.execute("""
            SELECT last_name FROM client c
            JOIN phones p ON c.client_id = p.link_client
            WHERE first_name = %s AND email = %s AND phone = %s;
            """, (first_name, email, phone,))
            print(cur.fetchall())
        elif email is None:
            cur.execute("""
            SELECT email FROM client c
            JOIN phones p ON c.client_id = p.link_client
            WHERE first_name = %s AND last_name = %s AND phone = %s;
            """, (first_name, last_name, phone,))
            print(cur.fetchall())
        else:
            cur.execute("""
            SELECT first_name, last_name, email FROM client
            WHERE first_name = %s AND last_name = %s AND email = %s;
            """, (first_name, last_name, email,))
            print(cur.fetchall())
            cur.execute("""
            SELECT phone FROM client c
            JOIN phones p ON c.client_id = p.link_client
            WHERE first_name = %s AND last_name = %s AND email = %s AND phone = %s;;
            """, (first_name, last_name, email, phone,))
            print(cur.fetchall())
    
        
with psycopg2.connect(database="clients_db", user="postgres", password="1112") as conn:
    pass

    
    


