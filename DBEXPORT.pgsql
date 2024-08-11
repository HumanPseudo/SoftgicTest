--
-- PostgreSQL database dump
--

-- Dumped from database version 12.19 (Debian 12.19-1.pgdg120+1)
-- Dumped by pg_dump version 12.19 (Debian 12.19-1.pgdg120+1)

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
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- Name: coberturas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coberturas (
    "idCobertura" uuid NOT NULL,
    "claveCobertura" character(255) NOT NULL,
    prima integer NOT NULL
);


ALTER TABLE public.coberturas OWNER TO postgres;

--
-- Name: cotizacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cotizacion (
    "idConvenio" uuid NOT NULL,
    "suClave" character(255),
    "suNombre" character(255),
    "distribuidorClave" integer,
    "distribuidorEmail" character(255),
    cotizaciones uuid NOT NULL
);


ALTER TABLE public.cotizacion OWNER TO postgres;

--
-- Name: cotizaciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cotizaciones (
    "idCotizacion" uuid NOT NULL,
    "planComercial" character(255),
    "detSolicitudes" uuid NOT NULL
);


ALTER TABLE public.cotizaciones OWNER TO postgres;

--
-- Name: item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.item (
    description character varying(255),
    title character varying(255) NOT NULL,
    id uuid NOT NULL,
    owner_id uuid NOT NULL
);


ALTER TABLE public.item OWNER TO postgres;

--
-- Name: planes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planes (
    "idPlan" uuid NOT NULL,
    valor character(255) NOT NULL
);


ALTER TABLE public.planes OWNER TO postgres;

--
-- Name: solicitudes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.solicitudes (
    idsolicitudes uuid NOT NULL,
    plan uuid NOT NULL,
    renovacion character(255),
    tipo character(255),
    paquete character(255),
    "fechaNacimiento" character(1),
    "iniVigReportada" character(1),
    "finVigReportada" character(1),
    "plazoReportado" integer,
    "tipoVig" integer,
    "sumAseg4" integer,
    "sumAseg5" integer,
    "sumAseg6" integer,
    "coberturasPrimaNeta" uuid NOT NULL
);


ALTER TABLE public.solicitudes OWNER TO postgres;

--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    email character varying(255) NOT NULL,
    is_active boolean NOT NULL,
    is_superuser boolean NOT NULL,
    full_name character varying(255),
    hashed_password character varying NOT NULL,
    id uuid NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alembic_version (version_num) FROM stdin;
1a31ce608336
\.


--
-- Data for Name: coberturas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coberturas ("idCobertura", "claveCobertura", prima) FROM stdin;
a53f8642-be27-4434-929d-5cb543f84496	a53f8642-be27-4434-929d-5cb543f84496                                                                                                                                                                                                                           	651561615
\.


--
-- Data for Name: cotizacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cotizacion ("idConvenio", "suClave", "suNombre", "distribuidorClave", "distribuidorEmail", cotizaciones) FROM stdin;
a53f8642-be27-4434-929d-5cb543f84496	\N	\N	\N	\N	a53f8642-be27-4434-929d-5cb543f84496
\.


--
-- Data for Name: cotizaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cotizaciones ("idCotizacion", "planComercial", "detSolicitudes") FROM stdin;
a53f8642-be27-4434-929d-5cb543f84496	\N	a53f8642-be27-4434-929d-5cb543f84496
\.


--
-- Data for Name: item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.item (description, title, id, owner_id) FROM stdin;
\.


--
-- Data for Name: planes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.planes ("idPlan", valor) FROM stdin;
a53f8642-be27-4434-929d-5cb543f84496	test                                                                                                                                                                                                                                                           
08f92d73-82c5-4eb4-acb0-a44c8e14d292	test2reer3                                                                                                                                                                                                                                                     
e38704d2-d0c5-4b74-b59e-58f2cb50dbe9	testjajajajajaja                                                                                                                                                                                                                                               
9cc4c111-999b-46b1-a272-950d9d6d1893	sdasfdsffdd                                                                                                                                                                                                                                                    
d08a530c-6ecb-48d4-bbb2-7743b99dbecf	asdasdasd                                                                                                                                                                                                                                                      
f6a024f4-211f-4b60-96fc-3574498ed04b	cxzcxzcxzcxz                                                                                                                                                                                                                                                   
\.


