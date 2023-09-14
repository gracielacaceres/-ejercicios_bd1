/* Crear base de datos dbGamarraMarket */
DROP DATABASE IF EXISTS dbGamarraMarket; 
CREATE DATABASE dbGamarraMarket
DEFAULT CHARACTER SET utf8;

/* Poner en uso la base de datos dbGamarraMarket */
USE dbGamarraMarket;

/* Crear la tabla CLIENTE */
CREATE TABLE CLIENTE
(
    id int,
    tipo_documento char(3),
    numero_documento char(9),
    nombres varchar(60),
    apellidos varchar(90),
    email varchar(80),
    celular char(9),
    fecha_nacimiento date,
    activo bool,
    CONSTRAINT cliente_pk PRIMARY KEY (id)
);
/* Listar estructura de tabla CLIENTE */
SHOW COLUMNS IN CLIENTE;

/* Listar tablas existentes en la base de datos en uso */
SHOW TABLES;


/* Agregar columna estado civil */
ALTER TABLE CLIENTE
	ADD COLUMN estado_civil char(1);
    
    
/* Crear la tabla VENDEDOR */
CREATE TABLE VENDEDOR
(
    id int,
    tipo_documento char(3),
    numero_documento char(15),
    nombres varchar(60),
    apellidos varchar(90),
    salario decimal(8,2),
    celular char(9),
    email varchar(80),
    activo bool,
    CONSTRAINT Vendedor_pk PRIMARY KEY (id)
);
/* Listar estructura de tabla CLIENTE */
SHOW COLUMNS IN VENDEDOR;

CREATE TABLE VENTA
(
    id int,
    fecha_hora timestamp, 
    activo bool,
    cliente_id int,
    vendedor_id int,
    salario decimal(8,2),
    CONSTRAINT venta_pk PRIMARY KEY (id)
);
/* Listar estructura de tabla Venta */
SHOW COLUMNS IN VENTA;

CREATE TABLE VENTA_DETALLE
(
    id int,
    cantidad int,
    centa_id int,
    prenda_id int,
    
    CONSTRAINT Venta_detalle PRIMARY KEY (id)
);
SHOW COLUMNS IN VENTA_DETALLE;

CREATE TABLE PRENDA
(
    id int,
    descripcion varchar(90), 
    marca varchar(60),
    cantidad int,
    talla varchar(10),
    precio decimal(8,2),
    activo bool,
    CONSTRAINT Prenda_pk PRIMARY KEY (id)
);
SHOW COLUMNS IN PRENDA;
/* Listar tablas existentes en la base de datos en uso */
SHOW TABLES;
/* Crear relación VENTA_CLIENTE */
ALTER TABLE VENTA
	ADD CONSTRAINT VENTA_CLIENTE FOREIGN KEY (cliente_id)
    REFERENCES CLIENTE (id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
;
ALTER TABLE VENTA
	ADD CONSTRAINT VENTA_VENDEDOR FOREIGN KEY (vendedor_id)
    REFERENCES VENDEDOR (id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
;
ALTER TABLE VENTA_DETALLE
	ADD CONSTRAINT VENTA_DETALLE_PRENDA FOREIGN KEY (prenda_id)
    REFERENCES PRENDA (id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
;
ALTER TABLE VENTA_DETALLE
ADD COLUMN venta_id int;
ALTER TABLE VENTA_DETALLE
   ADD CONSTRAINT VENTA_VENTA_DETALLE FOREIGN KEY (venta_id)
	references VENTA (id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
;
/* Crear base de datos dbGamarraMarket */
DROP DATABASE IF EXISTS dbGamarraMarket; 
CREATE DATABASE dbGamarraMarket
DEFAULT CHARACTER SET utf8;

/* Poner en uso la base de datos dbGamarraMarket */
USE dbGamarraMarket;


/* Crear la tabla CLIENTE */
CREATE TABLE CLIENTE
(
    id int,
    tipo_documento char(3),
    numero_documento char(9),
    nombres varchar(60),
    apellidos varchar(90),
    email varchar(80),
    celular char(9),
    fecha_nacimiento date,
    activo bool,
    CONSTRAINT cliente_pk PRIMARY KEY (id)
);
/* Listar estructura de tabla CLIENTE */
SHOW COLUMNS IN CLIENTE;

/* Listar tablas existentes en la base de datos en uso */
SHOW TABLES;


/* Agregar columna estado civil */
ALTER TABLE CLIENTE
	ADD COLUMN estado_civil char(1);
/* Crear la tabla VENDEDOR */
CREATE TABLE VENDEDOR
(
    id int,
    tipo_documento char(3),
    numero_documento char(15),
    nombres varchar(60),
    apellidos varchar(90),
    salario decimal(8,2),
    celular char(9),
    email varchar(80),
    activo bool,
    CONSTRAINT Vendedor_pk PRIMARY KEY (id)
);
/* Listar estructura de tabla CLIENTE */
SHOW COLUMNS IN VENDEDOR;

CREATE TABLE VENTA
(
    id int,
    fecha_hora timestamp, 
    activo bool,
    cliente_id int,
    vendedor_id int,
    salario decimal(8,2),
    CONSTRAINT venta_pk PRIMARY KEY (id)
);
/* Listar estructura de tabla Venta */
SHOW COLUMNS IN VENTA;

CREATE TABLE VENTA_DETALLE
(
    id int,
    cantidad int,
    centa_id int,
    prenda_id int,
    
    CONSTRAINT Venta_detalle PRIMARY KEY (id)
);
SHOW COLUMNS IN VENTA_DETALLE;

CREATE TABLE PRENDA
(
    id int,
    descripcion varchar(90), 
    marca varchar(60),
    cantidad int,
    talla varchar(10),
    precio decimal(8,2),
    activo bool,
    CONSTRAINT Prenda_pk PRIMARY KEY (id)
);
SHOW COLUMNS IN PRENDA;

/* Listar tablas existentes en la base de datos en uso */
SHOW TABLES;
/* Crear relación VENTA_CLIENTE */
ALTER TABLE VENTA
	ADD CONSTRAINT VENTA_CLIENTE FOREIGN KEY (cliente_id)
    REFERENCES CLIENTE (id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
;
ALTER TABLE VENTA
	ADD CONSTRAINT VENTA_VENDEDOR FOREIGN KEY (vendedor_id)
    REFERENCES VENDEDOR (id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
;
ALTER TABLE VENTA_DETALLE
	ADD CONSTRAINT VENTA_DETALLE_PRENDA FOREIGN KEY (prenda_id)
    REFERENCES PRENDA (id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
;
ALTER TABLE VENTA_DETALLE
ADD COLUMN venta_id int;
ALTER TABLE VENTA_DETALLE
   ADD CONSTRAINT VENTA_VENTA_DETALLE FOREIGN KEY (venta_id)
	references VENTA (id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
;



/* Listar relaciones de tablas de la base de datos activa */
SELECT 
    i.constraint_name, k.table_name, k.column_name, 
    k.referenced_table_name, k.referenced_column_name
FROM 
    information_schema.TABLE_CONSTRAINTS i 
LEFT JOIN information_schema.KEY_COLUMN_USAGE k 
ON i.CONSTRAINT_NAME = k.CONSTRAINT_NAME 
WHERE i.CONSTRAINT_TYPE = 'FOREIGN KEY' 
AND i.TABLE_SCHEMA = DATABASE();
SHOW COLUMNS IN CLIENTE;
SHOW COLUMNS IN VENTA;
SHOW COLUMNS IN VENTA_DETALLE;
SHOW COLUMNS IN VENDEDOR;
SHOW COLUMNS IN PRENDA;