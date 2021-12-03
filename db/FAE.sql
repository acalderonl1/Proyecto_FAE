
drop index AK1_AUDITORIA;

drop table AUDITORIA;

drop index AK2_COMEDOR;

drop index AK1_COMEDOR;

drop table COMEDOR;

drop index AK2_GRADO;

drop index AK1_GRADO;

drop table GRADO;

drop index AK2_MENU;

drop index AK1_MENU;

drop table MENU;

drop index AK2_MENUDIA;

drop index AK1_MENUDIA;

drop table MENUDIA;

drop index AK4_PERSONA;

drop index AK3_PERSONA;

drop index AK2_PERSONA;

drop index AK1_PERSONA;

drop table PERSONA;

drop index AK2_REPARTO;

drop index AK1_REPARTO;

drop table REPARTO;

drop index AK1_RESERVA;

drop table RESERVA;

drop index AK2_ROL;

drop index AK1_ROL;

drop table ROL;

drop index AK2_TIPORANCHO;

drop index AK1_TIPORANCHO;

drop table TIPORANCHO;

drop index AK2_UNIDAD;

drop index AK1_UNIDAD;

drop table UNIDAD;

drop index AK2_USUARIO;

drop index AK1_USUARIO;

drop table USUARIO;

drop index AK1_USUARIOREPARTO;

drop table USUARIOREPARTO;

drop index AK2_USUARIOROL;

drop index AK1_USUARIOROL;

drop table USUARIOROL;

DROP TABLE comedor CASCADE;

DROP TABLE grado CASCADE;

DROP TABLE menu CASCADE;

DROP TABLE menudia CASCADE;

DROP TABLE persona CASCADE;

DROP TABLE reparto CASCADE;

DROP TABLE rol CASCADE;

DROP TABLE tiporancho CASCADE;

DROP TABLE unidad CASCADE;

DROP TABLE usuario CASCADE;



/*==============================================================*/
/* Table: AUDITORIA                                             */
/*==============================================================*/
create table AUDITORIA (
   IDAUDITORIA          SERIAL               not null,
   USUARIO              VARCHAR(100)          not null,
   ACCION               CHAR                 null,
   REGISTRO             VARCHAR(500)         null,
   UTC                  TIMESTAMP            not null	default now(),
   constraint PK_AUDITORIA primary key (IDAUDITORIA)
);

/*==============================================================*/
/* Index: AK1_AUDITORIA                                         */
/*==============================================================*/
create unique index AK1_AUDITORIA on AUDITORIA (
IDAUDITORIA
);

/*==============================================================*/
/* Table: COMEDOR                                               */
/*==============================================================*/
create table COMEDOR (
   IDCOMEDOR            SERIAL               not null,
   IDREPARTO            INT4                 not null,
   NOMBRE               VARCHAR(100)         not null,
   ESTADO               CHAR                 not null,
   UTC                  TIMESTAMP            not null	default now(),
   constraint PK_COMEDOR primary key (IDCOMEDOR)
);

/*==============================================================*/
/* Index: AK1_COMEDOR                                           */
/*==============================================================*/
create unique index AK1_COMEDOR on COMEDOR (
IDCOMEDOR
);

/*==============================================================*/
/* Index: AK2_COMEDOR                                           */
/*==============================================================*/
create  index AK2_COMEDOR on COMEDOR (
IDREPARTO,
NOMBRE,
ESTADO
);

/*==============================================================*/
/* Table: GRADO                                                 */
/*==============================================================*/
create table GRADO (
   IDGRADO              SERIAL               not null,
   NOMBRE               VARCHAR(25)          not null,
   NOMBRECORTO          VARCHAR(15)           not null,
   UTC                  TIMESTAMP            not null default now(),
   constraint PK_GRADO primary key (IDGRADO)
);

/*==============================================================*/
/* Index: AK1_GRADO                                             */
/*==============================================================*/
create unique index AK1_GRADO on GRADO (
IDGRADO
);

