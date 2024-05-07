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
values (default, 'chiarafelipe@gmail.com', 'cmfrg', '123456', "2005/09/19", 46291301, "https://i.pinimg.com/736x/a3/ea/87/a3ea878f893e55ad8a0c1b59258885ee.jpg" );

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
values (default, 4, 'El camino del despertar', 'https://http2.mlstatic.com/D_NQ_NP_650583-MLU74378755634_022024-V.webp', 'Muchas veces anhelamos experimentar un mayor nivel de salud, prosperidad y felicidad y, sin embargo, somos de alguna manera conscientes de que, a menos que cambiemos algo muy profundo en nuestra forma de ser, no vamos a poder alcanzar semejante meta. En EL CAMINO DEL DESPERTAR, el doctor Mario Alonso Puig nos propone embarcarnos en un proceso de transformación que nos permita superar esas limitaciones físicas, mentales y anímicas que, operando desde dimensiones ocultas de nuestra mente, no nos están permitiendo vivir en plenitud. Para lograr esto, se vale de la metáfora del Camino del Héroe y de las implicaciones que tiene en nuestra forma de relacionarnos con los desafíos a los que nos enfrentamos. Conectando dicho Camino con algunos de los descubrimientos más fascinantes que se han hecho acerca del funcionamiento del cerebro, de la naturaleza de la realidad y de la manera en la que nuestra mente determina lo que percibimos, EL CAMINO DEL DESPERTAR nos proporciona la inspiración y la estrategia necesarias para que podamos vivir de acuerdo a nuestras verdaderas posibilidades. Un libro inspirador, un viaje de descubrimiento y transformación. Una obra decisiva para convertirnos en la persona que siempre anhelamos ser y que potencialmente ya somos.');

insert into productos (id, clienteId, nombreProd, imagenProd, descripcion)
values (default, 3, 'La Felicidad', 'https://http2.mlstatic.com/D_NQ_NP_758457-MLU75135654463_032024-V.webp', "Como imposible y como quimera, como fin y también como imperativo, la idea de la felicidad nos interpela más que nunca en los tiempos que corren. ¿Cómo ser felices?, esa sentencia que nos sobrevuela como mandato del mundo moderno se impuso para encandilarnos y hacernos perder de vista aquella que debería ser la pregunta nodal: ¿Qué es la felicidad? .En su nuevo libro, Gabriel Rolón nos propone desandar el camino. Desarticular lugares comunes y preconceptos para poner en evidencia qué se esconde más allá de esa ilusión que se vende como panacea y no es más que una trampa. Entre el Psicoanálisis y el arte, entre la filosofía y la literatura, despliega entonces su hoja de ruta, un mapa de lecturas que van de la mitología clásica a Byung-Chul Han, pasando por Freud, Lacan, Borges, Nietzsche, Schopenhauer, Einstein, Alejandro Dolina, Ana Frank, Bertrand Russell y Comte-Sponville, entre muchas otras.Una vez más, como en sus trabajos anteriores y fiel a ese estilo que lo llevó a ser uno de los autores más leídos de las últimas décadas, Rolón nos invita a pensar a contrapelo de las modas ligeras. Y es ahí, en esa zona incómoda y a la vez anhelante de vida, donde La felicidad se vuelve un ensayo indispensable, lúcido, humano.");

insert into productos (id, clienteId, nombreProd, imagenProd, descripcion)
values (default, 2, 'Crimen y Castigo', 'https://http2.mlstatic.com/D_NQ_NP_2X_722940-MLA52573759857_112022-F.webp', "Crimen y castigo es una novela de carácter psicológico escrita por el autor ruso Fiódor Dostoievski. Fue publicada por primera vez en la revista El mensajero Ruso, en 1866, en doce partes, y publicada después como novela.");

