--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE game;
--
-- Name: game; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE game WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE game OWNER TO freecodecamp;

\connect game

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
    username character varying(22) NOT NULL,
    games_played integer NOT NULL,
    best_game integer NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('Test', 12, 3);
INSERT INTO public.users VALUES ('user_1685220693858', 0, 0);
INSERT INTO public.users VALUES ('user_1685220693857', 0, 0);
INSERT INTO public.users VALUES ('user_1685220697631', 0, 0);
INSERT INTO public.users VALUES ('user_1685220697630', 0, 0);
INSERT INTO public.users VALUES ('user_1685220731071', 0, 0);
INSERT INTO public.users VALUES ('user_1685220731070', 0, 0);
INSERT INTO public.users VALUES ('user_1685220951253', 0, 0);
INSERT INTO public.users VALUES ('user_1685220951252', 0, 0);
INSERT INTO public.users VALUES ('user_1685221532928', 0, 0);
INSERT INTO public.users VALUES ('user_1685221532927', 0, 0);
INSERT INTO public.users VALUES ('user_1685221597115', 0, 0);
INSERT INTO public.users VALUES ('user_1685221597114', 0, 0);
INSERT INTO public.users VALUES ('user_1685221952136', 0, 0);
INSERT INTO public.users VALUES ('user_1685221952135', 0, 0);
INSERT INTO public.users VALUES ('user_1685221966597', 0, 0);
INSERT INTO public.users VALUES ('user_1685221966596', 0, 0);
INSERT INTO public.users VALUES ('user_1685222130300', 0, 0);
INSERT INTO public.users VALUES ('user_1685222130299', 0, 0);
INSERT INTO public.users VALUES ('Alan', 0, 0);
INSERT INTO public.users VALUES ('user_1685222157338', 0, 0);
INSERT INTO public.users VALUES ('user_1685222157337', 0, 0);
INSERT INTO public.users VALUES ('user_1685222421805', 2, 0);
INSERT INTO public.users VALUES ('user_1685222421806', 5, 0);
INSERT INTO public.users VALUES ('Scott', 3, 0);
INSERT INTO public.users VALUES ('user_1685222788827', 2, 633);
INSERT INTO public.users VALUES ('user_1685222788828', 5, 156);
INSERT INTO public.users VALUES ('user_1685222813992', 2, 810);
INSERT INTO public.users VALUES ('user_1685222813993', 5, 998);
INSERT INTO public.users VALUES ('user_1685222832616', 2, 697);
INSERT INTO public.users VALUES ('user_1685222832617', 5, 835);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);


--
-- PostgreSQL database dump complete
--

