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
-- Name: app_administradores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_administradores (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    correo character varying(254) NOT NULL,
    clave character varying(50) NOT NULL
);


ALTER TABLE public.app_administradores OWNER TO postgres;

--
-- Name: app_administradores_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_administradores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_administradores_id_seq OWNER TO postgres;

--
-- Name: app_administradores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_administradores_id_seq OWNED BY public.app_administradores.id;


--
-- Name: app_examenes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_examenes (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    valor character varying(50) NOT NULL,
    fecha date NOT NULL,
    observaciones character varying(250) NOT NULL,
    paciente_id integer NOT NULL
);


ALTER TABLE public.app_examenes OWNER TO postgres;

--
-- Name: app_examenes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_examenes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_examenes_id_seq OWNER TO postgres;

--
-- Name: app_examenes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_examenes_id_seq OWNED BY public.app_examenes.id;


--
-- Name: app_pacientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_pacientes (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    correo character varying(200) NOT NULL,
    clave character varying(50) NOT NULL,
    rut character varying(10) NOT NULL,
    edad integer NOT NULL,
    fecha date NOT NULL,
    direccion character varying(150) NOT NULL,
    ocupacion character varying(150) NOT NULL,
    telefono character varying(20) NOT NULL,
    foto character varying(65535) NOT NULL,
    resumen text NOT NULL,
    educacion text NOT NULL,
    historial text NOT NULL
);


ALTER TABLE public.app_pacientes OWNER TO postgres;

--
-- Name: app_pacientes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_pacientes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_pacientes_id_seq OWNER TO postgres;

--
-- Name: app_pacientes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_pacientes_id_seq OWNED BY public.app_pacientes.id;


--
-- Name: app_perfil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_perfil (
    id integer NOT NULL,
    descripcion character varying(70) NOT NULL,
    nacionalidad character varying(100) NOT NULL,
    altura numeric(4,1) NOT NULL,
    peso numeric(4,1) NOT NULL,
    direccion character varying(300) NOT NULL,
    codigo_postal character varying(20) NOT NULL,
    archivo_foto character varying(400) NOT NULL,
    rol character varying(50) NOT NULL,
    usuario_id integer NOT NULL
);


ALTER TABLE public.app_perfil OWNER TO postgres;

--
-- Name: app_perfil_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_perfil_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_perfil_id_seq OWNER TO postgres;

--
-- Name: app_perfil_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_perfil_id_seq OWNED BY public.app_perfil.id;


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
-- Name: app_administradores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_administradores ALTER COLUMN id SET DEFAULT nextval('public.app_administradores_id_seq'::regclass);


--
-- Name: app_examenes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_examenes ALTER COLUMN id SET DEFAULT nextval('public.app_examenes_id_seq'::regclass);


--
-- Name: app_pacientes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_pacientes ALTER COLUMN id SET DEFAULT nextval('public.app_pacientes_id_seq'::regclass);


--
-- Name: app_perfil id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_perfil ALTER COLUMN id SET DEFAULT nextval('public.app_perfil_id_seq'::regclass);


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
-- Data for Name: app_administradores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_administradores (id, nombre, correo, clave) FROM stdin;
1	admin	admin@awake.com	123456
\.


--
-- Data for Name: app_examenes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_examenes (id, nombre, valor, fecha, observaciones, paciente_id) FROM stdin;
32	glucosa	150	1919-01-01	edewd ewde wdew dwe dwe dwe	2
33	glucosa	150	1947-01-01	dewdewdew	2
34	glucosa	150	1900-01-01	dewdwedewdw edew d wed	2
40	hemograma	450	1957-04-01	sjwo ssjhwoqjs owqjs owq	7
35	hemograma	150	1950-01-01	e wdfewd ewd ewd ew dew	7
41	orina	160	1976-01-01	sdwqs wqswqswqs wq swq swq	2
42	orina	350	2001-01-01	swqsjwq swqjs owqj spojwq sojwqp	6
\.


