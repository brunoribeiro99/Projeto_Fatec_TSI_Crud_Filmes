CREATE TABLE filme (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    ano_lancamento INTEGER NOT NULL,
    descricao TEXT,
    genero VARCHAR(100)
);
select * from filme;