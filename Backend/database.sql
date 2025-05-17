--
-- PostgreSQL database cluster dump
--

-- Started on 2025-05-16 03:33:59 PDT

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE jacob;
ALTER ROLE jacob WITH SUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:0wGvUS3Ce0jpm8c5CahPwg==$etXaLWi1HjcRs6H6/AoUP0KNeMvySj8GkaqbUupy9AQ=:2TUQpc8m6oc4it4jHimGll0dHWZjifleML/oPTc6Je8=';
CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:C25NApQNEoeFCyRT4Eln0A==$M+x3Bvc9zLbfoQcfyO7GIS7hTFZ21LOa4Tn/thew5/M=:Oj8CnLTP8hcJzrmPaXnWMeV34qywAf6wiZzsh9z7Erg=';

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3 (Debian 16.3-1.pgdg120+1)
-- Dumped by pg_dump version 17.4

-- Started on 2025-05-16 03:33:59 PDT

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

-- Completed on 2025-05-16 03:33:59 PDT

--
-- PostgreSQL database dump complete
--

--
-- Database "Hotel Booking Database" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3 (Debian 16.3-1.pgdg120+1)
-- Dumped by pg_dump version 17.4

-- Started on 2025-05-16 03:33:59 PDT

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

--
-- TOC entry 3394 (class 1262 OID 16388)
-- Name: Hotel Booking Database; Type: DATABASE; Schema: -; Owner: jacob
--

CREATE DATABASE "Hotel Booking Database" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE "Hotel Booking Database" OWNER TO jacob;

\encoding SQL_ASCII
\connect -reuse-previous=on "dbname='Hotel Booking Database'"

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

--
-- TOC entry 220 (class 1259 OID 16448)
-- Name: bookingid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bookingid
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bookingid OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 218 (class 1259 OID 16409)
-- Name: bookings; Type: TABLE; Schema: public; Owner: jacob
--

CREATE TABLE public.bookings (
    booking_id bigint NOT NULL,
    date date,
    user_id bigint,
    room_id bigint
);


ALTER TABLE public.bookings OWNER TO jacob;

--
-- TOC entry 223 (class 1259 OID 16451)
-- Name: hotelid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hotelid
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.hotelid OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16389)
-- Name: hotels; Type: TABLE; Schema: public; Owner: jacob
--

CREATE TABLE public.hotels (
    hotel_id bigint NOT NULL,
    name name,
    number_of_rooms bigint,
    address text
);


ALTER TABLE public.hotels OWNER TO jacob;

--
-- TOC entry 222 (class 1259 OID 16450)
-- Name: roomid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roomid
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roomid OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16401)
-- Name: rooms; Type: TABLE; Schema: public; Owner: jacob
--

CREATE TABLE public.rooms (
    room_id bigint NOT NULL,
    room_price bigint,
    room_number bigint,
    hotel_id bigint
);


ALTER TABLE public.rooms OWNER TO jacob;

--
-- TOC entry 219 (class 1259 OID 16431)
-- Name: support_tickets; Type: TABLE; Schema: public; Owner: jacob
--

CREATE TABLE public.support_tickets (
    support_ticket_id bigint NOT NULL,
    user_id bigint,
    issue text,
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    booking_id bigint
);


ALTER TABLE public.support_tickets OWNER TO jacob;

--
-- TOC entry 221 (class 1259 OID 16449)
-- Name: userid; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.userid
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.userid OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16394)
-- Name: users; Type: TABLE; Schema: public; Owner: jacob
--

CREATE TABLE public.users (
    user_id bigint NOT NULL,
    name name,
    date_of_birth date,
    account_creation_date timestamp without time zone
);


ALTER TABLE public.users OWNER TO jacob;

--
-- TOC entry 3383 (class 0 OID 16409)
-- Dependencies: 218
-- Data for Name: bookings; Type: TABLE DATA; Schema: public; Owner: jacob
--

COPY public.bookings (booking_id, date, user_id, room_id) FROM stdin;
4	2025-04-13	1	1
5	2025-05-03	1	10
6	2025-05-03	1	10
7	2025-05-03	1	10
\.


--
-- TOC entry 3380 (class 0 OID 16389)
-- Dependencies: 215
-- Data for Name: hotels; Type: TABLE DATA; Schema: public; Owner: jacob
--

COPY public.hotels (hotel_id, name, number_of_rooms, address) FROM stdin;
1	test hotel	500	1234 main steet
2	\N	\N	123456 main street
3	Test Hotel A	157	123456 main street
4	Test Hotel B	157	123456 main street
5	Test Hotel B	157	123456 main street
6	Test Hotel B	157	123456 main street
7	Test Hotel D	157	123456 main street
8	Test Hotel E	157	123456 main street
9	Test Hotel E	157	123456 main street
10	Test Hotel E	157	123456 main street
\.


--
-- TOC entry 3382 (class 0 OID 16401)
-- Dependencies: 217
-- Data for Name: rooms; Type: TABLE DATA; Schema: public; Owner: jacob
--

COPY public.rooms (room_id, room_price, room_number, hotel_id) FROM stdin;
1	100	1	1
3	100	5	1
4	100	5	1
5	100	5	1
6	100	5	1
7	100	5	1
8	100	5	1
9	100	9	1
10	100	9	2
11	200	22	1
12	200	22	1
13	200	23	1
14	200	23	1
15	200	23	1
16	200	23	1
17	210	23	1
18	210	23	1
19	210	23	1
\.