--
-- Data for Name: app_pacientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_pacientes (id, nombre, correo, clave, rut, edad, fecha, direccion, ocupacion, telefono, foto, resumen, educacion, historial) FROM stdin;
7	Luis Jaraquemada	luis.jaraquemada@team.awakelab.cl	123456	1000000-5	56	2020-12-05	Santiago #45450	redes y python master	9405653554	http://yofui.com/CLFotosFiles/Evento00000866/YoFui0000000400844604-6.JPG	paciente ............	allala lalala lalalla\r\nlalala laalal alala a	lalal a\r\nlallala \r\nllla \r\nlalalalala
5	Jose guerra	jose@hotmail.com	123456	15896752-2	100	2020-12-05	las carmelitas valpo	Telecommunication Specialist	9405653554	https://media-exp1.licdn.com/dms/image/C5603AQH2_0aQAqfJPA/profile-displayphoto-shrink_200_200/0/1517395160883?e=1619654400&v=beta&t=Uy_blZEEfmdETNKayjOjnP_VZ9stM4L9C-XE5Ngd1Yw	lalal allal alaala prueba prueba	la vida	orina completa \r\norina
6	Gilbert Lagos	gilbert@gmail.com	123456	15896752-2	36	2020-12-05	las carmelitas valpo	redes y python master	5698406646	https://media-exp1.licdn.com/dms/image/C5603AQFUjuNCjWy-wQ/profile-displayphoto-shrink_200_200/0/1517629716467?e=1619654400&v=beta&t=luNfnvnHsqiw-iobq2kGJhKpof6qRYcnlGgPUiJ1mJE	la lala ala alaaalal	la vida 2	dseod dejojd e dewjd wpejd pw
2	john bruna	joncito@gmail.com		20380930-2	36	2020-12-05	las cabras #3500	Telecommunication Specialist	9405653554	https://media-exp1.licdn.com/dms/image/C5603AQEjGwKBiXp4Cg/profile-displayphoto-shrink_200_200/0/1607380799059?e=1619654400&v=beta&t=o6OpLNmhSvNVQhWAmccfJFOo3CebcjHF-e6UfkA1AAU	sdewi dewihd ewiohd iwehd ohewoid ewihdew hdihew iohd eowihdo ewhdiehw odhewdh iweohd ohewoihdihwe doihewiohd iweoh doihew oidhoeiwhd owehd ohweoihdeow ihdowe	dwehdoh wehdiohew odh ewodh eowhd eiwohdewiohd ewhdoi ewhoidh eoiwhd ew dihewid hiweo d ewihd weoh dihewoi dhweoihd ew	dihwedo ewhdiweo hdoihew oidhew hdowehdihewihd ohewo idhewodhewi dowehd ohewoi doiwedh oeiwhd oihewo dhiweo hdihew oidh oiweh doe
3	Esteban Yañex	esteban@gmail.com		30460790-2	100	2020-12-05	las carmelitas valpo	Telecommunication Specialist	5698406646	https://media-exp1.licdn.com/dms/image/C4E35AQFB2Mc2spRmOg/profile-framedphoto-shrink_200_200/0/1613672835831?e=1614304800&v=beta&t=etP8OnZs2MQ_iqRXyngxbn33T95woZzULK_x2nxkuJk	dew ewdhiweo dihew dhiweh odhoew hdih ewiohd oew\r\ndjewojd ewdjpoewj dpojew\r\ndewpdj ewpdew	dewojd ewdjhwe d\r\newjd pewj d\r\newjdpjew pojdpoejwpodj epwojd ew\r\njewjd pew	dewhd oehwidoh oewihd oehwoid eiwohd iweoh dew
\.


