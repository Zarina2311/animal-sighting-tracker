--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.2

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
-- Name: individuals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.individuals (
    id integer NOT NULL,
    nickname text,
    rec_created timestamp without time zone,
    species_id integer
);


ALTER TABLE public.individuals OWNER TO postgres;

--
-- Name: individuals_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.individuals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.individuals_id_seq OWNER TO postgres;

--
-- Name: individuals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.individuals_id_seq OWNED BY public.individuals.id;


--
-- Name: sightings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sightings (
    location text,
    healthy boolean,
    email text,
    ind_seen_id integer,
    id integer NOT NULL,
    date_time timestamp without time zone
);


ALTER TABLE public.sightings OWNER TO postgres;

--
-- Name: sightings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sightings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sightings_id_seq OWNER TO postgres;

--
-- Name: sightings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sightings_id_seq OWNED BY public.sightings.id;


--
-- Name: species; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.species (
    name text,
    scientific_name text,
    num_in_wild integer,
    status_code text,
    rec_created timestamp without time zone,
    id integer NOT NULL
);


ALTER TABLE public.species OWNER TO postgres;

--
-- Name: species_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.species_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.species_id_seq OWNER TO postgres;

--
-- Name: species_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.species_id_seq OWNED BY public.species.id;


--
-- Name: individuals id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.individuals ALTER COLUMN id SET DEFAULT nextval('public.individuals_id_seq'::regclass);


--
-- Name: sightings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sightings ALTER COLUMN id SET DEFAULT nextval('public.sightings_id_seq'::regclass);


--
-- Name: species id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.species ALTER COLUMN id SET DEFAULT nextval('public.species_id_seq'::regclass);


--
-- Data for Name: individuals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.individuals (id, nickname, rec_created, species_id) FROM stdin;
3	spider monkey	2001-05-13 00:00:00	5
1	big elephant	1999-07-23 00:00:00	10
10	cata	2007-11-23 00:00:00	8
9	tigris	2004-03-15 00:00:00	3
2	eye tuna	1996-02-03 00:00:00	6
12	typus	2009-07-24 00:00:00	1
6	pongo	2002-02-14 00:00:00	9
4	big grey	1998-09-20 00:00:00	4
11	big fish	2002-12-13 00:00:00	12
5	beringei	2003-01-22 00:00:00	7
8	red ailu	2005-08-23 00:00:00	2
7	ailu	1999-07-23 00:00:00	11
\.


--
-- Data for Name: sightings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sightings (location, healthy, email, ind_seen_id, id, date_time) FROM stdin;
Russia	t	danny@animalhelp.com	5	8	2015-08-19 00:00:00
South Africa	t	natalia.ann@gmail.com	11	10	2018-05-21 00:00:00
Russia	t	john.rodrigues@yosemite.com	8	11	2014-07-28 00:00:00
Malaysia	f	tatiana.long@yosemite.com	1	5	2013-07-14 00:00:00
Congo	f	ellen.degen@wwf.com	7	7	2020-01-05 00:00:00
Indonesia	t	roger.smith@gmail.com	3	6	2018-02-03 00:00:00
Mexico	t	zarina2311@mail.ru	4	13	2020-03-15 00:00:00
Madagaskar	f	clara.rodgers@wwf.com	6	3	2017-08-13 00:00:00
Cameroon	f	bob@mail.ru	1	15	2020-03-15 00:00:00
Namibia	t	bob@animalhelp.com	4	2	2011-09-05 00:00:00
Tanzania	t	jack@wwf.com	9	1	2016-02-03 00:00:00
Nigeria	t	diego.rubio@animalhelp.com	10	4	2015-10-23 00:00:00
Mozambique	f	kristine.lee@wwf.com	2	9	2011-09-11 00:00:00
Vietnam	t	bob@mail.ru	6	16	2020-03-15 00:00:00
\.


--
-- Data for Name: species; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.species (name, scientific_name, num_in_wild, status_code, rec_created, id) FROM stdin;
whale shark	rhincodon typus	2500	EN	2009-07-24 00:00:00	1
red panda	ailurus fulgens	3000	EN	2005-08-23 00:00:00	2
tiger	panthera tigris sondaica	3000	CE	2004-03-15 00:00:00	3
elephant	elephas maximus sumatranus	3500	EN	1998-09-20 00:00:00	4
black spider monkey	ateles paniscus	2500	VL	2001-05-13 00:00:00	5
bigeye tuna	thunnus obesus	2500	VL	1996-02-03 00:00:00	6
gorilla	gorilla beringei graueri	3000	CE	2003-01-22 00:00:00	7
turtle	eretmochelys imbricata	2500	CE	2007-11-23 00:00:00	8
orangutan	pongo abelii	3000	CE	2002-02-14 00:00:00	9
african elephant	loxodonta africana	2000	VL	1999-07-23 00:00:00	10
panda	ailuropoda melanoleuca	3000	VL	1999-07-23 00:00:00	11
whale	balaena	2000	EN	2002-12-13 00:00:00	12
\.


--
-- Name: individuals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.individuals_id_seq', 13, true);


--
-- Name: sightings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sightings_id_seq', 17, true);


--
-- Name: species_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.species_id_seq', 12, true);


--
-- Name: individuals individuals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.individuals
    ADD CONSTRAINT individuals_pkey PRIMARY KEY (id);


--
-- Name: sightings sightings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sightings
    ADD CONSTRAINT sightings_pkey PRIMARY KEY (id);


--
-- Name: species species_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_pkey PRIMARY KEY (id);


--
-- Name: individuals individuals_species_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.individuals
    ADD CONSTRAINT individuals_species_id_fkey FOREIGN KEY (species_id) REFERENCES public.species(id);


--
-- Name: sightings sightings_ind_seen_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sightings
    ADD CONSTRAINT sightings_ind_seen_id_fkey FOREIGN KEY (ind_seen_id) REFERENCES public.individuals(id);


--
-- PostgreSQL database dump complete
--

