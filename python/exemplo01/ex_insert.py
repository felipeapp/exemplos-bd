import mysql.connector

conexao = mysql.connector.connect(user="root", password="123456", host="127.0.0.1", database="exemplo01")
c = conexao.cursor()

cpf = input("Digite o CPF da pessoa: ")
rg = int(input("Digite o RG da pessoa: "))
nome = input("Digite o nome da pessoa: ")

c.execute("insert into pessoa (cpf, rg, nome) values (%s, %s, %s)", (cpf, rg, nome))

print("Quantidade de linhas afetadas:", c.rowcount)
print("Último ID gerado:", c.lastrowid)

conexao.commit()
conexao.close()
