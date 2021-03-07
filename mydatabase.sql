--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: catalog_examen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.catalog_examen (
    id integer NOT NULL,
    "Nombre" character varying(50) NOT NULL,
    "Valor_Examen" character varying(50) NOT NULL,
    "Fecha" date NOT NULL,
    "Observaciones" text NOT NULL,
    paciente_id integer
);


ALTER TABLE public.catalog_examen OWNER TO postgres;

--
-- Name: catalog_examen_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.catalog_examen_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catalog_examen_id_seq OWNER TO postgres;

--
-- Name: catalog_examen_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.catalog_examen_id_seq OWNED BY public.catalog_examen.id;


--
-- Name: catalog_exameninstance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.catalog_exameninstance (
    id uuid NOT NULL,
    imprint character varying(200) NOT NULL,
    due_back date,
    status character varying(1) NOT NULL,
    borrower_id integer,
    examen_id integer
);


ALTER TABLE public.catalog_exameninstance OWNER TO postgres;

--
-- Name: catalog_genre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.catalog_genre (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE public.catalog_genre OWNER TO postgres;

--
-- Name: catalog_genre_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.catalog_genre_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catalog_genre_id_seq OWNER TO postgres;

--
-- Name: catalog_genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.catalog_genre_id_seq OWNED BY public.catalog_genre.id;


--
-- Name: catalog_language; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.catalog_language (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE public.catalog_language OWNER TO postgres;

--
-- Name: catalog_language_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.catalog_language_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catalog_language_id_seq OWNER TO postgres;

--
-- Name: catalog_language_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.catalog_language_id_seq OWNED BY public.catalog_language.id;


--
-- Name: catalog_paciente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.catalog_paciente (
    id integer NOT NULL,
    "Foto_perfil" character varying(65535) NOT NULL,
    "Rut" character varying(10) NOT NULL,
    "Nombre" character varying(100) NOT NULL,
    "Apellido" character varying(100) NOT NULL,
    "Nacimiento" date,
    "Edad" integer NOT NULL,
    "Telefono" character varying(20) NOT NULL,
    "Direccion" character varying(150) NOT NULL,
    "Correo" character varying(200) NOT NULL,
    "Password" character varying(50) NOT NULL,
    "Ocupacion" character varying(150) NOT NULL,
    "Resumen" text NOT NULL,
    "Educacion" text NOT NULL,
    "Historial" text NOT NULL,
    "Rol" character varying(15) NOT NULL
);


ALTER TABLE public.catalog_paciente OWNER TO postgres;

--
-- Name: catalog_paciente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.catalog_paciente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catalog_paciente_id_seq OWNER TO postgres;

--
-- Name: catalog_paciente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.catalog_paciente_id_seq OWNED BY public.catalog_paciente.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: catalog_examen id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalog_examen ALTER COLUMN id SET DEFAULT nextval('public.catalog_examen_id_seq'::regclass);


--
-- Name: catalog_genre id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalog_genre ALTER COLUMN id SET DEFAULT nextval('public.catalog_genre_id_seq'::regclass);


--
-- Name: catalog_language id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalog_language ALTER COLUMN id SET DEFAULT nextval('public.catalog_language_id_seq'::regclass);


--
-- Name: catalog_paciente id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalog_paciente ALTER COLUMN id SET DEFAULT nextval('public.catalog_paciente_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can view permission	1	view_permission
5	Can add group	2	add_group
6	Can change group	2	change_group
7	Can delete group	2	delete_group
8	Can view group	2	view_group
9	Can add user	3	add_user
10	Can change user	3	change_user
11	Can delete user	3	delete_user
12	Can view user	3	view_user
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add examen	5	add_examen
18	Can change examen	5	change_examen
19	Can delete examen	5	delete_examen
20	Can view examen	5	view_examen
21	Can add genre	6	add_genre
22	Can change genre	6	change_genre
23	Can delete genre	6	delete_genre
24	Can view genre	6	view_genre
25	Can add language	7	add_language
26	Can change language	7	change_language
27	Can delete language	7	delete_language
28	Can view language	7	view_language
29	Can add paciente	8	add_paciente
30	Can change paciente	8	change_paciente
31	Can delete paciente	8	delete_paciente
32	Can view paciente	8	view_paciente
33	Can add examen instance	9	add_exameninstance
34	Can change examen instance	9	change_exameninstance
35	Can delete examen instance	9	delete_exameninstance
36	Can view examen instance	9	view_exameninstance
37	Set examen as returned	9	can_mark_returned
38	Can add session	10	add_session
39	Can change session	10	change_session
40	Can delete session	10	delete_session
41	Can view session	10	view_session
42	Can add log entry	11	add_logentry
43	Can change log entry	11	change_logentry
44	Can delete log entry	11	delete_logentry
45	Can view log entry	11	view_logentry
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
3	pbkdf2_sha256$216000$w0TAybBUnySp$BpLCbEstuvny7h0fsc96EagQfp5d4FWPPYoCJnqP69A=	2021-03-07 03:07:33.585644-03	t	Admin			administracion@admin.cl	t	t	2021-03-06 17:57:18.105528-03
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: catalog_examen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.catalog_examen (id, "Nombre", "Valor_Examen", "Fecha", "Observaciones", paciente_id) FROM stdin;
15	hemograma	300	2021-05-05	Hemograma a la vena	6
16	glucosa	150	2021-05-05	Azucar hasta en la vena	6
17	hemograma	20	2021-05-09	Claramente a mejorado.	8
14	orina	100	2021-05-05	Aloha	6
18	orina	20	2021-07-09	hcae tiempo que no veia esto	8
\.


--
-- Data for Name: catalog_exameninstance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.catalog_exameninstance (id, imprint, due_back, status, borrower_id, examen_id) FROM stdin;
\.


--
-- Data for Name: catalog_genre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.catalog_genre (id, name) FROM stdin;
\.


--
-- Data for Name: catalog_language; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.catalog_language (id, name) FROM stdin;
\.


--
-- Data for Name: catalog_paciente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.catalog_paciente (id, "Foto_perfil", "Rut", "Nombre", "Apellido", "Nacimiento", "Edad", "Telefono", "Direccion", "Correo", "Password", "Ocupacion", "Resumen", "Educacion", "Historial", "Rol") FROM stdin;
6	Inserte una URL	183623834	Jhonn	Bruna	1992-12-24	28	321654987	Roda 45454	arroba@arroba.com	123456	influencer	Ingrese un breve resumen	Ingrese estudios	Ingrese historial clinico	paciente
8	Foto.png	183623835	Andrea	Carilangui	1994-05-12	26	321654987	Roda 4542	alibaba@arroba.com	123456	Estudiante	Esta paciente llego hace poco a la ciudad y viene por alergias	En harvard	Su historial clinico: es deprimente	paciente
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-03-06 21:09:53.624747-03	10	Prostata	3		5	3
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	auth	permission
2	auth	group
3	auth	user
4	contenttypes	contenttype
5	catalog	examen
6	catalog	genre
7	catalog	language
8	catalog	paciente
9	catalog	exameninstance
10	sessions	session
11	admin	logentry
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-03-06 17:44:48.224923-03
2	auth	0001_initial	2021-03-06 17:44:48.261929-03
3	catalog	0001_initial	2021-03-06 17:44:48.354446-03
4	catalog	0002_auto_20210306_1741	2021-03-06 17:44:48.382451-03
5	sessions	0001_initial	2021-03-06 17:45:07.821954-03
6	admin	0001_initial	2021-03-06 17:56:51.212865-03
7	admin	0002_logentry_remove_auto_add	2021-03-06 17:56:51.229367-03
8	admin	0003_logentry_add_action_flag_choices	2021-03-06 17:56:51.236369-03
9	contenttypes	0002_remove_content_type_name	2021-03-06 17:56:51.253371-03
10	auth	0002_alter_permission_name_max_length	2021-03-06 17:56:51.264874-03
11	auth	0003_alter_user_email_max_length	2021-03-06 17:56:51.272375-03
12	auth	0004_alter_user_username_opts	2021-03-06 17:56:51.278877-03
13	auth	0005_alter_user_last_login_null	2021-03-06 17:56:51.286877-03
14	auth	0006_require_contenttypes_0002	2021-03-06 17:56:51.288378-03
15	auth	0007_alter_validators_add_error_messages	2021-03-06 17:56:51.295379-03
16	auth	0008_alter_user_username_max_length	2021-03-06 17:56:51.310882-03
17	auth	0009_alter_user_last_name_max_length	2021-03-06 17:56:51.317883-03
18	auth	0010_alter_group_name_max_length	2021-03-06 17:56:51.327885-03
19	auth	0011_update_proxy_permissions	2021-03-06 17:56:51.337387-03
20	auth	0012_alter_user_first_name_max_length	2021-03-06 17:56:51.344888-03
21	catalog	0002_auto_20210306_1925	2021-03-06 19:25:14.957564-03
22	catalog	0003_remove_examen_rut	2021-03-06 19:29:33.550284-03
23	catalog	0004_auto_20210306_1934	2021-03-06 19:34:05.651026-03
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
xh9bqs5gvtvqi9716jejmj2rzmis6i1s	.eJxVjDkOwjAQRe8yNbJsZ5ukpOcM1iwOMYsjxQkN4u6AlCbtf-_9N-TtGV6ppLXA0J0g0LZOYStxCUlhgAoOG5PcY_4DvVG-zkbmvC6JzV8xOy3mMmt8nHf3cDBRmX61uHasfcfOsRul7eu2EUSviCyNRYeM3nfaRxVUJLFcOYtEniyRRoXPF4N4PYg:1lImlV:loGfhxYG2sTnw-ZOT-2HlihMxLBzDIRL5aXBeJhN8zE	2021-03-21 03:19:45.3918-03
xfyfp2eb4j8y349ggmv0ms6vfzp8zb74	.eJxVjDkOwjAQRe8yNbJsZ5ukpOcM1iwOMYsjxQkN4u6AlCbtf-_9N-TtGV6ppLXAgCcItK1T2EpcQlIYoILDxiT3mP9Ab5Svs5E5r0ti81fMTou5zBof5909HExUpl8trh1r37Fz7EZp-7ptBNErIktj0SGj9532UQUVSSxXziKRJ0ukUeHzBYQkPYk:1lIdzO:GNUv28upe465nreB0xs9sWRyOaEBrSa_suzDXrxQPAw	2021-03-20 17:57:30.769234-03
c8pti0aur5yq68btrqym7trmq2e07ixo	.eJxVjEsOwjAMBe_iNYri9Od2yZ4zRI6d0vBJpaZlg7g7IHXT7ZuZ94a8Pf0rlbQWGLA_gedtnfxW4uKTwgAVHLbAco_5D_TG-TobmfO6pGD-itlpMZdZ4-O8u4eDicv0qwXbsXZdQAw4StvXbSNETomCNJaQAjnXaR9VSInFhgotMTu2zBoVPl-rOD27:1lIkdz:-GiJvLfcnGJmPttRx9g1pgvoeCrn2Us_p_hKgpikTd4	2021-03-21 01:03:51.547401-03
mu5k4dzajala8dikuzn83ukp14n7rzk1	.eJxVjDkOwjAQRe8yNbJsZ5ukpOcM1iwOMYsjxQkN4u6AlCbtf-_9N-TtGV6ppLXA0Jwg0LZOYStxCUlhgAoOG5PcY_4DvVG-zkbmvC6JzV8xOy3mMmt8nHf3cDBRmX61uHasfcfOsRul7eu2EUSviCyNRYeM3nfaRxVUJLFcOYtEniyRRoXPF4IgPYY:1lIh0a:XEap_JrKcRiaTqsmWg5H-MYAz09t79GZg9Bgu-q8UNo	2021-03-20 21:10:56.836083-03
xihbi780et0hylg9ieqjum0sbb5cytv0	.eJxVjDkOwjAUBe_iGlm2s_2kpM8ZrL84xCy2FCc0iLtDpBTQvpk3L-VxW2e_lbD4KGpQlTr9boR8C2kHcsV0yZpzWpdIelf0QYses4T7-XD_AjOW-ftm206168hashO3fd02DOAEgLgxYIHAuU76IAwCyIYqawDRoUGUsEfT9vDPWOJa1FC9P1FDPYQ:1lIfUx:WvCpDC356EGCaDcrWX_ZyxVVlVlCSmmJpEUCnfNFBIk	2021-03-20 19:34:11.829228-03
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 45, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 3, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: catalog_examen_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.catalog_examen_id_seq', 18, true);


--
-- Name: catalog_genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.catalog_genre_id_seq', 1, false);


--
-- Name: catalog_language_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.catalog_language_id_seq', 1, false);


--
-- Name: catalog_paciente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.catalog_paciente_id_seq', 8, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 11, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 23, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: catalog_examen catalog_examen_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalog_examen
    ADD CONSTRAINT catalog_examen_pkey PRIMARY KEY (id);


--
-- Name: catalog_exameninstance catalog_exameninstance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalog_exameninstance
    ADD CONSTRAINT catalog_exameninstance_pkey PRIMARY KEY (id);


--
-- Name: catalog_genre catalog_genre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalog_genre
    ADD CONSTRAINT catalog_genre_pkey PRIMARY KEY (id);


--
-- Name: catalog_language catalog_language_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalog_language
    ADD CONSTRAINT catalog_language_pkey PRIMARY KEY (id);


--
-- Name: catalog_paciente catalog_paciente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalog_paciente
    ADD CONSTRAINT catalog_paciente_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: catalog_examen_paciente_id_7a7ae229; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX catalog_examen_paciente_id_7a7ae229 ON public.catalog_examen USING btree (paciente_id);


--
-- Name: catalog_exameninstance_borrower_id_b659969b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX catalog_exameninstance_borrower_id_b659969b ON public.catalog_exameninstance USING btree (borrower_id);


--
-- Name: catalog_exameninstance_examen_id_079d8b30; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX catalog_exameninstance_examen_id_079d8b30 ON public.catalog_exameninstance USING btree (examen_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catalog_examen catalog_examen_paciente_id_7a7ae229_fk_catalog_paciente_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalog_examen
    ADD CONSTRAINT catalog_examen_paciente_id_7a7ae229_fk_catalog_paciente_id FOREIGN KEY (paciente_id) REFERENCES public.catalog_paciente(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catalog_exameninstance catalog_exameninstance_borrower_id_b659969b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalog_exameninstance
    ADD CONSTRAINT catalog_exameninstance_borrower_id_b659969b_fk_auth_user_id FOREIGN KEY (borrower_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catalog_exameninstance catalog_exameninstance_examen_id_079d8b30_fk_catalog_examen_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalog_exameninstance
    ADD CONSTRAINT catalog_exameninstance_examen_id_079d8b30_fk_catalog_examen_id FOREIGN KEY (examen_id) REFERENCES public.catalog_examen(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

