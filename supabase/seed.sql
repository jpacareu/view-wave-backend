SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.6
-- Dumped by pg_dump version 15.6

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
	('00000000-0000-0000-0000-000000000000', 'fab3f5ba-20d8-408b-af1e-c2aef3cf2f3e', '{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"javierpacareu@gmail.com","user_id":"5f206c96-c10c-4ac9-a607-3dc55d76ce9f","user_phone":""}}', '2024-11-13 23:53:06.082875+00', ''),
	('00000000-0000-0000-0000-000000000000', '79d7f3d1-0be4-4fc7-bb2a-50acf77957a3', '{"action":"login","actor_id":"5f206c96-c10c-4ac9-a607-3dc55d76ce9f","actor_username":"javierpacareu@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-11-14 03:05:04.43862+00', ''),
	('00000000-0000-0000-0000-000000000000', '9d66a18e-9ffe-4d73-9306-b7067403ca12', '{"action":"token_refreshed","actor_id":"5f206c96-c10c-4ac9-a607-3dc55d76ce9f","actor_username":"javierpacareu@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-14 23:25:48.168334+00', ''),
	('00000000-0000-0000-0000-000000000000', '86814b07-cde8-4d78-9891-a4babbcb08dc', '{"action":"token_revoked","actor_id":"5f206c96-c10c-4ac9-a607-3dc55d76ce9f","actor_username":"javierpacareu@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-14 23:25:48.174241+00', ''),
	('00000000-0000-0000-0000-000000000000', '9b2300b1-b93f-48f9-a6a3-9591c8d472ec', '{"action":"login","actor_id":"5f206c96-c10c-4ac9-a607-3dc55d76ce9f","actor_username":"javierpacareu@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-11-14 23:28:28.507337+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bbec977d-1d60-4881-9c46-5902a62d890b', '{"action":"token_refreshed","actor_id":"5f206c96-c10c-4ac9-a607-3dc55d76ce9f","actor_username":"javierpacareu@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-15 04:23:29.985365+00', ''),
	('00000000-0000-0000-0000-000000000000', '0c22b2f9-5205-49bb-ad27-ec298dd2ef1b', '{"action":"token_revoked","actor_id":"5f206c96-c10c-4ac9-a607-3dc55d76ce9f","actor_username":"javierpacareu@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-15 04:23:30.007478+00', ''),
	('00000000-0000-0000-0000-000000000000', '6f65483a-7e4f-45bc-b50d-388337781fca', '{"action":"token_refreshed","actor_id":"5f206c96-c10c-4ac9-a607-3dc55d76ce9f","actor_username":"javierpacareu@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-15 06:17:54.877106+00', ''),
	('00000000-0000-0000-0000-000000000000', '36180e98-7147-4348-b9c2-6edae2dc2f9e', '{"action":"token_revoked","actor_id":"5f206c96-c10c-4ac9-a607-3dc55d76ce9f","actor_username":"javierpacareu@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-15 06:17:54.884458+00', ''),
	('00000000-0000-0000-0000-000000000000', '30415a29-188b-4c1c-90a8-96fe13d537c2', '{"action":"token_refreshed","actor_id":"5f206c96-c10c-4ac9-a607-3dc55d76ce9f","actor_username":"javierpacareu@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-15 21:33:57.323402+00', ''),
	('00000000-0000-0000-0000-000000000000', '7a528c62-0b78-4307-bcf6-bfa5d8468c50', '{"action":"token_revoked","actor_id":"5f206c96-c10c-4ac9-a607-3dc55d76ce9f","actor_username":"javierpacareu@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-15 21:33:57.349982+00', ''),
	('00000000-0000-0000-0000-000000000000', '06b39c2f-82b1-4a14-a89a-cd4507537006', '{"action":"token_refreshed","actor_id":"5f206c96-c10c-4ac9-a607-3dc55d76ce9f","actor_username":"javierpacareu@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-16 22:53:10.848372+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f06b1a28-e6b6-4d15-85de-38bc82509da5', '{"action":"token_revoked","actor_id":"5f206c96-c10c-4ac9-a607-3dc55d76ce9f","actor_username":"javierpacareu@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-16 22:53:10.85782+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd595f859-45fa-4c76-b72d-37381d0eea1d', '{"action":"user_signedup","actor_id":"053ea79d-8b73-471a-8ec8-462990b64815","actor_name":"Orelvis Lago","actor_username":"orelvisdev@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"google"}}', '2024-11-18 17:26:39.637616+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ca65e3d6-9af4-4ac0-bbf6-7364c65141fa', '{"action":"login","actor_id":"053ea79d-8b73-471a-8ec8-462990b64815","actor_name":"Orelvis Lago","actor_username":"orelvisdev@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-11-18 17:29:02.667077+00', ''),
	('00000000-0000-0000-0000-000000000000', 'aceebf68-79a7-4861-9cdc-c5ec486a6320', '{"action":"token_refreshed","actor_id":"053ea79d-8b73-471a-8ec8-462990b64815","actor_name":"Orelvis Lago","actor_username":"orelvisdev@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-18 20:46:28.920724+00', ''),
	('00000000-0000-0000-0000-000000000000', '8c5a0032-479d-4239-ae99-a0ec395a9420', '{"action":"token_revoked","actor_id":"053ea79d-8b73-471a-8ec8-462990b64815","actor_name":"Orelvis Lago","actor_username":"orelvisdev@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-18 20:46:28.92469+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd232f269-330c-4f9e-87bf-a73bfc406cff', '{"action":"token_refreshed","actor_id":"053ea79d-8b73-471a-8ec8-462990b64815","actor_name":"Orelvis Lago","actor_username":"orelvisdev@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-18 20:46:28.94968+00', ''),
	('00000000-0000-0000-0000-000000000000', '13742cb8-0f6a-4d33-8399-d069e2833cb1', '{"action":"token_refreshed","actor_id":"053ea79d-8b73-471a-8ec8-462990b64815","actor_name":"Orelvis Lago","actor_username":"orelvisdev@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-18 21:34:30.155044+00', ''),
	('00000000-0000-0000-0000-000000000000', '10a213e5-5665-4dea-a45b-96fb100f55ce', '{"action":"token_revoked","actor_id":"053ea79d-8b73-471a-8ec8-462990b64815","actor_name":"Orelvis Lago","actor_username":"orelvisdev@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-18 21:34:30.155993+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f71a8dd0-5762-4d11-8033-21a89c87bdea', '{"action":"logout","actor_id":"053ea79d-8b73-471a-8ec8-462990b64815","actor_name":"Orelvis Lago","actor_username":"orelvisdev@gmail.com","actor_via_sso":false,"log_type":"account"}', '2024-11-18 21:34:51.037506+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b442317b-ad07-4c54-9909-3733bf42365e', '{"action":"token_refreshed","actor_id":"5f206c96-c10c-4ac9-a607-3dc55d76ce9f","actor_username":"javierpacareu@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-19 23:23:43.463658+00', ''),
	('00000000-0000-0000-0000-000000000000', '010ad153-1ab6-4866-bfce-2789e9cf815d', '{"action":"token_revoked","actor_id":"5f206c96-c10c-4ac9-a607-3dc55d76ce9f","actor_username":"javierpacareu@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-19 23:23:43.474597+00', ''),
	('00000000-0000-0000-0000-000000000000', '08357e56-fc88-471b-aef8-7b8cbf0d0a2d', '{"action":"login","actor_id":"5f206c96-c10c-4ac9-a607-3dc55d76ce9f","actor_username":"javierpacareu@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-11-19 23:23:55.399127+00', ''),
	('00000000-0000-0000-0000-000000000000', '938c3bbf-9063-48e8-a3cb-b6a96fef1a1e', '{"action":"token_refreshed","actor_id":"5f206c96-c10c-4ac9-a607-3dc55d76ce9f","actor_username":"javierpacareu@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-20 05:44:49.771292+00', ''),
	('00000000-0000-0000-0000-000000000000', '7c4b928c-3bbf-4e26-b3e5-d5cd01f7347d', '{"action":"token_revoked","actor_id":"5f206c96-c10c-4ac9-a607-3dc55d76ce9f","actor_username":"javierpacareu@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-20 05:44:49.782376+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f7f5ed61-6921-4dfb-b621-63f6bcb00dae', '{"action":"login","actor_id":"5f206c96-c10c-4ac9-a607-3dc55d76ce9f","actor_username":"javierpacareu@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-11-20 05:56:33.911632+00', ''),
	('00000000-0000-0000-0000-000000000000', 'adbb3e02-3e0b-481e-bf43-a7d36cc92ca2', '{"action":"login","actor_id":"5f206c96-c10c-4ac9-a607-3dc55d76ce9f","actor_username":"javierpacareu@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-11-23 23:24:25.183971+00', '');


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."users" ("instance_id", "id", "aud", "role", "email", "encrypted_password", "email_confirmed_at", "invited_at", "confirmation_token", "confirmation_sent_at", "recovery_token", "recovery_sent_at", "email_change_token_new", "email_change", "email_change_sent_at", "last_sign_in_at", "raw_app_meta_data", "raw_user_meta_data", "is_super_admin", "created_at", "updated_at", "phone", "phone_confirmed_at", "phone_change", "phone_change_token", "phone_change_sent_at", "email_change_token_current", "email_change_confirm_status", "banned_until", "reauthentication_token", "reauthentication_sent_at", "is_sso_user", "deleted_at", "is_anonymous") VALUES
	('00000000-0000-0000-0000-000000000000', '053ea79d-8b73-471a-8ec8-462990b64815', 'authenticated', 'authenticated', 'orelvisdev@gmail.com', NULL, '2024-11-18 17:26:39.639926+00', NULL, '', NULL, '', NULL, '', '', NULL, '2024-11-18 17:29:02.667959+00', '{"provider": "google", "providers": ["google"]}', '{"iss": "https://accounts.google.com", "sub": "113022781263694874158", "name": "Orelvis Lago", "email": "orelvisdev@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocK9VH_YTCxUqTBt5HEwLHJqdnzT-5UDZeaOjG8sPbZEG-EXhw=s96-c", "full_name": "Orelvis Lago", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocK9VH_YTCxUqTBt5HEwLHJqdnzT-5UDZeaOjG8sPbZEG-EXhw=s96-c", "provider_id": "113022781263694874158", "email_verified": true, "phone_verified": false}', NULL, '2024-11-18 17:26:39.617568+00', '2024-11-18 21:34:30.158808+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', '5f206c96-c10c-4ac9-a607-3dc55d76ce9f', 'authenticated', 'authenticated', 'javierpacareu@gmail.com', '$2a$10$ga0uXyeW29G4SGvkkJUPZeJCenTWO0ELJrJRdivb1SKwpnnmJVGYi', '2024-11-13 23:53:06.094413+00', NULL, '', NULL, '', NULL, '', '', NULL, '2024-11-23 23:24:25.184645+00', '{"provider": "email", "providers": ["email"]}', '{}', NULL, '2024-11-13 23:53:06.057554+00', '2024-11-23 23:24:25.18684+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false);


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."identities" ("provider_id", "user_id", "identity_data", "provider", "last_sign_in_at", "created_at", "updated_at", "id") VALUES
	('5f206c96-c10c-4ac9-a607-3dc55d76ce9f', '5f206c96-c10c-4ac9-a607-3dc55d76ce9f', '{"sub": "5f206c96-c10c-4ac9-a607-3dc55d76ce9f", "email": "javierpacareu@gmail.com", "email_verified": false, "phone_verified": false}', 'email', '2024-11-13 23:53:06.080177+00', '2024-11-13 23:53:06.081212+00', '2024-11-13 23:53:06.081212+00', 'cac0797f-eb7c-49a3-ba6a-de837edca0b1'),
	('113022781263694874158', '053ea79d-8b73-471a-8ec8-462990b64815', '{"iss": "https://accounts.google.com", "sub": "113022781263694874158", "name": "Orelvis Lago", "email": "orelvisdev@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocK9VH_YTCxUqTBt5HEwLHJqdnzT-5UDZeaOjG8sPbZEG-EXhw=s96-c", "full_name": "Orelvis Lago", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocK9VH_YTCxUqTBt5HEwLHJqdnzT-5UDZeaOjG8sPbZEG-EXhw=s96-c", "provider_id": "113022781263694874158", "email_verified": true, "phone_verified": false}', 'google', '2024-11-18 17:26:39.63341+00', '2024-11-18 17:26:39.633461+00', '2024-11-18 17:29:02.663013+00', 'dd2ba0dc-5f3a-4778-99be-4db5c0f4e78f');


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."sessions" ("id", "user_id", "created_at", "updated_at", "factor_id", "aal", "not_after", "refreshed_at", "user_agent", "ip", "tag") VALUES
	('4b3fb01c-c02c-426c-8073-bfac22921f9d', '5f206c96-c10c-4ac9-a607-3dc55d76ce9f', '2024-11-14 03:05:04.44939+00', '2024-11-14 23:25:48.191381+00', NULL, 'aal1', NULL, '2024-11-14 23:25:48.19131', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', '68.8.77.173', NULL),
	('8a15ff95-a764-4d1b-9223-eec745e5336f', '053ea79d-8b73-471a-8ec8-462990b64815', '2024-11-18 17:26:39.642687+00', '2024-11-18 17:26:39.642687+00', NULL, 'aal1', NULL, NULL, 'ktor-client', '64.201.138.246', NULL),
	('648a8d11-37cd-4334-bdc6-85f3a63530a2', '5f206c96-c10c-4ac9-a607-3dc55d76ce9f', '2024-11-14 23:28:28.513379+00', '2024-11-19 23:23:43.498151+00', NULL, 'aal1', NULL, '2024-11-19 23:23:43.497348', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', '68.8.77.173', NULL),
	('16bd54b1-7a7f-4168-ad34-848a0895307f', '5f206c96-c10c-4ac9-a607-3dc55d76ce9f', '2024-11-19 23:23:55.402269+00', '2024-11-20 05:44:49.798801+00', NULL, 'aal1', NULL, '2024-11-20 05:44:49.798727', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', '68.8.77.173', NULL),
	('21c09186-479b-49b5-bfef-171773727336', '5f206c96-c10c-4ac9-a607-3dc55d76ce9f', '2024-11-20 05:56:33.916097+00', '2024-11-20 05:56:33.916097+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', '68.8.77.173', NULL),
	('855f7e88-509d-4d40-8275-c2c8777f8afe', '5f206c96-c10c-4ac9-a607-3dc55d76ce9f', '2024-11-23 23:24:25.184677+00', '2024-11-23 23:24:25.184677+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', '172.18.0.1', NULL);


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."mfa_amr_claims" ("session_id", "created_at", "updated_at", "authentication_method", "id") VALUES
	('4b3fb01c-c02c-426c-8073-bfac22921f9d', '2024-11-14 03:05:04.461593+00', '2024-11-14 03:05:04.461593+00', 'password', 'ac78345c-dde3-4958-86fa-d4c1446dcb4f'),
	('648a8d11-37cd-4334-bdc6-85f3a63530a2', '2024-11-14 23:28:28.519399+00', '2024-11-14 23:28:28.519399+00', 'password', '9bee42cc-b9ca-469f-8e36-f355a7ef4bbb'),
	('8a15ff95-a764-4d1b-9223-eec745e5336f', '2024-11-18 17:26:39.653776+00', '2024-11-18 17:26:39.653776+00', 'oauth', '3cb67976-75c9-437b-8a98-6c85961940a6'),
	('16bd54b1-7a7f-4168-ad34-848a0895307f', '2024-11-19 23:23:55.406999+00', '2024-11-19 23:23:55.406999+00', 'password', '12b09d0a-82e1-4483-9abc-9afaf9fc28c3'),
	('21c09186-479b-49b5-bfef-171773727336', '2024-11-20 05:56:33.93144+00', '2024-11-20 05:56:33.93144+00', 'password', 'e334343d-c259-4580-bcd9-b2f1846d8fe4'),
	('855f7e88-509d-4d40-8275-c2c8777f8afe', '2024-11-23 23:24:25.187229+00', '2024-11-23 23:24:25.187229+00', 'password', '0016ee5f-2de2-4829-a1dc-3253c6f98fed');


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

INSERT INTO "auth"."refresh_tokens" ("instance_id", "id", "token", "user_id", "revoked", "created_at", "updated_at", "parent", "session_id") VALUES
	('00000000-0000-0000-0000-000000000000', 1, 'A4G5F9UNIN6DDuIiKggxAg', '5f206c96-c10c-4ac9-a607-3dc55d76ce9f', true, '2024-11-14 03:05:04.454246+00', '2024-11-14 23:25:48.174754+00', NULL, '4b3fb01c-c02c-426c-8073-bfac22921f9d'),
	('00000000-0000-0000-0000-000000000000', 2, 'PYK7yn4nTTfwNw4E_gLp1g', '5f206c96-c10c-4ac9-a607-3dc55d76ce9f', false, '2024-11-14 23:25:48.180789+00', '2024-11-14 23:25:48.180789+00', 'A4G5F9UNIN6DDuIiKggxAg', '4b3fb01c-c02c-426c-8073-bfac22921f9d'),
	('00000000-0000-0000-0000-000000000000', 3, 'gy1heMer-a5Ic9DeXf_Lhw', '5f206c96-c10c-4ac9-a607-3dc55d76ce9f', true, '2024-11-14 23:28:28.516774+00', '2024-11-15 04:23:30.008111+00', NULL, '648a8d11-37cd-4334-bdc6-85f3a63530a2'),
	('00000000-0000-0000-0000-000000000000', 4, '3lZqR6Bfodq5jTet9wnPLA', '5f206c96-c10c-4ac9-a607-3dc55d76ce9f', true, '2024-11-15 04:23:30.019303+00', '2024-11-15 06:17:54.88495+00', 'gy1heMer-a5Ic9DeXf_Lhw', '648a8d11-37cd-4334-bdc6-85f3a63530a2'),
	('00000000-0000-0000-0000-000000000000', 5, 'CORsiBWWvLcdc1eS_uE2Ug', '5f206c96-c10c-4ac9-a607-3dc55d76ce9f', true, '2024-11-15 06:17:54.886813+00', '2024-11-15 21:33:57.350596+00', '3lZqR6Bfodq5jTet9wnPLA', '648a8d11-37cd-4334-bdc6-85f3a63530a2'),
	('00000000-0000-0000-0000-000000000000', 6, 'sEnckKqLE5JDmJgR7oX3EQ', '5f206c96-c10c-4ac9-a607-3dc55d76ce9f', true, '2024-11-15 21:33:57.358058+00', '2024-11-16 22:53:10.858341+00', 'CORsiBWWvLcdc1eS_uE2Ug', '648a8d11-37cd-4334-bdc6-85f3a63530a2'),
	('00000000-0000-0000-0000-000000000000', 8, '1qut53Bejy-M5OLCGAAjpg', '053ea79d-8b73-471a-8ec8-462990b64815', false, '2024-11-18 17:26:39.6475+00', '2024-11-18 17:26:39.6475+00', NULL, '8a15ff95-a764-4d1b-9223-eec745e5336f'),
	('00000000-0000-0000-0000-000000000000', 7, 'WXyd_iT7xAm0qTMbCra74A', '5f206c96-c10c-4ac9-a607-3dc55d76ce9f', true, '2024-11-16 22:53:10.86342+00', '2024-11-19 23:23:43.475674+00', 'sEnckKqLE5JDmJgR7oX3EQ', '648a8d11-37cd-4334-bdc6-85f3a63530a2'),
	('00000000-0000-0000-0000-000000000000', 12, 'n9-0MyvQ7b06fncvZaz7BQ', '5f206c96-c10c-4ac9-a607-3dc55d76ce9f', false, '2024-11-19 23:23:43.480431+00', '2024-11-19 23:23:43.480431+00', 'WXyd_iT7xAm0qTMbCra74A', '648a8d11-37cd-4334-bdc6-85f3a63530a2'),
	('00000000-0000-0000-0000-000000000000', 13, 'QpImeh6xXwz82pdTPz-2SQ', '5f206c96-c10c-4ac9-a607-3dc55d76ce9f', true, '2024-11-19 23:23:55.405803+00', '2024-11-20 05:44:49.782919+00', NULL, '16bd54b1-7a7f-4168-ad34-848a0895307f'),
	('00000000-0000-0000-0000-000000000000', 14, 'psjtpqzixZbP5haoguWOqA', '5f206c96-c10c-4ac9-a607-3dc55d76ce9f', false, '2024-11-20 05:44:49.789904+00', '2024-11-20 05:44:49.789904+00', 'QpImeh6xXwz82pdTPz-2SQ', '16bd54b1-7a7f-4168-ad34-848a0895307f'),
	('00000000-0000-0000-0000-000000000000', 15, 'VE6VEVr77D1rOrCBO3AWmQ', '5f206c96-c10c-4ac9-a607-3dc55d76ce9f', false, '2024-11-20 05:56:33.925231+00', '2024-11-20 05:56:33.925231+00', NULL, '21c09186-479b-49b5-bfef-171773727336'),
	('00000000-0000-0000-0000-000000000000', 16, '88xPP1LwaVObPM62gvc1tw', '5f206c96-c10c-4ac9-a607-3dc55d76ce9f', false, '2024-11-23 23:24:25.185533+00', '2024-11-23 23:24:25.185533+00', NULL, '855f7e88-509d-4d40-8275-c2c8777f8afe');


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

INSERT INTO "public"."organizations" ("id", "created_at", "name", "category") VALUES
	('8392f809-ed88-472b-9572-62fc8b4a6092', '2024-11-12 05:04:37.768436+00', 'Organization A', NULL),
	('dcd3a42d-8808-4063-ad64-5a433a5ec214', '2024-11-12 05:04:37.768436+00', 'Organization B', 'dentist');


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
	('3de32793-5341-4b69-8dbf-d74be268328d', 'dcd3a42d-8808-4063-ad64-5a433a5ec214', '2024-11-12 05:04:37.768436+00', 'Jane Smith', 'jane.smith@example.com'),
	('5f206c96-c10c-4ac9-a607-3dc55d76ce9f', '8392f809-ed88-472b-9572-62fc8b4a6092', '2024-11-12 05:04:37.768436+00', 'Javier Pacareu', 'javierpacareu@gmail.com');


--
-- Data for Name: contents; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."contents" ("id", "created_at", "media_id", "provider", "user_id") VALUES
	('e0fe55cd-c18d-4adc-b058-442c6d90d5e0', '2024-11-12 05:04:37.768436+00', 'media_002', 'youtube', '3de32793-5341-4b69-8dbf-d74be268328d'),
	('26187538-3456-4c3a-8ff5-95eaf61caf49', '2024-11-12 05:04:37.768436+00', 'media_001', 'youtube', '5f206c96-c10c-4ac9-a607-3dc55d76ce9f');


--
-- Data for Name: lists; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."lists" ("created_at", "name", "content", "id") VALUES
	('2024-11-12 05:04:37.768436+00', 'List 1', '{"Item 1","Item 2","Item 3"}', '9c4ff48d-c040-4eb9-a850-111176f015b6'),
	('2024-11-12 05:04:37.768436+00', 'List 2', '{"Task A","Task B"}', '3d9ad1f9-a1f7-4ef6-87fb-8b3f585a5b68');


--
-- Data for Name: devices; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."devices" ("id", "created_at", "name", "android_id", "branch_id", "list_id", "status", "code_value", "code_exp", "organization_id") VALUES
	('00d0155f-b38e-435c-b999-f320559f8700', '2024-11-12 05:04:37.768436+00', 'Device 2', 'android_002', NULL, '3d9ad1f9-a1f7-4ef6-87fb-8b3f585a5b68', 'initialized', NULL, NULL, '8392f809-ed88-472b-9572-62fc8b4a6092'),
	('bace098a-3221-47b5-828f-5e33bc7d2e99', '2024-11-12 05:04:37.768436+00', 'Device 1', 'android_001', '2cf52926-d0b3-4c17-9906-298f59b940a6', '9c4ff48d-c040-4eb9-a850-111176f015b6', 'assigned', '58083', '2024-11-24 02:44:35.726043+00', '8392f809-ed88-472b-9572-62fc8b4a6092');


--
-- Data for Name: users_branches; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."users_branches" ("user_id", "branch_id") VALUES
	('5f206c96-c10c-4ac9-a607-3dc55d76ce9f', '6459cb87-939e-4dec-862b-0cb7cf8adcda'),
	('5f206c96-c10c-4ac9-a607-3dc55d76ce9f', '2cf52926-d0b3-4c17-9906-298f59b940a6');


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
-- Data for Name: hooks; Type: TABLE DATA; Schema: supabase_functions; Owner: supabase_functions_admin
--



--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--



--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('"auth"."refresh_tokens_id_seq"', 16, true);


--
-- Name: key_key_id_seq; Type: SEQUENCE SET; Schema: pgsodium; Owner: supabase_admin
--

SELECT pg_catalog.setval('"pgsodium"."key_key_id_seq"', 1, false);


--
-- Name: hooks_id_seq; Type: SEQUENCE SET; Schema: supabase_functions; Owner: supabase_functions_admin
--

SELECT pg_catalog.setval('"supabase_functions"."hooks_id_seq"', 1, false);


--
-- PostgreSQL database dump complete
--

RESET ALL;