--
-- Data for Name: solicitudes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.solicitudes (idsolicitudes, plan, renovacion, tipo, paquete, "fechaNacimiento", "iniVigReportada", "finVigReportada", "plazoReportado", "tipoVig", "sumAseg4", "sumAseg5", "sumAseg6", "coberturasPrimaNeta") FROM stdin;
a53f8642-be27-4434-929d-5cb543f84496	a53f8642-be27-4434-929d-5cb543f84496	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	a53f8642-be27-4434-929d-5cb543f84496
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (email, is_active, is_superuser, full_name, hashed_password, id) FROM stdin;
admin@example.com	t	t	\N	$2b$12$DtVj7wNxSvLw5tliZBGiNe0zWLa3iHvkGl6MAu2UPDM3iWfwEZ4he	a09e05bc-152a-436a-b22a-46314c40afa3
\.


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: coberturas coberturas_idCobertura; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coberturas
    ADD CONSTRAINT "coberturas_idCobertura" UNIQUE ("idCobertura");


--
-- Name: cotizacion cotizacion_idConvenio; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cotizacion
    ADD CONSTRAINT "cotizacion_idConvenio" PRIMARY KEY ("idConvenio");


--
-- Name: cotizaciones cotizaciones_cotizaciones; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cotizaciones
    ADD CONSTRAINT cotizaciones_cotizaciones UNIQUE ("idCotizacion");


--
-- Name: cotizaciones cotizaciones_detSolicitudes; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cotizaciones
    ADD CONSTRAINT "cotizaciones_detSolicitudes" UNIQUE ("detSolicitudes");


--
-- Name: item item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item
    ADD CONSTRAINT item_pkey PRIMARY KEY (id);


--
-- Name: planes planes_idPlan; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planes
    ADD CONSTRAINT "planes_idPlan" UNIQUE ("idPlan");


--
-- Name: solicitudes solicitudes_coberturasPrimaNeta; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solicitudes
    ADD CONSTRAINT "solicitudes_coberturasPrimaNeta" UNIQUE ("coberturasPrimaNeta");


--
-- Name: solicitudes solicitudes_idsolicitudes; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solicitudes
    ADD CONSTRAINT solicitudes_idsolicitudes UNIQUE (idsolicitudes);


--
-- Name: solicitudes solicitudes_plan; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solicitudes
    ADD CONSTRAINT solicitudes_plan UNIQUE (plan);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: ix_user_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ix_user_email ON public."user" USING btree (email);


--
-- Name: cotizacion cotizacion_cotizaciones_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cotizacion
    ADD CONSTRAINT cotizacion_cotizaciones_fkey FOREIGN KEY (cotizaciones) REFERENCES public.cotizaciones("idCotizacion");


--
-- Name: cotizaciones cotizaciones_detSolicitudes_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cotizaciones
    ADD CONSTRAINT "cotizaciones_detSolicitudes_fkey" FOREIGN KEY ("detSolicitudes") REFERENCES public.solicitudes(idsolicitudes) ON DELETE CASCADE;


--
-- Name: item item_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item
    ADD CONSTRAINT item_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public."user"(id) ON DELETE CASCADE;


--
-- Name: solicitudes solicitudes_coberturasPrimaNeta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solicitudes
    ADD CONSTRAINT "solicitudes_coberturasPrimaNeta_fkey" FOREIGN KEY ("coberturasPrimaNeta") REFERENCES public.coberturas("idCobertura");


--
-- Name: solicitudes solicitudes_plan_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solicitudes
    ADD CONSTRAINT solicitudes_plan_fkey FOREIGN KEY (plan) REFERENCES public.planes("idPlan");


--
-- PostgreSQL database dump complete
--

