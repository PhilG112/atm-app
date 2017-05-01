--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

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
-- Name: accounts; Type: TABLE; Schema: public; Owner: restricted; Tablespace: 
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
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: restricted; Tablespace: 
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE ar_internal_metadata OWNER TO restricted;

--
-- Name: banks; Type: TABLE; Schema: public; Owner: restricted; Tablespace: 
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
-- Name: customers; Type: TABLE; Schema: public; Owner: restricted; Tablespace: 
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
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: restricted; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO restricted;

--
-- Name: transactions; Type: TABLE; Schema: public; Owner: restricted; Tablespace: 
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
-- Name: id; Type: DEFAULT; Schema: public; Owner: restricted
--

ALTER TABLE ONLY accounts ALTER COLUMN id SET DEFAULT nextval('accounts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: restricted
--

ALTER TABLE ONLY banks ALTER COLUMN id SET DEFAULT nextval('banks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: restricted
--

ALTER TABLE ONLY customers ALTER COLUMN id SET DEFAULT nextval('customers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: restricted
--

ALTER TABLE ONLY transactions ALTER COLUMN id SET DEFAULT nextval('transactions_id_seq'::regclass);


--
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: restricted
--

COPY accounts (id, balance, account_number, description, is_open, customer_id, created_at, updated_at) FROM stdin;
39	500.0	1	The account of phil	t	44	2017-05-01 10:21:49.417414	2017-05-01 10:21:49.417414
40	4999.0	\N	test account	\N	45	2017-05-01 10:39:47.22481	2017-05-01 10:39:47.22481
41	345.0	\N	test	\N	44	2017-05-01 10:41:19.600212	2017-05-01 10:41:19.600212
\.


--
-- Name: accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: restricted
--

SELECT pg_catalog.setval('accounts_id_seq', 41, true);


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
43	ANZ Bank	Sydney CBD	abn12345	2017-05-01 10:21:49.336661	2017-05-01 10:21:49.336661
\.


--
-- Name: banks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: restricted
--

SELECT pg_catalog.setval('banks_id_seq', 43, true);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: restricted
--

COPY customers (id, first_name, last_name, tfn, created_at, updated_at, bank_id, password_digest, email, phone_number, customer_number) FROM stdin;
45	Jack	Wolf	2435234	2017-05-01 10:33:27.287786	2017-05-01 10:33:27.287786	43	$2a$10$gAGrX14GASthxjah.Ymh/e0AKxEIo3VzIc8mCzmRaMXUSbpJOVoiS	jack@ga.co	040644778	\N
44	Phil	Grujovski	0	2017-05-01 10:21:49.396218	2017-05-01 10:42:47.481772	43	$2a$10$P9Pk8yNqlMG/EPmsaDkHrenrC5iabZCGWAVhAUucxc26zgrtDZ67e	phil@ga.co	041826467	100
\.


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: restricted
--

SELECT pg_catalog.setval('customers_id_seq', 45, true);


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
32	Credit	39	2017-05-01 10:21:49.442045	2017-05-01 10:21:49.442045	5000.0	0.0
33	Debit	39	2017-05-01 10:21:49.445258	2017-05-01 10:21:49.445258	0.0	10000.0
\.


--
-- Name: transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: restricted
--

SELECT pg_catalog.setval('transactions_id_seq', 33, true);


--
-- Name: accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: restricted; Tablespace: 
--

ALTER TABLE ONLY accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: restricted; Tablespace: 
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: banks_pkey; Type: CONSTRAINT; Schema: public; Owner: restricted; Tablespace: 
--

ALTER TABLE ONLY banks
    ADD CONSTRAINT banks_pkey PRIMARY KEY (id);


--
-- Name: customers_pkey; Type: CONSTRAINT; Schema: public; Owner: restricted; Tablespace: 
--

ALTER TABLE ONLY customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: restricted; Tablespace: 
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: restricted; Tablespace: 
--

ALTER TABLE ONLY transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

