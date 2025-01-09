--
-- PostgreSQL database cluster dump
--

-- Started on 2025-01-10 03:31:03

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;

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

-- Dumped from database version 15.10
-- Dumped by pg_dump version 15.3

-- Started on 2025-01-10 03:31:03

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

-- Completed on 2025-01-10 03:31:03

--
-- PostgreSQL database dump complete
--

--
-- Database "cs_tatu" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.10
-- Dumped by pg_dump version 15.3

-- Started on 2025-01-10 03:31:03

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

--
-- TOC entry 3407 (class 1262 OID 16398)
-- Name: cs_tatu; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE cs_tatu WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE cs_tatu OWNER TO postgres;

\connect cs_tatu

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

--
-- TOC entry 233 (class 1255 OID 16512)
-- Name: assign_role_id(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.assign_role_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- Присваиваем значение role_id, например, 1
    NEW.role_id := 1; 
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.assign_role_id() OWNER TO postgres;

--
-- TOC entry 234 (class 1255 OID 16514)
-- Name: assign_status_appointments(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.assign_status_appointments() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.status := 'Ожидает подтверждения'; 
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.assign_status_appointments() OWNER TO postgres;

--
-- TOC entry 231 (class 1255 OID 16506)
-- Name: getalltattoos(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.getalltattoos() RETURNS TABLE(id integer, title character varying, style character varying, price money, area_size character varying, image text)
    LANGUAGE plpgsql
    AS $$
begin
 RETURN QUERY select * from tattoos;
end;
$$;


ALTER FUNCTION public.getalltattoos() OWNER TO postgres;

--
-- TOC entry 230 (class 1255 OID 16505)
-- Name: getuserbyinfo(character varying, character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.getuserbyinfo(useremail character varying, userpassword character varying, userroleid integer) RETURNS TABLE(id integer, name text, email text, password text, role_id integer)
    LANGUAGE plpgsql
    AS $$
begin
return query select * from users
    where email = userEmail and password = userPassword and role_id = userRoleId;
END;
$$;


ALTER FUNCTION public.getuserbyinfo(useremail character varying, userpassword character varying, userroleid integer) OWNER TO postgres;

--
-- TOC entry 232 (class 1255 OID 16511)
-- Name: getworkschedulefortoday(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.getworkschedulefortoday() RETURNS TABLE(id integer, user_id integer, working_time timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
begin
    return query select * from work_shedules
    where date(working_time) = current_date;
end;
$$;


ALTER FUNCTION public.getworkschedulefortoday() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 228 (class 1259 OID 16484)
-- Name: appointments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.appointments (
    id integer NOT NULL,
    user_id integer NOT NULL,
    tattoo_id integer NOT NULL,
    work_shedule_id integer NOT NULL,
    status character varying(255)
);


ALTER TABLE public.appointments OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16483)
-- Name: appointments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.appointments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.appointments_id_seq OWNER TO postgres;

--
-- TOC entry 3408 (class 0 OID 0)
-- Dependencies: 227
-- Name: appointments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.appointments_id_seq OWNED BY public.appointments.id;


--
-- TOC entry 220 (class 1259 OID 16432)
-- Name: materials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.materials (
    id integer NOT NULL,
    name character varying(255),
    price money,
    count integer
);


ALTER TABLE public.materials OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16431)
-- Name: materials_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.materials_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.materials_id_seq OWNER TO postgres;

--
-- TOC entry 3409 (class 0 OID 0)
-- Dependencies: 219
-- Name: materials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.materials_id_seq OWNED BY public.materials.id;


--
-- TOC entry 215 (class 1259 OID 16400)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    title text NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16399)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO postgres;

--
-- TOC entry 3410 (class 0 OID 0)
-- Dependencies: 214
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- TOC entry 222 (class 1259 OID 16439)
-- Name: tattoos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tattoos (
    id integer NOT NULL,
    title character varying(255),
    style character varying(255),
    price money,
    area_size character varying(100),
    image text
);


ALTER TABLE public.tattoos OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16438)
-- Name: tattoos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tattoos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tattoos_id_seq OWNER TO postgres;

--
-- TOC entry 3411 (class 0 OID 0)
-- Dependencies: 221
-- Name: tattoos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tattoos_id_seq OWNED BY public.tattoos.id;


--
-- TOC entry 224 (class 1259 OID 16455)
-- Name: used_materials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.used_materials (
    id integer NOT NULL,
    tattoo_id integer NOT NULL,
    material_id integer NOT NULL
);


ALTER TABLE public.used_materials OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16454)
-- Name: used_materials_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.used_materials_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.used_materials_id_seq OWNER TO postgres;

--
-- TOC entry 3412 (class 0 OID 0)
-- Dependencies: 223
-- Name: used_materials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.used_materials_id_seq OWNED BY public.used_materials.id;


--
-- TOC entry 218 (class 1259 OID 16410)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text,
    email text NOT NULL,
    password text,
    role_id integer NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16408)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3413 (class 0 OID 0)
-- Dependencies: 216
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 217 (class 1259 OID 16409)
-- Name: users_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_role_id_seq OWNER TO postgres;

--
-- TOC entry 3414 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_role_id_seq OWNED BY public.users.role_id;


--
-- TOC entry 229 (class 1259 OID 16507)
-- Name: vw_alltattoos; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vw_alltattoos AS
 SELECT getalltattoos.id,
    getalltattoos.title,
    getalltattoos.style,
    getalltattoos.price,
    getalltattoos.area_size,
    getalltattoos.image
   FROM public.getalltattoos() getalltattoos(id, title, style, price, area_size, image);


ALTER TABLE public.vw_alltattoos OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16472)
-- Name: work_shedules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.work_shedules (
    id integer NOT NULL,
    user_id integer NOT NULL,
    working_time timestamp without time zone
);


ALTER TABLE public.work_shedules OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16471)
-- Name: work_shedules_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.work_shedules_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.work_shedules_id_seq OWNER TO postgres;

--
-- TOC entry 3415 (class 0 OID 0)
-- Dependencies: 225
-- Name: work_shedules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.work_shedules_id_seq OWNED BY public.work_shedules.id;


--
-- TOC entry 3220 (class 2604 OID 16487)
-- Name: appointments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments ALTER COLUMN id SET DEFAULT nextval('public.appointments_id_seq'::regclass);


--
-- TOC entry 3216 (class 2604 OID 16435)
-- Name: materials id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials ALTER COLUMN id SET DEFAULT nextval('public.materials_id_seq'::regclass);


--
-- TOC entry 3213 (class 2604 OID 16403)
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- TOC entry 3217 (class 2604 OID 16442)
-- Name: tattoos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tattoos ALTER COLUMN id SET DEFAULT nextval('public.tattoos_id_seq'::regclass);


--
-- TOC entry 3218 (class 2604 OID 16458)
-- Name: used_materials id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.used_materials ALTER COLUMN id SET DEFAULT nextval('public.used_materials_id_seq'::regclass);


--
-- TOC entry 3214 (class 2604 OID 16413)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3215 (class 2604 OID 16414)
-- Name: users role_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN role_id SET DEFAULT nextval('public.users_role_id_seq'::regclass);


--
-- TOC entry 3219 (class 2604 OID 16475)
-- Name: work_shedules id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_shedules ALTER COLUMN id SET DEFAULT nextval('public.work_shedules_id_seq'::regclass);


--
-- TOC entry 3401 (class 0 OID 16484)
-- Dependencies: 228
-- Data for Name: appointments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.appointments (id, user_id, tattoo_id, work_shedule_id, status) FROM stdin;
2	2	1	3	Потверждено
3	2	1	2	Подтверждено
\.


--
-- TOC entry 3393 (class 0 OID 16432)
-- Dependencies: 220
-- Data for Name: materials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.materials (id, name, price, count) FROM stdin;
2	Цветная краска	1 800,00 ?	100
3	Иглы для контура	1 000,00 ?	60
4	Иглы для закраса	1 200,00 ?	80
5	Антисептический раствор	700,00 ?	120
6	Антибактериальное мыло	500,00 ?	150
7	Одноразовые перчатки	800,00 ?	50
8	Пленка для защиты	300,00 ?	90
1	Черная краска	1 500,00 ?	100
\.


--
-- TOC entry 3388 (class 0 OID 16400)
-- Dependencies: 215
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, title) FROM stdin;
1	Пользователь
2	Мастер
\.


