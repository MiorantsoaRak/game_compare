--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.5
-- Dumped by pg_dump version 9.4.5
-- Started on 2017-03-02 13:43:31

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 188 (class 3079 OID 11855)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2098 (class 0 OID 0)
-- Dependencies: 188
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 173 (class 1259 OID 43285)
-- Name: carte_graphique; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE carte_graphique (
    idgraphique integer NOT NULL,
    constructeur character varying(50),
    model character varying(200),
    memoirededie smallint,
    vrready boolean,
    vram smallint
);


ALTER TABLE carte_graphique OWNER TO postgres;

--
-- TOC entry 172 (class 1259 OID 43283)
-- Name: carte_graphique_idgraphique_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE carte_graphique_idgraphique_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE carte_graphique_idgraphique_seq OWNER TO postgres;

--
-- TOC entry 2099 (class 0 OID 0)
-- Dependencies: 172
-- Name: carte_graphique_idgraphique_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE carte_graphique_idgraphique_seq OWNED BY carte_graphique.idgraphique;


--
-- TOC entry 175 (class 1259 OID 43294)
-- Name: configuration; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE configuration (
    idconf integer NOT NULL,
    processeur character varying(250),
    ram smallint,
    stockage smallint,
    resolution character varying(20),
    os character varying(50),
    cartegraphique character varying(250)
);


ALTER TABLE configuration OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 43292)
-- Name: configuration_idconf_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE configuration_idconf_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE configuration_idconf_seq OWNER TO postgres;

--
-- TOC entry 2100 (class 0 OID 0)
-- Dependencies: 174
-- Name: configuration_idconf_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE configuration_idconf_seq OWNED BY configuration.idconf;


--
-- TOC entry 187 (class 1259 OID 43402)
-- Name: jeuxvideo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE jeuxvideo (
    idjeux integer NOT NULL,
    idtype integer NOT NULL,
    idmode integer NOT NULL,
    nomdujeux character varying(255) NOT NULL,
    datesortie date,
    editeur character varying(255),
    prixlancement numeric(8,0),
    restriction_age smallint,
    tailledujeux integer NOT NULL,
    idconf_min integer,
    idconf_max integer
);


ALTER TABLE jeuxvideo OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 43400)
-- Name: jeuxvideo_idjeux_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE jeuxvideo_idjeux_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE jeuxvideo_idjeux_seq OWNER TO postgres;

--
-- TOC entry 2101 (class 0 OID 0)
-- Dependencies: 186
-- Name: jeuxvideo_idjeux_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE jeuxvideo_idjeux_seq OWNED BY jeuxvideo.idjeux;


--
-- TOC entry 177 (class 1259 OID 43319)
-- Name: mode_de_jeux; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE mode_de_jeux (
    idmode integer NOT NULL,
    libelle character varying(50)
);


ALTER TABLE mode_de_jeux OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 43317)
-- Name: mode_de_jeux_idmode_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mode_de_jeux_idmode_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mode_de_jeux_idmode_seq OWNER TO postgres;

--
-- TOC entry 2102 (class 0 OID 0)
-- Dependencies: 176
-- Name: mode_de_jeux_idmode_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mode_de_jeux_idmode_seq OWNED BY mode_de_jeux.idmode;


--
-- TOC entry 185 (class 1259 OID 43394)
-- Name: plateforme; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE plateforme (
    idjeux integer NOT NULL,
    idplateforme integer NOT NULL
);


ALTER TABLE plateforme OWNER TO postgres;

--
-- TOC entry 179 (class 1259 OID 43328)
-- Name: plateforme_de_jeux; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE plateforme_de_jeux (
    idplateforme integer NOT NULL,
    libelle character varying(50) NOT NULL
);


ALTER TABLE plateforme_de_jeux OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 43326)
-- Name: plateforme_de_jeux_idplateforme_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE plateforme_de_jeux_idplateforme_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE plateforme_de_jeux_idplateforme_seq OWNER TO postgres;

--
-- TOC entry 2103 (class 0 OID 0)
-- Dependencies: 178
-- Name: plateforme_de_jeux_idplateforme_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE plateforme_de_jeux_idplateforme_seq OWNED BY plateforme_de_jeux.idplateforme;


--
-- TOC entry 180 (class 1259 OID 43335)
-- Name: soustype; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE soustype (
    idmere integer NOT NULL,
    idtype integer NOT NULL
);


ALTER TABLE soustype OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 43345)
-- Name: typejeux; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE typejeux (
    idtype integer NOT NULL,
    libelle character varying(50) NOT NULL,
    apropos text NOT NULL
);


