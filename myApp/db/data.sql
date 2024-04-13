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
    cliente_id			INT				UNSIGNED,
    nombreProd 			VARCHAR(250) 	NOT NULL,
    imagenProd 			VARCHAR(250) 	NOT NULL,
    descripcion 		VARCHAR(250) 	NOT NULL,
    createdAt 			TIMESTAMP 		DEFAULT CURRENT_TIMESTAMP ,
	updatedAt 			TIMESTAMP 		DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deletedAt			timestamp		null,
    
    FOREIGN KEY (cliente_id) REFERENCES usuarios(id)
);

CREATE TABLE comentarios (

/* 	Nombre de Columna 	Tipo de Dato 	Restricciones */

    id 					INT 			UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    producto_id			INT				UNSIGNED,
    cliente_id			INT				UNSIGNED,
    comentario 			VARCHAR(250) 	NOT NULL,
    createdAt 			TIMESTAMP 		DEFAULT CURRENT_TIMESTAMP ,
	updatedAt 			TIMESTAMP 		DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deletedAt			timestamp		null,

    FOREIGN KEY (cliente_id) REFERENCES usuarios(id),
    FOREIGN KEY (producto_id) REFERENCES productos(id)
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

insert into productos (id, cliente_id, nombreProd, imagenProd, descripcion)
values (default, cliente_id, 'libro1', 'libro1.png', 'lorem ipsum');

insert into productos (id, cliente_id, nombreProd, imagenProd, descripcion)
values (default, cliente_id, 'libro2', 'libro2.png', 'lorem ipsum');

insert into productos (id, cliente_id, nombreProd, imagenProd, descripcion)
values (default, cliente_id, 'libro3', 'libro3.png', 'lorem ipsum');

insert into productos (id, cliente_id, nombreProd, imagenProd, descripcion)
values (default, cliente_id, 'libro4', 'libro4.png', 'lorem ipsum');

insert into productos (id, cliente_id, nombreProd, imagenProd, descripcion)
values (default, cliente_id, 'libro5', 'libro5.png', 'lorem ipsum');

insert into productos (id, cliente_id, nombreProd, imagenProd, descripcion)
values (default, cliente_id, 'libro6', 'libro6.png', 'lorem ipsum');

insert into productos (id, cliente_id, nombreProd, imagenProd, descripcion)
values (default, cliente_id, 'libro7', 'libro7.png', 'lorem ipsum');

insert into productos (id, cliente_id, nombreProd, imagenProd, descripcion)
values (default, cliente_id, 'libro8', 'libro8.png', 'lorem ipsum');

insert into productos (id, cliente_id, nombreProd, imagenProd, descripcion)
values (default, cliente_id, 'libro9', 'libro9.png', 'lorem ipsum');

insert into productos (id, cliente_id, nombreProd, imagenProd, descripcion)
values (default, cliente_id, 'libro10', 'libro10.png', 'lorem ipsum');

    /*SQL comentarios*/

insert into comentarios (id, producto_id, cliente_id, comentario)
values (default, producto_id, cliente_id, 'comentario 1');

insert into comentarios (id, producto_id, cliente_id, comentario)
values (default, producto_id, cliente_id, 'comentario 2');

insert into comentarios (id, producto_id, cliente_id, comentario)
values (default, producto_id, cliente_id, 'comentario 3');