/*==============================================================*/
/* Index: AK2_GRADO                                             */
/*==============================================================*/
create  index AK2_GRADO on GRADO (
NOMBRE
);

/*==============================================================*/
/* Table: MENU                                                  */
/*==============================================================*/
create table MENU (
   IDMENU               SERIAL               not null,
   DESCRIPCION          VARCHAR(200)         not null,
   UTC                  TIMESTAMP            not null	default now(),
   constraint PK_MENU primary key (IDMENU)
);

/*==============================================================*/
/* Index: AK1_MENU                                              */
/*==============================================================*/
create unique index AK1_MENU on MENU (
IDMENU
);

/*==============================================================*/
/* Index: AK2_MENU                                              */
/*==============================================================*/
create  index AK2_MENU on MENU (
DESCRIPCION
);

/*==============================================================*/
/* Table: MENUDIA                                               */
/*==============================================================*/
create table MENUDIA (
   IDMENUDIA            SERIAL               not null,
   IDTIPORANCHO         INT4                 not null,
   IDMENU               INT4                 not null,
   IDCOMEDOR            INT4                 not null,
   FECHA                DATE                 not null,
   PRECIO               DECIMAL(5,4)         not null,
   ESTADO               CHAR                 not null,
   UTC                  TIMESTAMP            not null	default now(),
   constraint PK_MENUDIA primary key (IDMENUDIA)
);

/*==============================================================*/
/* Index: AK1_MENUDIA                                           */
/*==============================================================*/
create unique index AK1_MENUDIA on MENUDIA (
IDMENUDIA
);

/*==============================================================*/
/* Index: AK2_MENUDIA                                           */
/*==============================================================*/
create  index AK2_MENUDIA on MENUDIA (
IDTIPORANCHO,
FECHA
);

/*==============================================================*/
/* Table: PERSONA                                               */
/*==============================================================*/

create table PERSONA (
   IDPERSONA            SERIAL               not null,
   IDREPARTO            INT4                 not null,
   IDGRADO              INT4                 not null,
   NOMBRES              VARCHAR(100)         not null,
   TELEFONO             VARCHAR(15)          not null,
   CORREO               VARCHAR(100)          not null,
   SEXO                 CHAR                 not null,
   DNI                  VARCHAR(10)          not null,
   ESTADO               CHAR                 not null,
   UTC                  TIMESTAMP            not null default now(),
   constraint PK_PERSONA primary key (IDPERSONA)
);

/*==============================================================*/
/* Index: AK1_PERSONA                                           */
/*==============================================================*/
create unique index AK1_PERSONA on PERSONA (
IDPERSONA
);

/*==============================================================*/
/* Index: AK2_PERSONA                                           */
/*==============================================================*/
create  index AK2_PERSONA on PERSONA (
IDPERSONA,
IDGRADO
);

/*==============================================================*/
/* Index: AK3_PERSONA                                           */
/*==============================================================*/
create  index AK3_PERSONA on PERSONA (
IDPERSONA,
IDREPARTO,
ESTADO
);

/*==============================================================*/
/* Index: AK4_PERSONA                                           */
/*==============================================================*/
create  index AK4_PERSONA on PERSONA (
DNI
);

/*==============================================================*/
/* Table: REPARTO                                               */
/*==============================================================*/
create table REPARTO (
   IDREPARTO            SERIAL               not null,
   IDUNIDAD             INT4                 not null,
   UTC                  TIMESTAMP            not null	default now(),
   NOMBRE               VARCHAR(75)          not null,
   CODIGO               VARCHAR(5)           not null,
   constraint PK_REPARTO primary key (IDREPARTO)
);

/*==============================================================*/
/* Index: AK1_REPARTO                                           */
/*==============================================================*/
create unique index AK1_REPARTO on REPARTO (
IDREPARTO
);

/*==============================================================*/
/* Index: AK2_REPARTO                                           */
/*==============================================================*/
create unique index AK2_REPARTO on REPARTO (
NOMBRE,
IDUNIDAD
);