insert into productos (id, clienteId, nombreProd, imagenProd, descripcion)
values (default, 4, 'Alas de sangre', 'https://http2.mlstatic.com/D_NQ_NP_849364-MLU72972407903_112023-V.webp', "Bestseller del New York Times  'Un dragón sin su jinete es una tragedia. Un jinete sin su dragón está muerto.' Artículo uno, sección uno del Código de jinetes de dragones Violet Sorrengail creía que a sus veinte años se uniría al Cuadrante de los Escribas para vivir una vida tranquila, estudiando sus amados libros y las historias antiguas que tanto le fascinan. Sin embargo, por órdenes de su madre, la temida comandante general, Violet debe unirse a los miles de candidatos que luchan por formar parte de la élite de Navarre: los jinetes de dragones. Cuando eres más pequeña y frágil que los demás tu vida corre peligro, porque los dragones no se vinculan con humanos débiles; de hecho, los incineran. Sumado a esto, con más jinetes que dragones disponibles, buena parte de los candidatos mataría a Violet con tal de mejorar sus probabilidades de éxito; otros, como el despiadado Xaden Riorson, el líder de ala más poderoso del Cuadrante, la asesinarían simplemente por ser la hija de la comandante general. Para sobrevivir, necesitará aprovechar al máximo todo su ingenio. Día tras día, la guerra que se libra al exterior del Colegio se torna más letal, las defensas del reino se debilitan y los muertos aumentan. Por si fuera poco, Violet sospecha que los líderes de Navarre esconden un terrible secreto. Amistad, rivalidad y pasión... en el Colegio de Guerra de Basgiath todos tienen una agenda oculta y saben que una vez adentro solo hay dos posibilidades: graduarse o morir.'");

insert into productos (id, clienteId, nombreProd, imagenProd, descripcion)
values (default, 1, 'Hábitos Atómicos', 'https://http2.mlstatic.com/D_NQ_NP_673885-MLA54040457764_022023-V.webp', 'HÁBITOS ATÓMICOS parte de una simple pero poderosa pregunta: ¿Cómo podemos vivir mejor? Sabemos que unos buenos hábitos nos permiten mejorar significativamente nuestra vida, pero con frecuencia nos desviamos del camino: dejamos de hacer ejercicio, comemos mal, dormimos poco, despilfarramos. ¿Por qué es tan fácil caer en los malos hábitos y tan complicado seguir los buenos? James Clear nos brinda fantásticas ideas basadas en investigaciones científicas, que le permiten revelarnos cómo podemos transformar pequeños hábitos cotidianos para cambiar nuestra vida y mejorarla. Esta guía pone al descubierto las fuerzas ocultas que moldean nuestro comportamiento —desde nuestra mentalidad, pasando por el ambiente y hasta la genética— y nos demuestra cómo aplicar cada cambio a nuestra vida y a nuestro trabajo. Después de leer este libro, tendrás un método sencillo para desarrollar un sistema eficaz que te conducirá al éxito.');

insert into productos (id, clienteId, nombreProd, imagenProd, descripcion)
values (default, 1, 'Destroza este diario', 'https://http2.mlstatic.com/D_NQ_NP_655528-MLU74053078727_012024-V.webp', 'Puede que seas un experto destrozador y que hayas devorado uno o varios ejemplares de Destroza este diario. O tal vez esta sea tu primera vez (puede que esta experiencia te cambie la vida). Sea como sea, no busques más, has encontrado el libro perfecto para destrozar. Te presentamos el nuevo Destroza este diario, ¡ahora en una impresionante edición a todo color! Dentro encontrarás retos para pintar, romper, transformar y dar rienda suelta a tu creatividad; una mezcla de tus retos favoritos y otros completamente nuevos. Destroza este diario. Ahora a todo color te invita a destrozar en colores: mezcla pinturas para crear barro, deja que la suerte elija el tono, recorta tiras de papel de brillantes colores, y mucho más. ¿Qué colores usarás para destrozar tu diario?');