ALTER TABLE typejeux OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 43343)
-- Name: typejeux_idtype_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE typejeux_idtype_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE typejeux_idtype_seq OWNER TO postgres;

--
-- TOC entry 2104 (class 0 OID 0)
-- Dependencies: 181
-- Name: typejeux_idtype_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE typejeux_idtype_seq OWNED BY typejeux.idtype;


--
-- TOC entry 184 (class 1259 OID 43357)
-- Name: utilisateur; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE utilisateur (
    idutilisateur integer NOT NULL,
    nom character varying(60) NOT NULL,
    prenom character varying(60) NOT NULL,
    datenaissance date NOT NULL,
    email character varying(150) NOT NULL,
    username character varying(30),
    password character varying(50)
);


ALTER TABLE utilisateur OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 43355)
-- Name: utilisateur_idutilisateur_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE utilisateur_idutilisateur_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE utilisateur_idutilisateur_seq OWNER TO postgres;

--
-- TOC entry 2105 (class 0 OID 0)
-- Dependencies: 183
-- Name: utilisateur_idutilisateur_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE utilisateur_idutilisateur_seq OWNED BY utilisateur.idutilisateur;


--
-- TOC entry 1928 (class 2604 OID 43288)
-- Name: idgraphique; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY carte_graphique ALTER COLUMN idgraphique SET DEFAULT nextval('carte_graphique_idgraphique_seq'::regclass);


--
-- TOC entry 1929 (class 2604 OID 43297)
-- Name: idconf; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY configuration ALTER COLUMN idconf SET DEFAULT nextval('configuration_idconf_seq'::regclass);


--
-- TOC entry 1934 (class 2604 OID 43405)
-- Name: idjeux; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jeuxvideo ALTER COLUMN idjeux SET DEFAULT nextval('jeuxvideo_idjeux_seq'::regclass);


--
-- TOC entry 1930 (class 2604 OID 43322)
-- Name: idmode; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mode_de_jeux ALTER COLUMN idmode SET DEFAULT nextval('mode_de_jeux_idmode_seq'::regclass);


--
-- TOC entry 1931 (class 2604 OID 43331)
-- Name: idplateforme; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY plateforme_de_jeux ALTER COLUMN idplateforme SET DEFAULT nextval('plateforme_de_jeux_idplateforme_seq'::regclass);


--
-- TOC entry 1932 (class 2604 OID 43348)
-- Name: idtype; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY typejeux ALTER COLUMN idtype SET DEFAULT nextval('typejeux_idtype_seq'::regclass);


--
-- TOC entry 1933 (class 2604 OID 43360)
-- Name: idutilisateur; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY utilisateur ALTER COLUMN idutilisateur SET DEFAULT nextval('utilisateur_idutilisateur_seq'::regclass);


--
-- TOC entry 2076 (class 0 OID 43285)
-- Dependencies: 173
-- Data for Name: carte_graphique; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2106 (class 0 OID 0)
-- Dependencies: 172
-- Name: carte_graphique_idgraphique_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('carte_graphique_idgraphique_seq', 1, false);


--
-- TOC entry 2078 (class 0 OID 43294)
-- Dependencies: 175
-- Data for Name: configuration; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO configuration (idconf, processeur, ram, stockage, resolution, os, cartegraphique) VALUES (1, 'Core i5-4590 3.3GHz / FX-8350', 16, 15, '1336*720', 'Windows 7', 'GeForce GTX 970 / Radeon R9 290');


--
-- TOC entry 2107 (class 0 OID 0)
-- Dependencies: 174
-- Name: configuration_idconf_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('configuration_idconf_seq', 1, true);


--
-- TOC entry 2090 (class 0 OID 43402)
-- Dependencies: 187
-- Data for Name: jeuxvideo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO jeuxvideo (idjeux, idtype, idmode, nomdujeux, datesortie, editeur, prixlancement, restriction_age, tailledujeux, idconf_min, idconf_max) VALUES (3, 4, 1, 'Resident evil 7', '2017-01-24', 'Capcom', 30, 18, 15, 2, 1);


--
-- TOC entry 2108 (class 0 OID 0)
-- Dependencies: 186
-- Name: jeuxvideo_idjeux_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('jeuxvideo_idjeux_seq', 3, true);


--
-- TOC entry 2080 (class 0 OID 43319)
-- Dependencies: 177
-- Data for Name: mode_de_jeux; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO mode_de_jeux (idmode, libelle) VALUES (1, 'Solo');
INSERT INTO mode_de_jeux (idmode, libelle) VALUES (2, 'Multi');


