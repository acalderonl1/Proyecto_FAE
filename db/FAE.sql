
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
