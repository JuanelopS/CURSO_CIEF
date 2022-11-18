USE juan_biblioteca;

create table sugerencias (
	id_sugerencia INT PRIMARY KEY AUTO_INCREMENT,
	titulo_sugerencia VARCHAR(100) NOT NULL,
	id_usuario INT(5) NOT NULL,
	rating_sugerencia ENUM('1','2','3','4','5') DEFAULT '1',
	FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);