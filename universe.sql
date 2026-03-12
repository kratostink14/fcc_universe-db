--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: asteroids; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroids (
    asteroids_id integer NOT NULL,
    diametr_km numeric,
    is_hazardous boolean,
    description text,
    name character varying(255) NOT NULL,
    speed_km_per_s numeric
);


ALTER TABLE public.asteroids OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    age_in_millions_of_years integer,
    number_of_stars integer,
    description text,
    has_black_hole_at_center boolean
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
    name character varying(255) NOT NULL,
    discovery_year integer,
    mean_radius_km integer,
    description text,
    is_spherical boolean,
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
    name character varying(255) NOT NULL,
    population integer,
    moons_count integer,
    orbital_period numeric(10,2),
    description text,
    has_life boolean,
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
    name character varying(255) NOT NULL,
    age_in_millions_of_years integer,
    remaining_life_span integer,
    description text,
    galaxy_id integer,
    has_planets boolean
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
-- Data for Name: asteroids; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroids VALUES (1, 3435, true, 'badass asteroid', 'Gorlock the destroyer', 3434);
INSERT INTO public.asteroids VALUES (2, 5649, true, 'beatiful-ass asteroid', 'Gorlocks brother', 83744);
INSERT INTO public.asteroids VALUES (3, 5635, false, 'asteroid', 'Gorlocks mama', 83444);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky way', 12, 2312342, 'Our galaxy', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 32, 23142, 'Not our galaxy', true);
INSERT INTO public.galaxy VALUES (3, 'Some galaxy', 25, 34322, 'Huge-ass galaxy', false);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 13250, 800000, 'Known for its bright nucleus and large central bulge', true);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 12000, 40000, 'A spiral galaxy in the constellation Triangulum', false);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 6000, 100000, 'Famous for its well-defined spiral structure', true);
INSERT INTO public.galaxy VALUES (7, 'Black Eye', 13000, 100000, 'Has a spectacular dark band of absorbing dust', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moonochka', 2322, 4533, 'our moon', true, 1);
INSERT INTO public.moon VALUES (2, 'moonyara', 1986, 5763, 'not our moon', false, 2);
INSERT INTO public.moon VALUES (3, 'munavar', 1934, 453, 'some moon', true, 3);
INSERT INTO public.moon VALUES (4, 'Phobos', 1877, 11, 'Largest moon of Mars', false, 4);
INSERT INTO public.moon VALUES (5, 'Deimos', 1877, 6, 'Smallest moon of Mars', false, 4);
INSERT INTO public.moon VALUES (6, 'Io', 1610, 1821, 'Extremely volcanic moon', true, 5);
INSERT INTO public.moon VALUES (7, 'Europa', 1610, 1560, 'May have a subsurface ocean', true, 5);
INSERT INTO public.moon VALUES (8, 'Ganymede', 1610, 2634, 'The largest moon in our solar system', true, 5);
INSERT INTO public.moon VALUES (9, 'Callisto', 1610, 2410, 'Most heavily cratered object in the system', true, 5);
INSERT INTO public.moon VALUES (10, 'Titan', 1655, 2574, 'Has a thick atmosphere and liquid lakes', true, 6);
INSERT INTO public.moon VALUES (11, 'Enceladus', 1789, 252, 'Shoots water ice into space', true, 6);
INSERT INTO public.moon VALUES (12, 'Mimas', 1789, 198, 'Famous for its giant crater', true, 6);
INSERT INTO public.moon VALUES (13, 'Rhea', 1672, 763, 'Icy and cratered satellite', true, 6);
INSERT INTO public.moon VALUES (14, 'Iapetus', 1671, 734, 'Distinctive two-tone coloring', true, 6);
INSERT INTO public.moon VALUES (15, 'Dione', 1684, 561, 'Composed primarily of water ice', true, 6);
INSERT INTO public.moon VALUES (16, 'Miranda', 1948, 235, 'Striking and varied surface features', true, 7);
INSERT INTO public.moon VALUES (17, 'Ariel', 1851, 578, 'Brightest moon of Uranus', true, 7);
INSERT INTO public.moon VALUES (18, 'Umbriel', 1851, 584, 'Darkest moon of Uranus', true, 7);
INSERT INTO public.moon VALUES (19, 'Titania', 1787, 788, 'Largest moon of Uranus', true, 7);
INSERT INTO public.moon VALUES (20, 'Triton', 1846, 1353, 'Orbits Neptune in reverse direction', true, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 899932, 1, 67444.45, 'Our planet', true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 89434, 2, 67453.65, 'Bla', false, 2);
INSERT INTO public.planet VALUES (3, 'Kepler', 8462, 5, 67442.65, 'Ustal', true, 3);
INSERT INTO public.planet VALUES (4, 'Venus', 0, 2, 686.98, 'The Red Planet, home to Olympus Mons', false, 4);
INSERT INTO public.planet VALUES (5, 'Jupiter', 0, 79, 4332.59, 'Largest gas giant in the system', false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 0, 82, 10759.22, 'Famous for its extensive ring system', false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 0, 27, 30688.50, 'An ice giant with a tilted axis', false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 0, 14, 60182.00, 'Dark, cold and very windy ice giant', false, 1);
INSERT INTO public.planet VALUES (9, 'Proxima b', 0, 0, 11.18, 'Earth-sized exoplanet in habitable zone', false, 3);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 0, 0, 129.90, 'First Earth-size planet in another habitable zone', false, 5);
INSERT INTO public.planet VALUES (11, 'Gliese 581g', 0, 0, 36.50, 'Unconfirmed but potentially habitable', false, 5);
INSERT INTO public.planet VALUES (12, 'Osiris', 0, 0, 3.50, 'Hot Jupiter orbiting very close to its star', false, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 23, 1233, 'Our sun', 1, true);
INSERT INTO public.star VALUES (2, 'Not Sun', 254, 1343, 'Not our sun', 2, true);
INSERT INTO public.star VALUES (3, 'Maybe Sun', 223, 4566, 'Some star', 3, true);
INSERT INTO public.star VALUES (4, 'Sirius', 242, 700, 'The brightest star in the night sky', 5, true);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 4850, 4000000, 'Small, low-mass star near the Sun', 4, true);
INSERT INTO public.star VALUES (6, 'Betelgeuse', 10, 1, 'Red supergiant nearing the end of its life', 6, false);
INSERT INTO public.star VALUES (7, 'Vega', 455, 500, 'One of the most studied stars after the Sun', 2, true);
INSERT INTO public.star VALUES (8, 'Rigel', 8, 10, 'Blue supergiant in the Orion constellation', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 2, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 2, true);


--
-- Name: asteroids asteroids_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroids
    ADD CONSTRAINT asteroids_name_key UNIQUE (name);


--
-- Name: asteroids asteroids_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroids
    ADD CONSTRAINT asteroids_pkey PRIMARY KEY (asteroids_id);


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