--
-- TOC entry 2109 (class 0 OID 0)
-- Dependencies: 176
-- Name: mode_de_jeux_idmode_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('mode_de_jeux_idmode_seq', 2, true);


--
-- TOC entry 2088 (class 0 OID 43394)
-- Dependencies: 185
-- Data for Name: plateforme; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2082 (class 0 OID 43328)
-- Dependencies: 179
-- Data for Name: plateforme_de_jeux; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO plateforme_de_jeux (idplateforme, libelle) VALUES (1, 'Xbox 360');
INSERT INTO plateforme_de_jeux (idplateforme, libelle) VALUES (2, 'PS3');
INSERT INTO plateforme_de_jeux (idplateforme, libelle) VALUES (3, 'PS4');
INSERT INTO plateforme_de_jeux (idplateforme, libelle) VALUES (4, 'PS4 Pro');
INSERT INTO plateforme_de_jeux (idplateforme, libelle) VALUES (5, 'Xbox One');
INSERT INTO plateforme_de_jeux (idplateforme, libelle) VALUES (6, 'PC');
INSERT INTO plateforme_de_jeux (idplateforme, libelle) VALUES (7, 'Mac');
INSERT INTO plateforme_de_jeux (idplateforme, libelle) VALUES (8, 'Android');
INSERT INTO plateforme_de_jeux (idplateforme, libelle) VALUES (9, 'Ios');
INSERT INTO plateforme_de_jeux (idplateforme, libelle) VALUES (10, 'Switch');


--
-- TOC entry 2110 (class 0 OID 0)
-- Dependencies: 178
-- Name: plateforme_de_jeux_idplateforme_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('plateforme_de_jeux_idplateforme_seq', 10, true);


