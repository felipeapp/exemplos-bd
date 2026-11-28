import mysql.connector

conexao = mysql.connector.connect(user="root", password="123456", host="127.0.0.1", database="exemplo01")
c = conexao.cursor()

novo_nome = input("Digite o novo nome da pessoa: ")
rg = int(input("Digite o RG da pessoa: "))

c.execute("update pessoa set nome = %s where rg = %s", (novo_nome, rg))
print("Quantidade de linhas afetadas:", c.rowcount)

conexao.commit()
conexao.close()
