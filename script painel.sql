-- ========================================================
-- Author: Helder Lima
-- Description: Captura dados para dashboard
-- ========================================================

select
    se.situacao 'Situação', 
    s.data 'Data', 
    s.local + ' - ' + loc.descricao 'Local', 
    s.local id_local, 
    s.protocolo 'Protocolo', 
    p.nome 'Paciente', 
    b.descricao 'Bancada' 
from solicitacao_exames se
    left join laudos l on l.id = se.exame
    inner join solicitacao s on s.id = se.solicitacao_id
    inner join LOCAL loc on loc.id = s.local
    inner join paciente p on p.id = s.paciente
    join bancada b on b.id = l.bancada
where s.local = '04' and s.data >= '2020-05-20' and 
    se.situacao <> 'D' and 
    se.situacao <> 'I' and  
    b.descricao not in ('ULTRASSOM','COLETA EXTERNA','DIVERSOS-S') and 
    se.labapoio is null
group by 
    s.local, 
    loc.descricao, 
    s.protocolo, 
    b.descricao, 
    p.nome, 
    s.data, 
    se.situacao
order by s.data asc;
