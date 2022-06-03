/*Criando DB*/
CREATE DATABASE teste3_IntutiveCare;

/*Selecionando DB */
USE teste3_IntutiveCare;

/*Criando tabela*/
CREATE TABLE IF NOT EXISTS tbl_dados(
	id INT NULL,
    data_inicio DATE NULL, 
    reg_ans VARCHAR(500),
    cd_conta_contabil VARCHAR(500),
    descricao VARCHAR(500),
    vl_saldo_inicial VARCHAR(500),
    vl_saldo_final VARCHAR(500)
);

/*Populando banco*/
LOAD DATA
INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Teste3\\combined.csv'
INTO TABLE tbl_dados
CHARACTER SET latin1
FIELDS TERMINATED BY ';'
IGNORE 1 ROWS;

/*Filtro*/
SELECT SUM(vl_saldo_final) as total,  
reg_ans FROM tbl_dados 
WHERE data_inicio = '2021-10-01' 
and descricao = 'Planos Individuais/Familiares antes da Lei' 
GROUP BY reg_ans 
ORDER BY total 
LIMIT 10; 

SELECT SUM(vl_saldo_final) as total,  
reg_ans FROM tbl_dados 
WHERE YEAR(data_inicio) = '2021' 
and descricao = 'Planos Individuais/Familiares antes da Lei' 
GROUP BY reg_ans 
ORDER BY total
LIMIT 10; 

