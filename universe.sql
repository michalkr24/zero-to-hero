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
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text,
    mass_milions_sm integer,
    centre_of_galaxy boolean,
    galaxy_id integer
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_hole_black_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_hole_black_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_hole_black_hole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    constellation character varying(30),
    galaxy_type character varying(30) NOT NULL,
    size_ly integer,
    distance_mps numeric(10,3),
    apparent_magnitude numeric(7,3)
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
    name character varying(40) NOT NULL,
    radius_km integer,
    temperature_k integer,
    is_water boolean,
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
    name character varying(40) NOT NULL,
    mass_me numeric(10,3),
    radius_re numeric(10,3),
    surface_pressure_pa integer,
    temperature_k integer,
    ring_system boolean,
    number_of_satellites integer,
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
    name character varying(40) NOT NULL,
    constellation character varying(30),
    evolutionary_stage character varying(40),
    mass_sm numeric(10,3),
    temperature_k integer,
    age_myr integer,
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
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_hole_black_hole_id_seq'::regclass);


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
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole VALUES (1, 'Tonantzintla 618', 'TON 618 is a quasar located in the constellation Canes Venatici', 41000, true, NULL);
INSERT INTO public.black_hole VALUES (2, 'Holmberg 15A*', 'Holmberg 15A* is a suppermassive black hole at the centre of Holmberg 15A galaxy.', 40000, true, NULL);
INSERT INTO public.black_hole VALUES (3, 'M87*', 'M87* is a suppermassive black hole at the centre of Messier 87 galaxy.', 7000, true, 2);
INSERT INTO public.black_hole VALUES (4, 'Sagittarius A*', 'Sgr A* is a suppermassive black hole at the centre of Milky Way galaxy.', 4, true, 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Sagittarius', 'Barred spiral', 87400, NULL, 5.000);
INSERT INTO public.galaxy VALUES (2, 'Messier 87', 'Virgo', 'Supergiant elliptical', 132000, 16.400, 8.600);
INSERT INTO public.galaxy VALUES (3, 'Andromeda Galaxy', 'Andromeda', 'Barred spiral', 152000, 0.765, 3.440);
INSERT INTO public.galaxy VALUES (4, 'Large Megellanic Cloud', 'Dorado/Mensa', 'Dwarf', 32200, 0.049, 0.130);
INSERT INTO public.galaxy VALUES (5, 'Pinwheel Galaxy', 'Ursa Major', 'Spiral', 169300, 6.400, 7.900);
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 'Virgo', 'Peculiar', 95000, 9.550, 8.000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1737, 250, true, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 11, 233, false, 5);
INSERT INTO public.moon VALUES (3, 'Deimos', 6, 233, false, 5);
INSERT INTO public.moon VALUES (4, 'Ganymede', 2634, 110, true, 3);
INSERT INTO public.moon VALUES (5, 'Callisto', 2410, 134, true, 3);
INSERT INTO public.moon VALUES (6, 'Io', 3660, 110, false, 3);
INSERT INTO public.moon VALUES (7, 'Europa', 1560, 102, true, 3);
INSERT INTO public.moon VALUES (8, 'Titan', 2574, 94, NULL, 2);
INSERT INTO public.moon VALUES (9, 'Tethys', 531, 86, NULL, 2);
INSERT INTO public.moon VALUES (10, 'Iapetus', 734, 100, NULL, 2);
INSERT INTO public.moon VALUES (11, 'Enceladus', 252, 75, NULL, 2);
INSERT INTO public.moon VALUES (12, 'Hyperion', 135, 93, false, 2);
INSERT INTO public.moon VALUES (13, 'Mimas', 198, 64, NULL, 2);
INSERT INTO public.moon VALUES (14, 'Miranda', 235, 60, false, 7);
INSERT INTO public.moon VALUES (15, 'Ariel', 579, 60, false, 7);
INSERT INTO public.moon VALUES (16, 'Umbriel', 585, 75, NULL, 7);
INSERT INTO public.moon VALUES (17, 'Titania', 788, 70, NULL, 7);
INSERT INTO public.moon VALUES (18, 'Oberon', 761, 75, NULL, 7);
INSERT INTO public.moon VALUES (19, 'Hippocamp', 17, NULL, false, 4);
INSERT INTO public.moon VALUES (20, 'Triton', 1353, 38, NULL, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1.000, 1.000, 101325, 255, false, 1, 1);
INSERT INTO public.planet VALUES (2, 'Saturn', 95.200, 9.450, NULL, 134, true, 146, 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', 317.800, 11.210, NULL, 165, true, 95, 1);
INSERT INTO public.planet VALUES (4, 'Neptun', 17.100, 3.880, 1000000, 72, true, 16, 1);
INSERT INTO public.planet VALUES (5, 'Mars', 0.107, 0.532, 600, 209, false, 2, 1);
INSERT INTO public.planet VALUES (6, 'Venus', 0.815, 0.949, 9300000, 737, false, 0, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 14.500, 4.010, NULL, 76, true, 28, 1);
INSERT INTO public.planet VALUES (8, 'Mercury', 0.055, 0.383, 0, 437, false, 0, 1);
INSERT INTO public.planet VALUES (9, 'Proxima b', 1.070, 1.000, NULL, 234, false, 0, 7);
INSERT INTO public.planet VALUES (11, 'Proxima d', 0.260, 0.810, NULL, 360, false, NULL, 7);
INSERT INTO public.planet VALUES (10, 'Proxima c', 7.000, NULL, NULL, 39, false, NULL, 7);
INSERT INTO public.planet VALUES (12, 'Epsilon Eridani b', 238.000, NULL, NULL, 150, false, NULL, 8);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', NULL, 'Yellow dwarf', 1.000, 5772, 4600, 1);
INSERT INTO public.star VALUES (2, 'Vega', 'Lyra', 'Main sequence', 2.135, 1000, 455, 1);
INSERT INTO public.star VALUES (3, 'Sirius', 'Canis Major', 'Main sequence', 2.063, 9940, 242, 1);
INSERT INTO public.star VALUES (4, 'Anteres', 'Scorpius', 'Red supergiant', 15.000, 3660, 15, 1);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 'Orion', 'Red supergiant', 17.000, 3660, 10, 1);
INSERT INTO public.star VALUES (6, 'Alpheratz', 'Andromeda', 'Red giant', 1.850, 13800, 60, 3);
INSERT INTO public.star VALUES (7, 'Proxima Centauri', 'Centaurus', 'Main sequence', 0.122, 2992, 4850, 1);
INSERT INTO public.star VALUES (8, 'Epsilon Eridani', 'Eridanus', 'Main sequence', 0.820, 5084, 500, 1);


--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_hole_black_hole_id_seq', 4, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: black_hole black_hole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_name_key UNIQUE (name);


--
-- Name: black_hole black_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_pkey PRIMARY KEY (black_hole_id);


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
-- Name: black_hole black_hole_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