insert into productos (id, clienteId, nombreProd, imagenProd, descripcion)
values (default, 3, 'Artificial', 'https://http2.mlstatic.com/D_NQ_NP_701372-MLU71679031011_092023-V.webp', 'Este no es un libro de oráculos o vaticinios, sino las reflexiones de dos autores que consideran que estar informados es la mejor forma de navegar la indefectible ola de la inteligencia artificial. En una conversación tan lúcida como estimulante, el neurocientífico best seller Mariano Sigman y el emprendedor y tecnólogo Santiago Bilinkis repasan el origen, la utilidad y los riesgos de esta tecnología. ¿Será una lámpara de Aladino o una caja de Pandora? ¿Cómo acercarnos al mejor escenario? ¿Estamos caminando al borde del precipicio? ¿Daremos más valor a lo que haya sido creado por personas? ¿Qué ocurrirá si la inteligencia artificial encuentra aquello en lo que somos más débiles? Si bien exponen las razones por las que debemos ser cautos y responsables, huyen del pesimismo y nos invitan a pensar que de este desafío podemos sacar nuestra mejor versión.');

insert into productos (id, clienteId, nombreProd, imagenProd, descripcion)
values (default, 5, 'Zensorial', 'https://http2.mlstatic.com/D_NQ_NP_858091-MLU72548176978_112023-V.webp', '¿Alguna vez escuchaste la expresión ¿El cuerpo no miente?¿Por qué durante estas últimas décadas estuvimos más interesados en los misterios del cerebro y no de nuestro verdadero templo único, nuestro cuerpo? Luego de años de dedicarme al estudio del cerebro, me di cuenta de que nos faltaba algo: aprender a sentir lo que sentimos. La experiencia de nuestra experiencia. Escuchar, registrar y entender a nuestro cuerpo y su relación con el cerebro. ZensorialMente es la bitácora para que fortalezcas entonces la inteligencia que te falta, tu inteligencia sensorial: el vehículo fundamental para que aprendas cómo tus sentidos internos distribuidos por todo tu cuerpo se relacionan con el afuera y le envían información al cerebro. La sensación es tu primer sentido en desarrollarse y junto con el movimiento son los datos crudos que tu cuerpo aporta para construir tus emociones y tu realidad. Pensá en las sensaciones como la banda de sonido de una película. Tienen el poder de hacerte sentir feliz, triste, esperanzado o al límite. Te propongo seis movimientos a través de los cuales sentir tu cuerpo. Cuando desarrolles el poder de entenderlos y distinguirlos, podrás habitar un estado de calma atenta, uno de los pilares de la filosofía zen. Así tus acciones serán guiadas mucho más por tu intuición que por tu esfuerzo consciente. Solo necesitás dejar que tu cuerpo, esta vez, sea tu cerebro.');

insert into productos (id, clienteId, nombreProd, imagenProd, descripcion)
values (default, 3, 'Piense y hágase rico', 'https://http2.mlstatic.com/D_NQ_NP_843453-MLU72522559580_102023-V.webp', 'Es así de sencillo: la riqueza y la realización personal están al alcance de todas aquellas personas que lo desean; basta simplemente con desvelar un secreto, el secreto del éxito. Napoleon Hill aprendió este secreto del famoso industrial, filántropo y escritor Andreus Carnegie, y lo sistematizó para hacerlo accesible en Piense y hágase rico. Reseña: «Un libro excelente. Si aprendes a hacer que el dinero trabaje para ti, tu vida será más sencilla y feliz.» Robert Kiyosaki');

insert into productos (id, clienteId, nombreProd, imagenProd, descripcion)
values (default, 1, 'Taylor. From the Vault.', 'https://http2.mlstatic.com/D_NQ_NP_692783-MLU72590153693_102023-V.webp', 'Por primera vez, Taylor llega a Latinoamérica y es un punto de inflexión para toda una generación que lleva años esperando disfrutar de sus canciones en vivo y poder tenerla cerca. Por fin llegó lo que tanto deseábamos y nos gustaría tener una enorme caja fuerte para guardar este momento tan valioso, un espacio seguro para conservar nuestros recuerdos más preciados para siempre. Estas páginas intentan convertirse en ese rincón para preservar las mejores eras vividas. Tal vez sirva para mostrarles a los pocos que no la conocen, o a quienes nos sucedan, por qué Taylor es tan extraordinaria, talentosa, poderosa y a la vez tan cercana. Porque sus letras nos identifican y nos acompañan en cada momento de nuestras vidas y seguimos su legado para que su brillo continúe eternamente.');

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
