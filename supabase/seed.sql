SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.6
-- Dumped by pg_dump version 15.7 (Ubuntu 15.7-1.pgdg20.04+1)

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
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: key; Type: TABLE DATA; Schema: pgsodium; Owner: supabase_admin
--



--
-- Data for Name: organizations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."organizations" ("id", "created_at", "name") VALUES
	('8392f809-ed88-472b-9572-62fc8b4a6092', '2024-11-12 05:04:37.768436+00', 'Organization A'),
	('dcd3a42d-8808-4063-ad64-5a433a5ec214', '2024-11-12 05:04:37.768436+00', 'Organization B');


--
-- Data for Name: branches; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."branches" ("id", "created_at", "organization_id", "name", "places_id") VALUES
	('2cf52926-d0b3-4c17-9906-298f59b940a6', '2024-11-12 05:04:37.768436+00', '8392f809-ed88-472b-9572-62fc8b4a6092', 'Branch 1', NULL),
	('6459cb87-939e-4dec-862b-0cb7cf8adcda', '2024-11-12 05:04:37.768436+00', 'dcd3a42d-8808-4063-ad64-5a433a5ec214', 'Branch 2', NULL);


--
-- Data for Name: ads; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."ads" ("id", "created_at", "name", "media_id", "provider", "branch_id") VALUES
	('86b770e9-ee13-4342-a3ce-283b6d28bf4e', '2024-11-12 05:04:37.768436+00', 'Ad 1', 'media_101', 'youtube', '2cf52926-d0b3-4c17-9906-298f59b940a6'),
	('5ce2d861-934f-44aa-926c-a5338b600578', '2024-11-12 05:04:37.768436+00', 'Ad 2', 'media_102', 'youtube', '6459cb87-939e-4dec-862b-0cb7cf8adcda');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."users" ("id", "organization_id", "created_at", "name", "email") VALUES
	('365d2c99-02a9-464f-afe7-8d413957ecd3', '8392f809-ed88-472b-9572-62fc8b4a6092', '2024-11-12 05:04:37.768436+00', 'John Doe', 'john.doe@example.com'),
	('3de32793-5341-4b69-8dbf-d74be268328d', 'dcd3a42d-8808-4063-ad64-5a433a5ec214', '2024-11-12 05:04:37.768436+00', 'Jane Smith', 'jane.smith@example.com');


--
-- Data for Name: contents; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."contents" ("id", "created_at", "media_id", "provider", "user_id") VALUES
	('26187538-3456-4c3a-8ff5-95eaf61caf49', '2024-11-12 05:04:37.768436+00', 'media_001', 'youtube', '365d2c99-02a9-464f-afe7-8d413957ecd3'),
	('e0fe55cd-c18d-4adc-b058-442c6d90d5e0', '2024-11-12 05:04:37.768436+00', 'media_002', 'youtube', '3de32793-5341-4b69-8dbf-d74be268328d');


--
-- Data for Name: lists; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."lists" ("created_at", "name", "content", "id") VALUES
	('2024-11-12 05:04:37.768436+00', 'List 1', '{"Item 1","Item 2","Item 3"}', '9c4ff48d-c040-4eb9-a850-111176f015b6'),
	('2024-11-12 05:04:37.768436+00', 'List 2', '{"Task A","Task B"}', '3d9ad1f9-a1f7-4ef6-87fb-8b3f585a5b68');


--
-- Data for Name: devices; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."devices" ("id", "created_at", "name", "android_id", "branch_id", "list_id", "status") VALUES
	('bace098a-3221-47b5-828f-5e33bc7d2e99', '2024-11-12 05:04:37.768436+00', 'Device 1', 'android_001', '2cf52926-d0b3-4c17-9906-298f59b940a6', '9c4ff48d-c040-4eb9-a850-111176f015b6', 'initialized'),
	('00d0155f-b38e-435c-b999-f320559f8700', '2024-11-12 05:04:37.768436+00', 'Device 2', 'android_002', '6459cb87-939e-4dec-862b-0cb7cf8adcda', '3d9ad1f9-a1f7-4ef6-87fb-8b3f585a5b68', 'initialized');


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--



--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('"auth"."refresh_tokens_id_seq"', 1, false);


--
-- Name: key_key_id_seq; Type: SEQUENCE SET; Schema: pgsodium; Owner: supabase_admin
--

SELECT pg_catalog.setval('"pgsodium"."key_key_id_seq"', 1, false);


--
-- PostgreSQL database dump complete
--

RESET ALL;
