-- DML_SELECT_QUERIES.sql

-- Consulta 1: Listar Alunos Matriculados e o Professor Responsável (JOIN em 4 tabelas)
-- Objetivo: Rastrear qual professor e qual curso está ligado a cada aluno.
SELECT
    A.nome AS Aluno,
    C.nome_curso AS Curso,
    T.nivel AS Nivel,
    P.nome AS Professor_Responsavel
FROM ALUNO A
JOIN MATRICULA M ON A.id_aluno = M.id_aluno
JOIN TURMA T ON M.id_turma = T.id_turma
JOIN CURSO C ON T.id_curso = C.id_curso
JOIN PROFESSOR P ON T.id_professor = P.id_professor
ORDER BY A.nome;


-- Consulta 2: Calcular a Taxa de Falta por Aluno (GROUP BY e HAVING)
-- Objetivo: Identificar alunos com 1 ou mais faltas.
SELECT
    A.nome AS Aluno,
    SUM(CASE WHEN F.status_presenca = 'F' THEN 1 ELSE 0 END) AS Total_Faltas,
    COUNT(F.id_aula) AS Total_Aulas
FROM ALUNO A
JOIN FREQUENCIA F ON A.id_aluno = F.id_aluno
GROUP BY A.id_aluno, A.nome
HAVING Total_Faltas >= 1
ORDER BY Total_Faltas DESC;


-- Consulta 3: Turmas com Horário Noturno (WHERE, ORDER BY)
-- Objetivo: Filtrar turmas que começam às 18:00 ou mais tarde.
SELECT
    T.nivel AS Nivel_Turma,
    C.nome_curso AS Curso,
    T.dia_semana,
    T.horario_inicio
FROM TURMA T
JOIN CURSO C ON T.id_curso = C.id_curso
WHERE T.horario_inicio >= '18:00:00'
ORDER BY T.horario_inicio
LIMIT 5;
