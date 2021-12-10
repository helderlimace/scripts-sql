use bd_name;
declare @datainicio varchar(12);
declare @datafim varchar(12);
set @datainicio = '2021-11-01';
set @datafim = '2021-11-30';

-- Analítico
select sol.data 'Data', sol.local 'Local', sol.protocolo 'Protocolo', pac.nome 'Paciente',  se.exame 'Exame', sg.solicitante_id 'CRM Medico Solicitante', se.USUARIO_CONFERENCIA 'Usu�rio confer�ncia' from solicitacao sol
	inner join solicitacao_exames se on se.solicitacao_id = sol.id
	inner join solicitacao_guia sg on sg.solicitacao_id = sol.id
	inner join paciente pac on pac.id = sol.paciente
where (sol.data between @datainicio and @datafim) and se.assinatura = 8553 and se.usuario_conferencia = 'NOME_MEDICO'
order by sol.data;

--Sintético
select se.exame 'Exame', count(*) 'Quantidade' from solicitacao sol
	inner join solicitacao_exames se on se.solicitacao_id = sol.id
	inner join solicitacao_guia sg on sg.solicitacao_id = sol.id
where (sol.data between @datainicio and @datafim) and se.assinatura = 8553 and se.usuario_conferencia = 'NOME_MEDICO'
group by se.exame
order by exame;