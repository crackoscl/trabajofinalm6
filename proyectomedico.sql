--
-- PostgreSQL database dump
--

-- Dumped from database version 12.6 (Ubuntu 12.6-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.6 (Ubuntu 12.6-0ubuntu0.20.04.1)

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
-- Name: app_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_user (
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
    date_joined timestamp with time zone NOT NULL,
    rut character varying(10) NOT NULL,
    edad integer,
    fecha_nacimiento date,
    direccion character varying(150) NOT NULL,
    ocupacion character varying(150) NOT NULL,
    foto character varying(65535) NOT NULL,
    telefono character varying(20) NOT NULL,
    resumen text NOT NULL,
    educacion text NOT NULL,
    historial text NOT NULL,
    rol character varying(50) NOT NULL
);


ALTER TABLE public.app_user OWNER TO postgres;

--
-- Name: app_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.app_user_groups OWNER TO postgres;

--
-- Name: app_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_user_groups_id_seq OWNER TO postgres;

--
-- Name: app_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_user_groups_id_seq OWNED BY public.app_user_groups.id;


--
-- Name: app_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_user_id_seq OWNER TO postgres;

--
-- Name: app_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_user_id_seq OWNED BY public.app_user.id;


--
-- Name: app_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.app_user_user_permissions OWNER TO postgres;

--
-- Name: app_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: app_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_user_user_permissions_id_seq OWNED BY public.app_user_user_permissions.id;


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
-- Name: app_examenes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_examenes ALTER COLUMN id SET DEFAULT nextval('public.app_examenes_id_seq'::regclass);


--
-- Name: app_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user ALTER COLUMN id SET DEFAULT nextval('public.app_user_id_seq'::regclass);


--
-- Name: app_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user_groups ALTER COLUMN id SET DEFAULT nextval('public.app_user_groups_id_seq'::regclass);


--
-- Name: app_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.app_user_user_permissions_id_seq'::regclass);


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
-- Data for Name: app_examenes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_examenes (id, nombre, valor, fecha, observaciones, paciente_id) FROM stdin;
4	glucosa	500	1935-01-01	r43r 4v r34r 43 r2	7
5	glucosa	350	1992-01-01	glucosa un poco alta	10
6	orina	160	1956-01-01	orina clara	10
9	hemograma	350	1900-01-01	djewdjkñjewdjkwe	10
7	hemograma	500	2019-08-11	recuento de leucositos normal	10
8	hemograma	500	1900-10-28	hkh fksdhfjkhs fkhks dhflk ah	10
10	orina	350	2007-12-01	orina turbia bacterias	10
12	glucosa	160	1900-01-01	djdljslañdj	12
13	glucosa	500	1912-01-01	iuiuyiuy	10
14	glucosa	160	1900-01-01	hjkhl hjk hkh l	10
15	glucosa	500	1900-01-01	hjkhljl	10
16	hemograma	500	1920-01-01	wdw ed ed weq dwe d	10
17	hemograma	500	1945-01-01	jdh hdsfkhds kfjhlds	10
18	hemograma	500	1903-01-01	dwedwed	10
19	orina	500	1900-01-01	udh ewudh iwedho q	10
20	glucosa	250	1905-01-01	dewdqwed	10
21	glucosa	350	1900-01-01	e3e23e1e	10
23	orina	160	1900-01-01	defrf rferf	12
26	orina	500	1950-01-01	hhjkdh deh kjwe dlkjw	12
27	glucosa	250	1950-01-01	ed ewdhewhepdkhwkje hdjkhwqedkh kl	12
28	glucosa	500	1921-01-01	ewqeqweqw	10
29	glucosa	160	1900-01-01	32e23e32e23e32	12
30	hemograma	500	1900-01-01	grgrgr	10
\.


--
-- Data for Name: app_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, rut, edad, fecha_nacimiento, direccion, ocupacion, foto, telefono, resumen, educacion, historial, rol) FROM stdin;
10	pbkdf2_sha256$216000$XrNlvhQtoznR$+jBb4NGUV7RqXBu9T9s9r/wgGORV2oeDVtA9YWyZhW8=	2021-03-03 18:41:45.361102-03	f	jona12	jonathan	lopez	jona@gmail.com	f	t	2021-03-02 20:39:29-03	1500698-2	100	2021-03-02	las carmelitas valpo	redes y python master	https://media-exp1.licdn.com/dms/image/C5603AQH2_0aQAqfJPA/profile-displayphoto-shrink_200_200/0/1517395160883?e=1619654400&v=beta&t=Uy_blZEEfmdETNKayjOjnP_VZ9stM4L9C-XE5Ngd1Yw	5698406646	dwdhkjwh	dwdwqd	dwedwdqw	Paciente
12	pbkdf2_sha256$216000$LjV7c0rMeuDF$F1CdJif0NzuItwpYNDZi0/9wQkHLD+W/Bgimut7tIMQ=	2021-03-03 18:43:18.747656-03	f	pedrito	pedro	lopez	pedrito@gmail.com	f	t	2021-03-03 14:22:34.084707-03	20380930-2	36	2021-03-01	las cabras #3500	Telecommunication Specialist	https://www.awakelab.cl/wp-content/uploads/2020/12/Jonathan.jpg	5698406646	dwjd eljdlkjewlplde jewl djw lejed l	dwjdñwjkdjkejdekj ljd lwjweldkjlkwejd l	dewdjljwe djlkweld wje djlkwedjkwje	Paciente
8	pbkdf2_sha256$216000$c4eFcAstkPS8$9ubunk1IPXvD58WZppfzvrP3H83mfH/qIfRa6pFG0R8=	2021-03-03 18:44:01.353533-03	t	crackoscl				t	t	2021-03-02 15:47:47.436113-03		\N	\N		influencer	complete info		complete la info	complete la info	complete la info	sin asignar
7	pbkdf2_sha256$216000$6NhcwR3r3vij$mxUxtM3yr378yqcKC9Wd3CeAerufn1IizTsw+7nVn7w=	2021-03-03 18:44:48.409406-03	f	jona	juantito	dwdwqd	juaninto@lol.com	f	t	2021-03-02 12:27:23.038286-03	15896752-2	100	2020-12-05	las carmelitas valpo	redes y python master	https://www.awakelab.cl/wp-content/uploads/2020/12/Jonathan.jpg	9405653554	dew dew dwe d	d wqedwed we d	dw dw dqw dwe	Medico
\.


