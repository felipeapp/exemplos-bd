import mysql.connector

with (
    mysql.connector.connect(
        user="root", password="123456", host="127.0.0.1", database="exemplo01"
    ) as conexao,
    conexao.cursor() as c,
):
    cpf = input("Digite o CPF: ")

    c.execute("select * from pessoa where cpf = %s", (cpf,))
    linha = c.fetchone()

    if linha:
        print("-" * 20)
        print("ID:", linha[0])
        print("CPF:", linha[1])
        print("RG:", linha[2])
        print("Nome:", linha[3])
    else:
        print("CPF não encontrado!")
