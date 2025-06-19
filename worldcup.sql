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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(60) NOT NULL,
    opponent_goals integer NOT NULL,
    winner_goals integer NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    name character varying(60) NOT NULL,
    team_id integer NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (453, 2018, 'Final', 2, 4, 1311, 1312);
INSERT INTO public.games VALUES (454, 2018, 'Third Place', 0, 2, 1313, 1314);
INSERT INTO public.games VALUES (455, 2018, 'Semi-Final', 1, 2, 1312, 1314);
INSERT INTO public.games VALUES (456, 2018, 'Semi-Final', 0, 1, 1311, 1313);
INSERT INTO public.games VALUES (457, 2018, 'Quarter-Final', 2, 3, 1312, 1320);
INSERT INTO public.games VALUES (458, 2018, 'Quarter-Final', 0, 2, 1314, 1322);
INSERT INTO public.games VALUES (459, 2018, 'Quarter-Final', 1, 2, 1313, 1324);
INSERT INTO public.games VALUES (460, 2018, 'Quarter-Final', 0, 2, 1311, 1326);
INSERT INTO public.games VALUES (461, 2018, 'Eighth-Final', 1, 2, 1314, 1328);
INSERT INTO public.games VALUES (462, 2018, 'Eighth-Final', 0, 1, 1322, 1330);
INSERT INTO public.games VALUES (463, 2018, 'Eighth-Final', 2, 3, 1313, 1332);
INSERT INTO public.games VALUES (464, 2018, 'Eighth-Final', 0, 2, 1324, 1334);
INSERT INTO public.games VALUES (465, 2018, 'Eighth-Final', 1, 2, 1312, 1336);
INSERT INTO public.games VALUES (466, 2018, 'Eighth-Final', 1, 2, 1320, 1338);
INSERT INTO public.games VALUES (467, 2018, 'Eighth-Final', 1, 2, 1326, 1340);
INSERT INTO public.games VALUES (468, 2018, 'Eighth-Final', 3, 4, 1311, 1342);
INSERT INTO public.games VALUES (469, 2014, 'Final', 0, 1, 1343, 1342);
INSERT INTO public.games VALUES (470, 2014, 'Third Place', 0, 3, 1345, 1324);
INSERT INTO public.games VALUES (471, 2014, 'Semi-Final', 0, 1, 1342, 1345);
INSERT INTO public.games VALUES (472, 2014, 'Semi-Final', 1, 7, 1343, 1324);
INSERT INTO public.games VALUES (473, 2014, 'Quarter-Final', 0, 1, 1345, 1352);
INSERT INTO public.games VALUES (474, 2014, 'Quarter-Final', 0, 1, 1342, 1313);
INSERT INTO public.games VALUES (475, 2014, 'Quarter-Final', 1, 2, 1324, 1328);
INSERT INTO public.games VALUES (476, 2014, 'Quarter-Final', 0, 1, 1343, 1311);
INSERT INTO public.games VALUES (477, 2014, 'Eighth-Final', 1, 2, 1324, 1360);
INSERT INTO public.games VALUES (478, 2014, 'Eighth-Final', 0, 2, 1328, 1326);
INSERT INTO public.games VALUES (479, 2014, 'Eighth-Final', 0, 2, 1311, 1364);
INSERT INTO public.games VALUES (480, 2014, 'Eighth-Final', 1, 2, 1343, 1366);
INSERT INTO public.games VALUES (481, 2014, 'Eighth-Final', 1, 2, 1345, 1334);
INSERT INTO public.games VALUES (482, 2014, 'Eighth-Final', 1, 2, 1352, 1370);
INSERT INTO public.games VALUES (483, 2014, 'Eighth-Final', 0, 1, 1342, 1330);
INSERT INTO public.games VALUES (484, 2014, 'Eighth-Final', 1, 2, 1313, 1374);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES ('France', 1311);
INSERT INTO public.teams VALUES ('Croatia', 1312);
INSERT INTO public.teams VALUES ('Belgium', 1313);
INSERT INTO public.teams VALUES ('England', 1314);
INSERT INTO public.teams VALUES ('Russia', 1320);
INSERT INTO public.teams VALUES ('Sweden', 1322);
INSERT INTO public.teams VALUES ('Brazil', 1324);
INSERT INTO public.teams VALUES ('Uruguay', 1326);
INSERT INTO public.teams VALUES ('Colombia', 1328);
INSERT INTO public.teams VALUES ('Switzerland', 1330);
INSERT INTO public.teams VALUES ('Japan', 1332);
INSERT INTO public.teams VALUES ('Mexico', 1334);
INSERT INTO public.teams VALUES ('Denmark', 1336);
INSERT INTO public.teams VALUES ('Spain', 1338);
INSERT INTO public.teams VALUES ('Portugal', 1340);
INSERT INTO public.teams VALUES ('Argentina', 1342);
INSERT INTO public.teams VALUES ('Germany', 1343);
INSERT INTO public.teams VALUES ('Netherlands', 1345);
INSERT INTO public.teams VALUES ('Costa Rica', 1352);
INSERT INTO public.teams VALUES ('Chile', 1360);
INSERT INTO public.teams VALUES ('Nigeria', 1364);
INSERT INTO public.teams VALUES ('Algeria', 1366);
INSERT INTO public.teams VALUES ('Greece', 1370);
INSERT INTO public.teams VALUES ('United States', 1374);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 484, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 1374, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

