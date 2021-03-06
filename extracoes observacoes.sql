-- ========================================================
-- Author: Helder Lima
-- Description: Extrair observações
-- ========================================================



select aval.id_avaliacao 'ID Avaliaçao', aval.ultimo_acesso 'Data/Hora Contato', aval.usuario 'Colaborador', pac.autolac_id 'Código Paciente Autolac', pac.nome 'Nome Paciente', pac.telefone 'Telefone 1', pac.celular 'Telefone 2', notas.observacao 'Observações' from intra_avaliacao aval
    inner join intra_pacientes pac on pac.autolac_id = aval.autolac_id_paciente
    inner join intra_notas_avaliacao notas on notas.avaliacao_id = aval.id_avaliacao
where aval.mes = 2 and aval.ano = 2020 and status <> 0 and notas.ponto_avaliado = 'observacao' and notas.observacao <> ''
and aval.usuario <> ''
order by aval.ultimo_acesso;