--
-- TOC entry 2083 (class 0 OID 43335)
-- Dependencies: 180
-- Data for Name: soustype; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2085 (class 0 OID 43345)
-- Dependencies: 182
-- Data for Name: typejeux; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO typejeux (idtype, libelle, apropos) VALUES (1, 'Action', 'Tout jeu faisant appel de la part du joueur à une mise à l''épreuve de ses réflexes et de son habileté à diriger l''avancement de la partie à travers le temps et l''espace du jeu correspond à un jeu d''action. Ce type de jeu est très ancien, puisque le tout premier jeu vidéo connu à avoir été créé en 1947, appelé dispositif de jeu à tube cathodique, est un jeu d''action. Les jeux d''actions constituent une très vaste catégorie du jeu vidéo qui regroupe des titres aussi divers que variés, eux-mêmes classifiés en plusieurs sous-catégories.');
INSERT INTO typejeux (idtype, libelle, apropos) VALUES (2, 'Le Beat-Them-All', 'Le joueur incarne un personnage et il progresse via un scrolling vertical ou horizontal le plus souvent. Le joueur peut récupérer des armes, bonus, utiliser des coups de poings ou de pieds, voire même des coups spéciaux. Des jeux comme Final Fight ou plus récemment GunGrave sont un bon exemple. Ce type de jeux a connu son heure de gloire dans les années 1985-1995. ');
INSERT INTO typejeux (idtype, libelle, apropos) VALUES (3, 'Le Beat-Them-up', 'c’est le jeu de baston classique, en 2D (King of Fighters, Street Fighter, Marvel Vs Capcom) ou 3D (Dead or Alive ,SoulCalibur, Tekken, Virtua Fighter). Le joueur choisi son personnage et doit affronter un à un les autres personnages du jeu. Selon les cas, le combat est à mains nues ou à l’aide d’armes. Très prisé en arcade dans les années 1992-2000 (lorsque l’écart technique entre arcade et consoles était encore énorme), ces jeux ont entamé une nouvelle carrière sur les consoles nouvelle génération, où ils peuvent exprimer leur potentiel. Du coup, en arcade ce genre est peu à peu délaissé. ');
INSERT INTO typejeux (idtype, libelle, apropos) VALUES (4, 'Le Survival – Horror', 'Ce sous-style a été initié par des jeux comme Alone In The Dark, puis avec l’arrivée de la Playstation, il s’est imposé à travers des licences phares comme Resident Evil (Biohasard), Silent Hill ou encore Project Zero…
Le but c’est de faire vivre au joueur des sentiments comme la peur et l’angoisse. L’accent est mis sur l’ambiance graphique certes, mais surtout sonore, plongeant le joueur plus avant dans l’univers sombre de l’histoire… ');
INSERT INTO typejeux (idtype, libelle, apropos) VALUES (5, 'Plates-formes', 'Le joueur incarne un personnage et il doit le faire avancer dans la partie, en le faisant sauter de plateforme en plate-forme. Les exemples type ce sont des jeux comme Mario ou Sonic. A l’époque des consoles 8 et 16 bits, ces jeux étaient très répandus dans leur forme basique, avec un scrolling vertical ou horizontal.
Le plus souvent il fallait parcourir un niveau d’un point A vers un point B en évitant les pièges ou en tuant les ennemis à l’écran… Mais de plus en plus et surtout avec l’arrivée des technologies modernes et des jeux en 3D temps réel, ces jeux de plateforme se complexifient, intégrant une bonne dose d’aventure ou d’action ou encore du tir.
Sans parler de l’aspect 3D qui donne au joueur de nouvelles possibilités de jeu, mais aussi une autre approche en termes de jouabilité. Par exemple, un jeu comme Ratchet & Clank mélange bien plusieurs styles de jeux et en ce sens il est représentatif de la nouvelle tendance. ');
INSERT INTO typejeux (idtype, libelle, apropos) VALUES (6, 'simulation mécanique', 'Course de voitures, pilotage d’avions, etc.(Flight Simulator, Colin Mac Rae, MS Train Simulator, Virtual Skipper, Revolt, Silent Hunter...). 
L’usure, les dégâts, le temps, les caractéristiques physiques, voilà des exemples de paramètres qui entrent en scène dans ce style de jeux. ');
INSERT INTO typejeux (idtype, libelle, apropos) VALUES (7, 'simulation sportive', 'On incarne un sportif ou une équipe de sportifs et on doit gagner contre un autre joueur ou contre le programme. La notion de temps est essentielle pour accéder à la victoire. Ces jeux sont souvent basés sur des licences (noms d’équipes, de joueurs, de championnats, etc.), et ils collent au règlement officiel du sport en question. Ce sont des jeux très répandus. Des sociétés comme Electronic Arts étant des spécialistes dans l’élaboration de ce type de contenu. ');
INSERT INTO typejeux (idtype, libelle, apropos) VALUES (8, 'Tir', 'Un jeu de tir est un jeu d''action qui demande au joueur d''être capable, à partir du personnage/véhicule qu''il contrôle, de tirer sur les adversaires qui parsèment les niveaux avec sa ou ses armes/pouvoirs/projectiles pour les neutraliser. Le joueur devra également veiller à se déplacer suffisamment rapidement pour se mettre à couvert ou éviter les tirs ou attaques au corps à corps de ses ennemis.');
INSERT INTO typejeux (idtype, libelle, apropos) VALUES (9, 'FPS', 'Les jeux de tir à la première personne (ou FPS pour First-Person Shooter) sont basés sur une visée et des déplacements à la première personne. Cette perspective a pour but de donner l''impression au joueur « d''être là », à la place du personnage tenant l''arme et voyant exactement ce qu''il voit, générant ainsi une forte identification accentuée par des graphismes en trois dimensions. Le gameplay est de manière générale rapide et requiert de bons réflexes. Si les FPS sont des jeux de tir, il est à noter que toutes les armes utilisées ne le sont pas forcément : il peut s''agir d''armes de corps à corps tel que des couteaux, des pieds de biche ou des sabres lasers, bien que ces derniers ne constituent qu''une petite partie de l''arsenal qui lui est très souvent plus orienté vers les armes de tirs.');
INSERT INTO typejeux (idtype, libelle, apropos) VALUES (10, 'Tir en vue objective(TPS)', 'Les jeux de tir à la troisième personne, ou tir objectif (ou TPS pour Third-Person Shooter) sont similaires aux jeux de tir à la première personne à la différence que le personnage est vu de dos et parfois avec une perspective isométrique. Le joueur a une vision élargie de l''environnement et sa liberté de mouvement est accrue. Resident Evil 4 et Resident Evil 5 sont des mélanges de TPS et de Survival-Horror');


--
-- TOC entry 2111 (class 0 OID 0)
-- Dependencies: 181
-- Name: typejeux_idtype_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('typejeux_idtype_seq', 10, true);


--
-- TOC entry 2087 (class 0 OID 43357)
-- Dependencies: 184
-- Data for Name: utilisateur; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2112 (class 0 OID 0)
-- Dependencies: 183
-- Name: utilisateur_idutilisateur_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('utilisateur_idutilisateur_seq', 1, false);


--
-- TOC entry 1937 (class 2606 OID 43290)
-- Name: pk_carte_graphique; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY carte_graphique
    ADD CONSTRAINT pk_carte_graphique PRIMARY KEY (idgraphique);


--
-- TOC entry 1940 (class 2606 OID 43299)
-- Name: pk_configuration; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY configuration
    ADD CONSTRAINT pk_configuration PRIMARY KEY (idconf);


--
-- TOC entry 1963 (class 2606 OID 43410)
-- Name: pk_jeuxvideo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jeuxvideo
    ADD CONSTRAINT pk_jeuxvideo PRIMARY KEY (idjeux);


--
-- TOC entry 1943 (class 2606 OID 43324)
-- Name: pk_mode_de_jeux; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mode_de_jeux
    ADD CONSTRAINT pk_mode_de_jeux PRIMARY KEY (idmode);


--
-- TOC entry 1959 (class 2606 OID 43398)
-- Name: pk_plateforme; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY plateforme
    ADD CONSTRAINT pk_plateforme PRIMARY KEY (idjeux, idplateforme);


--
-- TOC entry 1945 (class 2606 OID 43333)
-- Name: pk_plateforme_de_jeux; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY plateforme_de_jeux
    ADD CONSTRAINT pk_plateforme_de_jeux PRIMARY KEY (idplateforme);


--
-- TOC entry 1948 (class 2606 OID 43339)
-- Name: pk_soustype; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY soustype
    ADD CONSTRAINT pk_soustype PRIMARY KEY (idmere, idtype);


--
-- TOC entry 1953 (class 2606 OID 43353)
-- Name: pk_typejeux; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY typejeux
    ADD CONSTRAINT pk_typejeux PRIMARY KEY (idtype);


--
-- TOC entry 1956 (class 2606 OID 43362)
-- Name: pk_utilisateur; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY utilisateur
    ADD CONSTRAINT pk_utilisateur PRIMARY KEY (idutilisateur);


--
-- TOC entry 1935 (class 1259 OID 43291)
-- Name: carte_graphique_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX carte_graphique_pk ON carte_graphique USING btree (idgraphique);


--
-- TOC entry 1960 (class 1259 OID 43411)
-- Name: conf_min_requis_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX conf_min_requis_fk ON jeuxvideo USING btree (idconf_max);


--
-- TOC entry 1961 (class 1259 OID 43412)
-- Name: conf_recommander_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX conf_recommander_fk ON jeuxvideo USING btree (idconf_min);


--
-- TOC entry 1938 (class 1259 OID 43300)
-- Name: configuration_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX configuration_pk ON configuration USING btree (idconf);


--
-- TOC entry 1941 (class 1259 OID 43325)
-- Name: mode_de_jeux_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX mode_de_jeux_pk ON mode_de_jeux USING btree (idmode);


--
-- TOC entry 1946 (class 1259 OID 43334)
-- Name: plateforme_de_jeux_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX plateforme_de_jeux_pk ON plateforme_de_jeux USING btree (idplateforme);


--
-- TOC entry 1949 (class 1259 OID 43342)
-- Name: sous_type2_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sous_type2_fk ON soustype USING btree (idtype);


--
-- TOC entry 1950 (class 1259 OID 43341)
-- Name: sous_type_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sous_type_fk ON soustype USING btree (idmere);


--
-- TOC entry 1951 (class 1259 OID 43340)
-- Name: sous_type_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX sous_type_pk ON soustype USING btree (idmere, idtype);


--
-- TOC entry 1954 (class 1259 OID 43354)
-- Name: typejeux_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX typejeux_pk ON typejeux USING btree (idtype);


--
-- TOC entry 1957 (class 1259 OID 43363)
-- Name: utilisateur_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX utilisateur_pk ON utilisateur USING btree (idutilisateur);


--
-- TOC entry 1965 (class 2606 OID 43389)
-- Name: fk_soustype_sous_type_typejeux1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY soustype
    ADD CONSTRAINT fk_soustype_sous_type_typejeux1 FOREIGN KEY (idtype) REFERENCES typejeux(idtype) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1964 (class 2606 OID 43384)
-- Name: fk_soustype_sous_type_typejeux2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY soustype
    ADD CONSTRAINT fk_soustype_sous_type_typejeux2 FOREIGN KEY (idmere) REFERENCES typejeux(idtype) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2097 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2017-03-02 13:43:31

--
-- PostgreSQL database dump complete
--

