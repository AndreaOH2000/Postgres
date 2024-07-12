--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: constelations; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constelations (
    constelations_id integer NOT NULL,
    name character varying(64) NOT NULL,
    description text,
    num_of_stars integer NOT NULL,
    visible boolean NOT NULL
);


ALTER TABLE public.constelations OWNER TO freecodecamp;

--
-- Name: constelations_constelation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constelations_constelation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constelations_constelation_id_seq OWNER TO freecodecamp;

--
-- Name: constelations_constelation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constelations_constelation_id_seq OWNED BY public.constelations.constelations_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(64) NOT NULL,
    diameter_lyears numeric(10,2) NOT NULL,
    spiral boolean NOT NULL,
    num_stars integer NOT NULL,
    constelations_id integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(64) NOT NULL,
    planet_id integer NOT NULL,
    radius numeric(10,2) NOT NULL,
    habitable boolean,
    mass numeric(15,6),
    discovered_by text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(64) NOT NULL,
    star_id integer NOT NULL,
    habitable boolean,
    num_of_moons integer,
    radius numeric(10,2)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(64) NOT NULL,
    galaxy_id integer,
    age integer,
    type character varying(32) NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: constelations constelations_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constelations ALTER COLUMN constelations_id SET DEFAULT nextval('public.constelations_constelation_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constelations; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constelations VALUES (1, 'Orion', 'A prominent constellation located on the celestial equator', 7, true);
INSERT INTO public.constelations VALUES (2, 'Andromeda', 'A large northern constellation', 12, true);
INSERT INTO public.constelations VALUES (3, 'Cassiopeia', 'A W-shaped constellation', 5, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 105700.00, true, 10, 1);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 220000.00, true, 1000, 2);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 60000.00, true, 400, 2);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 76000.00, true, 100, 1);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', 14000.00, false, 3000, 3);
INSERT INTO public.galaxy VALUES (6, 'Small Magellanic Cloud', 7000.00, false, 300, 3);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 1737.40, false, 734200000.000000, 'Galileo Galilei');
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 11.27, false, 106590000.000000, 'Asaph Hall');
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 6.20, false, 147620000.000000, 'Asaph Hall');
INSERT INTO public.moon VALUES (4, 'Io', 3, 1821.60, false, 893190000.000000, 'Galileo Galilei');
INSERT INTO public.moon VALUES (5, 'Europa', 3, 1560.80, false, 479980000.000000, 'Galileo Galilei');
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, 2634.10, false, 148190000.000000, 'Galileo Galilei');
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 2410.30, false, 107590000.000000, 'Galileo Galilei');
INSERT INTO public.moon VALUES (8, 'Titan', 4, 2574.70, false, 134520000.000000, 'Christiaan Huygens');
INSERT INTO public.moon VALUES (9, 'Enceladus', 4, 252.10, false, 108000000.000000, 'William Herschel');
INSERT INTO public.moon VALUES (10, 'Mimas', 4, 198.20, false, 374930000.000000, 'William Herschel');
INSERT INTO public.moon VALUES (11, 'Tethys', 4, 531.10, false, 617440000.000000, 'Giovanni Domenico Cassini');
INSERT INTO public.moon VALUES (12, 'Dione', 4, 561.40, false, 109550000.000000, 'Giovanni Domenico Cassini');
INSERT INTO public.moon VALUES (13, 'Rhea', 4, 763.80, false, 230650000.000000, 'Giovanni Domenico Cassini');
INSERT INTO public.moon VALUES (14, 'Hyperion', 4, 135.00, false, 561950000.000000, 'William Cranch Bond');
INSERT INTO public.moon VALUES (15, 'Iapetus', 4, 734.50, false, 180560000.000000, 'Giovanni Domenico Cassini');
INSERT INTO public.moon VALUES (16, 'Proxima b Moon 1', 5, 700.00, false, 597200000.000000, 'Unknown');
INSERT INTO public.moon VALUES (17, 'Proxima c Moon 1', 6, 600.00, false, 486700000.000000, 'Unknown');
INSERT INTO public.moon VALUES (18, 'Sirius b Moon 1', 7, 500.00, false, 328500000.000000, 'Unknown');
INSERT INTO public.moon VALUES (19, 'Vega b Moon 1', 8, 400.00, false, 240900000.000000, 'Unknown');
INSERT INTO public.moon VALUES (20, 'Betelgeuse b Moon 1', 9, 300.00, false, 189800000.000000, 'Unknown');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, true, 1, 6371.00);
INSERT INTO public.planet VALUES (2, 'Mars', 1, false, 2, 3389.50);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, false, 79, 69911.00);
INSERT INTO public.planet VALUES (4, 'Saturn', 1, false, 82, 58232.00);
INSERT INTO public.planet VALUES (5, 'Proxima b', 2, false, 0, 6371.00);
INSERT INTO public.planet VALUES (6, 'Proxima c', 2, false, 0, 7043.00);
INSERT INTO public.planet VALUES (7, 'Sirius b', 3, false, 0, 1163.00);
INSERT INTO public.planet VALUES (8, 'Vega b', 4, false, 0, 12000.00);
INSERT INTO public.planet VALUES (9, 'Betelgeuse b', 5, false, 0, 14300.00);
INSERT INTO public.planet VALUES (10, 'Rigel b', 6, false, 0, 12300.00);
INSERT INTO public.planet VALUES (11, 'Rigel c', 6, false, 0, 10000.00);
INSERT INTO public.planet VALUES (12, 'Rigel d', 6, false, 0, 11000.00);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 46, 'G-type');
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 2, 45, 'M-type');
INSERT INTO public.star VALUES (3, 'Sirius', 1, 30, 'A-type');
INSERT INTO public.star VALUES (4, 'Vega', 1, 45, 'A-type');
INSERT INTO public.star VALUES (5, 'Betelgeuse', 1, 87, 'M-type');
INSERT INTO public.star VALUES (6, 'Rigel', 1, 8, 'B-type');


--
-- Name: constelations_constelation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constelations_constelation_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: constelations constelations_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constelations
    ADD CONSTRAINT constelations_name_key UNIQUE (name);


--
-- Name: constelations constelations_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constelations
    ADD CONSTRAINT constelations_pkey PRIMARY KEY (constelations_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_constelations_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constelations_id_fkey FOREIGN KEY (constelations_id) REFERENCES public.constelations(constelations_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