--
-- Data for Name: app_perfil; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_perfil (id, descripcion, nacionalidad, altura, peso, direccion, codigo_postal, archivo_foto, rol, usuario_id) FROM stdin;
1	Hola soy paciente jhonn	Chilena	180.0	60.0	Pasaje pajaritos	123654	foto.jpg	paciente	2
2	Hola soy medico jhonnsu	Chilena	180.0	60.0	Pasaje pajaritos	123654	foto.jpg	medico	3
\.


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
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add administradores	7	add_administradores
26	Can change administradores	7	change_administradores
27	Can delete administradores	7	delete_administradores
28	Can view administradores	7	view_administradores
29	Can add pacientes	8	add_pacientes
30	Can change pacientes	8	change_pacientes
31	Can delete pacientes	8	delete_pacientes
32	Can view pacientes	8	view_pacientes
33	Can add examenes	9	add_examenes
34	Can change examenes	9	change_examenes
35	Can delete examenes	9	delete_examenes
36	Can view examenes	9	view_examenes
37	Can add perfil	10	add_perfil
38	Can change perfil	10	change_perfil
39	Can delete perfil	10	delete_perfil
40	Can view perfil	10	view_perfil
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
3	pbkdf2_sha256$216000$ISNLyMLbcVDE$cNKjCM0Pd1Lse83A3OQe/8KXeEm/S55AAxi77EJ68qI=	2021-03-02 02:00:56.030417-03	t	jbrunasu			jooba@awake.cl	t	t	2021-03-01 13:49:09.624002-03
2	pbkdf2_sha256$216000$TXcuHcu8vP4R$6PPhzPQ6QLtmcRUGQYG2dPT+FmHmpruqXt1JoE1KuHU=	2021-03-02 02:10:41.295498-03	f	jbruna			joba@awake.cl	t	t	2021-03-01 13:45:32.784929-03
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
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	app	administradores
8	app	pacientes
9	app	examenes
10	app	perfil
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	app	0001_initial	2021-02-24 20:05:35.626838-03
2	app	0002_auto_20210225_0115	2021-02-24 22:15:15.404353-03
3	contenttypes	0001_initial	2021-02-24 23:38:35.763357-03
4	auth	0001_initial	2021-02-24 23:38:35.800364-03
5	admin	0001_initial	2021-02-24 23:38:35.852376-03
6	admin	0002_logentry_remove_auto_add	2021-02-24 23:38:35.866379-03
7	admin	0003_logentry_add_action_flag_choices	2021-02-24 23:38:35.87238-03
8	contenttypes	0002_remove_content_type_name	2021-02-24 23:38:35.887383-03
9	auth	0002_alter_permission_name_max_length	2021-02-24 23:38:35.894386-03
10	auth	0003_alter_user_email_max_length	2021-02-24 23:38:35.903387-03
11	auth	0004_alter_user_username_opts	2021-02-24 23:38:35.909388-03
12	auth	0005_alter_user_last_login_null	2021-02-24 23:38:35.920391-03
13	auth	0006_require_contenttypes_0002	2021-02-24 23:38:35.922391-03
14	auth	0007_alter_validators_add_error_messages	2021-02-24 23:38:35.928393-03
15	auth	0008_alter_user_username_max_length	2021-02-24 23:38:35.947283-03
16	auth	0009_alter_user_last_name_max_length	2021-02-24 23:38:35.955285-03
17	auth	0010_alter_group_name_max_length	2021-02-24 23:38:35.962292-03
18	auth	0011_update_proxy_permissions	2021-02-24 23:38:35.971294-03
19	auth	0012_alter_user_first_name_max_length	2021-02-24 23:38:35.977285-03
20	sessions	0001_initial	2021-02-24 23:38:35.988285-03
21	app	0003_auto_20210226_2320	2021-02-26 23:21:10.47541-03
22	app	0004_perfil	2021-03-01 21:49:46.274711-03
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
8hgl6ypkg0e4u5pmaswys6gzf3pr03fy	.eJxVjEEOwiAQRe_C2hCmBTpx6d4zkGEYpGogKe3KeHdt0oVu_3vvv1SgbS1h67KEOamzAnX63SLxQ-oO0p3qrWludV3mqHdFH7Tra0vyvBzu30GhXr41IjMgZkNgKXMUcZ5HHjKMYrw1SJ7AGabJThGRMogDHCwl8cSQ1PsD94A4fQ:1lFr37:QmK3moP2I_GwcuPTlM7W4eDXBqySz52WqSQonqgZ2TU	2021-03-13 01:17:49.408241-03
sd6osfm7t0900vhr1sey58vekbkvg2vw	.eJxVjDsOwjAQBe_iGlnxD8cp6TmDtetdE_NxpDihQdwdIqVJ-2bmfURdX_FdWlmgiUH5k4iwLmNcG8-xkBiEFocNIT24boDuUG-TTFNd5oJyU-ROm7xOxM_L7h4ORmjjv86sgMgGo4LpXWcAbXLOhoBa8VnrPhvMLgHZ5D1i6LOCpBIxac8da_H9AQEyPlM:1lGoCS:ttWqSAMEhIuG-Vc8dvZO3_MVgFjfjGLQBApiqRqyxEk	2021-03-15 16:27:24.673776-03
sk835bwrozp6w7768p7seqyeuhe5jbyb	.eJxVjDkOwyAUBe9CHSGzg8v0OQP68CEmC5aMSRPl7rElF0n7Zt68iYe-Tr63tPiCZCSCnH63APGe6g7wBvU60zjXdSmB7go9aKOXGdPjfLh_gQnatL0jj4BSWg7OSJuHIJlKikkUTg-O26wVCoU86uSyEcKEoJhwJlijNCJs0dqf_lVaWaGRkcnPF7DuPRw:1lGt9r:eZyy2LpDlv0B_IY5n3OYzxqvroceqKwl1oAes1bOZPU	2021-03-15 21:45:03.338662-03
lsazpn7gg9o19m23p1lfzbk7e68bh5id	.eJxVjDsOwjAQBe_iGlnxj8Qp6TmDtetdE_OxpTihQdwdIqVJ-2bmfURZX-GdW16giVHbkwiwLlNYG88hkxiFFocNIT64bIDuUG5VxlqWOaPcFLnTJq-V-HnZ3cPBBG3614kVEFlvlDeD6wygjc5Z71ErPms9JIPJRSAb-x7RD0lBVJGYdM8da_H9Af_MPlE:1lGqFL:Yq1Cq434wvcjgTeclt1CO8ntmF2RYB_5R1eW61lOa4Y	2021-03-15 18:38:31.038704-03
mbfxcmfcxjun880g5tyhuy6fz246abic	.eJxVjDsOwjAQBe_iGlnxj8Qp6TmDtetdE_OxpTihQdwdIqVJ-2bmfURZX-GdW16gidGYkwiwLlNYG88hkxiFFocNIT64bIDuUG5VxlqWOaPcFLnTJq-V-HnZ3cPBBG3614kVEFlvlDeD6wygjc5Z71ErPms9JIPJRSAb-x7RD0lBVJGYdM8da_H9Af_NPlE:1lGnZF:dX0ZrZrGkC-0YmmdplkKl-IYrljntv8hSRnlTIy7ZoI	2021-03-15 15:46:53.865158-03
\.