--
-- TOC entry 3395 (class 0 OID 16439)
-- Dependencies: 222
-- Data for Name: tattoos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tattoos (id, title, style, price, area_size, image) FROM stdin;
1	Череп	Реализм	7 000,00 ?	20 см x 25 см	data:image/jpeg;base64,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xgTDTwTSiAhySSQQBxyTCDCCjRiyTDzzSAAAAAAAywQBwjDziiDihhhxiDjCizziTQBzygASwCywjQAAAAAAACATTzDxDhxyiTTBAxRTwRSzjiARSSjhRiDQTAwSAAAAAAATBRzBBShCAQhzATQRQiSByggijBQDDzxjDRwQQQAAAAAABBQhwDyBSSxhCQDzzyTwQzCxjDDBRjxTAxBwTiQgAAAAAABARwCRgwgCBSTyxgzDAjgChQBySyCRhyigQizSAAAAAAAABzyRSARCTTygQSwAjCCAgTDzgBgxQwxwiAjTzyQAAAAAAAAzigyCjwgCRxiywQzRRQggCxCwCQQxCiRCySyhAAAAAAAAASiQiARwQyADiyjSTgiTjjTjgByyBQBQxBBQAAAAAAAAAABCjghAQgRwBCgQCDAwCwAQRBizCSTSBSzSBgAAAAAAAAAAASiyzhjwySCDTTyyiwTxjiixQAwBDAzSRDSgAAAAAAAAAAASSTTBAhjTQSgRBxijRQhjhDRxSSzyDSBCiAAAAAAAAAAAAByyRiRjxAggxBwwwCAwhQizCgzzSDhRzxSRTwAAAAAAAAADiCThgQTRgCQRxRCDyzRRDxzhwiyDyRBASwzCwQAAAAAAACwDywSijzTCyjwBRgxxSDQCgQjQBQQiTwiiRxBgAAAAAAABAjQQhTTwDShBRzDzDiDSigwhCDSCwixCADzQjwAAAAAAACzjgiBwxzQCgjgSRQjyjSBhRihwBiyAQSTwRASAgAAAAAAAQiziDCwySCBwhRTDDySijQxgAwjwTzgDRjRggAgAAAAAABRRBxTSjRzQCRyByzSTDQByzRjDxxzyCBwCxgwhgwwQAAADgRBhRSTTzBgwTAwyCDTyyBQRQxhSQAwjxCxihjRCBwgAABjxSjRgCDjDQxSThCQAhCRyzxAhRAQTSxBBAASRwyQQAAABCRBCjiDwxwjywyRCgRRSBDhTAwzRAgByDCiCAQiSxTAAACiAAQRTBSxChQixBihSSySQShAzhjAwxDjgigzjDhxzgAABgxQDizAzTySASwhhgCAiywyDRhAASDxDijySSBCzwQgAhAAzgQhCBjyxwDCTiRSxQxTQSRTRzABAjzACiDARwAAAAAxyhTAhDSijiACyjwDzASRwjjBRByACjBBSAyhgxzAAAADgiQzwASjzjQBxxwSzgywwzzxQQDyiwTggShyhBTwwgAAAAATCwihyygyhDyACRjgTRDwQzghQxjDgRCgAASBSTgAAAAQAABgTDCCjjQyjyCiSjAyyhRRzgDgTiwDzQiBgRRSTgAAAAAADxgCTgTSBSCyCwyRghDijBBySgABTghDxQSyjgwwAAAAAADRxDxhDhCTAAgASRijiDyRThiwAjDxDBxATiDRCAABAAAACRgAAABTyxDjDCTySDTxDBAjATyQxwxiQCChhwwAAAAAAABShCBABhxwSwCyijyxzQzyyyjiCzigjTjhwSTQQgAAAAAABAADCCSyxSBwCgzzDTBSyDjDDShByRDiBBzBAwiAAAAAAAAAhTRBhzQgSwihjRgiwDijhjAyzQgiDyjRggiDygQAAAAAACCzjzTzAzxADjhAhTTAxxhxRiDSBigRTyTASzyAAAQAAAACDRSSgwDSCyCBDRiTSCCSiiiiADjBARTTSAQAAAAAAAAAAAAAAQRBBQQgijDRwwhBgyRQzBCBBSRgxCAAAAAAAAAAAAAAAAAAAADzwADxyDxzzxzyCDxxxwBwAAAAAAAAAAAAAD//EABQRAQAAAAAAAAAAAAAAAAAAALD/2gAIAQMBAT8QGG//xAAUEQEAAAAAAAAAAAAAAAAAAACw/9oACAECAQE/EBhv/8QAKhABAAICAgIBBAICAwEBAAAAAQARITFBUWFxgRCRobFAwSAw0eHw8VD/2gAIAQEAAT8Q/wA+H0LcVP0TsTVDj6PiVjRbklgZoIEq7hUhpqDQuWF2/iVbFeREQJaVzBQckXGOIwSHiXeSHmLBonogEEE5vEoniGFtBVwklkCAFFWwuoil1ft8x0CsK6Syq2VDMgZIaEbWyNXpIgLq1cQQbyTQGoFbnxqVitvBxAnILiPBbYogDFD+NuWgSm3V1F65rGN1UdcoFH3Qob3iglQe2YqxqvXMRhkvLuJuZflFyyy3UpRaZ9DuKhGWDdPcERCpduJTlSqpLBA0YfktWyCZxVaROmyFTe8uT3CCowofMU0CqnolARLCUiHSq8QXZNAtalsfMw/N5kTIRydXETbArke4q9Jw8S6crl7HOO49uRIx3q5X9QuoRGvMNfwn6dk1ZcCYuYag19HiWDbUUWRRnxHZ4HE0ZmVhbeJXK64meaU3FTucncVi+4YOksa9QCsyXAZYdqOE7j/EC13UokMO2Gk47gIKh7NDomSwnChEQOXMIyd5kRDQjCxXuXTHMCVXgjTSstldaJC3YNmIimKgviBjbo9XZcxC0Bu6EhHGIB7OO+GX1X5jiWsOokoIAWjbG14OQJRYU0wwBtYHbBm4s4oBKQMGzFRqxaNJCh20F/uLqAc9V4jT5mpcAOZgE/GrGACQch1MMUs0R6HLMIAQb8oMriV16ivTSoZozv2QZZAIOYFjBveXcvQm3mOWY7q0lpgMp07PtA5DUAtdy7Dw8NJ/LNP4LqOvowKnPMwgi4XcVya+jxKovhmQHF8SpZpgaNywJRI4Lv5i2WKiG8SrRFoqlqQefacQRZYdwJK0L95SYi/ZHo6U2zp4iL6cOSvqaKEzR+EsDsLGUXMGi8k3FdgYqx5i8LpjApeio2yTcCaEFZ1UAfOFNth4Y6m3hDigq/OIcN3YRBVImdTsOUTZcSiCoM0hchZzi2LSlQCiaA3WpRUgKvS/hNzciy+IgxadI6gru1UWysQHqOgIWu6yiFpQA/KeIAay43UtHZLGueSKyEaG9YJVrRL7AQLmtXf2ihrV42xLnwuh3HAy1HMulvCPvN0jOcElkaQiWQCw3VMZk5LL4zUepYGHId/aLcyDOzbUXXRJSg93HzQl9ma2wyVcsoEhLsyDjES4qUwK038M8rhyH+Fr9GzH8EwtwX6IDR9HTW42A1GrGS89QopcXVQA4J5i8CTAsBna2ijFuNLSlu4KgtwRvKqqMGpqxaXGI7nMyVC1dgAOOJc6V2I5gCg0mA3cMBfIhZXcS4cLgB6bgt9QNYWylVpGKFAG5gqh6gidMTXKnMMPbWviOXmEEAip7oLUHa3XiB14rpp7jR+N6OI4BTI64MBS0fkmTKZB1K9bt2RJFa5iWRQ2RCGpuoNyaBISWn7CEJYwyMLXFVTApr7Q7CjNtvouFisFCjxMEVQKQVfSkvXaLfqI0Acke4IBzFX+5URzFcwsVK29uUrUGz8xUlrQcmph6rXoeYH5jhOepQVoNeSZGuOMHSAXFjl6lgK2fI9RTIqwcL/pDeNfw+k3uiZS/wD0iABV2gsaJQjNqJVMA4eLjrzxLCHtApLusxtpRzNWxaISEC8Ee0VpjhhSSgZh2OpoDwgMm4wDuY3sRWnTA9QaTcJNBiCyqKfI1m/iP7oqPuijDS8Syh2R5MEzKPJADjYiSwiqrYoVkVbN7G2GVWnIjuOEUrRBsCgYiW4WOYFYG5GFljcqtvg+IlFUXvq1Am8nV6mWwVHXUFQoFq6jxrRlCaLWq4jWaHJuXhFdVBnBTLvmFpLSg9biX6C6y8QtgYpC8U7V5mwVJlMJfe4JuFIBYbJXfuZYoCrg8mvmVmqDQPOP3Cim3uDfCAd6iHfLOeMBh0fCXG5pYAoueIwFEXiAvMov1uVCAov1qIEYBBP5ghG4QxH4heuSw2jVeoS0bU4Oa+Ilrcz4GvxMLruGXB1KvDp92Db/AAzxLlHAaMl+YkgQofEI9pPLxBZXBZvEYhYiUqG2U3WOpt1L4iCVU4iMJS/RwO46X4RPfibS24qxoVsjMO+Hctff4laYuGYNLvxMmZ2e5dUjKhUuw1KX5GBRHAldy30+f6gkud8sEzdNRJabLlqkFkQAZpLZYF0TMRG7rUQiDZnsqGMgGu6iPoFq7anHATm94jjQ1Mr14jK7CCoWwxkeeIzbqOWaYV6qJykNmrruW9GYPMdfALij7wUtKAGk8RDyaxniKhS3xBKoXVQrEYFoy9yhLAk0PIwx3neqrwfP9Q5sNKnXsgxvAysO6rvuWEDEoCMi8bIIM3Dc5d8XFkVjIPWKgidLkBzcLKOxx4zHwSWhGb3Odj49RpKRb4vPUSoDNi9HWY2h2qtd8VELnDeJpmLjzKDLCrt8zBXGhpcCi5ABts1mdCAmK6mYDaBr7+phOblZXBsYM7TP8RdJTKV5vT3HRAKNsGIeWgh5LYXqywqvE2Yak8S20WYhlkvfiFV1gEpHDmW/aLJeiMPc/ZFmXDcWWENwKDAVSNEVjmKa6Ms6YpGQvOdQoibCy2uoDx7d8NceJRDSaodqkWdy8OcIqz3LnI5hsHV/uOQlVYHUBXV7FjXQEm/Exi8Zl2wK7GFexMS1EdK2XEEOm3/9S14hR3F2jo8PcOQTdSgxOVMAqagWTTyQB0axOQCj4TJCCj1X6lviXYKOEXFR6AaIJVEDebT3G2lhcQYXuVZpWVG18XKKZEVZfERiFlQ2hoE3EXvuC4mdLeNwTcYMN9qO7hxTVhYqdSoRURoHVwI1CMu5g4exN4groNDnm2VGqDeIVUlGSqz+YZJhZcVEKvZZ1YyujSGFBWy/VzMYoemIzfdzeT8fwywvSHUXcDbouA1t9TMOBVYw2G8RdMQivvCa8vPcQiW0dw6A4puEpxQslluIi0YqAFLUeY7Ybm4xI2YG5DfwjqohrGluIHAu5e63IebiCrVw2MqysL8pt7sXDQ2HLFozbMSxrghippAIq3cQKtUwa814yjJ5YyiDVw2GCOlaQAarS4S0yFNNIx7S9i4iKw4NZ9zMPNYV/wAxGZFZx6irIlMzMNYziPv3ExoF2QQ7rf8ABCKQXoLv9QcWyOkOCBCDXcmov4Nk1iwc45lftI+UvA8VEUc8qtgkx4sy6+e4Ukg4tD+8xThQvKrgko1yQukxrWIWTPEYAdK6HcxEccKpi3CNzdo91zKPM0ow6nmHXqFGIS9/r3HuQcp/xCoIo27iWWkKwdAOfeP4ZavSOuovUNC75uOkOLjIVKr08ShWxDeAL1DVQaOQg5VEu61DNKxYsJ1TAfMzAKwGULyqEkp6rxLmigJzN1fmLDcyadT7EQCuY0LjEBC2WVFOSJojQLzCozddy6oeWYLFgo57HzPF/HDn7xqn3lwZcrhmUCk5OI2jYINh7KhYOYkRrupRkV2lGRZ5WRUq8oDV08hzKzE0ACNXAcOcOJWgQp/3G8Cng76hMXEP9TLyZ2NVuBTQrwtUPpFeBhbckBrRseYmALTkQLTdjgtcRwWLpTvzKbhZS7SKNmbMgYXmBZDbjLwcXKUcBKKznjMLLAkXA00/Mqr1AaC1/qYQuhaN9rgRAIlX3e496CYpcHZ5l4axBCwdxinCzp6jAUDd8XFvptQFUnUFhaUDqHioNjxBiMIzDG1aR4YQLSzfJGZgYprzzLUGdp4q/wCpmv4TSMFq/wCKVz4YRXQWtlBiwVreNSiVOycH1H5K0Oj6hQMPVY6hFVyeEUTdpDmIMTAIVmz7gON6EYWrlMhcX0FxvRMqIHvFRXjhiazli7lBxBDYgkXffq5kMJYDUKCfHAStWRru0flloVs/Ma2Kztl4Y2kulnUtY05jjTDeYgLcbjRMHuICkYjfMuq7gPShhxKkakeWOoYUIUDjbEQKzy5j2mbsVfRzLHSLoG4AVWgtfMq6noXSlcRbOgRckSgRRYy6vMrfhcyr2Si1iuF+Zlyp96NVxfAOJabRbv8AUAfZCUtTVnUJtvw5vqAqGwFAnLcs0EmXbj1Pcq4LJ+IK6FoHjpjmnUcgXiOSDnwcfiZ5AXzHFXTmoXxMGU0GC1NwjAJkvcO613m6uWNqjSPTN5RQrwry1/cds8hD+C1JeBoZlVWsy6lYTxGuQil7uBcA0bu49/hrUVqCL1glBHDlZZ3HRHE8h5g601FWpXC7JQUBDzGMJasbmZniVYGoEwlVvmCwTiN8ESq8RWNnMZjgdMcGhA7HF4pAKZXPTIH2gVg1tqWMUoCaBvlgAmncFFkZg9kCdYiWFwQqWcShGVvcuLIIvkuKtQ27i4VsC+H/AHAZA5qLVLmCXEQplQOx4GHbLyU01DoFhwSgcXDQKP2hzbXLd/EsNRX1AhrTsuVDlywBULIPtA3dDCB2RuEq38oUxZorY5/uN1kCQf1Bja6Abr7xC54ALOIfjjXQeZVBhu0a0GLwXNL9QhuJIUV4EBJYZDpDAKXflB6aIfKsamJ+U9BlG/8ALEP96VHBxdamJKq0Nt3MwihafPEvdXkVozKglC0NtwvTbmlsCINME+0otZ0tEDyTRqGlXIBBUwRAaVmSsFcjzFjl9GEhFecQRVRAFZl8asY2StQyxn3AQmorLR6ESqgGIJ1ZQRaDxOUcJxXOr4RzoCPDH/MYWwuFeJQJeGVfLCefcyBl8woBw1cuHjJ8xWtFAENEBywLSIKlZUWhxFKrlUTEpRoNSw6P6lwnHJKzOm0g4q7UwALAUqu4GnBrBFkE4VzUy4PVsFqijJSZQCzbcZBbyiEJUtLFzBRLRlrZBOBG3NcsCajc1dYzH1UA+2X3Eyziza5gMhxFzKXFnfiY02RXfiLjlxNMDPQWty1uTs4jWdtRsRZ+yW2dxUoaDkjQADUdoAVjEqHNjYRQQYw9Q/3rNYB9hKwyMpdVdyrlKfnEOpQA4madE11AIMKhLqJOLWltmRbLiVsqttvm4O0ELth26h1UYAReGqxqKXmWy4g1FcaYpgvuIrNLwSxtx4mSwC2MFQqq3FLOYApLCQQq91PyNIeH4i2BVrgOT5jovra7uaHBz9NzE0PUYDZWalglY3EsGTQdkuGFFDI7YfxBxjmHbNTWyEWyz4ihZ5MzATwRzFK2ckKpYRaRThlW7ZfGVbaeFlzPkGESv2QI3zacXPGWyqEaEFMDbgoCZTJBm3Yrj3MlbAaOKgEtiivg0iV2Ww1dxI6HHFvcRquQnJzZLWzqx7ho+fXmEJTi/CuYLJNNsdxjHcYv5hylKruKi0Jm6ul5I4dkxDbESjyedQykE8u4Lq4G5gWGtQgW/wDhh/vb4hzSzCheOYWWKcRaYUCo2+azMxsGFwNevQ0QqWsrsmwJNSydUDUfIA0wpSVcqrECFRQW0bjwXefmK/V9Q2FwQ9czSWiBLWEiskoPEUb9ywy4lgcIh7yzBNVAplFeCcwBWLceCYVryD38xqwjTVNS8XS6hTiHPcye4jS6W4riiTh7jeD2Zy/MUkgKHHiX9q2j1BzRrEVY4/pEjalTToEoQlzakVuMJrWhuFhhXilMaJ4WLD9S6/Kb38RkhsWu/Mt8AQI40Zg5uuEUgTKZdUA1sZVvEotwMUcfM24F0aDqEWYVb5TagwsOcspzN1KDuFM59QLsyyZSqqorGxMnI0RlFQWlgW6jIdC4ZUKi+q8ykkXwEZJkoR7IFTSagzLsjYAy1BqLgIf7xjEwO4rLSEv9cs9zIR4NJRUWoNUT7y+NOWdNyiKAW2WwWD8swBt0suDbV9xKAFbouOyOKqxBfIFJgV1ibfQWk4W4eWGpdCmBks1m8RVvmGB6ipuKzzLoFwn+yIgKplwKtKgdQplgnZdiNbjozItpV1zEeOyUFmmJSmcRhs05WCLKXRzyfEKA9Q5q3iIVW7Tqo565uo6QTYcB18wsJGy69wQ4Wq3KGP5KjsCXdCIyAvlFLB2gIpXcV9bFxdm2stxC6zG0X6gfDJhLlBLiGSdwu7NBVr1FltHccLrbYrDEJRAIdnAfshunJTxAgDAmwXcs8fA9A6i15oBfkihyhhgHb76lbAbBNPUCCnesGfflJQyhSZkBSNF+0dmiTIc3fUGWrWNzsJX8Q1/v1IqLuGsXlHstlqjqqgUgvuOJqGm2YCNZR7zKWgovzEihIBrnjEARW9O5vw2bc1FYw2psigJ3ya8zjCvEyXFfVtmGeoAmc5lGbg6hnKUUy1/MQOLKll1Qyx4ENxgMPcd7urYyzWtVeNS3t5r1ZuAqg1kY9mlBTJmI6dZDR2wmARd2mU8Sq9i6C1KV7LGCPK0tRuADgq0lnvcXcDzGCxmZMmZzgl4+mGRcpRgElRoWK9wRsYmYvPbAiu8hGZ4BedTbKV4juEqoAsddwJoqXZ1At4EQ48QCmKd0qkEFS3cfLXB2G+IAlFBmv+YJG0oFYf8AxH3zFj/xABJt5YxUQjAT3eoGQoLlmHMxbmJtH3MU4rE+j+BYqIWBdxTebGevKay/5Wn7me1VpvUFapuuTEukM4GxmVKKD4xYznzXxG9LdKGitwcEPAlfOcCPPJyiedzb6CKolF9ylA3A2spttEjLnMrkYOI8GI3InzCnLEEtcAymxiAgXbTmUuZT8h/2i+Ya3F7gb8B9kIBCuYHCjcHEITMeMygo1bkfHiIREKZtaYlGaeUyxtsiU46hglzhRO4J9Gc/UczglxmzKhWk5K4YsFqSKzAjyJg7djzFGwqjxfB94q+HItdmZfo2Moub87h9oCGOuILs7Y7LibqQd6Q2S8uqS+JYLR8Sck6C+oApIble7H8IZmD8J/AbTUSJFgFazuX8bzxNJ4wRlrEctzbcxJb7ULiGkVMtum4qeITx5lRNKA7ljmo1fmpWAuYa3KAMtmPNahtlIeIb3FgfvMhbcCDbqJtbOo1iioAxlOzxEkeSpZe/iNpcdShWG4FzSpRRW0dQ1Q14of8AqmZAhXQbBhF7ty+Co2znD7ldE/8AUx4QUsN5h0yFGLSEQRUPF3Fu2X9LfoNH0HOYW1BT9GZndTiiostHMwQsDKLWwnlVQ1ANRF5D1FJENo8MzSO3aVK0qMMwVTLartzBl27C+G440QIVGVauh1DoAVcFKsp7SqqKK9KIj1QNhqenXExUoC61n+pUtAVDX+/FJLsisRWxrlcePW30NN3MRzWg8RE3KydRbtBbcygc2qXphr25WefUCVTuryjUaORjmo3TUQTYwmbGTVTJaMTFl/QD7QDQIUMOm2E+TUCLeZlTzK4eYdBnqYA48Q7Lz1My64jpdVFH8LgBRiJdU5ALT5iAl1DlfBENXIsxVBEvogu4BYVgx5l6kHh2QZZiBzXMqGr/AEUqxOv8iuYmZRuK8Pp7mwRBnmLmDOagG83RBExy6whMs54Xp8ssGUAWXBLDou+h6jiMdpcRvNGSLVooY6gmpkTLEpR2jTgZY4xEGhtYEimIq20+JQVtDPyaYRVVyHeUpT4hr/Zz9XI5m+5SLnwi4KbRcoQXe5YNZXXc6IN3LQaLeQjiKh8moSDXsi1BMzsRbcdnqBAAlekKwqMBq4iLFmpVM2m0ypUaCbWVstQAZ2xN1WoGS47LQi5mKomXDGecxAvEDSrgZcQBkpUJpituv3L+0AGYZtDv5hcLLrNJcq8qqY7KbNjqO5o5ikpMPbqWp2qbecxxTz/nxDDLuc/Qa+puJmR76zKEvaAV1psURcwrQFwcODJlx8TVDbfmCHiKoR+/CSgFVCWwYl3c7WDERWJVLl1GCpnqYgwTQejNpiq9MNfwBjEJWwJkQVccxaDKmE3h2lBqVsvmWiG+nmUbhRuEyy6O8wxo2P8AiB0kGB5lt3QK7uNiG8O5XPnh6icgDNGoXuH2hhxjiDZMmI21tBaTGe5R3uOYcw7IOzoQAS8mUAJayvqDj0BoZXMw/IQvF1x6lV0dhyGsRhBhTtSNQ5NgcETPA+XiGAJSvJ6jgBnKqmpUK5rNFZv68w1K/wAOJdfRbh9T1cQyxol49prGpS1/QSnGbR53GOgFqL4TkBQ3ATq+LmAM9xqNsCPgri22WeZnuUW6meyKhaobzK8FLsi1GzTCR5T9mcfwMiAyx6hLBd6tg1lNmppAnFHZFsJdiqjbmdI7v/iGjgc0195udMKqcGZ5czJWWW1F2BrePmCY11Xz0TG+4ufczlLrGIGmVNEZRNx6QxF5jlcFE1VOzcEsQW4pFYC4otFsM4b1K2CrRXMGLH24wwToc11RfMuqqibXuJWiZjLEFhUHUbRAwcXKEPdA4inqBbabQLfV3D6J9COP89yorFFhuTdQeZ5A7XDKYsw7jFTAUWLTLiEsK0Kw5fKF7BBmPdRW2cypUVOYhgeCNd+hcp2cORJVndarPuFPJ0823Lwf6nx/k/QQrSEPsv6Uj5NziYKvBE4tWPjuJR2L5KiWmUqLmR91AKFbZZxExuWg6gKBDb1qdz4X7wgtalqF1coU5qWoqmAbinmfSUoaJSXzHnO5a8RDbFUepnqdLhD0L4h4FYFmEO7fMJ8oOQ9rDI4fFYJiEIp2kRowNiAtmmIo8ra15l5UiL5uHqyl8RK+Db68w1LlxMfQxPpUr6OocR+SgUryDYG6hAxk3aVGiDXAOJppw1LhQlLCidqIt7JAyFl+mNSv8ZNl5lmOZQXzAAqMg85hxEorm/8AtHY4S4fwGk+BwW/n6CQAcsSsRWDtUGDEB+YwyJBwEvqIr8peQeDUr3CDQrqZYWqhmipiLBgJUXIZDPhgmAmlA+035IigcRzW6SAFWpXcvtqSrYDFIdsoy6+k6FBxDTXwhmGciqoxBNLfRUo9FXGLzFtbwQByTyQqAKNZArWsNuqgo4qr+Z1qG49SAFp1FbJS13FhCqh5gNUFXzEfpzCM5nH0uX9WOtfRKCEXDtApxmNJwrtUi5Jk6UvAVv0ju4qs2aweIicNKgBVD7R6yFjC2VAShZtYgv2jTHsvmAMVH6kEcR3ScHU2MIWbJD2Ny7YMngCn6hr+CUrxBfsmaWGDbZlwStBlbK5h1N5ON44hdotJW7BanbmY1QAikxAlxQZgo0DpUEBQQJu9RzFG14bD+4wacbIA9cwQC7F4gS2Io4q2UbZ3ClVI6hlGDmW3j8ziQe4Vy65QVdLYzE2suZZiUwg2nExFBuJFiLtoTL58FblNFV2tjqFaThM18xMRUrOrlx1eMwou1eU2AYTIEUsvlohZGHbnmK4sy4yn1GblZ+nMvV1iCJRvqJTSSss4lwXVyinLiMFGtTgaq46okUgscQbRaSVpWJXHz28n3MEEzLphY4pdNHphVjUoYBrHvLHVJXtf+TcdUV5I/wCCzFKJnbaJiu5cqpqVBgf2aX+oXWf4DeUq9zi9zCajlqDaUqx3LxgB8sdglbIKixUs3uDQJ3SCZYAeXwJlFqNKTPmYhQL0LTxMpiQ7ol0ThCPEvgpFbAooBoR2g0wLbAhmmOJXAtGAlxKb3LWNWaCUtQcpSRaMqjmTeX1BTC2YoWpckb7GQuCnc3OeAdO4FQ8bjqMbjC3tDmKjiMQq8CCVSKVAY47li4uPDMDALnMCzNguGP8AQRE0/wCBH6cyiibnC9kV5TBxNQYC1aC0wKILfEzWNA5CvsYdEwtvL8zAJLNPBmG3MyIzKBbaZZkc1Eg89XmIjxt7B5Iug2XCtfj/ACaQ3B0I4Hcyu4Ybaj9/73U1PpoUfsglUGLStk1/KGFrpfiMkDjNRRBA/wCUMOR/WBdSKccxoNBVQo1pu1qx6INBoelOMzCQvPllUT2uDiwb1aNIYgi1RwlUqL52TKCoJcqXLpBkdx5W+YKHTWZcpx3Nlw6IMRRdwG4UauUAFWEHBweJmtghGuSUmbSqLmReFLFhlz6gaoNCyDj8wLCsVa7haRnBRx7zDTKKL58wldJBx/uPoGrGSEBSivv9ePpjuCDcW8wytxQGDYFFifMfI7Uoxmvc7B+PEKVkI2eWEWsg3dxAgkmkF2/aEUIeqaV4lE4fWqRRT9Vj1YvbbZpdk+f+gPcCrUpN+Ec4BmO47hYhgOdRA1mZS7kZZRaghSZVyFU/mGv9zpmpHvxDKx+5PeVQ0omCxmMUgNJpUuJYHB38ykADcZGZheieMCJwmQAtQ4uGAoBWw5v7kI3m1FylLL6IuRQc8wwBfHhM/F7ruVCG3E2HrMUVauSCdHEw0GHiW6VBhLOSEGb3ZC9J2HiDattPUsTTiEMN6lSgbl5GWoag7OeU3Mo7xcLgYBLzDWURzeZc+PV0uWEZnY4G3d9S1sMHQ8SnEDPMrMVwOGKtABqvNbis1nNRRWL9RYRxdS1nOIsNMrYBmUWbDgirWUcDzAPoP2wycR1n09zhCIZDzK1TkXZW4aWYUOZXeSY5XiYMuPB/9o3mVDSP2Y8c1eRTzMe0+W4NoVeRKLgnF8QG9iy4AS4RxHc3ErcQiO9RWAxC9V5loIi15gxtA+VqDDXNCnL/AL3TNCaxzEGcQsavR7lCmr8JbaKjWqKjsMnmKhTXb3Kqu66sq9S7jQsq2VTyNKtZMozPhcO28qvuVeFYJRs8kQNgsj3Deotm+YASiEIM3EEaz3LhSpiIoLGtwAhLuJYWjwioDC6eGPycjioiAxMSSiTUUaBiHx3FWMSsEigOEjN5CpZYMBNzqLwkLGtNy4gQ06grKAy+y0zZ5puPRLUhbQKQYD0Yp+EPC9Yu+4cANmC3fmMDHFN+9xdRHKP5iQV0if1A3mOBjfKukvubhxN3v24L9okfMIr7wLsVkfY4g4XDMPle54mg2o7RYDpfcOSZB/OZWsqnKmsRnNk4ZEjBRB3Oh8TbBg5lkXzFo5CJw4XKhZrUEYqZljtjH2Qk1BW9UTxgLwP+VQBQqoa/2uT6Ooq9EV9cNkWIcHlG4Xll27Hj8wNyxtPlsF1lsX2FQEVUXfSPJ5adMtchAQOaIY5sH+4tYMAzDgLpcD0sIiABF9SxuCOo/WiE0wKA4iKx1Zha6qI4JUVuVhv6MxS/hlUKzgjbixOLivnOZdAO4UuvScknMAK6lqilWMxFKdXEzeg6YZ7OJZdVGJIVDDiDHKBkyd3AFzVl5B8n7MPDcOAnFNp6jgHbq2U5kF5X2II0uUY/OYMA0pipXWYqidqt+pUINAbiitmBVLjV5hwa4Y8QFqbZZSI5VzcY5jr83wuW8e8rr+5WCQfG1LASm9C3DmGn6AfSHTtCqgk8kf3DoiUDmWGWsg4AM7mCGVAAhk8IHS/0jK+UHysgoY/3sXjcUmz7MKm2+o6uUSOF1AXlTBEHaftiORQzQiYWTmFgoCN6qXGuoyfzKOCjL6Q5kC0ZuISRZ25xiE3ua9QRALXwdxOjPhht0uLPEIstVWcQvda5uDcpphgNhTuXmoOoDKvG4gQXUb631GzBb5IrqeanMaLIxcvDN6OItwUIpdtTczZdQ1yAybYWINQp+8uMHgy/MxuwWQ7mKzwBpjBQM2rXHiVWXDwo6qUGQiZ+ZX3ZW6od9rdZYhtCwee46U6D8ouBLbTEAG+AMiJUkzSiOZVpTZBaIK5Y9hfAwot3p8zZCkQEBm7XAdJcIy1azql3AIhDbscIqfUvLK1A8nuHMupzKrxuHVA0tiBYW1RgpUOIliGziqlqJT7Q/pQW9ZjC2jkLA+8PBx2b2N/K/wADT6KAXnUUDHcUTw1GoQsHcW9DaRCSbXL3aMwYkLpIzK8nkRMhhB4VKaQIuI6zHDkyuNVtL68TL4YSuILuts6sBwXXgNSnrAhuOYVKUPVFsDBKi1LcaOfKXAGuYLcsDMpMMOSzysAo3KqOZe0rq4PCLuFvVuoy8EVmAcw/EDOlp7uKtKfYHOYCbo+hmAtkbGmo1sXgsY/MFeWRUq1+pvFWDgXfMOZZUIr5lByGFxD5hW5PMN6QGlVQ5Ah4ymEhAqV1hUcGp2mQ2MSyWLAdSqmn5lPzVs7jHBVi+EwbhSqt78Sj+A8Yu4Qp7CHgiJLslbCEfoxBNa1zAQsLsQdkiJLUXKwgAq88zrcHwzRXB0Lf4SeXP8DSaQb2sS+jdLCxPCWwW5mmEvulEZYY+8xZAlLTZucbB08yjeAsc4iCApgq25dVXIN1UalA8eIlDr4/3Mz7bEKem3DFi66sxHtCh6EoRS5ZQLAVNdOYiweELZOR0zJriJUYxFO2BToy2pQ7gqywA2pQt0xYVPKY6qiKNNR5UMrUcC5gtLY+aM/1EbyXx1LKToJxB17XA6g85igZSLq5dgU7lJrhZEIap8RGK5Z1iYQwC2cXGKLVBHZABTto6KqBQQNbrLp8ROrtqvcsbFm01LuljD94POzUNTNXf+OPtEHUC9Shl2acQq0VXyjFQyb7iLgYmE8sRsZujQyc7BY3iiD94oMcjhcvzDL4/gLFhlxKajB2Mu8dfSRw3ABRQu7gXDZaeq1G1hRATNuJSUJ2iWtAOUQBZxbm5onIyzU30HLAmb/EQVFFZdITepVohYLYM4Go1WLuma50LFYbgDRUz4g/mOmYq3F4RbmbuWGmDcq5LhQB94lazGGzawjzEtoMcgqIvNRVFKeoxzHkQ2MjEvFpbzzEHes5OP1FizavwdR04OKDB5lzUVzu7JiivBzEC0psViIuxhinzG1KHXcOSSltvtmbgqj7RiiFRPmMD1o/3Bya5YdJFiAmgcHp4mTIsg2dQRi1tU44Ul4hLeAR2S5K2u1jnRX0CBbUTNGYKHOIUjg/MUoVcxLaYA83LfV5dPqEVhPUIgsyZdfnmoVK4bgRqPm8j/iDdXrgIG/97qLEtXqfaFjqXn6libyXUKg20mb9QhMIRPCopII3fdQCKDZpgNYG7T8QfoqnVW/0YXBPzISlMF1W+ZmcV6AZ/EKlE+WmZ2DE0wBeXIOZVBS0eJTJg5IxhJZvRHZfWI4u5pXMt1HcNMyygxMHMqhiorSOR+IITgepTcjS03AOQKh4YweQIxAGNQgqn5waGtxzOfRoemA1iVqP3jWFNWTd3MH1JkzZKg7cje5qCpU65g5QNeKjzw8LilVlQ99stSzGJMu4pUXHyw7+I0iwzFYYHzCi2Gx6krphA1vO/DKsgQ8hqF8DBbOd+4wIdDQiCHCTiXsu9XAdyWxOvTwqz+4a/gnuWm9EHPyLPNE1+miUrR0VAMLbcedbAD7h1hCMslQEa1OC6qWs2G3QwBUGli+F+C5ZOFjxbUrCsFHvMdlbIfJKMBgPm+oCO8kAsz65iIiobCOgONyzEAE+ETJGLMG2HOZFQ1Ct4g4MJUMATIPob8zBMLBrcYqCKR5jQAD8wnMGD3v9R+gwxBcwtckbbyz1xCpbtyy7tKNlw84AmYsFg7K1UoI0LShe5qUU8JjfgNoilCgag7IAiwb5Kb+8zCryYMC6ZTfEM2ICM7yoKMweGUMdsQVcwxmvUCwh8kRjGRyfMTl2V7sdEQKwfIxi5jsHUTdDn3C9mFKj+4a/glQsKhTDHqWtRZfQ5eUqy5kFqMLxKrkthcox2uw25jFnAHeohDu7lTUDd14hMpSVzTJ+poijnblK72rw4lyKS1jmObVtCKWBeGhE3JacRDkV2zBmb3KBlO0te2Yjbitj1FATJmOZcusTBrMYENbmAbPoBaoxapmVvMEN8dRHQW5fmb4ltsyNfqV2TgOvmGEMFYTGlrj8zd5cMYooDoiVTkF/5caSKDJc5e0nKEcW76giFXKG3mEUxKOcwAtznMwUgRq+UCwDqCQ1YTGEszuVKguAbUvgHzETIzk5tuNguiINL6IaQhZDiMzmDhFJidvmJ2bXC2EKLmq1FEc9Qn5Z/uH8ESps3cTK2rDBBj6TaPzqJApUKqBUq68zFMtXmPP2rJDKbI3CtoqJaaOcRQKcHnzBaKNzg+INJVZO5d+Blw6S7BGdVbm2q3CLovmKND7mOscjU5fRVEpA3xEhTzL8Jg0lCuA4lzG4CwyRh2xheTFa5Qv3CVTiw8QBL6vMreGO0XmXY4Xnn1E2mLXII+jTw8TL2anUayYDoDDBs7r6iZ5tuAcVFndsEM83Q0qKEPIwVqFeLqVRqXGlW7MaKXeyAX4lTLPqaY3NWpkzCu7iswTHGWC8B2wqWRPbFHvs0giimvGaY3DdWZa8rw0StNF9hX8HSX66xFUNYqnkh9XnAwLgkb5lTtuIU74S7Lxj6iQMsA9Q0kDl2jFqXaYjWsanmWZq+zJHFUKDvcNrBqoQWAsiOH+07O4Tc07ivJmICG0zCxEFzCD9DdEhu2EwIsRtOhTEXPJjQNDcrTCGATdxzlJV9R5rSj5gJhQg3V5giwr4G8XBXDRRxGILyDCyVsZ8ykgcaIFSlDtmAA+wWnwAkoHEMBMBpfkgaXBZdaL83CcEL+8fzChbDKVxGGiaVHccxUwEYrwRWwR3UDRHXke0LnmDlsxteo0lZvcoPpQLp6T7fwkBboleULIPETOc6I5VrZWY4jzFTjmIUVLNuIlQWiNsvWZb6ou4ounfEBjYHBcYMBkjEIAyDj5jsxdPXqCwbTvmW4B5E6cKB4mZB4QCpj9btOJQpvOG2aZiAqsQWuVRKBsHcLCazxHbVpTK3yli1M6CsQi+Im/EUK5LzDaXJlNIEDfiJGIWiurgitMvL4TYisceUjmIlJ2mCBlcpUsVBhraFS8y8rEu9eo5FUmbNwC0RXK3Bu9Rc2j+4y1hViMGdOGEvBDDULXcdwPtNwC8+JUi/KArbUQcZeYATDicFvKcGD1BxdjeYGVYNQ2DgMdxx23ej+C6ltcE4lY7lLBL1nmG2ZeYzeGYkcQNyJibtLca2TxK0BdwLsuuwQ5VQZjAIVniZ4XBuCSFuJcO0zzGLrLHVcpcNKvqbwgUwXlCsO5bQ3L2RJUe4MRlhvDLYdCXMKUC/cXUuUFjBZvARDwm8QulTnOxCB2a8mUuVJTZ5gZCsMaxD7DKNnbUODur7QS9WzYbMYcrn4j1cXcG2MQaCoNu42Am0dLzBBgQYJkVA7uFsBFrF83NuUgDmONt1yQTXcUthhgkwWwdCmGPememFsB8pjDAXih9OJQqM3iN2YYEKIrkQJck9ICpU4iUDBmmVSbR2XNUg3lDP8FkgGVWghdCZDuKS9kWTDJBc0m8MMVRoraAoah32GeZjTKE1a/mi4VxsQcQaTyMSoG8I1autR4XECnU75v9I5lfTMxheRgF5hQOYQWS37w7bkK/JG1obsbtHNt0CAm5RcopFWR1LgSqiqncyRhtNXy8xKEvrSQrQh8Zz+I3rYV5lUssE6IOEqwyTnEXQ3MBrrPiCqaFkb+0U4dXlUeZqAFR5QpN1Jyt4hXqFYdxVVEEHMBgkOa2IsAuXMKdgKerlGImkhFRWK2hdG4iGMUPmMBD2vkm8DBwuA9wj4K3wcRGvSFVwJuIGXWuLlZe6XD3z8R5tKUYTENn7/g6WgPEFSSRp2Jj2xKPlPs2O8ccO9ypgMIAcylDdYc+SMmQCvMXt3UZlrm7xfMZhUuh/EbRaK0DKLFBTcJBjuUVGbjVU3VM1ubRMfTY+ZdTgJpMqNVcRnTAkKTURkDHES0DXMKS8VHKaKv7SxecS9WxEzLmWDuVFvmKWDHQOpKGlWq41zCxVPpcuY4y3REooLswBWLZHQPt8RCIUstI7mSQhu0f3FK2vjyIQm69nREJr09UaZymTNgqKYwLodS+xUE0xKursC/tF43XHB3EFtSFmSVZHDhgMZYDY+yOmlaVB6ISDoMwUmkQd1q4pptu4ssFRLNeIBbdTEfglSgj2x2KLho7hjwO3buV/BWygtahnGF4fmMXaMPcVt3DlT6zKESaijbRcEOOUQQ3/wA4TkLX5jULfNRtS2WeZdYkt09RPSufKCGuWXxCI/fAd5cGK7YWmyGruDMdfRg45gVU3Mo5DHcuoJKyy+5joa09QYoncvgEIQmBudLmUwsDdRGab7lL8TFSi7ZeoB7Ctx1DiAkQDA/8QRmE2aoZhnqqvcbyM0vPiGkr4tYzTAXjYqw/7joAtZbdTLR5gfL95nQRVxyPzCSfch1+JWCBEZIOuAp0MMetXzf/AMlyymOhA40leXUwmhQ5ZZa8c9o+w5QpjTEEYEWdSsLQb3DpRzk1FVuKiNlMMHteoJeRBBgh2AMOmH8IiiCdMJFNlYgppxEQephZDUeIy8zOYFRtNxQHlcLxOBCCzmNaxVVDtjLAoo4i3wWGNkCnmHSENvmZVN/oYaS42ahmFmwEHynmQ4jlBQcRR6CZDhgYeCMalkcRqnhYpFFqgEuDCdzG4gZgL8wctrHqGmrFvqO4BpyC5pv7eKoymod5JwQLcWzeO7hMbxjbTGMpa6CVCVAYNjLthBaJgyvzHq6dwKYuKMTNxi5ljFlomwKjSpcJR1l7qOzp2aoJYDGmmOY5BSsbqZn0JOi4wyrYe40hC7imAkMM5Npw9EC5aCCrVWIna0DSTynJQcQ8hl/EcwQGglqHFTf6hPpaTSYMGcqLmSEu5kQIuwI6V7MStFqmMNOKiy8zcSt2DkQuVgcyxUNYqO+foNfQbBALIxCbWepwVMOlqi0gmDR90AqBmmBTW8txFUsH5m/R34lRhq4IIai1ByQQxUYalFtNWuPMC0YWY0QGKaWvUNKUKsr9w3rjiPUah0OqVubKXQOf6lGharxjZBQtfRN4UEKDa4MCgabs1UbsUDIiBHyNiXFSRsGrlsrCnu/cOPjU1TkEF2X21l5Zg+ZQGcIcABglThJaLSfli2NhRkO0QKdwAh1MLgWPS2U6Lphn8A65YRCjOWviXzAKc/Wv4ukyOhFaY8pp9Ok3lUZpLCouHoXcc1aXEpQyVKqSDYfEHUMCDKrvibQ8VLlN5tjiMXqZ3KULe54pgubSvGYQwY30hyIrsZqYjxkZSiWszJLpJARdC/EsjLA8LnE6y4xR39BlWLM5BEaeRqA/K20zVS1KdfdL2wq64o+oJo2ldOpjO9HNjpi4y4efJH4GLV6huCnGx4qUgBEol02xdatVaESLJQzjmOK9AwPMcLFRu1cRtXemlAjfsPEugiw5F3GDgpzhLfzHqty5zhIVeQWhmRwJebgBsuWOiWL4xMLcX5YwKDXR1B0egcIedwYp/Ed/yNZd4cVBHKIKIs/QvpukgMu4dm8w3qM1Mk2t2BS5Ez5ZfIlN+48NyLYXQRZBxqA6CUvO9wXc1E3f1lQVBRegqDLy3GpDLFVz5Y/AF0xLQuj5VLAgLcPFYLi0G6h7qAal/dmFB7VDMp6ipzES4QfmAiEws7IG4WPxLkXZltYxgW89Q+40CZBmI9B0QxD6PwJnz1Tncy6sW7CCqqCzjzjzBKyXCqFu5UxU6KhmoTy4hZxULpSv3AUV70vlFgxov+yGdKZRoWmAaDgHHULfIEVFc/8AEK6tlPO/iYT0hwlr+oKviAbB1EdBCffM5vOx9wGFBv7xMMM/lNIS3iPZq6+hRBNSumvoOJS1x9zJ5SoFrV0YNY0nuBMZIlF531FQhK7gFajqUCJQZmCnHUs2G9wwDcTttgLBLMpQ4lahgMw0xMxlpZcYjB9pgNSr7IpNRcCqKitRu7lXcqQFg/JGq6hk8MuFQxExStRmBu9QL01AKazCJIP2cTgQWMtLGgae5MVL26DGZFi+YrtB4aFuINRcpGZjHyzLZXBcvmFiBIhoGNmqZLlaTEuCCyYQo0dEtbqVNWyxurzm42fIhxXNRtelrx1mWgRNeNwbPLkvibWoXjz+D/8AYYg3/JLm8T5jPkSkDtmxGPiIqU4haIq4ogh3YtRrhiozvCrJWq91fUIpVNwzOuhVxsHJM5XO4Fs2Y2BSmKprEPPUojE+bjDFW1G6mIEBoMdRqvnF7l3LKS9pEiwdrXEO+IDwiy3eD5lUZK0dhMp50iii1phpTBabNCNpqhAvUuzqcQIQs0VXUwCu7ZlZvrEqXdwKnMdxSrxKNxeo/tN4fqFMyzq+/UW9bfMQpVaExnOWsQaixVeZagTmDbdDbCGtrWMy8p5nkm4FfyDZPikzXzG7zC9x0LGYOVzqLHRiVi8JA30GG5mmpaKVcIr8I8EXOh5l4bYPwl4WNxgqWAuFvEIbVp3GiipYQMTAl7oxMSLHcput9OpQ8DqNkXZqN4kImlpRGlDjcKBVZhug0wtOd0dIKAsTPzgvOC7jrEyn5hvRkQIHVFLrc3yTZGUQUWupYxiKcy/ym0WMocmq/uK2sBaRgIcMuyO/ppNoLIMy6jMzOIbzL6JzLglTtZSGQiVq4R7ILxL5klWITwCAcQ/kupkK4m/sxg2k4Iw3aK7PEI2gHOphba4jjGZmCQCW6eoyiVgO42Uqu+IKupaPMQd2x1KSj0g05I2sElz/ALjBHc2IStQ5lSBbRlV4gIxlgynfxLJHmNCVnhFLWx2xdTWs7lb4dwMMZdwKnpEwVT3FkWOCUuIyHZAI+cSEV2bSIOZTQ4i7aNtkK8ADiV7HkqB0CGJtqYI9IFcQu5XmIVElefpzKQOoLQwxbhxFTctj1kMI9DbKQOX2lXYKUfIso3DH1cfx7Oko7B2xsfSKMWYqR0vqcfEbx1M1DjbFl6QugN7TPCybuATZtA7l6vkrzA9gLIBDTguIshWZItnPmBURdYldrGYSwZIitWQe6cxTRuNFQsAlNqxAXiPJCESW7olR60utwWA5sdbMpc2IsxxWuwMaMAWsFVGSXnDlHsEHbAKqK+jDrQ4swQVCKrkpqBhC1WE+6mL7XSwauuq+oFkQa1UeqZZqOEqYEWW/TkioHMJiq0IOiVQlhe+AiDTncpIvol4R5MviKz2i0K8QbPq7GiYAc/xb28/1HbjhDSK16+gWpVWAbhCDWDnCoA37KEI0QexuUFFXLxKQUux8zMsgUJTHS8oCio2RxNBkxCuLYU+J7A2LxMRXXMSysMpYZifRF2YNUMAuzbBbq+JmbHCaLIhgm0ZsR65mE15IJWUPvgvcilwAdVFHI8Q1Qya8K6zIEaTicVmuI1k5To5hjE2nMcGuojaLwOWBUogr7heCKZqP1GkbWoGBqJ9dVwQJJu0ZbQxi+YaW5ACrAs0va9RoBdo36YrpVXHSObjn2i4Po6gstWT8ouGSz+Ib939Tb2TSH0JLTLwlljAAZS1yxAfbDA6K1LAWFxCwQurlS4FT2hjxe/MGJU1BgBcSwIwpVzYTmBA4YzME9Jmq5OI9wVvBiVxGWc3AROkhSjiib1sIxKrRfcFY8SUSV5y7so2kMbLOoy0CwgqmHaxk7ATbbiKAuyAYBmKWTVcemKMPmJi5BbKwWL6VMLXXUXE8KjkDCi3FmMZh9QXUqAzN04rg98QCKsKcYnM8AcTcpviiGctN/DCm6bMRKvNH0JqZY1ABNOKiTptqvUNB1/E/N/qfufUMfpUXHxLhF0K55ERMjZiMs45JWpk1LMVTKlzZVTYXURygO+KiprTD2jYUalssGgwVBNzbcE+qMw4BhmHhGzUUGye5jRk3Nsd3Dg2Lh+paQoOdVGCqBqMAEvmFzFcQpy0ZgLhywRAkMGdSjghcbEE03LSlgs4gUCg03FBKLVR1ioWHhoxNOmmIG/QVcHPKYGCFlWIqTFLSZ2wy4E1ERLRDCzM6fSom8bg9JGtASnqY7Srwqo9rUU+YmsYAtAR22kqq6ribDmZvxEK4cyjUWwKEZ8YLoNTC3zN6wAJ/BN+z+pp7o8Rmv/AYZGZ66hRqZCVBIOp5jx1JRNC6thhCMzPJcsSGyXZe5KxAEWBhGNyhilgETrcGzwGEpfJmWncrWIm8RGJVdy0sCBKA0E6U7lpYeCApIgtIirG8sAqtgLsUz8ojF6SpCG4saAKXzHBhr7jWaIbwslg5gpmYozLABtaojJ4Xh4iI7qjROKFcR1sxCHGIdwCUSkeIosijcyW6hItErZhspi17d5J8BHiMqUcrHszYUWG2A+F+pzGEBsdxabtrBDVLFWURt6YxOlfwRfs/qfmThOZo+txCC7JiyIpzA0h/LxFM5n3TNnaFCtJaLytolDYmIQsEu5auA0MC+vxFHEtbjBMYrN5gNq5gCqWLG3E3ysxTDFRefqVjWkF6xk4zUMzMwW6rDFxjChgipFRwFhDTfcNZUNy6raGa5jiUuIZXZVQ2lqlsJTwG40DLe5ZCgks6ylKMiFhr5j1ulHjuMXvLlcIvdRi4FATVw3aePXbHJGAdS+IM92O2swLJYE7blZcj9RAtrNldQAEOA7liSr1c3wcZ5IG4cMtl7nE4z9HOJgk3ZFnw5nTogvmXReZ+LEP4C4f/AJQwVUfcZkYZg1lUQ3GZxAy/HeSBkPOcFslO5mAyPvCtiMEF2jKBauWSKOmaRW4l6BpmUqv76WFB0EVADrmM1AgjmzjmVMzBmC6QaiMS8z1GB3Nywo3U2Fv6ShNEuRwcRSVpEfM5JA9kFAGCFiI3FehUt66oBB55WDLiZ/8AYmGC3EAV0upuNS4OLFdsxh0fLHc5Ko8SpyVxFIC/dKGAi4NSuMAx8zBgtrdkK14R4XmNWj7hjoqNX4lmDWoTyMrG/EAr2/xEsbPwxcDkgG4rVc6hFqXNMTNeIjnqVFQ8xWsc1BX3kmO80Sv4F3hT8TFC2km4So/Q2jJ9AUXHJvCLuLhO8uu0QZS4eYlmGLYBZ7KStdTKsuKHgIwnVcSkEKiaIcKJQ9kD3LPOZQdAMQa/MqV0w4a1c2JmZnhSVU48EdEWMyu2BjzHFbIAOOUtDdJMjgD8ZncHlqipkIPNcEv8wzK1iOYWXasDJSh+8WyxKwjD+oIGQXFiSnEUmJUQGFXSpfA4umJXVsboIA40qZibbikQOoxmltgcOObQmu1cnkmyvgmMMvmGTi0rm2WYKCylgUQ81AKhWfKWIaGLzN1BqOBiy+IMSqBuJDO5xuWVseGICmk/g1D/AN1MDXYPzCCaO/NTlhsy6GsJy5uCYMAmAWxo1CKQUdpgVVvFSwaQlX2FqNgKwJfAX4moJzBKiGmYKBMkK0H8JtlJw8xQRMYga5Rq4iS70uPBbnqXZYFzojFTiHJFgIsXfuUvHLv1CigVe0YnbEkz7ZVdkAgIWjxLyPJKMMIbhKhBGMrJsYKX/Uek6hwOIrCAvNrv8xEoBXxDHKj7o+rbz6mgjzEKHywXXO3xUtqU2ypEon5lAyQtCFWQuvtFMWq/M5dy3iUYaw0xKMyiwU/Ux4+DLFcxeqT/AEgZudkNaNCh3Cm8rFyZoRzJqYtwjbxMKJiI4/g3f+/Etovf8zarTQ9S4brD4gBlNwCiFbCVvmX0mdhu3LoaUUtYhMVncahgbbEHLRT3Kln7Ro2y2hSWStEeERRdioLmyI+YgSrro5hRfYzFM1NXEtJW1UWl8xiZIxFY5iBfDLhPWAHuKwVrbjICb5gqm6XcNrrywrcKwsTlb8xajJT947ldUGJpt8CG2GWaWJToIOpChBSNongCNESyjsyh7ozNd3JlAFTaJdbmB1Lp7BRoQ3QLVC1LouMhylEVRSJazD4JGw1jbHKvxDdCA07ldtfkRykXp1zKwDOoKBc437lo5vBe5et7gxiaTcyOHUdj+AEP/mpnmy35lA7g7msVU2lZSvomGLmWkusQDOz5EYnw0rpaWEayUwVqCR5w5IfzeumfcVCoBySsPca9JUGBL44lK7YpvpjpW6LWA3We0OQt7gCgqmeJJ6YIK01BL+jV9HtTCVBniGUK6GPUGGWuZqrnIEtZgmnViCNN8wXi0IYAZZbbhyxMKYNEcp4wQcg8pUVNRQu2YjUtMwBoGMPSKS0LFJSkoygNLafeV7F2BLwaEA+Irb4gFS4wYdubr8QkWVVHYTjuXazg8QwtymYO4cMyyg5GWg7hAD1GZLuXCHczag1NofuhoH8AUO/1yxWi/wBsu5pLuaQamaRdBFhBhS3zTjaqbk5UQJZgQFcJg0eOzO067ZedVzFQdjTxL54W4EWUYsHjDgzKUUhD28QgjYQ+ZgAAcMZNvMqQxUpA6W7j3DUXkjEaUn0yH6lvs0W6h6A8ogWitQbZe4JctxRSi4rA5+iUcazuEqgOYzSqZZiUrhI3qgrDBq3hiDYOmZrTdykG6RxlL+UpjTW/ENNjN7xE3m2MVvmVXuGMwxBcVZbhAYobe2ZEha46k1rfYxhlbVjxLLFHRATAVI+Jg8nuLEckwcAPzADW+Z8GnMcZlkTUyDf8BAHI/ieBCxuIZQZZpGkCWVmJbxOTua/iVK0Ja6NaJbcBxL7YLCOZAnECIQTqUlAckZw/fBHFktUUvMpNrZLHMua4gSemQ7hnJIlN7gahBvm479kT7wjo58Y2+AzOtdzdHZilM1BlUonMGCbyw4LZdXABr4uN+RL3C5OKPmCNNcF9x7UVW5xpbEwBFGLgxnbvcNAlViZxa0PmI26LzHQCgYNNkCUB5uUMyqlK4WHqCwFVGviM3Obiu+IBbLalZgmUaKdIZRQh5rmC7Z21FsKBs4uGBmjXvqZgI6zzESVFKmCvHUdDxCAFzKbTbVStt1Ln8ajUxl4i6mYsL/3ij3+mePwflgy9n9Ixf3Hh+gIKblitm4wTxKVfMGzUwy0RQ4ecvCEWUuFGTxGtRqVpGzFUgFgMvAahQKnUVpqmLBirZu4lmKqnBmOSAG+y4FxbvcxOcQGopuo4hecWyHHEKnEyqld4j5i+J4phYpLoDvMpY8KwpqRNjcqKjAfMCxB4csQMRXRaoqKTQt5KK5Yy83K8QwMS37F7niOEg06U5K3Bn8q1KhW+Ag4CjFRBwhigZW583DSubgManEYEZtDC0bHfiCF7XHRFZHYxFeAVhmAK1EuuSEpWX3iFjYQCR5vDKiRyYlADI5YwKtGILZoLYxPulO20iciKxKshglkuJGrJ4TX+g/8AgMQVMUL8sF7lC/E9QU5jKXuajFlLTKcUIKHNlICwLyS/mKj0Nh3MapdjGAwUeQO3qHqG8CMht9eJiC1XzGM1sJkhq83Labn7g4/OuDhKvzHKWCfMwNOROC6j5LzxcgJnvdTNqmKLZKZWylxNzDqNLQuWGyOmAACYFgGqpaoSsqUuajY5gWAsBiDg4xHIKL13qUGDpeWVyrpTqK+EOSECFcu4BwLJ3KHtsWITkbAiKPdhslAtTZSwVS5ZhK+mnuXaLV0ldlHYMwUo9ZQTS3KkAqlmCAnKjlW6YyHW+ArLahJiXBpgUtExL3bb6iLJpllmkhLRQQbaOJRpzDH0g7jQ3qUwHOYAnzK9u6ZdIuTFznn4/wAzQ/8AFSyDNA+7Kv8AX4ngX90Vp3Ctn0sQg3LuqBB8zITOPKoNmxppijQAcHcygYCWdWAR2sHDGk0Nlwir0tqBgZLTuAAU7GX7WCal/ZkElDqTJK8KYQ2hbNQtAWU37gBQh4lAXlsMzJg1Dba5ltmQxA6lfEaNSw1FNKiLRi0iGio6NtkuUszVvc1nqjMKaSxu5RGXEOxl6jIHLiNkAW28RbolSaj8DyJwuai+tF70gLNQwoiUBKjgThWB0mTjeB4gijedwkI1iWmYXibqcsoy78MLGVUBY1VQBsawNPmXtiMnwmXXnHGBSyxBsKYeKlHuKz1PtA8TNcg0vmJAyiiFi0BVcwgHRdR1Fmm41RwauUrS1MVLuCWjOGW3b6jTHmkG+vkdx3UMcQLBedxu8QVf+Yo9yKm3R+YulpY+8XCqD8xQHjmGDGoROeoDMdOJoLLNsQSLq2WONXuFVzIYYaE5rEUKqcWTEDhzMhWqi9wmBlKnA5EFVUmCABLYOmHZYxYVDkWg1KK0XUMXLhEB08kQ0NmvMIbw/wDIh0aMMsEuygp7QwU3FWWDfEqxJbxKFhmOZWYkU4blWz0ws51IQJ2rhDugZdlnNY6gULJ1HviykILxOSb9Rg4jfBxEOddnNe4zAAJgRWI1LKliEXXalNkMlR0x7UrzL2eZZ1EU6ZmUFBbxca2wIG2VzlYDjVVU+0ahTM6VcOE9S8Stbe5TypeiHCyuNygTBEArjhgyAsW4PIdJvSo+85Qwpg1TKtwKBIBh01BWGYE2WVxKcOUeJpDrMBR2DuPJLamIq7mIH/Qwe0IhCipKgdXH3lXmC/lihXLl6lDBaMeYMRorj2LGXEVJGsM1EW5cGghcpjlzDMMDPmYQ0OGUvdpL7Nl0TI0C4grdI3HhLjhLZ3MacnzL1DkGMSQ7X1Dzfhj6oTmXQPD1ETWpLlWzksqOU7GPAroYbnmS3QIdtkozWIZidOonRVx7x3RZLXMyUyO4bQo1mOJdCzKt/aaw3JmHgae5ctkOZlDJxLbLaXRzMTlRTaxAhNkF5BYR7HDWHBE4Q3LkGu4bzrdEcNeickutQLyNVEetCIMsbLaqXFeIFAcmF5joQGjmC1jSM8gGCGDlyeo9j1UvRxhr4j3FmZOwOYKK7hY1fO4CZtuUErTmUKZgg7gXnEQcg6SY6quKlFyj/oF/qXJMBEMBdTA0fsWYmayiTdRBlkshhmCJmJ7gKFgDDDiYLR1LdB1EUKpvxKVmwMwgyBfMMhx0HMzTazEfdQ/ClIQiksplzGSAvpKnMqFzVriZ07TFdzdJYxKXVXKvNzoioqSZgg3eqjKIb53L0AXBe4QTBNiRhUqQcDe5kwxBpUGVyGGHjGebCUSopaEEMKUWX7jtgozhQ6gKgji4HSvaDGBlLj7mkkJmOCNqGb6rqPWNFqJca08QIylbgIKAdwhhrhU3cqbJNiWjJCvLqLOgXBy+YoumCuyWmDSG1gGYoaLxLTKpzD6BfqIgKpCv7jZpef3C7xzNht36nqOI32IYOKHOImVPMqyGhuI8pQOkQpaY6EuRTniOxGFgV3UNv+jNGM5Mmqg1DLyH57ShjjZlW7jUVDdkdR18xLMwVJdDiAqD4gEvHEZXig3KYEd+YlRZSbZQk4GMNUyYksOWMr00ECNGYRihe5YlYc+IxkFMkXDVTNdRsaKxjh8RfEoMi9RnMGovBCygUq7g1FtwaQdrqFU0nDmAdqWMw6siNVGEqRgdRvJQ0QHA9RSsED8oiiFJylXcFlQ3DUicSy9hUsW36lhp16lHMzBpxFyt8wAEHEsiqxkYSb1M5xBd+YsSgF+YVbjztELNTixI4mcQpSuSC7WUXogGwK8+CA2abK4h/W17cQXRqH4Sh9nMLN1ezzKxjehMk3BqHGZYBmBU7LmYXMGpxCy1OYqrxL0s3LseQhbLo5IUsrhIxfhEBYMyJz/m8zpxF3HSEwl3d3j+4PPQ6GPsNV1HK2zDDDDAyxekCkMN7lJd6cTevPDuNBQdUsa9wrgwVjVxNqA1K3KaRmDNacEGAb6II1ymnqCdAsdwI1EKl9qt4hIMI5Vo1niI1YW1xEoCuIVLAN/8w5UVgESAt8rNVrb4lkbPGAqw7iVbr4h1UOIVTpEsUImvG+iDGr6glBDzMRAP0mWPSMqIPc0o9HmUVklHRjENEaT8ohkx+h9EXFkqKzOJmRpq/iLzUA/aMFyPyigIZRp5TDANny6lTt4OxMItSkNK4u+CK0oO1qGGXVp1dTGB4jQQ1GtegqFt1uRNF7hEBRsgFXNspXcYEAabGDwczMDuoLtBzaWteCXbiZFQggRjgO7gpRKlAVxDn/Ny7mc83fmbjogEiLr4pf6iLUMeRUF8VFPOI7ZjI2XK3b5nS8QaGWKE1kfMKVatOKmhGG4Bitsy4MSX3M1UHyQiOu5aQJdy1gr5JDAFGGUu8wwVDVA9oahAZBiMwGKY1hSpdQERQ6EvFUoD0xRm5kbgtKb00wXhKsvTEDU8qmTSiuCZAQvTzKlyhGIdquyAWPPNahbgN1GFiLCJMUeV3B5kal0UGrlEl8xzMgM0lDQuEBSrH2D1uMBfdtym2l0I6AWvEFakWbIZYiJLmYyVXcrxbcSxiudL+YtpVsMJUzSsabsqBtzEs1E4VXQO4JVoNuglkQa2X3ZrJ+EOECIhiD8aXYa8QaKMndcQUYQpuWBBa1aYrF5mRPcCxpRKN6zaC1ym14jehufY4lAptCstzEtjcKZuBWtf6D/cIlupDKHWIpLNmEXgKRZQsuoIgdZy2zFdZcfaWWY+8AdqxFQpUCrQdkVWgNwj0u4CpuDlQaCdwOCa0VKkk7aZIAISio37lZdiOExGBdTGlfdFTGm9S5otReZQty1AtUxw1phIuO+0FgADNumUxgvtIjaibORFaVGRjji+ZKjbtXGaijfENJzLYZRr+HmGyuyvMpZ0OU3HiI9C9QNWHB1ElMa9yq3snEyoOYMyPEoIRnRluJtw7h0ssYMQyzWrihFMbJLepyivEerrEKyIWMgYgM9wLtBdMVq7gJWR9qKXHMcJVt72lV6iEA1Dl6iI6nfsZmVYtpyMsLtCKWQLWdwX/tMYtrCgaYyKlBldy2rk2T8LmhzG0N+IQDmClO4Qhh5lQqBsgPGocBZEl5FhrUrN1KI9wf8AQSlUGbgXwaphZxLvLrF90g3RXEoLKpfqClwhfuXCmxzEIdzODcxBxUso8EowR3DNqpzGKorm4dYAoEczwvqHBQWNJSVhi+HuZIRLX6gPqwVz8x6VFlp8y5EzgdEOBbzwjCrMTSwk7bQpua9kh0uZEfbJkNg0svmL56hWSNQ3sOIyHLlgysHHDGAjmf7hQ/dCcfEPDjkXgDlmGNji3ETgfBYpl2A72WCBiz8ysvPWynUIiDS0i8xRdqsdSr3zT/GEy8IHEKcTwdTYCcBxF+ERiiPtLRgNmnwnRw4ikc3qKtrgnFCXVim5oIIilLnK3FiQbNUwnm3/AAMEQDj4K3AR2aTriIQatwab2KJlf3i1qXgxKDDhUF4XUUew+KlPTcoZcxYDVzI4TUjJgqxeJRmVKJ4SqJzCjFf4HWwPMGUo7Y4lRwWy2GTqH7ghJbGT7QQspo5i1lN5kDNy/TH6CNDwmSwuoPWlVV8RBCsjUswc9SgKuDFBRCbzRFsAwkwoXeoG8bF6rW0dwSjoThGw4gYjoiE44rDTBDyWHMCBtltxEGjjPKEnAEB16jhmCjfwlHLWFcTSg/h7hYbqJ+pTPSh3LetixWBhHkblm+jUzAoQmJfdS4lDPDFAhOWAMKlEr0tZOUcXvgcRioRbSMgJy7n4g2cVubtigC35irJSFqt5QbJi4lgnwCE6cRxSMozUzK/MMsUrgKvAZlVACMPBDYhXwNwd3MFBRPFStJMTyRFDRgbCL50q74lqc1Oh0veP6hfU9+kLBEPk9y16AKoiiNDSByNxIVACAiupgxlyhNUauGVqoFH+uhtkThL8EWJ9SMVeP7VzaqDNUaVaGmMqq4QERV14ajjMoN6/US7DUPr6hdqVIsji9RR0cwqUdRTJbTE8lQC1zE6fzLMZXAyqUNwczd8x0IzEuRZb0mLsxlibESDiBZYqtcSid0Lh8EErOcOE6moVQbr5gVaFq9Rc0XFHplqMrVcV7igK7tKiwctUz9EtBsjiNNr9JXaN6EXYt1zFitkK/syxtLgCLi1lUvmWOgPEbFBifaOH/EtqrxE6QXJmk2RywvhYdIsxcy6jFgwIy9HFO4FNueJnWWgdyyBiUTTmreFzBqszlDf7R8QVxHqUKKWOzqXY6SvZD1J9ZcWbCkHT1DELEpwT8KGIS7o5boqLiFGmXuIoHEJzmCo1WI5c5JqGWF2lqAzLGQ6lQuGv9/JhBOVrWYblGsqN+6ZoIoAn6MqwK6m40Bm0U7H2zIle7zFArHUcRGKLVh1EiUwcy0R6wzzywVe0FuHzFKAtuO3hGDR2L5lABsPZFUwKvrwiYxy7ZiBlsQTPJYNqOeYjKydFlvygh3jyMDYnAwVq6s1Kai61zFIxMwZUK7ZXjf0fqa+vx9K+gWy1ELYnBdm4y0uG2AqVAU4uog5QLCsxrZUBdwhZXOzxEsBoxjagKGXibswFyENUDE28djrEzENkC0201xGEaEVeTmVMKueHctx/LTHK11Re4DTAl0W6vIxzQDkjr6Kv3ccX1Aq8Ec6xMXSYjYOrhr/Xx2wiws4HMpP4BisO5kDuCPwv3A6YW5Yra/bInNoglM1UIyLlB3mUqGJwOIBBVmA4XcofrhgNw53ArXOKtNPM1qKFgsgnnJHdqUohivUW/TPaRYgD9W+YCvlpNsK9LBmEui2bcibpd0NstECS2NAWKRCIQRuYggCpi5bnj/EJpmWQQYo7gFt3BYzllVBHJDgZeE3EJgcSsWhpIx5A2QgggjwEqPbyBgJWI/MxAlJyNy6lIAmqqDQEgHKo28QDFdrwxhAq3+sa5Fp0kIr7egQMpswtiD8kKk1BdGAht4b8xyLIQdQFgo5HqE3N4idZLghqArwwB5NRc3VZalLObz/qGULzDxJXAJqSR8L14hAHwrAwkh/e8rFwK1Kj5lQmoQrafwz/AOnkTNylPbYJBVwNZ+86o7+uLnUMe5Z0/eUb/uPTUobMRlWrzKkGZfUMVE+3quJhfiHhOA0Mv1DbyFeHmAxVdBR4dQjIQ4sHFAj3H1RV0NwREI5h4Yo9zNfANdJwFeErLDMt7SpX1uiFhmC5q5mvIl2A+Yh1mUepoTJMQO4yjEtzkmS0L8JdiUWRy7ltjDmMoOUik+o6qKwJY1kY3QpLIqeHUA+xAtbuJhmJXaw6iy3BWZdabtKstcQgXuUDhEFheuMRrw4FDiuZhrTIvEqahsj3Co0DmDUpiBqjiDFPmaPMMalaVymIZLCf6rV1TsvMLQz4MYSX3LLytiglYMxGBkhU+4/8rYlW8H8MatHH+UyxTqNSjrbmYwLYn+V/4MWZwXMYtsgZxZELIo0W40ADR4WKloCLhJRSbOll5grdKNUu42spT2p4iHsIIy8G8F9RXKogcVW4ZRqpPMQawRlif4VAeI3M9zVmVFKFF4hkxN4gMCYeYYEaLvxLqsivtCGoMR57giABtotyoGiKOiW9Qs+Y4DPDMHPkorNYD+IqhKwldj1iJ1poMTRDQG6jaqWlfFRBqSKO3MKSt0ftAwY0UcpAgYqzqG0N2fMtxLT2glIwRculS0TmMM46XqaoAPK5qt/quwDySzonoYMmb0CJLu71Uvbjg2qBjTYojUEyRxWM9zygCf8AijEIoCJSMKqyUcLz9zHaDEGuIZEzKZETuGmJD6v0Izi5ccCMlZozzc3uAJESGDh09xSosw1KfUMuUM1pwMAjVgjbcuYIqZKbHqW/i+XK6h5ILhG6jQarYeJUkln0nxmZiA0nDUXaYblJzLQ8Qk7XFSk3IWajn0/pBh80xHEAM2uItY8Fk4kckDBZ0eJSO5YpXR8Sw401trbf0JK2g9amLTu8yZhVFaogq2bOIlS5sUUaXIa8IuTPrrGFrjvT5iuz7almEoKvMeZ63iBbS82SofsTG5NiXMqamh3Nv9N/4V9DNZHUPEN6Ewx1Knuz+4aL/wAVBYQ/QVIzxRvDTxs7hm2kbTcCBzFLspIisH1v6kZf0uYQXJpGIZD2SUwm3MIphgTjzFK0xXRUCzAyQAEMNQYBo1ByKyY2rEQ/YgBrN0/7gXvxTAwGouFQ8Ay+rPOIJdR/cY4mJViEoCFXJuN2SbGHEGMyprc2vQsrtaX6laHCmoGQWjROphcuAPYEGtLtB4qKOGBGqmFlDRWk/qEoWp3gUmmAsIt4hPCLbNMuIbV1ULcFUVxCxhso08TOgAompYR2KhxElWx/UGEDWmssEWtpgxLPG1CUYawncMXumowXV6lzJOoq+BXMeH+oM3/mZSynuoHdW/lDYGcf3NR/8EfU6ZrWoj/2ypbDOvEAnljk6WRSYWyguYJaGvpxD6BZEqBmFxYM3GUIhYulZmJS7iqh0YJ022i7lyaIC7lroyO5qucD7xU25kpXjMsGlNGVlpQanTaGYagfAhqXarydepoSzCYPMxalGBRCNmocplhUsmVglRLK5idgbalRLEDtlRS1tHslfZtM8kaLFGpTvThrARqySx7+Iym12UFNB+Uia+Y5gBZNR1pmyAvhRrzTcN3Eqb8SpfLh7lcTUC1Uc2Hk5PEFHYZfz1GJttq8HRCqoFTFxkqX/wDGUgDh3eZpdKzHr3GKpZa+5cZiHZhiKMiXnUSAIHOJUX/0gGl5hZzD/eWrFQzJdMTDXD9ykeP6h9DONoruOoBKrGWIlAcnJPOKnyQwO4DtfExZ3LFVEqV9SoS4lhvxMBWpha5dTtYSoHJKjC1VRMxPwCQs21PIyiFaCr7jaqZrG4RRpRjrkeSL1Hgqc2raEnKwHlSVK327XHvV8IpjLnEUUfhFa32lP/WZLSIUpWUboiy3zGqVcoRFuRS1KrQXAlujzFmBQw5lW5ElHEAyPF+WKgFlo8QjQ3Qw3KXg0ll2j8KfaVAW0xWZjYXmJ4iNWlcFEPimIPa2K/czL5yXzUM2/byjC2eEs3HMR5UQRhqrf+pcAi2b+YkYvitsYBEWtnxCSMLPjzANspXFbjoomUmnuG5ZTFpuIWvSJQIWKxVSs2nE/gaTF1Z5eAIBlGcA+tTWIOJlJYCGCXiwn3m537T1KOyVC3MYmYtpgloRerI0VAziHwY64h3cxrLnio1KJupYjjtiBpSiPzFJlatQ4OGa+YXfJxBMjDDGyKxZCL5+Zchu3YmFbGVV9jCr3bAg11CgOdqamqLNFbQSkS83UWmVOopMTNBGWIHG7mI7cDJBvfsxL2DaQYWt4h3a6mvqmwgtW6DiKGUNSiRLW00cxOCGy+5XOiavjxHeGcOcMAKtY4zHYBQ56DuozLLO3qAYcqTjcNeNxKLPkZWJpE98ZUJpLm5cgItLpKm0GMVGbQDw3Mha8oFMEcFpQPEYmwJXEtA2UGskYPLKsFV2HEVIg4p5l/oMPuLFxUwsoyUhTBw/wGriHGP2mJTRgHj6jmB4UVmIx1cYxniIGStfuRl9KMdI3XKi8O4AaVlqGElJnMepmMre43O5euDooirdRERUezWIWBbXMNiVlN4exzV6mL8YdPUAawtQmDhu4xouAlOTdMyaTI8e5fB5+z8kw4KZq7zcvQyxT6Myl2SsDzKRSTkTXqZtu9YRMPUONC4uIUDp6Y9r5x4jOk03UwRQ4SEZp4IDFqtVGtVYohankmaZ4CMC4svMQhbt1mOIxsDrtAgBgkxXcJbttqDTip+QuW2DRZQKV4jJml+YOIC36l2sAX3FQtGvkh0RStg1iKnSzfVXiKuWWglTgY6UVUuhwyN3FaUbXlYhLNt4qFUYN8rKRaksGPW1iDb4WBWDhTmNGQhjTcNn3QUQc/70mBMOT7wRsCaPo6ituJ47lGMTTpnOrcYZuLPjiUBZszA3QXCG7tMRVLoQJhh1CzM9k0D3Kpi1EvkLjC64pyi8sVs3e4igbvCUgupruGxJjHFdQCKQqeZeqCa8kTrvFvuHCDZqJZkN23LAMAO/iW8btBXANEZFrNwb8bneCr8/ctFUMG0p9+tbiyudcKICpV7XiHVGEHxLsXdYYZ/3RJhGQ4ZSOZzcWrl0wT5CXibTMU2gPENDXvEx4WwmvxDWtDFf1MnULBQ/iXrAOYKNZAYDicV3LXDzn1DiK078uJjKK+Y0MMz0TMQwkKJxQ6RZicFPmGgFA4agEUM1BRqyxfUVKW0teKhc3/AmRhsfM2YRbTALcGoaQ1o7gFBSuQYW4W7hsvMppuG8/wCXMS/9PMclnK+KgoEGj6Om9QWqOfiKkV9wOlUGLi2DUqpSsnlzMAVj3GciVriaZEXRbjVZj3GG1x1EXpLnRKltXMMGx5q5vMfmWziG4K+hKAiqVUto1RmES4AcW9y1g5vIuE9GqavGCGeW+vEXSJt5QV2lsheoe2hva8TWwMDnEG9fyBuZSxytxqjzKhgNrYRbAEcSjMUR3A3HcfGFYOT5hl4vjmZaSsodfOZbqq9wO+FMsFHlcdqxdioQsLqtxKEG8G5WGig694FAZzTUNHiQjLLNOLhAIXdTfKEKGmNY5ltRGVXmWphahMVNIkolFQrYUsGq3AFgFg8mM3YAK40lUgvkwG4OGdQts7vhjUtYKeEcMqq2JLs3AeoKtZZTcN4IsTMaEK05KiG427Jlf8IlS1BlmkMIzxwS7HcotIBcbGmYguVZ5HcpZlmbIYrMYhswbA6mzal2TUNL2iZlIxdA8RSxxWyO4EGXYIAPPXUesb8amiYhY4lFbpRXcGDg6tzPFy4KTDXKvbEm2Whs9wF+ocxbJTEFEdg5SGiByC34l2mnZcNbwt14gCtD8wQgFkhuSpm3EOA9wNygqnCMEQZs5GLfEBTK5pyxBiXS8+pkD+yKGWubh2XMygbjQ6qAoVC5leB29w/5cykCk1RqUAclx0Dic/EB9LSL5Hju1M90WuX2DDD2Q8WKBfUtWFHQBFDyi7+IqFoqLHPUIWLFg2rUMoLqCcPzvki1b+i5iLO1aaPcBWCRRQzDczCoLEAwbmMEWEwMa+F0t5XiZAAbJ3FVef4WALu0ZqmQfn6MoJyo61TQ/EPoBncpsUVpe0BxWEmAKeWqtmRoaCKBf5l6bzDviapqO+VhxMwCPEwppAu0AcRjD8RAVd9xNo+Jc3Lqm2kx9byJwdxSMLSrO4NAGF4qECcYvuUjOoz4vPU6ZvlG0O63FUricn4lRbQLBzFEGMQqFOoFbNnIQo6yNxXY9o9lIEeasqVzBK1Le4rZNxMJawRrgwxARM3cJYZgydTb4iLQROtxQFazvtCCbtSzRio+YW2EeW4gBty9MKpVc9KiQc0F0ySy/g25mPBjxcyglaXdfEr0bCrmAbKBYv3muXCOSBoE0Qwb0sMsijjzAYjV6BOiqGuo8P4RtF2EciHH6Op+GxjoCFt/Siq4hmlyNC9x6WNixCVbVIJ8AGNLUcyrDKzZELszKDZCDxMQQSdIgtsOJuVHUQa57gVDbWJkwFrVfeYAZbXCs+0dIw54gtVxLar6XTia8zDiU5dAQhWMwH9wsSL4Y5oqEFZiiayMpErfUVUA2PmPito86lsPqRGdgUiizDDRGGUbnBFziCodw6ysZlZuo0riFhxYkSBYVHQdEUGrZWKzPglbgDestzfDUPlm4FCvTLwODWVSwCEAquYZjVPd/MPqT4rQweVizN+4ZEcBCZOZa+WMAOp3bUPbDo/pGdmQt3Vcxl3BA5gNqGYlAK0XqNQHISipquDmZD+Fg/YfiHiZVOYwX65UWxLYCSwEfq7gvMS0jiRlHEDpMCVUaLPcAxDmWtxfcvywRkVx6c9y3AwxsCqnDZUJXo2iIMC8PZEey56fpMS/rZKcvlAOjM3EHqo1sEq1UV0uItVnxLzWGUMwMpUq/to3UGSbNIMEo8RlQto2QZRaDmzE7Yz7+gspwwFckxiBCoQ7hKsookOh7VAihOpdUA8S4YFSHe5WmdC55icq/vIY6BDMCZRuMtgINkIJWGNDLDQVixCILK2oewOb3c3GtseeJnWjNhluJUMKVxM1Gh2bmIq0Ha5mThc4gyrfArnuZgYGqgGVAy9QGKnc/dfn+CBG9QzuSDf0/ChC5Vc5gVL4xeYNy/tDOZxG5CFIzngBG429bdYYrQJHAkP09/R5qVIR39FKqWp7li6NHx/jr/ColY3LE6FtDwaj2aeyCpY8HREUWqLcnErc7WphZqekdtCtX1HEEBVL40HMZ+oR47IVv4NHEsRjjVRMWHDLagFXA3gP5irYPiKw2youDiYGlg+JZEUjfdx6C1/YSte0x3xAFFhB9piQUuL1ibaY0Dt1Kd0IWbA1MPmt+pZBJXLkyitjAPNR7NwBYPMGpco5GICgwvGalqjiCu5XkunxY6r2IDM2MwOULlCC5F0wDKsmL/zr/VuUsdfUD2ggYU4wcNl7IFVPABf0fZakzz+Ij6A0S7McwQUIrfiMNHdZlrKQSIViCnM2mXzfPEpQFoHxAGymGbF0R21qENadxosLI6+pt7jMIGqg/mjVymUq+oF5bJTCtucnVQBgV7BgYLBbqJfFx59YZAB+SnI6gXTNV5lo8QGhs5uP+r4TysxTlL7ZbFUWjMcy/KFN4u4K4NrWOZakCy5cAUG/MMxSUkEbAUeGoKHH7CDSrblgKGSFjYwoiAsp4Ry7DA67hNaVdOIZjtRlzNxZPhEdlT7R0iU3kiAltSYsRoHM3xACGJWL5jw3cKWoWR1a5iKPFXApf4LHZ9Rv7iWx3xUb+YODtczUYFWz+I4oYZesx37AHx9LzB8taqUImp4B8SokuU+g0wsVDLUdcTGWYll1wwQStD6gn6C8hw7iDmGx4juVSSu9PUvUrmCJmS5IqA9kbD3K0atHoXFbwRbhNUwV9GKcwG1fcikrJFcBM3CwB3LyKEcbr4zOlvLsIGSgyAdS+3WMbGLkTi7IXiEUWb1uOH3KNSgqhWogbawWS9wLghhBAUEKKrvMx6gW4gH5nHFn7JVAlo2ZuEyEeEdTP+g2zr1Ca8qoV3FNAOBuOnjdLiWpvZNQ6VsZVuCkqwKriIiBFBWpYpEX5S2DPJiaVm0mYYeZQGhTogR9qqVGjxiH+HP8BrxLDYQ3t0+qJZBbbGmLIEwZxqFUC8z6gV4VcqDyyPtAit4OALMZbgBMwUVsp8S8HYtihUF8E0M+pv6BjbF8xBKWMxMkdhLvDmJWU0ujyMQ9hYY5WOpZ3XuqGFF2NzJzKHbKZF2+EuOkVANg3CgDGSO4XnECMBLBqNSCZxCbwkrpBrDmu6lQCfIgFumn7S0iPyywIEUrH+oz1bM/eoGVjHctBYOeR7loVkGH4Ju2GVyCjTUaWDgaQG4gWA3MmGeJcnNPxmGPoSSxo7KcQzFcU8ZZWrQc+rSlZd4crR55lytvAh8Y7w7hwlXbfATGstQnUaLvZlQe2tPEsbAMLZPNk3FOmUFUQ7SyzULDhDuC0Lj8zSFt83Bapa8Tl9XUOIuqhr/YzmBUY6YQ1iTNtbUPLHx2S4S3aZ/pnMR4FxfriX8XeX8QKjOkjez81uNFSUModktoTJgwRHNRmcAKyNCoNRM4gVm8VgLl55HmIVhEA6lcwWFiwjzC7y38dCS4YbGgfMLVtooQ6CgqK9RTnlseWVtOGyPMduHQHiNQqUBo8SmJCwyfETBYcWYST2ZNYJCbdnCTShwnCwFth6Sh0qdl7i3scmV7uZ4hLi6xBqu1eml8sOdjLagcqvV+JSVV4sBFgS0pB5Fcvxs8TSDCMpvcIHqgfdwu3r6Kzk9AW4waUWNbiUYjJ9oKhmQvLqL0iQgaG5UpFKL7jLCsbA1DVNV1g0RtNllzKEUcVCQ0+YARqpUKWLRiHZKFNSidxA3GUBiJd2Yz7gz5N0zK/wCEb+i1vUQtEuDQLGDNFQVsDfyiqLacyigxolFvBztrH5i1HeCDpKkTZMXxcKW9wUO4eTTGKqraaN7uJxETeIwgxMAYuZsadxtlTr5JhC1u4AUF3dk+7Ujikelh9QahJYFeYLRl6VrfmGDl0FeX4mADg7vLBGoM2ViDtTHZi4aW8agmFrhvcwJW5ZLI5gmwg1cw6PxI4cxAAPTuUpnhbXeeMQ8jl6MDOWK6OyWReJkNHgUX4hNLGhVQAFSvzFZoVLCEzMgbzDOdtRLXUfY+t7n32VABXaLOfMRwUYDnKMOhZFhSIKcNVWWMEQpdxVysxOObhkEtpc5YSiuci3Cqr0dFy8CxgfEJp7IBcmICajheyYh3DZNysJqEDF0QlwvM1/m6/wBZv6CYJrvbKF04qs3v6JHnSifKH9xKCqrLpUxWYK4T3QX+JQ0Ve0WfR1mAsRG5zBYfEFqyqmIIfqGiNXE5minqKrVTMVbJY4KTmXWN3xOCAi9WxxWWxG7KOhWWAK6CW8mFT38yuJJnitO8wBLGxcXVRTZ0RjFxNVHHDeYIi5l6jbAVPbLGichuCz/cKrTFVAqJNHNdxB0zfixIi52Ttr3E2gOZY43LUamCGGbgzAUYNhonUe1aMNVgQrtkyfMaEGKuWgZIdXDiCownR5RY5TkTpgouQnylBIvgRiX+yTMtJrxGrWObhTLBs6CE7LtlZRaBeahDGcQUjuBUcxB2XEwcZYa+iWTFJzDz/Fp19HBcNK0Iekf6jhkSnxEC1OKiWNjhRAH+BFYrPP0Syu4QQArjlaE/M4I8RBOXmXstk2Fw5vqOSIbhMPaCLBfaC+Cdsqi1yoS0gpkYy7wvlS1niLUFAjziKsIMrNYzGcLYtBUOl9wiwDjxDwJlJyxgmrwHUNDaVrEp180ZThJxueFviLLBd2MFQLRxZ57lijA0PEdqFtPEMBaacmEwLr9JYE0KgKbNjmLmjwLqLXuMUwBGfxwilFWJW965goK6hn1VfJqXtbvG4oa1Y+RIa/U61qEX4HAG4jpHhlFBauOJbwAQLXollP8A4S6Z+IBeNH+FfyyOoZluDw4iIUmks6E3Mpp4S/qN3r3xfjcBgGAODqB8/Ssk9xEWIdKIVRtgQircArtCLV6EYg4d+JZbkKtcKg7jLNWA9Q24o01uOyg0FmNw2rzHBZbqZE4j2O0QA87IV4EbbOa4FNytUYl7gyy2nUACVDTKxatN9+YJEMBT/cvDB4vSBiIF/tzD5LPm3JcBKvkfhiiwXDeIuCsrdsZXo1LqaNBBtDeoswYMW5jlryVlac5oQHWmFAFRUDQv3eIsU1XCQpJXtLUjk9LG8GJTacQBIXww7L9mAbb8QJdZgKK4KgUlFSqcf/hVMG3U1BsApKcADj/EZv6Y1y7JUqs2olNMrZX2lUgZ0h18hh1ELo9krVAzVQmVW89R5UK5RNMZqA2ushAy8vMj4JjEKDeb31BNoa6y0wrRP6hIXa4CuPmK5+N6fLxKDemreHHcyj0f/FI7P00DwRr63VYqWXxYR0FTAGkFGisjbiB3GrcHKR8lK20QMFd43FlIcx2LRthFnfEuNeZMuAavUrWbTox9WH4vyjUr2mZSmFO8VOtIShq4IRSxgMwP9SkwUCV/+Klx/wAklUBZ9kLxxDPZbjEW4aCxTc6TWplHpiwX1Zag25lsDtXxDBBbocJwRbLgI16AqMonpFLaspVxBjGJQl++4bBLUFuoWUEbJYDZdjE3AJHVwRFUB5hYpEC26cQBRK+qfaNZPdGDtILS20t28SmNoXUDbJluOxERhBDYzGh8sfeF0HCBKBWBEF4NxOqIA4GDRjM+eYa+p5ZL4gUHSwVyNkq+lfyf/9k=
\.


