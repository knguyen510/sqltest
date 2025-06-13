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
-- Name: chemical_element; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.chemical_element (
    symbol character varying(3),
    name character varying(30) NOT NULL,
    chemical_element_id integer NOT NULL
);


ALTER TABLE public.chemical_element OWNER TO freecodecamp;

--
-- Name: chemical_element_chemical_element_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.chemical_element_chemical_element_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chemical_element_chemical_element_id_seq OWNER TO freecodecamp;

--
-- Name: chemical_element_chemical_element_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.chemical_element_chemical_element_id_seq OWNED BY public.chemical_element.chemical_element_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40),
    is_active boolean,
    has_bar boolean,
    discovery_year integer NOT NULL,
    diameter_ly numeric(20,5)
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
    name character varying(40),
    planet_id integer NOT NULL,
    discovery_year integer NOT NULL,
    description text
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
    name character varying(40),
    star_id integer,
    description text,
    discovery_year integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_composition; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_composition (
    percentage double precision,
    name character varying(30) NOT NULL,
    planet_composition_id integer NOT NULL,
    planet_id integer,
    chemical_element_id integer
);


ALTER TABLE public.planet_composition OWNER TO freecodecamp;

--
-- Name: planet_composition_planet_composition_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_composition_planet_composition_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_composition_planet_composition_id_seq OWNER TO freecodecamp;

--
-- Name: planet_composition_planet_composition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_composition_planet_composition_id_seq OWNED BY public.planet_composition.planet_composition_id;


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
    name character varying(40),
    galaxy_id integer,
    discovery_year integer NOT NULL,
    description text
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
-- Name: chemical_element chemical_element_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.chemical_element ALTER COLUMN chemical_element_id SET DEFAULT nextval('public.chemical_element_chemical_element_id_seq'::regclass);


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
-- Name: planet_composition planet_composition_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_composition ALTER COLUMN planet_composition_id SET DEFAULT nextval('public.planet_composition_planet_composition_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: chemical_element; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.chemical_element VALUES ('H', 'Hydrogen', 1);
INSERT INTO public.chemical_element VALUES ('He', 'Helium', 2);
INSERT INTO public.chemical_element VALUES ('Fe', 'Iron', 3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', true, true, -1610, 105700.00000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', true, false, 964, 220000.00000);
INSERT INTO public.galaxy VALUES (3, 'Whirlpool', false, true, 1773, 60000.00000);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', false, false, 1781, 50000.00000);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', true, false, 1654, 60000.00000);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', true, true, 1781, 70000.00000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, -1610, 'Earth''s only natural satellite, influences tides');
INSERT INTO public.moon VALUES (2, 'Europa', 2, 1610, 'Jupiter''s icy moon with subsurface salty ocean');
INSERT INTO public.moon VALUES (3, 'Ganymede', 2, 1610, 'Largest moon in solar system, has magnetic field');
INSERT INTO public.moon VALUES (4, 'Callisto', 2, 1610, 'Heavily cratered moon with ancient surface');
INSERT INTO public.moon VALUES (5, 'Io', 2, 1610, 'Most volcanically active body in solar system');
INSERT INTO public.moon VALUES (6, 'Titan', 8, 1655, 'Only moon with dense atmosphere, liquid methane lakes');
INSERT INTO public.moon VALUES (7, 'Enceladus', 8, 1789, 'Ice-covered moon with water vapor plumes');
INSERT INTO public.moon VALUES (8, 'Mimas', 8, 1789, 'Moon with giant crater resembling Death Star');
INSERT INTO public.moon VALUES (9, 'Phobos', 3, 1877, 'Mars'' inner moon slowly spiraling inward');
INSERT INTO public.moon VALUES (10, 'Deimos', 3, 1877, 'Mars'' smaller outer moon with smooth surface');
INSERT INTO public.moon VALUES (11, 'Sirius b-1', 4, 2025, 'First exomoon detected around white dwarf');
INSERT INTO public.moon VALUES (12, 'Orion b-I', 5, 2040, 'Tidally heated moon with silicate geysers');
INSERT INTO public.moon VALUES (13, 'Andromeda-1a', 6, 2035, 'Moon with thin oxygen atmosphere');
INSERT INTO public.moon VALUES (14, 'Whirlpool-1a', 7, 2022, 'Captured planetesimal with irregular orbit');
INSERT INTO public.moon VALUES (15, 'Almach Prime I', 9, 2048, 'Tidally locked moon with metal-rich crust');
INSERT INTO public.moon VALUES (16, 'Betelgeuse c-1', 10, 2031, 'Cryomoon with surface hydrocarbon lakes');
INSERT INTO public.moon VALUES (17, 'Andromeda-2a', 11, 2037, 'Subsurface ocean moon with hydrothermal vents');
INSERT INTO public.moon VALUES (18, 'Whirlpool-2b', 12, 2029, 'Carbon-rich moon with diamond mountains');
INSERT INTO public.moon VALUES (19, 'Rhea', 8, 1672, 'Saturn''s second largest moon with thin atmosphere');
INSERT INTO public.moon VALUES (20, 'Hyperion', 8, 1848, 'Saturn''s sponge-like moon with chaotic rotation');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 'Blue planet with liquid water and life', -1610);
INSERT INTO public.planet VALUES (2, 'Jupiter', 1, 'Gas giant with Great Red Spot storm', -1610);
INSERT INTO public.planet VALUES (3, 'Mars', 1, 'Red planet with Olympus Mons volcano', -1610);
INSERT INTO public.planet VALUES (4, 'Sirius b', 2, 'White dwarf companion to Sirius A', 1862);
INSERT INTO public.planet VALUES (5, 'Orion b', 4, 'Hot Jupiter orbiting Betelgeuse', 2021);
INSERT INTO public.planet VALUES (6, 'Andromeda-1', 5, 'First exoplanet discovered in Andromeda', 2032);
INSERT INTO public.planet VALUES (7, 'Whirlpool-1', 6, 'Rogue planet ejected from NGC 5195 system', 2018);
INSERT INTO public.planet VALUES (8, 'Venus', 1, 'Hottest planet with runaway greenhouse effect', -1610);
INSERT INTO public.planet VALUES (9, 'Almach Prime', 3, 'Tidally locked planet in binary star system', 2045);
INSERT INTO public.planet VALUES (10, 'Betelgeuse c', 4, 'Ice giant in outer reaches of red supergiant system', 2028);
INSERT INTO public.planet VALUES (11, 'Andromeda-2', 5, 'Ocean world with subsurface life signs', 2035);
INSERT INTO public.planet VALUES (12, 'Whirlpool-2', 6, 'Carbon planet with diamond core', 2023);