--
-- Name: app_administradores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_administradores_id_seq', 1, true);


--
-- Name: app_examenes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_examenes_id_seq', 42, true);


--
-- Name: app_pacientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_pacientes_id_seq', 7, true);


--
-- Name: app_perfil_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_perfil_id_seq', 2, true);


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

SELECT pg_catalog.setval('public.auth_permission_id_seq', 40, true);


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
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 10, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 22, true);


--
-- Name: app_administradores app_administradores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_administradores
    ADD CONSTRAINT app_administradores_pkey PRIMARY KEY (id);


--
-- Name: app_examenes app_examenes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_examenes
    ADD CONSTRAINT app_examenes_pkey PRIMARY KEY (id);


--
-- Name: app_pacientes app_pacientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_pacientes
    ADD CONSTRAINT app_pacientes_pkey PRIMARY KEY (id);


--
-- Name: app_perfil app_perfil_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_perfil
    ADD CONSTRAINT app_perfil_pkey PRIMARY KEY (id);


--
-- Name: app_perfil app_perfil_usuario_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_perfil
    ADD CONSTRAINT app_perfil_usuario_id_key UNIQUE (usuario_id);


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
-- Name: app_examenes_paciente_id_4d555407; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX app_examenes_paciente_id_4d555407 ON public.app_examenes USING btree (paciente_id);


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
-- Name: app_examenes app_examenes_paciente_id_4d555407_fk_app_pacientes_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_examenes
    ADD CONSTRAINT app_examenes_paciente_id_4d555407_fk_app_pacientes_id FOREIGN KEY (paciente_id) REFERENCES public.app_pacientes(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_perfil app_perfil_usuario_id_8a126226_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_perfil
    ADD CONSTRAINT app_perfil_usuario_id_8a126226_fk_auth_user_id FOREIGN KEY (usuario_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


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

