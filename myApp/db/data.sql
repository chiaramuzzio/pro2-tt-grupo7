create schema listaUsuarios;

use listaUsuarios;

CREATE TABLE usuarios (

/* 	Nombre de Columna 	Tipo de Dato 	Restricciones */

    id 					INT 			UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    mail 				VARCHAR(250) 	NOT NULL,
    usuario 			VARCHAR(250) 	NOT NULL,
    contrasenia 		VARCHAR(250) 	NOT NULL,
    fechaNacimiento 	DATE 			NOT NULL,
    numeroDocumento 	INT 			NOT NULL,
    foto 				VARCHAR(250) 	NOT NULL,
    createdAt 			TIMESTAMP 		DEFAULT CURRENT_TIMESTAMP ,
	updatedAt 			TIMESTAMP 		DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deletedAt			timestamp		null
);

CREATE TABLE productos (

/* 	Nombre de Columna   Tipo de Dato 	Restricciones */

    id 					INT 			UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    clienteId			INT				UNSIGNED,
    nombreProd 			VARCHAR(250) 	NOT NULL,
    imagenProd 			VARCHAR(250) 	NOT NULL,
    descripcion 		VARCHAR(250) 	NOT NULL,
    createdAt 			TIMESTAMP 		DEFAULT CURRENT_TIMESTAMP ,
	updatedAt 			TIMESTAMP 		DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deletedAt			timestamp		null,
    
    FOREIGN KEY (clienteId) REFERENCES usuarios(id)
);

CREATE TABLE comentarios (

/* 	Nombre de Columna 	Tipo de Dato 	Restricciones */

    id 					INT 			UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    productoId			INT				UNSIGNED,
    clienteId			INT				UNSIGNED,
    comentario 			VARCHAR(250) 	NOT NULL,
    createdAt 			TIMESTAMP 		DEFAULT CURRENT_TIMESTAMP ,
	updatedAt 			TIMESTAMP 		DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deletedAt			timestamp		null,

    FOREIGN KEY (clienteId) REFERENCES usuarios(id),
    FOREIGN KEY (productoId) REFERENCES productos(id)
);

    /*SQL usuarios*/

insert into usuarios (id, mail, usuario, contrasenia, fechaNacimiento, numeroDocumento, foto)
values (default, 'carlosperez@gmail.com', 'carlosperez', 'carlitos10', "1960/10/10", 12345678, "carlitos.png" );

insert into usuarios (id, mail, usuario, contrasenia, fechaNacimiento, numeroDocumento, foto)
values (default, 'manujurel@gmail.com', 'manujurel', 'carlitos10', "1961/10/10", 12345671, "manu.png");

insert into usuarios (id, mail, usuario, contrasenia, fechaNacimiento, numeroDocumento, foto)
values (default, 'franciscot@gmail.com', 'pancho_torres', 'carlitos10', '1962/10/10', 12345672, "pancho.png");

insert into usuarios (id, mail, usuario, contrasenia, fechaNacimiento, numeroDocumento, foto)
values (default, 'felitromel@gmail.com', 'felitromel', 'carlitos10', '1963/10/10', 12345673, 'feli.png');

insert into usuarios (id, mail, usuario, contrasenia, fechaNacimiento, numeroDocumento, foto)
values (default, 'felitrazzo@gmail.com', 'felicitastrazzo', 'carlitos10', '1964/10/10', 12345674, 'felicitas.png');

    /*SQL productos*/

insert into productos (id, clienteId, nombreProd, imagenProd, descripcion)
values (default, 4, 'libro1', 'libro1.png', 'lorem ipsum');

insert into productos (id, clienteId, nombreProd, imagenProd, descripcion)
values (default, 3, 'libro2', 'libro2.png', 'lorem ipsum');

insert into productos (id, clienteId, nombreProd, imagenProd, descripcion)
values (default, 2, 'libro3', 'libro3.png', 'lorem ipsum');

insert into productos (id, clienteId, nombreProd, imagenProd, descripcion)
values (default, 4, 'libro4', 'libro4.png', 'lorem ipsum');

insert into productos (id, clienteId, nombreProd, imagenProd, descripcion)
values (default, 1, 'libro5', 'libro5.png', 'lorem ipsum');

