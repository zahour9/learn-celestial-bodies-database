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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter numeric,
    composition text
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(30) NOT NULL,
    age_millions integer,
    galaxy_type character varying(30),
    description text,
    galaxy_id integer NOT NULL
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
    age_millions integer,
    is_spherical boolean,
    distance_from_earth numeric,
    description text,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_millions integer,
    is_spherical boolean,
    distance_from_earth numeric,
    description text,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(30) NOT NULL,
    age_millions integer,
    is_spherical boolean,
    description text,
    star_id integer NOT NULL,
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, '1 Ceres', 940, 'Primarily composed of rock and ice');
INSERT INTO public.asteroid VALUES (2, '4 Vesta', 525, 'Composed of rock, likely differentiated with an iron-nickel core');
INSERT INTO public.asteroid VALUES (3, '433 Eros', 16.8, 'Classified as a near-Earth asteroid, with a semi-major axis of about 1.46 AU');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 13600, 'barred spiral galaxy', 'The Milky Way is a barred spiral galaxy, containing billions of stars, including our Sun.', 1);
INSERT INTO public.galaxy VALUES ('
Andromeda Galaxy (M31)', 13000, 'spiral', 'Closest to us, Andromeda is a spiral galaxy resembling our Milky Way.', 2);
INSERT INTO public.galaxy VALUES ('Triangulum Galaxy (M33)', 10000, 'spiral', '
A nearby spiral galaxy with active star formation, nestled near Andromeda.', 3);
INSERT INTO public.galaxy VALUES ('Large Magellanic Cloud (LMC)', 4000, 'Irregular', 'Irregular in shape, the LMC is filled with young stars, orbiting our Milky Way.', 4);
INSERT INTO public.galaxy VALUES ('Small Magellanic Cloud (SMC)', 3000, 'Irregular', 'Companion to the LMC, this irregular galaxy is rich in star-forming regions.', 5);
INSERT INTO public.galaxy VALUES ('Whirlpool Galaxy (M51)', 2000, 'Spiral', 'Known for its striking spiral arms, M51 interacts with a smaller companion galaxy.', 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 4500, true, 0.4055, 'Earth`s only natural satellite, with a cratered surface and significant influence on tides and lunar cycles.', 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 4500, false, 78, 'Small and irregularly shaped moon of Mars, likely captured asteroid.', 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 4500, false, 23, 'Small and irregularly shaped moon of Mars, likely captured asteroid.', 4);
INSERT INTO public.moon VALUES (4, 'Europa', 4500, true, 628.7, 'Jupiter`s icy moon, with a smooth surface suggesting subsurface oceans, raising the possibility of extraterrestrial life.', 5);
INSERT INTO public.moon VALUES (5, 'Lo', 4500, true, 628.7, 'Jupiter`s volcanic moon, exhibits a vibrant surface with intense volcanic activity and colorful sulfur deposits.', 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 4500, true, 628.7, 'Jupiter`s largest moon, boasts a diverse landscape of icy plains, rocky mountains, and ancient cratered terrain.', 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 4500, true, 628.7, 'Jupiter`s heavily cratered moon, features a mix of ancient and relatively smooth terrains, hinting at a complex geological history.', 5);
INSERT INTO public.moon VALUES (8, 'Titan', 4500, true, 1200, 'The largest moon of Saturn, with a thick atmosphere and lakes of liquid methane and ethane on its surface.', 6);
INSERT INTO public.moon VALUES (9, 'Triton', 4500, true, 4700, 'The largest moon of Neptune, with a retrograde orbit and geysers erupting from its surface.', 8);
INSERT INTO public.moon VALUES (10, 'Amalthea', 4500, false, 628.7, 'Amalthea, a small moon of Jupiter, exhibits a reddish hue and orbits within Jupite`s main ring system.', 5);
INSERT INTO public.moon VALUES (11, 'Himalia', 4500, false, 628.7, 'Himalia, a small irregular moon of Jupiter, is part of the outer group of satellites known as the Himalia group.', 5);
INSERT INTO public.moon VALUES (12, 'Sharon', 4500, true, 4280, 'Pluto`s largest moon, is tidally locked to Pluto and orbits in a synchronous rotation with the dwarf planet.', 9);
INSERT INTO public.moon VALUES (13, 'Enceladus', 4500, true, 1200, 'Saturn`s icy moon, harbors a subsurface ocean and geysers erupting from its south pole, indicating potential for habitable conditions.', 6);
INSERT INTO public.moon VALUES (14, 'Mimas', 4500, true, 1700, 'Saturn`s "Death Star" moon, features a large crater named Herschel that gives it its distinctive appearance.', 6);
INSERT INTO public.moon VALUES (15, 'Miranda', 4500, true, 2600, 'Uranus` enigmatic moon, displays a varied surface with cliffs, valleys, and large tectonic features, suggesting a complex geological history.', 7);
INSERT INTO public.moon VALUES (16, 'Titania', 4500, true, 2600, 'Titania, one of Uranus` moon, featuring valleys, craters, and large fault systems on its surface.', 7);
INSERT INTO public.moon VALUES (17, 'Lapetus', 4500, true, 1700, 'Saturn`s moon with a two-tone coloration and a distinctive equatorial ridge.', 6);
INSERT INTO public.moon VALUES (18, 'Tethys', 4500, true, 1200, 'Saturn`s icy moon with a smooth surface and a prominent impact crater named Odysseus.', 6);
INSERT INTO public.moon VALUES (19, 'Oberon', 4500, true, 3800, 'Oberon, one of Uranus`s moons, is the outermost major moon of the planet and features a heavily cratered surface.', 7);
INSERT INTO public.moon VALUES (20, 'Rhea', 4500, true, 1600, 'Rhea is the second-largest moon of Saturn and is notable for its bright, icy surface, possibly indicating a subsurface ocean.', 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4500, true, 222, 'Closest planet to the Sun, with a cratered surface and extreme temperature variations.', 1);
INSERT INTO public.planet VALUES (2, 'Venus', 4500, true, 261, 'Earth`s sister planet, shrouded in thick clouds and scorching surface temperatures.', 1);
INSERT INTO public.planet VALUES (3, 'Earth', 4500, true, 0, 'Our home planet, characterized by its diverse ecosystems, abundant water, and the only known planet to support life.', 1);
INSERT INTO public.planet VALUES (4, 'Mars', 4500, true, 401, 'Referred to as the "Red Planet", Mars features dusty deserts, polar ice caps, and evidence of past water activity.', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 4500, true, 968, 'The largest planet, a gas giant with swirling clouds and a mesmerizing Great Red Spot.', 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 4500, true, 1700, 'Adorned with majestic rings, Saturn is a gas giant boasting a captivating and unique appearance.', 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 4500, true, 3200, 'A distant ice giant, Uranus rolls on its side as it orbits the Sun, cloaked in an icy blue-green hue.', 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 4500, true, 4700, 'The outermost planet, Neptune`s deep blue color and stormy atmosphere make it a mysterious and captivating world.', 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 4600, true, 7500, 'Dwarf planet beyond Neptune, known for its icy surface and disputed planetary status.', 1);
INSERT INTO public.planet VALUES (10, 'Eris', 4600, true, 14600, 'Dwarf planet in the Kuiper Belt, sparking debate on planetary classification.', 1);
INSERT INTO public.planet VALUES (11, 'Ceres', 4600, true, 445, 'Largest asteroid and dwarf planet, located in the asteroid belt between Mars and Jupiter.', 1);
INSERT INTO public.planet VALUES (12, 'Makemake', 4500, true, 7900, 'Makemake is a dwarf planet located in the Kuiper Belt, known for its reddish coloration and icy surface, similar in size to Pluto.', 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sun', 4600, true, 'The Sun, a 4.6 billion-year-old G-type main-sequence star, sustains life on Earth as the center of our solar system.', 1, 1);
INSERT INTO public.star VALUES ('None', 0, false, 'This galaxy does not have a star', 2, 2);
INSERT INTO public.star VALUES ('None', 0, false, 'This galaxy does not have a star', 3, 3);
INSERT INTO public.star VALUES ('R Doradus', 1000, false, 'A variable red giant star in the Large Magellanic Cloud, known for its pulsations and striking brightness fluctuations.', 4, 4);
INSERT INTO public.star VALUES ('HV 00882', 3, false, 'A young, massive star-forming region within the Small Magellanic Cloud, contributing to the galaxy`s dynamic stellar evolution.', 5, 5);
INSERT INTO public.star VALUES ('None', 0, false, 'This galaxy does not have a star', 6, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


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
-- Name: asteroid asteroid_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key1 UNIQUE (name);


--
-- Name: asteroid asteroid_name_key2; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key2 UNIQUE (name);


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
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


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