--
-- TOC entry 3397 (class 0 OID 16455)
-- Dependencies: 224
-- Data for Name: used_materials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.used_materials (id, tattoo_id, material_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	1	5
6	1	6
7	1	7
8	1	8
9	1	2
10	1	4
\.


--
-- TOC entry 3391 (class 0 OID 16410)
-- Dependencies: 218
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, password, role_id) FROM stdin;
2	Stepan	kup@mail.ru	3fc0a7acf087f549ac2b266baf94b8b1	1
3	Мастер	master@mail.ru	3fc0a7acf087f549ac2b266baf94b8b1	2
4	Мастер 2	master1@mail.ru	3fc0a7acf087f549ac2b266baf94b8b1	2
\.


--
-- TOC entry 3399 (class 0 OID 16472)
-- Dependencies: 226
-- Data for Name: work_shedules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.work_shedules (id, user_id, working_time) FROM stdin;
2	3	2025-01-11 15:00:00
3	3	2025-01-11 16:00:00
1	3	2024-01-10 14:00:00
4	4	2025-01-12 16:00:00
5	4	2025-01-14 14:00:00
\.


--
-- TOC entry 3416 (class 0 OID 0)
-- Dependencies: 227
-- Name: appointments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.appointments_id_seq', 3, true);


--
-- TOC entry 3417 (class 0 OID 0)
-- Dependencies: 219
-- Name: materials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.materials_id_seq', 8, true);


