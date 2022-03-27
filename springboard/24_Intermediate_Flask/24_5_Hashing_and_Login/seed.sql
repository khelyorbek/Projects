--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)

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
-- Name: feedbacks; Type: TABLE; Schema: public; Owner: khely
--

CREATE TABLE public.feedbacks (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    content text NOT NULL,
    username character varying(20)
);


ALTER TABLE public.feedbacks OWNER TO khely;

--
-- Name: feedbacks_id_seq; Type: SEQUENCE; Schema: public; Owner: khely
--

CREATE SEQUENCE public.feedbacks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.feedbacks_id_seq OWNER TO khely;

--
-- Name: feedbacks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: khely
--

ALTER SEQUENCE public.feedbacks_id_seq OWNED BY public.feedbacks.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: khely
--

CREATE TABLE public.users (
    id integer,
    username character varying(20) NOT NULL,
    password text NOT NULL,
    email character varying(50) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL
);


ALTER TABLE public.users OWNER TO khely;

--
-- Name: feedbacks id; Type: DEFAULT; Schema: public; Owner: khely
--

ALTER TABLE ONLY public.feedbacks ALTER COLUMN id SET DEFAULT nextval('public.feedbacks_id_seq'::regclass);


--
-- Data for Name: feedbacks; Type: TABLE DATA; Schema: public; Owner: khely
--

COPY public.feedbacks (id, title, content, username) FROM stdin;
2	Test title 2	Some more additional random test contents	elyorbek
3	Test title 3	Some more extra additional random test contents	elyorbek
1	Test title	Some random updated test contents	elyorbek
5	Test1 Feedback	Test1 Feedback Notes with some random text	test1
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: khely
--

COPY public.users (id, username, password, email, first_name, last_name) FROM stdin;
\N	elyorbek	$2b$12$kLNzXH5l8TN6Li07uqMY9eSM2JlYF5RkNUYpz7MX/uut.Prgs4wwm	someemail@gmail.com	Ely	Khud
\N	test	$2b$12$RUDQQY.mjkDn.6OFGwqodeqJzsAXpntpFZEZhgfz.o9qWchVkNL5K	someemail2@gmail.com	Test	Test
\N	test1	$2b$12$cA6AWjrOmISMsfQhozvWludqN50HeazXgF8Qe0Y3LbwY0IcIF2J06	test1@gmail.com	Test	One
\.


--
-- Name: feedbacks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: khely
--

SELECT pg_catalog.setval('public.feedbacks_id_seq', 5, true);


--
-- Name: feedbacks feedbacks_pkey; Type: CONSTRAINT; Schema: public; Owner: khely
--

ALTER TABLE ONLY public.feedbacks
    ADD CONSTRAINT feedbacks_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: khely
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: khely
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);


--
-- Name: feedbacks feedbacks_username_fkey; Type: FK CONSTRAINT; Schema: public; Owner: khely
--

ALTER TABLE ONLY public.feedbacks
    ADD CONSTRAINT feedbacks_username_fkey FOREIGN KEY (username) REFERENCES public.users(username);


--
-- PostgreSQL database dump complete
--

