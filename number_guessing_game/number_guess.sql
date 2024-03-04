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
-- Name: number_guess; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.number_guess (
    username character varying(22) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.number_guess OWNER TO freecodecamp;

--
-- Data for Name: number_guess; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.number_guess VALUES ('Two', 14, 2);
INSERT INTO public.number_guess VALUES ('Helen', 2, 3);
INSERT INTO public.number_guess VALUES ('user_1709556201614', 2, 8);
INSERT INTO public.number_guess VALUES ('user_1709556201615', 5, 8);
INSERT INTO public.number_guess VALUES ('user_1709556222183', 2, 8);
INSERT INTO public.number_guess VALUES ('user_1709556222184', 5, 8);
INSERT INTO public.number_guess VALUES ('user_1709556252326', 2, 8);
INSERT INTO public.number_guess VALUES ('One', 8, 1);
INSERT INTO public.number_guess VALUES ('user_1709556252327', 5, 8);
INSERT INTO public.number_guess VALUES ('user_1709556299351', 2, 8);
INSERT INTO public.number_guess VALUES ('user_1709555677996', 2, 174);
INSERT INTO public.number_guess VALUES ('user_1709556299352', 5, 8);
INSERT INTO public.number_guess VALUES ('user_1709555677997', 5, 386);
INSERT INTO public.number_guess VALUES ('user_1709555727386', 2, 708);
INSERT INTO public.number_guess VALUES ('user_1709556314426', 2, 8);
INSERT INTO public.number_guess VALUES ('user_1709555727387', 5, 48);
INSERT INTO public.number_guess VALUES ('user_1709555753602', 2, 353);
INSERT INTO public.number_guess VALUES ('user_1709556314427', 5, 8);
INSERT INTO public.number_guess VALUES ('user_1709555753603', 5, 153);
INSERT INTO public.number_guess VALUES ('user_1709555825406', 2, 200);
INSERT INTO public.number_guess VALUES ('user_1709555825407', 5, 132);
INSERT INTO public.number_guess VALUES ('user_1709556350383', 2, 515);
INSERT INTO public.number_guess VALUES ('user_1709555846224', 2, 469);
INSERT INTO public.number_guess VALUES ('user_1709555846225', 5, 17);
INSERT INTO public.number_guess VALUES ('user_1709556350384', 5, 182);


--
-- Name: number_guess number_guess_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.number_guess
    ADD CONSTRAINT number_guess_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