--
-- TOC entry 3418 (class 0 OID 0)
-- Dependencies: 214
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 1, true);


--
-- TOC entry 3419 (class 0 OID 0)
-- Dependencies: 221
-- Name: tattoos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tattoos_id_seq', 1, true);


--
-- TOC entry 3420 (class 0 OID 0)
-- Dependencies: 223
-- Name: used_materials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.used_materials_id_seq', 10, true);


--
-- TOC entry 3421 (class 0 OID 0)
-- Dependencies: 216
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 4, true);


--
-- TOC entry 3422 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_role_id_seq', 1, false);


--
-- TOC entry 3423 (class 0 OID 0)
-- Dependencies: 225
-- Name: work_shedules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.work_shedules_id_seq', 1, true);


--
-- TOC entry 3234 (class 2606 OID 16489)
-- Name: appointments appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_pkey PRIMARY KEY (id);


--
-- TOC entry 3226 (class 2606 OID 16437)
-- Name: materials materials_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials
    ADD CONSTRAINT materials_pkey PRIMARY KEY (id);


--
-- TOC entry 3222 (class 2606 OID 16407)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 3228 (class 2606 OID 16446)
-- Name: tattoos tattoos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tattoos
    ADD CONSTRAINT tattoos_pkey PRIMARY KEY (id);


