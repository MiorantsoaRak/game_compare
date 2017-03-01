create table carte_graphique (
   idgraphique          serial               not null,
   constructeur         varchar(50)          null,
   model                varchar(200)         null,
   memoirededie         int2                 null,
   vrready              bool                 null,
   vram                 int2                 null,
   constraint pk_carte_graphique primary key (idgraphique)
);

/*==============================================================*/
/* Index: carte_graphique_pk                                    */
/*==============================================================*/
create unique index carte_graphique_pk on carte_graphique (
idgraphique
);

/*==============================================================*/
/* Table: configuration                                         */
/*==============================================================*/
create table configuration (
   idconf               serial               not null,
   idgraphique          int4                 null,
   processeur           varchar(250)         null,
   ram                  int2                 null,
   stockage             int2                 null,
   resolution           varchar(20)          null,
   os                   varchar(50)          null,
   constraint pk_configuration primary key (idconf)
);

/*==============================================================*/
/* Index: configuration_pk                                      */
/*==============================================================*/
create unique index configuration_pk on configuration (
idconf
);

/*==============================================================*/
/* Index: asso_config_graphique_fk                              */
/*==============================================================*/
create  index asso_config_graphique_fk on configuration (
idgraphique
);

/*==============================================================*/
/* Table: jeuxvideo                                             */
/*==============================================================*/
create table jeuxvideo (
   idjeux               serial               not null,
   idplateforme         int4                 not null,
   idtype               int4                 not null,
   idmode               int4                 not null,
   nomdujeux            varchar(255)         not null,
   datesortie           date                 null,
   editeur              varchar(255)         null,
   prixlancement        numeric(8)           null,
   restriction_age      int2                 null,
   tailledujeux         int4                 not null,
   constraint pk_jeuxvideo primary key (idjeux)
);

/*==============================================================*/
/* Index: jeuxvideo_pk                                          */
/*==============================================================*/
create unique index jeuxvideo_pk on jeuxvideo (
idjeux
);

/*==============================================================*/
/* Index: assoc_type_jeux_fk                                    */
/*==============================================================*/
create  index assoc_type_jeux_fk on jeuxvideo (
idtype
);

/*==============================================================*/
/* Index: plateforme_fk                                         */
/*==============================================================*/
create  index plateforme_fk on jeuxvideo (
idplateforme
);

/*==============================================================*/
/* Index: mode_fk                                               */
/*==============================================================*/
create  index mode_fk on jeuxvideo (
idmode
);

/*==============================================================*/
/* Table: mode_de_jeux                                          */
/*==============================================================*/
create table mode_de_jeux (
   idmode               serial               not null,
   libelle              varchar(50)          null,
   constraint pk_mode_de_jeux primary key (idmode)
);

/*==============================================================*/
/* Index: mode_de_jeux_pk                                       */
/*==============================================================*/
create unique index mode_de_jeux_pk on mode_de_jeux (
idmode
);

/*==============================================================*/
/* Table: plateforme_de_jeux                                    */
/*==============================================================*/
create table plateforme_de_jeux (
   idplateforme         serial               not null,
   libelle              varchar(50)          not null,
   constraint pk_plateforme_de_jeux primary key (idplateforme)
);

/*==============================================================*/
/* Index: plateforme_de_jeux_pk                                 */
/*==============================================================*/
create unique index plateforme_de_jeux_pk on plateforme_de_jeux (
idplateforme
);

/*==============================================================*/
/* Table: soustype                                              */
/*==============================================================*/
create table soustype (
   idmere               int4                 not null,
   idtype               int4                 not null,
   constraint pk_soustype primary key (idmere, idtype)
);

/*==============================================================*/
/* Index: sous_type_pk                                          */
/*==============================================================*/
create unique index sous_type_pk on soustype (
idmere,
idtype
);

/*==============================================================*/
/* Index: sous_type_fk                                          */
/*==============================================================*/
create  index sous_type_fk on soustype (
idmere
);

/*==============================================================*/
/* Index: sous_type2_fk                                         */
/*==============================================================*/
create  index sous_type2_fk on soustype (
idtype
);

/*==============================================================*/
/* Table: typejeux                                              */
/*==============================================================*/
create table typejeux (
   idtype               serial               not null,
   libelle              varchar(50)          not null,
   apropos              text                 not null,
   constraint pk_typejeux primary key (idtype)
);

/*==============================================================*/
/* Index: typejeux_pk                                           */
/*==============================================================*/
create unique index typejeux_pk on typejeux (
idtype
);

/*==============================================================*/
/* Table: utilisateur                                           */
/*==============================================================*/
create table utilisateur (
   idutilisateur        serial               not null,
   nom                  varchar(60)          not null,
   prenom               varchar(60)          not null,
   datenaissance        date                 not null,
   email                varchar(150)         not null,
   username             varchar(30)          null,
   password             varchar(50)          null,
   constraint pk_utilisateur primary key (idutilisateur)
);

/*==============================================================*/
/* Index: utilisateur_pk                                        */
/*==============================================================*/
create unique index utilisateur_pk on utilisateur (
idutilisateur
);

alter table configuration
   add constraint fk_configur_asso_conf_carte_gr foreign key (idgraphique)
      references carte_graphique (idgraphique)
      on delete restrict on update restrict;

alter table jeuxvideo
   add constraint fk_jeuxvide_assoc_typ_typejeux foreign key (idtype)
      references typejeux (idtype)
      on delete restrict on update restrict;

alter table jeuxvideo
   add constraint fk_jeuxvide_mode_mode_de_ foreign key (idmode)
      references mode_de_jeux (idmode)
      on delete restrict on update restrict;

alter table jeuxvideo
   add constraint fk_jeuxvide_plateform_platefor foreign key (idplateforme)
      references plateforme_de_jeux (idplateforme)
      on delete restrict on update restrict;

alter table soustype
   add constraint fk_soustype_sous_type_typejeux2 foreign key (idmere)
      references typejeux (idtype)
      on delete restrict on update restrict;

alter table soustype
   add constraint fk_soustype_sous_type_typejeux1 foreign key (idtype)
      references typejeux (idtype)
      on delete restrict on update restrict;