--
-- Data for Name: app_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: app_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_user_user_permissions (id, user_id, permission_id) FROM stdin;
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
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can view permission	1	view_permission
5	Can add group	2	add_group
6	Can change group	2	change_group
7	Can delete group	2	delete_group
8	Can view group	2	view_group
9	Can add content type	3	add_contenttype
10	Can change content type	3	change_contenttype
11	Can delete content type	3	delete_contenttype
12	Can view content type	3	view_contenttype
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add examenes	5	add_examenes
18	Can change examenes	5	change_examenes
19	Can delete examenes	5	delete_examenes
20	Can view examenes	5	view_examenes
21	Can add log entry	6	add_logentry
22	Can change log entry	6	change_logentry
23	Can delete log entry	6	delete_logentry
24	Can view log entry	6	view_logentry
25	Can add session	7	add_session
26	Can change session	7	change_session
27	Can delete session	7	delete_session
28	Can view session	7	view_session
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
7	2021-03-02 20:41:07.272761-03	10	jona12	2	[{"changed": {"fields": ["Rol"]}}]	4	8
8	2021-03-02 20:41:47.442728-03	10	jona12	2	[]	4	8
9	2021-03-03 10:57:11.689889-03	2	paralele	3		4	8
10	2021-03-03 10:57:11.692685-03	9	pedrito	3		4	8
11	2021-03-03 10:57:11.693759-03	11	esteban12	3		4	8
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	auth	permission
2	auth	group
3	contenttypes	contenttype
4	app	user
5	app	examenes
6	admin	logentry
7	sessions	session
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-03-02 00:31:01.756067-03
2	contenttypes	0002_remove_content_type_name	2021-03-02 00:31:01.768312-03
3	auth	0001_initial	2021-03-02 00:31:01.813527-03
4	auth	0002_alter_permission_name_max_length	2021-03-02 00:31:01.834638-03
5	auth	0003_alter_user_email_max_length	2021-03-02 00:31:01.840826-03
6	auth	0004_alter_user_username_opts	2021-03-02 00:31:01.854385-03
7	auth	0005_alter_user_last_login_null	2021-03-02 00:31:01.861553-03
8	auth	0006_require_contenttypes_0002	2021-03-02 00:31:01.864075-03
9	auth	0007_alter_validators_add_error_messages	2021-03-02 00:31:01.871253-03
10	auth	0008_alter_user_username_max_length	2021-03-02 00:31:01.882035-03
11	auth	0009_alter_user_last_name_max_length	2021-03-02 00:31:01.889178-03
12	auth	0010_alter_group_name_max_length	2021-03-02 00:31:01.896697-03
13	auth	0011_update_proxy_permissions	2021-03-02 00:31:01.902592-03
14	auth	0012_alter_user_first_name_max_length	2021-03-02 00:31:01.908464-03
15	app	0001_initial	2021-03-02 00:31:01.948608-03
16	admin	0001_initial	2021-03-02 00:31:13.829328-03
17	admin	0002_logentry_remove_auto_add	2021-03-02 00:31:13.846734-03
18	admin	0003_logentry_add_action_flag_choices	2021-03-02 00:31:13.857521-03
19	sessions	0001_initial	2021-03-02 00:31:13.865373-03
20	app	0002_auto_20210303_0039	2021-03-02 21:39:44.333551-03
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
o3m0v7yb5x7byas28h4k9lkq7170vn6m	.eJxVjMsOwiAUBf-FtSEtCBSX7vsN5HIfUjU0Ke3K-O_apAvdnpk5L5VgW0vaGi9pInVRQZ1-twz44LoDukO9zRrnui5T1ruiD9r0OBM_r4f7d1CglW_txWMWQyEjessdBmdtLx6M2DMZBxyBsfcCg6VsQwRAya4jgyEObNT7AxV2OSQ:1lHZIW:mTCNGSK_NOAP42J_nQ3WHqPBfWf5FCTACoVuZqaYCPs	2021-03-17 18:44:48.411482-03
\.


