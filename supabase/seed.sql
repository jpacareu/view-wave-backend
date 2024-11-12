SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Ubuntu 15.1-1.pgdg20.04+1)
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

INSERT INTO "auth"."audit_log_entries" ("instance_id", "id", "payload", "created_at", "ip_address") VALUES
	('00000000-0000-0000-0000-000000000000', 'b760e9aa-b3ba-4096-98bc-3047094bceef', '{"action":"user_signedup","actor_id":"7f9950f7-7c0b-46b7-b247-b2e293e3866f","actor_username":"javierpacareu@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}', '2024-10-13 05:30:27.252235+00', ''),
	('00000000-0000-0000-0000-000000000000', '9de641d7-0b56-447f-bdaa-e85e65b35454', '{"action":"login","actor_id":"7f9950f7-7c0b-46b7-b247-b2e293e3866f","actor_username":"javierpacareu@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-10-13 05:30:27.254585+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c9c68d9c-8fbe-4c3a-9775-eaa492517320', '{"action":"login","actor_id":"7f9950f7-7c0b-46b7-b247-b2e293e3866f","actor_username":"javierpacareu@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-10-13 05:30:27.325588+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a0e62710-1290-437e-84e1-d0741a747ae9', '{"action":"logout","actor_id":"7f9950f7-7c0b-46b7-b247-b2e293e3866f","actor_username":"javierpacareu@gmail.com","actor_via_sso":false,"log_type":"account"}', '2024-10-13 05:31:41.328815+00', '');


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."users" ("instance_id", "id", "aud", "role", "email", "encrypted_password", "email_confirmed_at", "invited_at", "confirmation_token", "confirmation_sent_at", "recovery_token", "recovery_sent_at", "email_change_token_new", "email_change", "email_change_sent_at", "last_sign_in_at", "raw_app_meta_data", "raw_user_meta_data", "is_super_admin", "created_at", "updated_at", "phone", "phone_confirmed_at", "phone_change", "phone_change_token", "phone_change_sent_at", "email_change_token_current", "email_change_confirm_status", "banned_until", "reauthentication_token", "reauthentication_sent_at", "is_sso_user", "deleted_at", "is_anonymous") VALUES
	('00000000-0000-0000-0000-000000000000', '7f9950f7-7c0b-46b7-b247-b2e293e3866f', 'authenticated', 'authenticated', 'javierpacareu@gmail.com', '$2a$10$4UlQBB3lMF2k85Xzl2w4culRCsxsTdSiadpXloV23G.Bi9AY/ZDYK', '2024-10-13 05:30:27.253025+00', NULL, '', NULL, '', NULL, '', '', NULL, '2024-10-13 05:30:27.326016+00', '{"provider": "email", "providers": ["email"]}', '{"sub": "7f9950f7-7c0b-46b7-b247-b2e293e3866f", "email": "javierpacareu@gmail.com", "last_name": "Pacareu", "first_name": "Javier", "email_verified": false, "phone_verified": false}', NULL, '2024-10-13 05:30:27.242277+00', '2024-10-13 05:30:27.327291+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false);


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."identities" ("provider_id", "user_id", "identity_data", "provider", "last_sign_in_at", "created_at", "updated_at", "id") VALUES
	('7f9950f7-7c0b-46b7-b247-b2e293e3866f', '7f9950f7-7c0b-46b7-b247-b2e293e3866f', '{"sub": "7f9950f7-7c0b-46b7-b247-b2e293e3866f", "email": "javierpacareu@gmail.com", "last_name": "Pacareu", "first_name": "Javier", "email_verified": false, "phone_verified": false}', 'email', '2024-10-13 05:30:27.250143+00', '2024-10-13 05:30:27.250158+00', '2024-10-13 05:30:27.250158+00', '31026060-4e57-4ad8-a333-0767c7f2c7cf');


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
-- Data for Name: sales; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."sales" ("id", "first_name", "last_name", "email", "administrator", "user_id", "avatar", "disabled") VALUES
	(1, 'Javier', 'Pacareu', 'javierpacareu@gmail.com', true, '7f9950f7-7c0b-46b7-b247-b2e293e3866f', NULL, false);


--
-- Data for Name: companies; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."contacts" ("id", "first_name", "last_name", "gender", "title", "email", "phone_1_number", "phone_1_type", "phone_2_number", "phone_2_type", "background", "avatar", "first_seen", "last_seen", "has_newsletter", "status", "tags", "company_id", "sales_id", "linkedin_url") VALUES
	(1, 'Javier', 'Pacareu', 'male', 'Partner', 'javierpacareu@gmail.com', '973363663', 'Work', NULL, 'Work', NULL, '{}', '2024-10-13 05:31:12.958+00', '2024-10-13 05:31:17.146+00', false, 'warm', '{}', NULL, 1, NULL);


--
-- Data for Name: contactNotes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."contactNotes" ("id", "contact_id", "text", "date", "sales_id", "status", "attachments") VALUES
	(1, 1, 'Test', '2024-10-13 05:31:00+00', 1, 'warm', NULL);


--
-- Data for Name: deals; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: dealNotes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

INSERT INTO "storage"."buckets" ("id", "name", "owner", "created_at", "updated_at", "public", "avif_autodetection", "file_size_limit", "allowed_mime_types", "owner_id") VALUES
	('attachments', 'attachments', NULL, '2024-10-13 05:10:25.034252+00', '2024-10-13 05:10:25.034252+00', true, false, NULL, NULL, NULL);


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
-- Data for Name: hooks; Type: TABLE DATA; Schema: supabase_functions; Owner: supabase_functions_admin
--



--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--



--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('"auth"."refresh_tokens_id_seq"', 2, true);


--
-- Name: key_key_id_seq; Type: SEQUENCE SET; Schema: pgsodium; Owner: supabase_admin
--

SELECT pg_catalog.setval('"pgsodium"."key_key_id_seq"', 1, false);


--
-- Name: companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."companies_id_seq"', 1, false);


--
-- Name: contactNotes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."contactNotes_id_seq"', 1, true);


--
-- Name: contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."contacts_id_seq"', 1, true);


--
-- Name: dealNotes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."dealNotes_id_seq"', 1, false);


--
-- Name: deals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."deals_id_seq"', 1, false);


--
-- Name: sales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."sales_id_seq"', 1, true);


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."tags_id_seq"', 1, false);


--
-- Name: tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."tasks_id_seq"', 1, false);


--
-- Name: hooks_id_seq; Type: SEQUENCE SET; Schema: supabase_functions; Owner: supabase_functions_admin
--

SELECT pg_catalog.setval('"supabase_functions"."hooks_id_seq"', 1, false);


--
-- PostgreSQL database dump complete
--

RESET ALL;
