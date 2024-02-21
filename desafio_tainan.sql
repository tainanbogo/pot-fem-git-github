CREATE TABLE alunos (
    id INT,
    nome TEXT,
    idade INT,
    curso TEXT
);

INSERT INTO alunos (id, nome, idade, curso) VALUES
(1, 'Rosane', 28, 'Biologia'),
(2, 'Nalva', 32, 'Sociologia'),
(3, 'Jonatas', 31, 'Ed. Física'),
(4, 'Dalila', 29, 'Psicologia'),
(5, 'Jardelson', 23, 'Engenharia');

SELECT * FROM alunos;
SELECT nome, idade FROM alunos WHERE idade > 20;
SELECT * FROM alunos WHERE curso = 'Engenharia' ORDER BY nome;
SELECT COUNT(*) AS total_alunos FROM alunos;

UPDATE alunos SET idade = novo_valor WHERE id = id_do_aluno;
DELETE FROM alunos WHERE id = id_do_aluno;

CREATE TABLE clientes (
    id INT PRIMARY KEY,
    nome TEXT,
    idade INT,
    saldo FLOAT
);

INSERT INTO clientes (id, nome, idade, saldo) VALUES
(1, 'Ademar', 30, 1500),
(2, 'Cristina', 45, 2075),
(3, 'Tainan', 32, 100.25),
(4, 'Analice', 25, 2200),
(5, 'Luana', 23, 1830.36);

SELECT nome, idade FROM clientes WHERE idade > 30;
SELECT AVG(saldo) AS saldo_medio FROM clientes;
SELECT nome, MAX(saldo) AS saldo_maximo FROM clientes;
SELECT COUNT(*) AS clientes_acima_de_1000 FROM clientes WHERE saldo > 1000;

UPDATE clientes SET saldo = novo_saldo WHERE id = id_do_cliente;
DELETE FROM clientes WHERE id = id_do_cliente;

CREATE TABLE compras (
    id INT PRIMARY KEY,
    cliente_id INT,
    produto TEXT,
    valor REAL,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

INSERT INTO compras (id, cliente_id, produto, valor) VALUES
(1, 1, 'Tenis', 250.00),
(2, 2, 'Blusa', 30.00),
(3, 3, 'Calça', 120.00),
(4, 4, 'Chapeu', 30.00),
(5, 5, 'Meia', 5.00);

SELECT c.nome AS nome_cliente, p.produto, p.valor
FROM compras p
JOIN clientes c ON p.cliente_id = c.id;