/*==============================================================*/
/* Table: RESERVA                                               */
/*==============================================================*/
create table RESERVA (
   IDRESERVA            SERIAL               not null,
   IDMENUDIA            INT4                 not null,
   IDPERSONA            INT4                 not null,
   ESTADO               CHAR                 not null,
   CANTIDAD             DECIMAL(5,4)         not null,
   UTC                  TIMESTAMP            not null	default now(),
   constraint PK_RESERVA primary key (IDRESERVA)
);

/*==============================================================*/
/* Index: AK1_RESERVA                                           */
/*==============================================================*/
create unique index AK1_RESERVA on RESERVA (
IDRESERVA
);

/*==============================================================*/
/* Table: ROL                                                   */
/*==============================================================*/
create table ROL (
   IDROL                SERIAL               not null,
   NOMBRE               VARCHAR(50)          not null,
   ESTADO               CHAR                 not null,
   UTC                  TIMESTAMP            not null	default now(),
   constraint PK_ROL primary key (IDROL)
);

/*==============================================================*/
/* Index: AK1_ROL                                               */
/*==============================================================*/
create unique index AK1_ROL on ROL (
IDROL
);

/*==============================================================*/
/* Index: AK2_ROL                                               */
/*==============================================================*/
create  index AK2_ROL on ROL (
NOMBRE,
ESTADO
);

/*==============================================================*/
/* Table: TIPORANCHO                                            */
/*==============================================================*/
create table TIPORANCHO (
   IDTIPORANCHO         SERIAL               not null,
   NOMBRE               VARCHAR(100)         not null,
   ESTADO               CHAR                 not null,
   UTC                  TIMESTAMP            not null	default now(),
   constraint PK_TIPORANCHO primary key (IDTIPORANCHO)
);

/*==============================================================*/
/* Index: AK1_TIPORANCHO                                        */
/*==============================================================*/
create unique index AK1_TIPORANCHO on TIPORANCHO (
IDTIPORANCHO
);

/*==============================================================*/
/* Index: AK2_TIPORANCHO                                        */
/*==============================================================*/
create  index AK2_TIPORANCHO on TIPORANCHO (
NOMBRE,
ESTADO
);

/*==============================================================*/
/* Table: UNIDAD                                                */
/*==============================================================*/
create table UNIDAD (
   IDUNIDAD             SERIAL               not null,
   UTC                  TIMESTAMP            not null default NOW(),
   NOMBRE               VARCHAR(50)          not null,
   CODIGO               VARCHAR(5)           not null,
   constraint PK_UNIDAD primary key (IDUNIDAD)
);

/*==============================================================*/
/* Index: AK1_UNIDAD                                            */
/*==============================================================*/
create unique index AK1_UNIDAD on UNIDAD (
IDUNIDAD
);

/*==============================================================*/
/* Index: AK2_UNIDAD                                            */
/*==============================================================*/
create  index AK2_UNIDAD on UNIDAD (
NOMBRE,
CODIGO
);

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO (
   IDUSUARIO            SERIAL               not null,
   IDPERSONA            INT4                 not null,
   USERNAME             VARCHAR(50)          not null,
   PASSWORD             VARCHAR(500)         not null,
   ESTADO               CHAR                 null,
   UTC                  TIMESTAMP            not null	default now(),
   constraint PK_USUARIO primary key (IDUSUARIO)
);

/*==============================================================*/
/* Index: AK1_USUARIO                                           */
/*==============================================================*/
create unique index AK1_USUARIO on USUARIO (
IDUSUARIO
);

/*==============================================================*/
/* Index: AK2_USUARIO                                           */
/*==============================================================*/
create  index AK2_USUARIO on USUARIO (
IDPERSONA,
ESTADO
);

/*==============================================================*/
/* Table: USUARIOREPARTO                                        */
/*==============================================================*/
create table USUARIOREPARTO (
   IDUSUARIOREPARTO     SERIAL               not null,
   IDUSUARIO            INT4                 not null,
   IDREPARTO            INT4                 not null,
   UTC                  TIMESTAMP            not null	default now(),
   constraint PK_USUARIOREPARTO primary key (IDUSUARIOREPARTO)
);

