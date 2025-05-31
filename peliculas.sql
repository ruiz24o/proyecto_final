--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: favoritos_usuarios_amazon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.favoritos_usuarios_amazon (
    id_pelicula integer NOT NULL,
    id_usuario integer NOT NULL
);


ALTER TABLE public.favoritos_usuarios_amazon OWNER TO postgres;

--
-- Name: favoritos_usuarios_netflix; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.favoritos_usuarios_netflix (
    id_pelicula integer NOT NULL,
    id_usuario integer NOT NULL
);


ALTER TABLE public.favoritos_usuarios_netflix OWNER TO postgres;

--
-- Name: peliculas_amazon_prime; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.peliculas_amazon_prime (
    id_pelicula_amazon integer NOT NULL,
    posicion integer NOT NULL,
    titulo_pelicula character varying(255) NOT NULL,
    calificacion numeric(3,1),
    clasificacion character varying(5) NOT NULL,
    genero character varying(100),
    anno integer,
    duracion integer,
    CONSTRAINT peliculas_amazon_prime_anno_check CHECK ((anno >= 1888)),
    CONSTRAINT peliculas_amazon_prime_calificacion_check CHECK (((calificacion >= (0)::numeric) AND (calificacion <= (10)::numeric))),
    CONSTRAINT peliculas_amazon_prime_duracion_check CHECK ((duracion > 0)),
    CONSTRAINT peliculas_amazon_prime_posicion_check CHECK (((posicion >= 1) AND (posicion <= 50)))
);


ALTER TABLE public.peliculas_amazon_prime OWNER TO postgres;

--
-- Name: peliculas_amazon_prime_id_pelicula_amazon_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.peliculas_amazon_prime_id_pelicula_amazon_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.peliculas_amazon_prime_id_pelicula_amazon_seq OWNER TO postgres;

--
-- Name: peliculas_amazon_prime_id_pelicula_amazon_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.peliculas_amazon_prime_id_pelicula_amazon_seq OWNED BY public.peliculas_amazon_prime.id_pelicula_amazon;


--
-- Name: peliculas_netflix; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.peliculas_netflix (
    id_pelicula_netflix integer NOT NULL,
    posicion integer NOT NULL,
    titulo_pelicula character varying(255) NOT NULL,
    calificacion numeric(3,1) NOT NULL,
    clasificacion character varying(5) NOT NULL,
    genero character varying(255) NOT NULL,
    anno integer NOT NULL,
    duracion integer NOT NULL,
    CONSTRAINT peliculas_netflix_anno_check CHECK (((anno >= 1900) AND ((anno)::numeric <= EXTRACT(year FROM CURRENT_DATE)))),
    CONSTRAINT peliculas_netflix_calificacion_check CHECK (((calificacion >= (0)::numeric) AND (calificacion <= (10)::numeric))),
    CONSTRAINT peliculas_netflix_duracion_check CHECK ((duracion > 0)),
    CONSTRAINT peliculas_netflix_posicion_check CHECK (((posicion >= 1) AND (posicion <= 50)))
);


ALTER TABLE public.peliculas_netflix OWNER TO postgres;

--
-- Name: peliculas_netflix_id_pelicula_netflix_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.peliculas_netflix_id_pelicula_netflix_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.peliculas_netflix_id_pelicula_netflix_seq OWNER TO postgres;

--
-- Name: peliculas_netflix_id_pelicula_netflix_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.peliculas_netflix_id_pelicula_netflix_seq OWNED BY public.peliculas_netflix.id_pelicula_netflix;


--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id_usuario integer NOT NULL,
    nombre character varying(100) NOT NULL,
    contrasena character varying(100) NOT NULL,
    estado boolean DEFAULT true NOT NULL
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_id_usuario_seq OWNER TO postgres;

--
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_usuario_seq OWNED BY public.usuarios.id_usuario;


--
-- Name: peliculas_amazon_prime id_pelicula_amazon; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peliculas_amazon_prime ALTER COLUMN id_pelicula_amazon SET DEFAULT nextval('public.peliculas_amazon_prime_id_pelicula_amazon_seq'::regclass);


