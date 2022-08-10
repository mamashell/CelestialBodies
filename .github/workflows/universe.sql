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
-- Name: constellations; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellations (
    constellations_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy character varying(60),
    description text,
    type character varying(60),
    discovered_by character varying(60)
);


ALTER TABLE public.constellations OWNER TO freecodecamp;

--
-- Name: constellations_constellations_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellations_constellations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellations_constellations_id_seq OWNER TO freecodecamp;

--
-- Name: constellations_constellations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellations_constellations_id_seq OWNED BY public.constellations.constellations_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    origin_of_name text,
    magnitude numeric NOT NULL,
    distance character varying(60),
    constellation character varying(60),
    star_id integer
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
    name character varying(60) NOT NULL,
    planet character varying(60) NOT NULL,
    shape character varying(60),
    discovery_date integer,
    planet_id integer
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
    name character varying(60) NOT NULL,
    planet_types character varying(60) NOT NULL,
    has_life boolean,
    moon character varying(60),
    has_rings boolean,
    mass numeric,
    star_id integer
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
    name character varying(60) NOT NULL,
    distance_in_ly numeric,
    magnitude numeric,
    constellation character varying(60),
    galaxy_id integer
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
-- Name: constellations constellations_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellations ALTER COLUMN constellations_id SET DEFAULT nextval('public.constellations_constellations_id_seq'::regclass);


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
-- Data for Name: constellations; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellations VALUES (1, 'Sagittarius', 'Milky Way', 'The Archer', 'Zodiac', 'Almagest');
INSERT INTO public.constellations VALUES (2, 'Dorado', 'Large Megallanic Cloud', 'The Goldfish', 'Animal', 'Bayer');
INSERT INTO public.constellations VALUES (3, 'Tucana', 'Small Megallanic Cloud', 'The Toucan', 'Animal', 'Bayer');
INSERT INTO public.constellations VALUES (4, 'Andromeda', 'Andromeda Galaxy', 'Daughter of Queen Cassiopeia', 'Myth', 'Almagest');
INSERT INTO public.constellations VALUES (5, 'Triangulum', 'Triangulum Galaxy', 'The Triangle', 'Misc', 'Almagest');
INSERT INTO public.constellations VALUES (6, 'Centaurus A', 'Centaurus', 'The Centaur', 'Myth', 'Almagest');
INSERT INTO public.constellations VALUES (7, 'Ursa Major', 'Bodes Galaxy', 'The Great Bear', 'Myth', 'Almagest');
INSERT INTO public.constellations VALUES (8, 'Sculptor', 'Sculptor Galaxy', 'The Sculptors Workshop', 'Scientific', 'Lacaille');
INSERT INTO public.constellations VALUES (9, 'Ursa Minor', 'Milkyway Galaxy', 'The Lesser Bear', 'Myth', 'Almagest');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Named after appearance of a band of light', -6.5, '0', 'Sagittarius', NULL);
INSERT INTO public.galaxy VALUES (2, 'Large Megallanic Cloud', 'Named after Ferdinand Megallan', 0.9, '160 kly', 'Dorado', NULL);
INSERT INTO public.galaxy VALUES (3, 'Small Megallanic Cloud', 'Named after Ferdinand Megallan', 2.7, '200 kly', 'Tucana', NULL);
INSERT INTO public.galaxy VALUES (4, 'Andromeda Galaxy', 'Named after the constellation of the same name', 3.4, '2.5 Mly', 'Andromeda', NULL);
INSERT INTO public.galaxy VALUES (5, 'Triangulum Galaxy', 'Named after the constellation of the same name', 5.7, '2.9 Mly', 'Triangulum', NULL);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 'NULL', 6.84, '13.7 Mly', 'Centaurus', NULL);
INSERT INTO public.galaxy VALUES (7, 'Bodes Galaxy', 'Named after Johann Elert Bode', 6.94, '12 Mly', 'Ursa Major', NULL);
INSERT INTO public.galaxy VALUES (8, 'Sculptor Galaxy', 'Named after the constellation of the same name', 7.2, '12 Mly', 'Sculptor', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth', 'Spherical', -3000000, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Mars', 'Irregular', 1877, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Mars', 'Irregular', 1877, NULL);
INSERT INTO public.moon VALUES (4, 'Io', 'Jupiter', 'Spherical', 1610, NULL);
INSERT INTO public.moon VALUES (5, 'Ganymede', 'Jupiter', 'Spherical', 1610, NULL);
INSERT INTO public.moon VALUES (6, 'Callisto', 'Jupiter', 'Spherical', 1610, NULL);
INSERT INTO public.moon VALUES (7, 'Titan', 'Saturn', 'Spherical', 1655, NULL);
INSERT INTO public.moon VALUES (8, 'Rhea', 'Saturn', 'Spherical', 1672, NULL);
INSERT INTO public.moon VALUES (9, 'Iapetus', 'Saturn', 'Spherical', 1671, NULL);
INSERT INTO public.moon VALUES (10, 'Umbriel', 'Uranus', 'Spherical', 1851, NULL);
INSERT INTO public.moon VALUES (11, 'Titania', 'Uranus', 'Spherical', 1787, NULL);
INSERT INTO public.moon VALUES (12, 'Oberon', 'Uranus', 'Spherical', 1787, NULL);
INSERT INTO public.moon VALUES (13, 'Triton', 'Neptune', 'Spherical', 1846, NULL);
INSERT INTO public.moon VALUES (14, 'Nereid', 'Neptune', 'Irregular', 1949, NULL);
INSERT INTO public.moon VALUES (15, 'Proteus', 'Neptune', 'Irregular', 1989, NULL);
INSERT INTO public.moon VALUES (16, 'Charon', 'Pluto', 'Irregular', 1978, NULL);
INSERT INTO public.moon VALUES (17, 'Nix', 'Pluto', 'Irregular', 2005, NULL);
INSERT INTO public.moon VALUES (18, 'Hydra', 'Pluto', 'Irregular', 2005, NULL);
INSERT INTO public.moon VALUES (19, 'Amalthea', 'Jupiter', 'Irregular', 1892, NULL);
INSERT INTO public.moon VALUES (20, 'Calypso', 'Saturn', 'Irregular', 1980, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Venus', 'Terrestial', false, 'NULL', false, 4.87, NULL);
INSERT INTO public.planet VALUES (3, 'Earth', 'Terrestial', true, 'Moon', false, 5.97, NULL);
INSERT INTO public.planet VALUES (4, 'Mars', 'Terrestial', false, 'Phobos', false, 0.642, NULL);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Giant', false, 'Ganymede', true, 1898, NULL);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Giant', false, 'Titan', true, 568, NULL);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice', false, 'Titania', true, 86.8, NULL);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Ice', false, 'Triton', true, 102, NULL);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Dwarf', false, 'Charon', false, 0.0130, NULL);
INSERT INTO public.planet VALUES (1, 'Mercury', 'Terrestial', false, 'N/A', false, 0.330, NULL);
INSERT INTO public.planet VALUES (11, 'Mars', 'Terrestial', NULL, 'Deimos', NULL, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'Jupiter', 'Giant', NULL, 'Callisto', NULL, NULL, NULL);
INSERT INTO public.planet VALUES (13, 'Jupiter', 'Giant', NULL, 'Io', NULL, NULL, NULL);
INSERT INTO public.planet VALUES (14, 'Saturn', 'Giant', NULL, 'Rhea', NULL, NULL, NULL);
INSERT INTO public.planet VALUES (15, 'Saturn', 'Giant', NULL, 'Iapetus', NULL, NULL, NULL);
INSERT INTO public.planet VALUES (16, 'Uranus', 'Ice', NULL, 'Oberon', NULL, NULL, NULL);
INSERT INTO public.planet VALUES (17, 'Uranus', 'Ice', NULL, 'Umbriel', NULL, NULL, NULL);
INSERT INTO public.planet VALUES (18, 'Neptune', 'Ice', NULL, 'Proteus', NULL, NULL, NULL);
INSERT INTO public.planet VALUES (19, 'Neptune', 'Ice', NULL, 'Nereid', NULL, NULL, NULL);
INSERT INTO public.planet VALUES (20, 'Pluto', 'Dwarf', NULL, 'Nix', NULL, NULL, NULL);
INSERT INTO public.planet VALUES (21, 'Pluto', 'Dwarf', NULL, 'Hydra', NULL, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 0.000016, -26.74, 'N/A', NULL);
INSERT INTO public.star VALUES (2, 'Sirius', 8.6, -1.46, 'Canis Major', NULL);
INSERT INTO public.star VALUES (3, 'Canopus', 310, -0.74, 'Carina', NULL);
INSERT INTO public.star VALUES (4, 'Rigel Kentaurus and Toliman', 4.4, -0.27, 'Centaurus', NULL);
INSERT INTO public.star VALUES (5, 'Arcturus', 37.0, -0.05, 'Bootes', NULL);
INSERT INTO public.star VALUES (6, 'Vega', 25.0, 0.03, 'Lyra', NULL);
INSERT INTO public.star VALUES (7, 'Capella', 43.0, 0.08, 'Auriga', NULL);
INSERT INTO public.star VALUES (8, 'Rigel', 860.0, 0.13, 'Orion', NULL);
INSERT INTO public.star VALUES (9, 'Procyon', 11.0, 0.34, 'Canis Major', NULL);
INSERT INTO public.star VALUES (10, 'Achemar', 139.0, 0.46, 'Eridanus', NULL);


--
-- Name: constellations_constellations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellations_constellations_id_seq', 9, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 21, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: constellations constellations_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellations
    ADD CONSTRAINT constellations_name_key UNIQUE (name);


--
-- Name: constellations constellations_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellations
    ADD CONSTRAINT constellations_pkey PRIMARY KEY (constellations_id);


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
-- Name: planet unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_moon_name UNIQUE (moon);


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

