import mysql.connector

conexao = mysql.connector.connect(user="root", password="123456", host="127.0.0.1", database="exemplo01")
c = conexao.cursor()

c.execute("select * from pessoa")
tabela = c.fetchall()

for linha in tabela:
    print("-" * 20)
    print("ID:", linha[0])
    print("CPF:", linha[1])
    print("RG:", linha[2])
    print("Nome:", linha[3])

conexao.close()