--
-- TOC entry 3384 (class 0 OID 16431)
-- Dependencies: 219
-- Data for Name: support_tickets; Type: TABLE DATA; Schema: public; Owner: jacob
--

COPY public.support_tickets (support_ticket_id, user_id, issue, start_date, end_date, booking_id) FROM stdin;
\.


--
-- TOC entry 3381 (class 0 OID 16394)
-- Dependencies: 216
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: jacob
--

COPY public.users (user_id, name, date_of_birth, account_creation_date) FROM stdin;
1	test user	2000-01-01	2025-04-13 00:00:00
2	test user 2	2001-01-01	2025-04-14 00:00:00
3	\N	\N	2025-04-14 00:00:00
4	test user	2003-01-01	2025-04-14 00:00:00
5	test user B	2004-01-01	2025-04-14 01:28:14.453063
6	test user A	2004-01-01	2025-05-02 05:36:15.317296
7	test user A	2004-01-01	2025-05-02 05:37:11.029825
8	test user A	2004-01-01	2025-05-02 06:02:49.267337
9	test user B	2004-01-01	2025-05-03 00:00:10.658764
10	test user C	2004-01-01	2025-05-03 00:11:41.015904
11	test user E	2004-01-01	2025-05-03 00:19:02.820735
12	test user E	2004-01-01	2025-05-03 00:20:01.961041
13	test user F	2004-01-01	2025-05-03 00:20:46.342142
14	test user F	2004-01-01	2025-05-03 00:21:16.101679
15	test user F	2004-01-01	2025-05-03 00:21:45.477626
16	test user G	2004-01-01	2025-05-03 00:22:58.628398
17	test user H	2004-01-01	2025-05-03 00:23:52.1443
18	test user H	2004-01-01	2025-05-03 00:23:54.845695
19	test user H	2004-01-01	2025-05-03 00:24:04.914009
20	test user H	2004-01-01	2025-05-03 00:24:06.349676
21	test user H	2004-01-01	2025-05-03 00:24:09.100298
22	test user H	2004-01-01	2025-05-03 00:25:42.918668
23	test user H	2004-01-01	2025-05-03 00:25:45.312295
24	test user H	2004-01-01	2025-05-03 00:26:34.460545
25	Test User qqq	2004-01-01	2025-05-03 03:47:10.877341
\.


--
-- TOC entry 3395 (class 0 OID 0)
-- Dependencies: 220
-- Name: bookingid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bookingid', 7, true);


--
-- TOC entry 3396 (class 0 OID 0)
-- Dependencies: 223
-- Name: hotelid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hotelid', 10, true);


--
-- TOC entry 3397 (class 0 OID 0)
-- Dependencies: 222
-- Name: roomid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roomid', 19, true);


--
-- TOC entry 3398 (class 0 OID 0)
-- Dependencies: 221
-- Name: userid; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.userid', 25, true);


--
-- TOC entry 3229 (class 2606 OID 16413)
-- Name: bookings bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: jacob
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_pkey PRIMARY KEY (booking_id);


--
-- TOC entry 3223 (class 2606 OID 16398)
-- Name: hotels hotels_pkey; Type: CONSTRAINT; Schema: public; Owner: jacob
--

ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_pkey PRIMARY KEY (hotel_id);


--
-- TOC entry 3227 (class 2606 OID 16420)
-- Name: rooms rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: jacob
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (room_id);


--
-- TOC entry 3231 (class 2606 OID 16437)
-- Name: support_tickets support_tickets_pkey; Type: CONSTRAINT; Schema: public; Owner: jacob
--

ALTER TABLE ONLY public.support_tickets
    ADD CONSTRAINT support_tickets_pkey PRIMARY KEY (support_ticket_id);


--
-- TOC entry 3225 (class 2606 OID 16400)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: jacob
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 3235 (class 2606 OID 16443)
-- Name: support_tickets booking_id; Type: FK CONSTRAINT; Schema: public; Owner: jacob
--

ALTER TABLE ONLY public.support_tickets
    ADD CONSTRAINT booking_id FOREIGN KEY (booking_id) REFERENCES public.bookings(booking_id) NOT VALID;


--
-- TOC entry 3232 (class 2606 OID 16404)
-- Name: rooms hotel_id; Type: FK CONSTRAINT; Schema: public; Owner: jacob
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT hotel_id FOREIGN KEY (hotel_id) REFERENCES public.hotels(hotel_id) NOT VALID;


--
-- TOC entry 3233 (class 2606 OID 16426)
-- Name: bookings room_id; Type: FK CONSTRAINT; Schema: public; Owner: jacob
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT room_id FOREIGN KEY (room_id) REFERENCES public.rooms(room_id) NOT VALID;


--
-- TOC entry 3234 (class 2606 OID 16421)
-- Name: bookings user_id; Type: FK CONSTRAINT; Schema: public; Owner: jacob
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES public.users(user_id) NOT VALID;


--
-- TOC entry 3236 (class 2606 OID 16438)
-- Name: support_tickets user_id; Type: FK CONSTRAINT; Schema: public; Owner: jacob
--

ALTER TABLE ONLY public.support_tickets
    ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES public.users(user_id) NOT VALID;


-- Completed on 2025-05-16 03:34:00 PDT

--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3 (Debian 16.3-1.pgdg120+1)
-- Dumped by pg_dump version 17.4

-- Started on 2025-05-16 03:34:00 PDT

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

-- Completed on 2025-05-16 03:34:00 PDT

--
-- PostgreSQL database dump complete
--

-- Completed on 2025-05-16 03:34:00 PDT

--
-- PostgreSQL database cluster dump complete
--

