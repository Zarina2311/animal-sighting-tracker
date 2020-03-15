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
    date_time timestamp without time zone,
    link text,
    photo text
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
9	tigris	2004-03-15 00:00:00	3
2	eye tuna	1996-02-03 00:00:00	6
12	typus	2009-07-24 00:00:00	1
4	big grey	1998-09-20 00:00:00	4
8	red ailu	2005-08-23 00:00:00	2
3	monk	2001-05-13 00:00:00	5
1	pongo	1999-07-23 00:00:00	10
\.


--
-- Data for Name: sightings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sightings (location, healthy, email, ind_seen_id, id, date_time, link, photo) FROM stdin;
Tanzania	t	roger.smith@gmail.com	3	6	2018-02-03 00:00:00	https://en.wikipedia.org/wiki/Tiger	https://c402277.ssl.cf1.rackcdn.com/photos/8620/images/story_full_width/MID_204422.jpg?1428000540
Mozambique	f	kristine.lee@wwf.com	2	9	2011-09-11 00:00:00	https://en.wikipedia.org/wiki/Red_panda	https://c402277.ssl.cf1.rackcdn.com/photos/806/images/story_full_width/SCR_47384.jpg?1345530917
Namibia	t	bob@animalhelp.com	4	2	2011-09-05 00:00:00	https://en.wikipedia.org/wiki/Sumatran_elephant	https://c402277.ssl.cf1.rackcdn.com/photos/1732/images/story_full_width/Asian_Elephant_8.13.2012_Hero_And_Circle_HI_247511.jpg?1345551842
Malaysia	f	tatiana.long@yosemite.com	1	5	2013-07-14 00:00:00	https://en.wikipedia.org/wiki/Whale_shark	https://c402277.ssl.cf1.rackcdn.com/photos/4999/images/story_full_width/Carlos_Aguilera.jpg?1377793759
Vietnam	t	mary.lee@animalhelp.com	2	34	2016-04-18 00:00:00	https://en.wikipedia.org/wiki/Bigeye_tuna	https://c402277.ssl.cf1.rackcdn.com/photos/2541/images/story_full_width/Bigeye_tuna_with_yellowfin_western_Pacific_Ocean_ISSF_2012.jpg?1348249089
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
african elephant	loxodonta africana	2000	VL	1999-07-23 00:00:00	10
\.


--
-- Name: individuals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.individuals_id_seq', 13, true);


--
-- Name: sightings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sightings_id_seq', 34, true);


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
    ADD CONSTRAINT individuals_species_id_fkey FOREIGN KEY (species_id) REFERENCES public.species(id) ON DELETE CASCADE;


--
-- Name: sightings sightings_ind_seen_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sightings
    ADD CONSTRAINT sightings_ind_seen_id_fkey FOREIGN KEY (ind_seen_id) REFERENCES public.individuals(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