--
-- Name: peliculas_netflix id_pelicula_netflix; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peliculas_netflix ALTER COLUMN id_pelicula_netflix SET DEFAULT nextval('public.peliculas_netflix_id_pelicula_netflix_seq'::regclass);


--
-- Name: usuarios id_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuarios_id_usuario_seq'::regclass);


--
-- Data for Name: favoritos_usuarios_amazon; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.favoritos_usuarios_amazon (id_pelicula, id_usuario) FROM stdin;
\.


--
-- Data for Name: favoritos_usuarios_netflix; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.favoritos_usuarios_netflix (id_pelicula, id_usuario) FROM stdin;
\.


--
-- Data for Name: peliculas_amazon_prime; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.peliculas_amazon_prime (id_pelicula_amazon, posicion, titulo_pelicula, calificacion, clasificacion, genero, anno, duracion) FROM stdin;
1	1	Mission: Impossible - Dead Reckoning Part One	8.5	B15	Acci¢n, Aventura, Suspenso	2023	163
2	2	Mickey 17	7.7	B15	Ciencia Ficci¢n, Drama	2025	130
3	3	Warfare	8.3	C	Acci¢n, Guerra	2025	115
4	4	Black Bag	8.0	C	Thriller, Espionaje	2025	110
5	5	Companion	8.2	B15	Drama, Ciencia Ficci¢n	2025	105
6	6	Drop	7.9	B15	Drama, Suspenso	2025	100
7	7	The Legend of Ochi	7.5	A	Fantas¡a, Aventura	2025	98
8	8	Until Dawn	6.8	C	Terror, Suspenso	2025	95
9	9	Novocaine	7.6	B15	Comedia, Drama	2025	93
10	10	The Brutalist	8.4	B15	Drama, Historia	2025	120
11	11	A Working Man	7.2	B	Drama	2025	102
12	12	The Order	8.1	C	Acci¢n, Suspenso	2024	110
13	13	The Ballad of Wallis Island	8.7	B15	Drama, Aventura	2025	115
14	14	Small Things Like These	8.0	B	Drama	2024	98
15	15	Captain America: Brave New World	7.8	B15	Acci¢n, Superh‚roes	2025	130
16	16	Babygirl	6.5	B	Drama	2025	90
17	17	The Assessment	7.9	B15	Drama, Ciencia Ficci¢n	2025	105
18	18	Heretic	7.3	C	Terror, Suspenso	2024	100
19	19	Talk to Me	8.1	C	Terror, Suspenso	2023	95
20	20	Another Simple Favor	6.0	B15	Comedia, Misterio	2025	110
21	21	The Wild Robot	8.6	A	Animaci¢n, Aventura	2024	100
22	22	Restless	7.4	B	Drama	2025	102
23	23	Heart Eyes	7.8	B	Romance, Comedia	2025	98
24	24	Death of a Unicorn	6.9	B15	Comedia, Fantas¡a	2025	95
25	25	Final Destination	6.5	C	Terror, Suspenso	2010	98
26	26	Sing Sing	8.2	B15	Drama, Biograf¡a	2024	105
27	27	Conclave	7.5	B15	Drama, Suspenso	2024	110
28	28	G20	7.9	B15	Acci¢n, Suspenso	2025	115
29	29	The Holdovers	8.0	B	Comedia, Drama	2023	133
30	30	Eve's Bayou	7.3	B15	Drama, Misterio	1997	109
31	31	After Hours	7.7	B15	Comedia, Suspenso	1985	97
32	32	24 Hour Party People	7.4	B15	Biograf¡a, Comedia	2002	117
33	33	Air	7.5	B	Drama, Historia	2023	112
34	34	All of Me	6.9	B	Comedia, Fantas¡a	1984	93
35	35	An American Werewolf in London	7.6	C	Terror, Comedia	1981	97
36	36	The Andromeda Strain	7.2	B15	Ciencia Ficci¢n, Suspenso	1971	131
37	37	The Adventures of Buckaroo Banzai Across the 8th Dimension	6.3	B15	Ciencia Ficci¢n, Aventura	1984	103
38	38	The Exorcist	8.0	C	Terror	1973	122
39	39	The Hobbit: The Desolation of Smaug	7.8	B	Aventura, Fantas¡a	2013	161
40	40	The Lord of the Rings: The Fellowship of the Ring	8.8	B	Aventura, Fantas¡a	2001	178
41	41	The Peanut Butter Falcon	7.6	B	Aventura, Comedia	2019	97
42	42	September 5	7.0	B15	Drama	2025	105
43	43	Animal House	7.5	C	Comedia	1978	109
44	44	Babe	6.8	A	Familiar, Aventura	1995	91
45	45	Barbershop	6.3	B	Comedia, Drama	2002	102
46	46	Born on the Fourth of July	7.2	B15	Biograf¡a, Drama	1989	145
47	47	Cinderella Man	8.0	B	Biograf¡a, Drama	2005	144
48	48	Fried Green Tomatoes	7.7	B	Drama	1991	130
49	49	Fury	7.6	C	Acci¢n, Guerra	2014	134
50	50	In the Heat of the Night	8.0	B15	Crimen, Drama	1967	110
\.