--
-- Name: app_examenes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_examenes_id_seq', 30, true);


--
-- Name: app_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_user_groups_id_seq', 1, false);


--
-- Name: app_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_user_id_seq', 12, true);


--
-- Name: app_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_user_user_permissions_id_seq', 1, true);


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

SELECT pg_catalog.setval('public.auth_permission_id_seq', 28, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 11, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 7, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 20, true);


--
-- Name: app_examenes app_examenes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_examenes
    ADD CONSTRAINT app_examenes_pkey PRIMARY KEY (id);


--
-- Name: app_user_groups app_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user_groups
    ADD CONSTRAINT app_user_groups_pkey PRIMARY KEY (id);


--
-- Name: app_user_groups app_user_groups_user_id_group_id_73b8e940_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user_groups
    ADD CONSTRAINT app_user_groups_user_id_group_id_73b8e940_uniq UNIQUE (user_id, group_id);


--
-- Name: app_user app_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT app_user_pkey PRIMARY KEY (id);


--
-- Name: app_user_user_permissions app_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user_user_permissions
    ADD CONSTRAINT app_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: app_user_user_permissions app_user_user_permissions_user_id_permission_id_7c8316ce_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user_user_permissions
    ADD CONSTRAINT app_user_user_permissions_user_id_permission_id_7c8316ce_uniq UNIQUE (user_id, permission_id);


--
-- Name: app_user app_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT app_user_username_key UNIQUE (username);


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
-- Name: app_user_groups_group_id_e774d92c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX app_user_groups_group_id_e774d92c ON public.app_user_groups USING btree (group_id);


--
-- Name: app_user_groups_user_id_e6f878f6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX app_user_groups_user_id_e6f878f6 ON public.app_user_groups USING btree (user_id);


--
-- Name: app_user_user_permissions_permission_id_4ef8e133; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX app_user_user_permissions_permission_id_4ef8e133 ON public.app_user_user_permissions USING btree (permission_id);


--
-- Name: app_user_user_permissions_user_id_24780b52; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX app_user_user_permissions_user_id_24780b52 ON public.app_user_user_permissions USING btree (user_id);


--
-- Name: app_user_username_9d6296ff_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX app_user_username_9d6296ff_like ON public.app_user USING btree (username varchar_pattern_ops);


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
-- Name: app_examenes app_examenes_paciente_id_4d555407_fk_app_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_examenes
    ADD CONSTRAINT app_examenes_paciente_id_4d555407_fk_app_user_id FOREIGN KEY (paciente_id) REFERENCES public.app_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_user_groups app_user_groups_group_id_e774d92c_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user_groups
    ADD CONSTRAINT app_user_groups_group_id_e774d92c_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_user_groups app_user_groups_user_id_e6f878f6_fk_app_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user_groups
    ADD CONSTRAINT app_user_groups_user_id_e6f878f6_fk_app_user_id FOREIGN KEY (user_id) REFERENCES public.app_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_user_user_permissions app_user_user_permis_permission_id_4ef8e133_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user_user_permissions
    ADD CONSTRAINT app_user_user_permis_permission_id_4ef8e133_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_user_user_permissions app_user_user_permissions_user_id_24780b52_fk_app_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user_user_permissions
    ADD CONSTRAINT app_user_user_permissions_user_id_24780b52_fk_app_user_id FOREIGN KEY (user_id) REFERENCES public.app_user(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_app_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_app_user_id FOREIGN KEY (user_id) REFERENCES public.app_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

