import mysql.connector

conexao = mysql.connector.connect(
    host= 'localhost',
    user= 'root',
    password= 'admin',
    database= 'sistemavingadores',
)

if conexao.is_connected():
    print("Conexão bem-sucedida ao MySQL!")
else:
    print("Falha na conexão ao MySQL!")


cursor = conexao.cursor()

# Inserir dados
id_heroi = 1
nome = "Clark Kent"
idade = 45
identidade = "Superman"


comando = f'INSERT INTO heroi (id_heroi, nome, idade, identidade) VALUES ({id_heroi}, "{nome}", {idade}, "{identidade}")'

# Executar a query
cursor.execute(comando)
conexao.commit()


cursor.close()
conexao.close()