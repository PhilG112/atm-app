--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: accounts; Type: TABLE; Schema: public; Owner: restricted
--

CREATE TABLE accounts (
    id integer NOT NULL,
    balance numeric,
    account_number integer,
    description text,
    is_open boolean,
    customer_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE accounts OWNER TO restricted;

--
-- Name: accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: restricted
--

CREATE SEQUENCE accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE accounts_id_seq OWNER TO restricted;

--
-- Name: accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: restricted
--

ALTER SEQUENCE accounts_id_seq OWNED BY accounts.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: restricted
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE ar_internal_metadata OWNER TO restricted;

--
-- Name: banks; Type: TABLE; Schema: public; Owner: restricted
--

CREATE TABLE banks (
    id integer NOT NULL,
    name text,
    address text,
    abn text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE banks OWNER TO restricted;

--
-- Name: banks_id_seq; Type: SEQUENCE; Schema: public; Owner: restricted
--

CREATE SEQUENCE banks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE banks_id_seq OWNER TO restricted;

--
-- Name: banks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: restricted
--

ALTER SEQUENCE banks_id_seq OWNED BY banks.id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: restricted
--

CREATE TABLE customers (
    id integer NOT NULL,
    first_name text,
    last_name text,
    tfn integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    bank_id integer,
    password_digest text,
    email text,
    phone_number text,
    customer_number integer
);


ALTER TABLE customers OWNER TO restricted;

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: restricted
--

CREATE SEQUENCE customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customers_id_seq OWNER TO restricted;

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: restricted
--

ALTER SEQUENCE customers_id_seq OWNED BY customers.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: restricted
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO restricted;

--
-- Name: transactions; Type: TABLE; Schema: public; Owner: restricted
--

CREATE TABLE transactions (
    id integer NOT NULL,
    transaction_type text,
    account_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    credits numeric,
    debits numeric
);


ALTER TABLE transactions OWNER TO restricted;

--
-- Name: transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: restricted
--

CREATE SEQUENCE transactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE transactions_id_seq OWNER TO restricted;

--
-- Name: transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: restricted
--

ALTER SEQUENCE transactions_id_seq OWNED BY transactions.id;


--
-- Name: accounts id; Type: DEFAULT; Schema: public; Owner: restricted
--

ALTER TABLE ONLY accounts ALTER COLUMN id SET DEFAULT nextval('accounts_id_seq'::regclass);


--
-- Name: banks id; Type: DEFAULT; Schema: public; Owner: restricted
--

ALTER TABLE ONLY banks ALTER COLUMN id SET DEFAULT nextval('banks_id_seq'::regclass);


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: restricted
--

ALTER TABLE ONLY customers ALTER COLUMN id SET DEFAULT nextval('customers_id_seq'::regclass);


--
-- Name: transactions id; Type: DEFAULT; Schema: public; Owner: restricted
--

ALTER TABLE ONLY transactions ALTER COLUMN id SET DEFAULT nextval('transactions_id_seq'::regclass);


--
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: restricted
--

COPY accounts (id, balance, account_number, description, is_open, customer_id, created_at, updated_at) FROM stdin;
86	10000.0	3384	test5	f	59	2017-05-03 01:43:47.199711	2017-05-04 00:50:14.594133
82	500.0	1	The account of phil	f	59	2017-05-03 01:42:14.882445	2017-05-04 01:04:50.47394
84	600.0	8033	tedt2	f	59	2017-05-03 01:43:19.518511	2017-05-04 01:07:51.326376
83	500.0	3965	test1	f	59	2017-05-03 01:43:07.02115	2017-05-04 01:15:08.337365
85	5000.0	865	test3	f	59	2017-05-03 01:43:28.29785	2017-05-04 01:15:09.952958
87	600.0	100087	fsdf	t	59	2017-05-04 01:37:00.703427	2017-05-04 01:37:00.708847
88	10000.0	100088	sdfsdf	t	59	2017-05-04 01:37:22.483465	2017-05-04 01:37:22.487837
89	100.0	100089	sadf	t	59	2017-05-04 01:57:30.736658	2017-05-04 01:57:30.740497
90	23423.0	100090	sdfasdfa	t	59	2017-05-04 01:59:29.897157	2017-05-04 01:59:29.900786
91	1000.0	100091	adsfasdf	t	59	2017-05-04 02:00:23.718873	2017-05-04 02:00:23.723027
92	223.0	100092	sdfasfd	t	59	2017-05-04 02:01:45.894902	2017-05-04 02:01:45.898645
93	100.0	100093	sadfadf	t	59	2017-05-04 02:03:09.719731	2017-05-04 02:03:09.723489
94	100.0	100094	sdfasf	t	59	2017-05-04 02:04:58.456548	2017-05-04 02:04:58.460351
\.


--
-- Name: accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: restricted
--

SELECT pg_catalog.setval('accounts_id_seq', 94, true);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: restricted
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2017-04-29 05:11:43.031235	2017-04-29 05:11:43.031235
\.


--
-- Data for Name: banks; Type: TABLE DATA; Schema: public; Owner: restricted
--

COPY banks (id, name, address, abn, created_at, updated_at) FROM stdin;
54	ANZ Bank	Sydney CBD	abn12345	2017-05-03 01:42:14.727278	2017-05-03 01:42:14.727278
\.


--
-- Name: banks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: restricted
--

SELECT pg_catalog.setval('banks_id_seq', 54, true);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: restricted
--

COPY customers (id, first_name, last_name, tfn, created_at, updated_at, bank_id, password_digest, email, phone_number, customer_number) FROM stdin;
59	Phil	Grujovski	74659265	2017-05-03 01:42:14.827082	2017-05-03 01:42:14.827082	54	$2a$10$J.zGCNwBliCLoyzKHbQYCuM2j15upPtHGINIetRclPMmpSoAqrkfe	phil@ga.co	041826467	100
60	jack	wolf	2412	2017-05-04 14:31:57.734374	2017-05-04 14:31:57.739234	54	$2a$10$2dSYnIm8laQ2JKRCtNrLAOJTyPn6JekxERKD/upJRvdcx5LxAmaSO	jack@ga.co	25413451345	10060
\.


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: restricted
--

SELECT pg_catalog.setval('customers_id_seq', 60, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: restricted
--

COPY schema_migrations (version) FROM stdin;
20170429045705
20170429051156
20170429051949
20170429052554
20170429054005
20170429060042
20170429065757
20170501092533
20170501092700
20170501093033
\.


--
-- Data for Name: transactions; Type: TABLE DATA; Schema: public; Owner: restricted
--

COPY transactions (id, transaction_type, account_id, created_at, updated_at, credits, debits) FROM stdin;
54	Credit	82	2017-05-03 01:42:14.908769	2017-05-03 01:42:14.908769	5000.0	0.0
55	Debit	82	2017-05-03 01:42:14.913246	2017-05-03 01:42:14.913246	0.0	10000.0
56	debit	83	2017-05-03 01:43:07.029134	2017-05-03 01:43:07.029134	0.0	500.0
57	debit	84	2017-05-03 01:43:19.524166	2017-05-03 01:43:19.524166	0.0	600.0
58	debit	85	2017-05-03 01:43:28.303629	2017-05-03 01:43:28.303629	0.0	5000.0
59	debit	86	2017-05-03 01:43:47.205145	2017-05-03 01:43:47.205145	0.0	10000.0
60	credit	84	2017-05-04 00:47:05.437443	2017-05-04 00:47:05.437443	200.0	0.0
61	debit	86	2017-05-04 00:47:05.443487	2017-05-04 00:47:05.443487	0.0	200.0
62	credit	84	2017-05-04 00:57:53.573889	2017-05-04 00:57:53.573889	10.0	0.0
63	debit	85	2017-05-04 00:57:53.579607	2017-05-04 00:57:53.579607	0.0	10.0
64	credit	82	2017-05-04 00:59:32.777733	2017-05-04 00:59:32.777733	500.0	0.0
65	debit	84	2017-05-04 00:59:32.782617	2017-05-04 00:59:32.782617	0.0	500.0
66	credit	82	2017-05-04 01:03:36.816459	2017-05-04 01:03:36.816459	4400.0	0.0
67	debit	84	2017-05-04 01:03:36.822826	2017-05-04 01:03:36.822826	0.0	4400.0
68	debit	87	2017-05-04 01:37:00.723598	2017-05-04 01:37:00.723598	0.0	600.0
69	debit	88	2017-05-04 01:37:22.492892	2017-05-04 01:37:22.492892	0.0	10000.0
70	credit	88	2017-05-04 01:37:44.651608	2017-05-04 01:37:44.651608	5000.0	0.0
71	debit	88	2017-05-04 01:37:44.656623	2017-05-04 01:37:44.656623	0.0	5000.0
72	credit	88	2017-05-04 01:38:08.559332	2017-05-04 01:38:08.559332	5000.0	0.0
73	debit	87	2017-05-04 01:38:08.565425	2017-05-04 01:38:08.565425	0.0	5000.0
74	debit	89	2017-05-04 01:57:30.746273	2017-05-04 01:57:30.746273	0.0	100.0
75	debit	90	2017-05-04 01:59:29.906012	2017-05-04 01:59:29.906012	0.0	23423.0
76	debit	91	2017-05-04 02:00:23.728025	2017-05-04 02:00:23.728025	0.0	1000.0
77	debit	92	2017-05-04 02:01:45.904545	2017-05-04 02:01:45.904545	0.0	223.0
78	debit	93	2017-05-04 02:03:09.729117	2017-05-04 02:03:09.729117	0.0	100.0
79	debit	94	2017-05-04 02:04:58.465443	2017-05-04 02:04:58.465443	0.0	100.0
80	credit	87	2017-05-04 02:05:31.538235	2017-05-04 02:05:31.538235	200.0	0.0
81	debit	90	2017-05-04 02:05:31.542665	2017-05-04 02:05:31.542665	0.0	200.0
\.


--
-- Name: transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: restricted
--

SELECT pg_catalog.setval('transactions_id_seq', 81, true);


--
-- Name: accounts accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: restricted
--

ALTER TABLE ONLY accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: restricted
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: banks banks_pkey; Type: CONSTRAINT; Schema: public; Owner: restricted
--

ALTER TABLE ONLY banks
    ADD CONSTRAINT banks_pkey PRIMARY KEY (id);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: restricted
--

ALTER TABLE ONLY customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: restricted
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: transactions transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: restricted
--

ALTER TABLE ONLY transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

