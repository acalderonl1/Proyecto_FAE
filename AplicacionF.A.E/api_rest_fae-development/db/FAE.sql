select * from reparto;
select * from unidad;
select * from grado;
select * from persona;

INSERT INTO grado (nombre, nombrecorto,utc)
values ('TBRP','TBRP','2021/12/2'),('Soldado','SOLD','2021/12/2');

INSERT INTO unidad (utc,)
VALUES ();
insert into persona values (1,2,3,'Mario','0961455148','arguellocalle@gmail.com','M','0953366986','');
insert into grado values (2,'TBRP','TBRP','2021/12/2'),(3,'Soldado','SOLD','2021/12/2');
insert into unidad values (1,'2021/12/2','Base Aerea Simon Bolivar','14b5');
insert into reparto values (1,1,'2021/12/2','Ala de combate #22','12t9'),
(2,1,'2021/12/2','COAD','QE78'),(3,1,'2021/12/2','COS_1','HJ78');




DROP TABLE IF EXISTS tb_grado;
DROP TABLE IF EXISTS tb_rol;
DROP TABLE IF EXISTS tb_usuario;

CREATE TABLE tb_grado (
    grado_id INT GENERATED ALWAYS AS IDENTITY,
    description VARCHAR(255) NOT NULL,
    PRIMARY KEY (grado_id)
);

CREATE TABLE tb_rol (
    rol_id INT GENERATED ALWAYS AS IDENTITY,
    tipo_user VARCHAR(255) NOT NULL,
    PRIMARY KEY (rol_id)
);

CREATE TABLE tb_usuario(
    user_id INT GENERATED ALWAYS AS IDENTITY,
    grado_id INT,
    rol_id INT,
    nombre VARCHAR(255) NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    cedula INT NOT NULL,
    unidad VARCHAR(255) NOT NULL,
    correo VARCHAR(255) NOT NULL,
    contrasena VARCHAR(255) NOT NULL,
    fecha_creacion TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    PRIMARY KEY (user_id),
    CONSTRAINT fk_grado
        FOREIGN KEY (grado_id)
            REFERENCES tb_grado(grado_id)
            ON DELETE CASCADE,

      CONSTRAINT fk_rol
        FOREIGN KEY (rol_id )
            REFERENCES tb_rol(rol_id)
            ON DELETE CASCADE
);

select * from tb_usuario;

--new table


DROP TABLE IF EXISTS tb_usuarios;

CREATE TABLE tb_usuarios(
    user_id INTEGER GENERATED ALWAYS AS IDENTITY,
    grado VARCHAR(255) NOT NULL,
    roL VARCHAR(255) NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    cedula INTEGER NOT NULL,
    unidad VARCHAR(255) NOT NULL,
    correo VARCHAR(255) NOT NULL,
    contrasena VARCHAR(255) NOT NULL,
    fecha_creacion TIMESTAMP NOT NULL DEFAULT NOW(),
    fecha_reserva TIMESTAMP,
    fecha_entrega TIMESTAMP,
    PRIMARY KEY (user_id),
);