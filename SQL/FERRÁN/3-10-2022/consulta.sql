create table sugerencias (
  id_sugerencia INT(5) PRIMARY KEY AUTO_INCREMENT,
  id_usuario INT(5) NOT NULL,
  titulo_sugerencia VARCHAR(100) NOT NULL,
  rating_sugerencia ENUM('1','2','3','4','5') DEFAULT '1',
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);