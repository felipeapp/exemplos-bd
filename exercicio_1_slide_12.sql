/*
Crie uma consulta que retorne informações
(nome, salário e número do ambulatório) de
todos os médicos que trabalham em ambulatórios
do segundo andar
*/
select
	m.nome `Nome do Médico`,
	m.salario `Salário do Médico`,
	a.numero `Número do Ambulatório`
from
	medico m inner join ambulatorio a on m.ambulatorio_id = a.id
where
	a.andar = 2;

/*
Crie uma consulta que retorne a soma dos salários
dos médicos que trabalham em ambulatórios do primeiro andar
*/
select
	sum(m.salario) `Salário Total`
from
	medico m inner join ambulatorio a on m.ambulatorio_id = a.id
where
	a.andar = 1;

/*
Crie uma consulta que retorne uma lista com o nome dos
médicos, o número do ambulatório onde ele trabalha e a
data que ele foi contratado para trabalhar no ambulatório
*/
select
	m.nome `Nome do Médico`,
	a.numero `Número do Ambulatório`,
	m.data_contrato `Data de Contrato`
from
	medico m inner join ambulatorio a on m.ambulatorio_id = a.id;

/*
Crie uma consulta que mostre uma lista com os números
dos ambulatórios e quantos médicos trabalham nele
*/
select
	a.numero `Número do Ambulatório`,
	count(m.id) `Quantidade de Médicos`
from
	medico m right join ambulatorio a on m.ambulatorio_id = a.id
group by
	a.numero;
