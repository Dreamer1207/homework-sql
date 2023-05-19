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
        link_client INTEGER NOT NULL REFERENCES client(client_id) ON DELETE CASCADE,
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
            print("keys not found")
        else:
            cur.execute("""
            INSERT INTO phones(link_client, phone)
            VALUES(%s, %s);
             """, (client_id, phone,))
           
        
def change_client(conn, client_id, first_name=None, last_name=None, email=None):
    with conn.cursor() as curs:
        curs.execute(
            """
            SELECT first_name, last_name, email, client_id FROM client
            WHERE client_id = %s;
            """,
            (client_id,)
        )
        qst = curs.fetchone() 
        if not qst: 
            return "client not found" 
        if first_name is None: 
            first_name = qst[0] 
        if last_name is None: 
            last_name = qst[1] 
        if email is None: 
            email = qst[2] 
        curs.execute(
            """
            UPDATE client
            SET first_name = %s, last_name = %s, email = %s 
            WHERE client_id = %s; 
            """,
            (first_name, last_name, email, client_id,) 
        )
    print ("successful change")
            

def delete_phone(conn, client_id, phone):
    with conn.cursor() as cur:
        cur.execute("""
        DELETE FROM phones
        WHERE link_client = %s AND phone = %s;
        """, (client_id, phone,))
        if not cur.fetchone:
            print("phone not found")
    print("removal made")
            
            
def delete_client(conn, client_id):
    with conn.cursor() as cur:
        cur.execute("""
        DELETE FROM client
        WHERE client_id = %s
        RETURNING *;
        """, (client_id,))
        if not cur.fetchall:
            print("client not found")
    print("removal made")
                
        
def find_client(conn, first_name='%', last_name='%', email='%', phone='%'):
    with conn.cursor() as cur:
        qst = f"""
            SELECT email, first_name, last_name,
            CASE
                WHEN ARRAY_AGG(phone) = '{{Null}}' THEN '{{}}'
                ELSE ARRAY_AGG(phone)
            END phones
            FROM client c
            LEFT JOIN phones p ON c.client_id = p.link_client
            WHERE first_name ILIKE %s AND last_name ILIKE %s AND email ILIKE %s AND phone ILIKE %s
            GROUP BY email, first_name, last_name
            """
        cur.execute(qst, (first_name, last_name, email, phone))
        print(cur.fetchall())

        
with psycopg2.connect(database="clients_db", user="postgres", password="postgres") as conn:
    create_db(conn)
    add_client(conn, "Иван", "Иванов", "Ivanov@mail.ru", "8-111-111-11-11")
    add_client(conn, "Вася", "Петров", "Petrov@mail.ru")
    add_client(conn, "Петя", "Сидоров", "Sidorov@mail.ru")
    add_client(conn, "Егор", "Летов", "Letov@mail.ru")
    add_phone(conn, 1, "8-222-22-22-22")
    add_phone(conn, 2, "8-333-33-33-33")
    change_client(conn, 2, None, "Пушкин", "Pushkin@mail.ru")
    delete_phone(conn, 2, "8-222-22-22-22")
    delete_client(conn, 3)
    find_client(conn, "%", "%", "%", "8-111-111-11-11")
    find_client(conn, "%", "Пушкин")
    find_client(conn, "%", "Летов")

    
    

    
    