insert into productos (id, clienteId, nombreProd, imagenProd, descripcion)
values (default, 1, 'libro6', 'libro6.png', 'lorem ipsum');

insert into productos (id, clienteId, nombreProd, imagenProd, descripcion)
values (default, 3, 'libro7', 'libro7.png', 'lorem ipsum');

insert into productos (id, clienteId, nombreProd, imagenProd, descripcion)
values (default, 5, 'libro8', 'libro8.png', 'lorem ipsum');

insert into productos (id, clienteId, nombreProd, imagenProd, descripcion)
values (default, 3, 'libro9', 'libro9.png', 'lorem ipsum');

insert into productos (id, clienteId, nombreProd, imagenProd, descripcion)
values (default, 1, 'libro10', 'libro10.png', 'lorem ipsum');

    /*SQL comentarios*/
insert into comentarios (id, productoId, clienteId, comentario)
values (default, 1, 5, 'comentario 1');

insert into comentarios (id, productoId, clienteId, comentario)
values (default, 1, 1, 'comentario 2');

insert into comentarios (id, productoId, clienteId, comentario)
values (default, 1, 3, 'comentario 3');

insert into comentarios (id, productoId, clienteId, comentario)
values (default, 2, 5, 'comentario 1');

insert into comentarios (id, productoId, clienteId, comentario)
values (default, 2, 1, 'comentario 2');

insert into comentarios (id, productoId, clienteId, comentario)
values (default, 2, 3, 'comentario 3');

insert into comentarios (id, productoId, clienteId, comentario)
values (default, 3, 5, 'comentario 1');

insert into comentarios (id, productoId, clienteId, comentario)
values (default, 3, 1, 'comentario 2');

insert into comentarios (id, productoId, clienteId, comentario)
values (default, 3, 3, 'comentario 3');

insert into comentarios (id, productoId, clienteId, comentario)
values (default, 4, 5, 'comentario 1');

insert into comentarios (id, productoId, clienteId, comentario)
values (default, 4, 1, 'comentario 2');

insert into comentarios (id, productoId, clienteId, comentario)
values (default, 4, 3, 'comentario 3');

insert into comentarios (id, productoId, clienteId, comentario)
values (default, 5, 5, 'comentario 1');

insert into comentarios (id, productoId, clienteId, comentario)
values (default, 5, 1, 'comentario 2');

insert into comentarios (id, productoId, clienteId, comentario)
values (default, 5, 3, 'comentario 3');

insert into comentarios (id, productoId, clienteId, comentario)
values (default, 6, 5, 'comentario 1');

insert into comentarios (id, productoId, clienteId, comentario)
values (default, 6, 1, 'comentario 2');

insert into comentarios (id, productoId, clienteId, comentario)
values (default, 6, 3, 'comentario 3');

insert into comentarios (id, productoId, clienteId, comentario)
values (default, 7, 5, 'comentario 1');

insert into comentarios (id, productoId, clienteId, comentario)
values (default, 7, 1, 'comentario 2');

insert into comentarios (id, productoId, clienteId, comentario)
values (default, 7, 3, 'comentario 3');

insert into comentarios (id, productoId, clienteId, comentario)
values (default, 8, 5, 'comentario 1');

insert into comentarios (id, productoId, clienteId, comentario)
values (default, 8, 1, 'comentario 2');

insert into comentarios (id, productoId, clienteId, comentario)
values (default, 8, 3, 'comentario 3');

insert into comentarios (id, productoId, clienteId, comentario)
values (default, 9, 5, 'comentario 1');

insert into comentarios (id, productoId, clienteId, comentario)
values (default, 9, 1, 'comentario 2');

insert into comentarios (id, productoId, clienteId, comentario)
values (default, 9, 3, 'comentario 3');

insert into comentarios (id, productoId, clienteId, comentario)
values (default, 10, 5, 'comentario 1');

insert into comentarios (id, productoId, clienteId, comentario)
values (default, 10, 1, 'comentario 2');

insert into comentarios (id, productoId, clienteId, comentario)
values (default, 10, 3, 'comentario 3');
