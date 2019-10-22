BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "PedidosVenda" (
	"produto"	char(50) NOT NULL,
	"descricao"	char(50) NOT NULL,
	"vlrTotal"	float(10 , 2) NOT NULL,
	"custo"	float(10 , 0) NOT NULL
);
CREATE TABLE IF NOT EXISTS "vendasItens" (
	"id"	INTEGER PRIMARY KEY AUTOINCREMENT,
	"id_venda"	int(10) NOT NULL,
	"id_produto"	int(10) NOT NULL,
	"qtde"	int(10) NOT NULL,
	"vlrTotUnit"	float(10 , 2) NOT NULL,
	"vlrTotal"	float(10 , 2) NOT NULL
);
CREATE TABLE IF NOT EXISTS "vendas" (
	"id"	INTEGER PRIMARY KEY AUTOINCREMENT,
	"vlrDespesa"	float(10 , 2) NOT NULL,
	"vlrtotal"	float(10 , 2) NOT NULL
);
CREATE TABLE IF NOT EXISTS "produtos" (
	"id"	INTEGER PRIMARY KEY AUTOINCREMENT,
	"nome"	varchar(50) NOT NULL,
	"descricao"	varchar(255),
	"custo"	float(10 , 2)
);
INSERT INTO "PedidosVenda" ("produto","descricao","vlrTotal","custo") VALUES ('teste3','teste3',38.0,20.0);
INSERT INTO "produtos" ("id","nome","descricao","custo") VALUES (5,'Produto A','Produto de teste A',100.0);
INSERT INTO "produtos" ("id","nome","descricao","custo") VALUES (6,'Produto B','Produto de teste B',200.0);
INSERT INTO "produtos" ("id","nome","descricao","custo") VALUES (7,'Produto C','Produto de teste C',300.0);
INSERT INTO "produtos" ("id","nome","descricao","custo") VALUES (8,'teste','Produto de teste',52.0);
INSERT INTO "produtos" ("id","nome","descricao","custo") VALUES (9,'teste2','---------------------------
Project1
---------------------------
attempt to write a readonly database.
---------------------------
OK   
---------------------------
',52.0);
COMMIT;
