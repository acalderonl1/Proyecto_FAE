
   drop index AK1_AUDITORIA CASCADE;

   drop table AUDITORIA CASCADE;

   drop index AK2_COMEDOR CASCADE;

   drop index AK1_COMEDOR CASCADE;

   drop table COMEDOR CASCADE;

   drop index AK2_GRADO CASCADE;

   drop index AK1_GRADO CASCADE; 

   drop table GRADO CASCADE;

   drop index AK2_MENU CASCADE;

   drop index AK1_MENU CASCADE;

   drop table MENU CASCADE;

   drop index AK2_MENUDIA CASCADE;

   drop index AK1_MENUDIA CASCADE;

   drop table MENUDIA CASCADE;

   drop index AK4_PERSONA CASCADE;

   drop index AK3_PERSONA CASCADE;

   drop index AK2_PERSONA CASCADE;

   drop index AK1_PERSONA CASCADE;

   drop table PERSONA CASCADE;

   drop index AK2_REPARTO CASCADE;

   drop index AK1_REPARTO CASCADE;

   drop table REPARTO CASCADE;

   drop index AK1_RESERVA CASCADE;

   drop table RESERVA CASCADE;

   drop index AK2_ROL CASCADE;

   drop index AK1_ROL CASCADE;

   drop table ROL CASCADE;

   drop index AK2_TIPORANCHO CASCADE;

   drop index AK1_TIPORANCHO CASCADE;

   drop table TIPORANCHO CASCADE;

   drop index AK2_UNIDAD CASCADE;

   drop index AK1_UNIDAD CASCADE;

   drop table UNIDAD CASCADE;

   drop index AK2_USUARIO CASCADE;

   drop index AK1_USUARIO CASCADE;

   drop table USUARIO CASCADE;

   drop index AK1_USUARIOREPARTO CASCADE;

   drop table USUARIOREPARTO CASCADE;

   drop index AK2_USUARIOROL CASCADE;

   drop index AK1_USUARIOROL CASCADE;

   drop table USUARIOROL CASCADE;

   DROP TABLE comedor CASCADE CASCADE;

   -- DROP TABLE grado CASCADE;

   -- DROP TABLE menu CASCADE;

   -- DROP TABLE menudia CASCADE;

   -- DROP TABLE persona CASCADE;

   -- DROP TABLE reparto CASCADE;

   -- DROP TABLE rol CASCADE;

   -- DROP TABLE tiporancho CASCADE;

   -- DROP TABLE unidad CASCADE;

   -- DROP TABLE usuario CASCADE;



   /*==============================================================*/
   /* Table: AUDITORIA                                             */
   /*==============================================================*/
   create table AUDITORIAS (
      IDAUDITORIA          SERIAL               not null,
      USUARIO              VARCHAR(100)          not null,
      ACCION               CHAR                 null,
      REGISTRO             VARCHAR(500)         null,
      UTC                  TIMESTAMP            not null	default now(),
      constraint PK_AUDITORIA primary key (IDAUDITORIAS)
   );

   /*==============================================================*/
   /* Index: AK1_AUDITORIA                                         */
   /*==============================================================*/
   create unique index AK1_AUDITORIA on AUDITORIAS (
   IDAUDITORIA
   );

   /*==============================================================*/
   /* Table: COMEDOR                                               */
   /*==============================================================*/
   create table COMEDORES (
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
   create unique index AK1_COMEDOR on COMEDORES (
   IDCOMEDOR
   );

   /*==============================================================*/
   /* Index: AK2_COMEDOR                                           */
   /*==============================================================*/
   create  index AK2_COMEDOR on COMEDORES (
   IDREPARTO,
   NOMBRE,
   ESTADO
   );

   /*==============================================================*/
   /* Table: GRADO                                                 */
   /*==============================================================*/
   create table GRADOS (
      IDGRADO              SERIAL               not null,
      NOMBRE               VARCHAR(25)          not null,
      NOMBRECORTO          VARCHAR(15)           not null,
      UTC                  TIMESTAMP            not null default now(),
      constraint PK_GRADO primary key (IDGRADO)
   );

   /*==============================================================*/
   /* Index: AK1_GRADO                                             */
   /*==============================================================*/
   create unique index AK1_GRADO on GRADOS (
   IDGRADO
   );

   /*==============================================================*/
   /* Index: AK2_GRADO                                             */
   /*==============================================================*/
   create  index AK2_GRADO on GRADOS (
   NOMBRE
   );

   /*==============================================================*/
   /* Table: MENU                                                  */
   /*==============================================================*/
   create table MENUS (
      IDMENU               SERIAL               not null,
      DESCRIPCION          VARCHAR(200)         not null,
      UTC                  TIMESTAMP            not null	default now(),
      constraint PK_MENU primary key (IDMENU)
   );

   /*==============================================================*/
   /* Index: AK1_MENU                                              */
   /*==============================================================*/
   create unique index AK1_MENU on MENUS (
   IDMENU
   );

   /*==============================================================*/
   /* Index: AK2_MENU                                              */
   /*==============================================================*/
   create  index AK2_MENUS on MENUS (
   DESCRIPCION
   );

   /*==============================================================*/
   /* Table: MENUDIA                                               */
   /*==============================================================*/
   create table MENUDIAS (
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
   create unique index AK1_MENUDIA on MENUDIAS (
   IDMENUDIA
   );

   /*==============================================================*/
   /* Index: AK2_MENUDIA                                           */
   /*==============================================================*/
   create  index AK2_MENUDIA on MENUDIAS (
   IDTIPORANCHO,
   FECHA
   );

   /*==============================================================*/
   /* Table: PERSONA                                               */
   /*==============================================================*/

   create table PERSONAS (
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
   create unique index AK1_PERSONA on PERSONAS (
   IDPERSONA
   );

   /*==============================================================*/
   /* Index: AK2_PERSONA                                           */
   /*==============================================================*/
   create  index AK2_PERSONA on PERSONAS (
   IDPERSONA,
   IDGRADO
   );

   /*==============================================================*/
   /* Index: AK3_PERSONA                                           */
   /*==============================================================*/
   create  index AK3_PERSONA on PERSONAS (
   IDPERSONA,
   IDREPARTO,
   ESTADO
   );

   /*==============================================================*/
   /* Index: AK4_PERSONA                                           */
   /*==============================================================*/
   create  index AK4_PERSONA on PERSONAS (
   DNI
   );

   /*==============================================================*/
   /* Table: REPARTO                                               */
   /*==============================================================*/
   create table REPARTOS (
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
   create unique index AK1_REPARTO on REPARTOS (
   IDREPARTO
   );

   /*==============================================================*/
   /* Index: AK2_REPARTO                                           */
   /*==============================================================*/
   create unique index AK2_REPARTO on REPARTOS (
   NOMBRE,
   IDUNIDAD
   );

   /*==============================================================*/
   /* Table: RESERVA                                               */
   /*==============================================================*/
   create table RESERVAS (
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
   create unique index AK1_RESERVA on RESERVAS (
   IDRESERVA
   );

   /*==============================================================*/
   /* Table: ROL                                                   */
   /*==============================================================*/
   create table ROLES (
      IDROL                SERIAL               not null,
      NOMBRE               VARCHAR(50)          not null,
      ESTADO               CHAR                 not null,
      UTC                  TIMESTAMP            not null	default now(),
      constraint PK_ROL primary key (IDROL)
   );

   /*==============================================================*/
   /* Index: AK1_ROL                                               */
   /*==============================================================*/
   create unique index AK1_ROL on ROLES (
   IDROL
   );

   /*==============================================================*/
   /* Index: AK2_ROL                                               */
   /*==============================================================*/
   create  index AK2_ROL on ROLES (
   NOMBRE,
   ESTADO
   );

   /*==============================================================*/
   /* Table: TIPORANCHO                                            */
   /*==============================================================*/
   create table TIPORANCHOS (
      IDTIPORANCHO         SERIAL               not null,
      NOMBRE               VARCHAR(100)         not null,
      ESTADO               CHAR                 not null,
      UTC                  TIMESTAMP            not null	default now(),
      constraint PK_TIPORANCHO primary key (IDTIPORANCHO)
   );

   /*==============================================================*/
   /* Index: AK1_TIPORANCHO                                        */
   /*==============================================================*/
   create unique index AK1_TIPORANCHO on TIPORANCHOS (
   IDTIPORANCHO
   );

   /*==============================================================*/
   /* Index: AK2_TIPORANCHO                                        */
   /*==============================================================*/
   create  index AK2_TIPORANCHO on TIPORANCHOS (
   NOMBRE,
   ESTADO
   );

   /*==============================================================*/
   /* Table: UNIDAD                                                */
   /*==============================================================*/
   create table UNIDADES (
      IDUNIDAD             SERIAL               not null,
      UTC                  TIMESTAMP            not null default NOW(),
      NOMBRE               VARCHAR(50)          not null,
      CODIGO               VARCHAR(5)           not null,
      constraint PK_UNIDAD primary key (IDUNIDAD)
   );

   /*==============================================================*/
   /* Index: AK1_UNIDAD                                            */
   /*==============================================================*/
   create unique index AK1_UNIDAD on UNIDADES (
   IDUNIDAD
   );

   /*==============================================================*/
   /* Index: AK2_UNIDAD                                            */
   /*==============================================================*/
   create  index AK2_UNIDAD on UNIDADES (
   NOMBRE,
   CODIGO
   );

   /*==============================================================*/
   /* Table: USUARIO                                               */
   /*==============================================================*/
   create table USUARIOS (
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
   create unique index AK1_USUARIO on USUARIOS (
   IDUSUARIO
   );

   /*==============================================================*/
   /* Index: AK2_USUARIO                                           */
   /*==============================================================*/
   create  index AK2_USUARIO on USUARIOS (
   IDPERSONA,
   ESTADO
   );

   /*==============================================================*/
   /* Table: USUARIOREPARTO                                        */
   /*==============================================================*/
   create table USUARIOREPARTOS (
      IDUSUARIOREPARTO     SERIAL               not null,
      IDUSUARIO            INT4                 not null,
      IDREPARTO            INT4                 not null,
      UTC                  TIMESTAMP            not null	default now(),
      constraint PK_USUARIOREPARTO primary key (IDUSUARIOREPARTO)
   );

   /*==============================================================*/
   /* Index: AK1_USUARIOREPARTO                                    */
   /*==============================================================*/
   create unique index AK1_USUARIOREPARTO on USUARIOREPARTOS (
   IDUSUARIOREPARTO
   );

   /*==============================================================*/
   /* Table: USUARIOROL                                            */
   /*==============================================================*/
   create table USUARIOROLES (
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
   create unique index AK1_USUARIOROL on USUARIOROLES (
   IDUSUARIOROL
   );

   /*==============================================================*/
   /* Index: AK2_USUARIOROL                                        */
   /*==============================================================*/
   create  index AK2_USUARIOROL on USUARIOROLES (
   ESTADO,
   IDUSUARIO,
   IDROL
   );

   alter table COMEDORES
      add constraint FK_COMEDOR_REPARTO foreign key (IDREPARTO)
         references REPARTOS (IDREPARTO)
         on delete restrict on update restrict;

   alter table MENUDIAS
      add constraint FK_MENUDIA_COMEDOR foreign key (IDCOMEDOR)
         references COMEDORES (IDCOMEDOR)
         on delete restrict on update restrict;

   alter table MENUDIAS
      add constraint FK_MENUDIA_MENU foreign key (IDMENU)
         references MENUS (IDMENU)
         on delete restrict on update restrict;

   alter table MENUDIAS
      add constraint FK_MENUDIA_TIPORANCHO foreign key (IDTIPORANCHO)
         references TIPORANCHOS (IDTIPORANCHO)
         on delete restrict on update restrict;

   alter table PERSONAS
      add constraint FK_PERSONA_GRADO foreign key (IDGRADO)
         references GRADOS (IDGRADO)
         on delete restrict on update restrict;

   alter table PERSONAS
      add constraint FK_PERSONA_REPARTO foreign key (IDREPARTO)
         references REPARTOS (IDREPARTO)
         on delete restrict on update restrict;

   alter table REPARTOS
      add constraint FK_REPARTO_UNIDAD foreign key (IDUNIDAD)
         references UNIDADES (IDUNIDAD)
         on delete restrict on update restrict;

   alter table RESERVAS
      add constraint FK_RESERVA_MENUDIA foreign key (IDMENUDIA)
         references MENUDIAS (IDMENUDIA)
         on delete restrict on update restrict;

   alter table RESERVAS
      add constraint FK_RESERVA_PERSONA foreign key (IDPERSONA)
         references PERSONAS (IDPERSONA)
         on delete restrict on update restrict;

   alter table USUARIOS
      add constraint FK_USUARIO_PERSONA foreign key (IDPERSONA)
         references PERSONAS (IDPERSONA)
         on delete restrict on update restrict;

   alter table USUARIOREPARTOS
      add constraint FK_USUARIOREPARTO_REPARTO foreign key (IDREPARTO)
         references REPARTOS (IDREPARTO)
         on delete restrict on update restrict;

   alter table USUARIOREPARTOS
      add constraint FK_USUARIOREPARTO_USUARIO foreign key (IDUSUARIO)
         references USUARIOS (IDUSUARIO)
         on delete restrict on update restrict;

   alter table USUARIOROLES
      add constraint FK_USUARIOROL_ROL foreign key (IDROL)
         references ROLES (IDROL)
         on delete restrict on update restrict;

   alter table USUARIOROLES
      add constraint FK_USUARIOROL_USUARIO foreign key (IDUSUARIO)
         references USUARIOS (IDUSUARIO)
         on delete restrict on update restrict;