--
-- Data for Name: planet_composition; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_composition VALUES (89.8, 'Hydrogen Atmosphere', 4, 2, 1);
INSERT INTO public.planet_composition VALUES (10.2, 'Helium Mix', 5, 2, 2);
INSERT INTO public.planet_composition VALUES (32.1, 'Iron Core', 6, 1, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, -1610, 'Our solar system''s G-type main-sequence star');
INSERT INTO public.star VALUES (2, 'Sirius', 1, 1844, 'Brightest star in Earth''s night sky, binary system');
INSERT INTO public.star VALUES (3, 'Almach', 2, 964, 'Spectacular colorful double star in Andromeda');
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 1836, 'Red supergiant in Orion, one of largest known stars');
INSERT INTO public.star VALUES (5, 'M31-V1', 2, 1923, 'First Cepheid variable found in Andromeda Galaxy');
INSERT INTO public.star VALUES (6, 'NGC 5195-S1', 3, 2005, 'Brightest star in Whirlpool Galaxy''s companion');


--
-- Name: chemical_element_chemical_element_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.chemical_element_chemical_element_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_composition_planet_composition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_composition_planet_composition_id_seq', 6, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, true);


--
-- Name: planet_composition composition_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_composition
    ADD CONSTRAINT composition_name_unique UNIQUE (name);


--
-- Name: chemical_element element_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.chemical_element
    ADD CONSTRAINT element_name_unique UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: chemical_element pk_chemical_element_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.chemical_element
    ADD CONSTRAINT pk_chemical_element_id PRIMARY KEY (chemical_element_id);


--
-- Name: planet_composition planet_composition_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_composition
    ADD CONSTRAINT planet_composition_pkey PRIMARY KEY (planet_composition_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: planet_composition fk_element; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_composition
    ADD CONSTRAINT fk_element FOREIGN KEY (chemical_element_id) REFERENCES public.chemical_element(chemical_element_id);


--
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet_composition fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_composition
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

