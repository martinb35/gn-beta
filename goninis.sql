--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
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
-- Name: bathrooms; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bathrooms (
    id integer NOT NULL,
    title character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.bathrooms OWNER TO postgres;

--
-- Name: bathrooms_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bathrooms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bathrooms_id_seq OWNER TO postgres;

--
-- Name: bathrooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE bathrooms_id_seq OWNED BY bathrooms.id;


--
-- Name: floors; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE floors (
    id integer NOT NULL,
    title character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.floors OWNER TO postgres;

--
-- Name: floors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE floors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.floors_id_seq OWNER TO postgres;

--
-- Name: floors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE floors_id_seq OWNED BY floors.id;


--
-- Name: job_categories; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE job_categories (
    id integer NOT NULL,
    title character varying(255),
    icon character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.job_categories OWNER TO postgres;

--
-- Name: job_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE job_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_categories_id_seq OWNER TO postgres;

--
-- Name: job_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE job_categories_id_seq OWNED BY job_categories.id;


--
-- Name: jobs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE jobs (
    id integer NOT NULL,
    title character varying(255),
    level integer,
    floor integer,
    room integer,
    bathroom integer,
    material boolean,
    notes character varying(255),
    address character varying(255),
    location_ref character varying(255),
    second_address character varying(255),
    stored_address integer,
    map character varying(255),
    "when" timestamp without time zone,
    offer numeric(8,2),
    private boolean,
    auto_assign boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    job_category integer,
    floor_id integer,
    job_category_id integer
);


ALTER TABLE public.jobs OWNER TO postgres;

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jobs_id_seq OWNER TO postgres;

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE jobs_id_seq OWNED BY jobs.id;


--
-- Name: levels; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE levels (
    id integer NOT NULL,
    title character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.levels OWNER TO postgres;

--
-- Name: levels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE levels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.levels_id_seq OWNER TO postgres;

--
-- Name: levels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE levels_id_seq OWNED BY levels.id;


--
-- Name: rooms; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE rooms (
    id integer NOT NULL,
    title character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.rooms OWNER TO postgres;

--
-- Name: rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE rooms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rooms_id_seq OWNER TO postgres;

--
-- Name: rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE rooms_id_seq OWNED BY rooms.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bathrooms ALTER COLUMN id SET DEFAULT nextval('bathrooms_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY floors ALTER COLUMN id SET DEFAULT nextval('floors_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY job_categories ALTER COLUMN id SET DEFAULT nextval('job_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jobs ALTER COLUMN id SET DEFAULT nextval('jobs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY levels ALTER COLUMN id SET DEFAULT nextval('levels_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rooms ALTER COLUMN id SET DEFAULT nextval('rooms_id_seq'::regclass);


--
-- Data for Name: bathrooms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bathrooms (id, title, created_at, updated_at) FROM stdin;
1	1	2013-05-24 00:48:39.4155	2013-05-24 00:48:39.4155
2	2	2013-05-24 00:48:44.131845	2013-05-24 00:48:44.131845
\.


--
-- Name: bathrooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bathrooms_id_seq', 2, true);


--
-- Data for Name: floors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY floors (id, title, created_at, updated_at) FROM stdin;
1	1	2013-05-24 00:48:04.504492	2013-05-24 00:48:04.504492
2	2	2013-05-24 00:48:09.42611	2013-05-24 00:48:09.42611
\.


--
-- Name: floors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('floors_id_seq', 2, true);


--
-- Data for Name: job_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY job_categories (id, title, icon, created_at, updated_at) FROM stdin;
1	Handys para tu hogar	house.png	2013-05-24 00:47:41.544582	2013-05-24 00:47:41.544582
2	Handys para tu negocio	building.png	2013-05-24 00:47:49.794785	2013-05-24 00:47:49.794785
\.


--
-- Name: job_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('job_categories_id_seq', 2, true);


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jobs (id, title, level, floor, room, bathroom, material, notes, address, location_ref, second_address, stored_address, map, "when", offer, private, auto_assign, created_at, updated_at, job_category, floor_id, job_category_id) FROM stdin;
1	\N	1	1	2	2	t	\N	direccion	\N	\N	\N	\N	2013-05-24 05:48:00	100.00	t	f	2013-05-24 00:49:43.222794	2013-05-24 00:49:43.222794	\N	\N	1
2	\N	2	2	2	1	\N	\N		\N	\N	\N	\N	2013-06-19 00:32:00	20.00	f	\N	2013-06-19 00:32:48.222168	2013-06-19 00:32:48.222168	\N	\N	1
\.


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('jobs_id_seq', 2, true);


--
-- Data for Name: levels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY levels (id, title, created_at, updated_at) FROM stdin;
1	Regular	2013-05-24 00:49:10.05238	2013-05-24 00:49:10.05238
2	De temporada	2013-05-24 00:49:16.125935	2013-05-24 00:49:16.125935
3	Profunda	2013-05-24 00:49:22.158873	2013-05-24 00:49:22.158873
\.


--
-- Name: levels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('levels_id_seq', 3, true);


--
-- Data for Name: rooms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rooms (id, title, created_at, updated_at) FROM stdin;
1	1	2013-05-24 00:48:20.196937	2013-05-24 00:48:20.196937
2	2	2013-05-24 00:48:24.727745	2013-05-24 00:48:24.727745
\.


--
-- Name: rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('rooms_id_seq', 2, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY schema_migrations (version) FROM stdin;
20130516230619
20130516231016
20130516231024
20130516231033
20130516231358
20130516231931
20130522184246
20130522190012
20130524003848
\.


--
-- Name: bathrooms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bathrooms
    ADD CONSTRAINT bathrooms_pkey PRIMARY KEY (id);


--
-- Name: floors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY floors
    ADD CONSTRAINT floors_pkey PRIMARY KEY (id);


--
-- Name: job_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY job_categories
    ADD CONSTRAINT job_categories_pkey PRIMARY KEY (id);


--
-- Name: jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: levels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY levels
    ADD CONSTRAINT levels_pkey PRIMARY KEY (id);


--
-- Name: rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


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

