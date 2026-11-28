import mysql.connector

with (
    mysql.connector.connect(
        user="root", password="123456", host="127.0.0.1", database="exemplo01"
    ) as conexao,
    conexao.cursor() as c,
):
    cpf = input("Digite o CPF da pessoa: ")

    c.execute("delete from pessoa where cpf = %s", (cpf,))
    print("Quantidade de linhas afetadas:", c.rowcount)

    conexao.commit()