--
-- Data for Name: peliculas_netflix; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.peliculas_netflix (id_pelicula_netflix, posicion, titulo_pelicula, calificacion, clasificacion, genero, anno, duracion) FROM stdin;
1	1	Fear Street: Prom Queen	6.5	C	Terror, Suspenso	2025	90
2	2	The Wild Robot	8.2	A	Animaci¢n, Ciencia Ficci¢n, Familiar	2024	102
3	3	Smile	6.5	C	Terror, Suspenso	2022	115
4	4	Nonnas	7.4	B	Drama	2023	110
5	5	Paddington in Peru	9.0	A	Familiar, Aventura, Comedia	2025	95
6	6	Heart Eyes	7.7	B	Romance, Comedia	2024	100
7	7	Hit Man	8.9	C	Comedia, Crimen	2024	110
8	8	The Greatest Night in Pop	8.5	B	Documental, M£sica	2024	95
9	9	Past Lives	9.3	B15	Drama, Romance	2023	106
10	10	Godzilla Minus One	8.0	B15	Acci¢n, Ciencia Ficci¢n	2023	125
11	11	Do the Right Thing	8.0	C	Drama	1989	120
12	12	The Jerk	7.2	B	Comedia	1979	94
13	13	American Graffiti	7.4	B	Drama, Comedia	1973	112
14	14	Runaway Jury	7.1	B15	Drama, Suspenso	2003	127
15	15	Barbie	7.5	A	Comedia, Fantas¡a	2023	114
16	16	The Room Next Door	7.8	C	Drama, Suspenso	2024	105
17	17	The Dark Knight	9.0	C	Acci¢n, Crimen, Drama	2008	152
18	18	Field of Dreams	7.5	A	Drama, Fantas¡a	1989	107
19	19	Heat	8.2	C	Acci¢n, Crimen, Drama	1995	170
20	20	Psycho	8.5	C	Terror, Misterio	1960	109
21	21	Dune: Part Two	8.6	B15	Ciencia Ficci¢n, Aventura	2024	165
22	22	Parasite	8.6	C	Drama, Suspenso	2019	132
23	23	Kubo & the Two Strings	7.8	A	Animaci¢n, Aventura	2016	101
24	24	The LEGO Movie	7.7	A	Animaci¢n, Comedia	2014	100
25	25	Senna	8.5	B	Documental, Deporte	2010	106
26	26	Beginners	7.2	B15	Drama, Romance	2010	105
27	27	Society of the Snow	8.0	C	Drama, Aventura	2024	120
28	28	Good Grief	7.5	B	Comedia, Drama	2024	95
29	29	Lift	6.8	B	Acci¢n, Comedia	2024	100
30	30	From the Ashes	7.0	B15	Drama, Historia	2024	110
31	31	The Super Mario Bros. Movie	7.1	A	Animaci¢n, Aventura	2023	92
32	32	Trolls Band Together	6.5	A	Animaci¢n, Musical	2023	91
33	33	Shrek	7.9	A	Animaci¢n, Comedia	2001	90
34	34	Transformers	7.0	B15	Acci¢n, Ciencia Ficci¢n	2007	144
35	35	1917	8.3	C	Drama, Guerra	2019	119
36	36	Aftersun	7.7	B15	Drama	2022	96
37	37	American Psycho	7.6	C	Crimen, Drama	2000	102
38	38	Athena	7.4	C	Drama, Acci¢n	2022	97
39	39	Eega	7.7	B15	Acci¢n, Fantas¡a	2012	145
40	40	The Night Comes for Us	7.0	C	Acci¢n, Suspenso	2018	121
41	41	Spider-Man: Across the Spider-Verse	8.7	A	Animaci¢n, Acci¢n	2023	140
42	42	Wallace & Gromit: Vengeance Most Fowl	7.8	A	Animaci¢n, Comedia	2024	85
43	43	Im Thinking of Ending Things	6.6	C	Drama, Suspenso	2020	134
44	44	High Flying Bird	6.2	B15	Drama, Deporte	2019	90
45	45	The Power of the Dog	6.9	C	Drama, Western	2021	126
46	46	Cam	6.0	C	Terror, Suspenso	2018	94
47	47	Rome	7.5	C	Drama, Historia	2018	100
48	48	Hit Man	8.9	C	Comedia, Crimen	2024	110
49	49	The Greatest Night in Pop	8.5	B	Documental, M£sica	2024	95
50	50	Black Barbie	7.0	B	Documental, Historia	2024	90
\.


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (id_usuario, nombre, contrasena, estado) FROM stdin;
1	juancholo@gmail.com	juan123	t
\.


