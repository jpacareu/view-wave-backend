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
	('00000000-0000-0000-0000-000000000000', 'a79b9aaf-d79c-4b0c-9f81-1ff6a6b1f7f2', '{"action":"user_invited","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"supabase_admin","actor_via_sso":false,"log_type":"team","traits":{"user_email":"nawicon985@kazvi.com","user_id":"bd9152ec-c0d6-450d-9656-56dbfb8720e0"}}', '2024-11-24 19:18:50.173581+00', ''),
	('00000000-0000-0000-0000-000000000000', 'db5ae6de-1f61-4dc8-929f-4d4c82794739', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"nawicon985@kazvi.com","user_id":"bd9152ec-c0d6-450d-9656-56dbfb8720e0","user_phone":""}}', '2024-11-24 19:21:17.592633+00', ''),
	('00000000-0000-0000-0000-000000000000', '67766bea-072b-4a0c-be32-3fd09e1a1f9c', '{"action":"user_invited","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"supabase_admin","actor_via_sso":false,"log_type":"team","traits":{"user_email":"nawicon985@kazvi.com","user_id":"ac668136-199f-4a83-ac02-c5db6b2cbe09"}}', '2024-11-24 19:21:49.836918+00', ''),
	('00000000-0000-0000-0000-000000000000', '11b774b7-611e-4b06-9318-d80008b4029a', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"nawicon985@kazvi.com","user_id":"ac668136-199f-4a83-ac02-c5db6b2cbe09","user_phone":""}}', '2024-11-24 19:32:57.829849+00', ''),
	('00000000-0000-0000-0000-000000000000', '53fc9504-325d-4b81-9cd6-348e838264f7', '{"action":"user_invited","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"supabase_admin","actor_via_sso":false,"log_type":"team","traits":{"user_email":"nawicon985@kazvi.com","user_id":"3bfde56c-6f5e-4f1f-ae2a-de24d2f470d4"}}', '2024-11-26 05:02:46.835091+00', ''),
	('00000000-0000-0000-0000-000000000000', 'cc84ff12-33d0-46c5-bf4b-2cd8c7375076', '{"action":"user_signedup","actor_id":"3bfde56c-6f5e-4f1f-ae2a-de24d2f470d4","actor_username":"nawicon985@kazvi.com","actor_via_sso":false,"log_type":"team"}', '2024-11-26 05:03:10.285996+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b58538d9-9325-4acb-b153-c2acc57b3d59', '{"action":"user_recovery_requested","actor_id":"3bfde56c-6f5e-4f1f-ae2a-de24d2f470d4","actor_username":"nawicon985@kazvi.com","actor_via_sso":false,"log_type":"user"}', '2024-11-26 05:08:51.344525+00', ''),
	('00000000-0000-0000-0000-000000000000', '05c2515a-e6b0-4341-922b-1ca5c3912912', '{"action":"login","actor_id":"3bfde56c-6f5e-4f1f-ae2a-de24d2f470d4","actor_username":"nawicon985@kazvi.com","actor_via_sso":false,"log_type":"account"}', '2024-11-26 05:09:10.123972+00', ''),
	('00000000-0000-0000-0000-000000000000', '02e6d3c0-9f61-4df1-b5de-03328b123987', '{"action":"user_recovery_requested","actor_id":"3bfde56c-6f5e-4f1f-ae2a-de24d2f470d4","actor_username":"nawicon985@kazvi.com","actor_via_sso":false,"log_type":"user"}', '2024-11-26 05:10:22.972934+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a9c429a2-adb3-423d-9950-32905078fd79', '{"action":"login","actor_id":"3bfde56c-6f5e-4f1f-ae2a-de24d2f470d4","actor_username":"nawicon985@kazvi.com","actor_via_sso":false,"log_type":"account"}', '2024-11-26 05:13:20.181649+00', ''),
	('00000000-0000-0000-0000-000000000000', '6a405a04-3e45-45d7-80f3-906822615a32', '{"action":"user_recovery_requested","actor_id":"3bfde56c-6f5e-4f1f-ae2a-de24d2f470d4","actor_username":"nawicon985@kazvi.com","actor_via_sso":false,"log_type":"user"}', '2024-11-26 05:21:08.363778+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a0720529-a8eb-43a7-824e-9397d9b7d629', '{"action":"login","actor_id":"3bfde56c-6f5e-4f1f-ae2a-de24d2f470d4","actor_username":"nawicon985@kazvi.com","actor_via_sso":false,"log_type":"account"}', '2024-11-26 05:21:36.63068+00', ''),
	('00000000-0000-0000-0000-000000000000', '7d9eadf4-cba5-40ab-ad31-4d703c2d8802', '{"action":"token_refreshed","actor_id":"3bfde56c-6f5e-4f1f-ae2a-de24d2f470d4","actor_username":"nawicon985@kazvi.com","actor_via_sso":false,"log_type":"token"}', '2024-11-26 06:22:25.220884+00', ''),
	('00000000-0000-0000-0000-000000000000', '49a29ef0-ddc9-457f-8c58-3b56d812664d', '{"action":"token_revoked","actor_id":"3bfde56c-6f5e-4f1f-ae2a-de24d2f470d4","actor_username":"nawicon985@kazvi.com","actor_via_sso":false,"log_type":"token"}', '2024-11-26 06:22:25.221799+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f19e3dc8-2d49-4c44-ac24-f0d3fa27e887', '{"action":"token_refreshed","actor_id":"3bfde56c-6f5e-4f1f-ae2a-de24d2f470d4","actor_username":"nawicon985@kazvi.com","actor_via_sso":false,"log_type":"token"}', '2024-11-27 05:16:47.645896+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ffb5861e-e41e-4c8a-8043-d8618df61249', '{"action":"token_revoked","actor_id":"3bfde56c-6f5e-4f1f-ae2a-de24d2f470d4","actor_username":"nawicon985@kazvi.com","actor_via_sso":false,"log_type":"token"}', '2024-11-27 05:16:47.658476+00', ''),
	('00000000-0000-0000-0000-000000000000', '9bdc67e1-540f-4e0d-b543-534ea62832b3', '{"action":"token_refreshed","actor_id":"3bfde56c-6f5e-4f1f-ae2a-de24d2f470d4","actor_username":"nawicon985@kazvi.com","actor_via_sso":false,"log_type":"token"}', '2024-11-28 18:00:21.435858+00', ''),
	('00000000-0000-0000-0000-000000000000', '6365338f-e532-4c41-94e2-23c7b50cf9a4', '{"action":"token_revoked","actor_id":"3bfde56c-6f5e-4f1f-ae2a-de24d2f470d4","actor_username":"nawicon985@kazvi.com","actor_via_sso":false,"log_type":"token"}', '2024-11-28 18:00:21.454465+00', ''),
	('00000000-0000-0000-0000-000000000000', '731ce957-516a-44e6-9e74-35eb554ad816', '{"action":"token_refreshed","actor_id":"3bfde56c-6f5e-4f1f-ae2a-de24d2f470d4","actor_username":"nawicon985@kazvi.com","actor_via_sso":false,"log_type":"token"}', '2024-12-01 05:27:56.918514+00', ''),
	('00000000-0000-0000-0000-000000000000', '2771973c-2497-4d15-8c62-1cbe4322310a', '{"action":"token_revoked","actor_id":"3bfde56c-6f5e-4f1f-ae2a-de24d2f470d4","actor_username":"nawicon985@kazvi.com","actor_via_sso":false,"log_type":"token"}', '2024-12-01 05:27:56.933548+00', ''),
	('00000000-0000-0000-0000-000000000000', '96c41582-82e7-4144-9b00-579f00c78557', '{"action":"login","actor_id":"5f206c96-c10c-4ac9-a607-3dc55d76ce9f","actor_username":"javierpacareu@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-12-01 05:40:58.597565+00', '');


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."users" ("instance_id", "id", "aud", "role", "email", "encrypted_password", "email_confirmed_at", "invited_at", "confirmation_token", "confirmation_sent_at", "recovery_token", "recovery_sent_at", "email_change_token_new", "email_change", "email_change_sent_at", "last_sign_in_at", "raw_app_meta_data", "raw_user_meta_data", "is_super_admin", "created_at", "updated_at", "phone", "phone_confirmed_at", "phone_change", "phone_change_token", "phone_change_sent_at", "email_change_token_current", "email_change_confirm_status", "banned_until", "reauthentication_token", "reauthentication_sent_at", "is_sso_user", "deleted_at", "is_anonymous") VALUES
	('00000000-0000-0000-0000-000000000000', '053ea79d-8b73-471a-8ec8-462990b64815', 'authenticated', 'authenticated', 'orelvisdev@gmail.com', NULL, '2024-11-18 17:26:39.639926+00', NULL, '', NULL, '', NULL, '', '', NULL, '2024-11-18 17:29:02.667959+00', '{"provider": "google", "providers": ["google"]}', '{"iss": "https://accounts.google.com", "sub": "113022781263694874158", "name": "Orelvis Lago", "email": "orelvisdev@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocK9VH_YTCxUqTBt5HEwLHJqdnzT-5UDZeaOjG8sPbZEG-EXhw=s96-c", "full_name": "Orelvis Lago", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocK9VH_YTCxUqTBt5HEwLHJqdnzT-5UDZeaOjG8sPbZEG-EXhw=s96-c", "provider_id": "113022781263694874158", "email_verified": true, "phone_verified": false}', NULL, '2024-11-18 17:26:39.617568+00', '2024-11-18 21:34:30.158808+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', '3bfde56c-6f5e-4f1f-ae2a-de24d2f470d4', 'authenticated', 'authenticated', 'nawicon985@kazvi.com', '$2a$10$ezWTeyI9HuJOWWfLu0TTOu6DPKg4UEEQeFIckySc3m1DZS3gr2x6O', '2024-11-26 05:03:10.287198+00', '2024-11-26 05:02:46.848237+00', '', NULL, '', '2024-11-26 05:21:08.364617+00', '', '', NULL, '2024-11-26 05:21:36.633401+00', '{"provider": "email", "providers": ["email"]}', '{}', NULL, '2024-11-26 05:02:46.792422+00', '2024-12-01 05:27:56.945929+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', '5f206c96-c10c-4ac9-a607-3dc55d76ce9f', 'authenticated', 'authenticated', 'javierpacareu@gmail.com', '$2a$10$ga0uXyeW29G4SGvkkJUPZeJCenTWO0ELJrJRdivb1SKwpnnmJVGYi', '2024-11-13 23:53:06.094413+00', NULL, '', NULL, '', NULL, '', '', NULL, '2024-12-01 05:40:58.601713+00', '{"provider": "email", "providers": ["email"]}', '{}', NULL, '2024-11-13 23:53:06.057554+00', '2024-12-01 05:40:58.607016+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false);


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."identities" ("provider_id", "user_id", "identity_data", "provider", "last_sign_in_at", "created_at", "updated_at", "id") VALUES
	('5f206c96-c10c-4ac9-a607-3dc55d76ce9f', '5f206c96-c10c-4ac9-a607-3dc55d76ce9f', '{"sub": "5f206c96-c10c-4ac9-a607-3dc55d76ce9f", "email": "javierpacareu@gmail.com", "email_verified": false, "phone_verified": false}', 'email', '2024-11-13 23:53:06.080177+00', '2024-11-13 23:53:06.081212+00', '2024-11-13 23:53:06.081212+00', 'cac0797f-eb7c-49a3-ba6a-de837edca0b1'),
	('113022781263694874158', '053ea79d-8b73-471a-8ec8-462990b64815', '{"iss": "https://accounts.google.com", "sub": "113022781263694874158", "name": "Orelvis Lago", "email": "orelvisdev@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocK9VH_YTCxUqTBt5HEwLHJqdnzT-5UDZeaOjG8sPbZEG-EXhw=s96-c", "full_name": "Orelvis Lago", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocK9VH_YTCxUqTBt5HEwLHJqdnzT-5UDZeaOjG8sPbZEG-EXhw=s96-c", "provider_id": "113022781263694874158", "email_verified": true, "phone_verified": false}', 'google', '2024-11-18 17:26:39.63341+00', '2024-11-18 17:26:39.633461+00', '2024-11-18 17:29:02.663013+00', 'dd2ba0dc-5f3a-4778-99be-4db5c0f4e78f'),
	('3bfde56c-6f5e-4f1f-ae2a-de24d2f470d4', '3bfde56c-6f5e-4f1f-ae2a-de24d2f470d4', '{"sub": "3bfde56c-6f5e-4f1f-ae2a-de24d2f470d4", "email": "nawicon985@kazvi.com", "email_verified": false, "phone_verified": false}', 'email', '2024-11-26 05:02:46.825878+00', '2024-11-26 05:02:46.826515+00', '2024-11-26 05:02:46.826515+00', '0257cb7f-2f0b-4ba0-8c14-39a02c0554ce');


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
	('97a80a15-93a4-4b32-814c-a66f6efb345b', '3bfde56c-6f5e-4f1f-ae2a-de24d2f470d4', '2024-11-26 05:03:10.290836+00', '2024-11-26 05:03:10.290836+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', '68.8.77.173', NULL),
	('241565ff-236e-4c3e-855c-899ffdcfda29', '3bfde56c-6f5e-4f1f-ae2a-de24d2f470d4', '2024-11-26 05:09:10.126058+00', '2024-11-26 05:09:10.126058+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', '68.8.77.173', NULL),
	('8f43e4ff-ef42-48b7-b599-bd4496622e1e', '3bfde56c-6f5e-4f1f-ae2a-de24d2f470d4', '2024-11-26 05:13:20.184552+00', '2024-11-26 05:13:20.184552+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', '68.8.77.173', NULL),
	('8cd74341-b949-4132-86dc-25d3d37b7631', '3bfde56c-6f5e-4f1f-ae2a-de24d2f470d4', '2024-11-26 05:21:36.63347+00', '2024-12-01 05:27:56.954168+00', NULL, 'aal1', NULL, '2024-12-01 05:27:56.953469', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', '68.8.77.173', NULL),
	('1da946ed-a93f-455a-a79f-0327c3264cd2', '5f206c96-c10c-4ac9-a607-3dc55d76ce9f', '2024-12-01 05:40:58.601802+00', '2024-12-01 05:40:58.601802+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', '68.8.77.173', NULL);


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."mfa_amr_claims" ("session_id", "created_at", "updated_at", "authentication_method", "id") VALUES
	('4b3fb01c-c02c-426c-8073-bfac22921f9d', '2024-11-14 03:05:04.461593+00', '2024-11-14 03:05:04.461593+00', 'password', 'ac78345c-dde3-4958-86fa-d4c1446dcb4f'),
	('648a8d11-37cd-4334-bdc6-85f3a63530a2', '2024-11-14 23:28:28.519399+00', '2024-11-14 23:28:28.519399+00', 'password', '9bee42cc-b9ca-469f-8e36-f355a7ef4bbb'),
	('8a15ff95-a764-4d1b-9223-eec745e5336f', '2024-11-18 17:26:39.653776+00', '2024-11-18 17:26:39.653776+00', 'oauth', '3cb67976-75c9-437b-8a98-6c85961940a6'),
	('16bd54b1-7a7f-4168-ad34-848a0895307f', '2024-11-19 23:23:55.406999+00', '2024-11-19 23:23:55.406999+00', 'password', '12b09d0a-82e1-4483-9abc-9afaf9fc28c3'),
	('21c09186-479b-49b5-bfef-171773727336', '2024-11-20 05:56:33.93144+00', '2024-11-20 05:56:33.93144+00', 'password', 'e334343d-c259-4580-bcd9-b2f1846d8fe4'),
	('97a80a15-93a4-4b32-814c-a66f6efb345b', '2024-11-26 05:03:10.312018+00', '2024-11-26 05:03:10.312018+00', 'otp', '0fde368f-d066-4243-a696-d8b097400259'),
	('241565ff-236e-4c3e-855c-899ffdcfda29', '2024-11-26 05:09:10.129278+00', '2024-11-26 05:09:10.129278+00', 'otp', '98ebe850-5d23-4019-a144-da6ef3a9f083'),
	('8f43e4ff-ef42-48b7-b599-bd4496622e1e', '2024-11-26 05:13:20.188817+00', '2024-11-26 05:13:20.188817+00', 'otp', '7cdfbe84-3008-4a8d-93ac-74b2f8ba51cb'),
	('8cd74341-b949-4132-86dc-25d3d37b7631', '2024-11-26 05:21:36.636361+00', '2024-11-26 05:21:36.636361+00', 'otp', '728dee6d-6a04-44dd-ba31-5272bde0f63b'),
	('1da946ed-a93f-455a-a79f-0327c3264cd2', '2024-12-01 05:40:58.608447+00', '2024-12-01 05:40:58.608447+00', 'password', '6c1348c4-9308-494c-a82f-06f5bc4a939a');


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
	('00000000-0000-0000-0000-000000000000', 16, 'FG0_BmtkuXsa9ZYxXsSpKg', '3bfde56c-6f5e-4f1f-ae2a-de24d2f470d4', false, '2024-11-26 05:03:10.294929+00', '2024-11-26 05:03:10.294929+00', NULL, '97a80a15-93a4-4b32-814c-a66f6efb345b'),
	('00000000-0000-0000-0000-000000000000', 17, 'sH9ZYzrbJZdWywfSfqq39g', '3bfde56c-6f5e-4f1f-ae2a-de24d2f470d4', false, '2024-11-26 05:09:10.126995+00', '2024-11-26 05:09:10.126995+00', NULL, '241565ff-236e-4c3e-855c-899ffdcfda29'),
	('00000000-0000-0000-0000-000000000000', 18, 'rOhTCHDqnvvHnsMdWVTrZw', '3bfde56c-6f5e-4f1f-ae2a-de24d2f470d4', false, '2024-11-26 05:13:20.186671+00', '2024-11-26 05:13:20.186671+00', NULL, '8f43e4ff-ef42-48b7-b599-bd4496622e1e'),
	('00000000-0000-0000-0000-000000000000', 19, 'OUznpD-R_B4UNb_gn9il3g', '3bfde56c-6f5e-4f1f-ae2a-de24d2f470d4', true, '2024-11-26 05:21:36.634264+00', '2024-11-26 06:22:25.222299+00', NULL, '8cd74341-b949-4132-86dc-25d3d37b7631'),
	('00000000-0000-0000-0000-000000000000', 20, 'l2Z0Hl2xcHgRV24w6cxcVw', '3bfde56c-6f5e-4f1f-ae2a-de24d2f470d4', true, '2024-11-26 06:22:25.225691+00', '2024-11-27 05:16:47.660161+00', 'OUznpD-R_B4UNb_gn9il3g', '8cd74341-b949-4132-86dc-25d3d37b7631'),
	('00000000-0000-0000-0000-000000000000', 21, 'f9vAMZX8Rsp4ILs7IrkbLA', '3bfde56c-6f5e-4f1f-ae2a-de24d2f470d4', true, '2024-11-27 05:16:47.668243+00', '2024-11-28 18:00:21.455075+00', 'l2Z0Hl2xcHgRV24w6cxcVw', '8cd74341-b949-4132-86dc-25d3d37b7631'),
	('00000000-0000-0000-0000-000000000000', 22, 'IATys2inQgWzcbB0e4YsLw', '3bfde56c-6f5e-4f1f-ae2a-de24d2f470d4', true, '2024-11-28 18:00:21.473476+00', '2024-12-01 05:27:56.934654+00', 'f9vAMZX8Rsp4ILs7IrkbLA', '8cd74341-b949-4132-86dc-25d3d37b7631'),
	('00000000-0000-0000-0000-000000000000', 23, 'wpkmyCy1dm_oArIESIZ_Ag', '3bfde56c-6f5e-4f1f-ae2a-de24d2f470d4', false, '2024-12-01 05:27:56.943384+00', '2024-12-01 05:27:56.943384+00', 'IATys2inQgWzcbB0e4YsLw', '8cd74341-b949-4132-86dc-25d3d37b7631'),
	('00000000-0000-0000-0000-000000000000', 24, 'Q0UanK3bFdw1xgKQNY80uQ', '5f206c96-c10c-4ac9-a607-3dc55d76ce9f', false, '2024-12-01 05:40:58.604755+00', '2024-12-01 05:40:58.604755+00', NULL, '1da946ed-a93f-455a-a79f-0327c3264cd2');


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
	('dcd3a42d-8808-4063-ad64-5a433a5ec214', '2024-11-12 05:04:37.768436+00', 'Organization B', NULL),
	('90fec7d8-0b73-413e-99e1-ea74f95f9c6d', '2024-11-26 05:05:01.680708+00', 'Organization C', NULL);


--
-- Data for Name: branches; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."branches" ("id", "created_at", "organization_id", "name", "places_id", "category") VALUES
	('6459cb87-939e-4dec-862b-0cb7cf8adcda', '2024-11-12 05:04:37.768436+00', 'dcd3a42d-8808-4063-ad64-5a433a5ec214', 'Branch 2', NULL, 'dentist'),
	('1c18054c-e306-4129-a500-7e097f7fdbcb', '2024-11-21 06:04:01.080299+00', '8392f809-ed88-472b-9572-62fc8b4a6092', 'Branch 3', NULL, 'dentist'),
	('2cf52926-d0b3-4c17-9906-298f59b940a6', '2024-11-12 05:04:37.768436+00', '8392f809-ed88-472b-9572-62fc8b4a6092', 'Branch 1', NULL, 'hair_salon'),
	('ad0bb00a-91e8-401c-9b50-05b6625db08e', '2024-11-26 05:06:15.510231+00', '90fec7d8-0b73-413e-99e1-ea74f95f9c6d', 'Branch 2 for Organization C', NULL, 'hair_salon'),
	('a5c9de1f-db78-4b6c-9be9-881ba2ba1842', '2024-11-26 05:05:55.668155+00', '90fec7d8-0b73-413e-99e1-ea74f95f9c6d', 'Branch 1 for Organization C', NULL, 'cuban_restaurant');


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
	('5f206c96-c10c-4ac9-a607-3dc55d76ce9f', '8392f809-ed88-472b-9572-62fc8b4a6092', '2024-11-12 05:04:37.768436+00', 'Javier Pacareu', 'javierpacareu@gmail.com'),
	('053ea79d-8b73-471a-8ec8-462990b64815', '8392f809-ed88-472b-9572-62fc8b4a6092', '2024-11-24 18:10:52.539191+00', 'Orelvis Lagos', 'orelvisdev@gmail.com'),
	('3bfde56c-6f5e-4f1f-ae2a-de24d2f470d4', '90fec7d8-0b73-413e-99e1-ea74f95f9c6d', '2024-11-26 05:02:48.620742+00', 'Test New', 'nawicon985@kazvi.com');


--
-- Data for Name: contents; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."contents" ("id", "created_at", "media_id", "provider", "user_id") VALUES
	('26187538-3456-4c3a-8ff5-95eaf61caf49', '2024-11-12 05:04:37.768436+00', 'media_001', 'youtube', '5f206c96-c10c-4ac9-a607-3dc55d76ce9f');


--
-- Data for Name: lists; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: devices; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."devices" ("id", "created_at", "name", "android_id", "branch_id", "list_id", "status", "code_value", "code_exp", "organization_id") VALUES
	('3c4dd0a6-b019-45cc-8b5d-43c52037f0e2', '2024-11-26 05:39:21.242711+00', 'Android Branch 1 Organization C', 'b2ee760358f5b6ab', NULL, NULL, 'initialized', '42527', '2024-11-30 19:37:58.870215+00', 'dcd3a42d-8808-4063-ad64-5a433a5ec214');


--
-- Data for Name: users_branches; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."users_branches" ("user_id", "branch_id") VALUES
	('5f206c96-c10c-4ac9-a607-3dc55d76ce9f', '2cf52926-d0b3-4c17-9906-298f59b940a6'),
	('5f206c96-c10c-4ac9-a607-3dc55d76ce9f', '6459cb87-939e-4dec-862b-0cb7cf8adcda'),
	('053ea79d-8b73-471a-8ec8-462990b64815', '2cf52926-d0b3-4c17-9906-298f59b940a6'),
	('053ea79d-8b73-471a-8ec8-462990b64815', '6459cb87-939e-4dec-862b-0cb7cf8adcda'),
	('3bfde56c-6f5e-4f1f-ae2a-de24d2f470d4', 'a5c9de1f-db78-4b6c-9be9-881ba2ba1842'),
	('3bfde56c-6f5e-4f1f-ae2a-de24d2f470d4', 'ad0bb00a-91e8-401c-9b50-05b6625db08e');


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

INSERT INTO "supabase_functions"."hooks" ("id", "hook_table_id", "hook_name", "created_at", "request_id") VALUES
	(1, 16489, 'add_new_user_row', '2024-11-24 19:18:50.13514+00', 1),
	(2, 16489, 'add_new_user_row', '2024-11-24 19:21:49.829196+00', 2),
	(3, 16489, 'add_new_user_row', '2024-11-26 05:02:46.792063+00', 3);


--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--



--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('"auth"."refresh_tokens_id_seq"', 24, true);


--
-- Name: key_key_id_seq; Type: SEQUENCE SET; Schema: pgsodium; Owner: supabase_admin
--

SELECT pg_catalog.setval('"pgsodium"."key_key_id_seq"', 1, false);


--
-- Name: hooks_id_seq; Type: SEQUENCE SET; Schema: supabase_functions; Owner: supabase_functions_admin
--

SELECT pg_catalog.setval('"supabase_functions"."hooks_id_seq"', 3, true);


--
-- PostgreSQL database dump complete
--

RESET ALL;
