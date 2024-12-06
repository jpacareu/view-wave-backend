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
	('00000000-0000-0000-0000-000000000000', '96c41582-82e7-4144-9b00-579f00c78557', '{"action":"login","actor_id":"5f206c96-c10c-4ac9-a607-3dc55d76ce9f","actor_username":"javierpacareu@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-12-01 05:40:58.597565+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ef1300f1-a7ba-4f27-9c27-8f4622ca763d', '{"action":"token_refreshed","actor_id":"5f206c96-c10c-4ac9-a607-3dc55d76ce9f","actor_username":"javierpacareu@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-01 16:47:29.918617+00', ''),
	('00000000-0000-0000-0000-000000000000', '3c87c177-29d2-4509-8ec2-77ee0beba0f6', '{"action":"token_revoked","actor_id":"5f206c96-c10c-4ac9-a607-3dc55d76ce9f","actor_username":"javierpacareu@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-01 16:47:29.93283+00', ''),
	('00000000-0000-0000-0000-000000000000', '4b43ba7c-aead-4a41-a857-25d8cd7b3092', '{"action":"token_refreshed","actor_id":"5f206c96-c10c-4ac9-a607-3dc55d76ce9f","actor_username":"javierpacareu@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-01 19:57:52.944157+00', ''),
	('00000000-0000-0000-0000-000000000000', '4738e393-0c5e-45c4-ab47-1c0e01f25c27', '{"action":"token_revoked","actor_id":"5f206c96-c10c-4ac9-a607-3dc55d76ce9f","actor_username":"javierpacareu@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-01 19:57:52.949746+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ae658952-c78d-4079-9529-fa71ad00c393', '{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"keviwid121@jonespal.com","user_id":"1cdb0c0b-d0c3-4d57-97fb-cc9147a96a3a","user_phone":""}}', '2024-12-01 20:20:31.651535+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bc724582-08a2-434c-bd4f-94b9c32f00a4', '{"action":"logout","actor_id":"5f206c96-c10c-4ac9-a607-3dc55d76ce9f","actor_username":"javierpacareu@gmail.com","actor_via_sso":false,"log_type":"account"}', '2024-12-01 20:20:59.203986+00', ''),
	('00000000-0000-0000-0000-000000000000', '60c1e462-7747-4325-adf8-bb72e091dbc1', '{"action":"login","actor_id":"1cdb0c0b-d0c3-4d57-97fb-cc9147a96a3a","actor_username":"keviwid121@jonespal.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-12-01 20:21:14.804075+00', ''),
	('00000000-0000-0000-0000-000000000000', '03a0c4f2-b866-4b1d-8dd6-7a1d6ca5e65e', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"keviwid121@jonespal.com","user_id":"1cdb0c0b-d0c3-4d57-97fb-cc9147a96a3a","user_phone":""}}', '2024-12-01 20:28:40.148615+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a3e6e9ea-2566-4e5d-9bfb-7fc81aa9f4ff', '{"action":"login","actor_id":"5f206c96-c10c-4ac9-a607-3dc55d76ce9f","actor_username":"javierpacareu@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-12-01 20:29:45.278326+00', ''),
	('00000000-0000-0000-0000-000000000000', '02906773-7a63-43cd-bfa4-1540e1b53ffb', '{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"keviwid121@jonespal.com","user_id":"859a17a9-6cef-431c-9fef-d1b6aecc85db","user_phone":""}}', '2024-12-01 20:30:11.034022+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c2a905d5-1276-4e64-8aa9-7dff3e932b17', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"keviwid121@jonespal.com","user_id":"859a17a9-6cef-431c-9fef-d1b6aecc85db","user_phone":""}}', '2024-12-01 20:38:06.159727+00', ''),
	('00000000-0000-0000-0000-000000000000', '8b51e4d3-4536-4f48-9f55-8d248081757b', '{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"keviwid121@jonespal.com","user_id":"00c941a1-465a-4568-bbd4-0637b0c392c2","user_phone":""}}', '2024-12-01 20:38:44.346331+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c105641c-66cf-4fd7-9643-5604b2fa1c25', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"keviwid121@jonespal.com","user_id":"00c941a1-465a-4568-bbd4-0637b0c392c2","user_phone":""}}', '2024-12-01 20:41:41.098907+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ec1186b9-1ba6-4c35-abf6-aa9e561c4c04', '{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"keviwid121@jonespal.com","user_id":"1ca2c474-54a5-4db2-a219-6282d660b617","user_phone":""}}', '2024-12-01 20:41:54.877308+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bc53d86d-5683-4f29-a372-12c4e2ce1124', '{"action":"logout","actor_id":"5f206c96-c10c-4ac9-a607-3dc55d76ce9f","actor_username":"javierpacareu@gmail.com","actor_via_sso":false,"log_type":"account"}', '2024-12-01 21:05:44.731879+00', ''),
	('00000000-0000-0000-0000-000000000000', '4b9c251b-06cb-4e10-9770-c86b4067e534', '{"action":"login","actor_id":"5f206c96-c10c-4ac9-a607-3dc55d76ce9f","actor_username":"javierpacareu@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-12-01 21:05:48.425884+00', ''),
	('00000000-0000-0000-0000-000000000000', '3d8b627f-2bf2-4bdc-a5bd-25cac096473f', '{"action":"token_refreshed","actor_id":"5f206c96-c10c-4ac9-a607-3dc55d76ce9f","actor_username":"javierpacareu@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-02 05:04:17.146204+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a753c26f-4a64-4e1a-9b70-eac0b7f962d5', '{"action":"token_revoked","actor_id":"5f206c96-c10c-4ac9-a607-3dc55d76ce9f","actor_username":"javierpacareu@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-02 05:04:17.149223+00', ''),
	('00000000-0000-0000-0000-000000000000', '6067eaba-7948-422c-bd56-98268e9fd8da', '{"action":"token_refreshed","actor_id":"5f206c96-c10c-4ac9-a607-3dc55d76ce9f","actor_username":"javierpacareu@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-03 05:08:15.601856+00', ''),
	('00000000-0000-0000-0000-000000000000', '187a6e50-c241-42cd-822f-bfd3a55f533a', '{"action":"token_revoked","actor_id":"5f206c96-c10c-4ac9-a607-3dc55d76ce9f","actor_username":"javierpacareu@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-03 05:08:15.610622+00', ''),
	('00000000-0000-0000-0000-000000000000', '00922ea6-83a5-4755-8b9c-5182080d6fbf', '{"action":"user_signedup","actor_id":"21083f4c-25a7-432d-a1ee-729f63c67cde","actor_name":"Orelvis Lago","actor_username":"orelvis15@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"google"}}', '2024-12-04 19:55:33.668358+00', ''),
	('00000000-0000-0000-0000-000000000000', '5ba3bdd9-b9a3-403e-8520-116cf2a3846f', '{"action":"login","actor_id":"053ea79d-8b73-471a-8ec8-462990b64815","actor_name":"Orelvis Lago","actor_username":"orelvisdev@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-12-04 19:55:44.12397+00', ''),
	('00000000-0000-0000-0000-000000000000', '58a266fa-48bb-47ce-974b-4d94723e36c5', '{"action":"user_signedup","actor_id":"c4452582-c01c-4b17-aee7-346015cf648d","actor_name":"Noraida Vasallo Rodríguez","actor_username":"norivasallo@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"google"}}', '2024-12-04 19:55:48.4225+00', ''),
	('00000000-0000-0000-0000-000000000000', '1d5ac205-006a-4119-b5bd-796a549d7a07', '{"action":"login","actor_id":"21083f4c-25a7-432d-a1ee-729f63c67cde","actor_name":"Orelvis Lago","actor_username":"orelvis15@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-12-04 20:00:03.587372+00', ''),
	('00000000-0000-0000-0000-000000000000', '5a27ca4a-d1aa-42d0-b9a4-c6b7b5b8d4cf', '{"action":"login","actor_id":"21083f4c-25a7-432d-a1ee-729f63c67cde","actor_name":"Orelvis Lago","actor_username":"orelvis15@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-12-04 20:01:47.464372+00', ''),
	('00000000-0000-0000-0000-000000000000', '538d67ae-8aab-42f6-acfc-4c09dff67b8e', '{"action":"login","actor_id":"21083f4c-25a7-432d-a1ee-729f63c67cde","actor_name":"Orelvis Lago","actor_username":"orelvis15@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-12-04 20:03:37.738205+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b98409ae-5e43-4e13-b0ec-aeac83f2c443', '{"action":"login","actor_id":"21083f4c-25a7-432d-a1ee-729f63c67cde","actor_name":"Orelvis Lago","actor_username":"orelvis15@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-12-04 20:26:03.409002+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b5b6b4dc-03fd-4b35-80db-ed8c51ae7376', '{"action":"login","actor_id":"21083f4c-25a7-432d-a1ee-729f63c67cde","actor_name":"Orelvis Lago","actor_username":"orelvis15@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-12-04 20:46:49.142654+00', ''),
	('00000000-0000-0000-0000-000000000000', '481a5055-89c9-480e-873f-c7b55024f3ad', '{"action":"login","actor_id":"21083f4c-25a7-432d-a1ee-729f63c67cde","actor_name":"Orelvis Lago","actor_username":"orelvis15@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-12-04 20:51:23.32959+00', ''),
	('00000000-0000-0000-0000-000000000000', '1714b2c0-93e7-4a4d-916a-437331cd4ff9', '{"action":"login","actor_id":"21083f4c-25a7-432d-a1ee-729f63c67cde","actor_name":"Orelvis Lago","actor_username":"orelvis15@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-12-04 20:55:55.569989+00', ''),
	('00000000-0000-0000-0000-000000000000', '1655a442-fb18-45b5-93de-41dbb000c384', '{"action":"login","actor_id":"053ea79d-8b73-471a-8ec8-462990b64815","actor_name":"Orelvis Lago","actor_username":"orelvisdev@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-12-04 20:56:11.49872+00', ''),
	('00000000-0000-0000-0000-000000000000', '5c695683-1687-48f5-b7d5-369950a6c9aa', '{"action":"login","actor_id":"21083f4c-25a7-432d-a1ee-729f63c67cde","actor_name":"Orelvis Lago","actor_username":"orelvis15@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-12-04 21:05:53.623334+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd257da7b-f699-4e3c-8af3-c01f92040633', '{"action":"login","actor_id":"21083f4c-25a7-432d-a1ee-729f63c67cde","actor_name":"Orelvis Lago","actor_username":"orelvis15@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-12-04 21:43:49.342135+00', ''),
	('00000000-0000-0000-0000-000000000000', '3132c75b-8043-4f64-9f01-acecee4c0248', '{"action":"token_refreshed","actor_id":"21083f4c-25a7-432d-a1ee-729f63c67cde","actor_name":"Orelvis Lago","actor_username":"orelvis15@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-04 23:27:10.332495+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e1a910c0-0f9b-4102-b779-7134e343fd13', '{"action":"token_revoked","actor_id":"21083f4c-25a7-432d-a1ee-729f63c67cde","actor_name":"Orelvis Lago","actor_username":"orelvis15@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-04 23:27:10.334242+00', ''),
	('00000000-0000-0000-0000-000000000000', '6989de94-ec31-43c7-a2a6-bbd640277043', '{"action":"token_refreshed","actor_id":"21083f4c-25a7-432d-a1ee-729f63c67cde","actor_name":"Orelvis Lago","actor_username":"orelvis15@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-04 23:27:10.356111+00', ''),
	('00000000-0000-0000-0000-000000000000', '78ec8db1-dacc-485a-86e2-de3e5f12e780', '{"action":"login","actor_id":"21083f4c-25a7-432d-a1ee-729f63c67cde","actor_name":"Orelvis Lago","actor_username":"orelvis15@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-12-04 23:29:55.009047+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b391c0f6-2363-4a06-9f75-254060bef031', '{"action":"login","actor_id":"c4452582-c01c-4b17-aee7-346015cf648d","actor_name":"Noraida Vasallo Rodríguez","actor_username":"norivasallo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-12-04 23:30:18.325415+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e6463be2-6d3f-43f5-a79a-5c4d5c56429b', '{"action":"login","actor_id":"21083f4c-25a7-432d-a1ee-729f63c67cde","actor_name":"Orelvis Lago","actor_username":"orelvis15@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-12-04 23:32:03.971801+00', ''),
	('00000000-0000-0000-0000-000000000000', '2c18d114-2c0b-489b-a73e-771fae89076d', '{"action":"token_refreshed","actor_id":"21083f4c-25a7-432d-a1ee-729f63c67cde","actor_name":"Orelvis Lago","actor_username":"orelvis15@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-05 03:34:11.343875+00', ''),
	('00000000-0000-0000-0000-000000000000', '18a1a993-15dc-47a8-9380-f982b07bda8a', '{"action":"token_revoked","actor_id":"21083f4c-25a7-432d-a1ee-729f63c67cde","actor_name":"Orelvis Lago","actor_username":"orelvis15@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-05 03:34:11.360193+00', ''),
	('00000000-0000-0000-0000-000000000000', '94b88d11-87c8-476b-b87a-92993a1c0e10', '{"action":"token_refreshed","actor_id":"21083f4c-25a7-432d-a1ee-729f63c67cde","actor_name":"Orelvis Lago","actor_username":"orelvis15@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-05 03:34:11.390829+00', ''),
	('00000000-0000-0000-0000-000000000000', '774e67e1-2ca8-4747-9dd3-3ca413e82739', '{"action":"token_refreshed","actor_id":"21083f4c-25a7-432d-a1ee-729f63c67cde","actor_name":"Orelvis Lago","actor_username":"orelvis15@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-05 03:34:11.615432+00', ''),
	('00000000-0000-0000-0000-000000000000', '23074d80-4c7f-4486-beef-7b904bcf270e', '{"action":"token_refreshed","actor_id":"21083f4c-25a7-432d-a1ee-729f63c67cde","actor_name":"Orelvis Lago","actor_username":"orelvis15@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-05 03:34:11.688355+00', ''),
	('00000000-0000-0000-0000-000000000000', '8c6ef629-0ab5-47c3-a8bc-c2c6087f3a1f', '{"action":"login","actor_id":"21083f4c-25a7-432d-a1ee-729f63c67cde","actor_name":"Orelvis Lago","actor_username":"orelvis15@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-12-05 03:34:13.881632+00', ''),
	('00000000-0000-0000-0000-000000000000', '381ca913-5956-4baf-90bb-934dff12645e', '{"action":"login","actor_id":"053ea79d-8b73-471a-8ec8-462990b64815","actor_name":"Orelvis Lago","actor_username":"orelvisdev@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-12-05 03:36:25.150954+00', ''),
	('00000000-0000-0000-0000-000000000000', 'cefd0ce7-bb94-4ebe-8738-398834b87fc2', '{"action":"token_refreshed","actor_id":"053ea79d-8b73-471a-8ec8-462990b64815","actor_name":"Orelvis Lago","actor_username":"orelvisdev@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-05 11:32:02.166846+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a2e53765-7214-4bcc-87c4-6acdc6db58c3', '{"action":"token_revoked","actor_id":"053ea79d-8b73-471a-8ec8-462990b64815","actor_name":"Orelvis Lago","actor_username":"orelvisdev@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-05 11:32:02.181465+00', ''),
	('00000000-0000-0000-0000-000000000000', '53f32403-439e-4ad8-a055-817239b3d0c4', '{"action":"token_refreshed","actor_id":"053ea79d-8b73-471a-8ec8-462990b64815","actor_name":"Orelvis Lago","actor_username":"orelvisdev@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-05 11:32:02.222403+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c382582d-02e7-4bbf-b86f-d33311f62b4e', '{"action":"token_refreshed","actor_id":"053ea79d-8b73-471a-8ec8-462990b64815","actor_name":"Orelvis Lago","actor_username":"orelvisdev@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-05 11:32:02.525132+00', ''),
	('00000000-0000-0000-0000-000000000000', '889cb8be-558b-442a-89b9-ec15e86effbe', '{"action":"token_refreshed","actor_id":"053ea79d-8b73-471a-8ec8-462990b64815","actor_name":"Orelvis Lago","actor_username":"orelvisdev@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-05 11:32:02.774236+00', ''),
	('00000000-0000-0000-0000-000000000000', '38af993f-3edf-489e-ae82-522a68349775', '{"action":"login","actor_id":"21083f4c-25a7-432d-a1ee-729f63c67cde","actor_name":"Orelvis Lago","actor_username":"orelvis15@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-12-05 11:32:04.8433+00', ''),
	('00000000-0000-0000-0000-000000000000', '19be6353-7bcb-427c-8a65-10f3317591ab', '{"action":"login","actor_id":"053ea79d-8b73-471a-8ec8-462990b64815","actor_name":"Orelvis Lago","actor_username":"orelvisdev@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-12-05 11:32:14.071772+00', ''),
	('00000000-0000-0000-0000-000000000000', '42b235ac-4059-4721-bf57-2f441fd843b9', '{"action":"token_refreshed","actor_id":"053ea79d-8b73-471a-8ec8-462990b64815","actor_name":"Orelvis Lago","actor_username":"orelvisdev@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-05 18:10:51.814405+00', ''),
	('00000000-0000-0000-0000-000000000000', '42eac7f7-003c-45ab-9688-6072ae216acc', '{"action":"token_revoked","actor_id":"053ea79d-8b73-471a-8ec8-462990b64815","actor_name":"Orelvis Lago","actor_username":"orelvisdev@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-05 18:10:51.827276+00', ''),
	('00000000-0000-0000-0000-000000000000', '80d678be-3eaa-434b-aacf-1e134c22a49f', '{"action":"token_refreshed","actor_id":"053ea79d-8b73-471a-8ec8-462990b64815","actor_name":"Orelvis Lago","actor_username":"orelvisdev@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-05 18:10:51.883242+00', ''),
	('00000000-0000-0000-0000-000000000000', '9641a803-d00f-46e8-a0cf-9b954ac661f7', '{"action":"login","actor_id":"053ea79d-8b73-471a-8ec8-462990b64815","actor_name":"Orelvis Lago","actor_username":"orelvisdev@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-12-05 18:10:57.264829+00', ''),
	('00000000-0000-0000-0000-000000000000', '5b74b9d0-b84b-492d-8981-3025a6dba30d', '{"action":"token_refreshed","actor_id":"053ea79d-8b73-471a-8ec8-462990b64815","actor_name":"Orelvis Lago","actor_username":"orelvisdev@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-06 03:22:52.296758+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e86f1b19-ac08-48cd-a57c-7e6d5d7d5e99', '{"action":"token_revoked","actor_id":"053ea79d-8b73-471a-8ec8-462990b64815","actor_name":"Orelvis Lago","actor_username":"orelvisdev@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-06 03:22:52.304692+00', ''),
	('00000000-0000-0000-0000-000000000000', '180210d8-d827-4293-8bb3-a04146a565ac', '{"action":"token_refreshed","actor_id":"053ea79d-8b73-471a-8ec8-462990b64815","actor_name":"Orelvis Lago","actor_username":"orelvisdev@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-12-06 03:22:52.326687+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fe14db27-5c79-43a7-a32a-ca01a832f3cc', '{"action":"login","actor_id":"053ea79d-8b73-471a-8ec8-462990b64815","actor_name":"Orelvis Lago","actor_username":"orelvisdev@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-12-06 03:22:57.112605+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a78be82a-e949-4e56-9305-baec124f7b82', '{"action":"login","actor_id":"053ea79d-8b73-471a-8ec8-462990b64815","actor_name":"Orelvis Lago","actor_username":"orelvisdev@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-12-06 03:23:33.404603+00', ''),
	('00000000-0000-0000-0000-000000000000', '83e98207-3996-4e45-a3b3-74142deb908c', '{"action":"login","actor_id":"053ea79d-8b73-471a-8ec8-462990b64815","actor_name":"Orelvis Lago","actor_username":"orelvisdev@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-12-06 03:23:50.091272+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f7969bc7-9b28-4ff7-a318-afc68dbeb38e', '{"action":"login","actor_id":"053ea79d-8b73-471a-8ec8-462990b64815","actor_name":"Orelvis Lago","actor_username":"orelvisdev@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-12-06 03:35:37.556749+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bac0fbcc-b4c1-4ff0-9daf-dd7f14421d10', '{"action":"login","actor_id":"053ea79d-8b73-471a-8ec8-462990b64815","actor_name":"Orelvis Lago","actor_username":"orelvisdev@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-12-06 03:38:58.878466+00', ''),
	('00000000-0000-0000-0000-000000000000', 'df7f6140-e48d-47b5-be8e-238088b2e12b', '{"action":"login","actor_id":"053ea79d-8b73-471a-8ec8-462990b64815","actor_name":"Orelvis Lago","actor_username":"orelvisdev@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-12-06 03:41:08.116239+00', ''),
	('00000000-0000-0000-0000-000000000000', '2f8f67de-5370-4c17-9326-ac5031192ea8', '{"action":"login","actor_id":"053ea79d-8b73-471a-8ec8-462990b64815","actor_name":"Orelvis Lago","actor_username":"orelvisdev@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-12-06 03:43:55.831431+00', '');


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."users" ("instance_id", "id", "aud", "role", "email", "encrypted_password", "email_confirmed_at", "invited_at", "confirmation_token", "confirmation_sent_at", "recovery_token", "recovery_sent_at", "email_change_token_new", "email_change", "email_change_sent_at", "last_sign_in_at", "raw_app_meta_data", "raw_user_meta_data", "is_super_admin", "created_at", "updated_at", "phone", "phone_confirmed_at", "phone_change", "phone_change_token", "phone_change_sent_at", "email_change_token_current", "email_change_confirm_status", "banned_until", "reauthentication_token", "reauthentication_sent_at", "is_sso_user", "deleted_at", "is_anonymous") VALUES
	('00000000-0000-0000-0000-000000000000', 'c4452582-c01c-4b17-aee7-346015cf648d', 'authenticated', 'authenticated', 'norivasallo@gmail.com', NULL, '2024-12-04 19:55:48.422934+00', NULL, '', NULL, '', NULL, '', '', NULL, '2024-12-04 23:30:18.327582+00', '{"provider": "google", "providers": ["google"]}', '{"iss": "https://accounts.google.com", "sub": "114668243557925794208", "name": "Noraida Vasallo Rodríguez", "email": "norivasallo@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocIWKOCIG2H1tbHBgzGL65n6cQc0mDrr6k6GcfEw1tOTC02a7A=s96-c", "full_name": "Noraida Vasallo Rodríguez", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocIWKOCIG2H1tbHBgzGL65n6cQc0mDrr6k6GcfEw1tOTC02a7A=s96-c", "provider_id": "114668243557925794208", "email_verified": true, "phone_verified": false}', NULL, '2024-12-04 19:55:48.417793+00', '2024-12-04 23:30:18.331482+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', '21083f4c-25a7-432d-a1ee-729f63c67cde', 'authenticated', 'authenticated', 'orelvis15@gmail.com', NULL, '2024-12-04 19:55:33.672693+00', NULL, '', NULL, '', NULL, '', '', NULL, '2024-12-05 11:32:04.844392+00', '{"provider": "google", "providers": ["google"]}', '{"iss": "https://accounts.google.com", "sub": "109409665575747619400", "name": "Orelvis Lago", "email": "orelvis15@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocJpJYFVruOZjY3MWQ07E0RaZAGn7XOdKN3b6Ayi9ubZyM2ZRxdH=s96-c", "full_name": "Orelvis Lago", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocJpJYFVruOZjY3MWQ07E0RaZAGn7XOdKN3b6Ayi9ubZyM2ZRxdH=s96-c", "provider_id": "109409665575747619400", "email_verified": true, "phone_verified": false}', NULL, '2024-12-04 19:55:33.633219+00', '2024-12-05 11:32:04.851659+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', '1ca2c474-54a5-4db2-a219-6282d660b617', 'authenticated', 'authenticated', 'keviwid121@jonespal.com', '$2a$10$WgP3tjnkQmEoGW2B7LBRDOWFhf32jmum.0dj1b9sjQrQhUR42LRuW', '2024-12-01 20:41:54.878399+00', NULL, '', NULL, '', NULL, '', '', NULL, NULL, '{"provider": "email", "providers": ["email"]}', '{}', NULL, '2024-12-01 20:41:54.872843+00', '2024-12-01 20:41:54.878603+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', '3bfde56c-6f5e-4f1f-ae2a-de24d2f470d4', 'authenticated', 'authenticated', 'nawicon985@kazvi.com', '$2a$10$ezWTeyI9HuJOWWfLu0TTOu6DPKg4UEEQeFIckySc3m1DZS3gr2x6O', '2024-11-26 05:03:10.287198+00', '2024-11-26 05:02:46.848237+00', '', NULL, '', '2024-11-26 05:21:08.364617+00', '', '', NULL, '2024-11-26 05:21:36.633401+00', '{"provider": "email", "providers": ["email"]}', '{}', NULL, '2024-11-26 05:02:46.792422+00', '2024-12-01 05:27:56.945929+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', '053ea79d-8b73-471a-8ec8-462990b64815', 'authenticated', 'authenticated', 'orelvisdev@gmail.com', NULL, '2024-11-18 17:26:39.639926+00', NULL, '', NULL, '', NULL, '', '', NULL, '2024-12-06 03:43:55.834478+00', '{"provider": "google", "providers": ["google"]}', '{"iss": "https://accounts.google.com", "sub": "113022781263694874158", "name": "Orelvis Lago", "email": "orelvisdev@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocK9VH_YTCxUqTBt5HEwLHJqdnzT-5UDZeaOjG8sPbZEG-EXhw=s96-c", "full_name": "Orelvis Lago", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocK9VH_YTCxUqTBt5HEwLHJqdnzT-5UDZeaOjG8sPbZEG-EXhw=s96-c", "provider_id": "113022781263694874158", "email_verified": true, "phone_verified": false}', NULL, '2024-11-18 17:26:39.617568+00', '2024-12-06 03:43:55.842611+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', '5f206c96-c10c-4ac9-a607-3dc55d76ce9f', 'authenticated', 'authenticated', 'javierpacareu@gmail.com', '$2a$10$ga0uXyeW29G4SGvkkJUPZeJCenTWO0ELJrJRdivb1SKwpnnmJVGYi', '2024-11-13 23:53:06.094413+00', NULL, '', NULL, '', NULL, '', '', NULL, '2024-12-01 21:05:48.426551+00', '{"provider": "email", "providers": ["email"]}', '{}', NULL, '2024-11-13 23:53:06.057554+00', '2024-12-03 05:08:15.621977+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false);


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."identities" ("provider_id", "user_id", "identity_data", "provider", "last_sign_in_at", "created_at", "updated_at", "id") VALUES
	('5f206c96-c10c-4ac9-a607-3dc55d76ce9f', '5f206c96-c10c-4ac9-a607-3dc55d76ce9f', '{"sub": "5f206c96-c10c-4ac9-a607-3dc55d76ce9f", "email": "javierpacareu@gmail.com", "email_verified": false, "phone_verified": false}', 'email', '2024-11-13 23:53:06.080177+00', '2024-11-13 23:53:06.081212+00', '2024-11-13 23:53:06.081212+00', 'cac0797f-eb7c-49a3-ba6a-de837edca0b1'),
	('114668243557925794208', 'c4452582-c01c-4b17-aee7-346015cf648d', '{"iss": "https://accounts.google.com", "sub": "114668243557925794208", "name": "Noraida Vasallo Rodríguez", "email": "norivasallo@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocIWKOCIG2H1tbHBgzGL65n6cQc0mDrr6k6GcfEw1tOTC02a7A=s96-c", "full_name": "Noraida Vasallo Rodríguez", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocIWKOCIG2H1tbHBgzGL65n6cQc0mDrr6k6GcfEw1tOTC02a7A=s96-c", "provider_id": "114668243557925794208", "email_verified": true, "phone_verified": false}', 'google', '2024-12-04 19:55:48.420158+00', '2024-12-04 19:55:48.420216+00', '2024-12-04 23:30:18.323216+00', '497b29b7-0a51-4295-ab64-d1669a968e64'),
	('3bfde56c-6f5e-4f1f-ae2a-de24d2f470d4', '3bfde56c-6f5e-4f1f-ae2a-de24d2f470d4', '{"sub": "3bfde56c-6f5e-4f1f-ae2a-de24d2f470d4", "email": "nawicon985@kazvi.com", "email_verified": false, "phone_verified": false}', 'email', '2024-11-26 05:02:46.825878+00', '2024-11-26 05:02:46.826515+00', '2024-11-26 05:02:46.826515+00', '0257cb7f-2f0b-4ba0-8c14-39a02c0554ce'),
	('1ca2c474-54a5-4db2-a219-6282d660b617', '1ca2c474-54a5-4db2-a219-6282d660b617', '{"sub": "1ca2c474-54a5-4db2-a219-6282d660b617", "email": "keviwid121@jonespal.com", "email_verified": false, "phone_verified": false}', 'email', '2024-12-01 20:41:54.876461+00', '2024-12-01 20:41:54.876511+00', '2024-12-01 20:41:54.876511+00', 'a8ca9cbb-409b-4423-88e1-65c6de9d2d8c'),
	('109409665575747619400', '21083f4c-25a7-432d-a1ee-729f63c67cde', '{"iss": "https://accounts.google.com", "sub": "109409665575747619400", "name": "Orelvis Lago", "email": "orelvis15@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocJpJYFVruOZjY3MWQ07E0RaZAGn7XOdKN3b6Ayi9ubZyM2ZRxdH=s96-c", "full_name": "Orelvis Lago", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocJpJYFVruOZjY3MWQ07E0RaZAGn7XOdKN3b6Ayi9ubZyM2ZRxdH=s96-c", "provider_id": "109409665575747619400", "email_verified": true, "phone_verified": false}', 'google', '2024-12-04 19:55:33.663499+00', '2024-12-04 19:55:33.663553+00', '2024-12-05 11:32:04.834327+00', 'a672448b-35ec-4048-8aaf-47974a217a2e'),
	('113022781263694874158', '053ea79d-8b73-471a-8ec8-462990b64815', '{"iss": "https://accounts.google.com", "sub": "113022781263694874158", "name": "Orelvis Lago", "email": "orelvisdev@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocK9VH_YTCxUqTBt5HEwLHJqdnzT-5UDZeaOjG8sPbZEG-EXhw=s96-c", "full_name": "Orelvis Lago", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocK9VH_YTCxUqTBt5HEwLHJqdnzT-5UDZeaOjG8sPbZEG-EXhw=s96-c", "provider_id": "113022781263694874158", "email_verified": true, "phone_verified": false}', 'google', '2024-11-18 17:26:39.63341+00', '2024-11-18 17:26:39.633461+00', '2024-12-06 03:43:55.827125+00', 'dd2ba0dc-5f3a-4778-99be-4db5c0f4e78f');


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."sessions" ("id", "user_id", "created_at", "updated_at", "factor_id", "aal", "not_after", "refreshed_at", "user_agent", "ip", "tag") VALUES
	('4975305e-a128-4878-bbfe-ae6fb02d6e67', '21083f4c-25a7-432d-a1ee-729f63c67cde', '2024-12-04 20:46:49.143516+00', '2024-12-04 20:46:49.143516+00', NULL, 'aal1', NULL, NULL, 'ktor-client', '107.127.0.76', NULL),
	('8e8baf6a-7995-4b78-8945-1552ac161952', '21083f4c-25a7-432d-a1ee-729f63c67cde', '2024-12-04 20:51:23.330427+00', '2024-12-04 20:51:23.330427+00', NULL, 'aal1', NULL, NULL, 'ktor-client', '107.127.0.76', NULL),
	('d96fd8bd-3c67-452e-8b69-f2a64d039b9b', '21083f4c-25a7-432d-a1ee-729f63c67cde', '2024-12-04 20:55:55.570891+00', '2024-12-04 20:55:55.570891+00', NULL, 'aal1', NULL, NULL, 'ktor-client', '107.127.0.76', NULL),
	('5744f0c2-da3c-4c59-a830-3a29b152a265', '053ea79d-8b73-471a-8ec8-462990b64815', '2024-12-04 20:56:11.499433+00', '2024-12-04 20:56:11.499433+00', NULL, 'aal1', NULL, NULL, 'ktor-client', '107.127.0.76', NULL),
	('cfb93748-8201-4273-a538-4e82af33b060', '21083f4c-25a7-432d-a1ee-729f63c67cde', '2024-12-04 21:05:53.624332+00', '2024-12-04 21:05:53.624332+00', NULL, 'aal1', NULL, NULL, 'ktor-client', '107.127.0.76', NULL),
	('8a15ff95-a764-4d1b-9223-eec745e5336f', '053ea79d-8b73-471a-8ec8-462990b64815', '2024-11-18 17:26:39.642687+00', '2024-11-18 17:26:39.642687+00', NULL, 'aal1', NULL, NULL, 'ktor-client', '64.201.138.246', NULL),
	('89776e59-1ad0-417a-b117-618bab20baf5', '21083f4c-25a7-432d-a1ee-729f63c67cde', '2024-12-04 21:43:49.343034+00', '2024-12-04 23:27:10.357432+00', NULL, 'aal1', NULL, '2024-12-04 23:27:10.357347', 'ktor-client', '184.92.249.162', NULL),
	('b0a8bfb9-f7ab-4bbe-ac59-30660f099bae', '21083f4c-25a7-432d-a1ee-729f63c67cde', '2024-12-04 23:29:55.009866+00', '2024-12-04 23:29:55.009866+00', NULL, 'aal1', NULL, NULL, 'ktor-client', '184.92.249.162', NULL),
	('baf1ef8d-baba-4ab8-bc48-7773fd5a3d1a', 'c4452582-c01c-4b17-aee7-346015cf648d', '2024-12-04 23:30:18.327657+00', '2024-12-04 23:30:18.327657+00', NULL, 'aal1', NULL, NULL, 'ktor-client', '184.92.249.162', NULL),
	('97a80a15-93a4-4b32-814c-a66f6efb345b', '3bfde56c-6f5e-4f1f-ae2a-de24d2f470d4', '2024-11-26 05:03:10.290836+00', '2024-11-26 05:03:10.290836+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', '68.8.77.173', NULL),
	('241565ff-236e-4c3e-855c-899ffdcfda29', '3bfde56c-6f5e-4f1f-ae2a-de24d2f470d4', '2024-11-26 05:09:10.126058+00', '2024-11-26 05:09:10.126058+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', '68.8.77.173', NULL),
	('8f43e4ff-ef42-48b7-b599-bd4496622e1e', '3bfde56c-6f5e-4f1f-ae2a-de24d2f470d4', '2024-11-26 05:13:20.184552+00', '2024-11-26 05:13:20.184552+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', '68.8.77.173', NULL),
	('8cd74341-b949-4132-86dc-25d3d37b7631', '3bfde56c-6f5e-4f1f-ae2a-de24d2f470d4', '2024-11-26 05:21:36.63347+00', '2024-12-01 05:27:56.954168+00', NULL, 'aal1', NULL, '2024-12-01 05:27:56.953469', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', '68.8.77.173', NULL),
	('dcc4638d-64db-47b7-91bf-273cf1677053', '21083f4c-25a7-432d-a1ee-729f63c67cde', '2024-12-04 23:32:03.972696+00', '2024-12-05 03:34:11.689484+00', NULL, 'aal1', NULL, '2024-12-05 03:34:11.689416', 'ktor-client', '184.92.249.162', NULL),
	('51678cc1-1693-4e89-bd70-ba433d2ad773', '21083f4c-25a7-432d-a1ee-729f63c67cde', '2024-12-05 03:34:13.883625+00', '2024-12-05 03:34:13.883625+00', NULL, 'aal1', NULL, NULL, 'ktor-client', '184.92.249.162', NULL),
	('60b0914f-4f93-4951-9099-4637dbcf6cf9', '5f206c96-c10c-4ac9-a607-3dc55d76ce9f', '2024-12-01 21:05:48.426617+00', '2024-12-03 05:08:15.62849+00', NULL, 'aal1', NULL, '2024-12-03 05:08:15.627741', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', '68.8.77.173', NULL),
	('7b81af76-aa4a-45ef-b7c0-83de8c243330', '21083f4c-25a7-432d-a1ee-729f63c67cde', '2024-12-04 19:55:33.676305+00', '2024-12-04 19:55:33.676305+00', NULL, 'aal1', NULL, NULL, 'ktor-client', '107.127.0.76', NULL),
	('013e240b-59a9-4509-9d7e-06c485bb87e1', '053ea79d-8b73-471a-8ec8-462990b64815', '2024-12-04 19:55:44.126185+00', '2024-12-04 19:55:44.126185+00', NULL, 'aal1', NULL, NULL, 'ktor-client', '107.127.0.76', NULL),
	('a1e58a4e-2a73-48fb-8528-35d8ba247ecb', 'c4452582-c01c-4b17-aee7-346015cf648d', '2024-12-04 19:55:48.423708+00', '2024-12-04 19:55:48.423708+00', NULL, 'aal1', NULL, NULL, 'ktor-client', '107.127.0.76', NULL),
	('93393ec5-fa9b-42f4-ba00-1b060dfff173', '21083f4c-25a7-432d-a1ee-729f63c67cde', '2024-12-04 20:00:03.588234+00', '2024-12-04 20:00:03.588234+00', NULL, 'aal1', NULL, NULL, 'ktor-client', '107.127.0.76', NULL),
	('75791514-1495-4889-a3bf-9f05d95d9f1e', '21083f4c-25a7-432d-a1ee-729f63c67cde', '2024-12-04 20:01:47.465897+00', '2024-12-04 20:01:47.465897+00', NULL, 'aal1', NULL, NULL, 'ktor-client', '107.127.0.76', NULL),
	('728a7ac3-1b58-47e1-bbde-4fa6fe8db4a3', '21083f4c-25a7-432d-a1ee-729f63c67cde', '2024-12-04 20:03:37.73905+00', '2024-12-04 20:03:37.73905+00', NULL, 'aal1', NULL, NULL, 'ktor-client', '107.127.0.76', NULL),
	('da54753e-ee4f-4034-8156-b19db0688237', '21083f4c-25a7-432d-a1ee-729f63c67cde', '2024-12-04 20:26:03.410476+00', '2024-12-04 20:26:03.410476+00', NULL, 'aal1', NULL, NULL, 'ktor-client', '107.127.0.76', NULL),
	('35f98628-b52a-4183-97d4-eeefc0a845f0', '053ea79d-8b73-471a-8ec8-462990b64815', '2024-12-05 03:36:25.15181+00', '2024-12-05 11:32:02.776117+00', NULL, 'aal1', NULL, '2024-12-05 11:32:02.776041', 'ktor-client', '184.92.249.162', NULL),
	('0636f00a-ed10-4078-acec-b3cc5ba20fea', '21083f4c-25a7-432d-a1ee-729f63c67cde', '2024-12-05 11:32:04.845082+00', '2024-12-05 11:32:04.845082+00', NULL, 'aal1', NULL, NULL, 'ktor-client', '184.92.249.162', NULL),
	('f03eb74e-2bbe-42f5-a686-62a89a4b6fd2', '053ea79d-8b73-471a-8ec8-462990b64815', '2024-12-05 18:10:57.26624+00', '2024-12-05 18:10:57.26624+00', NULL, 'aal1', NULL, NULL, 'ktor-client', '64.201.138.246', NULL),
	('13b31450-b3a4-49a6-9b0c-931395c2761b', '053ea79d-8b73-471a-8ec8-462990b64815', '2024-12-05 11:32:14.072418+00', '2024-12-06 03:22:52.328281+00', NULL, 'aal1', NULL, '2024-12-06 03:22:52.328204', 'ktor-client', '184.92.249.162', NULL),
	('bd3bdc8a-2084-4731-8e4f-c9c9d05781c4', '053ea79d-8b73-471a-8ec8-462990b64815', '2024-12-06 03:22:57.114014+00', '2024-12-06 03:22:57.114014+00', NULL, 'aal1', NULL, NULL, 'ktor-client', '184.92.249.162', NULL),
	('10a1382f-803c-4549-8f20-b2b4a7a0ef36', '053ea79d-8b73-471a-8ec8-462990b64815', '2024-12-06 03:23:33.405296+00', '2024-12-06 03:23:33.405296+00', NULL, 'aal1', NULL, NULL, 'ktor-client', '184.92.249.162', NULL),
	('a31a6c1a-e90c-4995-9cec-8e146a97dbcd', '053ea79d-8b73-471a-8ec8-462990b64815', '2024-12-06 03:23:50.091922+00', '2024-12-06 03:23:50.091922+00', NULL, 'aal1', NULL, NULL, 'ktor-client', '184.92.249.162', NULL),
	('2099862f-e9b7-4e43-a25a-4d674df74439', '053ea79d-8b73-471a-8ec8-462990b64815', '2024-12-06 03:35:37.559913+00', '2024-12-06 03:35:37.559913+00', NULL, 'aal1', NULL, NULL, 'ktor-client', '184.92.249.162', NULL),
	('dfc8d57a-98d8-4940-b299-c5b24ae74f63', '053ea79d-8b73-471a-8ec8-462990b64815', '2024-12-06 03:38:58.880574+00', '2024-12-06 03:38:58.880574+00', NULL, 'aal1', NULL, NULL, 'ktor-client', '184.92.249.162', NULL),
	('61845ae3-92b0-44ba-83cb-cd6c3a73dcfa', '053ea79d-8b73-471a-8ec8-462990b64815', '2024-12-06 03:41:08.117172+00', '2024-12-06 03:41:08.117172+00', NULL, 'aal1', NULL, NULL, 'ktor-client', '184.92.249.162', NULL),
	('3da3b8eb-2eb7-46be-9a48-7c87ff9b4329', '053ea79d-8b73-471a-8ec8-462990b64815', '2024-12-06 03:43:55.834547+00', '2024-12-06 03:43:55.834547+00', NULL, 'aal1', NULL, NULL, 'ktor-client', '184.92.249.162', NULL);


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."mfa_amr_claims" ("session_id", "created_at", "updated_at", "authentication_method", "id") VALUES
	('8a15ff95-a764-4d1b-9223-eec745e5336f', '2024-11-18 17:26:39.653776+00', '2024-11-18 17:26:39.653776+00', 'oauth', '3cb67976-75c9-437b-8a98-6c85961940a6'),
	('97a80a15-93a4-4b32-814c-a66f6efb345b', '2024-11-26 05:03:10.312018+00', '2024-11-26 05:03:10.312018+00', 'otp', '0fde368f-d066-4243-a696-d8b097400259'),
	('241565ff-236e-4c3e-855c-899ffdcfda29', '2024-11-26 05:09:10.129278+00', '2024-11-26 05:09:10.129278+00', 'otp', '98ebe850-5d23-4019-a144-da6ef3a9f083'),
	('8f43e4ff-ef42-48b7-b599-bd4496622e1e', '2024-11-26 05:13:20.188817+00', '2024-11-26 05:13:20.188817+00', 'otp', '7cdfbe84-3008-4a8d-93ac-74b2f8ba51cb'),
	('8cd74341-b949-4132-86dc-25d3d37b7631', '2024-11-26 05:21:36.636361+00', '2024-11-26 05:21:36.636361+00', 'otp', '728dee6d-6a04-44dd-ba31-5272bde0f63b'),
	('60b0914f-4f93-4951-9099-4637dbcf6cf9', '2024-12-01 21:05:48.429019+00', '2024-12-01 21:05:48.429019+00', 'password', 'dc0ee3ed-8862-4a7b-a3ab-fec14ba99712'),
	('7b81af76-aa4a-45ef-b7c0-83de8c243330', '2024-12-04 19:55:33.698832+00', '2024-12-04 19:55:33.698832+00', 'oauth', 'e07aa0cd-38ca-4ff1-b81d-07869f077742'),
	('013e240b-59a9-4509-9d7e-06c485bb87e1', '2024-12-04 19:55:44.129596+00', '2024-12-04 19:55:44.129596+00', 'oauth', '9313284e-0b19-4f8e-a648-92d834b918a9'),
	('a1e58a4e-2a73-48fb-8528-35d8ba247ecb', '2024-12-04 19:55:48.425415+00', '2024-12-04 19:55:48.425415+00', 'oauth', '7d04b570-8964-41bf-b0a6-70dcf04d2591'),
	('93393ec5-fa9b-42f4-ba00-1b060dfff173', '2024-12-04 20:00:03.590747+00', '2024-12-04 20:00:03.590747+00', 'oauth', '2f021c05-403e-4bc2-94ae-bbb9cf25d0b5'),
	('75791514-1495-4889-a3bf-9f05d95d9f1e', '2024-12-04 20:01:47.469059+00', '2024-12-04 20:01:47.469059+00', 'oauth', 'd5c5d0c5-7672-4e16-925d-8b2ab3772bf4'),
	('728a7ac3-1b58-47e1-bbde-4fa6fe8db4a3', '2024-12-04 20:03:37.74179+00', '2024-12-04 20:03:37.74179+00', 'oauth', '2d461e9c-46f8-4f7c-addf-bb6c492b6fcb'),
	('da54753e-ee4f-4034-8156-b19db0688237', '2024-12-04 20:26:03.413627+00', '2024-12-04 20:26:03.413627+00', 'oauth', '7114fa40-7969-4ea5-b6f6-fd22b68e599c'),
	('4975305e-a128-4878-bbfe-ae6fb02d6e67', '2024-12-04 20:46:49.146843+00', '2024-12-04 20:46:49.146843+00', 'oauth', '8e9d6424-fc3c-4780-8054-575d781dc869'),
	('8e8baf6a-7995-4b78-8945-1552ac161952', '2024-12-04 20:51:23.333087+00', '2024-12-04 20:51:23.333087+00', 'oauth', '41c2bebf-6332-4741-be6c-350aea89da74'),
	('d96fd8bd-3c67-452e-8b69-f2a64d039b9b', '2024-12-04 20:55:55.57357+00', '2024-12-04 20:55:55.57357+00', 'oauth', '931ee1d8-a2b7-4f12-b0ed-199ec5712df9'),
	('5744f0c2-da3c-4c59-a830-3a29b152a265', '2024-12-04 20:56:11.501207+00', '2024-12-04 20:56:11.501207+00', 'oauth', '05267272-8de3-48ef-8315-b682ec778ee2'),
	('cfb93748-8201-4273-a538-4e82af33b060', '2024-12-04 21:05:53.627092+00', '2024-12-04 21:05:53.627092+00', 'oauth', '2c9544c0-94ae-4879-9a3a-5957131ff053'),
	('89776e59-1ad0-417a-b117-618bab20baf5', '2024-12-04 21:43:49.34565+00', '2024-12-04 21:43:49.34565+00', 'oauth', '8734278e-cf80-4a76-8d3f-a237dc342763'),
	('b0a8bfb9-f7ab-4bbe-ac59-30660f099bae', '2024-12-04 23:29:55.012417+00', '2024-12-04 23:29:55.012417+00', 'oauth', '2b31a1e9-5af5-4ff3-b404-a1ea0e5b91d3'),
	('baf1ef8d-baba-4ab8-bc48-7773fd5a3d1a', '2024-12-04 23:30:18.331755+00', '2024-12-04 23:30:18.331755+00', 'oauth', '81be7ba1-ed58-4daa-9749-08dab0d2c5da'),
	('dcc4638d-64db-47b7-91bf-273cf1677053', '2024-12-04 23:32:03.975432+00', '2024-12-04 23:32:03.975432+00', 'oauth', '4e26378f-5beb-42d2-8932-9405ef957626'),
	('51678cc1-1693-4e89-bd70-ba433d2ad773', '2024-12-05 03:34:13.888472+00', '2024-12-05 03:34:13.888472+00', 'oauth', '18d6a941-7e19-46e7-ae09-4aeed5a8d57f'),
	('35f98628-b52a-4183-97d4-eeefc0a845f0', '2024-12-05 03:36:25.155573+00', '2024-12-05 03:36:25.155573+00', 'oauth', '5d5175e7-f655-4526-bac6-ff1d3e092677'),
	('0636f00a-ed10-4078-acec-b3cc5ba20fea', '2024-12-05 11:32:04.851933+00', '2024-12-05 11:32:04.851933+00', 'oauth', '29d17bb2-5592-4910-8a88-5e9129277c3d'),
	('13b31450-b3a4-49a6-9b0c-931395c2761b', '2024-12-05 11:32:14.074185+00', '2024-12-05 11:32:14.074185+00', 'oauth', '6dae4c12-7a1f-4014-a748-c1616bae5df6'),
	('f03eb74e-2bbe-42f5-a686-62a89a4b6fd2', '2024-12-05 18:10:57.270898+00', '2024-12-05 18:10:57.270898+00', 'oauth', '4441ece1-4928-4c13-9d44-94ba3a95400d'),
	('bd3bdc8a-2084-4731-8e4f-c9c9d05781c4', '2024-12-06 03:22:57.120603+00', '2024-12-06 03:22:57.120603+00', 'oauth', 'e377fe16-a371-4068-9319-4241a9fd9230'),
	('10a1382f-803c-4549-8f20-b2b4a7a0ef36', '2024-12-06 03:23:33.407819+00', '2024-12-06 03:23:33.407819+00', 'oauth', '8d23db70-42da-49e3-833f-55f58ba311e0'),
	('a31a6c1a-e90c-4995-9cec-8e146a97dbcd', '2024-12-06 03:23:50.094209+00', '2024-12-06 03:23:50.094209+00', 'oauth', 'b12e1983-d164-425a-9e1f-7352f4f4d29f'),
	('2099862f-e9b7-4e43-a25a-4d674df74439', '2024-12-06 03:35:37.567838+00', '2024-12-06 03:35:37.567838+00', 'oauth', '0d26ad62-4fe4-4428-bdc7-4e93eef6b54e'),
	('dfc8d57a-98d8-4940-b299-c5b24ae74f63', '2024-12-06 03:38:58.885733+00', '2024-12-06 03:38:58.885733+00', 'oauth', '0d9d9edf-d6bf-4ca1-8a76-30e171d97e67'),
	('61845ae3-92b0-44ba-83cb-cd6c3a73dcfa', '2024-12-06 03:41:08.119732+00', '2024-12-06 03:41:08.119732+00', 'oauth', '8cbcdd5c-6b86-49b5-b6a1-277cd95c58c9'),
	('3da3b8eb-2eb7-46be-9a48-7c87ff9b4329', '2024-12-06 03:43:55.843017+00', '2024-12-06 03:43:55.843017+00', 'oauth', '438ad3c2-18eb-43a6-a19f-a533d5b08cae');


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
	('00000000-0000-0000-0000-000000000000', 8, '1qut53Bejy-M5OLCGAAjpg', '053ea79d-8b73-471a-8ec8-462990b64815', false, '2024-11-18 17:26:39.6475+00', '2024-11-18 17:26:39.6475+00', NULL, '8a15ff95-a764-4d1b-9223-eec745e5336f'),
	('00000000-0000-0000-0000-000000000000', 16, 'FG0_BmtkuXsa9ZYxXsSpKg', '3bfde56c-6f5e-4f1f-ae2a-de24d2f470d4', false, '2024-11-26 05:03:10.294929+00', '2024-11-26 05:03:10.294929+00', NULL, '97a80a15-93a4-4b32-814c-a66f6efb345b'),
	('00000000-0000-0000-0000-000000000000', 17, 'sH9ZYzrbJZdWywfSfqq39g', '3bfde56c-6f5e-4f1f-ae2a-de24d2f470d4', false, '2024-11-26 05:09:10.126995+00', '2024-11-26 05:09:10.126995+00', NULL, '241565ff-236e-4c3e-855c-899ffdcfda29'),
	('00000000-0000-0000-0000-000000000000', 18, 'rOhTCHDqnvvHnsMdWVTrZw', '3bfde56c-6f5e-4f1f-ae2a-de24d2f470d4', false, '2024-11-26 05:13:20.186671+00', '2024-11-26 05:13:20.186671+00', NULL, '8f43e4ff-ef42-48b7-b599-bd4496622e1e'),
	('00000000-0000-0000-0000-000000000000', 19, 'OUznpD-R_B4UNb_gn9il3g', '3bfde56c-6f5e-4f1f-ae2a-de24d2f470d4', true, '2024-11-26 05:21:36.634264+00', '2024-11-26 06:22:25.222299+00', NULL, '8cd74341-b949-4132-86dc-25d3d37b7631'),
	('00000000-0000-0000-0000-000000000000', 20, 'l2Z0Hl2xcHgRV24w6cxcVw', '3bfde56c-6f5e-4f1f-ae2a-de24d2f470d4', true, '2024-11-26 06:22:25.225691+00', '2024-11-27 05:16:47.660161+00', 'OUznpD-R_B4UNb_gn9il3g', '8cd74341-b949-4132-86dc-25d3d37b7631'),
	('00000000-0000-0000-0000-000000000000', 21, 'f9vAMZX8Rsp4ILs7IrkbLA', '3bfde56c-6f5e-4f1f-ae2a-de24d2f470d4', true, '2024-11-27 05:16:47.668243+00', '2024-11-28 18:00:21.455075+00', 'l2Z0Hl2xcHgRV24w6cxcVw', '8cd74341-b949-4132-86dc-25d3d37b7631'),
	('00000000-0000-0000-0000-000000000000', 22, 'IATys2inQgWzcbB0e4YsLw', '3bfde56c-6f5e-4f1f-ae2a-de24d2f470d4', true, '2024-11-28 18:00:21.473476+00', '2024-12-01 05:27:56.934654+00', 'f9vAMZX8Rsp4ILs7IrkbLA', '8cd74341-b949-4132-86dc-25d3d37b7631'),
	('00000000-0000-0000-0000-000000000000', 23, 'wpkmyCy1dm_oArIESIZ_Ag', '3bfde56c-6f5e-4f1f-ae2a-de24d2f470d4', false, '2024-12-01 05:27:56.943384+00', '2024-12-01 05:27:56.943384+00', 'IATys2inQgWzcbB0e4YsLw', '8cd74341-b949-4132-86dc-25d3d37b7631'),
	('00000000-0000-0000-0000-000000000000', 29, 'fiXerlzzhiGF2XZn6Qzduw', '5f206c96-c10c-4ac9-a607-3dc55d76ce9f', true, '2024-12-01 21:05:48.427454+00', '2024-12-02 05:04:17.149803+00', NULL, '60b0914f-4f93-4951-9099-4637dbcf6cf9'),
	('00000000-0000-0000-0000-000000000000', 30, '4RxihTQEuByS0VWGe7vkCw', '5f206c96-c10c-4ac9-a607-3dc55d76ce9f', true, '2024-12-02 05:04:17.151296+00', '2024-12-03 05:08:15.6118+00', 'fiXerlzzhiGF2XZn6Qzduw', '60b0914f-4f93-4951-9099-4637dbcf6cf9'),
	('00000000-0000-0000-0000-000000000000', 31, 'G0xzZdbSS2tJicGCevXt-g', '5f206c96-c10c-4ac9-a607-3dc55d76ce9f', false, '2024-12-03 05:08:15.619825+00', '2024-12-03 05:08:15.619825+00', '4RxihTQEuByS0VWGe7vkCw', '60b0914f-4f93-4951-9099-4637dbcf6cf9'),
	('00000000-0000-0000-0000-000000000000', 32, 'xh8vc62JujjUxRtd7kWPcQ', '21083f4c-25a7-432d-a1ee-729f63c67cde', false, '2024-12-04 19:55:33.68532+00', '2024-12-04 19:55:33.68532+00', NULL, '7b81af76-aa4a-45ef-b7c0-83de8c243330'),
	('00000000-0000-0000-0000-000000000000', 33, 'ow-2bM76G1z3yciw0CDMkw', '053ea79d-8b73-471a-8ec8-462990b64815', false, '2024-12-04 19:55:44.128412+00', '2024-12-04 19:55:44.128412+00', NULL, '013e240b-59a9-4509-9d7e-06c485bb87e1'),
	('00000000-0000-0000-0000-000000000000', 34, 'XlUWYktjhnokb0dKfAn3jg', 'c4452582-c01c-4b17-aee7-346015cf648d', false, '2024-12-04 19:55:48.424335+00', '2024-12-04 19:55:48.424335+00', NULL, 'a1e58a4e-2a73-48fb-8528-35d8ba247ecb'),
	('00000000-0000-0000-0000-000000000000', 35, '0-AUXM5q9ewsYm7tqIDrsA', '21083f4c-25a7-432d-a1ee-729f63c67cde', false, '2024-12-04 20:00:03.589141+00', '2024-12-04 20:00:03.589141+00', NULL, '93393ec5-fa9b-42f4-ba00-1b060dfff173'),
	('00000000-0000-0000-0000-000000000000', 36, 'x42IG46ktV9aGb-kd8o7Ig', '21083f4c-25a7-432d-a1ee-729f63c67cde', false, '2024-12-04 20:01:47.467397+00', '2024-12-04 20:01:47.467397+00', NULL, '75791514-1495-4889-a3bf-9f05d95d9f1e'),
	('00000000-0000-0000-0000-000000000000', 37, 'FqPixzk67v5swb5VLJIdow', '21083f4c-25a7-432d-a1ee-729f63c67cde', false, '2024-12-04 20:03:37.740024+00', '2024-12-04 20:03:37.740024+00', NULL, '728a7ac3-1b58-47e1-bbde-4fa6fe8db4a3'),
	('00000000-0000-0000-0000-000000000000', 38, 'YIghl-jmRuQsT-dCe5TqMg', '21083f4c-25a7-432d-a1ee-729f63c67cde', false, '2024-12-04 20:26:03.411431+00', '2024-12-04 20:26:03.411431+00', NULL, 'da54753e-ee4f-4034-8156-b19db0688237'),
	('00000000-0000-0000-0000-000000000000', 39, '139CIdJ1Ujo67bjAX26-MQ', '21083f4c-25a7-432d-a1ee-729f63c67cde', false, '2024-12-04 20:46:49.144485+00', '2024-12-04 20:46:49.144485+00', NULL, '4975305e-a128-4878-bbfe-ae6fb02d6e67'),
	('00000000-0000-0000-0000-000000000000', 40, 'LC_ZdYm1vrWShHn_TnDXiQ', '21083f4c-25a7-432d-a1ee-729f63c67cde', false, '2024-12-04 20:51:23.33136+00', '2024-12-04 20:51:23.33136+00', NULL, '8e8baf6a-7995-4b78-8945-1552ac161952'),
	('00000000-0000-0000-0000-000000000000', 41, 'ux5R0EMCy2zmXdHtySlP0Q', '21083f4c-25a7-432d-a1ee-729f63c67cde', false, '2024-12-04 20:55:55.571892+00', '2024-12-04 20:55:55.571892+00', NULL, 'd96fd8bd-3c67-452e-8b69-f2a64d039b9b'),
	('00000000-0000-0000-0000-000000000000', 42, 'zsbjf9cY26o02AqcD9lXAA', '053ea79d-8b73-471a-8ec8-462990b64815', false, '2024-12-04 20:56:11.500079+00', '2024-12-04 20:56:11.500079+00', NULL, '5744f0c2-da3c-4c59-a830-3a29b152a265'),
	('00000000-0000-0000-0000-000000000000', 43, 'SC6NA7fmykCQNUCIABNZ3A', '21083f4c-25a7-432d-a1ee-729f63c67cde', false, '2024-12-04 21:05:53.625356+00', '2024-12-04 21:05:53.625356+00', NULL, 'cfb93748-8201-4273-a538-4e82af33b060'),
	('00000000-0000-0000-0000-000000000000', 44, '0qyqChjwQXu3F2x4c6i1Tw', '21083f4c-25a7-432d-a1ee-729f63c67cde', true, '2024-12-04 21:43:49.343998+00', '2024-12-04 23:27:10.33497+00', NULL, '89776e59-1ad0-417a-b117-618bab20baf5'),
	('00000000-0000-0000-0000-000000000000', 45, '60KgyMo7Lu4iopwfSHiibg', '21083f4c-25a7-432d-a1ee-729f63c67cde', false, '2024-12-04 23:27:10.336594+00', '2024-12-04 23:27:10.336594+00', '0qyqChjwQXu3F2x4c6i1Tw', '89776e59-1ad0-417a-b117-618bab20baf5'),
	('00000000-0000-0000-0000-000000000000', 46, 'bwFyiM9StklbfD8xOsdQ5A', '21083f4c-25a7-432d-a1ee-729f63c67cde', false, '2024-12-04 23:29:55.010768+00', '2024-12-04 23:29:55.010768+00', NULL, 'b0a8bfb9-f7ab-4bbe-ac59-30660f099bae'),
	('00000000-0000-0000-0000-000000000000', 47, '44iQ4-4bF-E32zh1LejyOw', 'c4452582-c01c-4b17-aee7-346015cf648d', false, '2024-12-04 23:30:18.328898+00', '2024-12-04 23:30:18.328898+00', NULL, 'baf1ef8d-baba-4ab8-bc48-7773fd5a3d1a'),
	('00000000-0000-0000-0000-000000000000', 48, 'khSnpYVCibkdEdlitGUW7A', '21083f4c-25a7-432d-a1ee-729f63c67cde', true, '2024-12-04 23:32:03.973744+00', '2024-12-05 03:34:11.364112+00', NULL, 'dcc4638d-64db-47b7-91bf-273cf1677053'),
	('00000000-0000-0000-0000-000000000000', 49, '_LCG6oULRNz045G6FyEFSg', '21083f4c-25a7-432d-a1ee-729f63c67cde', false, '2024-12-05 03:34:11.368735+00', '2024-12-05 03:34:11.368735+00', 'khSnpYVCibkdEdlitGUW7A', 'dcc4638d-64db-47b7-91bf-273cf1677053'),
	('00000000-0000-0000-0000-000000000000', 50, 'E0GISMV3XntZncoPRAatoQ', '21083f4c-25a7-432d-a1ee-729f63c67cde', false, '2024-12-05 03:34:13.887151+00', '2024-12-05 03:34:13.887151+00', NULL, '51678cc1-1693-4e89-bd70-ba433d2ad773'),
	('00000000-0000-0000-0000-000000000000', 51, 'OduQ6Wl45t2gfUWsID3xOA', '053ea79d-8b73-471a-8ec8-462990b64815', true, '2024-12-05 03:36:25.152772+00', '2024-12-05 11:32:02.181992+00', NULL, '35f98628-b52a-4183-97d4-eeefc0a845f0'),
	('00000000-0000-0000-0000-000000000000', 52, '6SeXuXAainntoiAH8UQqWg', '053ea79d-8b73-471a-8ec8-462990b64815', false, '2024-12-05 11:32:02.191347+00', '2024-12-05 11:32:02.191347+00', 'OduQ6Wl45t2gfUWsID3xOA', '35f98628-b52a-4183-97d4-eeefc0a845f0'),
	('00000000-0000-0000-0000-000000000000', 53, 'Vqd61au_W-D_kVJrc8iBog', '21083f4c-25a7-432d-a1ee-729f63c67cde', false, '2024-12-05 11:32:04.850247+00', '2024-12-05 11:32:04.850247+00', NULL, '0636f00a-ed10-4078-acec-b3cc5ba20fea'),
	('00000000-0000-0000-0000-000000000000', 54, 'eQWoeUtOc5BIqLVxAIB_Dw', '053ea79d-8b73-471a-8ec8-462990b64815', true, '2024-12-05 11:32:14.073044+00', '2024-12-05 18:10:51.828532+00', NULL, '13b31450-b3a4-49a6-9b0c-931395c2761b'),
	('00000000-0000-0000-0000-000000000000', 56, 'slss95PpbpYqnNp50SMU6w', '053ea79d-8b73-471a-8ec8-462990b64815', false, '2024-12-05 18:10:57.269193+00', '2024-12-05 18:10:57.269193+00', NULL, 'f03eb74e-2bbe-42f5-a686-62a89a4b6fd2'),
	('00000000-0000-0000-0000-000000000000', 55, 'aPmJtRd6tIxrE1Q2sNQzrw', '053ea79d-8b73-471a-8ec8-462990b64815', true, '2024-12-05 18:10:51.833868+00', '2024-12-06 03:22:52.305288+00', 'eQWoeUtOc5BIqLVxAIB_Dw', '13b31450-b3a4-49a6-9b0c-931395c2761b'),
	('00000000-0000-0000-0000-000000000000', 57, 'eZ_ZtnJ3uYSXoMNP8RBnsQ', '053ea79d-8b73-471a-8ec8-462990b64815', false, '2024-12-06 03:22:52.310656+00', '2024-12-06 03:22:52.310656+00', 'aPmJtRd6tIxrE1Q2sNQzrw', '13b31450-b3a4-49a6-9b0c-931395c2761b'),
	('00000000-0000-0000-0000-000000000000', 58, '5O83YFvfZ1700lBUK-cudw', '053ea79d-8b73-471a-8ec8-462990b64815', false, '2024-12-06 03:22:57.11648+00', '2024-12-06 03:22:57.11648+00', NULL, 'bd3bdc8a-2084-4731-8e4f-c9c9d05781c4'),
	('00000000-0000-0000-0000-000000000000', 59, 'ntE3v1q5RZECByii_sTAWg', '053ea79d-8b73-471a-8ec8-462990b64815', false, '2024-12-06 03:23:33.405939+00', '2024-12-06 03:23:33.405939+00', NULL, '10a1382f-803c-4549-8f20-b2b4a7a0ef36'),
	('00000000-0000-0000-0000-000000000000', 60, 'MVB2yyUDOTAketLD_3IF1Q', '053ea79d-8b73-471a-8ec8-462990b64815', false, '2024-12-06 03:23:50.092568+00', '2024-12-06 03:23:50.092568+00', NULL, 'a31a6c1a-e90c-4995-9cec-8e146a97dbcd'),
	('00000000-0000-0000-0000-000000000000', 61, '1ic9sAKRyT0kv8TCXoxmOA', '053ea79d-8b73-471a-8ec8-462990b64815', false, '2024-12-06 03:35:37.562204+00', '2024-12-06 03:35:37.562204+00', NULL, '2099862f-e9b7-4e43-a25a-4d674df74439'),
	('00000000-0000-0000-0000-000000000000', 62, 'Kb3iBQJxbqRJvbdw90XU9w', '053ea79d-8b73-471a-8ec8-462990b64815', false, '2024-12-06 03:38:58.882232+00', '2024-12-06 03:38:58.882232+00', NULL, 'dfc8d57a-98d8-4940-b299-c5b24ae74f63'),
	('00000000-0000-0000-0000-000000000000', 63, 'Ge-VqV5juOh_BwVs35AojA', '053ea79d-8b73-471a-8ec8-462990b64815', false, '2024-12-06 03:41:08.118095+00', '2024-12-06 03:41:08.118095+00', NULL, '61845ae3-92b0-44ba-83cb-cd6c3a73dcfa'),
	('00000000-0000-0000-0000-000000000000', 64, 'fwCtj4DIXZZSjcsUSEv_Ig', '053ea79d-8b73-471a-8ec8-462990b64815', false, '2024-12-06 03:43:55.837219+00', '2024-12-06 03:43:55.837219+00', NULL, '3da3b8eb-2eb7-46be-9a48-7c87ff9b4329');


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
	('6459cb87-939e-4dec-862b-0cb7cf8adcda', '2024-11-12 05:04:37.768436+00', 'dcd3a42d-8808-4063-ad64-5a433a5ec214', 'Branch 1 of Org B', NULL, 'dentist'),
	('1c18054c-e306-4129-a500-7e097f7fdbcb', '2024-11-21 06:04:01.080299+00', '8392f809-ed88-472b-9572-62fc8b4a6092', 'Branch 2 of Org A', NULL, 'dentist'),
	('a5c9de1f-db78-4b6c-9be9-881ba2ba1842', '2024-11-26 05:05:55.668155+00', '90fec7d8-0b73-413e-99e1-ea74f95f9c6d', 'Branch 1 of Org C', NULL, 'cuban_restaurant'),
	('ad0bb00a-91e8-401c-9b50-05b6625db08e', '2024-11-26 05:06:15.510231+00', '90fec7d8-0b73-413e-99e1-ea74f95f9c6d', 'Branch 2 of Org C', NULL, 'hair_salon'),
	('2cf52926-d0b3-4c17-9906-298f59b940a6', '2024-11-12 05:04:37.768436+00', '8392f809-ed88-472b-9572-62fc8b4a6092', 'Branch 1 of Org A', NULL, 'hair_salon');


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
	('3bfde56c-6f5e-4f1f-ae2a-de24d2f470d4', '90fec7d8-0b73-413e-99e1-ea74f95f9c6d', '2024-11-26 05:02:48.620742+00', 'Test New', 'nawicon985@kazvi.com'),
	('1ca2c474-54a5-4db2-a219-6282d660b617', NULL, '2024-12-01 20:41:56.611278+00', NULL, 'keviwid121@jonespal.com'),
	('c4452582-c01c-4b17-aee7-346015cf648d', NULL, '2024-12-04 19:55:49.059607+00', NULL, 'norivasallo@gmail.com'),
	('21083f4c-25a7-432d-a1ee-729f63c67cde', '8392f809-ed88-472b-9572-62fc8b4a6092', '2024-12-04 19:55:34.721038+00', NULL, 'orelvis15@gmail.com');


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
	('3c4dd0a6-b019-45cc-8b5d-43c52037f0e2', '2024-11-26 05:39:21.242711+00', 'Android Branch 1 Organization C', 'b2ee760358f5b6ab', NULL, NULL, 'initialized', '24774', '2024-12-06 06:15:22.556062+00', 'dcd3a42d-8808-4063-ad64-5a433a5ec214');


--
-- Data for Name: users_branches; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."users_branches" ("user_id", "branch_id", "is_active") VALUES
	('5f206c96-c10c-4ac9-a607-3dc55d76ce9f', '2cf52926-d0b3-4c17-9906-298f59b940a6', NULL),
	('3bfde56c-6f5e-4f1f-ae2a-de24d2f470d4', 'a5c9de1f-db78-4b6c-9be9-881ba2ba1842', NULL),
	('3bfde56c-6f5e-4f1f-ae2a-de24d2f470d4', 'ad0bb00a-91e8-401c-9b50-05b6625db08e', NULL),
	('053ea79d-8b73-471a-8ec8-462990b64815', '2cf52926-d0b3-4c17-9906-298f59b940a6', NULL),
	('053ea79d-8b73-471a-8ec8-462990b64815', '1c18054c-e306-4129-a500-7e097f7fdbcb', NULL),
	('5f206c96-c10c-4ac9-a607-3dc55d76ce9f', '1c18054c-e306-4129-a500-7e097f7fdbcb', NULL);


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

INSERT INTO "storage"."buckets" ("id", "name", "owner", "created_at", "updated_at", "public", "avif_autodetection", "file_size_limit", "allowed_mime_types", "owner_id") VALUES
	('user_videos', 'user_videos', NULL, '2024-12-01 21:36:34.790851+00', '2024-12-01 21:36:34.790851+00', false, false, 52428800, NULL, NULL);


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
	(3, 16489, 'add_new_user_row', '2024-11-26 05:02:46.792063+00', 3),
	(4, 16489, 'add_new_user_row', '2024-12-01 20:20:31.63069+00', 4),
	(5, 16489, 'add_new_user_row', '2024-12-01 20:30:11.029201+00', 5),
	(6, 16489, 'add_new_user_row', '2024-12-01 20:38:44.34058+00', 6),
	(7, 16489, 'add_new_user_row', '2024-12-01 20:41:54.872495+00', 7),
	(8, 16489, 'add_new_user_row', '2024-12-04 19:55:33.617742+00', 8),
	(9, 16489, 'add_new_user_row', '2024-12-04 19:55:48.416372+00', 9);


--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--



--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('"auth"."refresh_tokens_id_seq"', 64, true);


--
-- Name: key_key_id_seq; Type: SEQUENCE SET; Schema: pgsodium; Owner: supabase_admin
--

SELECT pg_catalog.setval('"pgsodium"."key_key_id_seq"', 1, false);


--
-- Name: hooks_id_seq; Type: SEQUENCE SET; Schema: supabase_functions; Owner: supabase_functions_admin
--

SELECT pg_catalog.setval('"supabase_functions"."hooks_id_seq"', 9, true);


--
-- PostgreSQL database dump complete
--

RESET ALL;
