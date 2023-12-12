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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(30) NOT NULL,
    radius_in_km integer,
    description text,
    is_dangerous boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    length_in_light_years integer,
    width_in_light_years integer,
    description text,
    is_dangerous boolean,
    age_in_billion_years numeric(5,2)
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
    name character varying(30) NOT NULL,
    distance_from_planet_in_km integer,
    radius_in_km integer,
    description text,
    is_inhabitable boolean,
    age_in_billion_years numeric(5,2),
    planet_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    days_in_a_year integer,
    radius_in_km integer,
    description text,
    is_inhabitable boolean,
    age_in_billion_years numeric(5,2),
    star_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    brightness_in_octilion_lumens integer,
    radius_in_km integer,
    description text,
    worth_exploring boolean,
    age_in_billion_years numeric(5,2),
    galaxy_id integer NOT NULL
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Asterion', 4, 'Small, fast-moving asteroid near Sun', false, 1);
INSERT INTO public.asteroid VALUES (2, 'Boreas', 15, 'Ice-covered asteroid in Upsilon Andromedae system', false, 2);
INSERT INTO public.asteroid VALUES (3, 'Caelum', 8, 'Metal-rich asteroid in M33 Var A system', true, 3);
INSERT INTO public.asteroid VALUES (4, 'Dysis', 25, 'Largest asteroid in NGC 4594 X-1 system', true, 4);
INSERT INTO public.asteroid VALUES (5, 'Eos', 10, 'Brightly reflecting asteroid near M51 ULX-7', false, 5);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 1000, 'Our home galaxy with a spiral shape', false, 13.60);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 220000, 200000, 'Nearest spiral galaxy to Milky Way', false, 10.00);
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 60000, 55000, 'Part of the Local Group with Milky Way', false, 13.00);
INSERT INTO public.galaxy VALUES (4, 'Sombrero Galaxy', 50000, 10000, 'Known for bright nucleus and large central bulge', true, 12.70);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy', 60000, 50000, 'Classic spiral shape with active star formation', false, 13.00);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 14000, 14000, 'Satellite galaxy of the Milky Way', true, 13.20);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 384400, 1737, 'Natural satellite of Terra', false, 4.53, 1);
INSERT INTO public.moon VALUES (2, 'Helios I', 222000, 1120, 'First moon of Solara', false, 3.70, 2);
INSERT INTO public.moon VALUES (3, 'Helios II', 346000, 940, 'Second moon of Solara', false, 3.75, 2);
INSERT INTO public.moon VALUES (4, 'Astra', 105300, 560, 'Volcanic moon of Andromedae I', false, 2.87, 3);
INSERT INTO public.moon VALUES (5, 'Borea', 203500, 780, 'Frozen moon of Andromedae II', false, 2.95, 4);
INSERT INTO public.moon VALUES (6, 'M33 Alpha', 90000, 330, 'Barren rocky moon of M33 Prime', false, 2.98, 5);
INSERT INTO public.moon VALUES (7, 'M33 Beta', 120400, 410, 'Methane lakes moon of M33 Secunda', false, 3.15, 6);
INSERT INTO public.moon VALUES (8, 'Sombrar Minor', 185200, 650, 'Smallest moon of Sombrar I', false, 1.35, 7);
INSERT INTO public.moon VALUES (9, 'Sombrar Major', 250000, 950, 'Largest moon of Sombrar I', false, 1.38, 7);
INSERT INTO public.moon VALUES (10, 'Desertica', 167000, 500, 'Moon with sand dunes of Sombrar II', false, 1.55, 8);
INSERT INTO public.moon VALUES (11, 'Aqua Moon', 220500, 720, 'Ocean-covered moon of Whirl I', true, 2.18, 9);
INSERT INTO public.moon VALUES (12, 'Eternal Light', 130000, 600, 'Illuminated moon of Whirl II', false, 2.47, 10);
INSERT INTO public.moon VALUES (13, 'Doradus Minor', 100000, 450, 'Smaller moon of Doradus I', false, 0.48, 11);
INSERT INTO public.moon VALUES (14, 'Doradus Major', 150000, 680, 'Largest moon of Doradus I', false, 0.49, 11);
INSERT INTO public.moon VALUES (15, 'Terra II', 450000, 1600, 'Second moon of Terra', false, 4.55, 1);
INSERT INTO public.moon VALUES (16, 'Andromedae III', 250000, 840, 'Third moon of Andromedae I', false, 2.88, 3);
INSERT INTO public.moon VALUES (17, 'M33 Gamma', 140300, 390, 'Third moon of M33 Prime', false, 3.01, 5);
INSERT INTO public.moon VALUES (18, 'Sombrar III', 210000, 700, 'Third moon of Sombrar II', false, 1.60, 8);
INSERT INTO public.moon VALUES (19, 'Whirl Minor', 185000, 500, 'Smaller moon of Whirl II', false, 2.48, 10);
INSERT INTO public.moon VALUES (20, 'Doradus III', 175000, 520, 'Third moon of Doradus II', false, 0.67, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Terra', 365, 6371, 'Earth-like planet in the habitable zone', true, 4.50, 1);
INSERT INTO public.planet VALUES (2, 'Solara', 450, 7500, 'Gas giant with spectacular rings', false, 3.80, 1);
INSERT INTO public.planet VALUES (3, 'Andromedae I', 320, 5500, 'Rocky planet with active volcanoes', false, 2.90, 2);
INSERT INTO public.planet VALUES (4, 'Andromedae II', 800, 9800, 'Icy world with a thick atmosphere', false, 3.00, 2);
INSERT INTO public.planet VALUES (5, 'M33 Prime', 200, 4200, 'Small, barren planet', false, 3.00, 3);
INSERT INTO public.planet VALUES (6, 'M33 Secunda', 480, 8600, 'Planet with liquid methane lakes', false, 3.20, 3);
INSERT INTO public.planet VALUES (7, 'Sombrar I', 360, 10300, 'Gas giant orbiting close to its star', false, 1.40, 4);
INSERT INTO public.planet VALUES (8, 'Sombrar II', 720, 4900, 'Desert world with ancient ruins', false, 1.60, 4);
INSERT INTO public.planet VALUES (9, 'Whirl I', 390, 5300, 'Oceanic planet with primitive life', true, 2.20, 5);
INSERT INTO public.planet VALUES (10, 'Whirl II', 670, 9500, 'Tidally locked planet, half in eternal daylight', false, 2.50, 5);
INSERT INTO public.planet VALUES (11, 'Doradus I', 305, 6000, 'Rich in valuable minerals', false, 0.50, 6);
INSERT INTO public.planet VALUES (12, 'Doradus II', 500, 11000, 'Giant planet with a dense atmosphere', false, 0.70, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 35, 696340, 'The central star of the solar system', true, 4.60, 1);
INSERT INTO public.star VALUES (2, 'Upsilon Andromedae', 100, 1610000, 'Hosts a multi-planet system', true, 3.10, 2);
INSERT INTO public.star VALUES (3, 'M33 Var A', 10000, 24053000, 'A notable luminous blue variable', false, 3.24, 3);
INSERT INTO public.star VALUES (4, 'NGC 4594 X-1', 10000, 567230000, 'One of the brightest in M104', true, 1.50, 4);
INSERT INTO public.star VALUES (5, 'M51 ULX-7', 15000, 346190000, 'The biggest star in its galaxy', true, 2.43, 5);
INSERT INTO public.star VALUES (6, 'S Doradus', 100000000, 180000000, 'One of the brightest stars known', true, 0.60, 6);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 5, true);


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
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: asteroid asteroid_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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