/*==============================================================*/
/* Index: AK1_USUARIOREPARTO                                    */
/*==============================================================*/
create unique index AK1_USUARIOREPARTO on USUARIOREPARTO (
IDUSUARIOREPARTO
);

/*==============================================================*/
/* Table: USUARIOROL                                            */
/*==============================================================*/
create table USUARIOROL (
   IDUSUARIOROL         SERIAL               not null,
   IDUSUARIO            INT4                 not null,
   IDROL                INT4                 not null,
   ESTADO               CHAR                 not null,
   UTC                  TIMESTAMP            not null	default now(),
   constraint PK_USUARIOROL primary key (IDUSUARIOROL)
);

/*==============================================================*/
/* Index: AK1_USUARIOROL                                        */
/*==============================================================*/
create unique index AK1_USUARIOROL on USUARIOROL (
IDUSUARIOROL
);

/*==============================================================*/
/* Index: AK2_USUARIOROL                                        */
/*==============================================================*/
create  index AK2_USUARIOROL on USUARIOROL (
ESTADO,
IDUSUARIO,
IDROL
);

alter table COMEDOR
   add constraint FK_COMEDOR_REPARTO foreign key (IDREPARTO)
      references REPARTO (IDREPARTO)
      on delete restrict on update restrict;

alter table MENUDIA
   add constraint FK_MENUDIA_COMEDOR foreign key (IDCOMEDOR)
      references COMEDOR (IDCOMEDOR)
      on delete restrict on update restrict;

alter table MENUDIA
   add constraint FK_MENUDIA_MENU foreign key (IDMENU)
      references MENU (IDMENU)
      on delete restrict on update restrict;

alter table MENUDIA
   add constraint FK_MENUDIA_TIPORANCHO foreign key (IDTIPORANCHO)
      references TIPORANCHO (IDTIPORANCHO)
      on delete restrict on update restrict;

alter table PERSONA
   add constraint FK_PERSONA_GRADO foreign key (IDGRADO)
      references GRADO (IDGRADO)
      on delete restrict on update restrict;

alter table PERSONA
   add constraint FK_PERSONA_REPARTO foreign key (IDREPARTO)
      references REPARTO (IDREPARTO)
      on delete restrict on update restrict;

alter table REPARTO
   add constraint FK_REPARTO_UNIDAD foreign key (IDUNIDAD)
      references UNIDAD (IDUNIDAD)
      on delete restrict on update restrict;

alter table RESERVA
   add constraint FK_RESERVA_MENUDIA foreign key (IDMENUDIA)
      references MENUDIA (IDMENUDIA)
      on delete restrict on update restrict;

alter table RESERVA
   add constraint FK_RESERVA_PERSONA foreign key (IDPERSONA)
      references PERSONA (IDPERSONA)
      on delete restrict on update restrict;

alter table USUARIO
   add constraint FK_USUARIO_PERSONA foreign key (IDPERSONA)
      references PERSONA (IDPERSONA)
      on delete restrict on update restrict;

alter table USUARIOREPARTO
   add constraint FK_USUARIOREPARTO_REPARTO foreign key (IDREPARTO)
      references REPARTO (IDREPARTO)
      on delete restrict on update restrict;

alter table USUARIOREPARTO
   add constraint FK_USUARIOREPARTO_USUARIO foreign key (IDUSUARIO)
      references USUARIO (IDUSUARIO)
      on delete restrict on update restrict;

alter table USUARIOROL
   add constraint FK_USUARIOROL_ROL foreign key (IDROL)
      references ROL (IDROL)
      on delete restrict on update restrict;

alter table USUARIOROL
   add constraint FK_USUARIOROL_USUARIO foreign key (IDUSUARIO)
      references USUARIO (IDUSUARIO)
      on delete restrict on update restrict;