--
-- Name: peliculas_amazon_prime_id_pelicula_amazon_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.peliculas_amazon_prime_id_pelicula_amazon_seq', 50, true);


--
-- Name: peliculas_netflix_id_pelicula_netflix_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.peliculas_netflix_id_pelicula_netflix_seq', 50, true);


--
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_usuario_seq', 1, true);


--
-- Name: favoritos_usuarios_amazon favoritos_usuarios_amazon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favoritos_usuarios_amazon
    ADD CONSTRAINT favoritos_usuarios_amazon_pkey PRIMARY KEY (id_pelicula, id_usuario);


--
-- Name: favoritos_usuarios_netflix favoritos_usuarios_netflix_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favoritos_usuarios_netflix
    ADD CONSTRAINT favoritos_usuarios_netflix_pkey PRIMARY KEY (id_pelicula, id_usuario);


--
-- Name: peliculas_amazon_prime peliculas_amazon_prime_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peliculas_amazon_prime
    ADD CONSTRAINT peliculas_amazon_prime_pkey PRIMARY KEY (id_pelicula_amazon);


--
-- Name: peliculas_netflix peliculas_netflix_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peliculas_netflix
    ADD CONSTRAINT peliculas_netflix_pkey PRIMARY KEY (id_pelicula_netflix);


--
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id_usuario);


--
-- Name: favoritos_usuarios_amazon favoritos_usuarios_amazon_id_pelicula_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favoritos_usuarios_amazon
    ADD CONSTRAINT favoritos_usuarios_amazon_id_pelicula_fkey FOREIGN KEY (id_pelicula) REFERENCES public.peliculas_amazon_prime(id_pelicula_amazon) ON DELETE CASCADE;


--
-- Name: favoritos_usuarios_amazon favoritos_usuarios_amazon_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favoritos_usuarios_amazon
    ADD CONSTRAINT favoritos_usuarios_amazon_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario) ON DELETE CASCADE;


--
-- Name: favoritos_usuarios_netflix favoritos_usuarios_netflix_id_pelicula_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favoritos_usuarios_netflix
    ADD CONSTRAINT favoritos_usuarios_netflix_id_pelicula_fkey FOREIGN KEY (id_pelicula) REFERENCES public.peliculas_netflix(id_pelicula_netflix) ON DELETE CASCADE;


--
-- Name: favoritos_usuarios_netflix favoritos_usuarios_netflix_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favoritos_usuarios_netflix
    ADD CONSTRAINT favoritos_usuarios_netflix_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

