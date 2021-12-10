-- ========================================================
-- Author: Helder Lima
-- Created at: 19/10/2020
-- Updated at: 02/08/2021
-- Description: Replica o modelo de laudo 'TESTE' para os demais modelos.
-- ========================================================

use db_name;
declare @exame varchar(30);     

-- ========================================================
-- Informe qual exame deseja replicar o modelo de laudo
set @exame = 'TTPA';
-- ========================================================

begin tran
update modelo_laudo set
	layout = (select layout from modelo_laudo where id_tipo = 73 and exame = @exame),
	layout_condicao = (select layout_condicao from modelo_laudo where id_tipo = 73 and exame = @exame),
	layout_condicao2 = (select layout_condicao2 from modelo_laudo where id_tipo = 73 and exame = @exame),
	pagina_separada = (select pagina_separada from modelo_laudo where id_tipo = 73 and exame = @exame),
	condicao = (select condicao from modelo_laudo where id_tipo = 73 and exame = @exame),
	condicao2 = (select condicao2 from modelo_laudo where id_tipo = 73 and exame = @exame)
where exame = @exame and id_tipo <> 73;