--
-- TOC entry 3230 (class 2606 OID 16460)
-- Name: used_materials used_materials_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.used_materials
    ADD CONSTRAINT used_materials_pkey PRIMARY KEY (id);


--
-- TOC entry 3224 (class 2606 OID 16418)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3232 (class 2606 OID 16477)
-- Name: work_shedules work_shedules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_shedules
    ADD CONSTRAINT work_shedules_pkey PRIMARY KEY (id);


--
-- TOC entry 3243 (class 2620 OID 16515)
-- Name: appointments set_default_status; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER set_default_status BEFORE INSERT ON public.appointments FOR EACH ROW EXECUTE FUNCTION public.assign_status_appointments();


--
-- TOC entry 3242 (class 2620 OID 16513)
-- Name: users set_role_id; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER set_role_id BEFORE INSERT ON public.users FOR EACH ROW EXECUTE FUNCTION public.assign_role_id();


--
-- TOC entry 3239 (class 2606 OID 16495)
-- Name: appointments appointments_tattoo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_tattoo_id_fkey FOREIGN KEY (tattoo_id) REFERENCES public.tattoos(id);


--
-- TOC entry 3240 (class 2606 OID 16490)
-- Name: appointments appointments_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3241 (class 2606 OID 16500)
-- Name: appointments appointments_work_shedule_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_work_shedule_id_fkey FOREIGN KEY (work_shedule_id) REFERENCES public.work_shedules(id);


--
-- TOC entry 3236 (class 2606 OID 16466)
-- Name: used_materials used_materials_material_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.used_materials
    ADD CONSTRAINT used_materials_material_id_fkey FOREIGN KEY (material_id) REFERENCES public.materials(id);


--
-- TOC entry 3237 (class 2606 OID 16461)
-- Name: used_materials used_materials_tattoo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.used_materials
    ADD CONSTRAINT used_materials_tattoo_id_fkey FOREIGN KEY (tattoo_id) REFERENCES public.tattoos(id);


--
-- TOC entry 3235 (class 2606 OID 16419)
-- Name: users users_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- TOC entry 3238 (class 2606 OID 16478)
-- Name: work_shedules work_shedules_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_shedules
    ADD CONSTRAINT work_shedules_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


-- Completed on 2025-01-10 03:31:03

--
-- PostgreSQL database dump complete
--

-- Completed on 2025-01-10 03:31:03

--
-- PostgreSQL database cluster dump complete
--

