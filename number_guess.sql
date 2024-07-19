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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (3, 'user_1721399192962', NULL, NULL);
INSERT INTO public.users VALUES (4, 'user_1721399192961', NULL, NULL);
INSERT INTO public.users VALUES (5, 'user_1721399214686', NULL, NULL);
INSERT INTO public.users VALUES (6, 'user_1721399214685', NULL, NULL);
INSERT INTO public.users VALUES (7, 'user_1721399222391', NULL, NULL);
INSERT INTO public.users VALUES (8, 'user_1721399222390', NULL, NULL);
INSERT INTO public.users VALUES (9, 'user_1721399318734', NULL, NULL);
INSERT INTO public.users VALUES (10, 'user_1721399318733', NULL, NULL);
INSERT INTO public.users VALUES (11, 'user_1721399437727', NULL, NULL);
INSERT INTO public.users VALUES (12, 'user_1721399437726', NULL, NULL);
INSERT INTO public.users VALUES (13, 'user_1721399483889', NULL, NULL);
INSERT INTO public.users VALUES (14, 'user_1721399483888', NULL, NULL);
INSERT INTO public.users VALUES (15, 'user_1721399492844', NULL, NULL);
INSERT INTO public.users VALUES (16, 'user_1721399492843', NULL, NULL);
INSERT INTO public.users VALUES (17, 'user_1721399786234', NULL, NULL);
INSERT INTO public.users VALUES (18, 'user_1721399786233', NULL, NULL);
INSERT INTO public.users VALUES (19, 'user_1721399984331', NULL, NULL);
INSERT INTO public.users VALUES (20, 'user_1721399984330', NULL, NULL);
INSERT INTO public.users VALUES (1, 'Andrea', 5, 3);
INSERT INTO public.users VALUES (23, 'user_1721401186303', 2, NULL);
INSERT INTO public.users VALUES (24, 'user_1721401186302', 1, NULL);
INSERT INTO public.users VALUES (26, 'user_1721401473307', 2, NULL);
INSERT INTO public.users VALUES (25, 'user_1721401473308', 5, NULL);
INSERT INTO public.users VALUES (28, 'user_1721401516253', 2, NULL);
INSERT INTO public.users VALUES (27, 'user_1721401516254', 5, NULL);
INSERT INTO public.users VALUES (30, 'user_1721401574656', 2, NULL);
INSERT INTO public.users VALUES (29, 'user_1721401574657', 5, NULL);
INSERT INTO public.users VALUES (32, 'user_1721401600678', 2, NULL);
INSERT INTO public.users VALUES (31, 'user_1721401600679', 5, NULL);
INSERT INTO public.users VALUES (34, 'user_1721402181437', 2, 81);
INSERT INTO public.users VALUES (33, 'user_1721402181438', 5, 231);
INSERT INTO public.users VALUES (36, 'user_1721402227008', 2, 86);
INSERT INTO public.users VALUES (35, 'user_1721402227009', 5, 492);
INSERT INTO public.users VALUES (21, 'user_1721401103257', 1, NULL);
INSERT INTO public.users VALUES (22, 'user_1721401103256', 1, NULL);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 36, true);


--
-- Name: users unique_username; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT unique_username UNIQUE (username);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

