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

DROP DATABASE playstore;
--
-- Name: playstore; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE playstore WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


\connect playstore

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
-- Name: analytics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.analytics (
    id integer NOT NULL,
    app_name text NOT NULL,
    category text NOT NULL,
    rating real,
    reviews integer,
    size text,
    min_installs integer,
    price real,
    content_rating text,
    genres text[],
    last_updated date,
    current_version text,
    android_version text
);


--
-- Name: analytics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.analytics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: analytics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.analytics_id_seq OWNED BY public.analytics.id;


--
-- Name: analytics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.analytics ALTER COLUMN id SET DEFAULT nextval('public.analytics_id_seq'::regclass);


--
-- Data for Name: analytics; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.analytics (id, app_name, category, rating, reviews, size, min_installs, price, content_rating, genres, last_updated, current_version, android_version) FROM stdin;
1	Facebook	SOCIAL	4.1	78158306	Varies with device	1000000000	0	Teen	{Social}	2018-08-03	Varies with device	Varies with device
2	WhatsApp Messenger	SOCIAL	4.1	78128208	Varies with device	1000000000	0	Teen	{Social}	2018-08-03	Varies with device	Varies with device
3	Instagram	COMMUNICATION	4.4	69119316	Varies with device	1000000000	0	Everyone	{Communication}	2018-08-03	Varies with device	Varies with device
4	Messenger – Text and Video Chat for Free	COMMUNICATION	4.4	69119316	Varies with device	1000000000	0	Everyone	{Communication}	2018-08-03	Varies with device	Varies with device
5	Clash of Clans	COMMUNICATION	4.4	69109672	Varies with device	1000000000	0	Everyone	{Communication}	2018-08-03	Varies with device	Varies with device
6	Clean Master- Space Cleaner & Antivirus	SOCIAL	4.5	66577446	Varies with device	1000000000	0	Teen	{Social}	2018-07-31	Varies with device	Varies with device
7	Subway Surfers	SOCIAL	4.5	66577313	Varies with device	1000000000	0	Teen	{Social}	2018-07-31	Varies with device	Varies with device
8	YouTube	SOCIAL	4.5	66577313	Varies with device	1000000000	0	Teen	{Social}	2018-07-31	Varies with device	Varies with device
9	Security Master - Antivirus, VPN, AppLock, Booster	SOCIAL	4.5	66509917	Varies with device	1000000000	0	Teen	{Social}	2018-07-31	Varies with device	Varies with device
10	Clash Royale	COMMUNICATION	4	56646578	Varies with device	1000000000	0	Everyone	{Communication}	2018-08-01	Varies with device	Varies with device
11	Candy Crush Saga	COMMUNICATION	4	56642847	Varies with device	1000000000	0	Everyone	{Communication}	2018-08-01	Varies with device	Varies with device
12	UC Browser - Fast Download Private & Secure	COMMUNICATION	4	56642847	Varies with device	1000000000	0	Everyone	{Communication}	2018-08-01	Varies with device	Varies with device
13	Snapchat	GAME	4.6	44893888	98M	100000000	0	Everyone 10+	{Strategy}	2018-07-15	10.322.16	4.1 and up
14	360 Security - Free Antivirus, Booster, Cleaner	GAME	4.6	44891723	98M	100000000	0	Everyone 10+	{Strategy}	2018-07-15	10.322.16	4.1 and up
15	My Talking Tom	GAME	4.6	44891723	98M	100000000	0	Everyone 10+	{Strategy}	2018-07-15	10.322.16	4.1 and up
16	8 Ball Pool	FAMILY	4.6	44881447	98M	100000000	0	Everyone 10+	{Strategy}	2018-07-15	10.322.16	4.1 and up
17	DU Battery Saver - Battery Charger & Battery Life	TOOLS	4.7	42916526	Varies with device	500000000	0	Everyone	{Tools}	2018-08-03	Varies with device	Varies with device
18	BBM - Free Calls & Messages	GAME	4.5	27725352	76M	1000000000	0	Everyone 10+	{Arcade}	2018-07-12	1.90.0	4.1 and up
19	Cache Cleaner-DU Speed Booster (booster & cleaner)	GAME	4.5	27725352	76M	1000000000	0	Everyone 10+	{Arcade}	2018-07-12	1.90.0	4.1 and up
20	Twitter	GAME	4.5	27724094	76M	1000000000	0	Everyone 10+	{Arcade}	2018-07-12	1.90.0	4.1 and up
21	Viber Messenger	GAME	4.5	27723193	76M	1000000000	0	Everyone 10+	{Arcade}	2018-07-12	1.90.0	4.1 and up
22	Shadow Fight 2	GAME	4.5	27722264	76M	1000000000	0	Everyone 10+	{Arcade}	2018-07-12	1.90.0	4.1 and up
23	Google Photos	GAME	4.5	27711703	76M	1000000000	0	Everyone 10+	{Arcade}	2018-07-12	1.90.0	4.1 and up
24	LINE: Free Calls & Messages	VIDEO_PLAYERS	4.3	25655305	Varies with device	1000000000	0	Teen	{"Video Players & Editors"}	2018-08-02	Varies with device	Varies with device
25	Pou	VIDEO_PLAYERS	4.3	25623548	Varies with device	1000000000	0	Teen	{"Video Players & Editors"}	2018-08-02	Varies with device	Varies with device
26	Skype - free IM & video calls	TOOLS	4.7	24900999	Varies with device	500000000	0	Everyone	{Tools}	2018-08-04	4.6.6	Varies with device
27	Pokémon GO	GAME	4.6	23136735	97M	100000000	0	Everyone 10+	{Strategy}	2018-06-27	2.3.2	4.1 and up
28	Minion Rush: Despicable Me Official Game	GAME	4.6	23134775	97M	100000000	0	Everyone 10+	{Strategy}	2018-06-27	2.3.2	4.1 and up
29	Yes day	GAME	4.6	23133508	97M	100000000	0	Everyone 10+	{Strategy}	2018-06-27	2.3.2	4.1 and up
30	Hay Day	FAMILY	4.6	23125280	97M	100000000	0	Everyone 10+	{Strategy}	2018-06-27	2.3.2	4.1 and up
31	Dream League Soccer 2018	GAME	4.4	22430188	74M	500000000	0	Everyone	{Casual}	2018-07-05	1.129.0.2	4.1 and up
32	My Talking Angela	GAME	4.4	22430188	74M	500000000	0	Everyone	{Casual}	2018-07-05	1.129.0.2	4.1 and up
33	VivaVideo - Video Editor & Photo Movie	GAME	4.4	22429716	74M	500000000	0	Everyone	{Casual}	2018-07-05	1.129.0.2	4.1 and up
34	Google Chrome: Fast & Secure	GAME	4.4	22428456	74M	500000000	0	Everyone	{Casual}	2018-07-05	1.129.0.2	4.1 and up
35	Maps - Navigate & Explore	GAME	4.4	22428456	74M	500000000	0	Everyone	{Casual}	2018-07-05	1.129.0.2	4.1 and up
36	Hill Climb Racing	GAME	4.4	22426677	74M	500000000	0	Everyone	{Casual}	2018-07-05	1.129.0.2	4.1 and up
37	Facebook Lite	FAMILY	4.4	22419455	74M	500000000	0	Everyone	{Casual}	2018-07-05	1.129.0.2	4.1 and up
38	Asphalt 8: Airborne	COMMUNICATION	4.5	17714850	40M	500000000	0	Teen	{Communication}	2018-08-02	12.8.5.1121	4.0 and up
39	Mobile Legends: Bang Bang	COMMUNICATION	4.5	17712922	40M	500000000	0	Teen	{Communication}	2018-08-02	12.8.5.1121	4.0 and up
40	Battery Doctor-Battery Life Saver & Battery Cooler	COMMUNICATION	4.5	17712922	40M	500000000	0	Teen	{Communication}	2018-08-02	12.8.5.1121	4.0 and up
41	Temple Run 2	SOCIAL	4	17015352	Varies with device	500000000	0	Teen	{Social}	2018-07-30	Varies with device	Varies with device
42	Piano Tiles 2™	SOCIAL	4	17014787	Varies with device	500000000	0	Teen	{Social}	2018-07-30	Varies with device	Varies with device
43	Google	SOCIAL	4	17014705	Varies with device	500000000	0	Teen	{Social}	2018-07-30	Varies with device	Varies with device
44	Truecaller: Caller ID, SMS spam blocking & Dialer	SOCIAL	4	17000166	Varies with device	500000000	0	Teen	{Social}	2018-07-30	Varies with device	Varies with device
45	SHAREit - Transfer & Share	TOOLS	4.6	16771865	Varies with device	100000000	0	Everyone	{Tools}	2018-08-04	Varies with device	Varies with device
46	Sniper 3D Gun Shooter: Free Shooting Games - FPS	GAME	4.5	14892469	Varies with device	500000000	0	Everyone	{Casual}	2018-07-19	4.8.0.132	4.1 and up
47	Farm Heroes Saga	GAME	4.5	14891223	Varies with device	500000000	0	Everyone	{Casual}	2018-07-19	4.8.0.132	4.1 and up
48	PicsArt Photo Studio: Collage Maker & Pic Editor	FAMILY	4.5	14885236	Varies with device	500000000	0	Everyone	{Casual}	2018-07-19	4.8.0.132	4.1 and up
49	PhotoGrid: Video & Pic Collage Maker, Photo Editor	GAME	4.5	14201891	52M	100000000	0	Everyone	{Sports}	2018-07-31	4.0.0	4.0.3 and up
50	GO Launcher - 3D parallax Themes & HD Wallpapers	GAME	4.5	14201604	52M	100000000	0	Everyone	{Sports}	2018-07-31	4.0.0	4.0.3 and up
51	Waze - GPS, Maps, Traffic Alerts & Live Navigation	GAME	4.5	14200550	52M	100000000	0	Everyone	{Sports}	2018-07-31	4.0.0	4.0.3 and up
52	Google Play Games	GAME	4.5	14200344	52M	100000000	0	Everyone	{Sports}	2018-07-31	4.0.0	4.0.3 and up
53	CM Launcher 3D - Theme, Wallpapers, Efficient	GAME	4.5	14198602	52M	100000000	0	Everyone	{Sports}	2018-07-31	4.0.0	4.0.3 and up
54	MX Player	GAME	4.5	14198297	52M	100000000	0	Everyone	{Sports}	2018-07-31	4.0.0	4.0.3 and up
55	ZEDGE™ Ringtones & Wallpapers	SPORTS	4.5	14184910	52M	100000000	0	Everyone	{Sports}	2018-07-31	4.0.0	4.0.3 and up
56	Trivia Crack	TOOLS	4.5	13479633	14M	100000000	0	Everyone	{Tools}	2018-06-05	4.8.7.8	4.0 and up
57	Duolingo: Learn Languages Free	COMMUNICATION	4.3	12843436	Varies with device	100000000	0	Everyone	{Communication}	2018-08-02	Varies with device	4.0.3 and up
58	Wish - Shopping Made Fun	COMMUNICATION	4.3	12842860	Varies with device	100000000	0	Everyone	{Communication}	2018-08-02	Varies with device	4.0.3 and up
59	AVG AntiVirus 2018 for Android Security	TOOLS	4.5	12759815	15M	100000000	0	Everyone	{Tools}	2018-07-25	3.1.2	4.0 and up
60	Candy Crush Soda Saga	TOOLS	4.5	12759663	15M	100000000	0	Everyone	{Tools}	2018-07-25	3.1.2	4.0 and up
61	Geometry Dash Lite	NEWS_AND_MAGAZINES	4.3	11667403	Varies with device	500000000	0	Mature 17+	{"News & Magazines"}	2018-08-06	Varies with device	Varies with device
62	Retrica	NEWS_AND_MAGAZINES	4.3	11667403	Varies with device	500000000	0	Mature 17+	{"News & Magazines"}	2018-08-06	Varies with device	Varies with device
63	Hungry Shark Evolution	NEWS_AND_MAGAZINES	4.3	11657972	Varies with device	500000000	0	Mature 17+	{"News & Magazines"}	2018-07-30	Varies with device	Varies with device
64	Flipkart Online Shopping App	COMMUNICATION	4.3	11335481	Varies with device	500000000	0	Everyone	{Communication}	2018-07-18	Varies with device	Varies with device
65	AliExpress - Smarter Shopping, Better Living	COMMUNICATION	4.3	11335255	Varies with device	500000000	0	Everyone	{Communication}	2018-07-18	Varies with device	Varies with device
66	VK	COMMUNICATION	4.3	11334973	Varies with device	500000000	0	Everyone	{Communication}	2018-07-18	Varies with device	Varies with device
67	APUS Launcher - Theme, Wallpaper, Hide Apps	COMMUNICATION	4.3	11334973	Varies with device	500000000	0	Everyone	{Communication}	2018-07-18	Varies with device	Varies with device
68	Google Translate	COMMUNICATION	4.3	11334799	Varies with device	500000000	0	Everyone	{Communication}	2018-07-18	Varies with device	Varies with device
69	Tik Tok - including musical.ly	GAME	4.6	10981850	88M	100000000	0	Everyone 10+	{Action}	2018-07-02	1.9.38	3.0 and up
70	Boom Beach	GAME	4.6	10979062	88M	100000000	0	Everyone 10+	{Action}	2018-07-02	1.9.38	3.0 and up
71	Angry Birds Classic	PHOTOGRAPHY	4.5	10859051	Varies with device	1000000000	0	Everyone	{Photography}	2018-08-06	Varies with device	Varies with device
72	Garena Free Fire	PHOTOGRAPHY	4.5	10858556	Varies with device	1000000000	0	Everyone	{Photography}	2018-08-06	Varies with device	Varies with device
73	Netflix	PHOTOGRAPHY	4.5	10858538	Varies with device	1000000000	0	Everyone	{Photography}	2018-08-06	Varies with device	Varies with device
74	Score! Hero	PHOTOGRAPHY	4.5	10847682	Varies with device	1000000000	0	Everyone	{Photography}	2018-08-01	Varies with device	Varies with device
75	Traffic Racer	COMMUNICATION	4.2	10790289	Varies with device	500000000	0	Everyone	{Communication}	2018-07-26	Varies with device	Varies with device
76	WeChat	COMMUNICATION	4.2	10790289	Varies with device	500000000	0	Everyone	{Communication}	2018-07-26	Varies with device	Varies with device
77	ES File Explorer File Manager	COMMUNICATION	4.2	10790092	Varies with device	500000000	0	Everyone	{Communication}	2018-07-26	Varies with device	Varies with device
78	B612 - Beauty & Filter Camera	GAME	4.3	10486018	24M	500000000	0	Everyone	{Casual}	2018-05-25	1.4.77	4.0 and up
79	slither.io	GAME	4.3	10485334	24M	500000000	0	Everyone	{Casual}	2018-05-25	1.4.77	4.0 and up
80	Avast Mobile Security 2018 - Antivirus & App Lock	GAME	4.3	10485308	24M	500000000	0	Everyone	{Casual}	2018-05-25	1.4.77	4.0 and up
81	Opera Mini - fast web browser	COMMUNICATION	4.1	10484169	Varies with device	1000000000	0	Everyone	{Communication}	2018-08-03	Varies with device	Varies with device
82	Fruit Ninja®	COMMUNICATION	4.1	10484169	Varies with device	1000000000	0	Everyone	{Communication}	2018-08-03	Varies with device	Varies with device
83	Dr. Driving	COMMUNICATION	4.1	10484169	Varies with device	1000000000	0	Everyone	{Communication}	2018-08-03	Varies with device	Varies with device
84	Applock	FAMILY	4.3	10483141	24M	500000000	0	Everyone	{Casual}	2018-05-25	1.4.77	4.0 and up
85	Uber	GAME	4.1	10424925	85M	100000000	0	Everyone	{Adventure}	2018-07-23	0.111.3	4.4 and up
86	Zombie Tsunami	GAME	4.1	10421284	85M	100000000	0	Everyone	{Adventure}	2018-07-23	0.111.3	4.4 and up
87	Hotstar	FAMILY	4.5	10216997	Varies with device	100000000	0	Everyone 10+	{Casual,"Action & Adventure"}	2018-07-12	Varies with device	Varies with device
88	Camera360: Selfie Photo Editor with Funny Sticker	FAMILY	4.5	10216997	Varies with device	100000000	0	Everyone 10+	{Casual,"Action & Adventure"}	2018-07-12	Varies with device	Varies with device
89	Google+	GAME	4.5	10216538	Varies with device	100000000	0	Everyone 10+	{Casual,"Action & Adventure"}	2018-07-12	Varies with device	Varies with device
90	Gangstar Vegas - mafia game	FAMILY	4.5	10214862	Varies with device	100000000	0	Everyone 10+	{Casual,"Action & Adventure"}	2018-07-12	Varies with device	Varies with device
91	imo free video calls and chat	GAME	4.5	10055521	94M	100000000	0	Everyone	{Casual}	2018-06-28	1_39_93	4.0.3 and up
92	Jetpack Joyride	FAMILY	4.5	10053186	94M	100000000	0	Everyone	{Casual}	2018-06-28	1_39_93	4.0.3 and up
93	Gmail	GAME	4.6	9883806	74M	100000000	0	Everyone	{Sports}	2018-07-16	5.064	4.4 and up
94	GO Keyboard - Cute Emojis, Themes and GIFs	GAME	4.5	9883367	99M	100000000	0	Everyone	{Casual}	2018-07-03	3.7.2.51	4.1 and up
95	Castle Clash: Heroes of the Empire US	GAME	4.6	9882639	74M	100000000	0	Everyone	{Sports}	2018-07-16	5.064	4.4 and up
96	Period Tracker - Period Calendar Ovulation Tracker	GAME	4.5	9881908	99M	100000000	0	Everyone	{Casual}	2018-07-03	3.7.2.51	4.1 and up
97	Pixel Gun 3D: Survival shooter & Battle Royale	GAME	4.5	9881829	99M	100000000	0	Everyone	{Casual}	2018-07-03	3.7.2.51	4.1 and up
98	Township	VIDEO_PLAYERS	4.6	9879473	40M	100000000	0	Teen	{"Video Players & Editors"}	2018-08-04	7.2.1	4.1 and up
99	ROBLOX	FAMILY	4.5	9876369	99M	100000000	0	Everyone	{Casual}	2018-07-03	3.7.2.51	4.1 and up
100	Pinterest	SPORTS	4.6	9873470	74M	100000000	0	Everyone	{Sports}	2018-07-16	5.064	4.4 and up
101	Tiny Flashlight + LED	COMMUNICATION	4.3	9643041	Varies with device	1000000000	0	Everyone	{Communication}	2018-08-01	Varies with device	Varies with device
102	Crossy Road	COMMUNICATION	4.3	9642995	Varies with device	1000000000	0	Everyone	{Communication}	2018-08-01	Varies with device	Varies with device
103	SimCity BuildIt	COMMUNICATION	4.3	9642112	Varies with device	1000000000	0	Everyone	{Communication}	2018-08-01	Varies with device	Varies with device
104	Yahoo Mail – Stay Organized	TRAVEL_AND_LOCAL	4.3	9235373	Varies with device	1000000000	0	Everyone	{"Travel & Local"}	2018-07-31	Varies with device	Varies with device
105	Smash Hit	TRAVEL_AND_LOCAL	4.3	9235155	Varies with device	1000000000	0	Everyone	{"Travel & Local"}	2018-07-31	Varies with device	Varies with device
106	Gardenscapes	TRAVEL_AND_LOCAL	4.3	9231613	Varies with device	1000000000	0	Everyone	{"Travel & Local"}	2018-07-31	Varies with device	Varies with device
107	Plants vs. Zombies FREE	GAME	4.4	8923847	63M	100000000	0	Everyone	{Racing}	2018-07-02	1.37.2	4.2 and up
108	VideoShow-Video Editor, Video Maker, Beauty Camera	GAME	4.4	8923818	63M	100000000	0	Everyone	{Racing}	2018-07-02	1.37.2	4.2 and up
109	Temple Run	GAME	4.4	8923587	63M	100000000	0	Everyone	{Racing}	2018-07-02	1.37.2	4.2 and up
110	DEER HUNTER CLASSIC	GAME	4.4	8921451	63M	100000000	0	Everyone	{Racing}	2018-07-02	1.37.2	4.2 and up
111	FIFA Soccer	SOCIAL	4.3	8606259	Varies with device	500000000	0	Teen	{Social}	2018-08-01	Varies with device	Varies with device
112	Angry Birds 2	SOCIAL	4.3	8595964	Varies with device	500000000	0	Teen	{Social}	2018-08-01	Varies with device	Varies with device
113	Mercado Libre: Find your favorite brands	GAME	4.5	8389714	92M	100000000	0	Teen	{Racing}	2018-07-04	3.7.1a	4.0.3 and up
114	Angry Birds Go!	GAME	4.4	8219586	99M	100000000	0	Teen	{Action}	2018-07-24	1.2.97.3042	4.0.3 and up
115	Agar.io	TOOLS	4.5	8190074	17M	100000000	0	Everyone	{Tools}	2018-06-01	6.24	4.0 and up
116	Tango - Live Video Broadcast	GAME	4.3	8119154	62M	500000000	0	Everyone	{Action}	2018-07-05	1.49.1	4.0 and up
117	Badoo - Free Chat & Dating App	GAME	4.3	8119151	62M	500000000	0	Everyone	{Action}	2018-07-05	1.49.1	4.0 and up
118	Sonic Dash	GAME	4.3	8118937	62M	500000000	0	Everyone	{Action}	2018-07-05	1.49.1	4.0 and up
119	PUBG MOBILE	GAME	4.3	8118937	62M	500000000	0	Everyone	{Action}	2018-07-05	1.49.1	4.0 and up
120	UC Browser Mini -Tiny Fast Private & Secure	GAME	4.7	8118880	Varies with device	100000000	0	Everyone	{Arcade}	2018-08-03	3.1.0.226	4.1 and up
121	Banana Kong	GAME	4.3	8118609	62M	500000000	0	Everyone	{Action}	2018-07-05	1.49.1	4.0 and up
122	Top Eleven 2018 - Be a Soccer Manager	GAME	4.3	8116142	62M	500000000	0	Everyone	{Action}	2018-07-05	1.49.1	4.0 and up
123	Hangouts	TOOLS	4.4	8033493	Varies with device	1000000000	0	Everyone	{Tools}	2018-08-03	Varies with device	Varies with device
124	Candy Camera - selfie, beauty camera, photo editor	TOOLS	4.4	8021623	Varies with device	1000000000	0	Everyone	{Tools}	2018-08-03	Varies with device	Varies with device
125	Need for Speed™ No Limits	COMMUNICATION	4.5	7820775	Varies with device	100000000	0	Everyone	{Communication}	2018-08-01	Varies with device	Varies with device
126	YouCam Makeup - Magic Selfie Makeovers	COMMUNICATION	4.5	7820209	Varies with device	100000000	0	Everyone	{Communication}	2018-08-01	Varies with device	Varies with device
127	Hola Launcher- Theme,Wallpaper	TOOLS	4.6	7790693	17M	500000000	0	Everyone	{Tools}	2018-07-30	4.5.28_ww	4.1 and up
128	Microsoft Outlook	TOOLS	4.6	7775146	17M	500000000	0	Everyone	{Tools}	2018-07-30	4.5.28_ww	4.1 and up
129	Talking Tom Cat 2	GAME	4.6	7674252	Varies with device	100000000	0	Mature 17+	{Action}	2018-08-02	Varies with device	Varies with device
130	Cooking Fever	GAME	4.6	7674252	Varies with device	100000000	0	Mature 17+	{Action}	2018-08-02	Varies with device	Varies with device
131	BeautyPlus - Easy Photo Editor & Selfie Camera	GAME	4.6	7672495	Varies with device	100000000	0	Mature 17+	{Action}	2018-08-02	Varies with device	Varies with device
132	Telegram	GAME	4.6	7672495	Varies with device	100000000	0	Mature 17+	{Action}	2018-08-02	Varies with device	Varies with device
133	Homescapes	GAME	4.6	7671249	Varies with device	100000000	0	Mature 17+	{Action}	2018-08-02	Varies with device	Varies with device
134	CM Locker - Security Lockscreen	GAME	4.6	7657490	Varies with device	100000000	0	Mature 17+	{Action}	2018-08-02	Varies with device	Varies with device
135	Firefox Browser fast & private	FAMILY	4.4	7615646	71M	100000000	0	Everyone	{Casual}	2018-08-07	5.2.6	2.3 and up
136	War Robots	GAME	4.4	7614415	70M	100000000	0	Everyone	{Casual}	2018-07-26	5.1.8	2.3 and up
137	Parallel Space - Multiple accounts & Two face	GAME	4.4	7614407	70M	100000000	0	Everyone	{Casual}	2018-07-26	5.1.8	2.3 and up
138	Vector	GAME	4.4	7614271	70M	100000000	0	Everyone	{Casual}	2018-07-26	5.1.8	2.3 and up
139	Lords Mobile: Battle of the Empires - Strategy RPG	GAME	4.4	7614130	70M	100000000	0	Everyone	{Casual}	2018-07-26	5.1.8	2.3 and up
140	MORTAL KOMBAT X	PHOTOGRAPHY	4.5	7594559	34M	100000000	0	Teen	{Photography}	2018-08-06	9.40.3	4.0.3 and up
141	Adobe Acrobat Reader	PHOTOGRAPHY	4.5	7590099	34M	100000000	0	Teen	{Photography}	2018-07-31	9.40.3	4.0.3 and up
142	Tumblr	PHOTOGRAPHY	4.6	7529865	Varies with device	100000000	0	Everyone	{Photography}	2018-08-06	6.71	Varies with device
143	Wattpad 📖 Free Books	PERSONALIZATION	4.5	7464996	Varies with device	100000000	0	Everyone	{Personalization}	2018-08-03	Varies with device	Varies with device
144	Modern Combat 5: eSports FPS	MAPS_AND_NAVIGATION	4.6	7232629	Varies with device	100000000	0	Everyone	{"Maps & Navigation"}	2018-07-29	Varies with device	Varies with device
145	GO SMS Pro - Messenger, Free Themes, Emoji	MAPS_AND_NAVIGATION	4.6	7231017	Varies with device	100000000	0	Everyone	{"Maps & Navigation"}	2018-07-29	Varies with device	Varies with device
146	Bubble Witch 2 Saga	FAMILY	4.3	7168735	Varies with device	1000000000	0	Teen	{Entertainment}	2018-07-16	Varies with device	Varies with device
147	Tinder	ENTERTAINMENT	4.3	7165362	Varies with device	1000000000	0	Teen	{Entertainment}	2018-07-16	Varies with device	Varies with device
148	eBay: Buy & Sell this Summer - Discover Deals Now!	PERSONALIZATION	4.6	6702776	17M	100000000	0	Teen	{Personalization}	2018-08-03	5.41.0	4.0.3 and up
149	SwiftKey Keyboard	PERSONALIZATION	4.6	6700847	17M	100000000	0	Teen	{Personalization}	2018-08-03	5.41.0	4.0.3 and up
150	Hill Climb Racing 2	VIDEO_PLAYERS	4.5	6474672	Varies with device	500000000	0	Everyone	{"Video Players & Editors"}	2018-08-06	Varies with device	Varies with device
151	Google Drive	VIDEO_PLAYERS	4.5	6474426	Varies with device	500000000	0	Everyone	{"Video Players & Editors"}	2018-08-06	Varies with device	Varies with device
152	Fallout Shelter	VIDEO_PLAYERS	4.5	6469179	Varies with device	500000000	0	Everyone	{"Video Players & Editors"}	2018-08-01	Varies with device	Varies with device
153	Talking Tom Gold Run	PERSONALIZATION	4.6	6466641	Varies with device	100000000	0	Teen	{Personalization}	2018-07-19	Varies with device	Varies with device
154	Master for Minecraft(Pocket Edition)-Mod Launcher	PERSONALIZATION	4.6	6466641	Varies with device	100000000	0	Teen	{Personalization}	2018-07-19	Varies with device	Varies with device
155	Angry Birds Epic RPG	PERSONALIZATION	4.6	6466641	Varies with device	100000000	0	Teen	{Personalization}	2018-07-19	Varies with device	Varies with device
156	Angry Birds Rio	PERSONALIZATION	4.6	6459626	Varies with device	100000000	0	Teen	{Personalization}	2018-07-19	Varies with device	Varies with device
157	Kaspersky Mobile Antivirus: AppLock & Web Security	GAME	4.5	6427773	95M	100000000	0	Everyone	{Trivia}	2018-08-03	2.79.0	4.1 and up
158	GO Keyboard - Emoticon keyboard, Free Theme, GIF	FAMILY	4.7	6297590	Varies with device	100000000	0	Everyone	{Education,Education}	2018-08-06	Varies with device	Varies with device
159	DU Recorder – Screen Recorder, Video Editor, Live	FAMILY	4.7	6294400	Varies with device	100000000	0	Everyone	{Education,Education}	2018-08-01	Varies with device	Varies with device
160	Bike Race Free - Top Motorcycle Racing Games	FAMILY	4.7	6294397	Varies with device	100000000	0	Everyone	{Education,Education}	2018-08-01	Varies with device	Varies with device
161	KakaoTalk: Free Calls & Text	EDUCATION	4.7	6290507	Varies with device	100000000	0	Everyone	{Education,Education}	2018-08-01	Varies with device	Varies with device
162	Dolphin Browser - Fast, Private & Adblock🐬	EDUCATION	4.7	6290507	Varies with device	100000000	0	Everyone	{Education,Education}	2018-08-01	Varies with device	Varies with device
163	Opera Browser: Fast and Secure	EDUCATION	4.7	6290507	Varies with device	100000000	0	Everyone	{Education,Education}	2018-08-01	Varies with device	Varies with device
164	MARVEL Contest of Champions	EDUCATION	4.7	6289924	Varies with device	100000000	0	Everyone	{Education,Education}	2018-08-01	Varies with device	Varies with device
165	Kik	SHOPPING	4.5	6212081	15M	100000000	0	Everyone	{Shopping}	2018-08-03	4.20.5	4.1 and up
166	Who	SHOPPING	4.5	6211039	15M	100000000	0	Everyone	{Shopping}	2018-08-03	4.20.5	4.1 and up
167	Injustice: Gods Among Us	SHOPPING	4.5	6211039	15M	100000000	0	Everyone	{Shopping}	2018-08-03	4.20.5	4.1 and up
168	Bible	SHOPPING	4.5	6210998	15M	100000000	0	Everyone	{Shopping}	2018-08-03	4.20.5	4.1 and up
169	Cymera Camera- Photo Editor, Filter,Collage,Layout	TOOLS	4.5	6207063	Varies with device	100000000	0	Everyone	{Tools}	2018-08-03	Varies with device	Varies with device
170	ColorNote Notepad Notes	SHOPPING	4.5	6200739	15M	100000000	0	Everyone	{Shopping}	2018-08-03	4.20.5	4.1 and up
171	Backgrounds HD (Wallpapers)	GAME	4.4	6199095	67M	100000000	0	Everyone	{Casual}	2018-07-10	1.118.4	4.1 and up
172	Minecraft	GAME	4.4	6198880	67M	100000000	0	Everyone	{Casual}	2018-07-10	1.118.4	4.1 and up
173	Weather & Clock Widget for Android	GAME	4.4	6198563	67M	100000000	0	Everyone	{Casual}	2018-07-10	1.118.4	4.1 and up
174	EA SPORTS UFC®	GAME	4.5	6181640	58M	100000000	0	Everyone	{Arcade}	2017-12-22	2.2	4.0 and up
175	MARVEL Future Fight	PHOTOGRAPHY	4.3	6120977	Varies with device	100000000	0	Everyone	{Photography}	2018-06-28	6.1.0	Varies with device
176	BIGO LIVE - Live Stream	GAME	4.5	6074627	100M	100000000	0	Teen	{Arcade}	2018-07-25	6.0.0	4.1 and up
177	Google Earth	GAME	4.5	6074334	100M	100000000	0	Teen	{Arcade}	2018-07-25	6.0.0	4.1 and up
178	Bitmoji – Your Personal Emoji	GAME	4.5	6071542	100M	100000000	0	Teen	{Arcade}	2018-07-25	6.0.0	4.1 and up
179	Last Day on Earth: Survival	SHOPPING	4.4	6012719	Varies with device	100000000	0	Teen	{Shopping}	2018-08-06	Varies with device	Varies with device
180	CM Browser - Ad Blocker , Fast Download , Privacy	SHOPPING	4.4	6003590	Varies with device	100000000	0	Teen	{Shopping}	2018-08-02	Varies with device	Varies with device
181	Extreme Car Driving Simulator	SHOPPING	4.6	5917485	Varies with device	100000000	0	Teen	{Shopping}	2018-08-06	Varies with device	Varies with device
182	Clean Master Lite - For Low-End Phone	SHOPPING	4.6	5916606	Varies with device	100000000	0	Teen	{Shopping}	2018-08-06	Varies with device	Varies with device
183	Clash of Kings : The King Of Fighters version	SHOPPING	4.6	5916569	Varies with device	100000000	0	Teen	{Shopping}	2018-08-06	Varies with device	Varies with device
184	Video Editor Music,Cut,No Crop	SHOPPING	4.6	5911055	Varies with device	100000000	0	Teen	{Shopping}	2018-08-01	Varies with device	Varies with device
185	Fishdom	SOCIAL	3.8	5793284	Varies with device	100000000	0	Mature 17+	{Social}	2018-08-03	Varies with device	Varies with device
186	GUNSHIP BATTLE: Helicopter 3D	PERSONALIZATION	4.5	5783441	14M	100000000	0	Everyone	{Personalization}	2018-08-06	3.9.7	4.0.3 and up
187	Twitch: Livestream Multiplayer Games & Esports	TOOLS	4.4	5745093	Varies with device	500000000	0	Everyone	{Tools}	2018-08-04	Varies with device	Varies with device
188	Google Street View	TOOLS	4.4	5741684	Varies with device	500000000	0	Everyone	{Tools}	2018-08-04	Varies with device	Varies with device
189	Cut the Rope FULL FREE	SOCIAL	4.4	5637451	59M	100000000	0	Teen	{Social}	2018-08-03	8.0.0	4.1 and up
190	Swamp Attack	FAMILY	4.5	5591653	95M	50000000	0	Everyone 10+	{Strategy}	2018-07-18	35.119	4.0.3 and up
191	Microsoft Word	GAME	4.4	5566908	97M	100000000	0	Everyone	{Arcade}	2018-05-24	7.9.3	4.1 and up
192	Google Duo - High Quality Video Calls	GAME	4.4	5566889	97M	100000000	0	Everyone	{Arcade}	2018-05-24	7.9.3	4.1 and up
193	AccuWeather: Daily Forecast & Live Weather Reports	GAME	4.4	5566805	97M	100000000	0	Everyone	{Arcade}	2018-05-24	7.9.3	4.1 and up
194	Summoners War	GAME	4.4	5566669	97M	100000000	0	Everyone	{Arcade}	2018-05-24	7.9.3	4.1 and up
195	Zynga Poker – Texas Holdem	GAME	4.4	5565856	97M	100000000	0	Everyone	{Arcade}	2018-05-24	7.9.3	4.1 and up
196	Dubsmash	GAME	4.5	5534114	53M	100000000	0	Teen	{Action}	2018-08-03	1.21.0	4.0.3 and up
197	Toy Blast	GAME	4.5	5476569	53M	100000000	0	Teen	{Action}	2018-08-03	1.21.0	4.0.3 and up
198	Calorie Counter - MyFitnessPal	GAME	4.5	5476569	53M	100000000	0	Teen	{Action}	2018-08-03	1.21.0	4.0.3 and up
199	Photo Editor Pro	GAME	4.5	5465624	53M	100000000	0	Teen	{Action}	2018-08-03	1.21.0	4.0.3 and up
200	Dropbox	ENTERTAINMENT	4.4	5456708	Varies with device	100000000	0	Teen	{Entertainment}	2018-07-31	Varies with device	Varies with device
201	Gboard - the Google Keyboard	ENTERTAINMENT	4.4	5456599	Varies with device	100000000	0	Teen	{Entertainment}	2018-07-31	Varies with device	Varies with device
202	The Tribez: Build a Village	ENTERTAINMENT	4.4	5456208	Varies with device	100000000	0	Teen	{Entertainment}	2018-07-31	Varies with device	Varies with device
203	Episode - Choose Your Story	ENTERTAINMENT	4.4	5456208	Varies with device	100000000	0	Teen	{Entertainment}	2018-07-31	Varies with device	Varies with device
204	Talking Tom Cat	FAMILY	4.4	5453997	Varies with device	100000000	0	Teen	{Entertainment}	2018-07-31	Varies with device	Varies with device
205	Booking.com Travel Deals	GAME	4.6	5419676	96M	100000000	0	Everyone	{Sports}	2018-06-13	1.751	4.4 and up
206	Talking Angela	GAME	4.6	5419676	96M	100000000	0	Everyone	{Sports}	2018-06-13	1.751	4.4 and up
207	Mobizen Screen Recorder - Record, Capture, Edit	GAME	4.6	5418675	96M	100000000	0	Everyone	{Sports}	2018-06-13	1.751	4.4 and up
208	Akinator	GAME	4.5	5387781	53M	100000000	0	Everyone	{Racing}	2018-02-27	2.5	4.1 and up
209	Talking Ginger	GAME	4.5	5387639	53M	100000000	0	Everyone	{Racing}	2018-02-27	2.5	4.1 and up
210	FRONTLINE COMMANDO: D-DAY	COMMUNICATION	4.2	5387631	Varies with device	100000000	0	Everyone	{Communication}	2018-07-31	Varies with device	Varies with device
211	Bubble Witch 3 Saga	COMMUNICATION	4.2	5387446	Varies with device	100000000	0	Everyone	{Communication}	2018-07-31	Varies with device	Varies with device
212	UNO ™ & Friends	COMMUNICATION	4.2	5387446	Varies with device	100000000	0	Everyone	{Communication}	2018-07-31	Varies with device	Varies with device
213	PES 2018 PRO EVOLUTION SOCCER	COMMUNICATION	4.2	5387333	Varies with device	100000000	0	Everyone	{Communication}	2018-07-31	Varies with device	Varies with device
214	Words With Friends Classic	PRODUCTIVITY	4.6	5383985	16M	100000000	0	Everyone	{Productivity}	2018-08-03	4.1.8.2.2	4.0 and up
215	Glow Hockey	PRODUCTIVITY	4.6	5383971	16M	100000000	0	Everyone	{Productivity}	2018-08-03	4.1.8.2.2	4.0 and up
216	NBA LIVE Mobile Basketball	PRODUCTIVITY	4.6	5378795	16M	100000000	0	Everyone	{Productivity}	2018-08-03	4.1.8.2.2	4.0 and up
217	Dumb Ways to Die 2: The Games	PHOTOGRAPHY	4.4	5282578	Varies with device	100000000	0	Everyone	{Photography}	2018-07-30	7.6.5	4.3 and up
218	Keepsafe Photo Vault: Hide Private Photos & Videos	PHOTOGRAPHY	4.4	5282558	Varies with device	100000000	0	Everyone	{Photography}	2018-07-30	7.6.5	4.3 and up
219	Automatic Call Recorder	PHOTOGRAPHY	4.4	5276983	Varies with device	100000000	0	Everyone	{Photography}	2018-07-30	7.6.5	4.3 and up
220	Talking Ben the Dog	GAME	4.4	5235294	Varies with device	100000000	0	Everyone	{Action}	2017-11-14	Varies with device	2.3 and up
221	Vigo Video	GAME	4.4	5235294	Varies with device	100000000	0	Everyone	{Action}	2017-11-14	Varies with device	2.3 and up
222	Real Basketball	GAME	4.4	5234825	Varies with device	100000000	0	Everyone	{Action}	2017-11-14	Varies with device	2.3 and up
223	Call of Duty®: Heroes	GAME	4.4	5234810	Varies with device	100000000	0	Everyone	{Action}	2017-11-14	Varies with device	2.3 and up
224	Geometry Dash Meltdown	GAME	4.4	5234162	Varies with device	100000000	0	Everyone	{Action}	2017-11-14	Varies with device	2.3 and up
225	YouCam Perfect - Selfie Photo Editor	GAME	4.4	5231553	Varies with device	100000000	0	Everyone	{Action}	2017-11-14	Varies with device	2.3 and up
226	Frozen Free Fall	TOOLS	4.5	5180480	26M	100000000	0	Everyone	{Tools}	2018-08-01	6.11.4	4.1 and up
227	Lazada - Online Shopping & Deals	COMMUNICATION	4.5	5150801	Varies with device	100000000	0	Everyone	{Communication}	2018-07-19	Varies with device	Varies with device
228	CATS: Crash Arena Turbo Stars	COMMUNICATION	4.5	5150471	Varies with device	100000000	0	Everyone	{Communication}	2018-07-19	Varies with device	Varies with device
229	The Weather Channel: Rain Forecast & Storm Alerts	COMMUNICATION	4.5	5149854	Varies with device	100000000	0	Everyone	{Communication}	2018-07-19	Varies with device	Varies with device
230	Photo Lab Picture Editor: face effects, art frames	GAME	4.3	5091448	41M	100000000	0	Everyone	{Arcade}	2018-07-12	2.6.7.487220	4.1 and up
231	Bowmasters	GAME	4.5	4972230	9.9M	100000000	0	Everyone	{Racing}	2018-03-02	1.52	4.0.3 and up
232	Path	TOOLS	4.4	4934130	Varies with device	100000000	0	Everyone	{Tools}	2018-06-11	Varies with device	Varies with device
233	Photo Editor Collage Maker Pro	TOOLS	4.4	4931562	Varies with device	100000000	0	Everyone	{Tools}	2018-06-11	Varies with device	Varies with device
234	LINE Camera - Photo editor	MAPS_AND_NAVIGATION	4.2	4928420	Varies with device	100000000	0	Everyone	{"Maps & Navigation"}	2018-08-06	Varies with device	Varies with device
235	WPS Office - Word, Docs, PDF, Note, Slide & Sheet	MAPS_AND_NAVIGATION	4.2	4921866	Varies with device	100000000	0	Everyone	{"Maps & Navigation"}	2018-08-02	Varies with device	Varies with device
236	Eternium	GAME	4.4	4921451	Varies with device	100000000	0	Everyone 10+	{Arcade}	2018-06-15	Varies with device	Varies with device
237	Five Nights at Freddy’s 2 Demo	GAME	4.4	4921409	Varies with device	100000000	0	Everyone 10+	{Arcade}	2018-06-15	Varies with device	Varies with device
238	CamScanner - Phone PDF Creator	GAME	4.4	4921122	Varies with device	100000000	0	Everyone 10+	{Arcade}	2018-06-15	Varies with device	Varies with device
239	Helix Jump	GAME	4.4	4920817	Varies with device	100000000	0	Everyone 10+	{Arcade}	2018-06-15	Varies with device	Varies with device
240	PewDiePie’s Tuber Simulator	GAME	4.4	4918776	Varies with device	100000000	0	Everyone 10+	{Arcade}	2018-06-15	Varies with device	Varies with device
241	My Airtel-Online Recharge, Pay Bill, Wallet, UPI	ENTERTAINMENT	4.3	4885646	Varies with device	100000000	0	Teen	{Entertainment}	2018-08-03	Varies with device	Varies with device
242	Photo Effects Pro	PHOTOGRAPHY	4.3	4865132	51M	100000000	0	Everyone	{Photography}	2018-08-06	9.3.1	4.0.3 and up
243	Photo Editor by Aviary	PHOTOGRAPHY	4.3	4865107	51M	100000000	0	Everyone	{Photography}	2018-08-06	9.3.1	4.0.3 and up
244	Evernote – Organizer, Planner for Notes & Memos	PHOTOGRAPHY	4.3	4865093	51M	100000000	0	Everyone	{Photography}	2018-08-06	9.3.1	4.0.3 and up
245	Best Fiends - Free Puzzle Game	SOCIAL	4.2	4831125	Varies with device	1000000000	0	Teen	{Social}	2018-07-26	Varies with device	Varies with device
246	DEAD TARGET: FPS Zombie Apocalypse Survival Games	GAME	4.5	4830407	32M	50000000	0	Mature 17+	{Action}	2018-05-25	3.7.1a	Varies with device
247	Star Wars™: Galaxy of Heroes	SOCIAL	4.2	4828372	Varies with device	1000000000	0	Teen	{Social}	2018-07-26	Varies with device	Varies with device
248	Madden NFL Football	COMMUNICATION	4.3	4785988	11M	500000000	0	Everyone	{Communication}	2018-06-08	9.8.000000010501	4.0 and up
249	Pic Collage - Photo Editor	COMMUNICATION	4.3	4785988	11M	500000000	0	Everyone	{Communication}	2018-06-08	9.8.000000010501	4.0 and up
250	9GAG: Funny Gifs, Pics, Memes & Videos for IGTV	COMMUNICATION	4.3	4785892	11M	500000000	0	Everyone	{Communication}	2018-06-08	9.8.000000010501	4.0 and up
251	Google Play Books	COMMUNICATION	4.3	4785892	11M	500000000	0	Everyone	{Communication}	2018-06-08	9.8.000000010501	4.0 and up
252	Special Forces Group 2	GAME	4.4	4638163	96M	100000000	0	Everyone 10+	{Arcade}	2018-07-19	1.10.12	4.1 and up
253	Red Ball 4	GAME	4.4	4637439	96M	100000000	0	Everyone 10+	{Arcade}	2018-07-19	1.10.12	4.1 and up
254	Messenger Lite: Free Calls & Messages	COMMUNICATION	4.3	4604483	Varies with device	1000000000	0	Everyone	{Communication}	2018-08-02	Varies with device	Varies with device
255	GO Weather - Widget, Theme, Wallpaper, Efficient	COMMUNICATION	4.3	4604324	Varies with device	1000000000	0	Everyone	{Communication}	2018-08-02	Varies with device	Varies with device
256	GPS Navigation & Offline Maps Sygic	COMMUNICATION	4.3	4604324	Varies with device	1000000000	0	Everyone	{Communication}	2018-08-02	Varies with device	Varies with device
257	Critical Ops	TOOLS	4.5	4594198	Varies with device	100000000	0	Everyone	{Tools}	2018-07-31	Varies with device	Varies with device
258	Roll the Ball® - slide puzzle	FAMILY	4.6	4578890	24M	50000000	0	Everyone 10+	{Strategy}	2018-07-17	1.4.51	4.1 and up
259	DINO HUNTER: DEADLY SHORES	GAME	4.6	4578476	24M	50000000	0	Everyone 10+	{Strategy}	2018-07-17	1.4.51	4.1 and up
260	Chess Free	HEALTH_AND_FITNESS	4.8	4559407	Varies with device	100000000	0	Everyone	{"Health & Fitness"}	2018-08-01	Varies with device	Varies with device
261	Chase Mobile	GAME	4.5	4487182	55M	50000000	0	Teen	{Action}	2018-07-04	15.1.2	4.0.3 and up
262	Where’s My Water? Free	FAMILY	4.6	4451317	Varies with device	50000000	0	Everyone	{Casual}	2018-07-19	5.9.0	4.0.3 and up
263	Groupon - Shop Deals, Discounts & Coupons	FAMILY	4.5	4450890	67M	100000000	0	Everyone 10+	{Adventure,"Action & Adventure"}	2018-07-31	2.347.225742	4.1 and up
264	FRONTLINE COMMANDO	FAMILY	4.5	4450855	67M	100000000	0	Everyone 10+	{Adventure,"Action & Adventure"}	2018-07-31	2.347.225742	4.1 and up
265	Toon Blast	GAME	4.5	4449910	67M	100000000	0	Everyone 10+	{Adventure,"Action & Adventure"}	2018-07-31	2.347.225742	4.1 and up
266	RULES OF SURVIVAL	FAMILY	4.5	4449910	67M	100000000	0	Everyone 10+	{Adventure,"Action & Adventure"}	2018-07-31	2.347.225742	4.1 and up
267	Bank of Brazil	GAME	4.5	4449882	67M	100000000	0	Everyone 10+	{Adventure,"Action & Adventure"}	2018-07-31	2.347.225742	4.1 and up
268	Brightest Flashlight Free ®	GAME	4.5	4448791	67M	100000000	0	Everyone 10+	{Adventure,"Action & Adventure"}	2018-07-31	2.347.225742	4.1 and up
269	My Horse	GAME	4.5	4447388	67M	100000000	0	Everyone 10+	{Adventure,"Action & Adventure"}	2018-07-31	2.347.225742	4.1 and up
270	Turbo FAST	GAME	4.5	4447346	67M	100000000	0	Everyone 10+	{Adventure,"Action & Adventure"}	2018-07-31	2.347.225742	4.1 and up
271	Earn to Die 2	FAMILY	4.5	4443407	67M	100000000	0	Everyone 10+	{Adventure,"Action & Adventure"}	2018-07-31	2.347.225742	4.1 and up
272	Myntra Online Shopping App	SOCIAL	4.6	4305441	Varies with device	100000000	0	Teen	{Social}	2018-08-03	Varies with device	Varies with device
273	Online Soccer Manager (OSM)	SOCIAL	4.6	4305441	Varies with device	100000000	0	Teen	{Social}	2018-08-03	Varies with device	Varies with device
274	Yahoo Weather	SOCIAL	4.6	4300936	Varies with device	100000000	0	Teen	{Social}	2018-08-03	Varies with device	Varies with device
275	MY LITTLE PONY: Magic Princess	TOOLS	4.4	4254879	Varies with device	100000000	0	Everyone	{Tools}	2018-07-08	Varies with device	Varies with device
276	► MultiCraft ― Free Miner! 👍	GAME	4.5	4230886	60M	100000000	0	Everyone	{Action}	2018-08-01	3.1.0	5.0 and up
277	Vlogger Go Viral - Tuber Game	GAME	4.5	4229977	60M	100000000	0	Everyone	{Action}	2018-08-01	3.1.0	5.0 and up
278	Candy Crush Jelly Saga	FAMILY	4.5	4218587	100M	50000000	0	Everyone 10+	{Simulation}	2018-06-19	1.23.3.75024	4.0 and up
279	Flow Free	COMMUNICATION	4.3	4188345	16M	100000000	0	Everyone	{Communication}	2018-07-18	5.29.3	4.4 and up
280	Flipboard: News For Our Time	COMMUNICATION	4.3	4188142	16M	100000000	0	Everyone	{Communication}	2018-07-18	5.29.3	4.4 and up
281	Share Music & Transfer Files - Xender	COMMUNICATION	4.3	4187998	16M	100000000	0	Everyone	{Communication}	2018-07-18	5.29.3	4.4 and up
282	Facebook Pages Manager	GAME	4.5	4147718	79M	100000000	0	Everyone	{Arcade}	2015-11-26	1.4.0	2.3 and up
283	Avakin Life - 3D virtual world	GAME	4.6	4129665	Varies with device	50000000	0	Everyone	{Casual}	2018-07-13	2.6.2	4.0.3 and up
284	Amino: Communities and Chats	GAME	4.6	4128732	Varies with device	50000000	0	Everyone	{Casual}	2018-07-13	2.6.2	4.0.3 and up
285	Voice changer with effects	GAME	4.4	4067651	69M	100000000	0	Everyone 10+	{Strategy}	2018-07-06	2.2.00	4.1 and up
286	MomentCam Cartoons & Stickers	GAME	4.4	4067651	69M	100000000	0	Everyone 10+	{Strategy}	2018-07-06	2.2.00	4.1 and up
287	MeetMe: Chat & Meet New People	GAME	4.4	4066989	69M	100000000	0	Everyone 10+	{Strategy}	2018-07-06	2.2.00	4.1 and up
288	Uber Driver	GAME	4.4	4066980	69M	100000000	0	Everyone 10+	{Strategy}	2018-07-06	2.2.00	4.1 and up
289	GO Security－AntiVirus, AppLock, Booster	FAMILY	4.4	4064868	69M	100000000	0	Everyone 10+	{Strategy}	2018-07-06	2.2.00	4.1 and up
290	Hungry Shark World	VIDEO_PLAYERS	4.6	4016834	Varies with device	100000000	0	Everyone	{"Video Players & Editors"}	2018-07-23	Varies with device	Varies with device
291	Yandex Browser with Protect	GAME	4.3	4000433	42M	100000000	0	Everyone	{Arcade}	2018-08-02	1.9.1	4.0 and up
292	Guns of Boom - Online Shooter	GAME	4.4	3941129	77M	50000000	0	Teen	{Action}	2018-07-16	3.12.0	3.0 and up
293	LinkedIn	SPORTS	4.2	3909032	51M	100000000	0	Everyone	{Sports}	2018-07-31	10.5.00	4.1 and up
294	Super Mario Run	GAME	4.6	3883589	57M	100000000	0	Everyone	{Casual}	2018-07-26	2.21.1	4.1 and up
295	Angry Birds Star Wars	FAMILY	4.6	3881752	57M	100000000	0	Everyone	{Casual}	2018-07-26	2.21.1	4.1 and up
296	AVG Cleaner – Speed, Battery & Memory Booster	SHOPPING	4.7	3860225	Varies with device	50000000	0	Everyone	{Shopping}	2018-08-03	Varies with device	Varies with device
297	Ant Smasher by Best Cool & Fun Games	GAME	4.2	3846378	82M	50000000	0	Everyone	{Racing}	2018-05-30	2.8.2	4.1 and up
298	POF Free Dating App	GAME	4.2	3816799	32M	100000000	0	Everyone	{Action}	2018-07-23	2.2.8	4.0.3 and up
299	Norton Security and Antivirus	GAME	4.2	3815614	32M	100000000	0	Everyone	{Action}	2018-07-23	2.2.8	4.0.3 and up
300	Bad Piggies	SOCIAL	4.3	3806669	Varies with device	100000000	0	Mature 17+	{Social}	2018-08-01	Varies with device	Varies with device
301	Skater Boy	SOCIAL	4.3	3806669	Varies with device	100000000	0	Mature 17+	{Social}	2018-08-01	Varies with device	Varies with device
302	Pixlr – Free Photo Editor	SOCIAL	4.3	3781770	Varies with device	100000000	0	Mature 17+	{Social}	2018-08-02	Varies with device	Varies with device
303	TripAdvisor Hotels Flights Restaurants Attractions	SOCIAL	4.3	3781770	Varies with device	100000000	0	Mature 17+	{Social}	2018-08-02	Varies with device	Varies with device
304	Sweet Selfie - selfie camera, beauty cam, photo edit	SOCIAL	4.3	3781770	Varies with device	100000000	0	Mature 17+	{Social}	2018-08-02	Varies with device	Varies with device
305	ooVoo Video Calls, Messaging & Stories	SOCIAL	4.3	3781467	Varies with device	100000000	0	Mature 17+	{Social}	2018-08-02	Varies with device	Varies with device
306	ZenUI Launcher	GAME	4.5	3778921	75M	100000000	0	Everyone	{Arcade}	2018-07-26	3.8.5.Go	4.1 and up
307	Granny	GAME	4.5	3777822	75M	100000000	0	Everyone	{Arcade}	2018-07-26	3.8.5.Go	4.1 and up
308	DU Browser—Browse fast & fun	GAME	4.4	3716278	36M	50000000	0	Teen	{Action}	2018-07-24	0.7.0	4.3 and up
309	Muslim Pro - Prayer Times, Azan, Quran & Qibla	GAME	4.4	3715656	36M	50000000	0	Teen	{Action}	2018-07-24	0.7.0	4.3 and up
310	Talking Tom & Ben News	GAME	4.4	3714270	36M	50000000	0	Teen	{Action}	2018-07-24	0.7.0	4.3 and up
311	WhatsCall Free Global Phone Call App & Cheap Calls	GAME	4.4	3697174	36M	50000000	0	Teen	{Action}	2018-07-24	0.7.0	4.3 and up
312	Pixel Art: Color by Number Game	COMMUNICATION	4.4	3648765	3.3M	100000000	0	Teen	{Communication}	2018-07-18	11.4.0	4.0 and up
313	Blossom Blast Saga	COMMUNICATION	4.4	3648480	3.3M	100000000	0	Teen	{Communication}	2018-07-18	11.4.0	4.0 and up
314	Live Hold’em Pro Poker - Free Casino Games	COMMUNICATION	4.4	3648120	3.3M	100000000	0	Teen	{Communication}	2018-07-18	11.4.0	4.0 and up
315	Nova Launcher	GAME	4.4	3452530	68M	100000000	0	Everyone	{Action}	2018-02-07	1.9.6.6	4.0.3 and up
316	happn – Local dating app	SPORTS	4.4	3451011	Varies with device	50000000	0	Everyone	{Sports}	2018-07-26	7.4	4.1 and up
317	Rolling Sky	COMMUNICATION	4	3419513	Varies with device	1000000000	0	Everyone	{Communication}	2018-07-21	Varies with device	Varies with device
318	Hotspot Shield Free VPN Proxy & Wi-Fi Security	COMMUNICATION	4	3419464	Varies with device	1000000000	0	Everyone	{Communication}	2018-07-21	Varies with device	Varies with device
319	Tom Loves Angela	COMMUNICATION	4	3419433	Varies with device	1000000000	0	Everyone	{Communication}	2018-07-21	Varies with device	Varies with device
320	Learn languages, grammar & vocabulary with Memrise	COMMUNICATION	4	3419249	Varies with device	1000000000	0	Everyone	{Communication}	2018-07-21	Varies with device	Varies with device
321	Emoji keyboard - Cute Emoticons, GIF, Stickers	PHOTOGRAPHY	4.4	3368705	Varies with device	100000000	0	Everyone	{Photography}	2018-07-16	4.47	4.0.3 and up
322	Harry Potter: Hogwarts Mystery	PHOTOGRAPHY	4.4	3368649	Varies with device	100000000	0	Everyone	{Photography}	2018-07-16	4.47	4.0.3 and up
323	Anti-virus Dr.Web Light	PHOTOGRAPHY	4.4	3368646	Varies with device	100000000	0	Everyone	{Photography}	2018-07-16	4.47	4.0.3 and up
324	MyVodafone (India) - Online Recharge & Pay Bills	GAME	4.4	3344300	22M	50000000	0	Everyone 10+	{Racing}	2018-07-24	2.12.1	4.1 and up
325	Azar	PHOTOGRAPHY	4.6	3337956	Varies with device	100000000	0	Everyone	{Photography}	2018-08-06	Varies with device	Varies with device
326	Draw Something Classic	PHOTOGRAPHY	4.6	3337952	Varies with device	100000000	0	Everyone	{Photography}	2018-08-06	Varies with device	Varies with device
327	The birth	PERSONALIZATION	4.5	3277209	7.6M	100000000	0	Everyone	{Personalization}	2018-05-09	3.2.5	4.0 and up
328	Doodle Jump	PRODUCTIVITY	4.3	3252896	50M	100000000	0	Everyone	{Productivity}	2018-08-02	2.2.194	4.4 and up
329	Microsoft Excel	PRODUCTIVITY	4.3	3249518	50M	100000000	0	Everyone	{Productivity}	2018-08-02	2.2.194	4.4 and up
330	3D Bowling	FAMILY	4.3	3213548	55M	100000000	0	Everyone 10+	{Entertainment}	2018-07-25	5.3.5.16	4.1 and up
331	Z Camera - Photo Editor, Beauty Selfie, Collage	GAME	4.5	3198176	82M	100000000	0	Everyone	{Arcade}	2018-07-12	2.8.0	4.0.3 and up
332	Downloader & Private Browser	GAME	4.5	3197865	82M	100000000	0	Everyone	{Arcade}	2018-07-12	2.8.0	4.0.3 and up
333	SKOUT - Meet, Chat, Go Live	PHOTOGRAPHY	4.4	3158151	53M	100000000	0	Everyone	{Photography}	2018-07-31	6.9.031	4.1 and up
334	APUS Booster - Space Cleaner & Booster	PHOTOGRAPHY	4.4	3158151	53M	100000000	0	Everyone	{Photography}	2018-07-31	6.9.031	4.1 and up
335	Zalo – Video Call	PHOTOGRAPHY	4.4	3158047	53M	100000000	0	Everyone	{Photography}	2018-07-31	6.9.031	4.1 and up
336	Five Nights at Freddy’s 3 Demo	PHOTOGRAPHY	4.4	3157936	53M	100000000	0	Everyone	{Photography}	2018-07-31	6.9.031	4.1 and up
337	Microsoft OneDrive	PHOTOGRAPHY	4.4	3156484	53M	100000000	0	Everyone	{Photography}	2018-07-31	6.9.031	4.1 and up
338	Domino’s Pizza USA	COMMUNICATION	4.4	3128611	Varies with device	100000000	0	Mature 17+	{Communication}	2018-07-27	Varies with device	Varies with device
339	VLC for Android	COMMUNICATION	4.4	3128509	Varies with device	100000000	0	Mature 17+	{Communication}	2018-07-27	Varies with device	Varies with device
340	Speedtest by Ookla	COMMUNICATION	4.4	3128250	Varies with device	100000000	0	Mature 17+	{Communication}	2018-07-27	Varies with device	Varies with device
341	Photo Collage Editor	GAME	4.6	3093932	Varies with device	10000000	0	Everyone	{Casual}	2018-07-13	1.8.0.900	4.0.3 and up
342	KIM KARDASHIAN: HOLLYWOOD	GAME	4.6	3093358	Varies with device	10000000	0	Everyone	{Casual}	2018-07-13	1.8.0.900	4.0.3 and up
343	SNOW - AR Camera	TOOLS	4.6	3090727	Varies with device	100000000	0	Everyone	{Tools}	2018-07-31	Varies with device	Varies with device
344	Toca Kitchen 2	TOOLS	4.6	3090680	Varies with device	100000000	0	Everyone	{Tools}	2018-07-31	Varies with device	Varies with device
345	LINE WEBTOON - Free Comics	COMMUNICATION	4.4	3075118	Varies with device	100000000	0	Everyone	{Communication}	2018-07-10	Varies with device	Varies with device
346	KineMaster – Pro Video Editor	COMMUNICATION	4.4	3075096	Varies with device	100000000	0	Everyone	{Communication}	2018-07-10	Varies with device	Varies with device
347	3D Tennis	COMMUNICATION	4.4	3075028	Varies with device	100000000	0	Everyone	{Communication}	2018-07-10	Varies with device	Varies with device
348	Kick the Buddy	GAME	4.6	3073251	33M	50000000	0	Everyone 10+	{Action}	2018-07-25	4.1.1	4.1 and up
349	OfficeSuite : Free Office + PDF Editor	PERSONALIZATION	4.6	3062845	7.4M	100000000	0	Everyone	{Personalization}	2018-08-03	4.0.8552	4.0.3 and up
350	Family Guy The Quest for Stuff	GAME	4.4	3058687	89M	100000000	0	Everyone 10+	{Arcade}	2016-07-18	1.2.0	4.0 and up
351	Zombie Catchers	GAME	4.4	3057481	14M	50000000	0	Teen	{Strategy}	2018-07-26	1.76	2.3 and up
352	Wrestling Revolution 3D	GAME	4.4	3039889	18M	10000000	0	Mature 17+	{Action}	2018-06-27	1.18.2	4.0 and up
353	Vault-Hide SMS,Pics & Videos,App Lock,Cloud backup	PRODUCTIVITY	4.3	3016305	Varies with device	100000000	0	Everyone	{Productivity}	2018-04-17	Varies with device	Varies with device
354	Weather by WeatherBug: Forecast, Radar & Alerts	PRODUCTIVITY	4.3	3016297	Varies with device	100000000	0	Everyone	{Productivity}	2018-04-17	Varies with device	Varies with device
355	letgo: Buy & Sell Used Stuff, Cars & Real Estate	PRODUCTIVITY	4.3	3014548	Varies with device	100000000	0	Everyone	{Productivity}	2018-04-17	Varies with device	Varies with device
356	S Photo Editor - Collage Maker , Photo Collage	SOCIAL	4.4	2955326	Varies with device	100000000	0	Mature 17+	{Social}	2018-08-01	Varies with device	Varies with device
357	Magisto Video Editor & Maker	SOCIAL	4.4	2955325	Varies with device	100000000	0	Mature 17+	{Social}	2018-08-01	Varies with device	Varies with device
358	Itau bank	SOCIAL	4.4	2953886	Varies with device	100000000	0	Mature 17+	{Social}	2018-08-01	Varies with device	Varies with device
359	DEER HUNTER 2018	BOOKS_AND_REFERENCE	4.6	2915189	Varies with device	100000000	0	Teen	{"Books & Reference"}	2018-08-01	Varies with device	Varies with device
360	Mobizen Screen Recorder for SAMSUNG	BOOKS_AND_REFERENCE	4.6	2914724	Varies with device	100000000	0	Teen	{"Books & Reference"}	2018-08-01	Varies with device	Varies with device
361	CM FILE MANAGER	GAME	4.3	2903386	58M	100000000	0	Mature 17+	{Action}	2018-07-24	3.2.1c	4.0 and up
362	Bike Racing 3D	COMMUNICATION	4.4	2876500	24M	100000000	0	Everyone	{Communication}	2018-08-01	7.73	4.0 and up
363	Lookout Security & Antivirus	FAMILY	4.3	2838064	Varies with device	100000000	0	Everyone	{Casual}	2018-08-06	Varies with device	Varies with device
364	Dailyhunt (Newshunt) - Latest News, Viral Videos	LIFESTYLE	4	2789775	68M	100000000	0	Mature 17+	{Lifestyle}	2018-08-02	9.5.0	4.4 and up
365	Block Strike	SHOPPING	4.4	2788923	Varies with device	100000000	0	Teen	{Shopping}	2018-07-30	Varies with device	Varies with device
366	Block Craft 3D: Building Simulator Games For Free	SHOPPING	4.4	2788923	Varies with device	100000000	0	Teen	{Shopping}	2018-07-30	Varies with device	Varies with device
367	MAPS.ME – Offline Map and Travel Navigation	SHOPPING	4.4	2788923	Varies with device	100000000	0	Teen	{Shopping}	2018-07-30	Varies with device	Varies with device
368	The Sims™ FreePlay	SHOPPING	4.4	2788923	Varies with device	100000000	0	Teen	{Shopping}	2018-07-30	Varies with device	Varies with device
369	Boomerang from Instagram	SHOPPING	4.4	2788460	Varies with device	100000000	0	Teen	{Shopping}	2018-07-30	Varies with device	Varies with device
370	JW Library	PRODUCTIVITY	4.5	2764964	Varies with device	100000000	0	Everyone	{Productivity}	2018-08-02	Varies with device	Varies with device
371	LIKE – Magic Video Maker & Community	GAME	4.6	2750645	Varies with device	100000000	0	Everyone	{Racing}	2018-08-02	1.17.2	4.2 and up
372	Card Wars Kingdom	GAME	4.6	2750410	Varies with device	100000000	0	Everyone	{Racing}	2018-08-02	1.17.2	4.2 and up
373	Adobe Photoshop Express:Photo Editor Collage Maker	PRODUCTIVITY	4.4	2731211	Varies with device	1000000000	0	Everyone	{Productivity}	2018-08-06	Varies with device	Varies with device
374	Onefootball - Soccer Scores	PRODUCTIVITY	4.4	2731211	Varies with device	1000000000	0	Everyone	{Productivity}	2018-08-06	Varies with device	Varies with device
375	World Series of Poker – WSOP Free Texas Holdem	PRODUCTIVITY	4.4	2731171	Varies with device	1000000000	0	Everyone	{Productivity}	2018-08-06	Varies with device	Varies with device
376	Amazon Shopping	PRODUCTIVITY	4.4	2728941	Varies with device	1000000000	0	Everyone	{Productivity}	2018-07-30	Varies with device	Varies with device
377	Google Play Movies & TV	FAMILY	4.6	2721923	25M	10000000	0	Teen	{Simulation}	2018-06-11	1.13.12	4.1 and up
378	Mobile Strike	GAME	4.6	2719142	25M	10000000	0	Teen	{Simulation}	2018-06-11	1.13.12	4.1 and up
379	C Launcher: Themes, Wallpapers, DIY, Smart, Clean	GAME	4.6	2698889	78M	100000000	0	Everyone	{Action}	2018-07-31	2.8.2.59	4.1 and up
380	Jaumo Dating, Flirt & Live Video	GAME	4.6	2698882	78M	100000000	0	Everyone	{Action}	2018-07-31	2.8.2.59	4.1 and up
381	My Boo - Your Virtual Pet Game	GAME	4.6	2698348	78M	100000000	0	Everyone	{Action}	2018-07-31	2.8.2.59	4.1 and up
382	Dictionary.com: Find Definitions for English Words	GAME	4.6	2694969	78M	100000000	0	Everyone	{Action}	2018-07-31	2.8.2.59	4.1 and up
383	Fame Boom for Real Followers, Likes	TOOLS	4.6	2674051	26M	50000000	0	Everyone	{Tools}	2018-08-06	2.1.69	4.0.3 and up
384	Video Downloader for Facebook	FAMILY	4.5	2634605	63M	10000000	0	Everyone	{"Role Playing"}	2018-07-18	3.0.27430.4799	4.4 and up
385	Five Nights at Freddy’s 4 Demo	GAME	4.4	2610680	46M	100000000	0	Everyone	{Arcade}	2018-07-03	2.6.9	4.1 and up
386	aa	GAME	4.4	2610622	46M	100000000	0	Everyone	{Arcade}	2018-07-03	2.6.9	4.1 and up
387	CCleaner	GAME	4.4	2610526	46M	100000000	0	Everyone	{Arcade}	2018-07-03	2.6.9	4.1 and up
388	Google News	GAME	4.4	2610328	46M	100000000	0	Everyone	{Arcade}	2018-07-03	2.6.9	4.1 and up
389	MegaN64 (N64 Emulator)	TOOLS	4.7	2598579	49M	50000000	0	Everyone	{Tools}	2018-07-24	11.17.4.1024	4.1 and up
390	Brightest Flashlight - LED Light	PERSONALIZATION	4.4	2591941	Varies with device	100000000	0	Everyone	{Personalization}	2018-07-20	Varies with device	Varies with device
391	Alarm Clock: Stopwatch & Timer	PERSONALIZATION	4.4	2591610	Varies with device	100000000	0	Everyone	{Personalization}	2018-07-20	Varies with device	Varies with device
392	Basketball Stars	VIDEO_PLAYERS	4.8	2588730	9.7M	50000000	0	Everyone	{"Video Players & Editors"}	2018-07-30	1.7.1.3	5.0 and up
393	Euro Truck Driver (Simulator)	GAME	4.5	2586261	Varies with device	100000000	0	Everyone	{Racing}	2018-07-31	7.7.9	4.2 and up
394	Google Calendar	COMMUNICATION	4.3	2546549	Varies with device	100000000	0	Everyone	{Communication}	2018-08-03	Varies with device	Varies with device
395	OLX - Buy and Sell	COMMUNICATION	4.3	2546527	Varies with device	100000000	0	Everyone	{Communication}	2018-08-03	Varies with device	Varies with device
396	Google Now Launcher	COMMUNICATION	4.3	2546527	Varies with device	100000000	0	Everyone	{Communication}	2018-08-03	Varies with device	Varies with device
397	Last Empire - War Z: Strategy	COMMUNICATION	4.5	2511130	Varies with device	50000000	0	Everyone	{Communication}	2018-07-02	Varies with device	Varies with device
398	PhotoWonder: Pro Beauty Photo Editor Collage Maker	COMMUNICATION	4.4	2473795	Varies with device	100000000	0	Everyone	{Communication}	2018-07-31	47.1.2249.129326	Varies with device
399	LOVOO	COMMUNICATION	4.4	2473693	Varies with device	100000000	0	Everyone	{Communication}	2018-07-31	47.1.2249.129326	Varies with device
400	QuickPic - Photo Gallery with Google Drive Support	COMMUNICATION	4.4	2473509	Varies with device	100000000	0	Everyone	{Communication}	2018-07-31	47.1.2249.129326	Varies with device
401	BMX Boy	GAME	4.3	2468915	92M	50000000	0	Teen	{Action}	2018-07-30	19.1.0	4.0.3 and up
402	Cricbuzz - Live Cricket Scores & News	GAME	4.3	2468063	92M	50000000	0	Teen	{Action}	2018-07-30	19.1.0	4.0.3 and up
403	Mail.Ru - Email App	COMMUNICATION	4.3	2451136	Varies with device	100000000	0	Teen	{Communication}	2018-08-03	Varies with device	Varies with device
404	Modern Strike Online	COMMUNICATION	4.3	2451093	Varies with device	100000000	0	Teen	{Communication}	2018-08-03	Varies with device	Varies with device
405	Angry Birds Friends	COMMUNICATION	4.3	2451083	Varies with device	100000000	0	Teen	{Communication}	2018-08-03	Varies with device	Varies with device
406	Perfect Piano	GAME	4.4	2440877	32M	10000000	0	Teen	{Action}	2018-06-14	2.21	4.0 and up
407	Runtastic Running App & Mile Tracker	BOOKS_AND_REFERENCE	4.7	2440695	Varies with device	100000000	0	Teen	{"Books & Reference"}	2018-08-02	Varies with device	Varies with device
408	Snapseed	PHOTOGRAPHY	4.4	2418165	Varies with device	100000000	0	Everyone	{Photography}	2018-07-12	Varies with device	Varies with device
409	FIFA 16 Soccer	PHOTOGRAPHY	4.4	2418158	Varies with device	100000000	0	Everyone	{Photography}	2018-07-12	Varies with device	Varies with device
410	No Crop & Square for Instagram	PHOTOGRAPHY	4.4	2418135	Varies with device	100000000	0	Everyone	{Photography}	2018-07-12	Varies with device	Varies with device
411	Google Docs	PHOTOGRAPHY	4.4	2418135	Varies with device	100000000	0	Everyone	{Photography}	2018-07-12	Varies with device	Varies with device
412	Diary with lock	PRODUCTIVITY	4.6	2401017	Varies with device	100000000	0	Everyone	{Productivity}	2018-06-27	Varies with device	Varies with device
413	Amazon Kindle	PRODUCTIVITY	4.6	2401017	Varies with device	100000000	0	Everyone	{Productivity}	2018-06-27	Varies with device	Varies with device
414	InstaSize Photo Filters & Collage Editor	PERSONALIZATION	4.6	2390185	Varies with device	100000000	0	Teen	{Personalization}	2018-08-04	Varies with device	Varies with device
415	Stick War: Legacy	PERSONALIZATION	4.6	2390099	Varies with device	100000000	0	Teen	{Personalization}	2018-08-04	Varies with device	Varies with device
416	Choices: Stories You Play	FAMILY	4.5	2376564	Varies with device	10000000	6.99	Everyone 10+	{Arcade,"Action & Adventure"}	2018-07-24	1.5.2.1	Varies with device
417	Crisis Action: 2018 NO.1 FPS	FAMILY	4.5	2375336	Varies with device	10000000	6.99	Everyone 10+	{Arcade,"Action & Adventure"}	2018-07-24	1.5.2.1	Varies with device
418	VPN Free - Betternet Hotspot VPN & Private Browser	WEATHER	4.4	2371543	11M	50000000	0	Everyone	{Weather}	2018-06-04	5.9.4.0	4.0.3 and up
419	Lep’s World 2 🍀🍀	SPORTS	4.5	2371338	37M	50000000	0	Teen	{Sports}	2017-07-24	1.9.3097721	2.3.3 and up
420	Just Dance Now	FAMILY	4.6	2354042	72M	50000000	0	Everyone 10+	{"Role Playing"}	2018-07-03	4.2.0	4.0.3 and up
421	Colorfy: Coloring Book for Adults - Free	SOCIAL	4.4	2349421	39M	100000000	0	Teen	{Social}	2018-07-27	4.1.0	4.0 and up
422	Piano Free - Keyboard with Magic Tiles Music Games	TRAVEL_AND_LOCAL	4.3	2339098	Varies with device	100000000	0	Everyone	{"Travel & Local"}	2018-06-18	9.2.17.13	4.1 and up
423	PES CLUB MANAGER	TRAVEL_AND_LOCAL	4.3	2338655	Varies with device	100000000	0	Everyone	{"Travel & Local"}	2018-06-18	9.2.17.13	4.1 and up
424	Android Messages	FAMILY	4.6	2312084	Varies with device	100000000	0	Teen	{Entertainment}	2018-07-25	Varies with device	4.3 and up
425	Bomber Friends	GAME	4.5	2311785	87M	10000000	0	Teen	{Action}	2018-08-01	1.9.3	4.1 and up
426	Lep’s World 3 🍀🍀🍀	GAME	4.5	2308916	87M	10000000	0	Teen	{Action}	2018-08-01	1.9.3	4.1 and up
427	2GIS: directory & navigator	COMMUNICATION	4.6	2265084	6.1M	50000000	0	Everyone	{Communication}	2018-07-31	5.22.18.0006	4.0 and up
428	Bad Piggies HD	COMMUNICATION	4.6	2264916	6.1M	50000000	0	Everyone	{Communication}	2018-07-31	5.22.18.0006	4.0 and up
429	Block City Wars + skins export	GAME	4.3	2251012	52M	100000000	0	Everyone	{Racing}	2018-05-03	4.17.2	4.0 and up
430	Geometry Dash World	TOOLS	4.6	2246379	5.1M	50000000	0	Everyone	{Tools}	2018-06-28	2.1.4	4.0 and up
431	MakeupPlus - Your Own Virtual Makeup Artist	FAMILY	4.2	2233681	97M	50000000	0	Teen	{Strategy}	2018-08-01	3.44.0	2.3.3 and up
432	File Commander - File Manager/Explorer	PHOTOGRAPHY	4.7	2163282	Varies with device	50000000	0	Everyone	{Photography}	2018-07-10	Varies with device	Varies with device
433	VSCO	GAME	4.6	2158580	Varies with device	10000000	0	Everyone	{Puzzle}	2018-07-19	2.21.5	4.0.3 and up
434	Bus Rush: Subway Edition	GAME	4.6	2157930	Varies with device	10000000	0	Everyone	{Puzzle}	2018-07-19	2.21.5	4.0.3 and up
435	AZ Screen Recorder - No Root	GAME	4.6	2157930	Varies with device	10000000	0	Everyone	{Puzzle}	2018-07-19	2.21.5	4.0.3 and up
436	Photo Collage Maker	GAME	4.3	2151039	75M	50000000	0	Teen	{Action}	2018-08-01	2.6.61	4.0.3 and up
437	GasBuddy: Find Cheap Gas	ENTERTAINMENT	4.6	2133296	Varies with device	50000000	0	Teen	{Entertainment}	2018-07-31	Varies with device	Varies with device
438	Hello English: Learn English	FAMILY	4.6	2133047	Varies with device	50000000	0	Teen	{Entertainment}	2018-07-31	Varies with device	Varies with device
439	FINAL FANTASY BRAVE EXVIUS	TRAVEL_AND_LOCAL	4.2	2129707	Varies with device	1000000000	0	Everyone	{"Travel & Local"}	2018-08-06	Varies with device	Varies with device
440	AppLock - Fingerprint	TRAVEL_AND_LOCAL	4.2	2129689	Varies with device	1000000000	0	Everyone	{"Travel & Local"}	2018-08-06	Varies with device	Varies with device
441	File Manager	GAME	4.4	2123793	49M	100000000	0	Everyone	{Puzzle}	2018-07-05	3.7.2	4.1 and up
442	WWE	GAME	4.4	2123381	49M	100000000	0	Everyone	{Puzzle}	2018-07-05	3.7.2	4.1 and up
443	LINE Launcher	FAMILY	4.4	2122705	49M	100000000	0	Everyone	{Puzzle}	2018-07-05	3.7.2	4.1 and up
444	Family Locator - GPS Tracker	GAME	4.4	2119235	70M	50000000	0	Everyone 10+	{Action}	2018-06-29	3.0.1	4.1 and up
445	Cover Fire: offline shooting games for free	GAME	4.4	2119218	70M	50000000	0	Everyone 10+	{Action}	2018-06-29	3.0.1	4.1 and up
446	Vegas Crime Simulator	PRODUCTIVITY	4.5	2084126	Varies with device	500000000	0	Everyone	{Productivity}	2018-07-11	16.0.10325.20043	4.4 and up
447	Dungeon Hunter 5 – Action RPG	PRODUCTIVITY	4.5	2084125	Varies with device	500000000	0	Everyone	{Productivity}	2018-07-11	16.0.10325.20043	4.4 and up
448	PowerDirector Video Editor App: 4K, Slow Mo & More	COMMUNICATION	4.6	2083237	Varies with device	500000000	0	Everyone	{Communication}	2018-07-31	37.1.206017801.DR37_RC14	4.4 and up
449	PhotoDirector Photo Editor App	COMMUNICATION	4.6	2083237	Varies with device	500000000	0	Everyone	{Communication}	2018-07-31	37.1.206017801.DR37_RC14	4.4 and up
586	Eyes - The Scary Horror Game Adventure	GAME	4.3	1295625	11M	100000000	0	Everyone	{Puzzle}	2018-04-11	4	4.1 and up
450	Words With Friends – Play Free	PRODUCTIVITY	4.5	2078744	Varies with device	500000000	0	Everyone	{Productivity}	2018-07-11	16.0.10325.20043	4.4 and up
451	Nike+ Run Club	WEATHER	4.4	2053404	Varies with device	50000000	0	Everyone	{Weather}	2018-08-06	Varies with device	Varies with device
452	Credit Karma	WEATHER	4.4	2052407	Varies with device	50000000	0	Everyone	{Weather}	2018-08-02	Varies with device	Varies with device
453	Tom’s Love Letters	GAME	4.3	2045554	28M	50000000	0	Teen	{"Role Playing"}	2018-07-30	4.0.1	4.0.3 and up
454	Talking Ginger 2	GAME	4.4	1986068	52M	50000000	0	Teen	{Casino}	2018-07-25	21.54	4.1 and up
455	ICQ — Video Calls & Chat Messenger	VIDEO_PLAYERS	4.2	1971777	29M	100000000	0	Teen	{"Video Players & Editors"}	2018-05-11	2.35.8	4.1 and up
456	Racing Moto	GAME	4.7	1889582	Varies with device	50000000	0	Everyone	{Puzzle}	2018-07-23	5423	4.1 and up
457	Reddit: Social News, Trending Memes & Funny Videos	GAME	4.7	1889250	Varies with device	50000000	0	Everyone	{Puzzle}	2018-07-23	5423	4.1 and up
458	Quik – Free Video Editor for photos, clips, music	HEALTH_AND_FITNESS	4.6	1873523	Varies with device	50000000	0	Everyone	{"Health & Fitness"}	2018-07-31	Varies with device	Varies with device
459	Lep’s World 🍀	HEALTH_AND_FITNESS	4.6	1873523	Varies with device	50000000	0	Everyone	{"Health & Fitness"}	2018-07-31	Varies with device	Varies with device
460	Zello PTT Walkie Talkie	HEALTH_AND_FITNESS	4.6	1873520	Varies with device	50000000	0	Everyone	{"Health & Fitness"}	2018-07-31	Varies with device	Varies with device
461	Google Keep	HEALTH_AND_FITNESS	4.6	1873520	Varies with device	50000000	0	Everyone	{"Health & Fitness"}	2018-07-31	Varies with device	Varies with device
462	Heroes of Order & Chaos	HEALTH_AND_FITNESS	4.6	1873516	Varies with device	50000000	0	Everyone	{"Health & Fitness"}	2018-07-31	Varies with device	Varies with device
463	Talking Tom Bubble Shooter	PHOTOGRAPHY	4.3	1871421	Varies with device	100000000	0	Everyone	{Photography}	2017-12-21	Varies with device	Varies with device
464	PAC-MAN	PHOTOGRAPHY	4.3	1871416	Varies with device	100000000	0	Everyone	{Photography}	2017-12-21	Varies with device	Varies with device
465	ivi - movies and TV shows in HD	PRODUCTIVITY	4.4	1861310	61M	500000000	0	Everyone	{Productivity}	2018-08-01	Varies with device	Varies with device
466	Calculator Plus Free	PRODUCTIVITY	4.4	1861309	61M	500000000	0	Everyone	{Productivity}	2018-08-01	Varies with device	Varies with device
467	Indeed Job Search	PRODUCTIVITY	4.4	1860844	61M	500000000	0	Everyone	{Productivity}	2018-08-01	Varies with device	Varies with device
468	LEGO® Juniors Create & Cruise	TOOLS	4.2	1859115	Varies with device	500000000	0	Everyone	{Tools}	2018-07-31	Varies with device	Varies with device
469	RAR	TOOLS	4.2	1859109	Varies with device	500000000	0	Everyone	{Tools}	2018-07-31	Varies with device	Varies with device
470	365Scores - Live Scores	TOOLS	4.2	1855262	Varies with device	500000000	0	Everyone	{Tools}	2018-07-31	Varies with device	Varies with device
471	Bukalapak - Buy and Sell Online	FAMILY	4.4	1852384	Varies with device	10000000	0	Everyone	{Simulation}	2018-07-13	9.3.6	4.0.3 and up
472	Flight Simulator: Fly Plane 3D	FAMILY	4.3	1842381	Varies with device	50000000	0	Teen	{Simulation}	2018-07-31	Varies with device	Varies with device
473	PayPal	GAME	4.3	1841061	Varies with device	50000000	0	Teen	{Simulation}	2018-07-31	Varies with device	Varies with device
474	imo beta free calls and text	FAMILY	4.3	1838090	Varies with device	100000000	0	Everyone 10+	{Casual}	2018-07-27	Varies with device	4.1 and up
475	Pregnancy Tracker & Countdown to Baby Due Date	TRAVEL_AND_LOCAL	4.7	1830388	Varies with device	100000000	0	Everyone	{"Travel & Local"}	2018-08-06	Varies with device	Varies with device
476	Rider	TRAVEL_AND_LOCAL	4.7	1830388	Varies with device	100000000	0	Everyone	{"Travel & Local"}	2018-08-06	Varies with device	Varies with device
477	InstaBeauty -Makeup Selfie Cam	TRAVEL_AND_LOCAL	4.7	1830387	Varies with device	100000000	0	Everyone	{"Travel & Local"}	2018-08-06	Varies with device	Varies with device
478	Movies by Flixster, with Rotten Tomatoes	ENTERTAINMENT	3.7	1828284	52M	100000000	0	Everyone	{Entertainment}	2018-07-12	2.8.2	4.1 and up
479	Soccer Star 2018 Top Leagues · MLS Soccer Games	PRODUCTIVITY	4.3	1827212	Varies with device	50000000	0	Everyone	{Productivity}	2018-07-31	3.6.0.28	4.4 and up
480	DRAGON BALL Z DOKKAN BATTLE	FAMILY	4.3	1805398	55M	50000000	0	Teen	{Entertainment}	2018-06-11	6.5.2	4.4 and up
481	Microsoft Launcher	FAMILY	4.2	1752017	52M	100000000	0	Everyone	{Entertainment}	2018-07-05	2.5.6.11	4.1 and up
482	Avast Cleanup & Boost, Phone Cleaner, Optimizer	GAME	4.5	1736105	14M	10000000	0	Mature 17+	{Action}	2014-05-16	3.0.4	2.1 and up
483	ai.type Free Emoji Keyboard	GAME	4.7	1732263	78M	50000000	0	Everyone	{Puzzle}	2018-07-17	4.8.4	3.0 and up
484	BitTorrent®- Torrent Downloads	GAME	4.1	1728557	Varies with device	50000000	0	Everyone	{Card}	2017-09-20	Varies with device	Varies with device
485	Beach Buggy Blitz	SPORTS	4.4	1721943	26M	10000000	0	Everyone	{Sports}	2018-06-27	2.3.2	5.0 and up
486	We Heart It	GAME	4.3	1704112	Varies with device	50000000	0	Everyone	{Word}	2018-07-11	Varies with device	Varies with device
487	The Simpsons™: Tapped Out	GAME	4.1	1703479	Varies with device	100000000	0	Everyone	{Arcade}	2018-07-22	1.3.8	4.1 and up
488	Virtual Families 2	SPORTS	4.4	1690802	58M	50000000	0	Everyone	{Sports}	2018-05-21	2.3.1	4.0 and up
489	Square InPic - Photo Editor & Collage Maker	FAMILY	4.2	1671658	Varies with device	50000000	0	Teen	{Casual}	2018-07-12	Varies with device	Varies with device
490	Bullet Force	PHOTOGRAPHY	4.6	1656808	Varies with device	50000000	0	Everyone	{Photography}	2018-07-31	9.14.1	4.4 and up
491	ASUS PixelMaster Camera	TOOLS	4.3	1648515	7.1M	100000000	0	Everyone	{Tools}	2018-08-02	5.42.1	2.3 and up
492	iKeyboard - emoji, emoticons	ENTERTAINMENT	4.3	1633682	57M	100000000	0	Everyone	{Entertainment}	2018-07-03	3.5.2.2	4.1 and up
493	Mico- Stranger Chat Random video Chat, Live, Meet	FAMILY	4.3	1633565	57M	100000000	0	Everyone	{Entertainment}	2018-07-03	3.5.2.2	4.1 and up
494	Inside Out Thought Bubbles	VIDEO_PLAYERS	4.3	1615596	Varies with device	50000000	0	Teen	{"Video Players & Editors"}	2018-08-03	Varies with device	4.0.3 and up
495	Where is my Train : Indian Railway & PNR Status	VIDEO_PLAYERS	4.3	1615418	Varies with device	50000000	0	Teen	{"Video Players & Editors"}	2018-08-03	Varies with device	4.0.3 and up
496	Flashlight HD LED	SPORTS	4.5	1605267	Varies with device	10000000	0	Everyone	{Sports}	2016-12-05	Varies with device	Varies with device
497	Microsoft PowerPoint	GAME	4.4	1604146	57M	10000000	0	Teen	{Action}	2018-06-27	4.8.0	4.1 and up
498	Free GPS Navigation	GAME	4.6	1591129	48M	50000000	0	Everyone	{Arcade}	2017-12-22	1.01	4.0 and up
499	Robbery Bob	PHOTOGRAPHY	4.5	1579343	Varies with device	100000000	0	Everyone	{Photography}	2018-07-25	Varies with device	Varies with device
500	Moovit: Bus Time & Train Time Live Info	PHOTOGRAPHY	4.5	1579287	Varies with device	100000000	0	Everyone	{Photography}	2018-07-25	Varies with device	Varies with device
501	TouchPal Keyboard - Fun Emoji & Android Keyboard	PHOTOGRAPHY	4.5	1579287	Varies with device	100000000	0	Everyone	{Photography}	2018-07-25	Varies with device	Varies with device
502	PlayStation App	FAMILY	4.3	1574546	37M	50000000	0	Everyone	{Puzzle,"Action & Adventure"}	2018-07-27	6.7.0	4.2 and up
503	Tastely	FAMILY	4.3	1574204	37M	50000000	0	Everyone	{Puzzle,"Action & Adventure"}	2018-07-27	6.7.0	4.2 and up
504	Shopee: No.1 Belanja Online	FAMILY	4.3	1574197	37M	50000000	0	Everyone	{Puzzle,"Action & Adventure"}	2018-07-27	6.7.0	4.2 and up
505	File Browser by Astro (File Manager)	SHOPPING	4.2	1573054	Varies with device	50000000	0	Everyone	{Shopping}	2018-08-02	Varies with device	4.2 and up
506	Shopee: No.1 Online Shopping	GAME	4.7	1559650	Varies with device	50000000	0	Everyone	{Action}	2018-07-09	2.11.1	4.1 and up
507	MakeMyTrip-Flight Hotel Bus Cab IRCTC Rail Booking	WEATHER	4.4	1558437	Varies with device	50000000	0	Everyone	{Weather}	2018-08-01	Varies with device	Varies with device
508	Weaphones™ Gun Sim Free Vol 1	PHOTOGRAPHY	4.5	1536512	Varies with device	50000000	0	Everyone	{Photography}	2018-07-17	Varies with device	Varies with device
509	Fotor Photo Editor - Photo Collage & Photo Effects	GAME	4.7	1536349	Varies with device	50000000	0	Teen	{Action}	2018-07-23	2.12.5	4.1 and up
510	Angry Birds POP Bubble Shooter	GAME	4.7	1535973	Varies with device	50000000	0	Teen	{Action}	2018-07-23	2.12.5	4.1 and up
511	icon wallpaper dressup💞CocoPPa	GAME	4.7	1535973	Varies with device	50000000	0	Teen	{Action}	2018-07-23	2.12.5	4.1 and up
512	free video calls and chat	GAME	4.7	1535581	Varies with device	50000000	0	Teen	{Action}	2018-07-23	2.12.5	4.1 and up
513	Dr.Web Security Space	GAME	4.7	1535084	Varies with device	50000000	0	Teen	{Action}	2018-07-23	2.12.5	4.1 and up
514	Magic Tiles 3	GAME	4.7	1534466	Varies with device	50000000	0	Teen	{Action}	2018-07-23	2.12.5	4.1 and up
515	FaceQ	SOCIAL	4.4	1520959	Varies with device	10000000	0	Teen	{Social}	2018-05-09	Varies with device	Varies with device
516	OfferUp - Buy. Sell. Offer Up	PHOTOGRAPHY	4.5	1519671	Varies with device	100000000	0	Everyone	{Photography}	2018-02-01	Varies with device	Varies with device
517	Real Football	PHOTOGRAPHY	4.3	1517395	Varies with device	100000000	0	Everyone	{Photography}	2018-03-06	Varies with device	Varies with device
518	Hustle Castle: Fantasy Kingdom	PHOTOGRAPHY	4.3	1517369	Varies with device	100000000	0	Everyone	{Photography}	2018-03-06	Varies with device	Varies with device
519	Castle Clash: Epic Empire ES	PRODUCTIVITY	4.5	1508137	37M	100000000	0	Everyone	{Productivity}	2018-07-30	11.1.3	4.0 and up
520	Egg, Inc.	PRODUCTIVITY	4.5	1507205	37M	100000000	0	Everyone	{Productivity}	2018-07-30	11.1.3	4.0 and up
521	Kill Shot Bravo: Sniper FPS	FAMILY	4.8	1506783	89M	10000000	0	Teen	{"Role Playing"}	2018-07-18	1.2.115	4.0 and up
522	Wikipedia	FAMILY	4.3	1503544	40M	50000000	0	Teen	{Strategy}	2014-11-15	1.07	2.3 and up
523	Advanced Task Killer	PRODUCTIVITY	4.6	1502622	Varies with device	100000000	0	Everyone	{Productivity}	2018-07-03	Varies with device	Varies with device
524	SuperVPN Free VPN Client	GAME	4.2	1500999	33M	100000000	0	Everyone	{Action}	2018-04-09	1.0.6	4.1 and up
525	SpongeBob Diner Dash	GAME	4.2	1500622	33M	100000000	0	Everyone	{Action}	2018-04-09	1.0.6	4.1 and up
526	Mobile Security: Antivirus, Web Scan & App Lock	FAMILY	4.8	1499466	96M	10000000	0	Teen	{Casual}	2018-07-24	1.25.0	4.1 and up
527	Period Tracker Clue: Period and Ovulation Tracker	GAME	4.2	1499373	33M	100000000	0	Everyone	{Action}	2018-04-09	1.0.6	4.1 and up
528	Advanced Download Manager	GAME	4.2	1498648	33M	100000000	0	Everyone	{Action}	2018-04-09	1.0.6	4.1 and up
529	Audiobooks from Audible	PRODUCTIVITY	4.3	1498393	14M	50000000	0	Everyone	{Productivity}	2018-08-02	4.3.2.0	4.2 and up
530	ETERNITY WARRIORS 2	GAME	4.2	1497361	33M	100000000	0	Everyone	{Action}	2018-04-09	1.0.6	4.1 and up
531	Real Estate, Car, Shopping and Others	PHOTOGRAPHY	4.4	1494491	21M	50000000	0	Everyone	{Photography}	2017-03-21	3.3.8	3.1 and up
532	Asphalt Xtreme: Rally Racing	PHOTOGRAPHY	4.4	1490732	21M	50000000	0	Everyone	{Photography}	2018-07-19	4.8.4	4.1 and up
533	Plants vs. Zombies™ 2	PHOTOGRAPHY	4.4	1490722	21M	50000000	0	Everyone	{Photography}	2018-07-19	4.8.4	4.1 and up
534	Mobile Security & Antivirus	PRODUCTIVITY	4.6	1488397	Varies with device	100000000	0	Everyone	{Productivity}	2018-08-03	Varies with device	Varies with device
535	Narrator’s Voice	PRODUCTIVITY	4.6	1488396	Varies with device	100000000	0	Everyone	{Productivity}	2018-08-03	Varies with device	Varies with device
536	DH Texas Poker - Texas Hold’em	PRODUCTIVITY	4.6	1488396	Varies with device	100000000	0	Everyone	{Productivity}	2018-08-03	Varies with device	Varies with device
537	Scoompa Video - Slideshow Maker and Video Editor	PRODUCTIVITY	4.6	1488289	Varies with device	100000000	0	Everyone	{Productivity}	2018-08-03	Varies with device	Varies with device
538	The Sims™ Mobile	GAME	4.2	1485806	33M	100000000	0	Everyone	{Action}	2018-04-09	1.0.6	4.1 and up
539	Endomondo - Running & Walking	GAME	4.6	1480189	Varies with device	10000000	0	Everyone	{Casual}	2018-08-02	5.8.1	Varies with device
540	Star Girl - Fashion, Makeup & Dress Up	GAME	4.6	1480182	Varies with device	10000000	0	Everyone	{Casual}	2018-08-02	5.8.1	Varies with device
541	Xbox	GAME	4.5	1468638	Varies with device	50000000	0	Mature 17+	{Action}	2018-07-23	Varies with device	Varies with device
542	Whoscall - Caller ID & Block	GAME	4.5	1468591	Varies with device	50000000	0	Mature 17+	{Action}	2018-07-23	Varies with device	Varies with device
543	MEGA	FAMILY	4.5	1461698	67M	10000000	0	Everyone 10+	{"Role Playing"}	2018-05-21	0.12.334385	4.1 and up
544	Polaris Office - Word, Docs, Sheets, Slide, PDF	FAMILY	4.5	1455952	Varies with device	10000000	0	Everyone	{Sports,"Action & Adventure"}	2018-05-15	4.3.6	4.0 and up
545	Cash, Inc. Money Clicker Game & Business Adventure	PHOTOGRAPHY	4.6	1451000	Varies with device	50000000	0	Everyone	{Photography}	2018-07-19	Varies with device	Varies with device
546	Anger of stick 5 : zombie	FAMILY	4.6	1450632	Varies with device	10000000	0	Teen	{Entertainment}	2018-08-03	Varies with device	Varies with device
547	Pedometer, Step Counter & Weight Loss Tracker App	BOOKS_AND_REFERENCE	3.9	1433233	Varies with device	1000000000	0	Teen	{"Books & Reference"}	2018-08-03	Varies with device	Varies with device
548	Photo Collage - InstaMag	GAME	4.6	1432809	29M	10000000	0	Mature 17+	{Action}	2018-07-29	3.3	4.0 and up
549	Cytus	GAME	4.4	1432447	59M	50000000	0	Everyone	{Arcade}	2017-11-09	1.3.21	4.0.3 and up
550	Puffin Web Browser	COMMUNICATION	4.4	1429038	Varies with device	100000000	0	Everyone	{Communication}	2018-07-25	37.0.0.7.163	2.3 and up
551	Partymasters - Fun Idle Game	COMMUNICATION	4.4	1429035	Varies with device	100000000	0	Everyone	{Communication}	2018-07-25	37.0.0.7.163	2.3 and up
552	Kate Mobile for VK	WEATHER	4.5	1422858	Varies with device	50000000	0	Everyone	{Weather}	2018-08-03	Varies with device	Varies with device
553	Design Home	MAPS_AND_NAVIGATION	4.4	1421884	33M	50000000	0	Everyone	{"Maps & Navigation"}	2018-07-26	17.4.11	4.0.3 and up
554	ZenUI Keyboard – Emoji, Theme	GAME	4.4	1397944	50M	10000000	0	Teen	{Action}	2018-07-31	0.9.10.f96	4.4 and up
555	All-In-One Toolbox: Cleaner, Booster, App Manager	GAME	4.5	1385093	35M	100000000	0	Everyone	{Puzzle}	2018-08-02	1.7.40	4.1 and up
556	Mini Golf King - Multiplayer Game	GAME	4.4	1381820	54M	10000000	0	Teen	{Action}	2017-03-14	3.1.1	3.0 and up
557	My Boy! Free - GBA Emulator	GAME	4.4	1381624	54M	10000000	0	Teen	{Action}	2017-03-14	3.1.1	3.0 and up
558	Farming Simulator 14	GAME	4.5	1375988	15M	50000000	0	Everyone	{Board}	2018-06-07	2.72	4.1 and up
559	School of Dragons	FINANCE	4.6	1374549	32M	10000000	0	Everyone	{Finance}	2018-07-23	3.52	5.0 and up
560	COOKING MAMA Let’s Cook!	FAMILY	4.4	1372013	57M	100000000	0	Everyone	{Puzzle,"Brain Games"}	2017-11-21	1.10.0	4.1 and up
561	Dan the Man: Action Platformer	SHOPPING	4.6	1371082	Varies with device	50000000	0	Teen	{Shopping}	2018-08-03	Varies with device	Varies with device
562	Photo Editor Selfie Camera Filter & Mirror Image	SHOPPING	4.6	1370749	Varies with device	50000000	0	Teen	{Shopping}	2018-08-03	Varies with device	Varies with device
563	Fernanfloo	SHOPPING	4.6	1370749	Varies with device	50000000	0	Teen	{Shopping}	2018-08-03	Varies with device	Varies with device
564	Strawberry Shortcake BerryRush	SHOPPING	4.6	1370749	Varies with device	50000000	0	Teen	{Shopping}	2018-08-03	Varies with device	Varies with device
565	BLACKJACK!	GAME	4.4	1351833	12M	10000000	0	Teen	{Action}	2013-10-28	3.0.3	2.1 and up
566	Water Drink Reminder	GAME	4.7	1351771	Varies with device	10000000	0	Everyone	{Puzzle}	2018-07-30	3196	4.1 and up
567	The Walking Dead: Road to Survival	GAME	4.7	1351089	Varies with device	10000000	0	Everyone	{Puzzle}	2018-07-30	3196	4.1 and up
568	News by The Times of India Newspaper - Latest News	GAME	4.7	1351068	Varies with device	10000000	0	Everyone	{Puzzle}	2018-07-30	3196	4.1 and up
569	Waplog - Free Chat, Dating App, Meet Singles	GAME	4.2	1343866	56M	10000000	0	Teen	{Action}	2018-08-01	1.180271.184729	4.0 and up
570	ESPN	GAME	4.2	1343106	56M	10000000	0	Teen	{Action}	2018-08-01	1.180271.184729	4.0 and up
571	Major Mayhem	FINANCE	4.5	1336246	39M	10000000	0	Everyone	{Finance}	2018-08-03	6.39.1.4	4.1 and up
572	Hot Wheels: Race Off	TOOLS	4.7	1335799	3.8M	50000000	0	Everyone	{Tools}	2017-10-27	2.5.2	4.2 and up
573	Zoosk Dating App: Meet Singles	FAMILY	4.5	1333338	8.7M	10000000	0	Everyone	{Casual}	2018-05-23	1.34.1	2.3.3 and up
574	Alto’s Adventure	FAMILY	4.3	1329192	97M	50000000	0	Everyone	{Racing,"Action & Adventure"}	2017-10-04	2.1.20	2.3.3 and up
575	Disney Crossy Road	FAMILY	4.3	1329008	97M	50000000	0	Everyone	{Racing,"Action & Adventure"}	2017-10-04	2.1.20	2.3.3 and up
576	Bestie - Camera360 Selfie	GAME	4.6	1327269	99M	50000000	0	Teen	{Racing}	2017-04-12	1.3	2.3.3 and up
577	Smart Launcher 5	GAME	4.6	1327265	99M	50000000	0	Teen	{Racing}	2017-04-12	1.3	2.3.3 and up
578	Zomato - Restaurant Finder and Food Delivery App	SHOPPING	4.3	1315242	Varies with device	50000000	0	Everyone	{Shopping}	2018-07-21	3.27.1	4.1 and up
579	Capital One® Mobile	SPORTS	4.5	1312936	21M	10000000	0	Everyone	{Sports}	2018-07-31	3.4.06	4.4 and up
580	Galaxy Attack: Alien Shooter	WEATHER	4.4	1312037	Varies with device	10000000	0	Everyone	{Weather}	2018-08-01	Varies with device	Varies with device
581	MiniMovie - Free Video and Slideshow Editor	FAMILY	4.4	1309728	Varies with device	50000000	0	Everyone	{Casual}	2018-07-11	Varies with device	Varies with device
582	Injustice 2	GAME	4.3	1305050	Varies with device	50000000	0	Everyone 10+	{Adventure}	2018-07-29	1.1.11.11	4.1 and up
583	iFunny :)	FAMILY	4.8	1304467	68M	10000000	0	Everyone	{Strategy}	2018-07-27	2.9	4.1 and up
584	IMDb Movies & TV	GAME	4.3	1300619	78M	50000000	0	Everyone	{Puzzle}	2018-07-20	2.1.10	4.0 and up
585	Runkeeper - GPS Track Run Walk	GAME	4.3	1300490	78M	50000000	0	Everyone	{Puzzle}	2018-07-20	2.1.10	4.0 and up
587	APUS File Manager (Explorer)	GAME	4.3	1295625	11M	100000000	0	Everyone	{Puzzle}	2018-04-11	4	4.1 and up
588	Quran for Android	GAME	4.3	1295606	11M	100000000	0	Everyone	{Puzzle}	2018-04-11	4	4.1 and up
589	Google Sheets	GAME	4.3	1295557	11M	100000000	0	Everyone	{Puzzle}	2018-04-11	4	4.1 and up
590	QR Code Reader	FAMILY	4.3	1295293	11M	100000000	0	Everyone	{Puzzle}	2018-04-11	4	4.1 and up
591	Ringtone Maker	NEWS_AND_MAGAZINES	4.4	1284018	Varies with device	500000000	0	Everyone 10+	{"News & Magazines"}	2018-08-03	Varies with device	Varies with device
592	Battle of Zombies: Clans War	NEWS_AND_MAGAZINES	4.4	1284017	Varies with device	500000000	0	Everyone 10+	{"News & Magazines"}	2018-08-03	Varies with device	Varies with device
593	Tagged - Meet, Chat & Dating	NEWS_AND_MAGAZINES	4.4	1284017	Varies with device	500000000	0	Everyone 10+	{"News & Magazines"}	2018-08-03	Varies with device	Varies with device
594	Final Fantasy XV: A New Empire	TOOLS	4.4	1280423	Varies with device	100000000	0	Everyone	{Tools}	2018-07-20	Varies with device	Varies with device
595	Wallpapers HD	BUSINESS	4	1279800	Varies with device	50000000	0	Everyone	{Business}	2018-08-06	Varies with device	Varies with device
596	Hair Salon - Fun Games	BUSINESS	4	1279184	Varies with device	50000000	0	Everyone	{Business}	2018-08-02	Varies with device	Varies with device
597	Foursquare City Guide	TOOLS	4.4	1279109	Varies with device	100000000	0	Everyone	{Tools}	2018-07-20	Varies with device	Varies with device
598	CallApp: Caller ID, Blocker & Phone Call Recorder	FAMILY	4.4	1275373	91M	10000000	0	Teen	{"Role Playing"}	2018-07-03	1.021.10	4.1 and up
599	T-Mobile	SOCIAL	4.8	1264084	62M	10000000	0	Teen	{Social}	2018-08-07	1.8.19179	4.0.3 and up
600	Skyscanner	FAMILY	4.2	1260903	8.7M	50000000	0	Everyone	{Entertainment}	2018-08-02	3.4.8	4.1 and up
601	Microsoft OneNote	PHOTOGRAPHY	4.2	1260143	Varies with device	50000000	0	Everyone	{Photography}	2018-07-12	Varies with device	Varies with device
602	Samsung Health	SOCIAL	4.2	1259894	76M	50000000	0	Mature 17+	{Social}	2018-08-03	Varies with device	4.1 and up
603	Periscope - Live Video	SOCIAL	4.2	1259894	76M	50000000	0	Mature 17+	{Social}	2018-08-03	Varies with device	4.1 and up
604	News Republic	SOCIAL	4.2	1259894	76M	50000000	0	Mature 17+	{Social}	2018-08-03	Varies with device	4.1 and up
605	Photo Studio	SOCIAL	4.2	1259849	76M	50000000	0	Mature 17+	{Social}	2018-08-03	Varies with device	4.1 and up
606	Planet of Cubes Survival Craft	SOCIAL	4.2	1259723	76M	50000000	0	Mature 17+	{Social}	2018-08-03	Varies with device	4.1 and up
607	Dr. Parking 4	SOCIAL	4.8	1259075	62M	10000000	0	Teen	{Social}	2018-07-20	1.8.19179	4.0.3 and up
608	Crusaders Quest	BUSINESS	4.4	1254730	Varies with device	10000000	0	Everyone	{Business}	2018-08-03	Varies with device	Varies with device
609	Solo Locker (DIY Locker)	TOOLS	4.7	1251479	Varies with device	10000000	0	Everyone	{Tools}	2018-07-24	Varies with device	Varies with device
610	Color Flashlight	GAME	4.5	1243017	27M	50000000	0	Teen	{Action}	2018-07-18	3.0.0	4.2 and up
611	Disney Magic Kingdoms: Build Your Own Magical Park	GAME	4.5	1242855	27M	50000000	0	Teen	{Action}	2018-07-18	3.0.0	4.2 and up
612	Block! Hexa Puzzle™	PERSONALIZATION	4.5	1237135	Varies with device	50000000	0	Everyone	{Personalization}	2018-07-18	Varies with device	Varies with device
613	30 Day Fitness Challenge - Workout at Home	PERSONALIZATION	4.5	1235841	Varies with device	50000000	0	Everyone	{Personalization}	2018-07-18	Varies with device	Varies with device
614	YouTube Kids	GAME	4.6	1226514	99M	10000000	0	Teen	{Action}	2018-07-20	4.4.4	4.1 and up
615	Deck Heroes: Legacy	SOCIAL	4.2	1225367	Varies with device	100000000	0	Everyone	{Social}	2018-08-02	4.1.202	5.0 and up
616	DU Cleaner – Memory cleaner & clean phone cache	SOCIAL	4.2	1225339	Varies with device	100000000	0	Everyone	{Social}	2018-08-02	4.1.202	5.0 and up
617	Stupid Zombies	GAME	3.7	1221896	70M	100000000	0	Everyone	{Action}	2018-07-12	3.0.11	4.2 and up
618	Meitu – Beauty Cam, Easy Photo Editor	GAME	4.3	1218055	45M	100000000	0	Everyone	{Arcade}	2018-05-25	1.5.12	4.1 and up
619	Knife Hit	PRODUCTIVITY	4.4	1188154	24M	10000000	0	Everyone	{Productivity}	2018-06-14	4.6.4	4.1 and up
620	HD Camera Ultra	GAME	4.2	1185148	29M	100000000	0	Everyone	{Arcade}	2018-08-01	9.55	4.0.3 and up
621	Goibibo - Flight Hotel Bus Car IRCTC Booking App	SOCIAL	4.2	1175815	Varies with device	50000000	0	Mature 17+	{Social}	2018-07-31	Varies with device	Varies with device
622	NFL	SOCIAL	4.2	1175794	Varies with device	50000000	0	Mature 17+	{Social}	2018-07-31	Varies with device	Varies with device
623	Calls Blacklist - Call Blocker	SOCIAL	4.2	1175188	Varies with device	50000000	0	Mature 17+	{Social}	2018-07-31	Varies with device	Varies with device
624	LiveMe - Video chat, new friends, and make money	TOOLS	4.6	1170641	26M	10000000	0	Everyone	{Tools}	2018-07-26	4.2.1.4174	4.1 and up
625	Darkness Rises	FAMILY	4.3	1168959	66M	50000000	0	Everyone	{Puzzle}	2017-05-03	2.3.3	4.1 and up
626	Starbucks	GAME	4.3	1167143	12M	100000000	0	Everyone	{Arcade}	2017-09-20	1.18.35	4.1 and up
627	Dictionary - Merriam-Webster	PHOTOGRAPHY	4.4	1163232	31M	50000000	0	Everyone	{Photography}	2018-07-20	3.4.0	4.0.3 and up
628	Rope Hero: Vice Town	TRAVEL_AND_LOCAL	4.4	1162838	Varies with device	100000000	0	Everyone	{"Travel & Local"}	2018-08-04	Varies with device	Varies with device
629	Maleficent Free Fall	TRAVEL_AND_LOCAL	4.4	1162837	Varies with device	100000000	0	Everyone	{"Travel & Local"}	2018-08-04	Varies with device	Varies with device
630	Solitaire TriPeaks	TRAVEL_AND_LOCAL	4.4	1162837	Varies with device	100000000	0	Everyone	{"Travel & Local"}	2018-08-04	Varies with device	Varies with device
631	Al Quran Indonesia	TRAVEL_AND_LOCAL	4.4	1162837	Varies with device	100000000	0	Everyone	{"Travel & Local"}	2018-08-04	Varies with device	Varies with device
632	Walmart	TRAVEL_AND_LOCAL	4.4	1162331	Varies with device	100000000	0	Everyone	{"Travel & Local"}	2018-08-04	Varies with device	Varies with device
633	TextNow - free text + calls	PHOTOGRAPHY	4.6	1159058	25M	100000000	0	Everyone	{Photography}	2018-08-03	2.73.672	4.0.3 and up
634	Arena of Valor: 5v5 Arena Game	SOCIAL	4.3	1157004	34M	50000000	0	Everyone	{Social}	2017-10-16	4.2.1	4.3 and up
635	ZenUI Dialer & Contacts	SOCIAL	4.3	1157003	34M	50000000	0	Everyone	{Social}	2017-10-16	4.2.1	4.3 and up
636	YouTube Studio	PERSONALIZATION	4.7	1141545	15M	50000000	0	Everyone	{Personalization}	2018-07-31	Varies with device	Varies with device
637	DU Antivirus Security - Applock & Privacy Guard	GAME	4.5	1138239	59M	50000000	0	Teen	{Arcade}	2018-05-29	1.4.0.1	4.0 and up
638	Home Workout - No Equipment	GAME	4.5	1137271	59M	50000000	0	Teen	{Arcade}	2018-05-29	1.4.0.1	4.0 and up
639	HD Video Downloader : 2018 Best video mate	GAME	4.5	1137267	59M	50000000	0	Teen	{Arcade}	2018-05-29	1.4.0.1	4.0 and up
640	High-Powered Flashlight	GAME	4.5	1135631	59M	50000000	0	Teen	{Arcade}	2018-05-29	1.4.0.1	4.0 and up
641	Keypad Lock Screen	COMMUNICATION	4.3	1133539	4.7M	10000000	0	Everyone	{Communication}	2016-04-01	6.4.0.4	4.0 and up
642	The Maze Runner	COMMUNICATION	4.3	1133501	4.7M	10000000	0	Everyone	{Communication}	2016-04-01	6.4.0.4	4.0 and up
643	NQ Mobile Security & Antivirus	LIFESTYLE	4.7	1133393	Varies with device	10000000	0	Everyone	{Lifestyle}	2018-07-03	Varies with device	Varies with device
644	SayHi Chat, Meet New People	FAMILY	4.4	1131937	41M	100000000	0	Everyone	{Entertainment}	2018-04-30	2.4.0.7	4.1 and up
645	Snake VS Block	COMMUNICATION	4.6	1130966	27M	10000000	0	Everyone	{Communication}	2018-06-06	1.9.1.013	4.0 and up
646	Foursquare Swarm: Check In	GAME	4.5	1128805	59M	50000000	0	Teen	{Arcade}	2018-05-29	1.4.0.1	4.0 and up
647	NinJump	GAME	4.7	1125566	25M	10000000	0	Everyone	{Puzzle}	2018-07-17	3.9.2	4.3 and up
648	Beauty Makeup Snappy Collage Photo Editor - Lidow	GAME	4.7	1125438	25M	10000000	0	Everyone	{Puzzle}	2018-07-17	3.9.2	4.3 and up
649	Download Manager for Android	GAME	4.5	1125438	63M	10000000	0	Everyone	{Casual}	2018-07-05	57.0.8	4.0.3 and up
650	Escaping the Prison	GAME	4.7	1125017	25M	10000000	0	Everyone	{Puzzle}	2018-07-17	3.9.2	4.3 and up
651	Zillow: Find Houses for Sale & Apartments for Rent	GAME	4.6	1123190	Varies with device	10000000	0	Teen	{Card}	2018-08-07	Varies with device	Varies with device
652	Idle Heroes	PERSONALIZATION	4.6	1121805	Varies with device	50000000	0	Everyone	{Personalization}	2018-05-14	Varies with device	Varies with device
653	Podcast Addict	PERSONALIZATION	4.6	1121805	Varies with device	50000000	0	Everyone	{Personalization}	2018-05-14	Varies with device	Varies with device
654	Real City Car Driver	LIFESTYLE	4.3	1118201	Varies with device	10000000	0	Mature 17+	{Lifestyle}	2018-07-24	Varies with device	Varies with device
655	Free phone calls, free texting SMS on free number	GAME	4.5	1117212	50M	50000000	0	Everyone	{Board}	2018-08-03	Varies with device	4.0.3 and up
656	Sandbox - Color by Number Coloring Pages	TOOLS	4.2	1116393	8.2M	50000000	0	Everyone	{Tools}	2018-08-06	6.1.0	4.1 and up
657	Amazon Prime Video	FAMILY	4.1	1111915	50M	100000000	0	Everyone	{Entertainment}	2018-04-30	2.2.1.3	4.1 and up
658	FotMob - Live Soccer Scores	EDUCATION	4.7	1107948	Varies with device	10000000	0	Everyone	{Education}	2018-08-02	Varies with device	Varies with device
659	Internet Speed Meter Lite	EDUCATION	4.7	1107903	Varies with device	10000000	0	Everyone	{Education}	2018-08-02	Varies with device	Varies with device
660	Hitman Sniper	EDUCATION	4.7	1107903	Varies with device	10000000	0	Everyone	{Education}	2018-08-02	Varies with device	Varies with device
661	SAMURAI vs ZOMBIES DEFENSE	EDUCATION	4.7	1107884	Varies with device	10000000	0	Everyone	{Education}	2018-08-02	Varies with device	Varies with device
662	Viki: Asian TV Dramas & Movies	TOOLS	4.4	1107320	25M	50000000	0	Everyone	{Tools}	2018-08-07	3.4.500	4.1 and up
663	Fire Emblem Heroes	GAME	4.4	1107310	Varies with device	10000000	0	Teen	{Adventure}	2018-08-01	1.8.2	4.4 and up
664	Daily Horoscope	GAME	4.4	1107197	Varies with device	10000000	0	Teen	{Adventure}	2018-08-01	1.8.2	4.4 and up
665	THE KING OF FIGHTERS-A 2012(F)	TOOLS	4.5	1094094	Varies with device	100000000	0	Everyone	{Tools}	2018-07-10	Varies with device	Varies with device
666	The Voice, sing and connect	PRODUCTIVITY	4.1	1092367	Varies with device	10000000	0	Everyone	{Productivity}	2018-08-04	8.0.1.0	Varies with device
667	Wunderlist: To-Do List & Tasks	COMMUNICATION	4.2	1092337	Varies with device	50000000	0	Mature 17+	{Communication}	2018-07-24	Varies with device	Varies with device
668	Solitaire!	GAME	4.2	1092106	43M	50000000	0	Everyone	{Word}	2018-07-28	2.400.022	4.4 and up
669	Selfie Camera - Photo Editor & Filter & Sticker	SHOPPING	4.7	1084945	Varies with device	50000000	0	Teen	{Shopping}	2018-08-03	Varies with device	Varies with device
670	Dude Perfect 2	GAME	4.3	1083571	Varies with device	50000000	0	Everyone	{Arcade}	2018-07-20	Varies with device	Varies with device
671	Grand Gangsters 3D	PRODUCTIVITY	4.5	1079616	Varies with device	100000000	0	Everyone	{Productivity}	2018-07-14	16.0.10325.20059	4.4 and up
672	Opera Mini browser beta	PRODUCTIVITY	4.5	1079491	Varies with device	100000000	0	Everyone	{Productivity}	2018-07-14	16.0.10325.20059	4.4 and up
673	Coloring Book for Me & Mandala	SPORTS	4.1	1076243	13M	100000000	0	Everyone	{Sports}	2018-01-18	3.1	2.0.1 and up
674	Pedometer	PHOTOGRAPHY	4.4	1075277	47M	100000000	0	Mature 17+	{Photography}	2018-08-03	4.21	4.1 and up
675	7 Minute Workout	PHOTOGRAPHY	4.4	1075016	47M	100000000	0	Mature 17+	{Photography}	2018-08-03	4.21	4.1 and up
676	Empires and Allies	TOOLS	4.3	1072565	Varies with device	50000000	0	Everyone	{Tools}	2018-07-25	Varies with device	Varies with device
677	iHoroscope - 2018 Daily Horoscope & Astrology	SOCIAL	4.3	1064076	Varies with device	50000000	0	Mature 17+	{Social}	2018-07-28	Varies with device	Varies with device
678	Yelp: Food, Shopping, Services Nearby	SOCIAL	4.3	1064049	Varies with device	50000000	0	Mature 17+	{Social}	2018-07-28	Varies with device	Varies with device
679	V LIVE - Star Live App	PRODUCTIVITY	4.6	1048766	13M	10000000	0	Everyone	{Productivity}	2018-08-03	2.6.28	4.0.3 and up
680	Texas HoldEm Poker Deluxe	COMMUNICATION	4.2	1042170	Varies with device	50000000	0	Everyone	{Communication}	2018-07-27	Varies with device	Varies with device
681	Bubbu – My Virtual Pet	GAME	4.5	1041836	50M	10000000	0	Teen	{Action}	2015-04-02	1.07	2.3 and up
682	Equestria Girls	PRODUCTIVITY	4.4	1038306	Varies with device	100000000	0	Everyone	{Productivity}	2018-08-01	Varies with device	Varies with device
683	Ingress	PRODUCTIVITY	4.4	1038303	Varies with device	100000000	0	Everyone	{Productivity}	2018-08-01	Varies with device	Varies with device
684	Crackle - Free TV & Movies	FOOD_AND_DRINK	4.7	1032935	Varies with device	10000000	0	Everyone	{"Food & Drink"}	2018-07-20	Varies with device	Varies with device
685	Zapya - File Transfer, Sharing	FOOD_AND_DRINK	4.7	1032935	Varies with device	10000000	0	Everyone	{"Food & Drink"}	2018-07-20	Varies with device	Varies with device
686	cPro Marketplace: Buy. Sell. Rent. Date. Jobs.	VIDEO_PLAYERS	4.4	1032076	Varies with device	100000000	0	Everyone	{"Video Players & Editors"}	2018-07-30	Varies with device	2.3 and up
687	Angry Birds Evolution	VIDEO_PLAYERS	4.4	1031045	Varies with device	100000000	0	Everyone	{"Video Players & Editors"}	2018-07-30	Varies with device	2.3 and up
688	English Hindi Dictionary	TOOLS	4.4	1028794	Varies with device	100000000	0	Everyone	{Tools}	2018-07-19	Varies with device	Varies with device
689	textPlus: Free Text & Calls	PHOTOGRAPHY	4.2	1028637	Varies with device	100000000	0	Everyone	{Photography}	2017-12-21	Varies with device	Varies with device
690	Big Fish Casino – Play Slots & Vegas Games	GAME	4.3	1017408	34M	10000000	0	Teen	{Adventure}	2018-07-16	9.2.0	4.0 and up
691	İşCep	PHOTOGRAPHY	4.3	1017237	Varies with device	50000000	0	Everyone	{Photography}	2018-07-30	7.6.5	4.3 and up
692	AfreecaTV	FAMILY	4.5	1014846	56M	50000000	0	Everyone	{Educational,"Pretend Play"}	2017-06-29	1.2.3-play	4.1 and up
693	MyASUS - Service Center	FAMILY	4.5	1014822	56M	50000000	0	Everyone	{Educational,"Pretend Play"}	2017-06-29	1.2.3-play	4.1 and up
694	Plants vs. Zombies™ Heroes	COMICS	4.5	1013944	Varies with device	10000000	0	Teen	{Comics}	2018-07-31	Varies with device	Varies with device
695	Castle Clash: RPG War and Strategy FR	VIDEO_PLAYERS	4.5	1013867	32M	50000000	0	Everyone	{"Video Players & Editors"}	2018-08-03	4.5.0.10701.GP	4.1 and up
696	Checkers	COMICS	4.5	1013635	Varies with device	10000000	0	Teen	{Comics}	2018-07-31	Varies with device	Varies with device
697	Mirror Photo:Editor Collage (HD)	FAMILY	4.5	1013465	56M	50000000	0	Everyone	{Educational,"Pretend Play"}	2017-06-29	1.2.3-play	4.1 and up
698	Dr. Safety - Antivirus, Booster, Cleaner, AppLock	SPORTS	4.2	1008012	13M	50000000	0	Everyone	{Sports}	2017-12-05	1.7.7	2.1 and up
699	Nyan Cat: Lost In Space	GAME	4.3	1004709	Varies with device	50000000	0	Teen	{Action}	2018-07-05	Varies with device	4.4 and up
700	Hello Kitty Nail Salon	GAME	4.3	1003269	Varies with device	50000000	0	Teen	{Action}	2018-07-05	Varies with device	4.4 and up
701	Empire Z: Endless War	BUSINESS	4.3	1002861	35M	100000000	0	Everyone	{Business}	2018-08-02	9.7.14188	4.1 and up
702	Mirror	BUSINESS	4.3	1002859	35M	100000000	0	Everyone	{Business}	2018-08-02	9.7.14188	4.1 and up
703	Jabong Online Shopping App	GAME	4.3	1000417	Varies with device	50000000	0	Teen	{Action}	2018-07-05	Varies with device	4.4 and up
704	Oxford Dictionary of English : Free	GAME	4.3	1000417	Varies with device	50000000	0	Teen	{Action}	2018-07-05	Varies with device	4.4 and up
705	Guardian Hunter: SuperBrawlRPG	GAME	4	995002	Varies with device	10000000	0	Mature 17+	{Adventure}	2018-07-25	1.73.0	4.1 and up
706	Animal Jam - Play Wild!	GAME	4.7	990796	75M	10000000	0	Everyone	{Action}	2018-05-24	1.0.27	4.1 and up
707	Al’Quran Bahasa Indonesia	GAME	4.7	990723	75M	10000000	0	Everyone	{Action}	2018-05-24	1.0.27	4.1 and up
708	Love Balls	GAME	4.7	990663	75M	10000000	0	Everyone	{Action}	2018-05-24	1.0.27	4.1 and up
709	Airbnb	GAME	4.7	990586	75M	10000000	0	Everyone	{Action}	2018-05-24	1.0.27	4.1 and up
710	Cooking Madness - A Chef’s Restaurant Games	GAME	4.7	990491	75M	10000000	0	Everyone	{Action}	2018-05-24	1.0.27	4.1 and up
711	Dr. Driving 2	SPORTS	4.3	989344	51M	50000000	0	Teen	{Sports}	2018-07-23	1.64	4.0 and up
712	Pulse Nabd - World News, Urgent	GAME	4.7	989158	75M	10000000	0	Everyone	{Action}	2018-05-24	1.0.27	4.1 and up
713	Fitbit	BUSINESS	4.5	984451	Varies with device	50000000	0	Everyone	{Business}	2018-08-02	Varies with device	Varies with device
714	BaBe - Read News	WEATHER	4.5	981995	Varies with device	10000000	0	Everyone	{Weather}	2018-06-07	Varies with device	Varies with device
715	Xray Scanner Prank	SHOPPING	4.5	973270	20M	50000000	0	Teen	{Shopping}	2018-08-06	2.4.9	4.1 and up
716	DC Legends: Battle for Justice	PHOTOGRAPHY	4.4	972574	45M	100000000	0	Everyone	{Photography}	2018-08-03	2.31	4.1 and up
717	Real Racing 3	SHOPPING	4.5	972256	20M	50000000	0	Teen	{Shopping}	2018-08-02	2.4.8	4.1 and up
718	Dragon Hills	VIDEO_PLAYERS	4.3	960726	Varies with device	10000000	0	Everyone	{"Video Players & Editors"}	2018-08-02	Varies with device	Varies with device
719	Houzz Interior Design Ideas	FINANCE	4.2	957973	40M	10000000	0	Everyone	{Finance}	2018-07-30	6.5.7	4.2 and up
720	Photo Warp	GAME	4.3	955656	82M	10000000	0	Teen	{Action}	2018-06-26	5.1.2	3.0 and up
721	WIFI WPS WPA TESTER	GAME	4.3	955614	82M	10000000	0	Teen	{Action}	2018-06-26	5.1.2	3.0 and up
722	Egg Baby	VIDEO_PLAYERS	4.4	953894	37M	10000000	0	Everyone	{"Video Players & Editors"}	2018-04-26	3.5.1.8	Varies with device
723	Antivirus & Mobile Security	TOOLS	4.4	953790	Varies with device	50000000	0	Everyone	{Tools}	2018-08-05	Varies with device	Varies with device
724	HD Camera for Android	GAME	4.2	951435	14M	50000000	0	Everyone	{Racing}	2018-01-17	2.2	2.1 and up
725	video player for android	TOOLS	4.4	951413	13M	100000000	0	Everyone	{Tools}	2018-07-31	10.23.2-964159b	4.4 and up
726	Glide - Video Chat Messenger	NEWS_AND_MAGAZINES	4.3	948198	Varies with device	50000000	0	Teen	{"News & Magazines"}	2018-07-19	Varies with device	Varies with device
727	Can Knockdown 3	GAME	4.5	947515	60M	10000000	0	Teen	{Action}	2018-07-25	5.3.1	4.1 and up
728	Text SMS	GAME	4.5	946926	57M	50000000	0	Everyone	{Simulation}	2018-03-05	2.10.2	4.0.3 and up
729	QR Droid	GAME	4.5	946926	57M	50000000	0	Everyone	{Simulation}	2018-03-05	2.10.2	4.0.3 and up
730	Grand Theft Auto: San Andreas	FAMILY	4.5	944661	57M	50000000	0	Everyone	{Simulation}	2018-03-05	2.10.2	4.0.3 and up
731	Google Pay	TRAVEL_AND_LOCAL	4.5	932870	Varies with device	50000000	0	Everyone	{"Travel & Local"}	2018-07-27	8.3.3-Google	4.0.3 and up
732	diep.io	GAME	4.3	931595	31M	10000000	0	Teen	{Simulation}	2018-07-16	5.39.1	4.0.3 and up
733	Google Allo	FAMILY	4.3	931503	31M	10000000	0	Teen	{Simulation}	2018-07-16	5.39.1	4.0.3 and up
734	FaceApp	PHOTOGRAPHY	4.4	928720	Varies with device	50000000	0	Everyone	{Photography}	2018-07-16	Varies with device	Varies with device
735	Text Me: Text Free, Call Free, Second Phone Number	BOOKS_AND_REFERENCE	4.9	922752	Varies with device	10000000	0	Everyone	{"Books & Reference"}	2018-06-15	Varies with device	Varies with device
736	Rivals at War: Firefight	VIDEO_PLAYERS	4.6	921868	47M	50000000	0	Teen	{"Video Players & Editors"}	2018-08-04	2.4.11	4.0 and up
737	Word Search	FAMILY	4.3	920571	28M	10000000	0	Everyone 10+	{Card,"Action & Adventure"}	2017-01-17	1.0.10	4.0.3 and up
738	Little Big City 2	PHOTOGRAPHY	4.2	914917	Varies with device	50000000	0	Everyone	{Photography}	2018-07-22	5.0.508	4.4 and up
739	Ninja Turtles: Legends	PHOTOGRAPHY	4.2	914804	Varies with device	50000000	0	Everyone	{Photography}	2018-07-22	5.0.508	4.4 and up
740	Arrow.io	SPORTS	4.7	911995	20M	10000000	0	Everyone	{Sports}	2018-08-01	10.8.1.330	4.4 and up
741	Math Tricks	GAME	4.5	910051	76M	10000000	0	Teen	{Card}	2018-08-02	5.11.0	4.1 and up
742	FIFA - Tournaments, Soccer News & Live Scores	SHOPPING	4.3	909226	42M	100000000	0	Teen	{Shopping}	2018-07-31	16.14.0.100	4.4 and up
743	MyScript Calculator	SHOPPING	4.3	909204	42M	100000000	0	Teen	{Shopping}	2018-07-31	16.14.0.100	4.4 and up
744	English Dictionary - Offline	SHOPPING	4.3	908525	42M	100000000	0	Teen	{Shopping}	2018-07-31	16.14.0.100	4.4 and up
745	Bank of America Mobile Banking	VIDEO_PLAYERS	3.7	906384	Varies with device	1000000000	0	Teen	{"Video Players & Editors"}	2018-08-06	Varies with device	Varies with device
746	DRAGON BALL LEGENDS	FAMILY	3.9	903392	Varies with device	50000000	0	Everyone 10+	{Strategy}	2018-06-14	3.30.4.207	4.1 and up
747	Screen Lock - with Fingerprint Simulator	PERSONALIZATION	4.5	901110	Varies with device	10000000	0	Everyone 10+	{Personalization}	2018-07-10	Varies with device	Varies with device
748	File Manager by Xiaomi: release file storage space	SOCIAL	4.4	900064	13M	10000000	0	Mature 17+	{Social}	2018-07-31	4.17.2	4.1 and up
749	ZArchiver	SOCIAL	4.4	900064	13M	10000000	0	Mature 17+	{Social}	2018-07-31	4.17.2	4.1 and up
750	Heroes Arena	FAMILY	4.4	899748	80M	10000000	0	Everyone	{Casual}	2018-08-03	2.11	4.1 and up
751	CASHIER	BOOKS_AND_REFERENCE	4.6	899010	Varies with device	10000000	0	Everyone	{"Books & Reference"}	2018-07-30	Varies with device	Varies with device
752	chomp SMS	SOCIAL	4.7	896118	6.6M	5000000	0	Everyone	{Social}	2017-10-09	1.3.0	4.1 and up
753	Wifi Analyzer	TOOLS	4.6	894435	3.1M	50000000	0	Teen	{Tools}	2018-07-01	2.2.8	4.0 and up
754	Uber Eats: Local Food Delivery	GAME	4.4	889425	45M	10000000	0	Teen	{Action}	2015-07-26	1.1	2.3 and up
755	Video Downloader - for Instagram Repost App	FAMILY	4.2	886418	6.5M	50000000	0	Everyone	{Strategy}	2018-06-30	1.7.3	4.1 and up
756	MX Player Codec (ARMv7)	TOOLS	4.4	885187	22M	50000000	0	Everyone	{Tools}	2018-07-19	4.7.0	4.1 and up
757	Bike Mayhem Free	NEWS_AND_MAGAZINES	3.9	878065	13M	1000000000	0	Teen	{"News & Magazines"}	2018-08-01	5.2.0	4.4 and up
758	GroupMe	NEWS_AND_MAGAZINES	3.9	877643	13M	1000000000	0	Teen	{"News & Magazines"}	2018-08-01	5.2.0	4.4 and up
759	Samsung Max - Data Savings & Privacy Protection	NEWS_AND_MAGAZINES	3.9	877635	13M	1000000000	0	Teen	{"News & Magazines"}	2018-08-01	5.2.0	4.4 and up
760	Wondershare PowerCam	NEWS_AND_MAGAZINES	3.9	877635	13M	1000000000	0	Teen	{"News & Magazines"}	2018-08-01	5.2.0	4.4 and up
761	Barbie Magical Fashion	FAMILY	4.6	877576	12M	10000000	0	Everyone	{Casual}	2016-05-14	6	2.0 and up
762	Strava Training: Track Running, Cycling & Swimming	TOOLS	4.5	876866	9.1M	50000000	0	Everyone	{Tools}	2018-07-27	1.4.9	4.0.3 and up
763	FVD - Free Video Downloader	PRODUCTIVITY	4.5	870928	16M	50000000	0	Everyone	{Productivity}	2018-06-08	5.9.6	4.1 and up
764	Zombie Hunter: Post Apocalypse Survival Games	SPORTS	4.4	867920	45M	10000000	0	Everyone	{Sports}	2018-07-14	1.16.2	4.0.3 and up
765	Zombie Frontier	FAMILY	4.4	860078	30M	10000000	0	Everyone	{Simulation}	2018-02-15	1.6.0	4.1 and up
766	Ringdroid	PRODUCTIVITY	4.2	858230	Varies with device	500000000	0	Everyone	{Productivity}	2018-08-06	Varies with device	Varies with device
767	Call of Mini™ Dino Hunter	PRODUCTIVITY	4.2	858227	Varies with device	500000000	0	Everyone	{Productivity}	2018-08-06	Varies with device	Varies with device
768	Period Tracker	PRODUCTIVITY	4.2	858208	Varies with device	500000000	0	Everyone	{Productivity}	2018-08-06	Varies with device	Varies with device
769	Megatramp - a Story of Success!	SHOPPING	4.2	857923	18M	50000000	0	Everyone	{Shopping}	2018-07-31	11.7.3.0	4.1 and up
770	Pizza Hut	TOOLS	4.2	857215	7.9M	100000000	0	Everyone	{Tools}	2017-12-07	1.4.large	4.1 - 7.1.1
771	Shoot Hunter-Gun Killer	FAMILY	4.2	853495	78M	50000000	0	Teen	{Strategy}	2018-08-02	1.0.208	4.0.3 and up
772	Hulu: Stream TV, Movies & more	PHOTOGRAPHY	4.4	852649	43M	50000000	0	Teen	{Photography}	2018-06-26	4.1.0.1	4.2 and up
773	Block Puzzle - Wood Legend	SOCIAL	4	852455	68M	10000000	0	Mature 17+	{Social}	2018-08-03	27	4.2 and up
774	eBay Kleinanzeigen for Germany	SOCIAL	4	852455	68M	10000000	0	Mature 17+	{Social}	2018-08-03	27	4.2 and up
775	Twilight: Blue light filter	PHOTOGRAPHY	4.6	847159	4.2M	10000000	0	Everyone	{Photography}	2017-11-10	4.7.4	4.0 and up
776	PhotoFunia	PHOTOGRAPHY	4.6	847159	4.2M	10000000	0	Everyone	{Photography}	2017-11-10	4.7.4	4.0 and up
777	Ibotta: Cash Back Savings, Rewards & Coupons App	PHOTOGRAPHY	4.6	847144	4.2M	10000000	0	Everyone	{Photography}	2017-11-10	4.7.4	4.0 and up
778	Files Go by Google: Free up space on your phone	GAME	4.2	839206	12M	50000000	0	Everyone	{Racing}	2017-09-20	1.16.33	4.1 and up
779	Text free - Free Text + Call	SPORTS	4.5	838765	Varies with device	50000000	0	Everyone	{Sports}	2018-05-18	Varies with device	Varies with device
780	DEER HUNTER RELOADED	SPORTS	4.5	838738	Varies with device	50000000	0	Everyone	{Sports}	2018-05-18	Varies with device	Varies with device
781	Learn English with Wlingua	COMMUNICATION	4.6	837842	Varies with device	50000000	0	Everyone	{Communication}	2018-08-03	Varies with device	Varies with device
782	Moco - Chat, Meet People	GAME	4.3	834117	44M	10000000	0	Teen	{Action}	2018-07-30	1.25.4	4.1 and up
783	Quora	GAME	4.2	829753	48M	50000000	0	Everyone	{Arcade}	2018-06-19	4.9.0	4.1 and up
784	Crunchyroll - Everything Anime	GAME	4.2	828489	Varies with device	50000000	0	Everyone	{Music}	2018-08-04	Varies with device	Varies with device
785	YouNow: Live Stream Video Chat	HEALTH_AND_FITNESS	4.5	827653	Varies with device	10000000	0	Everyone	{"Health & Fitness"}	2018-07-25	Varies with device	Varies with device
786	Yandex.Weather	HEALTH_AND_FITNESS	4.5	827651	Varies with device	10000000	0	Everyone	{"Health & Fitness"}	2018-07-25	Varies with device	Varies with device
787	Jurassic World™ Alive	HEALTH_AND_FITNESS	4.5	827597	Varies with device	10000000	0	Everyone	{"Health & Fitness"}	2018-07-25	Varies with device	Varies with device
788	Coupang	PHOTOGRAPHY	4.5	823109	Varies with device	50000000	0	Everyone	{Photography}	2018-06-29	2.19.0.201907232	4.4 and up
789	Phonto - Text on Photos	SPORTS	4.1	820577	30M	10000000	0	Everyone	{Sports}	2017-01-25	3.3.118003	4.4 and up
790	Fidget Spinner	PHOTOGRAPHY	4.6	819774	25M	10000000	0	Everyone	{Photography}	2018-06-26	4.2.3	4.0 and up
791	Quiz: Logo game	PHOTOGRAPHY	4.6	819694	25M	10000000	0	Everyone	{Photography}	2018-06-26	4.2.3	4.0 and up
792	King of Avalon: Dragon Warfare	PRODUCTIVITY	4.3	815981	Varies with device	100000000	0	Everyone	{Productivity}	2018-08-06	Varies with device	Varies with device
793	Gymnastics Superstar - Spin your way to gold!	PRODUCTIVITY	4.3	815974	Varies with device	100000000	0	Everyone	{Productivity}	2018-08-06	Varies with device	Varies with device
794	Hot or Not - Find someone right now	PRODUCTIVITY	4.3	815974	Varies with device	100000000	0	Everyone	{Productivity}	2018-08-06	Varies with device	Varies with device
795	Find My Friends	LIFESTYLE	4.6	815893	4.4M	10000000	0	Everyone	{Lifestyle}	2018-06-30	4.9	4.1 and up
796	Discord - Chat for Gamers	LIFESTYLE	4.6	815280	4.4M	10000000	0	Everyone	{Lifestyle}	2018-06-30	4.9	4.1 and up
797	myMail – Email for Hotmail, Gmail and Outlook Mail	BOOKS_AND_REFERENCE	4.2	814151	Varies with device	100000000	0	Teen	{"Books & Reference"}	2018-07-27	Varies with device	Varies with device
798	MARVEL Avengers Academy	BOOKS_AND_REFERENCE	4.2	814080	Varies with device	100000000	0	Teen	{"Books & Reference"}	2018-07-27	Varies with device	Varies with device
799	Meme Generator Free	PHOTOGRAPHY	4.3	811714	50M	50000000	0	Everyone	{Photography}	2018-08-02	4.0.26	4.4 and up
800	Toy Truck Rally 3D	PHOTOGRAPHY	4.3	811693	50M	50000000	0	Everyone	{Photography}	2018-08-02	4.0.26	4.4 and up
801	Grab Driver	GAME	4.6	811040	77M	10000000	0	Teen	{Strategy}	2018-05-10	1.7.04	4.4 and up
802	Standoff 2	GAME	4.6	807338	93M	10000000	0	Teen	{Simulation}	2018-07-30	2.3.5	4.0.3 and up
803	Any.do: To-do list, Calendar, Reminders & Planner	GAME	4.3	807226	34M	10000000	0	Teen	{Action}	2018-07-11	3.0.2	4.0.3 and up
804	New 2018 Keyboard	FAMILY	4.6	807155	93M	10000000	0	Teen	{Simulation}	2018-07-30	2.3.5	4.0.3 and up
805	Psiphon Pro - The Internet Freedom VPN	TOOLS	4.5	801054	8.9M	10000000	0	Everyone	{Tools}	2018-08-01	4.3.0	4.1 and up
806	Tubi TV - Free Movies & TV	TOOLS	4.5	799206	8.9M	10000000	0	Everyone	{Tools}	2018-08-01	4.3.0	4.1 and up
807	BBC News	GAME	4.3	798522	57M	100000000	0	Everyone 10+	{Arcade}	2018-06-07	1.9.8.0	4.1 and up
808	CPU-Z	GAME	4.2	794058	56M	10000000	0	Everyone	{Music}	2018-06-12	2.3.0	4.4 and up
809	Textgram - write on photos	ENTERTAINMENT	4.5	787177	Varies with device	10000000	0	Everyone	{Entertainment}	2018-06-20	Varies with device	Varies with device
810	Best Wallpapers QHD	FAMILY	4.5	787107	Varies with device	10000000	0	Everyone	{Entertainment}	2018-06-20	Varies with device	Varies with device
811	Toughest Game Ever 2	GAME	4.5	785622	Varies with device	50000000	0	Everyone	{Music}	2018-06-29	1.35.2	4.1 and up
812	CNN Breaking US & World News	SPORTS	4.4	783025	Varies with device	10000000	0	Everyone	{Sports}	2018-06-07	1.7.2	4.2 and up
813	foodpanda - Local Food Delivery	COMMUNICATION	4.2	781810	Varies with device	100000000	0	Everyone	{Communication}	2018-08-01	Varies with device	Varies with device
814	Soul Knight	COMMUNICATION	4.2	781810	Varies with device	100000000	0	Everyone	{Communication}	2018-08-01	Varies with device	Varies with device
815	TRANSFORMERS: Forged to Fight	GAME	4.5	776730	49M	10000000	0	Everyone 10+	{Action}	2018-07-26	2.23	4.0.3 and up
816	NewsDog - Latest News, Breaking News, Local News	GAME	4.3	771001	52M	50000000	0	Everyone 10+	{Action}	2018-06-11	2.0.1.3	4.1 and up
817	Koi Free Live Wallpaper	TRAVEL_AND_LOCAL	4.5	768833	Varies with device	50000000	0	Everyone	{"Travel & Local"}	2018-07-30	Varies with device	Varies with device
818	South Park: Phone Destroyer™	FAMILY	4.4	764967	69M	10000000	0	Everyone	{Puzzle}	2018-07-05	2.3.4	4.1 and up
819	WatchESPN	FAMILY	4.5	762706	28M	10000000	0	Teen	{Simulation}	2018-03-30	6.7.5	4.0 and up
820	Masha and the Bear Child Games	GAME	4.6	760628	63M	10000000	0	Everyone	{Arcade}	2017-12-22	1.03	4.0 and up
821	The CW	GAME	4.6	759838	63M	10000000	0	Everyone	{Arcade}	2017-12-22	1.03	4.0 and up
822	Calculator - unit converter	PHOTOGRAPHY	4.4	758780	53M	50000000	0	Everyone	{Photography}	2018-08-03	4.0.55	4.0.3 and up
823	Tiny Scanner - PDF Scanner App	BUSINESS	4.3	758590	12M	100000000	0	Everyone	{Business}	2018-08-02	Varies with device	4.1 and up
824	Compass	PHOTOGRAPHY	4.4	753115	Varies with device	50000000	0	Everyone	{Photography}	2018-08-03	71	4.4 and up
825	OkCupid Dating	GAME	4.1	753043	57M	100000000	0	Teen	{Action}	2018-08-01	1.15.2	4.0.3 and up
826	Tapatalk - 100,000+ Forums	VIDEO_PLAYERS	4.6	751911	Varies with device	10000000	0	Everyone	{"Video Players & Editors"}	2018-08-02	Varies with device	5.0 and up
827	Real Gangster Crime	PHOTOGRAPHY	4.3	751766	Varies with device	10000000	0	Everyone	{Photography}	2018-05-10	Varies with device	Varies with device
828	Photo Collage - Layout Editor	TRAVEL_AND_LOCAL	4.6	751551	42M	10000000	0	Mature 17+	{"Travel & Local"}	2018-08-02	5.2.0 21127	4.4 and up
829	Grindr - Gay chat	FAMILY	4.6	750321	Varies with device	10000000	0	Everyone	{Education}	2018-08-07	Varies with device	Varies with device
830	Stocard - Rewards Cards Wallet	GAME	4.6	745684	83M	5000000	0	Teen	{"Role Playing"}	2018-07-17	3.0.2	4.0.3 and up
831	Al-Moazin Lite (Prayer Times)	TOOLS	4.4	745245	3.5M	10000000	0	Everyone	{Tools}	2018-04-13	7.2.0	2.3 and up
832	Fart sound pranks	TOOLS	4.6	739329	Varies with device	50000000	0	Everyone	{Tools}	2018-04-17	Varies with device	Varies with device
833	LiveScore: Live Sport Updates	ENTERTAINMENT	4.5	736864	20M	10000000	0	Teen	{Entertainment}	2018-01-19	3.17.2	4.1 and up
834	EA SPORTS™ FIFA 18 Companion	FAMILY	4.5	736824	20M	10000000	0	Teen	{Entertainment}	2018-01-19	3.17.2	4.1 and up
835	Cloud Print	PERSONALIZATION	4.4	733838	21M	10000000	0	Everyone	{Personalization}	2018-06-29	2.4.25	4.0.3 and up
836	Moneycontrol – Stocks, Sensex, Mutual Funds, IPO	LIFESTYLE	4.4	726074	45M	10000000	0	Everyone	{Lifestyle}	2018-08-02	16.7.1	4.4 and up
837	Boomerang Make and Race	GAME	4.7	725897	31M	10000000	0	Teen	{Action}	2018-08-03	1.8.20	4.1 and up
838	Jewels Legend - Match 3 Puzzle	FAMILY	4.2	721646	99M	50000000	0	Teen	{Simulation}	2018-08-02	2.7	4.1 and up
839	Weather 14 Days	FAMILY	4.2	720685	51M	10000000	0	Teen	{"Role Playing"}	2018-06-21	3.6.1a	4.0.3 and up
840	Shopfully - Weekly Ads & Deals	VIDEO_PLAYERS	4.5	714665	50M	10000000	0	Everyone	{"Video Players & Editors"}	2018-07-24	4.13.3	4.3 and up
841	Mobile Bancomer	PHOTOGRAPHY	4.6	714340	Varies with device	10000000	0	Everyone	{Photography}	2018-07-28	Varies with device	Varies with device
842	Yahoo Fantasy Sports - #1 Rated Fantasy App	VIDEO_PLAYERS	4.5	712737	50M	10000000	0	Everyone	{"Video Players & Editors"}	2018-07-24	4.13.3	4.3 and up
843	AndroZip™ FREE File Manager	GAME	4.3	711719	Varies with device	10000000	0	Everyone	{Word}	2018-07-11	Varies with device	Varies with device
844	Run Sausage Run!	HEALTH_AND_FITNESS	4.4	708753	Varies with device	10000000	0	Everyone	{"Health & Fitness"}	2018-07-12	2.17.0	4.4 and up
845	Hard Time (Prison Sim)	HEALTH_AND_FITNESS	4.4	708710	Varies with device	10000000	0	Everyone	{"Health & Fitness"}	2018-07-12	2.17.0	4.4 and up
846	Zombie Defense	HEALTH_AND_FITNESS	4.4	708710	Varies with device	10000000	0	Everyone	{"Health & Fitness"}	2018-07-12	2.17.0	4.4 and up
847	Wallpapers HD, 4K Backgrounds	HEALTH_AND_FITNESS	4.4	708674	Varies with device	10000000	0	Everyone	{"Health & Fitness"}	2018-07-12	2.17.0	4.4 and up
848	SurfEasy Secure Android VPN	FINANCE	4.7	706618	Varies with device	10000000	0	Everyone	{Finance}	2018-07-31	Varies with device	Varies with device
849	Who Viewed My Facebook Profile - Stalkers Visitors	FINANCE	4.7	706302	Varies with device	10000000	0	Everyone	{Finance}	2018-07-31	Varies with device	Varies with device
850	Six Pack in 30 Days - Abs Workout	FINANCE	4.7	706301	Varies with device	10000000	0	Everyone	{Finance}	2018-07-31	Varies with device	Varies with device
851	Peak – Brain Games & Training	FAMILY	4.1	705805	35M	50000000	0	Everyone	{Entertainment}	2018-04-30	2.3.1.8	4.1 and up
852	Android Auto - Maps, Media, Messaging & Voice	ENTERTAINMENT	4.2	702975	49M	50000000	0	Everyone	{Entertainment}	2018-07-05	2.6.6.11	4.1 and up
853	MOD-MASTER for Minecraft PE (Pocket Edition) Free	COMMUNICATION	4.4	697939	Varies with device	10000000	0	Everyone	{Communication}	2018-07-18	7.3(823181)	4.4 and up
854	Kung Fu Do Fighting	GAME	4.3	697805	7.4M	50000000	0	Everyone	{Racing}	2018-07-03	1.2.13	3.0 and up
855	Race the Traffic Moto	NEWS_AND_MAGAZINES	4.6	697212	Varies with device	10000000	0	Mature 17+	{"News & Magazines"}	2018-08-02	Varies with device	Varies with device
856	Weight Watchers Mobile	VIDEO_PLAYERS	4.7	696665	91M	10000000	0	Everyone	{"Video Players & Editors"}	2018-07-05	4.7.4.3869-7b2372c3e	5.0 and up
857	No. Color - Color by Number, Number Coloring	GAME	4.3	696019	Varies with device	50000000	0	Everyone 10+	{Arcade}	2018-05-26	3.0.6	4.1 and up
858	Babbel – Learn Languages	SOCIAL	4.4	695613	Varies with device	50000000	0	Everyone	{Social}	2018-08-02	Varies with device	Varies with device
859	Crazy Doctor	SOCIAL	4.4	695576	Varies with device	50000000	0	Everyone	{Social}	2018-08-02	Varies with device	Varies with device
860	NARUTO X BORUTO NINJA VOLTAGE	PRODUCTIVITY	4.4	691474	Varies with device	100000000	0	Everyone	{Productivity}	2018-08-06	Varies with device	Varies with device
861	Background Eraser	PRODUCTIVITY	4.4	691474	Varies with device	100000000	0	Everyone	{Productivity}	2018-08-06	Varies with device	Varies with device
862	Slot Machines by IGG	PRODUCTIVITY	4.4	691474	Varies with device	100000000	0	Everyone	{Productivity}	2018-08-06	Varies with device	Varies with device
863	G Cloud Backup	PRODUCTIVITY	4.4	691474	Varies with device	100000000	0	Everyone	{Productivity}	2018-08-06	Varies with device	Varies with device
864	Apex Launcher	FAMILY	4.2	690148	25M	10000000	0	Teen	{Strategy}	2017-10-27	Varies with device	Varies with device
865	Power Rangers: Legacy Wars	FAMILY	4.4	687136	54M	50000000	0	Everyone	{Casual}	2018-05-25	1.5.3.20	4.1 and up
866	Heart of Vegas™ Slots – Free Slot Casino Games	GAME	4.2	685981	37M	100000000	0	Everyone	{Arcade}	2018-05-15	6.6.3	4.1 and up
867	Dictionary	GAME	4.2	685450	37M	100000000	0	Everyone	{Arcade}	2018-05-15	6.6.3	4.1 and up
868	Battlefield™ Companion	ENTERTAINMENT	4.5	684116	Varies with device	10000000	0	Teen	{Entertainment}	2018-07-31	Varies with device	4.2 and up
869	Agoda – Hotel Booking Deals	TOOLS	4.6	679912	Varies with device	10000000	0	Everyone	{Tools}	2018-07-27	Varies with device	Varies with device
870	Build a Bridge!	BUSINESS	4.3	674730	Varies with device	50000000	0	Everyone	{Business}	2018-05-21	Varies with device	Varies with device
871	CM Security Lite - Antivirus	FAMILY	4.1	673203	73M	50000000	0	Everyone	{Educational,"Action & Adventure"}	2018-01-19	6.7.5222	4.1 and up
872	Rush	FAMILY	4.1	672089	73M	50000000	0	Everyone	{Educational,"Action & Adventure"}	2018-01-19	6.7.5222	4.1 and up
873	MetaTrader 4	TOOLS	4.4	669901	Varies with device	50000000	0	Everyone	{Tools}	2018-08-07	Varies with device	Varies with device
874	Geometry Dash SubZero	SPORTS	4.6	666521	25M	10000000	0	Everyone	{Sports}	2018-07-29	5.5.9	4.1 and up
875	Amber Weather	SPORTS	4.6	666246	25M	10000000	0	Everyone	{Sports}	2018-07-29	5.5.9	4.1 and up
876	Hotels.com: Book Hotel Rooms & Find Vacation Deals	SHOPPING	4.4	662287	21M	10000000	0	Everyone	{Shopping}	2018-08-03	4.26.7	4.1 and up
877	Music - Mp3 Player	FAMILY	4	660613	21M	50000000	0	Everyone	{Simulation}	2017-03-01	1.32	2.3 and up
878	LightX Photo Editor & Photo Effects	FINANCE	4.3	659760	47M	50000000	0	Everyone	{Finance}	2018-07-18	6.28.0	4.4 and up
879	Video Player All Format	FINANCE	4.3	659741	47M	50000000	0	Everyone	{Finance}	2018-07-18	6.28.0	4.4 and up
880	Timely Alarm Clock	COMMUNICATION	4.3	659395	11M	100000000	0	Everyone	{Communication}	2018-06-07	9.8.000000010492	4.0 and up
881	GMX Mail	COMMUNICATION	4.3	659395	11M	100000000	0	Everyone	{Communication}	2018-06-07	9.8.000000010492	4.0 and up
882	Shooting King	PARENTING	4.7	658087	62M	10000000	0	Everyone	{Parenting}	2018-05-24	3.15.1	5.0 and up
883	Truck Driver Cargo	GAME	4.5	655145	72M	10000000	0	Teen	{Arcade}	2017-07-17	1.2.1	4.0.3 and up
884	Free Fur All – We Bare Bears	GAME	4.5	655067	72M	10000000	0	Teen	{Arcade}	2017-07-17	1.2.1	4.0.3 and up
885	Pocket	PHOTOGRAPHY	4.3	654419	Varies with device	50000000	0	Everyone	{Photography}	2018-02-01	Varies with device	4.0.3 and up
886	SketchBook - draw and paint	PHOTOGRAPHY	4.3	654418	Varies with device	50000000	0	Everyone	{Photography}	2018-02-01	Varies with device	4.0.3 and up
887	TRANSFORMERS: Earth Wars	ENTERTAINMENT	4.5	653008	16M	10000000	0	Everyone	{Entertainment}	2018-06-20	9.1.4	4.4 and up
888	SoloLearn: Learn to Code for Free	ENTERTAINMENT	4.5	653008	16M	10000000	0	Everyone	{Entertainment}	2018-06-20	9.1.4	4.4 and up
889	Operate Now: Hospital	ENTERTAINMENT	4.5	653008	16M	10000000	0	Everyone	{Entertainment}	2018-06-20	9.1.4	4.4 and up
890	English with Lingualeo	SPORTS	4.6	652940	90M	10000000	0	Teen	{Sports}	2018-07-05	1.3.5	4.1 and up
891	Miami crime simulator	GAME	4.1	650114	80M	10000000	0	Teen	{Action}	2018-07-03	3.11.0	4.0.3 and up
892	Solitaire	PERSONALIZATION	4.6	649568	26M	10000000	0	Everyone	{Personalization}	2018-08-01	4.12.0.44682	4.2 and up
893	FrostWire: Torrent Downloader & Music Player	TOOLS	4.5	648380	24M	10000000	0	Everyone	{Tools}	2018-08-01	4.6.4	4.1 and up
894	To Do List	PERSONALIZATION	4.3	647844	Varies with device	10000000	0	Everyone	{Personalization}	2018-07-24	Varies with device	Varies with device
895	Angry Birds Blast	PERSONALIZATION	4.3	647721	Varies with device	10000000	0	Everyone	{Personalization}	2018-07-24	Varies with device	Varies with device
896	Heavy Bus Simulator	VIDEO_PLAYERS	4.5	641219	Varies with device	10000000	0	Everyone	{"Video Players & Editors"}	2018-07-26	5.2.2	4.1 and up
897	Flickr	GAME	4.2	640974	47M	50000000	0	Everyone	{Racing}	2018-06-05	1.5	4.0.3 and up
898	Love Collage - Photo Editor	SOCIAL	4.5	637309	Varies with device	10000000	0	Teen	{Social}	2018-07-18	Varies with device	Varies with device
899	Nike Training Club - Workouts & Fitness Plans	SOCIAL	4.5	637254	Varies with device	10000000	0	Teen	{Social}	2018-07-18	Varies with device	Varies with device
900	Buzz Launcher-Smart&Free Theme	FAMILY	4.3	636995	49M	10000000	0	Teen	{Casual}	2018-07-31	4.34.0	4.0.3 and up
901	Yatra - Flights, Hotels, Bus, Trains & Cabs	FAMILY	4.2	636228	Varies with device	10000000	0	Everyone	{Casual}	2018-07-19	Varies with device	Varies with device
902	Wells Fargo Mobile	PHOTOGRAPHY	4.4	635846	14M	50000000	0	Everyone	{Photography}	2018-05-23	4.2.14	4.0 and up
903	LINE I Love Coffee	GAME	4.5	634159	58M	10000000	0	Teen	{Action}	2018-06-21	1.4	4.2 and up
904	Hopeless Land: Fight for Survival	PHOTOGRAPHY	4.4	626366	Varies with device	10000000	0	Everyone	{Photography}	2016-06-29	Varies with device	Varies with device
905	Fox News – Breaking News, Live Video & News Alerts	PERSONALIZATION	4.5	624924	24M	10000000	0	Everyone	{Personalization}	2018-08-01	4.8.2.2195	4.1 and up
906	Google Fit - Fitness Tracking	SOCIAL	4.4	624557	56M	10000000	0	Mature 17+	{Social}	2018-07-27	5.4.7.1	4.3 and up
907	iGun Pro -The Original Gun App	FAMILY	4.4	623398	58M	10000000	0	Everyone	{Puzzle,"Brain Games"}	2017-08-31	1.22.0	4.0.3 and up
908	Elevate - Brain Training Games	FAMILY	4.4	623398	58M	10000000	0	Everyone	{Puzzle,"Brain Games"}	2017-08-31	1.22.0	4.0.3 and up
909	NeuroNation - Focus and Brain Training	TRAVEL_AND_LOCAL	4.7	620534	9.8M	10000000	0	Everyone	{"Travel & Local"}	2018-07-30	5.7.3	4.0.3 and up
910	Call of Mini™ Zombies 2	TOOLS	4.3	618918	Varies with device	50000000	0	Everyone	{Tools}	2018-07-28	Varies with device	Varies with device
911	The Guardian	PRODUCTIVITY	4.5	618798	Varies with device	100000000	0	Everyone	{Productivity}	2018-07-11	16.0.10325.20043	4.4 and up
912	Evolution: Battle for Utopia	PRODUCTIVITY	4.5	618796	Varies with device	100000000	0	Everyone	{Productivity}	2018-07-11	16.0.10325.20043	4.4 and up
913	Governor of Poker 2 - OFFLINE POKER GAME	MAPS_AND_NAVIGATION	4.2	618562	Varies with device	50000000	0	Everyone	{"Maps & Navigation"}	2018-06-04	Varies with device	Varies with device
914	Cool Reader	GAME	4.5	617732	44M	10000000	0	Everyone 10+	{Action}	2018-07-29	1.18.4	4.1 and up
915	Sleep as Android: Sleep cycle tracker, smart alarm	MAPS_AND_NAVIGATION	4.4	617477	Varies with device	10000000	0	Everyone	{"Maps & Navigation"}	2018-08-05	Varies with device	Varies with device
916	My Emma :)	MAPS_AND_NAVIGATION	4.4	616742	Varies with device	10000000	0	Everyone	{"Maps & Navigation"}	2018-08-05	Varies with device	Varies with device
917	Big Hunter	COMMUNICATION	4.4	615381	37M	10000000	0	Mature 17+	{Communication}	2018-08-02	6.7.9.1	4.0.3 and up
918	GearBest Online Shopping	ENTERTAINMENT	4.2	613059	25M	50000000	0	Everyone	{Entertainment}	2018-07-26	18.07.0	4.1 and up
919	Talkray - Free Calls & Texts	FOOD_AND_DRINK	4.7	611136	19M	10000000	0	Everyone	{"Food & Drink"}	2018-07-13	3.2.0d	4.0.3 and up
920	Narcos: Cartel Wars	SHOPPING	4.2	609186	30M	10000000	0	Everyone	{Shopping}	2018-07-23	2.25.17	4.1 and up
921	Google Slides	PRODUCTIVITY	4.3	609182	9.2M	50000000	0	Everyone	{Productivity}	2018-07-02	6.4.0	4.0 and up
922	Camera MX - Free Photo & Video Camera	SHOPPING	4.2	608753	30M	10000000	0	Everyone	{Shopping}	2018-07-23	2.25.17	4.1 and up
923	Club Factory Everything, Unbeaten Price	TRAVEL_AND_LOCAL	4.3	599872	Varies with device	10000000	0	Everyone	{"Travel & Local"}	2018-08-04	7.3.3	4.4 and up
924	Dungeon Quest	FAMILY	4.3	598975	39M	10000000	0	Everyone	{Simulation}	2018-01-17	2.4.0	4.0 and up
925	Hitwe - meet people and chat	PHOTOGRAPHY	4.5	597068	Varies with device	10000000	0	Everyone	{Photography}	2018-07-09	Varies with device	Varies with device
926	Fandango Movies - Times + Tickets	FAMILY	4.5	596628	99M	10000000	0	Everyone	{Casual}	2018-08-02	3.39.0	4.1 and up
927	GUN ZOMBIE	PERSONALIZATION	4.3	595120	Varies with device	10000000	0	Everyone	{Personalization}	2018-07-10	Varies with device	Varies with device
928	Order & Chaos 2: 3D MMO RPG	COMMUNICATION	4.2	594728	Varies with device	50000000	0	Everyone	{Communication}	2018-07-19	7.3(800241)	4.4 and up
929	PBA® Bowling Challenge	COMMUNICATION	4.2	594728	Varies with device	50000000	0	Everyone	{Communication}	2018-07-19	7.3(800241)	4.4 and up
930	Camera for Android	COMMUNICATION	4.2	594720	Varies with device	50000000	0	Everyone	{Communication}	2018-07-19	7.3(800241)	4.4 and up
931	Word Crossy - A crossword game	TOOLS	4.5	594406	Varies with device	10000000	0	Everyone	{Tools}	2018-07-20	Varies with device	Varies with device
932	Code	GAME	4.5	592504	Varies with device	50000000	0	Everyone	{Music}	2018-08-03	5.13.007	4.1 and up
933	Manga Rock - Best Manga Reader	GAME	4.5	592504	Varies with device	50000000	0	Everyone	{Music}	2018-08-03	5.13.007	4.1 and up
934	FilmoraGo - Free Video Editor	GAME	4.5	592282	Varies with device	50000000	0	Everyone	{Music}	2018-08-03	5.13.007	4.1 and up
935	Should I Answer?	GAME	4.5	592068	Varies with device	50000000	0	Everyone	{Music}	2018-08-03	5.13.007	4.1 and up
936	No.Draw - Colors by Number 2018	FAMILY	4.4	591411	19M	10000000	0	Teen	{Entertainment}	2017-05-16	3.4.1	3.0 and up
937	DIRECTV	SHOPPING	4.6	591312	Varies with device	10000000	0	Everyone	{Shopping}	2018-08-03	Varies with device	Varies with device
938	The PCH App	SPORTS	4.1	585564	33M	10000000	0	Everyone	{Sports}	2018-06-01	1.5.0	4.0.3 and up
939	Rope’n’Fly 4	GAME	4.7	584126	64M	10000000	0	Everyone 10+	{"Role Playing"}	2018-07-27	1.5.4	4.1 and up
940	Racing in Car 2	FAMILY	4.6	584070	24M	5000000	0	Everyone 10+	{Strategy}	2018-07-18	1.4.1	4.1 and up
941	Moon+ Reader	FAMILY	4.7	580160	29M	5000000	0	Everyone	{Simulation}	2018-06-13	1.7.5	4.0.3 and up
942	Hollywood U: Rising Stars	GAME	4.4	579519	99M	10000000	0	Mature 17+	{Action}	2018-07-18	5.1	4.1 and up
943	SmartNews: Breaking News Headlines	BOOKS_AND_REFERENCE	4.4	577550	Varies with device	10000000	0	Everyone	{"Books & Reference"}	2018-08-02	Varies with device	Varies with device
944	Relax Melodies: Sleep Sounds	PRODUCTIVITY	4.4	577059	1.5M	50000000	0	Everyone	{Productivity}	2016-08-07	2.2.1B216	2.3.3 and up
945	Sweet Camera - Selfie Filters, Beauty Camera	TOOLS	4.3	576454	6.1M	50000000	0	Everyone	{Tools}	2018-02-05	2.0.9	4.0.3 and up
946	Goal Live Scores	FAMILY	4	576210	48M	50000000	0	Everyone	{Casual}	2013-08-22	3.25.3	2.3.3 and up
947	Garmin Connect™	PRODUCTIVITY	4.4	574719	20M	10000000	0	Everyone	{Productivity}	2018-07-16	5.0.0.1442	4.1 and up
948	Phone Tracker : Family Locator	HEALTH_AND_FITNESS	4.8	570242	20M	10000000	0	Everyone	{"Health & Fitness"}	2018-08-02	5.0.2	4.1 and up
949	Wordscapes	TOOLS	4.5	569727	Varies with device	10000000	0	Everyone	{Tools}	2017-11-03	Varies with device	Varies with device
950	Voxer Walkie Talkie Messenger	BOOKS_AND_REFERENCE	4.5	568922	Varies with device	100000000	0	Teen	{"Books & Reference"}	2018-08-01	Varies with device	Varies with device
951	Experiment Z - Zombie	GAME	4.6	568391	5.2M	5000000	0	Teen	{Action}	2014-07-01	4.3.1	2.1 and up
952	Calorie Counter by FatSecret	SHOPPING	4.3	568273	Varies with device	10000000	0	Everyone	{Shopping}	2018-08-04	Varies with device	Varies with device
953	Chrome Beta	GAME	4.5	567984	39M	10000000	0	Everyone	{Racing}	2018-07-16	1.7.3b	4.0.3 and up
954	Legend - Animate Text in Video	FAMILY	4.4	567632	15M	10000000	0	Everyone 10+	{Casual}	2018-06-12	6.8.1	4.1 and up
955	Star Wars™: Force Arena	PRODUCTIVITY	4.7	564759	Varies with device	10000000	0	Everyone	{Productivity}	2018-07-27	Varies with device	Varies with device
956	DiskDigger photo recovery	COMICS	4.5	564387	Varies with device	5000000	0	Everyone	{Comics}	2018-07-05	Varies with device	Varies with device
957	Angry Birds Match	GAME	4.4	562345	Varies with device	10000000	0	Teen	{Casino}	2018-07-23	Varies with device	Varies with device
958	WEB.DE Mail	PHOTOGRAPHY	4.5	559931	Varies with device	10000000	0	Everyone	{Photography}	2018-05-10	Varies with device	Varies with device
959	Google PDF Viewer	FAMILY	4.5	559597	89M	10000000	0	Teen	{Simulation}	2018-07-26	11.1.1.179661	4.1 and up
960	Notepad & To do list	HEALTH_AND_FITNESS	4.5	559262	Varies with device	10000000	0	Everyone	{"Health & Fitness"}	2018-07-11	Varies with device	Varies with device
961	photo keypad lockscreen	HEALTH_AND_FITNESS	4.5	559186	Varies with device	10000000	0	Everyone	{"Health & Fitness"}	2018-07-11	Varies with device	Varies with device
962	Hide Something - Photo, Video	FAMILY	4.3	556929	53M	10000000	0	Teen	{Casual}	2018-04-19	4.2.1	4.0.3 and up
963	War and Order	FAMILY	4.3	556659	46M	10000000	0	Everyone	{Entertainment}	2018-06-20	1805.0618.1637	4.1 and up
964	ibis Paint X	COMMUNICATION	4.4	552635	29M	10000000	0	Everyone	{Communication}	2018-08-01	6.19.1	4.1 and up
965	A+ Gallery - Photos & Videos	COMMUNICATION	4.4	552441	29M	10000000	0	Everyone	{Communication}	2018-08-01	6.19.1	4.1 and up
966	Once - Quality Matches Every day	PRODUCTIVITY	4	549973	Varies with device	50000000	0	Everyone	{Productivity}	2018-07-04	Varies with device	Varies with device
967	Bejeweled Blitz	PRODUCTIVITY	4.3	549900	60M	10000000	0	Everyone	{Productivity}	2018-07-18	7.3.30	4.1 and up
968	Lie Detector Test Prank	PRODUCTIVITY	4.3	549900	60M	10000000	0	Everyone	{Productivity}	2018-07-18	7.3.30	4.1 and up
969	Camera360 Lite - Selfie Camera	GAME	4.8	549720	85M	10000000	0	Everyone	{Simulation}	2018-07-19	2.1.1.4.0	4.4 and up
970	SofaScore Live Score	PRODUCTIVITY	4	549214	Varies with device	50000000	0	Everyone	{Productivity}	2018-07-04	Varies with device	Varies with device
971	Family Guy- Another Freakin’ Mobile Game	GAME	4.5	549039	23M	50000000	0	Teen	{Action}	2018-08-03	1.1.5	2.3 and up
972	Lose Weight in 30 Days	HEALTH_AND_FITNESS	4.6	548021	27M	10000000	0	Everyone	{"Health & Fitness"}	2018-08-02	p5.7.1	4.1 and up
973	trivago: Hotels & Travel	GAME	4.5	547644	23M	50000000	0	Teen	{Action}	2018-08-03	1.1.5	2.3 and up
974	CKZ ORIGINS	PHOTOGRAPHY	4.3	542561	46M	10000000	0	Everyone	{Photography}	2018-01-02	4.7.0	4.0 and up
975	Motorola Camera	GAME	4.7	541732	20M	5000000	0	Everyone	{Music}	2018-02-09	10.0.10	2.3 and up
976	Dungeon Boss – Strategy RPG	COMMUNICATION	4.3	541661	Varies with device	10000000	0	Everyone	{Communication}	2018-07-09	7.5.3.20547	4.1 and up
977	Al-Quran (Free)	COMMUNICATION	4.3	541389	Varies with device	10000000	0	Everyone	{Communication}	2018-07-09	7.5.3.20547	4.1 and up
978	Cooking in the Kitchen	COMMUNICATION	4.3	541389	Varies with device	10000000	0	Everyone	{Communication}	2018-07-09	7.5.3.20547	4.1 and up
979	Docs To Go™ Free Office Suite	GAME	4.6	541144	63M	10000000	0	Teen	{Arcade}	2018-07-12	1.2.5	5.0 and up
980	BEYBLADE BURST app	SOCIAL	4.4	540930	5.3M	10000000	0	Teen	{Social}	2018-07-23	50.2 lite	2.2 and up
981	bigbasket - online grocery	FAMILY	4.4	539931	69M	10000000	0	Everyone	{Simulation}	2018-08-06	1.11.01	4.2 and up
982	Word Link	TOOLS	4.5	537554	Varies with device	10000000	0	Everyone	{Tools}	2018-08-01	Varies with device	Varies with device
983	HOLLA Live: Meet New People via Random Video Chat	PRODUCTIVITY	4.7	536926	Varies with device	10000000	0	Everyone	{Productivity}	2018-08-05	Varies with device	Varies with device
984	KAYAK Flights, Hotels & Cars	GAME	4.5	531458	100M	5000000	0	Everyone	{Sports}	2018-07-20	3.04.1	4.0.3 and up
985	Sketch - Draw & Paint	GAME	4.3	531074	2.5M	10000000	0	Everyone	{Arcade}	2018-01-09	Varies with device	Varies with device
986	EyeEm - Camera & Photo Filter	FAMILY	4.5	530904	51M	10000000	0	Everyone	{Simulation,"Action & Adventure"}	2017-07-17	1.4.4	2.3.3 and up
987	Lumosity: #1 Brain Games & Cognitive Training App	FAMILY	4.5	530854	51M	10000000	0	Everyone	{Simulation,"Action & Adventure"}	2017-07-17	1.4.4	2.3.3 and up
988	I Know Stuff	FAMILY	4.1	530792	Varies with device	10000000	0	Everyone	{"Role Playing","Action & Adventure"}	2018-05-30	Varies with device	Varies with device
989	1LINE – One Line with One Touch	FAMILY	4.1	530792	Varies with device	10000000	0	Everyone	{"Role Playing","Action & Adventure"}	2018-05-30	Varies with device	Varies with device
990	Merge Dragons!	FAMILY	4.3	528917	59M	10000000	0	Everyone	{Educational,"Pretend Play"}	2018-07-26	1.38.0	4.1 and up
991	Tuner - gStrings Free	FAMILY	4.3	528745	59M	10000000	0	Everyone	{Educational,"Pretend Play"}	2018-07-26	1.38.0	4.1 and up
992	Shopkick: Free Gift Cards, Shop Rewards & Deals	GAME	4.8	528550	73M	10000000	0	Teen	{Arcade}	2018-07-26	1.2.6	4.1 and up
993	Draw a Stickman: EPIC 2 Free	PHOTOGRAPHY	4.3	527248	Varies with device	50000000	0	Everyone	{Photography}	2018-02-01	1.6.1	Varies with device
994	Find Real Love — YouLove Premium Dating	PHOTOGRAPHY	4.3	527247	Varies with device	50000000	0	Everyone	{Photography}	2018-02-01	1.6.1	Varies with device
995	Love Nikki-Dress UP Queen	GAME	4.8	526595	49M	10000000	0	Everyone 10+	{Arcade}	2018-06-26	2.9	4.0.3 and up
996	Bike Rivals	FAMILY	4.3	525552	48M	10000000	0	Everyone	{Action,"Action & Adventure"}	2017-10-15	1.2.3	2.3 and up
997	Quizlet: Learn Languages & Vocab with Flashcards	FAMILY	4.3	525552	48M	10000000	0	Everyone	{Action,"Action & Adventure"}	2017-10-15	1.2.3	2.3 and up
998	My Photo Keyboard	GAME	4.3	525517	48M	10000000	0	Everyone	{Action,"Action & Adventure"}	2017-10-15	1.2.3	2.3 and up
999	Instabridge - Free WiFi Passwords and Hotspots	GAME	4.4	524467	33M	10000000	0	Teen	{Casino}	2016-07-07	1.126	2.3.3 and up
1000	Aldiko Book Reader	HEALTH_AND_FITNESS	4.6	524299	Varies with device	10000000	0	Everyone	{"Health & Fitness"}	2018-06-29	Varies with device	Varies with device
1001	Draw a Stickman: EPIC Free	GAME	4.2	522466	37M	10000000	0	Mature 17+	{"Role Playing"}	2018-06-19	12.0.4.62276	4.0.3 and up
1002	RetailMeNot - Coupons, Deals & Discount Shopping	NEWS_AND_MAGAZINES	4.2	522205	Varies with device	10000000	0	Everyone	{"News & Magazines"}	2018-08-07	Varies with device	Varies with device
1003	Microsoft Translator	SOCIAL	4.2	522018	Varies with device	10000000	0	Mature 17+	{Social}	2018-08-02	Varies with device	Varies with device
1004	LOCX Applock Lock Apps & Photo	SPORTS	4.2	521140	Varies with device	10000000	0	Everyone 10+	{Sports}	2018-07-19	Varies with device	5.0 and up
1005	I Am Innocent	SPORTS	4.2	521140	Varies with device	10000000	0	Everyone 10+	{Sports}	2018-07-19	Varies with device	5.0 and up
1006	HDFC Bank MobileBanking	SPORTS	4.2	521140	Varies with device	10000000	0	Everyone 10+	{Sports}	2018-07-19	Varies with device	5.0 and up
1007	magicApp Calling & Messaging	SPORTS	4.2	521138	Varies with device	10000000	0	Everyone 10+	{Sports}	2018-07-19	Varies with device	5.0 and up
1008	LED Flashlight	SPORTS	4.2	521138	Varies with device	10000000	0	Everyone 10+	{Sports}	2018-07-19	Varies with device	5.0 and up
1009	Maps, GPS Navigation & Directions, Street View	SPORTS	4.2	521138	Varies with device	10000000	0	Everyone 10+	{Sports}	2018-07-19	Varies with device	5.0 and up
1010	IndiaMART: Search Products, Buy, Sell & Trade	SPORTS	4.2	521081	Varies with device	10000000	0	Everyone 10+	{Sports}	2018-07-19	Varies with device	5.0 and up
1011	busuu: Learn Languages - Spanish, English & More	GAME	4.6	520962	39M	10000000	0	Teen	{Action}	2017-06-28	108	4.0 and up
1012	CONTRACT KILLER: ZOMBIES (NR)	FAMILY	4.5	520654	Varies with device	10000000	0	Everyone	{Racing,"Action & Adventure"}	2018-06-28	Varies with device	4.4 and up
1013	Learn English Vocabulary - 6,000 Words	FAMILY	4.5	520609	Varies with device	10000000	0	Everyone	{Racing,"Action & Adventure"}	2018-06-28	Varies with device	4.4 and up
1014	Rento - Dice Board Game Online	DATING	4	516917	Varies with device	10000000	0	Mature 17+	{Dating}	2018-08-02	Varies with device	Varies with device
1015	Whisper	DATING	4	516801	Varies with device	10000000	0	Mature 17+	{Dating}	2018-08-02	Varies with device	Varies with device
1016	Sync.ME – Caller ID & Block	GAME	4.6	515657	63M	10000000	0	Everyone	{Action}	2018-06-05	1.7.1	4.0 and up
1017	Fabulous: Motivate Me! Meditate, Relax, Sleep	GAME	4.6	515240	63M	10000000	0	Everyone	{Action}	2018-06-05	1.7.1	4.0 and up
1018	Easy Voice Recorder	FAMILY	4.5	514088	83M	10000000	0	Everyone	{Arcade,"Action & Adventure"}	2018-05-30	3.200.18289	4.4 and up
1019	FBReader: Favorite Book Reader	PHOTOGRAPHY	4.5	512996	23M	10000000	0	Everyone	{Photography}	2018-08-02	4.0.3.5	4.1 and up
1020	Bejeweled Classic	PERSONALIZATION	4.4	512106	Varies with device	10000000	0	Everyone	{Personalization}	2018-07-16	Varies with device	Varies with device
1021	Backgrounds (HD Wallpapers)	PERSONALIZATION	4.4	512102	Varies with device	10000000	0	Everyone	{Personalization}	2018-07-16	Varies with device	Varies with device
1022	Newsroom: News Worth Sharing	FOOD_AND_DRINK	4.3	511420	Varies with device	10000000	0	Everyone	{"Food & Drink"}	2018-08-01	Varies with device	Varies with device
1023	iTranslate Translator & Dictionary	FOOD_AND_DRINK	4.3	511228	Varies with device	10000000	0	Everyone	{"Food & Drink"}	2018-08-01	Varies with device	Varies with device
1024	TETRIS Blitz	FINANCE	4.6	510401	79M	10000000	0	Everyone	{Finance}	2018-08-01	5.38.1	5.0 and up
1025	Golden HoYeah Slots - Real Casino Slots	FINANCE	4.6	510392	79M	10000000	0	Everyone	{Finance}	2018-08-01	5.38.1	5.0 and up
1026	Creative Destruction	GAME	4.6	506593	Varies with device	10000000	0	Everyone	{Arcade}	2018-08-01	5.66	4.1 and up
1027	Doctor Kids	GAME	4.6	506275	Varies with device	10000000	0	Everyone	{Arcade}	2018-08-01	5.66	4.1 and up
1028	Edmodo	GAME	4.6	506275	Varies with device	10000000	0	Everyone	{Arcade}	2018-08-01	5.66	4.1 and up
1029	TETRIS	VIDEO_PLAYERS	4.5	504823	Varies with device	50000000	0	Everyone	{"Video Players & Editors"}	2017-12-13	Varies with device	Varies with device
1030	Top Soccer Manager	GAME	4.3	504765	36M	5000000	0	Teen	{Action}	2018-07-30	2.4.1	4.4 and up
1031	TrueMoney Wallet	FAMILY	4.4	503757	Varies with device	10000000	0	Mature 17+	{Entertainment}	2018-08-02	Varies with device	Varies with device
1032	Anime Love Story Games: ✨Shadowtime✨	ENTERTAINMENT	4.2	501498	12M	100000000	0	Teen	{Entertainment}	2018-07-26	Varies with device	Varies with device
1033	Jorte Calendar & Organizer	ENTERTAINMENT	4.2	501498	12M	100000000	0	Teen	{Entertainment}	2018-07-26	Varies with device	Varies with device
1034	Dragonplay™ Poker Texas Holdem	ENTERTAINMENT	4.2	501497	12M	100000000	0	Teen	{Entertainment}	2018-07-26	Varies with device	Varies with device
1035	FOX	HEALTH_AND_FITNESS	4.5	501144	Varies with device	10000000	0	Everyone	{"Health & Fitness"}	2018-07-16	Varies with device	Varies with device
1036	Sweet Fruit Candy	HEALTH_AND_FITNESS	4.5	501144	Varies with device	10000000	0	Everyone	{"Health & Fitness"}	2018-07-16	Varies with device	Varies with device
1037	Font Studio- Photo Texts Image	GAME	4.4	499483	99M	10000000	0	Teen	{Adventure}	2018-08-02	5.6.14	4.1 and up
1038	Tickets + PDA 2018 Exam	TOOLS	4.1	498894	10M	50000000	0	Everyone	{Tools}	2018-08-02	2.8.9.1004	4.0.3 and up
1039	Flip the Gun - Simulator Game	BOOKS_AND_REFERENCE	4.7	497826	Varies with device	10000000	0	Everyone	{"Books & Reference"}	2018-05-30	Varies with device	Varies with device
1040	Power Rangers Dino Charge	PRODUCTIVITY	4.3	496399	Varies with device	100000000	0	Everyone	{Productivity}	2018-08-06	Varies with device	Varies with device
1041	FlipaClip - Cartoon animation	PRODUCTIVITY	4.3	496397	Varies with device	100000000	0	Everyone	{Productivity}	2018-08-06	Varies with device	Varies with device
1042	Vote for	TOOLS	4	495971	2.7M	50000000	0	Everyone	{Tools}	2016-03-16	2.3	2.3.3 and up
1043	Offline Maps & Navigation	PERSONALIZATION	4.3	495905	Varies with device	50000000	0	Everyone	{Personalization}	2018-07-29	Varies with device	Varies with device
1044	Browser 4G	PERSONALIZATION	4.3	495748	Varies with device	50000000	0	Everyone	{Personalization}	2018-07-29	Varies with device	Varies with device
1045	Photo Editor by BeFunky	FAMILY	4.1	488039	58M	10000000	0	Teen	{Strategy}	2017-11-15	1.0.175	2.3.3 and up
1046	VMate	SOCIAL	4.1	486830	Varies with device	10000000	0	Mature 17+	{Social}	2018-06-21	Varies with device	Varies with device
1047	Flashlight - Torch LED Light	SOCIAL	4.1	486824	Varies with device	10000000	0	Mature 17+	{Social}	2018-06-21	Varies with device	Varies with device
1048	Train Racing Games 3D 2 Player	GAME	4	484981	Varies with device	10000000	0	Everyone 10+	{Strategy}	2018-06-15	3.30.4.83	4.1 and up
1049	Easy Language Translator	PERSONALIZATION	4.6	484981	2.1M	10000000	0	Everyone	{Personalization}	2016-11-28	1.7.1	3.0 and up
1050	JusTalk - Free Video Calls and Fun Video Chat	FAMILY	4	484858	Varies with device	10000000	0	Everyone 10+	{Strategy}	2018-06-15	3.30.4.83	4.1 and up
1051	detikcom - Latest & Most Complete News	FAMILY	3.8	484226	27M	50000000	0	Teen	{Casual}	2018-06-15	3.0.10	4.0 and up
1052	Contacts+	FOOD_AND_DRINK	4.1	483960	Varies with device	10000000	0	Teen	{"Food & Drink"}	2018-07-23	Varies with device	Varies with device
1053	HAWK – Force of an Arcade Shooter. Shoot ’em up	COMMUNICATION	4.4	483782	20M	10000000	0	Everyone	{Communication}	2018-07-29	1.286	4.1 and up
1054	Sports Tracker Running Cycling	COMMUNICATION	4.4	483565	20M	10000000	0	Everyone	{Communication}	2018-07-29	1.286	4.1 and up
1055	Bloons TD 5	TOOLS	4.3	482630	Varies with device	10000000	0	Everyone	{Tools}	2018-08-03	Varies with device	Varies with device
1056	Grim Soul: Dark Fantasy Survival	TRAVEL_AND_LOCAL	4.5	481546	29M	10000000	0	Everyone	{"Travel & Local"}	2018-08-06	5.48	4.4 and up
1057	wetter.com - Weather and Radar	TRAVEL_AND_LOCAL	4.5	481546	29M	10000000	0	Everyone	{"Travel & Local"}	2018-08-06	5.48	4.4 and up
1058	Call Blocker	TRAVEL_AND_LOCAL	4.5	481546	29M	10000000	0	Everyone	{"Travel & Local"}	2018-08-06	5.48	4.4 and up
1059	Mackolik Live Results	TRAVEL_AND_LOCAL	4.5	481546	29M	10000000	0	Everyone	{"Travel & Local"}	2018-08-06	5.48	4.4 and up
1060	Where’s My Water?	TRAVEL_AND_LOCAL	4.5	481545	29M	10000000	0	Everyone	{"Travel & Local"}	2018-08-06	5.48	4.4 and up
1061	Lineage 2: Revolution	PRODUCTIVITY	4.4	480643	Varies with device	100000000	0	Everyone	{Productivity}	2018-07-22	16.0.10325.20024	4.4 and up
1062	Car Parking Game 3D - Real City Driving Challenge	PRODUCTIVITY	4.4	480640	Varies with device	100000000	0	Everyone	{Productivity}	2018-07-22	16.0.10325.20024	4.4 and up
1063	Texas Holdem & Omaha Poker: Pokerist	PRODUCTIVITY	4.4	480638	Varies with device	100000000	0	Everyone	{Productivity}	2018-07-22	16.0.10325.20024	4.4 and up
1064	AutoScout24 - used car finder	HEALTH_AND_FITNESS	4.3	480208	70M	500000000	0	Everyone	{"Health & Fitness"}	2018-07-31	5.17.2.009	5.0 and up
1065	Best Buy	SOCIAL	4	479939	15M	10000000	0	Mature 17+	{Social}	2018-07-09	1.23.3.0	4.4 and up
1066	World Newspapers	SOCIAL	4	479909	15M	10000000	0	Mature 17+	{Social}	2018-07-09	1.23.3.0	4.4 and up
1067	Verizon Cloud	SOCIAL	4	479908	15M	10000000	0	Mature 17+	{Social}	2018-07-09	1.23.3.0	4.4 and up
1068	Miraculous Ladybug & Cat Noir - The Official Game	NEWS_AND_MAGAZINES	4.3	479594	18M	10000000	0	Teen	{"News & Magazines"}	2018-07-28	9.2.3	4.0 and up
1069	Read- Latest News, Information, Gossip and Politics	PHOTOGRAPHY	4.2	477831	51M	10000000	0	Everyone	{Photography}	2018-07-28	2.0.17.9	4.0 and up
1070	Run with Map My Run	FAMILY	3.9	475944	35M	10000000	0	Everyone	{Simulation}	2018-06-26	4.5.4	4.1 and up
1071	Email TypeApp - Mail App	GAME	4.4	475369	13M	50000000	0	Everyone	{Racing}	2018-03-06	1.14	4.0.3 and up
1072	Bingo by IGG: Top Bingo+Slots!	FAMILY	4.4	475020	69M	5000000	0	Everyone 10+	{"Role Playing"}	2018-07-26	4.7.0.KG	4.1 and up
1073	Ultimate Tennis	TOOLS	4.5	474439	7.9M	10000000	0	Everyone	{Tools}	2018-06-26	6.1.7.5	4.2 and up
1074	iPair-Meet, Chat, Dating	TOOLS	4.2	472904	Varies with device	50000000	0	Everyone	{Tools}	2017-12-14	Varies with device	Varies with device
1075	Airplane Pilot Car Transporter	FAMILY	4.3	472584	91M	10000000	0	Everyone	{Simulation,"Action & Adventure"}	2018-08-02	3.2.0h	4.0.3 and up
1076	PlayKids - Educational cartoons and games for kids	FAMILY	4.3	472584	91M	10000000	0	Everyone	{Simulation,"Action & Adventure"}	2018-08-02	3.2.0h	4.0.3 and up
1077	Grand Theft Auto V: The Manual	FAMILY	4.5	472247	Varies with device	50000000	0	Everyone	{Puzzle}	2018-07-31	1.5.10	4.1 and up
1078	The Coupons App	HEALTH_AND_FITNESS	4.8	471036	Varies with device	10000000	0	Everyone	{"Health & Fitness"}	2018-08-03	Varies with device	4.0 and up
1079	TED	FAMILY	4.5	470713	Varies with device	50000000	0	Everyone	{Entertainment,"Music & Video"}	2018-08-03	3.43.3	4.1 and up
1080	ASOS	FAMILY	4.5	470694	Varies with device	50000000	0	Everyone	{Entertainment,"Music & Video"}	2018-08-03	3.43.3	4.1 and up
1081	ADW Launcher 2	ENTERTAINMENT	4.5	470089	Varies with device	50000000	0	Everyone	{Entertainment,"Music & Video"}	2018-08-03	3.43.3	4.1 and up
1082	La Liga - Spanish Soccer League Official	FAMILY	4.5	469851	Varies with device	50000000	0	Everyone	{Entertainment,"Music & Video"}	2018-08-03	3.43.3	4.1 and up
1083	Pixlr-o-matic	GAME	4.7	466495	52M	10000000	0	Teen	{Card}	2018-07-16	11.7.5	2.3.3 and up
1084	Diary with lock password	TOOLS	4.5	465831	8.9M	10000000	0	Everyone	{Tools}	2018-07-23	1.5.9.9	4.0 and up
1085	MyRadar NOAA Weather Radar	GAME	4.5	464900	33M	10000000	0	Teen	{Arcade}	2018-06-27	2.0.5	4.2 and up
1086	Motorbike Driving Simulator 3D	PHOTOGRAPHY	4.5	462702	45M	10000000	0	Everyone	{Photography}	2018-08-01	8.1.0.6	4.3 and up
1087	Wemep - Special price representative (special / shopping / shopping app / coupon / shipping)	GAME	4.5	462614	60M	10000000	0	Everyone	{Arcade}	2018-05-22	1.7.2	4.0.3 and up
1088	Hiya - Caller ID & Block	PHOTOGRAPHY	4.3	462152	1.5M	10000000	0	Everyone	{Photography}	2015-10-17	2.3.1	Varies with device
1089	Squadron - Bullet Hell Shooter	GAME	4.5	461137	60M	10000000	0	Everyone	{Arcade}	2018-05-22	1.7.2	4.0.3 and up
1090	Mr. Number-Block calls & spam	TRAVEL_AND_LOCAL	4.3	459851	Varies with device	10000000	0	Everyone	{"Travel & Local"}	2018-08-01	3.9.7	4.3 and up
1091	Pushbullet - SMS on PC	SPORTS	4.1	459797	Varies with device	50000000	0	Everyone	{Sports}	2018-08-02	Varies with device	Varies with device
1092	ESPN Fantasy Sports	SPORTS	4.1	459795	Varies with device	50000000	0	Everyone	{Sports}	2018-08-02	Varies with device	Varies with device
1093	Dating App, Flirt & Chat : W-Match	SPORTS	4.1	459795	Varies with device	50000000	0	Everyone	{Sports}	2018-08-02	Varies with device	Varies with device
1094	Thomas & Friends: Go Go Thomas	COMMUNICATION	4.5	457283	Varies with device	10000000	0	Everyone	{Communication}	2018-05-24	Varies with device	Varies with device
1095	MEGOGO - Cinema and TV	SOCIAL	4.5	457197	Varies with device	10000000	0	Teen	{Social}	2018-08-03	Varies with device	Varies with device
1096	Scanner Radio - Fire and Police Scanner	SOCIAL	4.5	456866	Varies with device	10000000	0	Teen	{Social}	2018-08-03	Varies with device	Varies with device
1097	Trulia Real Estate & Rentals	FAMILY	4.7	456474	86M	5000000	0	Teen	{"Role Playing"}	2018-07-24	1.2.0	4.4 and up
1098	Topbuzz: Breaking News, Videos & Funny GIFs	FOOD_AND_DRINK	4.5	455496	35M	10000000	0	Everyone	{"Food & Drink"}	2018-08-01	4.11.1	4.4 and up
1099	Tank Stars	FOOD_AND_DRINK	4.5	455377	35M	10000000	0	Everyone	{"Food & Drink"}	2018-08-01	4.11.1	4.4 and up
1100	Canva: Poster, banner, card maker & graphic design	BOOKS_AND_REFERENCE	4.5	454412	Varies with device	10000000	0	Everyone	{"Books & Reference"}	2018-05-18	Varies with device	Varies with device
1101	Blood Pressure Info	BOOKS_AND_REFERENCE	4.5	454060	Varies with device	10000000	0	Everyone	{"Books & Reference"}	2018-05-18	Varies with device	Varies with device
1102	Pocket Mortys	GAME	4.4	452589	99M	10000000	0	Mature 17+	{Action}	2018-07-01	2.2	4.0 and up
1103	Rivals at War: 2084	FAMILY	4.4	450013	37M	10000000	0	Everyone	{Puzzle}	2018-07-11	5.9.0	4.2 and up
1104	Ayat - Al Quran	GAME	4.5	446434	52M	10000000	0	Everyone	{Card}	2018-08-01	4.6.2.46103	4.0.3 and up
1105	Screen Off and Lock	BOOKS_AND_REFERENCE	4.8	445756	16M	10000000	0	Everyone	{"Books & Reference"}	2018-05-15	2.6.22	4.0 and up
1106	Learn English Words Free	SHOPPING	4.4	441473	Varies with device	10000000	0	Everyone	{Shopping}	2018-07-30	Varies with device	Varies with device
1107	Rosetta Stone: Learn to Speak & Read New Languages	SHOPPING	4.4	441473	Varies with device	10000000	0	Everyone	{Shopping}	2018-07-30	Varies with device	Varies with device
1108	Free Dating App & Flirt Chat - Match with Singles	SOCIAL	4.4	441189	Varies with device	10000000	0	Everyone	{Social}	2018-08-03	Varies with device	Varies with device
1109	Soccer 2018	SOCIAL	4.4	441189	Varies with device	10000000	0	Everyone	{Social}	2018-08-03	Varies with device	Varies with device
1110	SCRABBLE	GAME	4.4	438911	99M	10000000	0	Teen	{Action}	2018-06-28	1.23.1.2	4.0.3 and up
1111	Flightradar24 Flight Tracker	COMMUNICATION	4.5	437674	Varies with device	10000000	0	Everyone	{Communication}	2018-08-01	Varies with device	Varies with device
1112	ES Task Manager (Task Killer )	VIDEO_PLAYERS	4.3	436921	Varies with device	10000000	0	Teen	{"Video Players & Editors"}	2018-06-28	Varies with device	Varies with device
1113	Blibli.com Online Shopping	TOOLS	4.6	436615	10M	10000000	0	Everyone	{Tools}	2018-06-05	3.3.1	4.0.3 and up
1114	Gems or jewels ?	VIDEO_PLAYERS	4.3	436170	Varies with device	10000000	0	Teen	{"Video Players & Editors"}	2018-06-28	Varies with device	Varies with device
1115	S.O.L : Stone of Life EX	HEALTH_AND_FITNESS	4.8	432160	15M	10000000	0	Everyone	{"Health & Fitness"}	2018-06-28	Varies with device	Varies with device
1116	Google Voice	VIDEO_PLAYERS	3.7	430643	4.9M	50000000	0	Everyone	{"Video Players & Editors"}	2018-05-31	2.5.0	4.1 and up
1117	MadLipz	TOOLS	4.5	429580	Varies with device	10000000	0	Everyone	{Tools}	2018-03-16	Varies with device	Varies with device
1118	Tennis Champion 3D - Online Sports Game	TOOLS	4.2	428581	4.7M	10000000	0	Everyone	{Tools}	2018-07-17	1.33	4.0 and up
1119	Omlet Arcade - Stream, Meet, Play	GAME	4	428268	22M	10000000	0	Everyone	{Action}	2015-09-14	1.8.1	2.3 and up
1120	Space Shooter : Galaxy Attack	HEALTH_AND_FITNESS	4.8	428156	15M	10000000	0	Everyone	{"Health & Fitness"}	2018-06-28	Varies with device	Varies with device
1121	Shopkins World!	PRODUCTIVITY	4.4	427185	Varies with device	10000000	0	Teen	{Productivity}	2018-06-08	Varies with device	Varies with device
1122	QR BARCODE SCANNER	SOCIAL	4.2	423138	Varies with device	10000000	0	Mature 17+	{Social}	2018-07-09	Varies with device	Varies with device
1123	Mafia City	SOCIAL	4.2	423138	Varies with device	10000000	0	Mature 17+	{Social}	2018-07-09	Varies with device	Varies with device
1124	X-plore File Manager	SOCIAL	4.2	423105	Varies with device	10000000	0	Mature 17+	{Social}	2018-07-09	Varies with device	Varies with device
1125	CR & CoC Private Server - Clash Barbarians PRO	GAME	4.2	422244	32M	50000000	0	Teen	{Arcade}	2018-04-23	1.24	4.1 and up
1126	Color Touch Effects	TRAVEL_AND_LOCAL	3.9	421800	Varies with device	10000000	0	Teen	{"Travel & Local"}	2018-07-27	Varies with device	Varies with device
1127	ALL-IN-ONE PACKAGE TRACKING	GAME	4.3	421000	36M	10000000	0	Everyone	{Arcade}	2018-06-13	3.1.1	4.1 and up
1128	Free WiFi Connect	PHOTOGRAPHY	4.5	420973	Varies with device	10000000	0	Everyone	{Photography}	2018-08-02	Varies with device	Varies with device
1129	IKO	TOOLS	4.1	420518	Varies with device	10000000	0	Everyone	{Tools}	2018-07-04	Varies with device	Varies with device
1130	U-Dictionary: Best English Learning Dictionary	FAMILY	4.2	419375	31M	10000000	0	Everyone 10+	{Casual}	2016-06-21	1.2.2	2.3 and up
1131	CM Flashlight (Compass, SOS)	HOUSE_AND_HOME	4.5	417907	34M	10000000	0	Everyone	{"House & Home"}	2018-08-01	9.8.1.7425	4.4 and up
1132	MARVEL Strike Force	HOUSE_AND_HOME	4.5	417907	34M	10000000	0	Everyone	{"House & Home"}	2018-08-01	9.8.1.7425	4.4 and up
1133	Peggle Blast	FAMILY	4.7	417197	99M	10000000	0	Everyone 10+	{"Role Playing"}	2018-05-30	1.14.0	2.3 and up
1134	Rope’n’Fly 3 - Dusk Till Dawn	GAME	4.7	416540	99M	10000000	0	Everyone 10+	{"Role Playing"}	2018-05-30	1.14.0	2.3 and up
1135	All Video Downloader	NEWS_AND_MAGAZINES	4.6	413999	10M	5000000	0	Teen	{"News & Magazines"}	2018-08-03	3.53.2	4.1 and up
1136	Cartoon Wars: Blade	GAME	3.7	413609	22M	10000000	0	Mature 17+	{Racing}	2018-08-01	2.8	4.1 and up
1137	NTES	SOCIAL	4.5	412888	35M	10000000	0	Everyone	{Social}	2018-07-31	3.8.1	4.1 and up
1138	AfterFocus	FAMILY	4.7	412744	10M	10000000	0	Everyone	{Entertainment,Creativity}	2018-07-19	0.2.7	4.4 and up
1139	My love	SOCIAL	4.5	412725	35M	10000000	0	Everyone	{Social}	2018-07-31	3.8.1	4.1 and up
1140	Hornet - Gay Social Network	ENTERTAINMENT	4.2	411683	24M	50000000	0	Teen	{Entertainment}	2018-08-02	3.0.231.18141	4.1 and up
1141	Draft Simulator for FUT 18	SPORTS	4.7	410395	Varies with device	10000000	0	Everyone	{Sports}	2018-07-31	Varies with device	Varies with device
1142	Ginger Keyboard - Emoji, GIFs, Themes & Games	SPORTS	4.7	410384	Varies with device	10000000	0	Everyone	{Sports}	2018-07-31	Varies with device	Varies with device
1143	Jumia online shopping	TOOLS	4.5	410303	Varies with device	10000000	0	Everyone	{Tools}	2016-09-05	Varies with device	Varies with device
1144	Free Slideshow Maker & Video Editor	GAME	4.6	408292	29M	10000000	0.99	Mature 17+	{Action}	2018-07-12	1.7.110758	4.1 and up
1145	San Andreas Crime Stories	GAME	4.5	407788	19M	5000000	0	Everyone	{Action}	2013-07-18	3.4.0	2.1 and up
1146	Flashlight	ENTERTAINMENT	4.3	407719	Varies with device	10000000	0	Teen	{Entertainment}	2018-07-27	Varies with device	Varies with device
1147	Realtor.com Real Estate: Homes for Sale and Rent	ENTERTAINMENT	4.3	407719	Varies with device	10000000	0	Teen	{Entertainment}	2018-07-27	Varies with device	Varies with device
1148	Sygic Car Navigation	ENTERTAINMENT	4.3	407698	Varies with device	10000000	0	Teen	{Entertainment}	2018-07-27	Varies with device	Varies with device
1149	Iron Blade	FAMILY	4.6	407694	Varies with device	5000000	0	Teen	{Simulation}	2018-07-19	2.7.1	4.2 and up
1150	Timehop	LIFESTYLE	4.7	407589	Varies with device	10000000	0	Everyone	{Lifestyle}	2018-07-20	Varies with device	Varies with device
1151	Mobills: Budget Planner	GAME	4.4	406511	21M	5000000	0	Teen	{Action}	2016-10-21	1.0.5	4.0.3 and up
1152	Real Madrid App	FAMILY	4.1	405824	Varies with device	10000000	0	Everyone	{Entertainment}	2018-08-04	7.1.1	4.2 and up
1153	Horoscopes – Daily Zodiac Horoscope and Astrology	PRODUCTIVITY	4.6	404617	Varies with device	10000000	0	Everyone	{Productivity}	2018-04-06	Varies with device	Varies with device
1154	Imgur: Find funny GIFs, memes & watch viral videos	PRODUCTIVITY	4.6	404610	Varies with device	10000000	0	Everyone	{Productivity}	2018-04-06	Varies with device	Varies with device
1155	Box	PRODUCTIVITY	4.6	404610	Varies with device	10000000	0	Everyone	{Productivity}	2018-04-06	Varies with device	Varies with device
1156	Video Editor	GAME	4.7	403911	23M	10000000	0	Everyone	{Card}	2018-06-24	2.277.0	4.1 and up
1157	Weather forecast	PHOTOGRAPHY	4.2	401820	Varies with device	50000000	0	Everyone	{Photography}	2018-04-27	Varies with device	Varies with device
1158	Habbo - Virtual World	GAME	4.5	401648	70M	10000000	0	Everyone	{Action}	2017-04-12	1.6.1	4.0.3 and up
1159	Avatar Musik	GAME	4.2	401643	Varies with device	10000000	0	Teen	{Action}	2018-07-18	Varies with device	Varies with device
1160	My Tele2	COMMUNICATION	4.4	401530	Varies with device	10000000	0	Everyone	{Communication}	2018-08-03	Varies with device	Varies with device
1161	NEW - Read Newspaper, News 24h	GAME	4.5	401425	70M	10000000	0	Everyone	{Action}	2017-04-12	1.6.1	4.0.3 and up
1162	Dinosaur War	FAMILY	4.6	401211	Varies with device	10000000	0	Everyone	{Entertainment}	2018-07-18	Varies with device	Varies with device
1163	GoPro (formerly Capture)	HEALTH_AND_FITNESS	4.4	400592	2.9M	10000000	0	Everyone	{"Health & Fitness"}	2018-07-04	5.23	4.0 and up
1164	Stocks, Forex, Bitcoin, Ethereum: Portfolio & News	HEALTH_AND_FITNESS	4.5	399009	Varies with device	10000000	0	Everyone	{"Health & Fitness"}	2018-06-08	Varies with device	Varies with device
1165	Asteroids 3D live wallpaper	FAMILY	4.3	398746	Varies with device	10000000	0	Everyone 10+	{Strategy}	2018-08-06	Varies with device	4.1 and up
1166	Instant Buttons: The Best Soundboard	LIFESTYLE	4.5	398307	19M	10000000	0	Everyone	{Lifestyle}	2018-07-25	Varies with device	Varies with device
1167	Pineapple Pen	TRAVEL_AND_LOCAL	4.3	397422	Varies with device	10000000	0	Teen	{"Travel & Local"}	2018-08-03	Varies with device	Varies with device
1168	Cops N Robbers - FPS Mini Game	FAMILY	4.4	397147	Varies with device	10000000	0	Teen	{Entertainment}	2018-08-02	Varies with device	Varies with device
1169	My Calendar - Period Tracker	GAME	4.5	396090	26M	10000000	0	Teen	{Casino}	2018-05-30	1.7.0	4.0.3 and up
1170	PIP Selfie Camera Photo Editor	FAMILY	4.7	394842	75M	10000000	0	Everyone	{Casual,"Pretend Play"}	2018-08-04	1.5	4.1 and up
1171	Todoist: To-do lists for task management & errands	FAMILY	4.3	392819	53M	10000000	0	Everyone	{"Role Playing","Action & Adventure"}	2016-07-22	37893	4.0 and up
1172	Grubhub: Food Delivery	FAMILY	4.3	392596	53M	10000000	0	Everyone	{"Role Playing","Action & Adventure"}	2016-07-22	37893	4.0 and up
1173	Bingo Party - Free Bingo Games	FAMILY	4.3	392596	53M	10000000	0	Everyone	{"Role Playing","Action & Adventure"}	2016-07-22	37893	4.0 and up
1174	Alarm Clock Plus★	GAME	4.3	391325	43M	10000000	0	Everyone	{Adventure}	2018-06-20	1.131.2	4.0 and up
1175	Can Knockdown	ENTERTAINMENT	3.7	388089	Varies with device	10000000	0	Teen	{Entertainment}	2018-04-12	Varies with device	Varies with device
1176	NOOK: Read eBooks & Magazines	ENTERTAINMENT	3.7	388089	Varies with device	10000000	0	Teen	{Entertainment}	2018-04-12	Varies with device	Varies with device
1177	My Teacher - Classroom Play	ENTERTAINMENT	3.7	388089	Varies with device	10000000	0	Teen	{Entertainment}	2018-04-12	Varies with device	Varies with device
1178	DramaFever: Stream Asian Drama Shows & Movies	TOOLS	4.6	387958	9.0M	10000000	0	Teen	{Tools}	2018-07-16	5.6.2 (US)	4.0.3 and up
1179	Marble Woka Woka 2018 - Bubble Shooter Match 3	SHOPPING	4.4	385764	8.4M	10000000	0	Mature 17+	{Shopping}	2018-08-05	3.82	4.1 and up
1180	Fake Call - Fake Caller ID	FAMILY	4.5	384602	88M	10000000	0	Everyone	{"Role Playing"}	2018-07-30	1.21.1	5.0 and up
1181	OpenVPN Connect – Fast & Safe SSL VPN Client	BOOKS_AND_REFERENCE	4.4	384368	Varies with device	10000000	0	Everyone	{"Books & Reference"}	2018-08-04	Varies with device	Varies with device
1182	Miami Crime Vice Town	SOCIAL	4.1	382121	28M	10000000	0	Everyone	{Social}	2018-07-26	7.3.1	4.1 and up
1183	Does not Commute	SOCIAL	4.1	382120	28M	10000000	0	Everyone	{Social}	2018-07-26	7.3.1	4.1 and up
1184	Metal Soldiers 2	GAME	4.4	382100	Varies with device	10000000	0	Teen	{Casino}	2018-07-11	Varies with device	Varies with device
1185	Stylish Fonts	FINANCE	4.5	381788	32M	10000000	0	Everyone	{Finance}	2018-08-02	3.22.0	4.1 and up
1186	All Football - Latest News & Videos	VIDEO_PLAYERS	3.3	381023	53M	10000000	0	Everyone	{"Video Players & Editors"}	2018-07-26	2.7.8	4.0 and up
1187	BeSoccer - Soccer Live Score	BUSINESS	4.4	380837	7.3M	10000000	0	Everyone	{Business}	2018-07-04	3.4.5	4.2 and up
1188	CALCU™ Stylish Calculator Free	FAMILY	4.4	379415	68M	10000000	0	Everyone	{Casual,"Action & Adventure"}	2018-06-26	1.28.01	4.1 and up
1189	STARDOM: THE A-LIST	FAMILY	4.4	379245	68M	10000000	0	Everyone	{Casual,"Action & Adventure"}	2018-06-26	1.28.01	4.1 and up
1190	Free Adblocker Browser - Adblock & Popup Blocker	FAMILY	4.7	376223	24M	1000000	0	Everyone	{Strategy}	2018-07-18	1.4.2	4.1 and up
1191	Defender	GAME	4.5	375996	3.3M	10000000	0	Everyone	{Board}	2018-08-06	1.48.0	4.1 and up
1192	Scratch Logo Quiz. Challenging brain puzzle	PHOTOGRAPHY	4.1	373606	Varies with device	10000000	0	Everyone	{Photography}	2018-03-27	Varies with device	Varies with device
1193	Masha and Bear: Cooking Dash	TOOLS	4.4	372553	21M	10000000	0	Everyone	{Tools}	2018-08-06	3.0.1114	4.1 and up
1194	Postings (Craigslist Search App)	GAME	4.5	371318	90M	10000000	0	Everyone 10+	{Arcade}	2018-06-08	10.1.6	4.1 and up
1195	Delivery Club-food delivery: pizza, sushi, burger, salad	FAMILY	4.2	369378	24M	50000000	0	Everyone	{Casual,"Pretend Play"}	2018-04-17	1.5	4.1 and up
1196	Despegar.com Hotels and Flights	GAME	4.2	369203	24M	50000000	0	Everyone	{Casual,"Pretend Play"}	2018-04-17	1.5	4.1 and up
1197	GPS Status & Toolbox	FAMILY	4.2	367951	76M	5000000	0	Teen	{Strategy}	2018-07-16	2.2.8	4.0.3 and up
1198	Bubble Shooter	LIFESTYLE	4.1	367505	Varies with device	10000000	0	Everyone	{Lifestyle}	2018-07-25	Varies with device	Varies with device
1199	Job Search by ZipRecruiter	SHOPPING	4.1	367290	11M	10000000	0	Everyone	{Shopping}	2018-07-20	4.9.3	4.0.3 and up
1200	Knights N Squires	BOOKS_AND_REFERENCE	4.1	364452	7.1M	10000000	0	Everyone	{"Books & Reference"}	2018-07-11	9.1.363	4.1 and up
1201	Inst Download - Video & Photo	FAMILY	4.5	364013	27M	1000000	0	Everyone 10+	{"Role Playing"}	2018-08-06	14.4.4.00	4.1 and up
1202	ClassDojo	BOOKS_AND_REFERENCE	4.1	363934	7.1M	10000000	0	Everyone	{"Books & Reference"}	2018-07-11	9.1.363	4.1 and up
1203	Fraction Calculator Plus Free	FAMILY	4.6	361970	58M	5000000	0	Everyone	{Casual,"Pretend Play"}	2018-08-02	28.0.14	4.1 and up
1204	My Little Pony: Harmony Quest	BOOKS_AND_REFERENCE	4.6	361780	9.7M	10000000	0	Everyone	{"Books & Reference"}	2018-05-30	4.1	2.3 and up
1205	Baseball Boy!	FAMILY	4.6	361734	58M	5000000	0	Everyone	{Casual,"Pretend Play"}	2018-08-02	28.0.14	4.1 and up
1206	WGT Golf Game by Topgolf	GAME	4.2	360630	40M	50000000	0	Everyone	{Puzzle}	2018-07-31	1.2.7	4.1 and up
1207	TEKKEN™	TRAVEL_AND_LOCAL	4.4	359560	Varies with device	10000000	0	Everyone	{"Travel & Local"}	2018-08-02	Varies with device	Varies with device
1208	Samsung Smart Switch Mobile	TRAVEL_AND_LOCAL	4.4	359403	Varies with device	10000000	0	Everyone	{"Travel & Local"}	2018-08-02	Varies with device	Varies with device
1209	Counter Terrorist Attack	GAME	4.7	358817	49M	10000000	0	Everyone	{Arcade}	2018-07-30	1.2.2	4.1 and up
1210	McDonald’s	GAME	4.6	358633	19M	10000000	0	Everyone	{Racing}	2018-05-03	1.32	4.0.3 and up
1211	Hole.io	NEWS_AND_MAGAZINES	4.5	357944	12M	10000000	0	Everyone	{"News & Magazines"}	2018-07-12	9.1	4.1 and up
1212	AutoCAD - DWG Viewer & Editor	HEALTH_AND_FITNESS	3.9	357417	Varies with device	10000000	0	Everyone	{"Health & Fitness"}	2018-07-26	Varies with device	Varies with device
1213	CM FILE MANAGER HD	FAMILY	4.2	357049	40M	50000000	0	Everyone	{Puzzle}	2018-07-31	1.2.7	4.1 and up
1214	CONTRACT KILLER: ZOMBIES	NEWS_AND_MAGAZINES	4.3	355921	17M	10000000	0	Teen	{"News & Magazines"}	2018-08-01	9.1.4	4.0 and up
1215	Walk with Map My Walk	FAMILY	3.3	355837	3.7M	10000000	0	Everyone	{Entertainment}	2016-12-07	14	2.3 and up
1216	CrossFire: Legends	FAMILY	4.5	355613	59M	10000000	0	Teen	{"Role Playing"}	2018-08-02	1.21.2	4.4 and up
1217	Legion of Heroes	FAMILY	4.5	354454	71M	10000000	0	Everyone	{Racing,"Action & Adventure"}	2018-07-02	6.4.0	4.1 and up
1218	Face Filter, Selfie Editor - Sweet Camera	FAMILY	4.5	354384	71M	10000000	0	Everyone	{Racing,"Action & Adventure"}	2018-07-02	6.4.0	4.1 and up
1219	Block Gun 3D: Ghost Ops	GAME	4.5	354373	66M	10000000	0	Everyone 10+	{Action}	2017-10-12	1.2.7	4.1 and up
1220	Free english course	HOUSE_AND_HOME	4.6	353813	Varies with device	10000000	0	Everyone	{"House & Home"}	2018-08-01	Varies with device	Varies with device
1221	ZALORA Fashion Shopping	HOUSE_AND_HOME	4.6	353813	Varies with device	10000000	0	Everyone	{"House & Home"}	2018-08-01	Varies with device	Varies with device
1222	New Launcher 2018	HOUSE_AND_HOME	4.6	353800	Varies with device	10000000	0	Everyone	{"House & Home"}	2018-08-01	Varies with device	Varies with device
1223	Color by Number – New Coloring Book	HOUSE_AND_HOME	4.6	353799	Varies with device	10000000	0	Everyone	{"House & Home"}	2018-08-01	Varies with device	Varies with device
1224	Peers.TV: broadcast TV channels First, Match TV, TNT ...	FAMILY	3.7	353342	13M	50000000	0	Everyone	{Entertainment}	2017-11-24	2.0.7	4.0 and up
1225	Amazon for Tablets	TOOLS	4.3	352097	6.7M	10000000	0	Everyone	{Tools}	2018-06-12	3.8.5	4.0 and up
1226	Naruto Shippuden - Watch Free!	FAMILY	4.4	351607	8.7M	5000000	0	Everyone 10+	{Casual}	2016-06-29	1.26.03	2.3.3 and up
1227	Ice Cream Jump	TOOLS	4.6	351267	5.0M	10000000	0	Everyone	{Tools}	2018-02-09	3.1.0	4.0 and up
1228	My Diet Coach - Weight Loss Motivation & Tracker	PHOTOGRAPHY	4.1	351255	4.0M	10000000	0	Everyone	{Photography}	2018-06-29	4.6.0.0	4.2 and up
1229	Talking Babsy Baby: Baby Games	PHOTOGRAPHY	4.1	351254	4.0M	10000000	0	Everyone	{Photography}	2018-06-29	4.6.0.0	4.2 and up
1230	Cameringo Lite. Filters Camera	VIDEO_PLAYERS	4.5	351168	13M	10000000	0	Everyone	{"Video Players & Editors"}	2016-10-18	2.0.0	2.3 and up
1231	Booking Revolution	COMMUNICATION	4.3	350154	Varies with device	10000000	0	Everyone	{Communication}	2018-07-29	Varies with device	Varies with device
1232	Gear.Club - True Racing	COMMUNICATION	4.3	350154	Varies with device	10000000	0	Everyone	{Communication}	2018-07-29	Varies with device	Varies with device
1233	LEGO® DC Mighty Micros	GAME	4.1	349503	19M	10000000	0	Everyone	{Arcade}	2015-08-26	1.31	4.0 and up
1234	TunnelBear VPN	COMMUNICATION	4.5	349384	8.2M	10000000	0	Everyone	{Communication}	2018-07-24	3.47	4.0.3 and up
1235	Bunny Skater	PRODUCTIVITY	4.1	349151	Varies with device	50000000	0	Everyone	{Productivity}	2018-08-01	Varies with device	Varies with device
1236	Evie Launcher	GAME	4.4	348962	26M	1000000	6.99	Mature 17+	{Action}	2015-03-21	1.08	3.0 and up
1237	Dr. Booster - Boost Game Speed	FINANCE	4.2	348132	Varies with device	100000000	0	Everyone	{Finance}	2018-07-26	2.70.206190089	Varies with device
1238	Fists For Fighting (Fx3)	GAME	4.1	347883	20M	10000000	0	Everyone	{Action}	2018-03-16	1.2.7	4.0.3 and up
1239	VTB-Online	FINANCE	4.2	347874	Varies with device	100000000	0	Everyone	{Finance}	2018-07-26	2.70.206190089	Varies with device
1240	BSPlayer FREE	FINANCE	4.2	347838	Varies with device	100000000	0	Everyone	{Finance}	2018-07-26	2.70.206190089	Varies with device
1241	Portable Wi-Fi hotspot	FINANCE	4.2	347838	Varies with device	100000000	0	Everyone	{Finance}	2018-07-26	2.70.206190089	Varies with device
1242	Voice Changer	COMMUNICATION	4.3	347086	Varies with device	10000000	0	Everyone	{Communication}	2018-01-23	Varies with device	4.1 and up
1243	Blogger	COMMUNICATION	4.3	346982	Varies with device	10000000	0	Everyone	{Communication}	2018-01-23	Varies with device	4.1 and up
1244	Evil Apples: A Dirty Card Game	COMMUNICATION	4.3	346980	Varies with device	10000000	0	Everyone	{Communication}	2018-01-23	Varies with device	4.1 and up
1245	Cartoon Wars 3	PHOTOGRAPHY	4.4	346681	7.1M	10000000	0	Everyone	{Photography}	2018-02-10	2.0.949	4.4 and up
1246	Smart AppLock (App Protect)	SOCIAL	4.3	344921	Varies with device	10000000	0	Everyone	{Social}	2018-06-07	Varies with device	Varies with device
1247	Bridge Constructor Playground FREE	GAME	4.4	344819	51M	5000000	0	Teen	{Action}	2016-10-18	1.4	3.0 and up
1248	Wheelie Challenge	GAME	4.2	344585	Varies with device	50000000	0	Everyone	{Word}	2018-07-02	Varies with device	Varies with device
1249	Cat Sim Online: Play with Cats	FAMILY	4.4	344383	30M	10000000	0	Everyone	{Casual}	2018-03-20	9.2.4	4.0.3 and up
1250	Doomsday Preppers™	FAMILY	4.3	344283	95M	10000000	0	Teen	{"Role Playing"}	2017-12-18	1.11.39	4.1 and up
1251	WhatsApp Business	GAME	4.5	343263	Varies with device	10000000	0	Everyone 10+	{Action}	2018-08-06	1.2.6	4.0.3 and up
1252	ZenUI Help	EDUCATION	4.5	342918	8.1M	10000000	0	Everyone	{Education}	2018-07-29	2.24	4.0 and up
1253	Expedia Hotels, Flights & Car Rental Travel Deals	SPORTS	4.2	342912	6.0M	10000000	0	Everyone	{Sports}	2018-08-03	4.3.1	4.4 and up
1254	The Zueira’s Voice	SPORTS	4.2	342909	6.0M	10000000	0	Everyone	{Sports}	2018-08-03	4.3.1	4.4 and up
1255	Yahoo Finance	TOOLS	4.5	342336	Varies with device	10000000	0	Everyone	{Tools,Education}	2015-08-10	Varies with device	Varies with device
1256	beIN SPORTS TR	BOOKS_AND_REFERENCE	4.4	341234	30M	10000000	0	Everyone 10+	{"Books & Reference"}	2018-03-20	3.9.1	4.2 and up
1257	Classic Words Solo	BOOKS_AND_REFERENCE	4.4	341157	30M	10000000	0	Everyone 10+	{"Books & Reference"}	2018-03-20	3.9.1	4.2 and up
1258	Chat Rooms, Avatars, Date - Galaxy	FINANCE	4.4	341090	53M	10000000	0	Everyone	{Finance}	2018-07-31	7.8.8	4.4 and up
1259	The Weather Network	GAME	4.6	338742	48M	5000000	0	Teen	{Action}	2018-08-03	1.11.0	6.0 and up
1260	ROMWE - Women’s Fashion	TOOLS	3.7	338449	2.8M	10000000	0	Everyone	{Tools}	2018-06-19	8.6	2.3.3 and up
1261	easyJet: Travel App	GAME	4.6	337913	48M	5000000	0	Teen	{Action}	2018-08-03	1.11.0	6.0 and up
1262	Money Manager Expense & Budget	GAME	4.6	337913	48M	5000000	0	Teen	{Action}	2018-08-03	1.11.0	6.0 and up
1263	Battery Calibration	GAME	4.6	337752	48M	5000000	0	Teen	{Action}	2018-08-03	1.11.0	6.0 and up
1264	osmino Wi-Fi: free WiFi	TOOLS	4.8	337532	15M	10000000	0	Everyone	{Tools}	2018-07-11	V1-180703	4.4 and up
1265	Daily Workouts - Exercise Fitness Routine Trainer	TOOLS	4.5	337242	Varies with device	10000000	0	Everyone	{Tools}	2018-02-16	Varies with device	Varies with device
1266	theScore: Live Sports Scores, News, Stats & Videos	GAME	4.2	336386	88M	10000000	0	Everyone 10+	{Action}	2018-07-24	2.0.1	4.0.3 and up
1267	DigiCal Calendar Agenda	FINANCE	3.3	335738	Varies with device	10000000	0	Everyone	{Finance}	2018-05-03	Varies with device	Varies with device
1268	Weather Crave	COMMUNICATION	4.3	335646	8.3M	10000000	0	Everyone	{Communication}	2018-07-26	7.21	2.3 and up
1269	Four In A Line Free	TOOLS	4.4	335115	1.8M	10000000	0	Everyone	{Tools}	2018-04-07	3.11.2	6.0 and up
1270	Drag’n’Boom	FOOD_AND_DRINK	4.2	333208	34M	10000000	0	Everyone	{"Food & Drink"}	2018-08-01	1.161.10002	5.0 and up
1271	Learn Japanese, Korean, Chinese Offline & Free	VIDEO_PLAYERS	4.8	332623	4.6M	10000000	0	Everyone	{"Video Players & Editors"}	2018-07-27	1.1.58	4.1 and up
1272	Barbie Life™	LIBRARIES_AND_DEMO	4.3	332083	6.3M	10000000	0	Everyone	{"Libraries & Demo"}	2018-04-23	1.9.19	4.0 and up
1273	TomTom GPS Navigation Traffic	GAME	4.3	331692	Varies with device	10000000	0	Everyone	{Racing}	2018-03-27	Varies with device	4.0.3 and up
1274	IV Go（get IV for Pokemon）	COMMUNICATION	4.5	330761	Varies with device	10000000	0	Everyone	{Communication}	2018-07-03	Varies with device	Varies with device
1275	Talkatone: Free Texts, Calls & Phone Number	TOOLS	4.3	330468	Varies with device	10000000	0	Everyone	{Tools}	2018-05-29	Varies with device	Varies with device
1276	Cookpad	PHOTOGRAPHY	4.2	329160	27M	10000000	0	Everyone	{Photography}	2018-05-29	3.1.8.180529	2.3 and up
1277	BuzzFeed: News, Tasty, Quizzes	FAMILY	4	328619	15M	10000000	0	Everyone	{Casual,Creativity}	2017-10-06	2.2	4.1 and up
1278	Girls Craft: Exploration	HEALTH_AND_FITNESS	4.5	328469	Varies with device	10000000	0	Teen	{"Health & Fitness"}	2018-08-01	Varies with device	Varies with device
1279	Nubank	TOOLS	4	327914	Varies with device	10000000	0	Everyone	{Tools}	2018-04-11	Varies with device	Varies with device
1280	YouTube Gaming	GAME	4.4	327599	66M	10000000	0	Teen	{Action}	2017-07-28	2.4.2	2.3.3 and up
1281	Cardboard	GAME	4.2	326689	20M	10000000	0	Teen	{Action}	2018-05-30	1.31	4.2 and up
1282	Freeletics: Personal Trainer & Fitness Workouts	VIDEO_PLAYERS	4.4	326232	Varies with device	50000000	0	Everyone	{"Video Players & Editors"}	2016-12-03	Varies with device	Varies with device
1283	Camera FV-5 Lite	GAME	4.2	326042	10M	10000000	0	Teen	{Action}	2014-06-06	3.1.7	3.0 and up
1284	Delicious Recipes	HEALTH_AND_FITNESS	4.5	325738	Varies with device	10000000	0	Everyone	{"Health & Fitness"}	2018-07-28	Varies with device	Varies with device
1285	Card Wars - Adventure Time	FAMILY	4.3	322976	Varies with device	5000000	0	Teen	{Simulation}	2018-06-13	Varies with device	4.2 and up
1286	Fairy Kingdom: World of Magic and Farming	FOOD_AND_DRINK	4.4	321134	30M	10000000	0	Everyone	{"Food & Drink"}	2018-06-12	4.7.0	4.1 and up
1287	True Skate	GAME	4.3	320334	27M	50000000	0	Teen	{Action}	2018-08-08	1.1.2	4.1 and up
1288	Mint: Budget, Bills, Finance	FAMILY	4	319777	Varies with device	10000000	0	Teen	{Entertainment}	2018-08-03	Varies with device	5.0 and up
1289	Blur Image Background	ENTERTAINMENT	4	319692	Varies with device	10000000	0	Teen	{Entertainment}	2018-08-03	Varies with device	5.0 and up
1290	Star Chart	ENTERTAINMENT	4	319691	Varies with device	10000000	0	Teen	{Entertainment}	2018-08-03	Varies with device	5.0 and up
1291	Survival Run with Bear Grylls	ENTERTAINMENT	4	319691	Varies with device	10000000	0	Teen	{Entertainment}	2018-08-03	Varies with device	5.0 and up
1292	Beauty Idol: Fashion Queen	FAMILY	4.4	318867	10M	10000000	0	Everyone	{Puzzle}	2018-07-06	26	4.0.3 and up
1293	Texas Holdem Poker	SHOPPING	4.6	318142	Varies with device	10000000	0	Teen	{Shopping}	2018-08-03	Varies with device	Varies with device
1294	Survival: Prison Escape	HEALTH_AND_FITNESS	4.6	318134	Varies with device	5000000	0	Everyone	{"Health & Fitness"}	2018-05-29	Varies with device	Varies with device
1295	Pregnant Emergency Surgery	PHOTOGRAPHY	4.3	316378	4.4M	10000000	0	Everyone	{Photography}	2017-06-03	4.0.7.0	2.3 and up
1296	File Manager -- Take Command of Your Files Easily	SHOPPING	4.5	315908	52M	10000000	0	Everyone	{Shopping}	2018-08-01	5.21.1	4.1 and up
1297	Aviary Stickers: Free Pack	SHOPPING	4.5	315908	52M	10000000	0	Everyone	{Shopping}	2018-08-01	5.21.1	4.1 and up
1298	Money Lover: Expense Tracker, Budget Planner	TOOLS	4.6	315585	8.5M	10000000	0	Everyone	{Tools}	2018-07-18	1.0.204375696	5.0 and up
1299	FilterGrid - Cam&Photo Editor	SOCIAL	4.3	315441	Varies with device	10000000	0	Everyone	{Social}	2018-07-26	Varies with device	Varies with device
1300	Yandex.Transport	SOCIAL	4.3	315390	Varies with device	10000000	0	Everyone	{Social}	2018-07-26	Varies with device	Varies with device
1301	Monitor Your Weight	GAME	4.3	314774	43M	5000000	0	Teen	{Action}	2013-09-16	3.8.2	2.1 and up
1302	Carousell: Snap-Sell, Chat-Buy	EDUCATION	4.7	314300	3.3M	10000000	0	Everyone	{Education}	2018-05-02	1.94.9	4.0 and up
1303	Sonic the Hedgehog™ Classic	EDUCATION	4.7	314299	3.3M	10000000	0	Everyone	{Education}	2018-05-02	1.94.9	4.0 and up
1304	Fruit Block - Puzzle Legend	DATING	4.2	313769	Varies with device	10000000	0	Mature 17+	{Dating}	2018-08-04	2.6.142	4.1 and up
1305	Retro Camera	DATING	4.2	313724	Varies with device	10000000	0	Mature 17+	{Dating}	2018-08-04	2.6.141	4.1 and up
1306	Hambo	DATING	4.2	313724	Varies with device	10000000	0	Mature 17+	{Dating}	2018-08-04	2.6.141	4.1 and up
1307	ASUS Gallery	SOCIAL	4.5	313633	Varies with device	10000000	0	Teen	{Social}	2018-07-25	Varies with device	Varies with device
1308	Messenger for SMS	SOCIAL	4.5	313403	Varies with device	10000000	0	Teen	{Social}	2018-07-25	Varies with device	Varies with device
1309	ExDialer - Dialer & Contacts	ENTERTAINMENT	3.7	310095	Varies with device	10000000	0	Teen	{Entertainment}	2018-03-05	Varies with device	Varies with device
1310	Dictionary - WordWeb	ENTERTAINMENT	3.7	310066	Varies with device	10000000	0	Teen	{Entertainment}	2018-03-05	Varies with device	Varies with device
1311	K PLUS	ENTERTAINMENT	3.7	310066	Varies with device	10000000	0	Teen	{Entertainment}	2018-03-05	Varies with device	Varies with device
1312	GO Notifier	SOCIAL	4.1	309872	85M	10000000	0	Teen	{Social}	2018-08-03	14.0.13	4.1 and up
1313	Do It Later: Tasks & To-Dos	WEATHER	4.5	309617	Varies with device	10000000	0	Everyone	{Weather}	2018-07-23	Varies with device	Varies with device
1314	Nick	GAME	4.3	309176	70M	5000000	0	Everyone 10+	{Simulation}	2018-08-02	1.3.15	4.4 and up
1315	High School Simulator 2017	FAMILY	4.3	308944	70M	5000000	0	Everyone 10+	{Simulation}	2018-08-02	1.3.15	4.4 and up
1316	Sweet Snap - live filter, Selfie photo edit	SHOPPING	4.6	308234	38M	10000000	0	Everyone	{Shopping}	2018-08-02	5.3.0	4.0.3 and up
1317	Newton Mail - Email App for Gmail, Outlook, IMAP	PHOTOGRAPHY	4.3	307453	17M	10000000	0	Everyone	{Photography}	2017-10-26	1.7.16	4.0.3 and up
1318	Hangouts Dialer - Call Phones	GAME	4.2	307398	9.9M	10000000	0	Everyone	{Arcade}	2017-11-30	1.12.5.1	2.1 and up
1319	Keep My Notes - Notepad & Memo	GAME	4.5	306764	29M	10000000	0	Everyone	{Trivia}	2018-08-03	6.2	4.0.3 and up
1320	Bleacher Report: sports news, scores, & highlights	FAMILY	4.2	306652	64M	10000000	0	Everyone 10+	{Strategy}	2018-07-31	4.6.4	4.0.3 and up
1321	Translate: text & voice translator	FAMILY	4.6	305765	34M	10000000	0	Everyone	{"Role Playing"}	2018-07-31	1.1.7	4.1 and up
1322	Motorola Gallery	DATING	4.1	305737	Varies with device	10000000	0	Mature 17+	{Dating}	2018-08-02	Varies with device	Varies with device
1323	WomanLog Calendar	DATING	4.1	305708	Varies with device	10000000	0	Mature 17+	{Dating}	2018-08-02	Varies with device	Varies with device
1324	WithstandZ - Zombie Survival!	DATING	4.1	305708	Varies with device	10000000	0	Mature 17+	{Dating}	2018-08-02	Varies with device	Varies with device
1325	StirFry Stunts - We Bare Bears	SOCIAL	4.2	305367	46M	10000000	0	Everyone	{Social}	2018-08-01	16.7.1	4.4 and up
1326	FeaturePoints: Free Gift Cards	COMMUNICATION	4.5	305347	39M	10000000	0	Teen	{Communication}	2018-07-27	7.1.8	4.1 and up
1327	Keyboard ManMan	COMMUNICATION	4.5	305218	Varies with device	10000000	0	Everyone	{Communication}	2018-08-03	Varies with device	Varies with device
1328	Adblock Browser for Android	GAME	4.2	304106	Varies with device	10000000	0	Teen	{Adventure}	2018-08-06	2.8.2	4.0.3 and up
1329	Crazy Wheels	FAMILY	4.4	303394	53M	10000000	0	Mature 17+	{Entertainment}	2018-08-03	4.426	4.1 and up
1330	Eurosport	GAME	4	301895	25M	50000000	0	Everyone	{Racing}	2018-05-23	1.4.4	4.1 and up
1331	Street Skater 3D	MAPS_AND_NAVIGATION	4.2	301413	48M	5000000	0	Everyone	{"Maps & Navigation"}	2018-08-01	5.44.1	4.1 and up
1332	Guns of Glory	GAME	4.5	299046	47M	10000000	0	Mature 17+	{Action}	2018-07-12	0.9.5	4.1 and up
1333	Download All Files	PRODUCTIVITY	4.5	298854	Varies with device	10000000	0	Everyone	{Productivity}	2018-08-05	Varies with device	Varies with device
1334	Scout GPS Navigation & Meet Up	PRODUCTIVITY	4.5	298854	Varies with device	10000000	0	Everyone	{Productivity}	2018-08-05	Varies with device	Varies with device
1335	MagiMobile – Mighty Magiswords	PRODUCTIVITY	4.5	298843	Varies with device	10000000	0	Everyone	{Productivity}	2018-08-05	Varies with device	Varies with device
1336	DB Navigator	PERSONALIZATION	4.6	298321	14M	10000000	0	Everyone	{Personalization}	2018-08-05	2.5.5.9	4.2 and up
1337	Sniper Killer Shooter	COMMUNICATION	4.3	298041	Varies with device	10000000	0	Everyone	{Communication}	2018-07-03	Varies with device	Varies with device
1338	Cartoon Network App	ENTERTAINMENT	4.3	296829	11M	10000000	0	Teen	{Entertainment}	2018-07-15	2.13.5	4.1 and up
1339	Flowers Live Wallpaper	NEWS_AND_MAGAZINES	4.3	296781	Varies with device	10000000	0	Everyone 10+	{"News & Magazines"}	2018-07-24	Varies with device	Varies with device
1340	Digital Alarm Clock	NEWS_AND_MAGAZINES	4.3	296781	Varies with device	10000000	0	Everyone 10+	{"News & Magazines"}	2018-07-24	Varies with device	Varies with device
1341	Seen	NEWS_AND_MAGAZINES	4.3	296781	Varies with device	10000000	0	Everyone 10+	{"News & Magazines"}	2018-07-24	Varies with device	Varies with device
1342	Stack Jump	ENTERTAINMENT	4.3	296771	11M	10000000	0	Teen	{Entertainment}	2018-07-15	2.13.5	4.1 and up
1343	Relax Rain ~ Rain Sounds	ENTERTAINMENT	4.3	296771	11M	10000000	0	Teen	{Entertainment}	2018-07-15	2.13.5	4.1 and up
1344	Step Counter - Pedometer Free & Calorie Counter	GAME	4.7	295576	3.9M	10000000	0	Everyone	{Word}	2018-06-06	1.1.3	3.0 and up
1345	Card Creator for CR	TOOLS	4.5	295430	1.4M	10000000	0	Everyone	{Tools}	2018-04-17	1.26	2.2 and up
1346	Pokémon TV	GAME	4.7	295305	3.9M	10000000	0	Everyone	{Word}	2018-06-06	1.1.3	3.0 and up
1347	IFTTT	GAME	4.7	295241	3.9M	10000000	0	Everyone	{Word}	2018-06-06	1.1.3	3.0 and up
1348	YAZIO Calorie Counter, Nutrition Diary & Diet Plan	ART_AND_DESIGN	4.4	295237	Varies with device	10000000	0	Everyone	{"Art & Design"}	2018-07-30	Varies with device	Varies with device
1349	Fines of the State Traffic Safety Inspectorate are official: inspection, payment of fines	ART_AND_DESIGN	4.4	295221	Varies with device	10000000	0	Everyone	{"Art & Design"}	2018-07-30	Varies with device	Varies with device
1350	Orbita AI — Exciting mobile puzzles & riddles	PERSONALIZATION	4.4	294701	5.1M	10000000	0	Teen	{Personalization}	2018-03-17	2.85	4.0.3 and up
1351	Open Camera	GAME	4.6	293086	Varies with device	5000000	0	Everyone	{Action}	2015-10-22	8.1	4.0.3 and up
1352	Free Books - Spirit Fanfiction and Stories	NEWS_AND_MAGAZINES	4	293080	25M	10000000	0	Everyone 10+	{"News & Magazines"}	2018-08-06	5.17	4.4 and up
1353	Talabat: Food Delivery	NEWS_AND_MAGAZINES	4	293080	25M	10000000	0	Everyone 10+	{"News & Magazines"}	2018-08-06	5.17	4.4 and up
1354	Live 4D Results ! (MY & SG)	NEWS_AND_MAGAZINES	4	293080	25M	10000000	0	Everyone 10+	{"News & Magazines"}	2018-08-06	5.17	4.4 and up
1355	2018Emoji Keyboard 😂 Emoticons Lite -sticker&gif	FOOD_AND_DRINK	4	292969	16M	10000000	0	Everyone	{"Food & Drink"}	2018-07-30	4.11.3	4.2 and up
1356	8fit Workouts & Meal Planner	GAME	4.7	292164	59M	10000000	0	Everyone 10+	{Action}	2018-08-01	1.8.4	4.1 and up
1357	Moto Rider	GAME	4.6	291941	90M	10000000	0	Everyone 10+	{Action}	2018-07-27	6.3.2	4.0.3 and up
1358	Yandex.Disk	NEWS_AND_MAGAZINES	4.4	291901	4.3M	10000000	0	Mature 17+	{"News & Magazines"}	2018-07-20	2.6.0	4.1 and up
1359	Redbox	PERSONALIZATION	4.2	290241	4.1M	50000000	0	Everyone	{Personalization}	2014-06-24	1.9	2.1 and up
1360	Emoji Keyboard - Cute Emoji,GIF, Sticker, Emoticon	FAMILY	4.4	288835	91M	5000000	0	Mature 17+	{Strategy}	2018-07-19	2.7.6	4.4 and up
1361	Alarm Clock	SPORTS	4.1	288809	6.6M	10000000	0	Everyone	{Sports}	2017-09-27	2.5.1	4.4 and up
1362	Photo Editor	SPORTS	4.1	288809	6.6M	10000000	0	Everyone	{Sports}	2017-09-27	2.5.1	4.4 and up
1363	Texas Holdem Poker Pro	SPORTS	4.1	288809	6.6M	10000000	0	Everyone	{Sports}	2017-09-27	2.5.1	4.4 and up
1364	Mi Remote controller - for TV, STB, AC and more	SPORTS	4.1	288809	6.6M	10000000	0	Everyone	{Sports}	2017-09-27	2.5.1	4.4 and up
1365	Terminal Emulator for Android	FAMILY	4.1	288606	92M	10000000	0	Everyone	{Adventure,Education}	2018-05-08	2.7.4	4.0 and up
1366	Beauty Camera - Selfie Camera	FAMILY	4.1	288523	92M	10000000	0	Everyone	{Adventure,Education}	2018-05-08	2.7.4	4.0 and up
1367	Escape the Prison Room	FAMILY	4.4	288209	21M	5000000	0	Teen	{Entertainment}	2018-07-23	2.17	4.4 and up
1368	Waterfall Live Wallpaper	ENTERTAINMENT	4.4	288150	21M	5000000	0	Teen	{Entertainment}	2018-07-23	2.17	4.4 and up
1369	The Team - Live Sport: football, tennis, rugby ..	ENTERTAINMENT	4.4	288150	21M	5000000	0	Teen	{Entertainment}	2018-07-23	2.17	4.4 and up
1370	SCB EASY	ENTERTAINMENT	4.4	288150	21M	5000000	0	Teen	{Entertainment}	2018-07-23	2.17	4.4 and up
1371	Counter Attack - Multiplayer FPS	PRODUCTIVITY	4.7	287250	Varies with device	50000000	0	Everyone	{Productivity}	2018-05-09	Varies with device	Varies with device
1372	AppLock - Fingerprint Unlock	BUSINESS	4.7	286897	39M	10000000	0	Everyone	{Business}	2017-05-30	1.2.6	3.0 and up
1373	Petals 3D live wallpaper	BUSINESS	4.7	286897	39M	10000000	0	Everyone	{Business}	2017-05-30	1.2.6	3.0 and up
1374	Ideal Weight, BMI Calculator	MAPS_AND_NAVIGATION	4.3	286454	3.7M	10000000	0	Everyone	{"Maps & Navigation"}	2016-08-09	2.1.2	2.3 and up
1375	Fiesta by Tango - Find, Meet and Make New Friends	DATING	4.1	285838	15M	10000000	0	Mature 17+	{Dating}	2018-07-30	11.10.1	4.1 and up
1376	Supermarket – Game for Kids	SOCIAL	4.1	285820	Varies with device	10000000	0	Mature 17+	{Social}	2018-06-19	Varies with device	Varies with device
1377	Mobile Kick	SOCIAL	4.1	285816	Varies with device	10000000	0	Mature 17+	{Social}	2018-06-19	Varies with device	Varies with device
1378	Dragon Sim Online: Be A Dragon	GAME	4.3	285814	84M	10000000	0	Teen	{Action}	2018-06-26	3.5	4.0 and up
1379	GO Launcher EX UI5.0 theme	PHOTOGRAPHY	4.5	285788	46M	10000000	0	Everyone	{Photography}	2017-12-04	1.8.0.170824_9	5.0 - 8.0
1380	Banorte Movil	DATING	4.1	285726	15M	10000000	0	Mature 17+	{Dating}	2018-07-30	11.10.1	4.1 and up
1381	Flashlight & LED Torch	DATING	4.1	285726	15M	10000000	0	Mature 17+	{Dating}	2018-07-30	11.10.1	4.1 and up
1382	Runtastic Sleep Better: Sleep Cycle & Smart Alarm	SOCIAL	3.6	284795	31M	10000000	0	Mature 17+	{Social}	2018-08-03	4.1.2	4.3 and up
1383	Calm - Meditate, Sleep, Relax	SHOPPING	4.6	284725	20M	10000000	0	Everyone	{Shopping}	2018-07-31	7.2.1	4.1 and up
1384	Monefy - Money Manager	SHOPPING	4.6	284721	20M	10000000	0	Everyone	{Shopping}	2018-07-31	7.2.1	4.1 and up
1385	MIX by Camera360	LIFESTYLE	4.6	284670	Varies with device	10000000	0	Everyone	{Lifestyle}	2018-07-24	Varies with device	Varies with device
1386	Happy Street	FAMILY	3.8	283823	Varies with device	50000000	0	Everyone 10+	{Casual}	2016-11-23	Varies with device	Varies with device
1387	ShopSavvy Barcode & QR Scanner	SPORTS	4.4	283662	Varies with device	10000000	0	Everyone	{Sports}	2018-06-15	Varies with device	4.1 and up
1388	McDonald’s - McDonald’s Japan	SPORTS	3.9	282727	63M	10000000	0	Everyone	{Sports}	2017-12-07	18.0.5.172734	4.4 and up
1389	Sworkit: Workouts & Fitness Plans	PRODUCTIVITY	4.1	282460	Varies with device	500000000	0	Everyone	{Productivity}	2018-05-23	Varies with device	Varies with device
1390	FreePrints – Free Photos Delivered	FINANCE	4.4	281635	Varies with device	5000000	0	Everyone	{Finance}	2018-08-06	Varies with device	Varies with device
1391	Identity V	FINANCE	4.4	281485	Varies with device	5000000	0	Everyone	{Finance}	2018-05-11	Varies with device	Varies with device
1392	Magazine Luiza Online Shopping	FAMILY	4.4	281448	70M	10000000	0	Everyone	{Racing,"Action & Adventure"}	2018-06-01	1.5.0	4.0 and up
1393	Baby Panda Care	GAME	4.6	280098	50M	10000000	0	Everyone	{Arcade}	2018-07-20	2.11.2	4.0.3 and up
1394	Cisco Webex Meetings	WEATHER	4.4	279917	Varies with device	10000000	0	Everyone	{Weather}	2018-07-18	Varies with device	Varies with device
1395	Remind: School Communication	SHOPPING	4.4	279428	16M	10000000	0	Everyone	{Shopping}	2018-08-03	6.4.2	4.4 and up
1396	Buscapé - Offers and discounts	FINANCE	4.2	278082	70M	10000000	0	Everyone	{Finance}	2018-07-30	10.78	4.0.3 and up
1397	Angelo Rules - Crazy day	SPORTS	4.2	277939	Varies with device	5000000	0	Mature 17+	{Sports}	2018-08-02	Varies with device	Varies with device
1398	NBA	SPORTS	4.2	277904	Varies with device	5000000	0	Mature 17+	{Sports}	2018-08-02	Varies with device	Varies with device
1399	Epson iPrint	SPORTS	4.2	277904	Varies with device	5000000	0	Mature 17+	{Sports}	2018-08-02	Varies with device	Varies with device
1400	الفاتحون Conquerors	SPORTS	4.2	277902	Varies with device	5000000	0	Mature 17+	{Sports}	2018-08-02	Varies with device	Varies with device
1401	PixelLab - Text on pictures	SPORTS	4.2	277900	Varies with device	5000000	0	Mature 17+	{Sports}	2018-08-02	Varies with device	Varies with device
1402	nds4droid	PRODUCTIVITY	4.2	277794	Varies with device	10000000	0	Everyone	{Productivity}	2016-12-07	Varies with device	Varies with device
1403	World at War: WW2 Strategy MMO	GAME	4.4	276105	Varies with device	10000000	0	Everyone 10+	{Arcade}	2018-08-01	Varies with device	4.1 and up
1404	Football Live Scores	GAME	4.3	275843	41M	10000000	0	Teen	{Adventure}	2018-07-19	1.401	4.0 and up
1405	Mini Motor Racing WRT	GAME	4.4	275447	Varies with device	10000000	0	Everyone 10+	{Arcade}	2018-08-01	Varies with device	4.1 and up
1406	Club Penguin Island	FAMILY	4.3	275048	41M	10000000	0	Teen	{Strategy}	2018-06-22	12.2	2.3 and up
1407	Shrimp skin shopping: spend less, buy better	PERSONALIZATION	4.7	273994	12M	10000000	0	Everyone	{Personalization}	2018-07-23	2.3.27	4.4 and up
1408	My Oasis - Calming and Relaxing Idle Clicker Game	TOOLS	4.5	273283	22M	5000000	0	Everyone	{Tools}	2018-07-11	4.1.0	4.0.3 and up
1409	Map My Ride GPS Cycling Riding	SOCIAL	4.6	273244	9.9M	5000000	0	Everyone	{Social}	2018-06-24	4.1.1	4.0.3 and up
1410	RetroSelfie - Selfie Editor	HEALTH_AND_FITNESS	4.9	272337	13M	10000000	0	Everyone	{"Health & Fitness"}	2018-06-21	1.0.2	4.2 and up
1411	Motocross Beach Jumping 3D	FAMILY	4.4	272321	Varies with device	10000000	0	Everyone	{Education,"Brain Games"}	2018-08-03	3.14.15	5.0 and up
1412	Tophatter - 90 Second Auctions	HEALTH_AND_FITNESS	4.9	272172	13M	10000000	0	Everyone	{"Health & Fitness"}	2018-06-21	1.0.2	4.2 and up
1413	100 Doors of Revenge	EDUCATION	4.4	272145	Varies with device	10000000	0	Everyone	{Education,"Brain Games"}	2018-08-03	3.14.15	5.0 and up
1414	Battlelands Royale	AUTO_AND_VEHICLES	4.2	271920	16M	10000000	0	Teen	{"Auto & Vehicles"}	2018-07-11	Varies with device	5.0 and up
1415	Full Screen Caller ID	TOOLS	4.2	271908	8.1M	10000000	0	Everyone	{Tools}	2018-08-02	3.3.0	4.0 and up
1416	Yahoo! transit guide free timetable, operation information, transfer search	SOCIAL	4.6	271445	9.9M	5000000	0	Everyone	{Social}	2018-06-24	4.1.1	4.0.3 and up
1417	English Grammar Test	GAME	4	271214	Varies with device	10000000	0	Teen	{Arcade}	2018-07-25	Varies with device	Varies with device
1418	TAMAGO Monsters Returns	GAME	3.8	270687	38M	10000000	0	Teen	{Racing}	2018-07-20	1.0.16	4.0.3 and up
1419	iMediaShare – Photos & Music	HEALTH_AND_FITNESS	4.2	270294	58M	5000000	0	Everyone	{"Health & Fitness"}	2018-07-31	6.15.0	4.1 and up
1420	DoorDash - Food Delivery	HEALTH_AND_FITNESS	4.2	270294	58M	5000000	0	Everyone	{"Health & Fitness"}	2018-07-31	6.15.0	4.1 and up
1421	Fast like a Fox	HEALTH_AND_FITNESS	4.2	270267	58M	5000000	0	Everyone	{"Health & Fitness"}	2018-07-31	6.15.0	4.1 and up
1422	Power Pop Bubbles	FAMILY	4.8	269194	6.9M	10000000	0	Everyone	{Entertainment,"Brain Games"}	2018-08-03	Varies with device	Varies with device
1423	DHgate-Shop Wholesale Prices	FAMILY	4.3	267787	21M	10000000	0	Everyone	{Education}	2018-07-30	20.7.2	4.4 and up
1424	Unseen - No Last Seen	FAMILY	4	267636	13M	10000000	0	Teen	{"Role Playing"}	2014-03-03	1.5	2.1 and up
1425	Fast Scanner : Free PDF Scan	GAME	4.4	267395	71M	5000000	0	Everyone 10+	{Action}	2018-07-19	1.1.7	4.4 and up
1426	Alfred Home Security Camera	PHOTOGRAPHY	4.5	267378	1.9M	10000000	0	Everyone	{Photography}	2015-07-11	1.4.6	4.0 and up
1427	Navy Gunner Shoot War 3D	GAME	4.6	267229	24M	10000000	0	Teen	{Casino}	2018-05-28	1.7.4	2.3 and up
1428	H TV	PRODUCTIVITY	4.6	267189	Varies with device	5000000	0	Everyone	{Productivity}	2018-04-29	Varies with device	Varies with device
1429	BaconReader for Reddit	PRODUCTIVITY	4.6	267042	Varies with device	5000000	0	Everyone	{Productivity}	2018-04-29	Varies with device	Varies with device
1430	Launcher	EDUCATION	4.3	266948	21M	10000000	0	Everyone	{Education}	2018-07-30	20.7.2	4.4 and up
1431	Ovia Pregnancy Tracker & Baby Countdown Calendar	EDUCATION	4.3	266948	21M	10000000	0	Everyone	{Education}	2018-07-30	20.7.2	4.4 and up
1432	Business Calendar 2	EDUCATION	4.3	266935	21M	10000000	0	Everyone	{Education}	2018-07-30	20.7.2	4.4 and up
1433	ASUS Calling Screen	PERSONALIZATION	4.3	266434	Varies with device	10000000	0	Everyone	{Personalization}	2018-08-04	Varies with device	Varies with device
1434	Yanosik: "antyradar", traffic jams, navigation, camera	PERSONALIZATION	4.3	266402	Varies with device	10000000	0	Everyone	{Personalization}	2018-08-04	Varies with device	Varies with device
1435	Dungeon Legends - PvP Action MMO RPG Co-op Games	PERSONALIZATION	4.3	266401	Varies with device	10000000	0	Everyone	{Personalization}	2018-08-04	Varies with device	Varies with device
1436	Disney Heroes: Battle Mode	GAME	4.3	264755	91M	10000000	0	Teen	{Action}	2018-07-17	2.2.1	4.0 and up
1437	WowBox	GAME	4.5	264282	48M	10000000	0	Teen	{Casino}	2018-07-12	3.10.43	4.0.3 and up
1438	Mercari: The Selling App	BOOKS_AND_REFERENCE	4.5	264260	Varies with device	10000000	0	Everyone	{"Books & Reference"}	2018-06-22	Varies with device	Varies with device
1439	BLOOD & GLORY: IMMORTALS	GAME	4	263907	62M	10000000	0	Everyone 10+	{Action}	2016-11-01	3.0.4	4.0 and up
1440	Dr. Battery - Fast Charger - Super Cleaner 2018	TRAVEL_AND_LOCAL	4.6	263525	Varies with device	10000000	0	Everyone	{"Travel & Local"}	2018-08-04	Varies with device	Varies with device
1441	Hello Stars	FAMILY	4.6	263454	74M	10000000	0	Everyone	{Puzzle}	2018-08-02	2.1.1	4.1 and up
1442	Pro 2018 - Series A and B	TOOLS	4.6	262076	1.2M	10000000	0	Everyone	{Tools}	2018-01-04	1.0.2	2.3 and up
1443	Clean My Android	GAME	4.6	260651	51M	10000000	0	Everyone	{Arcade}	2018-02-14	1.1	4.0 and up
1444	USAA Mobile	FINANCE	4.6	260547	Varies with device	5000000	0	Everyone	{Finance}	2018-07-31	Varies with device	Varies with device
1445	METEO FRANCE	GAME	4.6	260527	49M	10000000	0	Everyone	{Arcade}	2017-12-21	1	4.0 and up
1446	Five Nights at Freddy’s	WEATHER	4.4	260137	13M	10000000	0	Everyone 10+	{Weather}	2018-07-16	3.8.1	4.1 and up
1447	SHADOWGUN LEGENDS	TRAVEL_AND_LOCAL	4.5	260133	Varies with device	10000000	0	Everyone	{"Travel & Local"}	2018-07-04	Varies with device	Varies with device
1448	Workout Trainer: fitness coach	TRAVEL_AND_LOCAL	4.5	260121	Varies with device	10000000	0	Everyone	{"Travel & Local"}	2018-07-04	Varies with device	Varies with device
1449	Facejjang	VIDEO_PLAYERS	4.4	259605	3.1M	10000000	0	Everyone	{"Video Players & Editors"}	2018-08-03	1.6.1	4.0.3 and up
1450	The real aquarium - HD	PHOTOGRAPHY	4.7	259450	17M	10000000	0	Everyone	{Photography}	2018-05-24	1.0.4	4.1 and up
1451	MegaFon Dashboard	VIDEO_PLAYERS	4.8	259003	Varies with device	10000000	0	Everyone	{"Video Players & Editors"}	2018-08-03	Varies with device	4.3 and up
1452	HSPA+ Tweaker (3G booster)	LIFESTYLE	4.3	258717	9.4M	10000000	0	Everyone	{Lifestyle}	2017-09-25	1.3.1	4.0.3 and up
1453	Udemy - Online Courses	COMMUNICATION	4.3	258556	Varies with device	10000000	0	Everyone	{Communication}	2018-07-25	Varies with device	Varies with device
1454	YouCut - Video Editor & Video Maker, No Watermark	VIDEO_PLAYERS	4.8	258277	Varies with device	10000000	0	Everyone	{"Video Players & Editors"}	2018-08-03	Varies with device	4.3 and up
1455	Shutterfly: Free Prints, Photo Books, Cards, Gifts	GAME	4.4	257724	69M	10000000	0	Everyone 10+	{Sports}	2018-05-25	1.4.2	4.0.3 and up
1456	AirAsia	GAME	4.1	257531	44M	10000000	0	Everyone 10+	{Racing}	2018-01-18	7	4.1 and up
1457	TV+	FAMILY	4.2	256916	25M	10000000	0	Everyone	{Arcade,"Action & Adventure"}	2015-10-08	1.0.4	4.0 and up
1458	SuperCity: Build a Story	NEWS_AND_MAGAZINES	4.5	256680	12M	10000000	0	Everyone	{"News & Magazines"}	2018-07-24	6.7.15.7	4.0.3 and up
1459	Rolly Vortex	ENTERTAINMENT	4.3	256664	77M	10000000	0	Everyone	{Entertainment}	2018-05-04	4.1.7	4.0.3 and up
1460	Beautiful Widgets Pro	FAMILY	4.5	256219	95M	10000000	0	Everyone	{Strategy}	2018-07-31	1.64.0.21247	4.2 and up
1461	Microsoft Remote Desktop	EDUCATION	4.8	256079	7.6M	1000000	0	Teen	{Education}	2018-07-12	2.2.4	4.0.3 and up
1462	Free Dating App - YoCutie - Flirt, Chat & Meet	FAMILY	4.3	254861	52M	10000000	0	Teen	{Simulation}	2018-08-01	1.20.3	4.4 and up
1463	Dr. Chess	EDUCATION	4.7	254519	27M	5000000	0	Everyone	{Education}	2018-07-20	2.8.1	4.1 and up
1464	War Z 2	GAME	4	254518	100M	10000000	0	Mature 17+	{Action}	2018-07-09	2	4.0 and up
1465	Pocket Heroes	GAME	4.7	254258	23M	10000000	0	Everyone	{Card}	2018-08-01	2.137.0	4.1 and up
1466	Al Quran : EAlim - Translations & MP3 Offline	VIDEO_PLAYERS	4.1	253207	13M	10000000	0	Everyone	{"Video Players & Editors"}	2018-08-02	2.0.7	4.4 and up
1467	Soundtrack Attack	PRODUCTIVITY	4.7	253155	3.5M	5000000	0	Everyone	{Productivity}	2018-03-19	3.0.17	4.0 and up
1468	Z Champions	FAMILY	4.6	253115	99M	10000000	0	Everyone	{Puzzle}	2018-07-27	1.6.4	4.4 and up
1469	Square Point of Sale - POS	FAMILY	4.4	252006	26M	5000000	0	Everyone	{Simulation}	2018-03-15	1.084	2.3 and up
1470	Zara	PHOTOGRAPHY	4.3	251951	16M	10000000	0	Mature 17+	{Photography}	2018-07-11	4.7.3	4.4 and up
1471	Been Together (Ad) - D-day	PHOTOGRAPHY	4.3	251951	16M	10000000	0	Mature 17+	{Photography}	2018-07-11	4.7.3	4.4 and up
1472	Galaxy Gift	PHOTOGRAPHY	4.3	251686	31M	10000000	0	Everyone	{Photography}	2017-07-28	2.3.8.6	4.1 and up
1473	Sweet Baby Girl - Dream House and Play Time	HEALTH_AND_FITNESS	4.6	251618	93M	10000000	0	Everyone	{"Health & Fitness"}	2018-07-18	5.14.0	5.0 and up
1474	Etsy: Handmade & Vintage Goods	PERSONALIZATION	4.4	251616	13M	10000000	0	Everyone	{Personalization}	2017-11-13	1.9.7.07	4.0.3 and up
1475	Fitness & Bodybuilding	HEALTH_AND_FITNESS	4.6	251534	93M	10000000	0	Everyone	{"Health & Fitness"}	2018-07-18	5.14.0	5.0 and up
1476	WPSApp	HEALTH_AND_FITNESS	4.6	251534	93M	10000000	0	Everyone	{"Health & Fitness"}	2018-07-18	5.14.0	5.0 and up
1477	Dog Sim Online: Raise a Family	TRAVEL_AND_LOCAL	4.5	251037	26M	10000000	0	Everyone	{"Travel & Local"}	2018-08-05	13.0.16	4.1 and up
1478	Chuck E.’s Skate Universe	FINANCE	4.4	250719	37M	10000000	0	Everyone	{Finance}	2018-07-31	6.8.0.109	5.0 and up
1479	Gun Strike Shoot	FINANCE	4.4	250706	37M	10000000	0	Everyone	{Finance}	2018-07-31	6.8.0.109	5.0 and up
1480	Mini DAYZ: Zombie Survival	FAMILY	4	250257	50M	5000000	0	Everyone	{Simulation}	2016-11-16	1.1.5	2.3.3 and up
1481	Google Handwriting Input	GAME	4.2	250197	44M	5000000	0	Teen	{Action}	2018-07-12	1	4.1 and up
1482	Extreme Motorbike Jump 3D	NEWS_AND_MAGAZINES	4.5	249919	Varies with device	10000000	0	Everyone 10+	{"News & Magazines"}	2018-07-30	Varies with device	Varies with device
1483	Shopee - No. 1 Online Shopping	NEWS_AND_MAGAZINES	4.5	249919	Varies with device	10000000	0	Everyone 10+	{"News & Magazines"}	2018-07-30	Varies with device	Varies with device
1484	Wanelo Shopping	NEWS_AND_MAGAZINES	4.5	249919	Varies with device	10000000	0	Everyone 10+	{"News & Magazines"}	2018-07-30	Varies with device	Varies with device
1485	comico Popular Original Cartoon Updated Everyday Comico	HEALTH_AND_FITNESS	3.9	249855	Varies with device	10000000	0	Everyone	{"Health & Fitness"}	2018-07-24	Varies with device	Varies with device
1486	Caller ID & Call Block - DU Caller	GAME	4.2	249308	55M	10000000	0	Everyone	{Arcade}	2017-09-07	5.26	2.3 and up
1487	Glam Doll Salon - Chic Fashion	EDUCATION	4.5	248912	Varies with device	5000000	0	Everyone	{Education}	2018-07-30	Varies with device	Varies with device
1488	SW Battlefront Companion	EDUCATION	4.5	248555	Varies with device	5000000	0	Everyone	{Education,"Brain Games"}	2018-05-23	Varies with device	4.0.3 and up
1489	Call Control - Call Blocker	GAME	4.4	248417	17M	5000000	0	Teen	{Arcade}	2015-02-10	2.1.3	2.3.3 and up
1490	Pixgram- video photo slideshow	NEWS_AND_MAGAZINES	4.7	247992	22M	5000000	0	Teen	{"News & Magazines"}	2018-07-25	6.5.1725	4.1 and up
1491	Economic Times : Market News	FAMILY	4.2	246705	27M	1000000	0	Teen	{Strategy}	2018-05-04	3.5.2	4.0.3 and up
1492	My Days - Ovulation Calendar & Period Tracker ™	GAME	4.3	246538	60M	5000000	0	Teen	{Card}	2018-03-06	3.0.8	2.3 and up
1493	Ustream	BOOKS_AND_REFERENCE	4.5	246315	Varies with device	10000000	0	Everyone	{"Books & Reference"}	2015-07-17	Varies with device	1.5 and up
1494	Red Hands – 2-Player Games	LIFESTYLE	4.3	246201	Varies with device	10000000	0	Everyone	{Lifestyle}	2018-07-23	Varies with device	Varies with device
1495	Last Shelter: Survival	FAMILY	4.1	245839	76M	10000000	0	Everyone	{Casual}	2017-04-03	2.7.0	4.1 and up
1496	Poke Genie - Safe IV Calculator	GAME	4.3	245455	84M	10000000	0	Everyone 10+	{Action}	2018-05-31	2.8.6	4.0 and up
1497	FC Barcelona Official App	SHOPPING	4.5	245104	35M	5000000	0	Everyone	{Shopping}	2018-08-01	3.6.0	4.0.3 and up
1498	CBS - Full Episodes & Live TV	COMMUNICATION	4.2	244863	Varies with device	10000000	0	Everyone	{Communication}	2018-05-29	Varies with device	Varies with device
1499	Ultimate Clash Royale Tracker	COMMUNICATION	4.2	244863	Varies with device	10000000	0	Everyone	{Communication}	2018-05-29	Varies with device	Varies with device
1500	Range Master: Sniper Academy	FAMILY	4.7	244797	52M	5000000	0	Teen	{Strategy}	2018-07-30	1.24.09	4.0.3 and up
1501	Super Dancer	PRODUCTIVITY	4.2	244567	Varies with device	100000000	0	Everyone	{Productivity}	2018-08-06	Varies with device	Varies with device
1502	Train driving simulator	PHOTOGRAPHY	4.3	244371	Varies with device	10000000	0	Everyone	{Photography}	2018-07-05	Varies with device	Varies with device
1503	Read books online	PHOTOGRAPHY	4.3	244302	Varies with device	10000000	0	Everyone	{Photography}	2018-07-05	Varies with device	Varies with device
1504	Chelsea FC Official Keyboard	SHOPPING	4.2	244141	7.3M	10000000	0	Everyone	{Shopping}	2018-08-06	4.4.5	4.3 and up
1505	Yummly Recipes & Shopping List	FAMILY	4.5	244039	46M	5000000	0	Everyone 10+	{"Role Playing"}	2018-06-04	3.0.5.2	4.0 and up
1506	GetThemAll Any File Downloader	DATING	4.2	243950	21M	10000000	0	Mature 17+	{Dating}	2018-05-10	4.3.2	4.1 and up
1507	Dance School Stories - Dance Dreams Come True	ENTERTAINMENT	4.6	243747	Varies with device	10000000	0	Teen	{Entertainment}	2018-08-02	Varies with device	Varies with device
1508	CBS Sports App - Scores, News, Stats & Watch Live	ENTERTAINMENT	4.6	243747	Varies with device	10000000	0	Teen	{Entertainment}	2018-08-02	Varies with device	Varies with device
1509	ConvertPad - Unit Converter	GAME	4.4	243121	38M	5000000	0	Teen	{Arcade}	2014-10-17	5.3	2.3 and up
1510	Coursera: Online courses	FAMILY	4.1	242722	54M	10000000	0	Teen	{"Role Playing"}	2018-07-09	3.1.2b	4.0.3 and up
1511	AlReader -any text book reader	SPORTS	4.3	242096	87M	10000000	0	Everyone	{Sports}	2018-08-02	3.4.4	4.1 and up
1512	Cheating Tom 3 - Genius School	PHOTOGRAPHY	4.2	240475	9.5M	10000000	0	Everyone	{Photography}	2017-11-22	3.8	4.0 and up
1513	OpenTable: Restaurants Near Me	PHOTOGRAPHY	4.2	240475	9.5M	10000000	0	Everyone	{Photography}	2017-11-22	3.8	4.0 and up
1514	Game of Thrones: Conquest™	PHOTOGRAPHY	4.2	240475	9.5M	10000000	0	Everyone	{Photography}	2017-11-22	3.8	4.0 and up
1515	FollowMeter for Instagram	GAME	4.5	240416	53M	5000000	0	Everyone	{Word}	2018-08-01	2.2.3	4.0.3 and up
1516	Delivery yogi.	VIDEO_PLAYERS	4.4	239242	Varies with device	10000000	0	Everyone	{"Video Players & Editors"}	2017-11-19	17.6	5.0 and up
1517	Guns’n’Glory	COMICS	4.4	238970	28M	1000000	0	Teen	{Comics}	2018-07-09	3.4.3_world	5.0 and up
1518	Storm Radar: Tornado Tracker & Hurricane Alerts	VIDEO_PLAYERS	4.4	238459	35M	10000000	0	Everyone	{"Video Players & Editors"}	2018-06-06	3.1.4	4.2 and up
1519	Ringtones & Wallpapers for Me	COMMUNICATION	4.8	237468	8.8M	1000000	0	Everyone	{Communication}	2018-07-26	2018.1.715	4.0 and up
1520	Sound Meter	FAMILY	4.5	235906	13M	10000000	0	Everyone	{Entertainment,"Brain Games"}	2018-07-29	1.2.0	4.1 and up
1521	Gun Builder ELITE	ENTERTAINMENT	4.5	235496	13M	10000000	0	Everyone	{Entertainment,"Brain Games"}	2018-07-29	1.2.0	4.1 and up
1522	Strange Hero: Future Battle	FAMILY	4.1	235486	63M	10000000	0	Teen	{Entertainment}	2018-06-01	5.9.006	4.1 and up
1523	Camera ZOOM FX - FREE	LIFESTYLE	4.5	234971	81M	1000000	0	Everyone	{Lifestyle}	2018-07-25	2.8.7.78579	4.4 and up
1524	Hideman VPN	GAME	4.1	234606	59M	10000000	0	Everyone	{Action}	2018-01-29	3.1	2.3 and up
1525	Frim: get new friends on local chat rooms	GAME	4.3	234589	38M	50000000	0	Everyone	{Racing}	2016-11-22	1	2.3.3 and up
1526	K-9 Mail	GAME	4.3	234110	38M	50000000	0	Everyone	{Racing}	2016-11-22	1	2.3.3 and up
1527	STARZ	BOOKS_AND_REFERENCE	4.4	233757	Varies with device	10000000	0	Everyone	{"Books & Reference"}	2018-05-01	Varies with device	Varies with device
1528	OfficeSuite Pro + PDF (Trial)	FAMILY	4.2	233588	74M	5000000	0	Teen	{Simulation}	2017-04-21	3.8.0	4.0.3 and up
1529	Discover Mobile	NEWS_AND_MAGAZINES	4.2	233305	3.1M	10000000	0	Everyone	{"News & Magazines"}	2018-08-03	5.1.10	2.2 and up
1530	Spanish English Translator	HEALTH_AND_FITNESS	4.5	233243	Varies with device	5000000	0	Everyone	{"Health & Fitness"}	2018-07-23	Varies with device	Varies with device
1531	DraStic DS Emulator	HEALTH_AND_FITNESS	4.5	233243	Varies with device	5000000	0	Everyone	{"Health & Fitness"}	2018-07-23	Varies with device	Varies with device
1532	HBO GO: Stream with TV Package	PHOTOGRAPHY	4.7	233039	24M	10000000	0	Everyone	{Photography}	2018-07-28	1.5.3	4.4 and up
1533	U Launcher Lite – FREE Live Cool Themes, Hide Apps	SPORTS	4.4	232423	35M	5000000	0	Everyone	{Sports}	2018-06-11	4.2.2	4.0.3 and up
1534	Ada - Your Health Guide	HEALTH_AND_FITNESS	3.9	232153	Varies with device	10000000	0	Everyone	{"Health & Fitness"}	2018-08-02	Varies with device	Varies with device
1535	BBC Media Player	SOCIAL	4.3	231446	5.4M	10000000	0	Everyone	{Social}	2018-08-02	4.81	4.0 and up
1536	Yandex.Shell (Launcher+Dialer)	SOCIAL	4.3	231325	5.4M	10000000	0	Everyone	{Social}	2018-08-02	4.81	4.0 and up
1537	Remote Link (PC Remote)	GAME	4.8	230849	87M	10000000	0	Everyone	{Word}	2018-08-02	1.0.47	4.1 and up
1538	PJ Masks: Moonlight Heroes	GAME	4.8	230727	87M	10000000	0	Everyone	{Word}	2018-08-02	1.0.47	4.1 and up
1539	pixiv	GAME	4.8	230727	87M	10000000	0	Everyone	{Word}	2018-08-02	1.0.47	4.1 and up
1540	Retro Clock Widget	GAME	4.8	230710	87M	10000000	0	Everyone	{Word}	2018-08-02	1.0.47	4.1 and up
1541	Sun Rise Free Live Wallpaper	COMMUNICATION	4.3	230564	Varies with device	10000000	0	Everyone	{Communication}	2018-07-31	Varies with device	Varies with device
1542	Cal - Google Calendar + Widget	GAME	4	229329	88M	10000000	0	Mature 17+	{Action}	2017-12-04	2.14	4.1 and up
1543	Super Jabber Jump	HEALTH_AND_FITNESS	4.4	229214	Varies with device	10000000	0	Everyone	{"Health & Fitness"}	2018-07-31	Varies with device	Varies with device
1544	Flipp - Weekly Shopping	HEALTH_AND_FITNESS	4.4	229210	Varies with device	10000000	0	Everyone	{"Health & Fitness"}	2018-07-31	Varies with device	Varies with device
1545	Ebook Reader	PRODUCTIVITY	4.4	228794	Varies with device	10000000	0	Everyone	{Productivity}	2018-08-06	68.0.3440.91	Varies with device
1546	Be A Legend: Soccer	PRODUCTIVITY	4.4	228755	Varies with device	10000000	0	Everyone	{Productivity}	2018-07-19	68.0.3440.70	Varies with device
1547	Classic Calculator	SOCIAL	4.5	228737	Varies with device	10000000	0	Everyone	{Social}	2016-07-12	Varies with device	Varies with device
1548	Vimeo	FAMILY	4.4	228130	70M	5000000	0	Everyone 10+	{Strategy}	2018-07-19	3.1.4	4.1 and up
1549	CM Security Open VPN - Free, fast unlimited proxy	TOOLS	4.2	227798	Varies with device	50000000	0	Everyone	{Tools}	2018-08-06	Varies with device	Varies with device
1550	Bejeweled Stars: Free Match 3	FAMILY	4.7	227401	91M	5000000	0	Everyone	{Puzzle}	2018-07-19	1.5.0	5.0 and up
1551	Fruit Ninja Classic	COMMUNICATION	4.3	226541	Varies with device	10000000	0	Everyone	{Communication}	2018-07-25	Varies with device	Varies with device
1552	Moto Fighter 3D	PRODUCTIVITY	4.2	226456	Varies with device	10000000	0	Everyone	{Productivity}	2017-10-09	Varies with device	Varies with device
1553	Unit Converter	PRODUCTIVITY	4.2	226456	Varies with device	10000000	0	Everyone	{Productivity}	2017-10-09	Varies with device	Varies with device
1554	Khan Academy	PRODUCTIVITY	4.2	226453	Varies with device	10000000	0	Everyone	{Productivity}	2017-10-09	Varies with device	Varies with device
1555	Dr. Gomoku	PRODUCTIVITY	4.3	226295	4.2M	10000000	0	Everyone	{Productivity}	2018-06-06	4.3.19	2.3.3 and up
1556	Au Mobile: Audition Chính Hiệu	PRODUCTIVITY	4.3	226295	4.2M	10000000	0	Everyone	{Productivity}	2018-06-06	4.3.19	2.3.3 and up
1557	ADP Mobile Solutions	TOOLS	4.1	225544	8.1M	10000000	0	Everyone	{Tools}	2018-07-17	3.1.2	4.0 and up
1558	Speed Booster - Ram, Battery & Game Speed Booster	SOCIAL	4.6	225103	5.3M	5000000	0	Everyone	{Social}	2018-06-13	5.1.1	4.1 and up
1559	Army of Heroes	GAME	4.3	224514	81M	5000000	0	Teen	{Strategy}	2018-07-18	1.1.8	4.0.3 and up
1560	Fast News	ART_AND_DESIGN	4.6	224399	31M	10000000	0	Everyone	{"Art & Design"}	2018-07-30	5.5.4	4.1 and up
1561	Color Road	PHOTOGRAPHY	4.5	223941	Varies with device	10000000	0	Everyone	{Photography}	2018-08-06	Varies with device	Varies with device
1562	GO SMS PRO EMOJI PLUGIN	DATING	4.4	222888	21M	1000000	0	Mature 17+	{Dating}	2018-07-17	2.45	4.1 and up
1563	Grow Stone Online : 2d pixel RPG, MMORPG game	DATING	4.4	222888	21M	1000000	0	Mature 17+	{Dating}	2018-07-17	2.45	4.1 and up
1564	HelloTalk — Chat, Speak & Learn Foreign Languages	FAMILY	4.2	222664	98M	10000000	0	Everyone	{Puzzle}	2018-08-01	2.6.0.125	4.0.3 and up
1565	Hitman GO	FAMILY	4.4	222308	6.9M	10000000	0	Everyone	{Entertainment}	2018-07-31	3.0.2	4.4 and up
1566	ENCHANT U	PHOTOGRAPHY	4.4	221878	Varies with device	10000000	0	Everyone	{Photography}	2018-08-01	Varies with device	4.1 and up
1567	Bike Race - Bike Blast Rush	PHOTOGRAPHY	4.4	221858	Varies with device	10000000	0	Everyone	{Photography}	2018-08-01	Varies with device	4.1 and up
1568	I LOVE PASTA	SPORTS	4.8	221722	Varies with device	10000000	0	Everyone	{Sports}	2018-07-26	Varies with device	Varies with device
1569	Police Car Driver	FAMILY	4.5	221691	94M	5000000	0	Teen	{Puzzle}	2018-08-06	1.20.22	4.0.3 and up
1570	Le Monde, the continuous news	HEALTH_AND_FITNESS	4.8	220125	11M	10000000	0	Everyone	{"Health & Fitness"}	2018-07-31	1.0.14	4.0 and up
1571	Bike Unchained	TRAVEL_AND_LOCAL	4.2	219848	Varies with device	50000000	0	Everyone	{"Travel & Local"}	2018-08-02	Varies with device	Varies with device
1572	Text Free: WiFi Calling App	TRAVEL_AND_LOCAL	4.2	219848	Varies with device	50000000	0	Everyone	{"Travel & Local"}	2018-08-02	Varies with device	Varies with device
1573	Airplane Fly Hawaii	TRAVEL_AND_LOCAL	4.2	219848	Varies with device	50000000	0	Everyone	{"Travel & Local"}	2018-08-02	Varies with device	Varies with device
1574	Calls & Text by Mo+	GAME	4.5	219821	10M	1000000	0	Mature 17+	{Action}	2013-10-28	2.0.1	2.1 and up
1575	MLB At Bat	PHOTOGRAPHY	3.6	219745	Varies with device	50000000	0	Everyone	{Photography}	2016-01-25	Varies with device	Varies with device
1576	Shoot Strike War Fire	FAMILY	4.4	218881	37M	5000000	0	Everyone 10+	{"Role Playing"}	2018-03-28	0.5.10011	4.0.3 and up
1577	DisneyNOW – TV Shows & Games	BOOKS_AND_REFERENCE	4.6	218451	4.7M	10000000	0	Everyone	{"Books & Reference"}	2018-05-20	3.2.3	4.0 and up
1578	Samsung+	FAMILY	4.1	217736	87M	10000000	0	Everyone	{Casual,"Pretend Play"}	2018-08-02	1.1.64	4.1 and up
1579	Ben 10: Alien Experience	BUSINESS	4.1	217730	Varies with device	50000000	0	Everyone	{Business}	2018-04-02	Varies with device	Varies with device
1580	Smart TV Remote	BUSINESS	4.1	217730	Varies with device	50000000	0	Everyone	{Business}	2018-04-02	Varies with device	Varies with device
1581	Image 2 Wallpaper	GAME	4.5	216849	Varies with device	10000000	0	Everyone	{Action,"Action & Adventure"}	2018-07-16	Varies with device	Varies with device
1582	ES File Explorer/Manager PRO	SHOPPING	4.3	216741	Varies with device	5000000	0	Everyone	{Shopping}	2018-08-06	4.6.0	4.1 and up
1583	Surprise Eggs	GAME	4.6	216675	30M	10000000	0	Everyone	{Word}	2018-08-01	2.2.7	4.1 and up
1584	Phone Clean Best Speed Booster	SOCIAL	4.6	216513	Varies with device	5000000	0	Mature 17+	{Social}	2018-08-06	Varies with device	Varies with device
1585	PhotoLayers〜Superimpose,Eraser	TRAVEL_AND_LOCAL	4.5	216388	19M	10000000	0	Everyone	{"Travel & Local"}	2018-07-31	Varies with device	Varies with device
1586	Dots & Co: A Puzzle Adventure	TRAVEL_AND_LOCAL	4.5	216388	19M	10000000	0	Everyone	{"Travel & Local"}	2018-07-31	Varies with device	Varies with device
1587	Instachat 😜	TRAVEL_AND_LOCAL	4.5	216388	19M	10000000	0	Everyone	{"Travel & Local"}	2018-07-31	Varies with device	Varies with device
1588	Virtual Assistant DataBot: Artificial Intelligence	ART_AND_DESIGN	4.5	215644	25M	50000000	0	Teen	{"Art & Design"}	2018-06-08	Varies with device	4.2 and up
1589	Western Union US - Send Money Transfers Quickly	PHOTOGRAPHY	4.2	215343	44M	10000000	0	Everyone	{Photography}	2018-07-14	6.4.3	4.0.3 and up
1590	NASCAR MOBILE	EDUCATION	4.2	215301	Varies with device	10000000	0	Everyone	{Education}	2018-08-01	Varies with device	Varies with device
1591	myAT&T	EDUCATION	4.2	215301	Varies with device	10000000	0	Everyone	{Education}	2018-08-01	Varies with device	Varies with device
1592	Quick PDF Scanner + OCR FREE	GAME	4.2	214923	Varies with device	5000000	0	Everyone	{Trivia}	2018-07-31	9.1.3	4.1 and up
1593	Tiny Archers	GAME	4.6	214878	10M	10000000	0	Everyone	{Board}	2018-08-03	2.0.4	4.1 and up
1594	Notepad	GAME	4.5	214819	91M	5000000	0	Everyone	{Puzzle}	2018-07-30	3.6.0	4.1 and up
1595	Updates for Samsung - Android Update Versions	GAME	4.5	214777	91M	5000000	0	Everyone	{Puzzle}	2018-07-30	3.6.0	4.1 and up
1596	Lie Detector Prank	TOOLS	4.5	214265	Varies with device	10000000	0	Everyone	{Tools}	2018-06-04	Varies with device	Varies with device
1597	aCalendar - Android Phone	SHOPPING	4.3	213735	43M	10000000	0	Everyone	{Shopping}	2018-07-24	5.3.73	4.4 and up
1598	Bedouin Rivals	SHOPPING	4.3	213735	43M	10000000	0	Everyone	{Shopping}	2018-07-24	5.3.73	4.4 and up
1599	AR effect	GAME	4.3	213340	24M	10000000	0	Everyone	{Adventure}	2018-06-14	1.2.1.49	4.0 and up
1600	Fun Kid Racing	DATING	4.5	212626	11M	10000000	0	Mature 17+	{Dating}	2018-07-31	4.17.2	4.1 and up
1601	SPARK - Live random video chat & meet new people	DATING	4.5	212626	11M	10000000	0	Mature 17+	{Dating}	2018-07-31	4.17.2	4.1 and up
1602	Leghe Fantagazzetta	GAME	4.4	212524	93M	5000000	0	Everyone	{"Role Playing"}	2018-07-24	3.0.0	4.0.3 and up
1603	Kohl’s: Scan, Shop, Pay & Save	GAME	4.2	212067	48M	10000000	0	Everyone	{Racing}	2015-07-15	1.5.2	2.3.3 and up
1604	Download Manager	EDUCATION	4.6	211856	Varies with device	10000000	0	Everyone	{Education}	2018-08-01	Varies with device	Varies with device
1605	Meetup	EDUCATION	4.6	211856	Varies with device	10000000	0	Everyone	{Education}	2018-08-01	Varies with device	Varies with device
1606	Pregnancy Week By Week	EDUCATION	4.6	211856	Varies with device	10000000	0	Everyone	{Education}	2018-08-01	Varies with device	Varies with device
1607	Google Analytics	EDUCATION	4.6	211856	Varies with device	10000000	0	Everyone	{Education}	2018-08-01	Varies with device	Varies with device
1608	Bitdefender Antivirus Free	PHOTOGRAPHY	4.1	211620	20M	10000000	0	Everyone	{Photography}	2018-03-29	7.4	4.0 and up
1609	NBC Sports	TOOLS	4.4	211308	Varies with device	10000000	0	Everyone	{Tools}	2018-08-02	Varies with device	4.1 and up
1610	MSN Money- Stock Quotes & News	BOOKS_AND_REFERENCE	4.2	210534	22M	10000000	0	Everyone	{"Books & Reference"}	2018-06-13	3.0.58	4.0 and up
1611	Citi Mobile®	GAME	4.2	210317	46M	10000000	0	Everyone 10+	{Adventure}	2015-04-10	1.4.3.104	2.3.3 and up
1612	Homestyler Interior Design & Decorating Ideas	SHOPPING	4.4	210208	Varies with device	10000000	0	Everyone	{Shopping}	2018-08-01	Varies with device	Varies with device
1613	Skype for Business for Android	SHOPPING	4.4	210208	Varies with device	10000000	0	Everyone	{Shopping}	2018-08-01	Varies with device	Varies with device
1614	HuffPost - News	SHOPPING	4.4	210208	Varies with device	10000000	0	Everyone	{Shopping}	2018-08-01	Varies with device	Varies with device
1615	Galaxy Defense	PRODUCTIVITY	4.6	209696	49M	5000000	0	Everyone	{Productivity}	2018-06-18	3.2.258b ae1da5165	4.3 and up
1616	High-Speed Camera (GIF,Burst)	PRODUCTIVITY	4.5	208543	Varies with device	10000000	0	Everyone	{Productivity}	2018-07-05	Varies with device	Varies with device
1617	Running Distance Tracker +	GAME	4.4	208501	56M	1000000	0	Teen	{Adventure}	2018-07-23	2.8.307	4.0.3 and up
1618	Tiger Live Wallpaper	FINANCE	4.2	208463	Varies with device	10000000	0	Everyone	{Finance}	2018-07-26	Varies with device	Varies with device
1619	Chest Tracker for Clash Royale	SOCIAL	4.1	207712	Varies with device	10000000	0	Everyone	{Social}	2018-06-09	4.18.962.5	2.3 and up
1620	ES Themes -- Classic Theme	TOOLS	4.4	207706	4.3M	10000000	0	Everyone	{Tools}	2017-07-10	2.4	3.0 and up
1621	XE Currency	MAPS_AND_NAVIGATION	4.2	207440	6.4M	10000000	0	Everyone	{"Maps & Navigation"}	2018-07-23	7.0.3	4.0 and up
1622	Headspace: Meditation & Mindfulness	BUSINESS	4.5	207372	11M	5000000	0	Everyone	{Business}	2018-08-02	12.2.4	4.0 and up
1623	Mobi Calculator free & AD free!	FAMILY	4.3	207294	21M	10000000	0	Everyone 10+	{Education}	2018-08-01	13.9.0.161	5.0 and up
1624	Feed Baby - Baby Tracker	GAME	4.4	206602	13M	5000000	0	Mature 17+	{Action}	2013-07-01	3.1.0	2.1 and up
1625	KakaoMap - Map / Navigation	EDUCATION	4.3	206532	21M	10000000	0	Everyone 10+	{Education}	2018-08-01	13.9.0.161	5.0 and up
1626	AP Mobile - Breaking News	EDUCATION	4.3	206532	21M	10000000	0	Everyone 10+	{Education}	2018-08-01	13.9.0.161	5.0 and up
1627	Match™ Dating - Meet Singles	EDUCATION	4.3	206527	21M	10000000	0	Everyone 10+	{Education}	2018-08-01	13.9.0.161	5.0 and up
1628	Guess The Emoji	FAMILY	4.5	205914	54M	10000000	0	Everyone	{Education}	2018-08-03	5.54	4.1 and up
1629	OK K.O.! Lakewood Plaza Turbo	GAME	4.3	205830	63M	10000000	0	Everyone	{Board}	2018-06-20	4.4.9	4.1 and up
1630	Account Manager	SOCIAL	4.1	205803	Varies with device	5000000	0	Teen	{Social}	2018-07-18	Varies with device	Varies with device
1631	Weather Live	COMMUNICATION	4.5	205739	17M	5000000	0	Everyone	{Communication}	2018-07-26	4.5.4	4.1 and up
1632	Lite for Facebook Messenger	HEALTH_AND_FITNESS	4.6	205299	31M	5000000	0	Everyone	{"Health & Fitness"}	2018-07-16	3.48	4.1 and up
1633	A Better Camera	HEALTH_AND_FITNESS	4.6	205299	31M	5000000	0	Everyone	{"Health & Fitness"}	2018-07-16	3.48	4.1 and up
1634	Jodel - The Hyperlocal App	PRODUCTIVITY	4.4	205191	7.1M	10000000	0	Everyone	{Productivity}	2018-06-20	2.4.5	4.1 and up
1635	MARCA - Sports Leader Diary	BOOKS_AND_REFERENCE	4.5	203130	Varies with device	10000000	0	Everyone	{"Books & Reference"}	2018-06-28	Varies with device	Varies with device
1636	MARCA - Diario Líder Deportivo	FAMILY	4.4	203101	Varies with device	5000000	0	Everyone	{Casual}	2018-05-31	Varies with device	4.1 and up
1637	EBookDroid - PDF & DJVU Reader	PERSONALIZATION	4.7	202474	3.0M	10000000	0	Teen	{Personalization}	2017-08-09	2.6.0	4.0 and up
1638	Left vs Right: Brain Training	NEWS_AND_MAGAZINES	4.2	201737	Varies with device	10000000	0	Everyone 10+	{"News & Magazines"}	2018-07-03	Varies with device	Varies with device
1639	Seven - 7 Minute Workout Training Challenge	NEWS_AND_MAGAZINES	4.2	201737	Varies with device	10000000	0	Everyone 10+	{"News & Magazines"}	2018-07-03	Varies with device	Varies with device
1640	Univision Deportes: Liga MX, MLS, Fútbol En Vivo	PRODUCTIVITY	4.3	201718	35M	10000000	0	Everyone	{Productivity}	2018-07-11	4.6.15	4.1 and up
1641	Univision Deportes: Liga MX, MLS, Fútbol Live	FAMILY	4.4	201631	96M	5000000	0	Everyone	{Puzzle}	2018-06-01	4.4.4	4.1 and up
1642	ZERO Lock Screen	GAME	4.4	201537	68M	5000000	0	Teen	{Casino}	2018-08-01	2.1.7	4.0.3 and up
1643	CY Security Antivirus Cleaner	GAME	4.4	201426	80M	5000000	0	Teen	{Action}	2018-08-02	1.0.6	4.0 and up
1644	Learn English with Aco	FAMILY	4.2	200450	25M	10000000	0	Everyone	{Casual,"Pretend Play"}	2018-07-26	1.39	4.1 and up
1645	AE 3D MOTOR :Racing Games Free	FAMILY	4.1	200214	18M	10000000	0	Everyone	{Education}	2018-08-06	9.12.6	4.0.3 and up
1646	Gangster Town	EDUCATION	4.1	200058	18M	10000000	0	Everyone	{Education}	2018-07-20	9.12.5	4.0.3 and up
1647	Google Korean Input	FAMILY	4	199808	57M	10000000	0	Everyone	{Puzzle}	2018-06-14	3.0.10	3.0 and up
1648	Tunnel Town	SPORTS	4.4	199739	66M	10000000	0	Everyone	{Sports}	2018-08-06	1.18.8	4.0.3 and up
1649	Fruits Bomb	FINANCE	4.4	199684	18M	5000000	0	Everyone	{Finance}	2018-07-19	Varies with device	Varies with device
1650	ActionDirector Video Editor - Edit Videos Fast	FAMILY	4.7	198480	82M	5000000	0	Everyone	{Simulation}	2018-08-03	20	4.1 and up
1651	Your Freedom VPN Client	PRODUCTIVITY	4.3	198051	Varies with device	10000000	0	Everyone	{Productivity}	2018-07-30	Varies with device	Varies with device
1652	Photo Frame	GAME	4.5	197979	Varies with device	1000000	0	Teen	{Card}	2018-08-07	Varies with device	Varies with device
1653	issuu - Read Magazines, Catalogs, Newspapers.	ENTERTAINMENT	3.7	197774	44M	10000000	0	Mature 17+	{Entertainment}	2018-06-25	6.6.1	4.4 and up
1654	104 Looking for a job - looking for a job, looking for a job, looking for a part-time job, health checkup, resume, treatment room	ENTERTAINMENT	3.7	197774	44M	10000000	0	Mature 17+	{Entertainment}	2018-06-25	6.6.1	4.4 and up
1655	Keeper: Free Password Manager & Secure Vault	GAME	4.5	197540	29M	10000000	0	Everyone	{Puzzle}	2018-07-16	79	4.1 and up
1656	Five Nights at Freddy’s 2	PHOTOGRAPHY	4.2	197295	24M	10000000	0	Everyone	{Photography}	2017-06-23	4.0.7	4.0 and up
1657	DU Flashlight - Brightest LED & Flashlight Free	AUTO_AND_VEHICLES	4.9	197136	38M	1000000	0	Everyone	{"Auto & Vehicles"}	2018-07-15	8.31	4.1 and up
1658	Dashlane Free Password Manager	GAME	4.2	195558	86M	10000000	0	Everyone	{Arcade}	2018-07-26	1.2	5.0 and up
1659	Chapters: Interactive Stories	GAME	4.3	194969	30M	10000000	0	Everyone 10+	{Action}	2018-01-29	1.4.0	4.1 and up
1660	Learn C++	ART_AND_DESIGN	4.3	194216	39M	5000000	0	Everyone	{"Art & Design"}	2018-08-03	2.2.5	4.0.3 and up
1661	Angry Shark 2016	VIDEO_PLAYERS	4.2	193381	17M	50000000	0	Teen	{"Video Players & Editors"}	2018-08-03	1.78	4.0.3 and up
1662	FollowMyHealth®	TRAVEL_AND_LOCAL	4.7	193364	33M	5000000	0	Everyone	{"Travel & Local"}	2018-06-07	17.4.1	4.0.3 and up
1663	Receipt Hog - Receipts to Cash	COMMUNICATION	4.3	192948	6.6M	10000000	0	Everyone	{Communication}	2018-06-19	24.6.6	4.0.3 - 7.1.1
1664	Police Car Driving Sim	PHOTOGRAPHY	4.5	192851	Varies with device	10000000	0	Everyone	{Photography}	2017-09-12	Varies with device	Varies with device
1665	Trello	VIDEO_PLAYERS	4.2	192677	17M	50000000	0	Teen	{"Video Players & Editors"}	2018-08-03	1.78	4.0.3 and up
1666	Resume Builder Free, 5 Minute CV Maker & Templates	TOOLS	4.4	192661	8.5M	10000000	0	Everyone	{Tools}	2018-07-07	2.4.1	4.1 and up
1667	Anatomy Learning - 3D Atlas	TRAVEL_AND_LOCAL	4.7	192641	33M	5000000	0	Everyone	{"Travel & Local"}	2018-06-07	17.4.1	4.0.3 and up
1668	To Do Reminder with Alarm	GAME	4.3	192374	56M	10000000	0	Everyone	{Racing}	2018-01-09	Varies with device	5.0 and up
1669	PHONE for Google Voice & GTalk	TOOLS	4.3	191621	6.1M	10000000	0	Everyone	{Tools}	2018-05-29	1.43	4.0 and up
1670	Sweet Camera	COMMUNICATION	4.6	191032	26M	5000000	0	Everyone	{Communication}	2018-08-04	7.2.29	4.0.3 and up
1671	DS get	NEWS_AND_MAGAZINES	4.1	190888	11M	10000000	0	Teen	{"News & Magazines"}	2018-07-13	5.2.5	4.1 and up
1672	Free Z Glass GO Keyboard Theme	COMMUNICATION	4.2	190613	11M	10000000	0	Everyone	{Communication}	2018-07-31	5.85.1	4.0.3 and up
1673	CM Transfer - Share any files with friends nearby	GAME	4.6	190274	46M	5000000	0	Everyone	{Arcade}	2018-07-09	Varies with device	4.1 and up
1674	Diamond Zipper Lock Screen	HEALTH_AND_FITNESS	4.5	190247	Varies with device	5000000	0	Everyone	{"Health & Fitness"}	2018-08-03	Varies with device	Varies with device
1675	Fields of Battle	FAMILY	4.6	190086	94M	1000000	2.99	Everyone	{Strategy}	2018-07-13	3.16	2.3.3 and up
1676	Boyaa Poker (En) – Social Texas Hold’em	GAME	4.5	189773	95M	5000000	0	Teen	{"Role Playing"}	2018-07-18	1.1.1	4.1 and up
1677	MediaFire	WEATHER	4.2	189313	38M	10000000	0	Everyone	{Weather}	2018-08-06	Varies with device	Varies with device
1678	Trulia Rent Apartments & Homes	WEATHER	4.2	189310	38M	10000000	0	Everyone	{Weather}	2018-08-06	Varies with device	Varies with device
1679	English to Hindi Dictionary	BUSINESS	4.6	188841	3.2M	5000000	0	Everyone	{Business}	2018-06-21	1.1.13	4.0 and up
1680	I’m Expecting - Pregnancy App	SPORTS	3.9	188834	Varies with device	10000000	0	Everyone	{Sports}	2018-07-24	Varies with device	Varies with device
1681	Google My Business	FAMILY	4.7	188740	69M	1000000	1.99	Everyone	{Puzzle,"Brain Games"}	2018-07-05	1.16.0	4.2 and up
1682	Power Spheres by BoBoiBoy	GAME	4.2	187972	99M	5000000	0	Teen	{"Role Playing"}	2018-07-11	1.05.20	4.4 and up
1683	EZ PZ RPG	FAMILY	4.4	187892	40M	5000000	0	Everyone	{Simulation}	2018-05-10	1.2.0	4.0 and up
1684	Beauty and the Beast	GAME	4.3	187200	28M	10000000	0	Teen	{Card}	2018-07-31	18.4.0	4.1 and up
1685	U.S. Bank	AUTO_AND_VEHICLES	4.4	186648	42M	10000000	0	Everyone	{"Auto & Vehicles"}	2018-08-02	9.3.52	4.2 and up
1686	Daily Yoga - Yoga Fitness Plans	SHOPPING	4.4	186116	34M	5000000	0	Everyone	{Shopping}	2018-08-03	11.6.0	4.4 and up
1687	Bubble Bird Rescue	NEWS_AND_MAGAZINES	4.4	185884	7.5M	1000000	0	Mature 17+	{"News & Magazines"}	2017-09-17	3.1.9	4.1 and up
1688	Hero Hunters	PRODUCTIVITY	4.3	185632	Varies with device	50000000	0	Everyone	{Productivity}	2018-07-18	Varies with device	4.4 and up
1689	Telegram X	GAME	4.5	185382	99M	10000000	0	Everyone	{Action}	2018-07-30	1.0.6	4.4 and up
1690	Subway Terminator: Smarter Subway	NEWS_AND_MAGAZINES	4.1	185058	6.7M	10000000	0	Teen	{"News & Magazines"}	2018-08-01	3.1.6.9	4.1 and up
1691	Technutri - calorie counter, diet and carb tracker	GAME	4.5	184210	99M	10000000	0	Everyone	{Action}	2018-07-30	1.0.6	4.4 and up
1692	I Can’t Wake Up! Alarm Clock	GAME	4.5	183846	99M	10000000	0	Everyone	{Action}	2018-07-30	1.0.6	4.4 and up
1693	Heroes of Dragon Age	HEALTH_AND_FITNESS	4.5	183669	57M	5000000	0	Everyone	{"Health & Fitness"}	2018-07-27	18.7.1	5.0 and up
1694	Snes9x EX+	HEALTH_AND_FITNESS	4.5	183669	57M	5000000	0	Everyone	{"Health & Fitness"}	2018-07-27	18.7.1	5.0 and up
1695	Marked by King Bs	HEALTH_AND_FITNESS	4.5	183662	57M	5000000	0	Everyone	{"Health & Fitness"}	2018-07-27	18.7.1	5.0 and up
1696	The Cube	COMMUNICATION	4.6	183374	44M	1000000	0	Everyone	{Communication}	2018-08-01	1.9.4.74	4.1 and up
1697	Muzy - Share photos & collages	GAME	4.7	183343	20M	5000000	0	Teen	{Casino}	2018-05-28	1.5.1	2.3 and up
1698	OMG Gross Zit - Date Nightmare	SPORTS	4.3	183004	100M	10000000	0	Everyone	{Sports}	2018-07-19	2.29.3118	4.0.3 and up
1699	Branch	DATING	4.5	182986	77M	5000000	0	Mature 17+	{Dating}	2018-08-02	5.0.8	4.1 and up
1700	Dungeon Keeper	DATING	4.5	182986	77M	5000000	0	Mature 17+	{Dating}	2018-08-02	5.0.8	4.1 and up
1701	Google Classroom	FAMILY	4.1	182363	62M	10000000	0	Everyone	{Simulation}	2018-07-27	2.1.8	4.1 and up
1702	Wallpaper	FAMILY	4.1	182173	Varies with device	10000000	0	Everyone	{Entertainment,"Music & Video"}	2018-07-30	Varies with device	Varies with device
1703	Galactic Core Free Wallpaper	ENTERTAINMENT	4.1	182103	Varies with device	10000000	0	Everyone	{Entertainment,"Music & Video"}	2018-07-30	Varies with device	Varies with device
1704	Lose It! - Calorie Counter	FAMILY	4.1	182103	6.9M	5000000	0	Teen	{Entertainment}	2018-07-31	5.0.12	3.0 and up
1705	Abs Workout - Burn Belly Fat with No Equipment	SHOPPING	4.5	181990	Varies with device	10000000	0	Everyone	{Shopping}	2018-04-27	Varies with device	Varies with device
1706	justWink Greeting Cards	SHOPPING	4.5	181990	Varies with device	10000000	0	Everyone	{Shopping}	2018-04-27	Varies with device	Varies with device
1707	Pregnancy Calculator and Tracker app	SHOPPING	4.5	181990	Varies with device	10000000	0	Everyone	{Shopping}	2018-04-27	Varies with device	Varies with device
1708	Q	SHOPPING	4.5	181983	Varies with device	10000000	0	Everyone	{Shopping}	2018-04-27	Varies with device	Varies with device
1709	Dino T-Rex	FAMILY	4.6	181961	18M	10000000	0	Everyone 10+	{Education}	2018-07-27	3.2.5	4.1 and up
1710	Downtown Mafia: Gang Wars (Mobster Game) Free	EDUCATION	4.6	181893	18M	10000000	0	Everyone 10+	{Education}	2018-07-27	3.2.5	4.1 and up
1711	NHL	EDUCATION	4.6	181893	18M	10000000	0	Everyone 10+	{Education}	2018-07-27	3.2.5	4.1 and up
1712	Real DJ Simulator	EDUCATION	4.6	181893	18M	10000000	0	Everyone 10+	{Education}	2018-07-27	3.2.5	4.1 and up
1713	RISK: Global Domination	SHOPPING	4.7	181823	22M	10000000	0	Everyone	{Shopping}	2018-07-30	4.4.9	4.4 and up
1714	Target - now with Cartwheel	SHOPPING	4.7	181798	22M	10000000	0	Everyone	{Shopping}	2018-07-30	4.4.9	4.4 and up
1715	FunForMobile Ringtones & Chat	PERSONALIZATION	4.3	181399	Varies with device	10000000	0	Everyone	{Personalization}	2017-12-08	Varies with device	Varies with device
1716	Screen Lock	SPORTS	4.5	180938	29M	10000000	0	Everyone	{Sports}	2018-07-24	6.4.8	4.0.3 and up
1717	Barbie™ Fashion Closet	PHOTOGRAPHY	4.5	180697	6.1M	10000000	0	Everyone	{Photography}	2017-04-25	2.2.5	2.1 and up
1718	Dunkin’ Donuts	LIFESTYLE	4.3	179139	9.7M	5000000	0	Everyone	{Lifestyle}	2017-11-01	3.5.3	4.0.3 and up
1719	Stats Royale for Clash Royale	WEATHER	4.5	178934	Varies with device	10000000	0	Everyone	{Weather}	2018-08-04	Varies with device	Varies with device
1720	League of Gamers - Be an E-Sports Legend!	GAME	3.9	178723	65M	10000000	0	Everyone	{Racing}	2016-12-25	4.1	2.3.3 and up
1721	Photo Editor-	SHOPPING	4.5	178497	9.1M	10000000	0	Everyone	{Shopping}	2018-08-02	4.33.0	4.0.3 and up
1722	Messenger	COMMUNICATION	4.4	177703	13M	10000000	0	Mature 17+	{Communication}	2018-07-25	8.1.2-6310	5.0 and up
1723	Weather by eltiempo.es	GAME	4.2	177542	40M	10000000	0	Everyone	{Arcade}	2016-05-02	1.0.7	2.3 and up
1724	DU Launcher - Boost Your Phone	COMMUNICATION	4.2	177263	13M	10000000	0	Mature 17+	{Communication}	2018-07-13	5.1.2-6310	5.0 and up
1725	U LIVE – Video Chat & Stream	PRODUCTIVITY	4.5	176873	4.5M	1000000	0	Everyone	{Productivity}	2017-10-30	17.7.20	4.1 and up
1726	LOL Pics (Funny Pictures)	SPORTS	4	176487	10M	5000000	0	Everyone	{Sports}	2017-11-21	5.3.0	4.4 and up
1727	Solid Explorer File Manager	SPORTS	4	176450	10M	5000000	0	Everyone	{Sports}	2017-11-21	5.3.0	4.4 and up
1728	EXO-L	SPORTS	4	176448	10M	5000000	0	Everyone	{Sports}	2017-11-21	5.3.0	4.4 and up
1729	Brilliant Quotes: Life, Love, Family & Motivation	SPORTS	4	176448	10M	5000000	0	Everyone	{Sports}	2017-11-21	5.3.0	4.4 and up
1730	Nike	SOCIAL	4.3	175722	Varies with device	10000000	0	Mature 17+	{Social}	2018-07-23	Varies with device	Varies with device
1731	Aviary Effects: Classic	FAMILY	4.1	175625	16M	10000000	0	Everyone	{Racing,"Action & Adventure"}	2017-11-22	1.4	4.1 and up
1732	My Space - Employment Center	ENTERTAINMENT	4	175528	Varies with device	10000000	0	Everyone	{Entertainment}	2018-08-03	Varies with device	Varies with device
1733	Podcast Republic - Podcast Player & Radio Player	SOCIAL	4.3	175523	Varies with device	10000000	0	Mature 17+	{Social}	2018-07-23	Varies with device	Varies with device
1734	Speed Racing Ultimate 2	FAMILY	4.4	175509	Varies with device	10000000	0	Everyone	{Entertainment}	2018-08-07	Varies with device	Varies with device
1735	StrongLifts 5x5 Workout Gym Log & Personal Trainer	HOUSE_AND_HOME	4.5	175293	Varies with device	10000000	0	Everyone	{"House & Home"}	2018-07-24	Varies with device	Varies with device
1784	Geocaching®	VIDEO_PLAYERS	3.8	165723	1.6M	10000000	0	Everyone	{"Video Players & Editors"}	2018-08-04	7.5.9	4.0 and up
1736	Go-Go-Goat! Free Game	HOUSE_AND_HOME	4.5	175293	Varies with device	10000000	0	Everyone	{"House & Home"}	2018-07-24	Varies with device	Varies with device
1737	Glowing Flowers Live Wallpaper	NEWS_AND_MAGAZINES	4.7	175110	25M	10000000	0	Mature 17+	{"News & Magazines"}	2018-08-06	6.7.3	4.0 and up
1738	Monster High™	NEWS_AND_MAGAZINES	4.7	174827	25M	10000000	0	Mature 17+	{"News & Magazines"}	2018-08-04	6.7.3	4.0 and up
1739	Contacts	GAME	4.3	174755	98M	10000000	0	Everyone 10+	{Arcade}	2018-07-11	1.1.1	5.0 and up
1740	AcDisplay	ART_AND_DESIGN	4.7	174531	24M	10000000	0	Everyone	{"Art & Design"}	2018-07-31	1.6.1	4.1 and up
1741	Water Garden Live Wallpaper	FAMILY	3.9	174423	7.9M	10000000	0	Everyone	{Entertainment}	2018-08-02	2.28	4.0 and up
1742	Podcast App: Free & Offline Podcasts by Player FM	FAMILY	4.5	174215	93M	10000000	0	Everyone	{Simulation}	2018-08-03	2.5.2	4.1 and up
1743	Earth & Moon in HD Gyro 3D Parallax Live Wallpaper	FAMILY	4	174127	48M	5000000	0	Teen	{Simulation}	2016-10-03	1.3	3.0 and up
1744	Millionaire Quiz Free: Be Rich	FAMILY	4.7	173394	8.5M	5000000	0	Everyone	{Education}	2018-03-13	2.9.1	4.0 and up
1745	tinyCam Monitor FREE	TOOLS	4.1	172990	525k	10000000	0	Everyone	{Tools}	2017-12-02	1.17.4	2.2 and up
1746	Real Estate sale & rent Trovit	EDUCATION	4.6	172640	14M	5000000	0	Everyone	{Education}	2018-05-02	2.6.2	4.1 and up
1747	Fuelio: Gas log & costs	EDUCATION	4.5	172508	76M	5000000	0	Everyone	{Education,Education}	2018-06-27	5.2.1	5.0 and up
1748	Adobe Illustrator Draw	EDUCATION	4.5	172508	76M	5000000	0	Everyone	{Education,Education}	2018-06-27	5.2.1	5.0 and up
1749	Smart Keyboard Trial	EDUCATION	4.5	172508	76M	5000000	0	Everyone	{Education,Education}	2018-06-27	5.2.1	5.0 and up
1750	Blitzer.de	EDUCATION	4.5	172505	76M	5000000	0	Everyone	{Education,Education}	2018-06-27	5.2.1	5.0 and up
1751	Citymapper - Transit Navigation	DATING	4.4	172460	3.1M	5000000	0	Mature 17+	{Dating}	2018-08-04	1.639	4.0 and up
1752	Gangster Town: Vice District	SPORTS	3.5	172373	47M	10000000	0	Everyone	{Sports}	2018-07-12	1.3	4.3 and up
1753	Galaxy at War Online	GAME	3.9	172281	50M	5000000	0	Everyone	{Word}	2018-08-01	5.27.0.729	4.1 and up
1754	BZWBK24 mobile	TRAVEL_AND_LOCAL	4.3	171889	Varies with device	10000000	0	Everyone	{"Travel & Local"}	2018-07-18	7.8.0	Varies with device
1755	Offroad Car G	BUSINESS	4.3	171771	3.2M	10000000	0	Everyone	{Business}	2018-01-15	2.0.6.4	2.1 and up
1756	Soldiers of Glory: Modern War	SHOPPING	4.2	171584	12M	10000000	0	Everyone	{Shopping}	2018-07-26	4.9.5	4.2 and up
1757	Cookpad - FREE recipe search makes fun cooking · musical making!	GAME	4.7	171448	13M	10000000	0	Teen	{Puzzle}	2018-08-03	1.0.109	4.0 and up
1758	CityMaps2Go Plan Trips Travel Guide Offline Maps	FAMILY	4.3	171220	42M	5000000	0	Everyone 10+	{"Role Playing"}	2015-07-28	1.2.6	2.3.3 and up
1759	Ancestry	COMMUNICATION	4.2	171052	Varies with device	10000000	0	Everyone	{Communication}	2018-08-03	Varies with device	Varies with device
1760	SeriesGuide – Show & Movie Manager	COMMUNICATION	4.2	171031	Varies with device	10000000	0	Everyone	{Communication}	2018-08-03	Varies with device	Varies with device
1761	Live Camera Viewer ★ World Webcam & IP Cam Streams	COMMUNICATION	4.2	171031	Varies with device	10000000	0	Everyone	{Communication}	2018-08-03	Varies with device	Varies with device
1762	ChatVideo Meet new people	FAMILY	4.6	171017	13M	10000000	0	Teen	{Entertainment}	2018-07-22	2.2.2	4.4 and up
1763	Horror Hospital	SPORTS	4	170973	43M	5000000	0	Everyone	{Sports}	2018-06-06	2.1	4.1 and up
1764	Sahadan Live Scores	VIDEO_PLAYERS	4.4	169965	14M	10000000	0	Teen	{"Video Players & Editors"}	2018-08-02	1.32.1	4.3 and up
1765	GPS Traffic Speedcam Route Planner by ViaMichelin	GAME	4.6	169661	40M	10000000	0	Everyone	{Arcade}	2018-08-01	1.246	4.1 and up
1766	Premier League - Official App	FAMILY	4.3	169609	34M	10000000	0	Everyone	{Arcade,"Action & Adventure"}	2018-06-13	3.6.1	4.1 and up
1767	Soccer Manager 2018	FAMILY	4.3	169609	34M	10000000	0	Everyone	{Arcade,"Action & Adventure"}	2018-06-13	3.6.1	4.1 and up
1768	Eventbrite - Discover popular events & nearby fun	TOOLS	3.8	169369	Varies with device	10000000	0	Everyone	{Tools}	2016-09-05	Varies with device	Varies with device
1769	Lesbian Chat & Dating - SPICY	GAME	4.5	168717	56M	10000000	0	Mature 17+	{Strategy}	2018-08-03	1.3.205	2.3 and up
1770	Wifi Inspector	TOOLS	4.6	168487	6.4M	10000000	0	Everyone	{Tools}	2018-06-26	4.01.00	4.3 and up
1771	Wave Z Live Wallpaper	FAMILY	4.6	167974	5.0M	500000	0	Everyone	{Entertainment}	2018-07-27	Gratis	4.0.3 and up
1772	Cops N Robbers 2	PHOTOGRAPHY	3.8	167652	12M	10000000	0	Everyone	{Photography}	2018-04-23	4.5	4.1 and up
1773	Fantasy Football Manager (FPL)	PRODUCTIVITY	4.7	167406	18M	1000000	0	Everyone	{Productivity}	2018-07-23	3.1.1281	4.0.3 and up
1774	NYTimes - Latest News	COMMUNICATION	3.9	167229	9.7M	10000000	0	Everyone	{Communication}	2018-03-31	8.1	4.1 and up
1775	Dog Licks Screen Wallpaper	FINANCE	4.7	167168	20M	1000000	0	Everyone	{Finance}	2018-07-04	3.115.27	4.1 and up
1776	Chrome Dev	FAMILY	4.5	166886	21M	10000000	0	Everyone 10+	{Education}	2018-07-29	3.6.2	4.0.3 and up
1777	X-Plane 10 Flight Simulator	TOOLS	4.4	166367	1.8M	5000000	0	Everyone	{Tools}	2018-05-25	1.4.0	2.3 and up
1778	My Little Pony Celebration	TOOLS	4.4	166363	1.8M	5000000	0	Everyone	{Tools}	2018-05-25	1.4.0	2.3 and up
1779	Word Search Games in english	FAMILY	4.3	166312	91M	5000000	0	Teen	{"Role Playing"}	2018-07-31	1.4.0	4.4 and up
1780	Faketalk - Chatbot	GAME	4.1	166251	19M	5000000	0	Everyone	{Card}	2017-12-11	2.16.0	4.0.3 and up
1781	NBC News	GAME	4	166033	23M	10000000	0	Everyone 10+	{Arcade}	2018-01-31	3.6	2.3 and up
1782	Sync for reddit	GAME	4.3	165928	91M	5000000	0	Teen	{"Role Playing"}	2018-07-31	1.4.0	4.4 and up
1783	Carnivores: Dinosaur Hunter	GAME	4.3	165888	91M	5000000	0	Teen	{"Role Playing"}	2018-07-31	1.4.0	4.4 and up
1785	Voxel - 3D Color by Number & Pixel Coloring Book	GAME	4.4	165656	38M	5000000	0	Teen	{Arcade}	2018-02-07	1.1.0	2.3 and up
1786	AOL - News, Mail & Video	TRAVEL_AND_LOCAL	4.3	165299	5.4M	10000000	0	Everyone	{"Travel & Local"}	2018-07-30	8	4.1 and up
1787	Blur Image Background Editor (Blur Photo Editor)	PHOTOGRAPHY	4.2	165224	15M	10000000	0	Everyone	{Photography}	2016-07-08	2.1.0	4.0.3 and up
1788	Baby Sleep: White noise lullabies for newborns	TOOLS	3.5	163997	16M	10000000	0	Everyone	{Tools}	2018-08-05	5.36	4.2 and up
1789	DashClock Widget	SOCIAL	4	163679	Varies with device	5000000	0	Mature 17+	{Social}	2018-08-01	Varies with device	Varies with device
1790	Z War-Zombie Modern Combat	SPORTS	4.6	162933	100M	5000000	0	Everyone	{Sports}	2018-05-11	25.7	4.1 and up
1791	Google Primer	PRODUCTIVITY	4.4	162831	43M	5000000	0	Everyone	{Productivity}	2018-08-01	8.1.01	4.1 and up
1792	3D Blue Glass Water Keyboard Theme	SHOPPING	4.3	162655	8.1M	10000000	0	Teen	{Shopping}	2018-07-10	4.7.1	4.4 and up
1793	PhotoScan by Google Photos	PHOTOGRAPHY	4.2	162564	11M	10000000	0	Everyone	{Photography}	2018-08-05	5.2	4.0 and up
1794	Allrecipes Dinner Spinner	GAME	4	162530	97M	10000000	0	Mature 17+	{Racing}	2018-07-02	1.0.0.0	4.1 and up
1795	Couchsurfing Travel App	TOOLS	4.5	162335	4.9M	10000000	0	Everyone	{Tools}	2018-07-06	8.10.1	4.0 and up
1796	Learn HTML	HOUSE_AND_HOME	4.5	162243	12M	10000000	0	Everyone	{"House & Home"}	2018-07-26	8.18	4.0.3 and up
1797	AE Bingo: Offline Bingo Games	HOUSE_AND_HOME	4.5	162243	12M	10000000	0	Everyone	{"House & Home"}	2018-07-26	8.18	4.0.3 and up
1798	Bloomberg: Market & Financial News	MAPS_AND_NAVIGATION	4.7	162049	48M	5000000	0	Everyone	{"Maps & Navigation"}	2018-08-07	18.0.2	4.4 and up
1799	Casual Dating & Adult Singles - Joyride	GAME	4.4	161637	82M	10000000	0	Mature 17+	{Action}	2018-07-18	1.7.0m	4.0.3 and up
1800	Learn Top 300 English Words	SOCIAL	4.1	161610	16M	5000000	0	Teen	{Social}	2018-08-05	4.5.3	4.1 and up
1801	Inf VPN - Global Proxy & Unlimited Free WIFI VPN	FINANCE	4.6	161440	16M	1000000	0	Everyone	{Finance}	2018-08-03	3.2.18.07.30	4.0.3 and up
1802	Lalafo Pulsuz Elanlar	SPORTS	4.6	161423	73M	5000000	0	Everyone	{Sports}	2018-08-01	6.5.3	5.0 and up
1803	Cut the Rope GOLD	LIFESTYLE	4.6	161143	11M	10000000	0	Everyone 10+	{Lifestyle}	2018-06-25	5.2.4(881)	4.0.3 and up
1804	HBO NOW: Stream TV & Movies	ENTERTAINMENT	4.3	160164	12M	10000000	0	Teen	{Entertainment}	2018-08-01	4.2.0.8447	5.0 and up
1805	FOX NOW - On Demand & Live TV	BUSINESS	4.2	159872	Varies with device	10000000	0	Everyone	{Business}	2018-07-31	Varies with device	Varies with device
1806	Calendar Widget Month + Agenda	BUSINESS	4.2	159872	Varies with device	10000000	0	Everyone	{Business}	2018-07-31	Varies with device	Varies with device
1807	Maps & GPS Navigation — OsmAnd	BUSINESS	4.2	159872	Varies with device	10000000	0	Everyone	{Business}	2018-07-31	Varies with device	Varies with device
1808	Brightest LED Flashlight	VIDEO_PLAYERS	4.1	159622	23M	5000000	0	Everyone	{"Video Players & Editors",Creativity}	2018-07-17	6.14.091	4.3 and up
1809	Meet – Talk to Strangers Using Random Video Chat	FAMILY	4.1	159619	23M	5000000	0	Everyone	{"Video Players & Editors",Creativity}	2018-07-17	6.14.091	4.3 and up
1810	Post Bank	WEATHER	4.8	159455	10M	1000000	0	Everyone	{Weather}	2018-05-08	1.11.93	4.4 and up
1811	CIA - Caller ID & Call Blocker	FAMILY	3.8	159398	28M	5000000	0	Teen	{"Role Playing"}	2018-05-30	2.22.0	4.2 and up
1812	CYANOGEN GO Launcher EX Theme	GAME	3.8	159063	85M	1000000	0	Everyone	{Music}	2018-02-09	0.8.0	4.0 and up
1813	Cool Popular Ringtones 2018 🔥	COMMUNICATION	4.3	158679	8.8M	5000000	0	Everyone	{Communication}	2018-08-03	2.4.1	4.4 and up
1814	Disney Princess Palace Pets	NEWS_AND_MAGAZINES	4.4	158196	Varies with device	10000000	0	Everyone	{"News & Magazines"}	2018-07-27	Varies with device	Varies with device
1815	JEFIT Workout Tracker, Weight Lifting, Gym Log App	FAMILY	4.3	157997	27M	10000000	0	Everyone	{Simulation}	2016-08-04	1.4.4	2.3.3 and up
1816	Alarm Clock Free	PHOTOGRAPHY	4	157506	47M	10000000	0	Everyone	{Photography}	2018-05-24	4.5.2	5.0 and up
1817	TO-FU Oh!SUSHI	FINANCE	4.6	157505	Varies with device	5000000	0	Everyone	{Finance}	2018-08-01	Varies with device	Varies with device
1818	Block Puzzle	PERSONALIZATION	4.1	157495	6.4M	10000000	0	Everyone	{Personalization}	2018-07-24	4.0.0.7	4.4 and up
1819	Fun Kid Racing - Motocross	FAMILY	4.5	157322	9.2M	5000000	0	Teen	{Entertainment}	2018-01-05	1.0.15	4.1 and up
1820	Room Creator Interior Design	GAME	4.3	157264	65M	10000000	0	Everyone	{Arcade}	2016-12-30	1.31	4.0.3 and up
1821	TorrDroid - Torrent Downloader	GAME	4.2	156862	64M	5000000	0	Everyone 10+	{Action}	2018-07-31	7.0.4	4.1 and up
1822	Asylum Night Shift - Five Nights Survival	MEDICAL	4.7	156410	14M	5000000	0	Everyone	{Medical}	2018-08-03	5.9.6	4.1 and up
1823	GoodRx Drug Prices and Coupons	PHOTOGRAPHY	4.4	156322	Varies with device	10000000	0	Everyone	{Photography}	2018-02-01	Varies with device	Varies with device
1824	Curio Quest	PRODUCTIVITY	4.5	155999	12M	10000000	0	Everyone	{Productivity}	2018-08-05	12.8.2	4.4 and up
1825	Egg for Pou	PRODUCTIVITY	4.5	155999	12M	10000000	0	Everyone	{Productivity}	2018-08-05	12.8.2	4.4 and up
1826	Video Downloader	PRODUCTIVITY	4.5	155998	12M	10000000	0	Everyone	{Productivity}	2018-08-05	12.8.2	4.4 and up
1827	Honkai Impact 3rd	FOOD_AND_DRINK	4.5	155944	35M	5000000	0	Everyone	{"Food & Drink"}	2018-08-02	7.12	5.0 and up
1828	Mobizen Screen Recorder for LG - Record, Capture	FOOD_AND_DRINK	4.5	155944	35M	5000000	0	Everyone	{"Food & Drink"}	2018-08-02	7.12	5.0 and up
1829	Cars: Lightning League	GAME	4.7	155694	92M	1000000	0	Teen	{Board}	2018-07-13	2.1.1	4.0.3 and up
1830	Google Assistant	LIFESTYLE	4.4	155693	Varies with device	5000000	0	Everyone	{Lifestyle}	2014-09-30	Varies with device	Varies with device
1831	HD Widgets	FAMILY	4.1	155649	38M	10000000	0	Everyone	{Casual}	2018-07-11	1.38	4.1 and up
1832	The Walking Zombie: Dead City	BOOKS_AND_REFERENCE	4.5	155466	Varies with device	10000000	0	Teen	{"Books & Reference"}	2018-04-25	Varies with device	Varies with device
1833	Super Sport Car Simulator	BOOKS_AND_REFERENCE	4.5	155446	Varies with device	10000000	0	Teen	{"Books & Reference"}	2018-04-25	Varies with device	Varies with device
1834	Sudoku Master	FAMILY	4	155276	61M	10000000	0	Everyone	{"Role Playing","Pretend Play"}	2018-06-18	1.1.0	4.1 and up
1835	iSwipe Phone X	ENTERTAINMENT	4.2	155234	22M	1000000	0	Teen	{Entertainment}	2018-08-01	01.01.66	4.4 and up
1836	Banjo	GAME	4.6	155186	Varies with device	10000000	0	Everyone	{Puzzle}	2018-08-03	1.3.35	4.1 and up
1837	Delivery trough - delivery trough delivery trough	PRODUCTIVITY	4.3	154668	Varies with device	10000000	0	Everyone	{Productivity}	2018-08-02	Varies with device	Varies with device
1838	The NBC App - Watch Live TV and Full Episodes	TOOLS	4.2	154578	14M	10000000	0	Everyone	{Tools}	2018-05-25	3.0.5	4.1 and up
1839	Vudu Movies & TV	GAME	4.1	154519	99M	10000000	0	Mature 17+	{Action}	2017-05-09	1.4	2.3 and up
1840	Wifi Connect Library	GAME	4.7	154264	12M	10000000	0	Everyone	{Card}	2018-06-08	Varies with device	Varies with device
1841	Galaxy Live Wallpaper	GAME	4	154108	78M	5000000	0	Everyone	{Racing}	2015-10-13	1.4.2	2.3 and up
1842	Shopular: Coupons, Weekly Ads & Shopping Deals	GAME	4.4	153649	Varies with device	10000000	0	Teen	{Action}	2018-06-18	1.11.2	4.1 and up
1843	JotterPad - Writer, Screenplay, Novel	GAME	4.4	153381	Varies with device	10000000	0	Teen	{Action}	2018-06-18	1.11.2	4.1 and up
1844	White Noise Lite	PERSONALIZATION	3.8	153176	4.3M	10000000	0	Everyone	{Personalization}	2018-08-07	1.17	4.0.3 and up
1845	HotelTonight: Book amazing deals at great hotels	SPORTS	4.6	152867	17M	10000000	0	Everyone	{Sports}	2018-08-03	3.0.5	4.1 and up
1846	Robinhood - Investing, No Fees	SPORTS	4.5	152780	Varies with device	10000000	0	Everyone	{Sports}	2018-07-18	Varies with device	Varies with device
1847	NoteToDo. Notes. To do list	TOOLS	4.7	152692	11M	5000000	0	Everyone	{Tools}	2018-07-07	3.5.6	4.1 and up
1848	Al Quran (Tafsir & by Word)	GAME	4.5	152658	29M	1000000	0	Teen	{Adventure}	2014-09-12	2.1.8	2.1 and up
1849	Family GPS tracker KidControl + GPS by SMS Locator	SPORTS	4.6	152653	17M	10000000	0	Everyone	{Sports}	2018-08-03	3.0.5	4.1 and up
1850	GANMA! - All original stories free of charge for all original comics	COMMUNICATION	4.4	152470	Varies with device	10000000	0	Everyone	{Communication}	2018-07-19	Varies with device	Varies with device
1851	Meet24 - Love, Chat, Singles	GAME	4.6	152395	14M	10000000	0	Everyone 10+	{Action}	2016-07-22	1.1.9	2.3 and up
1852	ai.type keyboard Plus + Emoji	GAME	3.3	152102	18M	10000000	0	Teen	{Trivia}	2018-06-30	4.16	4.1 and up
1853	Note Everything	FAMILY	4.3	151374	54M	10000000	0	Everyone	{"Role Playing","Brain Games"}	2018-06-05	1.2.7	4.1 and up
1854	Memorado - Brain Games	SHOPPING	4.3	151095	12M	5000000	0	Mature 17+	{Shopping}	2018-07-01	4.0.13	4.1 and up
1855	Fast Secure VPN	FOOD_AND_DRINK	4.3	151080	Varies with device	5000000	0	Everyone	{"Food & Drink"}	2018-07-27	Varies with device	Varies with device
1856	Daily Mail Online	TRAVEL_AND_LOCAL	4.4	150932	27M	10000000	0	Everyone	{"Travel & Local"}	2018-07-30	9.1.0	4.1 and up
1857	Cozi Family Organizer	TRAVEL_AND_LOCAL	4.5	149723	4.1M	10000000	0	Everyone	{"Travel & Local"}	2018-06-13	8.1.171	4.0 and up
1858	Do Not Crash	GAME	4.5	148990	46M	10000000	0	Everyone	{Casual}	2018-07-17	1.20.1	4.0.3 and up
1859	RT News (Russia Today)	BUSINESS	4.8	148945	25M	1000000	0	Everyone	{Business}	2018-07-19	5.2.8	5.0 and up
1860	Fatal Raid - No.1 Mobile FPS	GAME	4.5	148945	46M	10000000	0	Everyone	{Casual}	2018-07-17	1.20.1	4.0.3 and up
1861	Yandex.Trains	GAME	4.5	148897	46M	10000000	0	Everyone	{Casual}	2018-07-17	1.20.1	4.0.3 and up
1862	NBA JAM by EA SPORTS™	GAME	4.5	148895	46M	10000000	0	Everyone	{Casual}	2018-07-17	1.20.1	4.0.3 and up
1863	Mapy.cz - Cycling & Hiking offline maps	FAMILY	4.4	148826	49M	1000000	0	Teen	{"Role Playing"}	2018-06-19	1.4.9	4.0.3 and up
1864	lifebox	VIDEO_PLAYERS	4.6	148715	3.3M	10000000	0	Everyone	{"Video Players & Editors"}	2017-12-20	2	4.0 and up
1865	kicker football news	EDUCATION	4.4	148550	59M	10000000	0	Everyone	{Education,Education}	2018-08-03	4.21.1	4.1 and up
1866	Cook Baked Lasagna	EDUCATION	4.4	148549	59M	10000000	0	Everyone	{Education,Education}	2018-08-03	4.21.1	4.1 and up
1867	The Holy Rosary	FAMILY	4.4	148536	59M	10000000	0	Everyone	{Education,Education}	2018-08-03	4.21.1	4.1 and up
1868	Best Ovulation Tracker Fertility Calendar App Glow	TOOLS	4.5	148506	11M	5000000	0	Everyone	{Tools}	2018-07-15	Varies with device	Varies with device
1869	Flame - درب عقلك يوميا	FAMILY	4.1	148405	26M	10000000	0	Everyone	{Casual,"Action & Adventure"}	2018-03-05	1.6	4.1 and up
1870	Fancy Pants Adventures	FAMILY	4.1	148295	26M	10000000	0	Everyone	{Casual,"Action & Adventure"}	2018-03-05	1.6	4.1 and up
1871	PixPanda - Color by Number Pixel Art Coloring Book	GAME	3.4	148177	78M	10000000	0	Everyone	{Arcade}	2018-07-27	1.7.2	4.1 and up
1872	Programming Hub, Learn to code	SPORTS	4.3	148083	57M	10000000	0	Everyone	{Sports}	2018-07-24	1.42.2	4.1 and up
1873	Ultimate Ab & Core Workouts	GAME	4.2	147791	38M	5000000	0	Teen	{Action}	2018-07-26	1.3	5.0 and up
1874	Keyboard - wallpapers , photos	TOOLS	4.3	146913	24M	100000000	0	Everyone	{Tools}	2018-07-18	3.5.02.15	4.0 and up
1875	Photo Mixer	GAME	3.9	145931	43M	10000000	0	Teen	{Action}	2018-05-31	5.3.2	2.3 and up
1876	英漢字典 EC Dictionary	FOOD_AND_DRINK	3.6	145646	42M	10000000	0	Everyone	{"Food & Drink"}	2018-07-31	5.15.0	4.4 and up
1877	Tomb of the Mask	GAME	4.2	145353	85M	10000000	0	Teen	{Arcade}	2018-07-24	1.3.1	4.1 and up
1878	Robin - AI Voice Assistant	FOOD_AND_DRINK	3.6	145323	42M	10000000	0	Everyone	{"Food & Drink"}	2018-07-31	5.15.0	4.4 and up
1879	Learn 50 languages	PRODUCTIVITY	4.2	145088	24M	10000000	0	Everyone	{Productivity}	2018-07-23	4.5.19	4.4 and up
1880	Web Browser for Android	PRODUCTIVITY	4.3	144879	Varies with device	10000000	0	Everyone	{Productivity}	2016-01-24	3.5.0	Varies with device
1881	Gun Club Armory	PRODUCTIVITY	4.3	144873	Varies with device	10000000	0	Everyone	{Productivity}	2016-01-24	3.5.0	Varies with device
1882	Hafizi Quran 15 lines per page	GAME	4.4	144545	13M	5000000	0	Teen	{Action}	2011-12-01	1.1.0	2.1 and up
1883	Motorola FM Radio	HEALTH_AND_FITNESS	4.5	144050	55M	5000000	0	Everyone	{"Health & Fitness"}	2018-07-27	18.7.1	5.0 and up
1884	Babbel – Learn Spanish	HEALTH_AND_FITNESS	4.5	144040	55M	5000000	0	Everyone	{"Health & Fitness"}	2018-07-27	18.7.1	5.0 and up
1885	Web Browser & Fast Explorer	GAME	4.3	144040	29M	5000000	0	Teen	{Action}	2018-07-25	1.0.9.10	4.0 and up
1886	PDF Reader - Scan、Edit & Share	FAMILY	4.3	143087	69M	1000000	0	Everyone 10+	{"Role Playing"}	2018-07-12	1.9.22	4.0 and up
1887	Gnoche entertainment news · sports news is also free	PHOTOGRAPHY	4.7	142758	22M	10000000	0	Everyone	{Photography}	2018-07-06	1.5.1	4.4 and up
1888	Car Race by Fun Games For Free	GAME	3.9	142693	21M	5000000	0	Teen	{Action}	2018-06-07	1.4.0	2.3 and up
1889	Super Flashlight + LED	PHOTOGRAPHY	4.7	142634	22M	10000000	0	Everyone	{Photography}	2018-07-06	1.5.1	4.4 and up
1890	RadarNow!	EDUCATION	4.7	142632	6.9M	5000000	0	Everyone	{Education}	2018-07-12	2.8	4.1 and up
1891	Jungle Monkey Run	SHOPPING	4.2	142512	15M	10000000	0	Everyone	{Shopping}	2018-07-25	6.2.0	4.1 and up
1892	Phone X Launcher, OS 11 iLauncher & Control Center	SHOPPING	4.2	142512	15M	10000000	0	Everyone	{Shopping}	2018-07-25	6.2.0	4.1 and up
1893	Speed Camera Radar	PERSONALIZATION	4.4	142393	12M	10000000	0	Everyone	{Personalization}	2018-07-31	1.284.1.126	4.2 and up
1894	Ovia Fertility Tracker & Ovulation Calculator	GAME	4.7	142308	24M	5000000	0	Everyone 10+	{Board}	2018-08-01	2.0.6	4.1 and up
1895	Super Slime Simulator - Satisfying Slime App	ENTERTAINMENT	4.1	141980	Varies with device	5000000	0	Teen	{Entertainment}	2018-07-30	Varies with device	Varies with device
1896	Karta GPS - Offline Navigation	SHOPPING	4	141613	22M	10000000	0	Teen	{Shopping}	2018-07-31	16.14.0.850	4.4 and up
1897	MapQuest: Directions, Maps, GPS & Navigation	SHOPPING	4	141584	22M	10000000	0	Teen	{Shopping}	2018-07-31	16.14.0.850	4.4 and up
1898	Candy selfie - photo editor, live filter camera	GAME	4.7	141529	24M	5000000	0	Everyone 10+	{Board}	2018-08-01	2.0.6	4.1 and up
1899	DJ Electro Mix Pad	VIDEO_PLAYERS	3.9	141515	5.7M	10000000	0	Teen	{"Video Players & Editors"}	2014-04-23	0.6.0	2.3 and up
1900	T-Mobile Tuesdays	FAMILY	4.2	141363	8.7M	10000000	0	Everyone	{Casual,"Action & Adventure"}	2018-01-21	1.20.2	2.3 and up
1901	The Maner	HEALTH_AND_FITNESS	4.4	141163	Varies with device	10000000	0	Everyone	{"Health & Fitness"}	2018-06-11	Varies with device	Varies with device
1902	Video Editor,Crop Video,Movie Video,Music,Effects	LIFESTYLE	4	140995	100M	10000000	0	Everyone	{Lifestyle,"Pretend Play"}	2018-07-16	9	4.0 and up
1903	Checkout 51: Grocery coupons	PHOTOGRAPHY	4.2	140917	5.7M	10000000	0	Everyone	{Photography}	2018-06-11	2.2.93	4.0 and up
1904	Learn Java	SPORTS	4.2	140883	59M	5000000	0	Teen	{Sports}	2018-07-21	1.932	4.0 and up
1905	Google AdSense	GAME	4.4	140658	37M	1000000	0	Everyone	{Racing}	2018-08-01	1.21.2	4.3 and up
1906	Used cars for sale - Trovit	FAMILY	4.3	139545	63M	10000000	0	Everyone	{Racing,"Action & Adventure"}	2018-01-30	1.6.1326	4.1 and up
1907	Chicken Invaders 3	TOOLS	4.4	139480	Varies with device	5000000	0	Everyone	{Tools}	2018-04-19	v150	4.1 and up
1908	50000 Free eBooks & Free AudioBooks	GAME	4.2	139432	4.7M	10000000	0	Everyone	{Adventure}	2013-11-20	1.5	2.1 and up
1909	Citibanamex Movil	PERSONALIZATION	4.7	139258	Varies with device	5000000	0	Everyone	{Personalization}	2018-08-03	Varies with device	4.4 and up
1910	Blackjack	TOOLS	4.4	138872	22M	10000000	0	Everyone	{Tools}	2018-05-15	2.0.1077	4.1 and up
1911	Assault Line CS Online Fps Go	SPORTS	3.9	138739	44M	10000000	0	Teen	{Sports}	2018-07-07	1.998	4.1 and up
1912	Hopper - Watch & Book Flights	FINANCE	4.1	138371	Varies with device	5000000	0	Everyone	{Finance}	2018-08-02	Varies with device	4.0.3 and up
1913	Perfect Viewer	VIDEO_PLAYERS	4.3	138337	Varies with device	10000000	0	Everyone	{"Video Players & Editors"}	2018-04-03	Varies with device	Varies with device
1914	Champions and Challengers - Adventure Time	COMMUNICATION	3.9	138129	2.1M	10000000	0	Everyone	{Communication}	2018-05-06	1.5.2.4-23	2.3 and up
1915	Kids Animals Jigsaw Puzzles 😄	FAMILY	4.1	138050	5.7M	10000000	0	Everyone	{Entertainment,"Music & Video"}	2018-04-19	2.4	4.0.3 and up
1916	Hello Kitty Lunchbox	SOCIAL	3.7	138026	2.7M	5000000	0	Mature 17+	{Social}	2016-02-29	2.1.3	2.1 and up
1917	Driving Zone	GAME	4.3	137696	55M	5000000	0	Mature 17+	{Word}	2018-07-19	2.3.3	4.2 and up
1918	My OldBoy! Free - GBC Emulator	FAMILY	4.1	137674	72M	5000000	0	Teen	{"Role Playing"}	2018-07-04	2.0.2	2.3 and up
1919	SweetRing - Meet, Match, Date	TOOLS	4.4	137562	Varies with device	10000000	0	Everyone	{Tools}	2018-05-31	Varies with device	Varies with device
1920	Opera News - Trending news and videos	FAMILY	3.9	137377	30M	5000000	0	Everyone	{Simulation}	2017-04-12	2.2	4.0.3 and up
1921	Wishbone - Compare Anything	GAME	4.6	137338	51M	5000000	0	Everyone	{Racing}	2018-07-13	1.44	4.1 and up
1922	BeyondMenu Food Delivery	FAMILY	4.6	137198	81M	5000000	0	Everyone 10+	{Simulation}	2018-04-22	3.7	4.0 and up
1923	ARK: Survival Evolved	FAMILY	4.2	137167	52M	1000000	0	Everyone	{Strategy}	2017-01-17	130.48.08	4.0.3 and up
1924	Slack	COMMUNICATION	4.4	137144	32M	10000000	0	Everyone	{Communication}	2018-07-30	2.18.116	4.0.3 and up
1925	Nextdoor - Local neighborhood news & classifieds	TOOLS	4.6	136874	Varies with device	10000000	0	Everyone	{Tools}	2018-06-25	Varies with device	Varies with device
1926	Motocross Motorbike Simulator Offroad	COMMUNICATION	4.4	136662	32M	10000000	0	Everyone	{Communication}	2018-07-30	2.18.116	4.0.3 and up
1927	Black Wallpaper, AMOLED, Dark Background: Darkify	TRAVEL_AND_LOCAL	4.1	136633	14M	10000000	0	Everyone	{"Travel & Local"}	2018-08-06	18.30.0	5.0 and up
1928	Golden Dictionary (EN-AR)	TRAVEL_AND_LOCAL	4.1	136626	14M	10000000	0	Everyone	{"Travel & Local"}	2018-08-06	18.30.0	5.0 and up
1929	Sleep Sounds	TRAVEL_AND_LOCAL	4.1	136626	14M	10000000	0	Everyone	{"Travel & Local"}	2018-08-06	18.30.0	5.0 and up
1930	Simple Neon Blue Future Tech Keyboard Theme	TRAVEL_AND_LOCAL	4.1	136626	14M	10000000	0	Everyone	{"Travel & Local"}	2018-08-06	18.30.0	5.0 and up
1931	Threema	TOOLS	4.7	136540	3.1M	1000000	0	Everyone	{Tools}	2018-07-10	4.75	4.0.3 and up
1932	Day R Premium	FINANCE	4.4	135952	Varies with device	5000000	0	Everyone	{Finance}	2018-07-30	Varies with device	Varies with device
1933	Commando Adventure Assassin	SPORTS	4	135763	13M	10000000	0	Everyone	{Sports}	2018-08-02	1.5.13	4.1 and up
1934	Afterlight	GAME	4.4	135739	Varies with device	5000000	0	Everyone	{Word}	2018-08-07	Varies with device	Varies with device
1935	ABCmouse.com	DATING	4.3	135420	Varies with device	10000000	0	Mature 17+	{Dating}	2018-07-07	Varies with device	Varies with device
1936	yHomework - Math Solver	DATING	4.3	135418	Varies with device	10000000	0	Mature 17+	{Dating}	2018-07-07	Varies with device	Varies with device
1937	ColorFul - Adult Coloring Book	WEATHER	3.9	135337	Varies with device	5000000	0	Everyone	{Weather}	2018-08-06	Varies with device	Varies with device
1938	Runtastic Mountain Bike GPS Tracker	SHOPPING	4.6	135043	11M	10000000	0	Everyone	{Shopping}	2018-07-30	4.0.2	4.2 and up
1939	乗換NAVITIME Timetable & Route Search in Japan Tokyo	TRAVEL_AND_LOCAL	4.4	134895	50M	10000000	0	Everyone	{"Travel & Local"}	2018-07-01	2.32.2	4.2 and up
1940	ABC – Live TV & Full Episodes	FINANCE	4.6	134564	Varies with device	5000000	0	Everyone	{Finance}	2018-07-25	Varies with device	Varies with device
1941	LALALAB prints your photos, photobooks and magnets	TOOLS	4.4	134412	11M	5000000	0	Everyone	{Tools}	2018-07-27	3.0.5	4.4 and up
1942	Journey - Diary, Journal	TOOLS	4.2	134203	4.1M	10000000	0	Everyone	{Tools}	2018-08-06	6.06.14	4.4 and up
1943	Calorie Counter - EasyFit free	TOOLS	4.2	134203	4.1M	10000000	0	Everyone	{Tools}	2018-08-07	6.06.14	4.4 and up
1944	Fantasy Football	HEALTH_AND_FITNESS	4.4	134195	Varies with device	10000000	0	Everyone	{"Health & Fitness"}	2018-06-14	Varies with device	Varies with device
1945	Bokeh (Background defocus)	SPORTS	4.4	133833	34M	10000000	0	Everyone 10+	{Sports}	2018-07-25	6.17.2	4.4 and up
1946	Masha and The Bear Jam Day Match 3 games for kids	SPORTS	4.4	133833	34M	10000000	0	Everyone 10+	{Sports}	2018-07-25	6.17.2	4.4 and up
1947	DraftKings - Daily Fantasy Sports	SPORTS	4.4	133833	34M	10000000	0	Everyone 10+	{Sports}	2018-07-25	6.17.2	4.4 and up
1948	Oggy	SPORTS	4.4	133825	34M	10000000	0	Everyone 10+	{Sports}	2018-07-25	6.17.2	4.4 and up
1949	Solid Explorer Classic	SPORTS	4.4	133825	34M	10000000	0	Everyone 10+	{Sports}	2018-07-25	6.17.2	4.4 and up
1950	ipsy: Makeup, Beauty, and Tips	PRODUCTIVITY	4.4	133573	Varies with device	5000000	0	Everyone	{Productivity}	2018-07-03	Varies with device	Varies with device
1951	HD Camera	WEATHER	4.2	133338	44M	5000000	0	Everyone	{Weather}	2018-06-26	6.1.3	4.1 and up
1952	XOS - Launcher,Theme,Wallpaper	GAME	4.3	133195	11M	5000000	0	Everyone	{Board}	2018-06-11	1.58	4.1 and up
1953	Messages, Text and Video Chat for Messenger	GAME	4.8	133180	54M	1000000	0	Everyone 10+	{Arcade}	2018-01-12	1.1.1	4.4 and up
1954	Facetune - For Free	EDUCATION	4.9	133136	26M	1000000	0	Everyone	{Education,Education}	2018-07-20	2.16.11.10	4.2 and up
1955	Visage Lab – face retouch	FAMILY	3.9	133117	63M	5000000	0	Everyone	{Casual,"Pretend Play"}	2018-07-12	2.6	4.1 and up
1956	PumpUp — Fitness Community	MAPS_AND_NAVIGATION	4.1	132792	62M	10000000	0	Everyone	{"Maps & Navigation"}	2017-10-25	1.17.1	4.0.3 and up
1957	Connect’Em	GAME	4.6	132282	20M	1000000	0	Everyone	{Adventure}	2018-07-31	15	4.1 and up
1958	Fortune City - A Finance App	COMMUNICATION	4.1	132015	25M	10000000	0	Everyone	{Communication}	2018-07-18	6.1	4.2 and up
1959	USA TODAY	COMMUNICATION	4.1	132014	25M	10000000	0	Everyone	{Communication}	2018-07-18	6.1	4.2 and up
1960	HD Camera Pro for Android	FOOD_AND_DRINK	4.5	131569	8.2M	10000000	0	Everyone	{"Food & Drink"}	2018-08-03	2.76.2.0-android	4.2 and up
1961	Exiled Kingdoms RPG	NEWS_AND_MAGAZINES	4.3	131028	13M	5000000	0	Teen	{"News & Magazines"}	2018-07-30	5.38	4.4 and up
1962	TripIt: Travel Organizer	NEWS_AND_MAGAZINES	4.3	131028	13M	5000000	0	Teen	{"News & Magazines"}	2018-07-30	5.38	4.4 and up
1963	My Day - Countdown Calendar 🗓️	FAMILY	3.8	130689	57M	5000000	0	Everyone 10+	{Simulation}	2018-08-03	1.32	4.2 and up
1964	Speedcheck	FINANCE	4.7	130582	24M	5000000	0	Everyone	{Finance}	2018-08-02	Varies with device	Varies with device
1965	Priceline Hotel Deals, Rental Cars & Flights	ENTERTAINMENT	4.2	130549	Varies with device	5000000	0	Teen	{Entertainment}	2018-06-27	2.08.78.2	4.1 and up
1966	Madagascar Surf n’ Slides Free	FAMILY	4.2	130549	Varies with device	5000000	0	Teen	{Entertainment}	2018-06-27	2.08.78.2	4.1 and up
1967	CMB Free Dating App	LIBRARIES_AND_DEMO	4.2	130287	50M	10000000	0	Everyone	{"Libraries & Demo"}	2016-03-14	1.8	4.1 and up
1968	Ski Safari: Adventure Time	LIBRARIES_AND_DEMO	4.2	130272	50M	10000000	0	Everyone	{"Libraries & Demo"}	2016-03-14	1.8	4.1 and up
1969	11st	HEALTH_AND_FITNESS	4.5	130104	25M	10000000	0	Everyone	{"Health & Fitness"}	2018-08-03	5.3	5.0 and up
1970	Sport Car Simulator	PHOTOGRAPHY	4	130081	5.6M	10000000	0	Everyone	{Photography}	2017-11-10	3.31.4	4.0 and up
1971	Dog Run - Pet Dog Simulator	PHOTOGRAPHY	4	130063	5.6M	10000000	0	Everyone	{Photography}	2017-11-10	3.31.4	4.0 and up
1972	Fat No More - Be the Biggest Loser in the Gym!	FOOD_AND_DRINK	4.7	129737	Varies with device	1000000	0	Teen	{"Food & Drink"}	2018-08-03	Varies with device	Varies with device
1973	Black Survival	FAMILY	4.3	129603	23M	1000000	2.99	Everyone 10+	{Card,"Action & Adventure"}	2016-02-11	1.11.0	2.3.3 and up
1974	Bualuang mBanking	FAMILY	4.4	129542	63M	1000000	0	Everyone	{Strategy,Creativity}	2018-07-23	2.4.9	4.0.3 and up
1975	Battle Gems (AdventureQuest)	SPORTS	4.4	129409	73M	1000000	1.99	Everyone	{Sports}	2018-08-04	1.5.1	4.0.3 and up
1976	Pregnancy & Baby Tracker	FINANCE	4.3	129305	Varies with device	5000000	0	Everyone	{Finance}	2018-08-02	Varies with device	Varies with device
1977	Sportractive GPS Running Cycling Distance Tracker	FINANCE	4.3	129304	Varies with device	5000000	0	Everyone	{Finance}	2018-08-02	Varies with device	Varies with device
1978	Looper!	FINANCE	4.3	129304	Varies with device	5000000	0	Everyone	{Finance}	2018-08-02	Varies with device	Varies with device
1979	30 Day Ab Challenge FREE	PHOTOGRAPHY	3.9	129272	11M	10000000	0	Everyone	{Photography}	2018-07-30	1.32	4.1 and up
1980	Meditation Music - Relax, Yoga	PHOTOGRAPHY	3.9	129268	11M	10000000	0	Everyone	{Photography}	2018-07-30	1.32	4.1 and up
1981	Calculator with Percent (Free)	FAMILY	4.3	128808	Varies with device	10000000	0	Everyone	{Education,Education}	2018-08-02	Varies with device	Varies with device
1982	IndiGo	GAME	4.2	128579	Varies with device	5000000	0	Everyone	{Action}	2018-05-06	Varies with device	Varies with device
1983	My Study Life - School Planner	GAME	4.3	128367	54M	1000000	0	Everyone	{Arcade}	2017-10-27	2.1.0	4.0.3 and up
1984	Cheapflights – Flight Search	GAME	4	127831	26M	10000000	0	Teen	{Card}	2017-12-20	4.7.0	3.0 and up
1985	4 in a row	GAME	4	127810	33M	10000000	0	Mature 17+	{Action}	2018-08-01	1.8.8	4.4 and up
1986	Crazy Freekick	FAMILY	3.8	127229	34M	10000000	0	Everyone	{Casual}	2017-09-07	1.1.14	4.0 and up
1987	Jewels classic Prince	TOOLS	4.2	127223	7.6M	10000000	0	Everyone	{Tools}	2018-08-03	v7.0.7.1.0625.1_06_0629	5.0 and up
1988	Leo and Tig	LIBRARIES_AND_DEMO	3.5	126862	624k	10000000	0	Everyone	{"Libraries & Demo"}	2012-01-17	1	2.2 and up
1989	Pocket Little Pony	FINANCE	4.4	126447	Varies with device	1000000	0	Everyone	{Finance}	2018-08-01	Varies with device	Varies with device
1990	metroZONE	FINANCE	4.4	126431	Varies with device	1000000	0	Everyone	{Finance}	2018-08-01	Varies with device	Varies with device
1991	Al Quran MP3 - Quran Reading®	PHOTOGRAPHY	4.6	126338	9.6M	1000000	0	Everyone	{Photography}	2017-03-15	2.0.5	4.0 and up
1992	ZenUI Themes – Stylish Themes	PHOTOGRAPHY	4.6	126337	9.6M	1000000	0	Everyone	{Photography}	2017-03-15	2.0.5	4.0 and up
1993	WDAMAGE: Car Crash Engine	MAPS_AND_NAVIGATION	4	126282	Varies with device	10000000	0	Everyone	{"Maps & Navigation"}	2018-07-30	5.7	4.1 and up
1994	Shadowverse CCG	HEALTH_AND_FITNESS	4.5	126017	4.3M	5000000	0	Everyone	{"Health & Fitness"}	2018-07-05	4.9.8.1	4.0 and up
1995	ReadEra – free ebook reader	SHOPPING	4.3	125783	Varies with device	10000000	0	Teen	{Shopping}	2018-08-06	Varies with device	Varies with device
1996	Palace Pets in Whisker Haven	SHOPPING	4.3	125783	Varies with device	10000000	0	Teen	{Shopping}	2018-08-06	Varies with device	Varies with device
1997	Nights at Cube Pizzeria 3D – 2	GAME	4.4	125652	56M	10000000	0	Everyone	{Action}	2018-06-18	3.3.0	4.2 and up
1998	Silent Camera [High Quality]	GAME	4.6	125647	33M	10000000	0	Everyone	{Casual}	2018-07-23	60	4.1 and up
1999	FRANCE 24	PHOTOGRAPHY	4	125616	Varies with device	10000000	0	Everyone	{Photography}	2017-03-10	Varies with device	2.3.3 and up
2000	Snoopy’s Town Tale - City Building Simulator	GAME	4.4	125578	17M	5000000	0	Everyone	{Action}	2015-07-06	1.1.8	2.1 and up
2001	Radio Javan	PHOTOGRAPHY	4.3	125259	Varies with device	50000000	0	Everyone	{Photography}	2018-08-02	Varies with device	Varies with device
2002	Skip-Bo™ Free	COMMUNICATION	4.3	125257	17M	10000000	0	Teen	{Communication}	2018-06-06	1.8.9	4.1 and up
2003	Piano Kids - Music & Songs	COMMUNICATION	4.2	125232	2.7M	10000000	0	Everyone	{Communication}	2017-03-05	196	2.1 and up
2004	Seznam.cz	BOOKS_AND_REFERENCE	4.6	124970	Varies with device	5000000	0	Teen	{"Books & Reference"}	2018-05-26	Varies with device	Varies with device
2005	Spectrum TV	FINANCE	4.4	124424	Varies with device	10000000	0	Everyone	{Finance}	2018-06-26	4.6.0	4.2 and up
2006	Cookbook Recipes	COMMUNICATION	4.2	124346	695k	10000000	0	Everyone	{Communication}	2014-07-06	2.8	2.0 and up
2007	Mobile Doc Scanner (MDScan) Lite	FINANCE	4.4	124324	Varies with device	10000000	0	Everyone	{Finance}	2018-06-26	4.6.0	4.2 and up
2008	Draw In	PRODUCTIVITY	4.5	123412	Varies with device	50000000	0	Everyone	{Productivity}	2018-04-13	Varies with device	Varies with device
2009	Masha and the Bear. Educational Games	PRODUCTIVITY	4.5	123412	Varies with device	50000000	0	Everyone	{Productivity}	2018-04-13	Varies with device	Varies with device
2010	SuperLivePro	FAMILY	4.2	123322	25M	10000000	0	Everyone 10+	{Entertainment,"Music & Video"}	2018-01-24	2.0.8	4.4 and up
2011	Hungry Hearts Diner: A Tale of Star-Crossed Souls	FAMILY	4.2	123309	25M	10000000	0	Everyone 10+	{Entertainment,"Music & Video"}	2018-01-24	2.0.8	4.4 and up
2012	Insave-Download for Instagram	ENTERTAINMENT	4.2	123279	25M	10000000	0	Everyone 10+	{Entertainment,"Music & Video"}	2018-01-24	2.0.8	4.4 and up
2013	Poshmark - Buy & Sell Fashion	ENTERTAINMENT	4.2	123279	25M	10000000	0	Everyone 10+	{Entertainment,"Music & Video"}	2018-01-24	2.0.8	4.4 and up
2014	MileIQ - Free Mileage Tracker for Business	ENTERTAINMENT	4.2	123279	25M	10000000	0	Everyone 10+	{Entertainment,"Music & Video"}	2018-01-24	2.0.8	4.4 and up
2015	Kariyer.net	ENTERTAINMENT	4.2	123279	25M	10000000	0	Everyone 10+	{Entertainment,"Music & Video"}	2018-01-24	2.0.8	4.4 and up
2016	Acorns - Invest Spare Change	FAMILY	4.2	123136	80M	5000000	0	Mature 17+	{Simulation}	2018-06-25	1	4.0 and up
2017	Rope Hero 3	PHOTOGRAPHY	4.5	123029	Varies with device	10000000	0	Everyone	{Photography}	2018-08-02	Varies with device	4.0.3 and up
2018	My Telcel	COMMUNICATION	4	122595	30M	1000000	0	Everyone	{Communication}	2018-07-19	9.8.376	5.0 and up
2019	Virtual lover	COMMUNICATION	4	122512	79k	10000000	0	Everyone	{Communication}	2015-09-02	0.1.100944346	4.0.3 and up
2020	HTC Gallery	COMMUNICATION	4	122498	79k	10000000	0	Everyone	{Communication}	2015-09-02	0.1.100944346	4.0.3 and up
2021	Comics	PRODUCTIVITY	4.6	122424	4.7M	5000000	0	Everyone	{Productivity}	2018-03-16	1.35.2	2.3.3 and up
2022	Satellite Director	SPORTS	4.4	122283	Varies with device	5000000	0	Everyone 10+	{Sports}	2018-07-20	Varies with device	Varies with device
2023	Nasty Goats	SPORTS	4.4	122283	Varies with device	5000000	0	Everyone 10+	{Sports}	2018-07-20	Varies with device	Varies with device
2024	Flight & Hotel Booking App - ixigo	SPORTS	4.4	122283	Varies with device	5000000	0	Everyone 10+	{Sports}	2018-07-20	Varies with device	Varies with device
2025	Smashy Road: Arena	SPORTS	4.4	122282	Varies with device	5000000	0	Everyone 10+	{Sports}	2018-07-20	Varies with device	Varies with device
2026	Xperia Link™	SPORTS	4.4	122282	Varies with device	5000000	0	Everyone 10+	{Sports}	2018-07-20	Varies with device	Varies with device
2027	Phone	SPORTS	4.4	122280	Varies with device	5000000	0	Everyone 10+	{Sports}	2018-07-20	Varies with device	Varies with device
2028	Replika	TOOLS	4.3	122010	7.3M	5000000	0	Everyone	{Tools}	2018-07-14	Translator 10.9.2	4.0.3 and up
2029	Best Hairstyles step by step	VIDEO_PLAYERS	3.9	121916	23M	100000000	0	Everyone	{"Video Players & Editors"}	2016-01-25	Varies with device	Varies with device
2030	Can Your Pet? : Returns - Teen	HEALTH_AND_FITNESS	4.5	121838	15M	5000000	0	Everyone	{"Health & Fitness"}	2018-05-23	5.5.1	4.0.3 and up
2031	Sam’s Club: Wholesale Shopping & Instant Savings	GAME	4.3	121612	59M	1000000	0	Teen	{Action}	2017-12-28	1.0.6.4	4.0 and up
2032	Sword Art Online: Integral Factor	GAME	4.5	121533	63M	10000000	0	Everyone	{Arcade}	2016-03-24	1.0.0	2.3.3 and up
2033	L.POINT - 엘포인트 [ 포인트, 멤버십, 적립, 사용, 모바일 카드, 쿠폰, 롯데]	FAMILY	3.9	121321	46M	5000000	0	Everyone	{Entertainment}	2016-10-22	8.7	4.0.3 and up
2034	Mega Photo	TOOLS	4.4	121304	Varies with device	10000000	0	Everyone	{Tools}	2018-03-11	Varies with device	Varies with device
2035	Daily Ab Workout - Core & Abs Fitness Exercises	COMMUNICATION	4.1	121113	39M	10000000	0	Everyone	{Communication}	2018-07-11	1.4.0	4.1 and up
2036	Tattoo Name On My Photo Editor	GAME	4	121082	7.0M	10000000	0	Teen	{Adventure}	2018-01-17	1.0.7	2.1 and up
2037	mail.com mail	SPORTS	4	121003	Varies with device	10000000	0	Everyone	{Sports}	2018-08-06	Varies with device	Varies with device
2038	Flight Simulator X 2016 Free	GAME	3.6	120852	21M	10000000	0	Teen	{Action}	2017-10-24	1.1	4.0.3 and up
2039	Zappos – Shoe shopping made simple	GAME	4	120592	77M	10000000	0	Everyone 10+	{Strategy}	2018-07-31	2.0.2	4.0.3 and up
2040	AMC Theatres	TOOLS	3.8	120494	2.3M	10000000	0	Everyone	{Tools}	2018-06-13	2.0.7	4.1 and up
2041	Alfa-Bank (Alfa-Bank)	TRAVEL_AND_LOCAL	4.2	120373	31M	5000000	0	Everyone	{"Travel & Local"}	2018-07-31	3.19.35.999	4.0.3 and up
2042	Radarbot Free: Speed Camera Detector & Speedometer	FAMILY	4.2	120035	45M	5000000	0	Everyone	{Entertainment,"Action & Adventure"}	2018-01-04	1.0.11	4.1 and up
2043	РИА Новости	MAPS_AND_NAVIGATION	4	119685	20M	10000000	0	Everyone	{"Maps & Navigation"}	2018-07-02	18.06.p03.02	4.0.3 and up
2044	GS SHOP	GAME	4	119368	19M	10000000	0	Teen	{Action}	2017-02-21	1.1.4	2.3 and up
2045	Orfox: Tor Browser for Android	VIDEO_PLAYERS	4	119202	Varies with device	10000000	0	Everyone 10+	{"Video Players & Editors","Music & Video"}	2018-06-21	Varies with device	Varies with device
2046	The Home Depot	FAMILY	4	119173	Varies with device	10000000	0	Everyone 10+	{"Video Players & Editors","Music & Video"}	2018-06-21	Varies with device	Varies with device
2047	Ever After High™ Charmed Style	PERSONALIZATION	4.1	118459	3.3M	10000000	0	Everyone	{Personalization}	2017-10-27	4	4.1 and up
2048	Survival Prison Escape v2: Free Action Game	TOOLS	4.2	118439	16M	10000000	0	Everyone	{Tools}	2018-06-19	10.4	4.4 and up
2049	ASUS Cover for ZenFone 2	FAMILY	4.5	118285	22M	1000000	0	Teen	{Simulation}	2018-05-24	1.2.1	4.1 and up
2050	PagesJaunes - local search	GAME	4.3	118253	40M	10000000	0	Teen	{Arcade}	2018-05-03	1.4.6	4.1 and up
2051	Masha and the Bear: House Cleaning Games for Girls	LIFESTYLE	4.6	118034	Varies with device	5000000	0	Everyone	{Lifestyle}	2018-08-02	Varies with device	Varies with device
2052	Home Security Camera WardenCam - reuse old phones	HEALTH_AND_FITNESS	4.7	117925	7.0M	10000000	0	Everyone	{"Health & Fitness"}	2018-07-24	1.0.26	4.1 and up
2053	Download Accelerator Plus	TOOLS	4.4	117850	17M	10000000	0	Everyone	{Tools}	2018-05-19	1.8.0	4.1 and up
2054	Angry Birds Space HD	FAMILY	4.2	117461	Varies with device	5000000	0	Everyone	{Entertainment,"Music & Video"}	2018-06-29	Varies with device	Varies with device
2055	hellofood - Food Delivery	PRODUCTIVITY	4.3	117255	Varies with device	1000000	0	Everyone	{Productivity}	2018-08-06	Varies with device	Varies with device
2056	CBS Sports Fantasy	HEALTH_AND_FITNESS	4.6	117176	Varies with device	5000000	0	Everyone	{"Health & Fitness"}	2018-07-07	Varies with device	Varies with device
2057	Surely You Quest - Magiswords	AUTO_AND_VEHICLES	4.8	116986	35M	5000000	0	Everyone	{"Auto & Vehicles"}	2018-08-02	1.9.7	4.0.3 and up
2058	Navy Federal Credit Union	FAMILY	4.6	116973	31M	1000000	0	Everyone	{Puzzle}	2018-03-29	1.1.9.1	4.1 and up
2059	SuperPhoto - Effects & Filters	PHOTOGRAPHY	4.3	116880	2.0M	10000000	0	Everyone	{Photography}	2018-04-23	1.43.3	4.0.3 and up
2060	Transit: Real-Time Transit App	PHOTOGRAPHY	4.3	116880	2.0M	10000000	0	Everyone	{Photography}	2018-04-23	1.43.3	4.0.3 and up
2061	Beach Volleyball 3D	PHOTOGRAPHY	4.3	116769	2.0M	10000000	0	Everyone	{Photography}	2018-04-23	1.43.3	4.0.3 and up
2062	DC Super Hero Girls™	BOOKS_AND_REFERENCE	4.8	116507	5.0M	1000000	0	Teen	{"Books & Reference"}	2018-08-01	2.0.075	4.0.3 and up
2063	wikiHow: how to do anything	FOOD_AND_DRINK	4.5	116403	Varies with device	5000000	0	Everyone	{"Food & Drink"}	2018-08-01	Varies with device	Varies with device
2064	TravelPirates	LIFESTYLE	4.6	116079	3.2M	5000000	0	Everyone	{Lifestyle}	2018-05-20	5.8	2.3 and up
2065	Tasker	PERSONALIZATION	4.2	115773	Varies with device	10000000	0	Everyone	{Personalization}	2018-05-22	Varies with device	4.1 and up
2066	Ninesky Browser	HEALTH_AND_FITNESS	4.6	115721	67M	10000000	0	Everyone	{"Health & Fitness"}	2018-07-11	3.5.0	5.0 and up
2067	Key Ring: Cards Coupon & Sales	HEALTH_AND_FITNESS	4.6	115721	67M	10000000	0	Everyone	{"Health & Fitness"}	2018-07-11	3.5.0	5.0 and up
2068	Geo Tracker - GPS tracker	TOOLS	4.7	115409	Varies with device	10000000	0	Everyone	{Tools}	2018-08-06	Varies with device	Varies with device
2069	Canvas Student	GAME	4.2	115176	24M	10000000	0	Teen	{Racing}	2018-06-15	1.2.1	4.0 and up
2070	Stock Trainer: Virtual Trading (Stock Markets)	PRODUCTIVITY	4.4	115072	Varies with device	5000000	0	Everyone	{Productivity}	2018-07-31	Varies with device	Varies with device
2071	MLB Perfect Inning 2018	ENTERTAINMENT	4.1	115033	30M	10000000	0	Everyone	{Entertainment}	2018-07-02	7.5.0	5.0 and up
2072	Home & Shopping - Only in apps. 10% off + 10% off	PERSONALIZATION	4.7	114851	20M	10000000	0	Everyone	{Personalization}	2018-07-20	2.1.9	4.1 and up
2073	Bible KJV	TOOLS	4.3	114788	Varies with device	5000000	0	Everyone	{Tools}	2018-01-22	Varies with device	Varies with device
2074	love	PHOTOGRAPHY	4.1	114680	27M	10000000	0	Everyone	{Photography}	2018-02-15	1.38	4.1 and up
2075	KTB Netbank	GAME	4.5	114479	26M	5000000	0	Teen	{Card}	2017-12-20	4.7.0	3.0 and up
2076	BaBe + - Indonesian News	TOOLS	4.1	114340	28M	10000000	0	Everyone	{Tools}	2018-08-01	5.7.1	4.2 and up
2077	Friendly for Facebook	TOOLS	4.4	113951	551k	10000000	0	Everyone	{Tools}	2015-04-15	1.0.70	1.6 and up
2078	Cheap Flights & Hotels momondo	BEAUTY	4	113715	Varies with device	10000000	0	Everyone	{Beauty}	2017-08-03	Varies with device	Varies with device
2079	Assassin’s Creed Identity	FAMILY	3.5	113183	36M	5000000	0	Everyone	{Puzzle}	2017-12-15	10.6	4.1 and up
2080	TAMAGO	PERSONALIZATION	4.1	112977	13M	10000000	0	Everyone	{Personalization}	2018-05-22	3.6	4.1 and up
2081	Alipay	SPORTS	4.2	112725	Varies with device	5000000	0	Everyone	{Sports}	2018-07-31	Varies with device	Varies with device
2082	Genius Scan - PDF Scanner	FINANCE	4.2	112656	93M	5000000	0	Everyone	{Finance}	2018-07-19	3.9.0	4.1 and up
2083	Offroad Cruiser	GAME	4.3	112565	32M	1000000	0	Teen	{Action}	2018-07-21	1.1.97	4.4 and up
2084	MetaTrader 5	TOOLS	4.5	112482	2.1M	5000000	0	Everyone	{Tools}	2018-07-10	1.0.5	4.0 and up
2085	My magenta	PERSONALIZATION	4.2	112479	4.3M	10000000	0	Everyone	{Personalization}	2018-07-25	3.0.5	4.2 and up
2086	Ear Agent: Super Hearing	HEALTH_AND_FITNESS	4.2	112384	5.0M	5000000	0	Everyone	{"Health & Fitness"}	2018-02-23	2.1.0	4.1 and up
2087	Free Dating & Flirt Chat - Choice of Love	SOCIAL	4.3	112223	34M	1000000	0	Mature 17+	{Social}	2018-07-05	5.68.1	5.0 and up
2088	Siren Ringtones	FAMILY	4.4	112080	26M	10000000	0	Everyone	{Casual,"Pretend Play"}	2018-07-26	1.24	4.1 and up
2089	Dr. Rocket	SPORTS	4.3	111809	40M	10000000	0	Everyone	{Sports}	2018-02-07	1.0.21	4.1 and up
2090	Candy Bomb	FAMILY	4.6	111741	66M	5000000	0	Teen	{Simulation}	2018-02-27	5.4	4.0 and up
2091	New YAHTZEE® With Buddies Dice Game	PERSONALIZATION	4.3	111634	13M	5000000	0	Everyone	{Personalization}	2014-05-26	2.08	2.0 and up
2092	Red Bull TV: Live Sports, Music & Entertainment	FINANCE	4.1	111632	65M	1000000	0	Everyone	{Finance}	2018-06-09	5.10.1.40699	4.4 and up
2093	Marble - Temple Quest	TOOLS	4.3	111507	Varies with device	10000000	0	Everyone	{Tools}	2017-12-29	Varies with device	Varies with device
2094	Ulta Beauty	HEALTH_AND_FITNESS	4.1	111465	Varies with device	5000000	0	Everyone	{"Health & Fitness"}	2018-07-25	Varies with device	Varies with device
2095	LightInTheBox Online Shopping	HEALTH_AND_FITNESS	4.1	111462	Varies with device	5000000	0	Everyone	{"Health & Fitness"}	2018-07-25	Varies with device	Varies with device
2096	MMX Hill Dash 2 – Offroad Truck, Car & Bike Racing	HEALTH_AND_FITNESS	4.6	111455	Varies with device	5000000	0	Everyone	{"Health & Fitness"}	2018-08-05	Varies with device	Varies with device
2097	H&M	HEALTH_AND_FITNESS	4.6	111450	Varies with device	5000000	0	Everyone	{"Health & Fitness"}	2018-08-05	Varies with device	Varies with device
2098	Touch Racing 2 - Mini RC Race	FINANCE	4.6	111254	7.4M	1000000	0	Everyone	{Finance}	2018-07-03	1.8.9	4.0 and up
2099	Mupen64+AE FREE (N64 Emulator)	PHOTOGRAPHY	4.4	111066	74M	5000000	0	Everyone	{Photography}	2018-08-03	4.8.7	4.0.3 and up
2100	BURGER KING® App	FAMILY	4.5	110877	Varies with device	1000000	0	Everyone 10+	{Casual,"Action & Adventure"}	2018-03-28	Varies with device	Varies with device
2101	City Builder 2016: County Mall	SHOPPING	4.1	110425	27M	10000000	0	Everyone	{Shopping}	2018-06-18	13.6.4	4.0.3 and up
2102	Shred! Downhill Mountainbiking	FOOD_AND_DRINK	3.4	109784	64M	10000000	0	Everyone	{"Food & Drink"}	2018-08-03	4.0.30	4.0.3 and up
2103	BZ Reminder	HEALTH_AND_FITNESS	4.6	109756	78M	5000000	0	Everyone	{"Health & Fitness"}	2018-08-01	8.2.0	4.0.3 and up
2104	Lyra Virtual Assistant	PHOTOGRAPHY	4.8	109500	37M	1000000	0	Everyone	{Photography}	2018-08-02	2.18.2	4.1 and up
2105	Al Quran Al karim	GAME	4.2	109263	38M	1000000	0	Teen	{Action}	2018-07-10	1.0.144431	4.1 and up
2106	2Date Dating App, Love and matching	SHOPPING	4.3	109124	22M	10000000	0	Everyone	{Shopping}	2018-08-02	3.11.1	4.1 and up
2107	T-Mobile Visual Voicemail	FAMILY	4.2	108795	49M	10000000	0	Everyone	{Educational,"Pretend Play"}	2018-06-15	8.25.10.00	4.0.3 and up
2108	Apple Daily Apple News	FAMILY	4.2	108795	49M	10000000	0	Everyone	{Educational,"Pretend Play"}	2018-06-15	8.25.10.00	4.0.3 and up
2109	Cube Z (Pixel Zombies)	BUSINESS	4.4	108741	28M	10000000	0	Everyone	{Business}	2018-07-20	11.1.0	4.3 and up
2110	Daum Mail - Next Mail	EDUCATION	4.5	108613	Varies with device	10000000	0	Everyone	{Education}	2018-08-03	Varies with device	Varies with device
2111	Hacker’s Keyboard	SHOPPING	4.4	108592	8.3M	10000000	0	Everyone	{Shopping}	2018-07-24	4.7.5	4.1 and up
2112	Story Saver for Instagram	GAME	3.9	108336	62M	1000000	0	Everyone	{Adventure}	2016-06-27	4.0.01	4.4 and up
2113	Transformers Rescue Bots: Hero Adventures	SPORTS	4.4	108318	35M	10000000	0	Everyone	{Sports}	2018-07-09	2017.7.1	4.4 and up
2114	GUYZ - Gay Chat & Gay Dating	TOOLS	4.1	108169	Varies with device	10000000	0	Everyone	{Tools}	2018-06-25	Varies with device	Varies with device
2115	NAVITIME - Map & Transfer Navi	FAMILY	4.5	108130	40M	5000000	0	Teen	{Strategy}	2018-08-03	1.8.0	4.0 and up
2116	Brilliant	PHOTOGRAPHY	4.6	108002	Varies with device	10000000	0	Everyone	{Photography}	2018-07-26	Varies with device	Varies with device
2117	Lock Screen	GAME	3.4	107778	8.8M	10000000	0	Everyone	{Arcade}	2016-02-12	47	2.3.3 and up
2118	Counter Online FPS Game	FAMILY	4.3	107765	78M	5000000	0	Everyone 10+	{Strategy}	2018-05-25	3.1.9	4.1 and up
2119	FirstCry Baby & Kids Shopping, Fashion & Parenting	SPORTS	4.5	107724	6.5M	5000000	0	Everyone	{Sports}	2018-07-31	1004	4.0 and up
2120	QuickShortcutMaker	GAME	4.2	107497	Varies with device	1000000	0	Everyone	{Racing}	2016-02-02	Varies with device	2.3.3 and up
2121	The Wall Street Journal: Business & Market News	FAMILY	2.8	107441	32M	1000000	0	Everyone	{Casual,"Action & Adventure"}	2018-07-10	1.10.5	4.4 and up
2122	Universal AC Remote Control	SHOPPING	4.2	106798	30M	5000000	0	Everyone	{Shopping}	2018-07-23	2.25.17	4.1 and up
2123	HTC Transfer Tool	FAMILY	4.6	106750	94M	1000000	0	Everyone	{Simulation,"Action & Adventure"}	2018-06-29	1.221	4.1 and up
2124	Just A Regular Arcade	HEALTH_AND_FITNESS	4.5	106547	54M	1000000	0	Everyone	{"Health & Fitness"}	2018-07-27	18.7.1	5.0 and up
2125	Calculator	PHOTOGRAPHY	4.1	106080	35M	10000000	0	Everyone	{Photography}	2018-06-27	6.1.6	4.1 and up
2126	Omlet Chat	FAMILY	4	105954	43M	10000000	0	Teen	{Simulation}	2018-06-05	1.7.3	4.1 and up
2127	Smart Launcher Pro 3	SHOPPING	4.3	105773	Varies with device	10000000	0	Everyone	{Shopping}	2018-08-05	Varies with device	4.4 and up
2128	Egg: clicker	FAMILY	4.1	105766	48M	10000000	0	Teen	{Puzzle}	2018-05-24	2.2.2	4.4 and up
2129	VPN - Fast, Secure & Unlimited WiFi with VyprVPN	GAME	4.4	105620	61M	1000000	0	Everyone 10+	{Action}	2018-07-16	0.5.8	4.1 and up
2130	X-VPN - Free Unlimited VPN Proxy	COMMUNICATION	4.2	104990	10M	5000000	0	Everyone	{Communication}	2018-05-15	3.5.0	4.0.3 and up
2131	Weather –Simple weather forecast	MAPS_AND_NAVIGATION	4.4	104800	22M	10000000	0	Everyone	{"Maps & Navigation"}	2018-07-26	7.0.1	4.0 and up
2132	PDF Viewer & Book Reader	FAMILY	4.6	104676	2.6M	5000000	0	Everyone	{Education}	2018-07-18	1.9.7	4.0 and up
2133	Ultimate Chest Tracker	GAME	4.1	104583	37M	1000000	0	Everyone	{Arcade}	2016-08-18	3.45	2.3 and up
2134	OvuView: Ovulation and Fertility	VIDEO_PLAYERS	4.2	104551	18M	10000000	0	Everyone	{"Video Players & Editors"}	2017-12-19	1.0.10	2.2 and up
2135	Huji Cam	FOOD_AND_DRINK	4.5	104504	Varies with device	1000000	0	Everyone	{"Food & Drink"}	2018-07-31	Varies with device	Varies with device
2136	Brave Browser: Fast AdBlocker	GAME	4.3	104389	12M	5000000	0	Everyone	{Adventure}	2018-04-17	1.4.0	4.2 and up
2137	Street Panorama View	GAME	4.4	104303	Varies with device	10000000	0	Everyone	{Arcade}	2018-08-02	3.15	4.1 and up
2138	Ulysse Speedometer	SHOPPING	4.5	104068	37M	5000000	0	Teen	{Shopping}	2018-08-01	4.5.1	4.1 and up
2139	Timetable	TOOLS	4.4	103909	9.2M	5000000	0	Everyone	{Tools}	2018-05-11	2.2.7	4.3 and up
2140	Kurio - Read the Latest News	BUSINESS	4.5	103755	14M	10000000	0	Everyone	{Business}	2018-07-11	3.9.2	4.1 and up
2141	Eat24 Food Delivery & Takeout	BUSINESS	4.5	103755	14M	10000000	0	Everyone	{Business}	2018-07-11	3.9.2	4.1 and up
2142	Ticketmaster Event Tickets	HOUSE_AND_HOME	4.5	103305	Varies with device	5000000	0	Everyone	{"House & Home"}	2018-07-31	Varies with device	Varies with device
2143	Meet4U - Chat, Love, Singles!	GAME	4	103199	44M	10000000	0	Teen	{Action}	2018-08-02	1.0.7.8	4.2 and up
2144	The Visitor	ENTERTAINMENT	4.3	103078	5.6M	5000000	0	Everyone	{Entertainment}	2018-07-05	4.6.2	2.3.3 and up
2145	Foot Mercato: transfers, results, news, live	NEWS_AND_MAGAZINES	4.5	103074	Varies with device	1000000	0	Mature 17+	{"News & Magazines"}	2018-07-02	Varies with device	Varies with device
2146	FREEDOME VPN Unlimited anonymous Wifi Security	FAMILY	4.3	103064	5.6M	5000000	0	Everyone	{Entertainment}	2018-07-05	4.6.2	2.3.3 and up
2147	Masha and The Bear	PERSONALIZATION	4.5	102923	18M	1000000	0	Everyone	{Personalization}	2018-07-10	2.1.2	5.0 and up
2148	Fancy	MEDICAL	4.8	102858	9.8M	1000000	0	Everyone	{Medical}	2018-08-03	2.2.4	4.3 and up
2149	Big Days - Events Countdown	PRODUCTIVITY	4.6	102594	15M	5000000	0	Everyone	{Productivity}	2018-07-23	2.30.1	4.1 and up
2150	Glitch Fixers: Powerpuff Girls	PRODUCTIVITY	4.2	102451	Varies with device	10000000	0	Everyone	{Productivity}	2018-03-15	Varies with device	Varies with device
2151	Download Video Free	MAPS_AND_NAVIGATION	4.4	102248	Varies with device	5000000	0	Everyone	{"Maps & Navigation"}	2018-08-01	Varies with device	Varies with device
2152	What’s Your Story?™ ft Charmed	FAMILY	4.4	102215	42M	1000000	0	Teen	{"Role Playing"}	2018-06-25	3.1	4.0.3 and up
2153	Superhero Doctor 2 -ER Surgery	GAME	4.6	102107	Varies with device	5000000	0	Everyone 10+	{Strategy}	2018-07-31	1.2.2	Varies with device
2154	Adobe Premiere Clip	LIFESTYLE	4.4	101957	8.2M	5000000	0	Everyone	{Lifestyle}	2018-04-23	2.11.0	4.0.3 and up
2155	Find a Way: Addictive Puzzle	SHOPPING	4.4	101883	13M	10000000	0	Everyone	{Shopping}	2018-08-03	6.9.2	5.0 and up
2156	Chart - Myanmar Keyboard	GAME	4.3	101762	11M	1000000	0	Teen	{Action}	2015-06-11	2.0.0	3.0 and up
2157	Living Smart Home	TOOLS	4.5	101738	10M	1000000	0	Everyone	{Tools}	2018-07-26	2.2.82	4.0 and up
2158	We Bare Bears Match3 Repairs	GAME	4.6	101686	31M	10000000	0	Everyone	{Puzzle}	2018-08-04	1.8.2	4.1 and up
2205	M Launcher -Marshmallow 6.0	FAMILY	4.6	94989	74M	5000000	0	Teen	{Simulation}	2018-04-22	8.6	4.0 and up
2159	Domofond Real Estate. Buy, rent an apartment.	SPORTS	4.6	101455	6.2M	5000000	0	Everyone	{Sports}	2018-08-03	2.24.2.0	4.0.3 and up
2160	Jagobd - Bangla TV(Official)	PRODUCTIVITY	4.7	101163	6.2M	5000000	0	Everyone	{Productivity}	2018-07-31	1.4.5.2	4.1 and up
2161	Stop Smoking - EasyQuit free	FINANCE	4.5	100997	33M	5000000	0	Everyone	{Finance}	2018-07-27	8.44.2	5.0 and up
2162	ING Banking	WEATHER	3.9	100994	54M	5000000	0	Everyone	{Weather}	2018-07-13	5.9.7	4.1 and up
2163	FANDOM for: GTA	GAME	4.6	100805	50M	1000000	2.99	Teen	{Action}	2014-12-02	1.85	2.3 and up
2164	Kroger	GAME	4.6	100609	52M	1000000	0	Teen	{Action}	2018-07-16	0.5.4	6.0 and up
2165	TerraGenesis - Space Colony	HEALTH_AND_FITNESS	4.2	100406	Varies with device	10000000	0	Everyone	{"Health & Fitness"}	2018-06-30	Varies with device	Varies with device
2166	HD Camera - Best Cam with filters & panorama	HEALTH_AND_FITNESS	4.2	100406	Varies with device	10000000	0	Everyone	{"Health & Fitness"}	2018-06-30	Varies with device	Varies with device
2167	ezETC (ETC balance inquiry, meter trial, real-time traffic)	PHOTOGRAPHY	4.1	100179	96M	10000000	0	Everyone	{Photography}	2018-05-17	2.52	4.0.3 and up
2168	Messenger Messenger	PERSONALIZATION	4.3	100130	Varies with device	5000000	0	Everyone	{Personalization}	2018-06-25	Varies with device	Varies with device
2169	Thuglife Video Maker	MEDICAL	4.9	100082	3.7M	1000000	0	Everyone	{Medical}	2018-07-09	1.2.2	4.1 and up
2170	Meme Creator	COMMUNICATION	3.7	99559	Varies with device	10000000	0	Everyone	{Communication}	2018-07-30	Varies with device	Varies with device
2171	DEER HUNTER CHALLENGE	TOOLS	4.3	99290	3.9M	5000000	0	Everyone	{Tools}	2017-12-05	3.1 Release b2	2.3 and up
2172	Moto File Manager	EDUCATION	4.5	99020	18M	1000000	0	Everyone	{Education}	2018-08-02	5.0.4	5.0 and up
2173	VUE: video editor & camcorder	EDUCATION	4.5	99020	18M	1000000	0	Everyone	{Education}	2018-08-02	5.0.4	5.0 and up
2174	AndStream - Streaming Download	EDUCATION	4.5	99020	18M	1000000	0	Everyone	{Education}	2018-08-02	5.0.4	5.0 and up
2175	AT&T U-verse	VIDEO_PLAYERS	4.6	98819	27M	5000000	0	Everyone	{"Video Players & Editors"}	2018-08-06	1.251.54	4.3 and up
2176	YouTube TV - Watch & Record Live TV	PHOTOGRAPHY	4.6	98717	59M	5000000	0	Everyone	{Photography}	2018-08-01	5.13.1	5.0 and up
2177	Burn Your Fat With Me! FG	PHOTOGRAPHY	4.6	98716	59M	5000000	0	Everyone	{Photography}	2018-08-01	5.13.1	5.0 and up
2178	Hair saloon - Spa salon	PHOTOGRAPHY	4.6	98716	59M	5000000	0	Everyone	{Photography}	2018-08-01	5.13.1	5.0 and up
2179	RC Monster Truck - Offroad Driving Simulator	PHOTOGRAPHY	4.6	98716	59M	5000000	0	Everyone	{Photography}	2018-08-01	5.13.1	5.0 and up
2180	Stickman Legends: Shadow Wars	TRAVEL_AND_LOCAL	3.9	98585	37M	10000000	0	Everyone	{"Travel & Local"}	2018-07-16	5.0.4	4.4 and up
2181	Trucker Path – Truck Stops & Weigh Stations	ENTERTAINMENT	4.2	98509	Varies with device	5000000	0	Everyone	{Entertainment}	2018-06-28	Varies with device	Varies with device
2182	Map My Fitness Workout Trainer	FAMILY	4.4	98324	70M	1000000	0	Everyone	{Simulation}	2018-07-28	1.19.1	4.1 and up
2183	Bounce Classic	GAME	4.4	98123	40M	10000000	0	Teen	{Arcade}	2018-05-25	1.7.0	4.1 and up
2184	Star Wars ™: DIRTY	PERSONALIZATION	4.2	97890	14M	1000000	2.49	Everyone	{Personalization}	2016-08-24	5.7.8	2.3 and up
2185	Lose Belly Fat in 30 Days - Flat Stomach	PERSONALIZATION	4.2	97890	14M	1000000	2.49	Everyone	{Personalization}	2016-08-24	5.7.8	2.3 and up
2186	Blur Image - DSLR focus effect	BUSINESS	4.2	97702	Varies with device	5000000	0	Everyone	{Business}	2018-07-11	Varies with device	Varies with device
2187	Kids Balloon Pop Game Free 🎈	DATING	4.1	97699	7.9M	1000000	0	Mature 17+	{Dating}	2018-07-10	1.23	4.0.3 and up
2188	Deck Advisor for CR	DATING	4.1	97684	7.9M	1000000	0	Mature 17+	{Dating}	2018-07-10	1.23	4.0.3 and up
2189	Snapp	GAME	4.1	97209	6.7M	1000000	0	Everyone	{Board}	2018-01-14	1.41	4.0.3 and up
2190	Nigeria News NAIJ.com	FAMILY	4.5	97071	87M	5000000	0	Teen	{Strategy}	2018-04-03	0.1.219	2.3.3 and up
2191	Socratic - Math Answers & Homework Help	FAMILY	4.5	96658	26M	1000000	0	Everyone 10+	{"Role Playing"}	2015-09-05	2.0.5	3.0 and up
2192	Cops N Robbers	BOOKS_AND_REFERENCE	4.5	96419	Varies with device	5000000	0	Everyone	{"Books & Reference"}	2018-05-05	Varies with device	Varies with device
2193	CYANOGEN. Rent, buy an apartment, a room, a cottage 3+	FAMILY	4.3	96045	25M	5000000	0	Everyone	{Action,"Action & Adventure"}	2016-07-26	1.0.4	4.1 and up
2194	App Lock: Locker w/ fingerprint, Parental Control	GAME	4.7	96028	59M	1000000	0	Teen	{Arcade}	2018-05-28	Varies with device	4.0 and up
2195	Nose Doctor X: Booger Mania	BUSINESS	4.6	95912	Varies with device	5000000	0	Everyone	{Business}	2018-07-30	Varies with device	Varies with device
2196	Trading 212 - Forex, Stocks, CFDs	LIFESTYLE	4.3	95905	33M	10000000	0	Everyone	{Lifestyle}	2018-07-30	4.1.0	4.1 and up
2197	TheFork - Restaurants booking and special offers	LIFESTYLE	4.3	95904	33M	10000000	0	Everyone	{Lifestyle}	2018-07-30	4.1.0	4.1 and up
2198	Sky Streaker - Gumball	LIFESTYLE	4.4	95736	Varies with device	10000000	0	Everyone	{Lifestyle}	2018-07-30	Varies with device	Varies with device
2199	Motorola Assist	LIFESTYLE	4.4	95557	16M	10000000	0	Everyone	{Lifestyle}	2018-07-23	7.0.8	4.0.3 and up
2200	mysms SMS Text Messaging Sync	FAMILY	3.9	95537	58M	10000000	0	Everyone	{Educational,Education}	2018-07-13	2.2.54	4.4 and up
2201	Solitaire: Decked Out Ad Free	SHOPPING	4.3	95520	15M	10000000	0	Teen	{Shopping}	2018-08-03	5.3.1	4.1 and up
2202	Avast Wi-Fi Finder	SHOPPING	4.3	95520	15M	10000000	0	Teen	{Shopping}	2018-08-03	5.3.1	4.1 and up
2203	Ebates: Cash Back, Coupons, Rewards & Savings	HEALTH_AND_FITNESS	4.6	95201	61M	5000000	0	Everyone	{"Health & Fitness"}	2018-07-09	2.4.1	4.1 and up
2204	Fancy Widgets	TOOLS	4.4	95080	3.1M	10000000	0	Everyone	{Tools}	2018-08-03	1.6.22	4.1 and up
2206	Abs workout 7 minutes	FAMILY	3.9	94910	44M	10000000	0	Everyone	{Action,"Action & Adventure"}	2017-01-10	1.12	4.3 and up
2207	Squid - Take Notes & Markup PDFs	GAME	4.1	94761	17M	10000000	0	Teen	{Action}	2017-02-21	1.1.4	2.3 and up
2208	Horn, free country requirements	GAME	4.1	94661	Varies with device	1000000	0	Teen	{Action}	2018-06-08	1.4.0	4.4 and up
2209	Golf GPS by SwingxSwing	TOOLS	4.3	94427	Varies with device	10000000	0	Everyone	{Tools}	2018-08-02	Varies with device	Varies with device
2210	Five Tries At Love Dating Sim	FAMILY	4	94308	79M	10000000	0	Everyone	{Simulation}	2016-12-25	4.2	2.3.3 and up
2211	FC Bayern Munich	SHOPPING	4.3	94294	30M	10000000	0	Everyone	{Shopping}	2018-07-23	2.25.17	4.1 and up
2212	Once Upon a Tower	SHOPPING	4.6	94205	6.5M	1000000	0	Everyone	{Shopping}	2018-06-13	5.6.8	4.4 and up
2213	Bu the Baby Bunny - Cute pet care game	SHOPPING	4.6	94205	6.5M	1000000	0	Everyone	{Shopping}	2018-06-13	5.6.8	4.4 and up
2214	Profile Tracker - Who Viewed My Facebook Profile	COMICS	3.2	93965	15M	5000000	0	Teen	{Comics}	2018-07-03	6.3.0	4.0.3 and up
2215	Mingle2 - Free Online Dating & Singles Chat Rooms	COMMUNICATION	4.6	93930	14M	5000000	0	Everyone	{Communication}	2018-08-01	4.0.8	4.2 and up
2216	Paint Hit	FAMILY	4	93898	44M	10000000	0	Everyone	{Casual}	2017-05-26	1.1	4.1 and up
2217	Cinematic Cinematic	FAMILY	4.4	93870	79M	1000000	0	Everyone	{Strategy}	2016-02-03	1.0.6	4.0 and up
2218	Firefox Focus: The privacy browser	COMMUNICATION	4.4	93825	11M	5000000	0	Everyone	{Communication}	2018-07-05	2.17.3	4.1 and up
2219	Video.Guru - Video Maker	PHOTOGRAPHY	4.2	93726	9.2M	5000000	0	Everyone	{Photography}	2018-07-08	2.0.18	4.3 and up
2220	El Falı	NEWS_AND_MAGAZINES	4.3	93708	Varies with device	5000000	0	Everyone	{"News & Magazines"}	2018-07-09	Varies with device	Varies with device
2221	Web Browser & Explorer	HEALTH_AND_FITNESS	4.5	93691	Varies with device	5000000	0	Everyone	{"Health & Fitness"}	2018-07-05	Varies with device	Varies with device
2222	Klara weather	VIDEO_PLAYERS	4	93638	7.3M	10000000	0	Mature 17+	{"Video Players & Editors"}	2018-07-11	3.2.2	4.1 and up
2223	Redfin Real Estate	GAME	4.2	93608	Varies with device	10000000	0	Everyone	{Action}	2018-02-09	Varies with device	Varies with device
2224	Infinite Painter	GAME	4.4	93033	98M	5000000	0	Teen	{Strategy}	2018-08-04	1.250.078	4.0.3 and up
2225	PokeType - Dex	TOOLS	4.7	92958	36M	1000000	0	Everyone	{Tools}	2018-07-27	1.13.0	5.0 and up
2226	BBVA Spain	SPORTS	4.6	92522	56M	5000000	0	Everyone	{Sports}	2018-07-26	4.0.14	4.1 and up
2227	The postal bank	ENTERTAINMENT	3.8	92058	12M	10000000	0	Teen	{Entertainment}	2018-07-20	4.8.6	4.1 and up
2228	Floor Plan Creator	ENTERTAINMENT	3.8	92058	12M	10000000	0	Teen	{Entertainment}	2018-07-20	4.8.6	4.1 and up
2229	ABC Kids - Tracing & Phonics	FAMILY	4.7	92010	5.9M	1000000	0	Everyone	{Strategy}	2018-07-04	1.4.8	4.2 and up
2230	Dr. Panda Town	SPORTS	4.1	91935	39M	10000000	0	Everyone	{Sports}	2018-04-26	2.1.3	4.1 and up
2231	Calcy IV	GAME	4.1	91667	27M	1000000	0	Everyone	{Arcade}	2018-07-24	3.3	2.3 and up
2232	Championat	FAMILY	3.8	91645	36M	10000000	0	Teen	{Simulation}	2018-05-08	1.94	4.1 and up
2233	【Miku AR Camera】Mikuture	BOOKS_AND_REFERENCE	4.1	91615	23M	5000000	0	Mature 17+	{"Books & Reference"}	2018-06-29	3.12	4.1 and up
2234	Telemundo Deportes - Live	PRODUCTIVITY	4.5	91397	14M	1000000	0	Everyone	{Productivity}	2018-07-03	3.4.4	5.0 and up
2235	Telemundo Deportes - En Vivo	FOOD_AND_DRINK	4.5	91359	27M	1000000	0	Everyone	{"Food & Drink"}	2018-07-05	2.0.3	4.4 and up
2236	PBS KIDS Video	TOOLS	4.2	91186	6.3M	5000000	0	Everyone	{Tools}	2018-05-22	2.0.9	4.0 and up
2237	Hunting Safari 3D	FAMILY	4.4	91171	36M	1000000	0	Everyone	{"Role Playing"}	2018-08-03	1.0.8	4.1 and up
2238	Bridge Constructor Stunts FREE	SPORTS	4.3	91035	Varies with device	5000000	0	Everyone	{Sports}	2018-08-04	Varies with device	5.0 and up
2239	Sweet Baby Girl Newborn Baby	SPORTS	4.3	91033	Varies with device	5000000	0	Everyone	{Sports}	2018-08-04	Varies with device	5.0 and up
2240	Luxury Car Simulator	SPORTS	4.3	91033	Varies with device	5000000	0	Everyone	{Sports}	2018-08-04	Varies with device	5.0 and up
2241	Lifetime - Watch Full Episodes & Original Movies	SPORTS	4.3	91033	Varies with device	5000000	0	Everyone	{Sports}	2018-08-04	Varies with device	5.0 and up
2242	Butterfly Live Wallpaper	SPORTS	4.3	91031	Varies with device	5000000	0	Everyone	{Sports}	2018-08-04	Varies with device	5.0 and up
2243	Fit the Fat 2	SPORTS	4.3	91031	Varies with device	5000000	0	Everyone	{Sports}	2018-08-04	Varies with device	5.0 and up
2244	Phogy, 3D Camera	SPORTS	4.3	91031	Varies with device	5000000	0	Everyone	{Sports}	2018-08-04	Varies with device	5.0 and up
2245	iSniper 3D Arctic Warfare	SPORTS	4.3	91031	Varies with device	5000000	0	Everyone	{Sports}	2018-08-04	Varies with device	5.0 and up
2246	The wall	TOOLS	4.4	90831	4.3M	10000000	0	Everyone	{Tools}	2017-06-18	3.1.00	4.2 and up
2247	Urbanspoon Restaurant Reviews	EDUCATION	4.4	90481	Varies with device	5000000	0	Everyone	{Education}	2018-07-27	Varies with device	Varies with device
2248	Intesa Sanpaolo Mobile	EDUCATION	4.4	90481	Varies with device	5000000	0	Everyone	{Education}	2018-07-27	Varies with device	Varies with device
2249	Newegg Mobile	BOOKS_AND_REFERENCE	4.6	90468	5.9M	5000000	0	Everyone	{"Books & Reference"}	2018-05-27	1.91180527	2.3 and up
2250	MSN Sports - Scores & Schedule	GAME	4.3	90415	84M	10000000	0	Everyone	{Arcade}	2018-07-24	1.0.20	4.1 and up
2251	Ghost Detector	FOOD_AND_DRINK	4.6	90242	19M	5000000	0	Everyone	{"Food & Drink"}	2018-07-31	9.15.0.2020	5.0 and up
2252	MTV	GAME	4	90218	97M	1000000	0	Teen	{Strategy}	2018-08-03	1.8.225278	6.0 and up
2253	Seamless Food Delivery/Takeout	SOCIAL	4.4	90082	8.8M	1000000	0	Everyone	{Social}	2018-05-22	2.44	4.1 and up
2254	Hide App, Private Dating, Safe Chat - PrivacyHider	FOOD_AND_DRINK	4.4	90042	Varies with device	10000000	0	Everyone	{"Food & Drink"}	2018-07-18	Varies with device	Varies with device
2255	Auto Background Changer	FAMILY	4.4	89947	22M	5000000	0	Everyone 10+	{Strategy}	2018-02-09	1.8.2	4.0 and up
2256	Castle Defense 2	WEATHER	4.6	89868	Varies with device	1000000	0	Everyone	{Weather}	2018-06-12	Varies with device	Varies with device
2257	Motocross Mayhem	PERSONALIZATION	4.2	89342	29M	10000000	0	Everyone	{Personalization}	2018-01-30	1.13	4.1 and up
2258	DJ Music Pad	TOOLS	4.7	88993	1.5M	10000000	0	Everyone	{Tools}	2018-06-10	3.2.6	2.3 and up
2259	DStv Now	GAME	4.1	88941	34M	1000000	0	Teen	{Action}	2016-07-26	3.1.7	4.0 and up
2260	Kingdoms at War: Hardcore PVP	GAME	4.2	88901	73M	10000000	0	Teen	{Action}	2018-05-24	11.0.0	4.0 and up
2261	Webull - Stock Quotes & Free Stock Trading	PHOTOGRAPHY	4	88860	6.1M	5000000	0	Everyone	{Photography}	2017-04-06	6.2.9	2.3 and up
2262	JOANN - Crafts & Coupons	TOOLS	4.1	88675	9.6M	5000000	0	Everyone	{Tools}	2018-07-24	6.0.1	4.0 and up
2263	Samsung SMART CAMERA App	SOCIAL	4	88486	Varies with device	5000000	0	Mature 17+	{Social}	2018-03-23	Varies with device	Varies with device
2264	Download Blazer	COMMUNICATION	4.2	88427	5.1M	5000000	0	Everyone	{Communication}	2018-01-06	5.403	4.0.3 and up
2265	Free games: Masha and the Bear	ENTERTAINMENT	4.3	88185	Varies with device	10000000	0	Mature 17+	{Entertainment}	2018-06-20	Varies with device	Varies with device
2266	Super Jabber Jump 3	ENTERTAINMENT	4.3	88185	Varies with device	10000000	0	Mature 17+	{Entertainment}	2018-06-20	Varies with device	Varies with device
2267	ClanPlay: Community and Tools for Gamers	ENTERTAINMENT	4.3	88185	Varies with device	10000000	0	Mature 17+	{Entertainment}	2018-06-20	Varies with device	Varies with device
2268	Cash App	BUSINESS	4.2	88073	Varies with device	10000000	0	Everyone	{Business}	2018-07-09	Varies with device	Varies with device
2269	Do Not Disturb! 2 - Challenge Your Prank Skills!	FINANCE	4.6	87951	68M	5000000	0	Everyone	{Finance}	2018-07-23	9.7.0	4.1 and up
2270	ViewRanger - Hike, Ride or Walk	BOOKS_AND_REFERENCE	4.2	87919	Varies with device	10000000	0	Teen	{"Books & Reference"}	2018-05-28	Varies with device	Varies with device
2271	Family Album Mitene: Private Photo & Video Sharing	BOOKS_AND_REFERENCE	4.2	87873	Varies with device	10000000	0	Teen	{"Books & Reference"}	2018-05-28	Varies with device	Varies with device
2272	Kawaii Easy Drawing : How to draw Step by Step	GAME	4.6	87766	12M	1000000	4.99	Everyone	{Action}	2016-07-19	r2.5.0.3a	2.3 and up
2273	Draw Color by Number - Sandbox Pixel Art	FAMILY	3.8	87734	32M	10000000	0	Teen	{Entertainment}	2018-07-19	16.0.0.437	4.1 and up
2274	MiniInTheBox Online Shopping	ENTERTAINMENT	3.8	87723	32M	10000000	0	Teen	{Entertainment}	2018-07-19	16.0.0.437	4.1 and up
2275	ASUS Sound Recorder	ART_AND_DESIGN	4.7	87510	8.7M	5000000	0	Everyone	{"Art & Design"}	2018-08-01	1.2.4	4.0.3 and up
2276	NCAA March Madness Live	MEDICAL	4.7	87418	14M	1000000	0	Everyone	{Medical}	2018-07-16	2.25.0	4.4 and up
2277	Photo Background Changer 2018 - Blur Background	MEDICAL	4.7	87418	14M	1000000	0	Everyone	{Medical}	2018-07-16	2.25.0	4.4 and up
2278	EZ Video Download for Facebook	ENTERTAINMENT	3.4	87384	Varies with device	10000000	0	Everyone	{Entertainment}	2016-09-14	Varies with device	Varies with device
2279	Bike 3D Configurator	PERSONALIZATION	4.4	87300	Varies with device	1000000	0	Everyone	{Personalization}	2015-03-17	2.32	Varies with device
2280	Mahjong	TOOLS	4.5	87055	Varies with device	10000000	0	Everyone	{Tools}	2017-01-03	Varies with device	Varies with device
2281	Anno: Build an Empire	FAMILY	4.4	87045	99M	10000000	0	Everyone	{Casual,"Action & Adventure"}	2018-06-05	2.0.1	4.0.3 and up
2282	Network Signal Info	FAMILY	4.4	86961	99M	10000000	0	Everyone	{Casual,"Action & Adventure"}	2018-06-05	2.0.1	4.0.3 and up
2283	Gun Mod: Guns in Minecraft PE	FAMILY	4.4	86961	99M	10000000	0	Everyone	{Casual,"Action & Adventure"}	2018-06-05	2.0.1	4.0.3 and up
2284	Drift Legends	SOCIAL	4.2	86956	24M	1000000	0	Mature 17+	{Social}	2018-08-03	5.0.109	4.4 and up
2285	My Little Pony Rainbow Runners	PERSONALIZATION	4.2	86743	Varies with device	5000000	0	Everyone	{Personalization}	2016-11-01	Varies with device	Varies with device
2286	WebComics	PERSONALIZATION	4.3	86481	8.6M	10000000	0	Everyone	{Personalization}	2018-01-31	4.8.3	4.0 and up
2287	GPS Map Free	PRODUCTIVITY	4.2	86172	13M	1000000	0	Everyone	{Productivity}	2016-02-01	1.1.7	4.0 and up
2288	FidMe Loyalty Cards & Deals at Grocery Supermarket	GAME	4.3	85882	23M	10000000	0	Everyone	{Arcade}	2017-11-07	6.6.3106	2.3 and up
2289	Skip-Bo™	SHOPPING	4.6	85858	Varies with device	10000000	0	Everyone	{Shopping}	2018-07-30	Varies with device	Varies with device
2290	Learn to Speak English	BOOKS_AND_REFERENCE	4.1	85842	37M	5000000	0	Everyone	{"Books & Reference"}	2018-06-25	5.0.6	4.0 and up
2291	Slickdeals: Coupons & Shopping	BOOKS_AND_REFERENCE	4.1	85842	37M	5000000	0	Everyone	{"Books & Reference"}	2018-06-25	5.0.6	4.0 and up
2292	Safeway	SHOPPING	4.6	85782	Varies with device	10000000	0	Everyone	{Shopping}	2018-07-30	Varies with device	Varies with device
2293	Calculator ++	SPORTS	3.8	85763	21M	1000000	0	Everyone	{Sports}	2015-08-24	2.8.0.17	3.0 and up
2294	Picture Grid Builder	TOOLS	4	85659	27M	5000000	0	Everyone	{Tools}	2018-02-25	1.51	3.0 and up
2295	HISTORY: Watch TV Show Full Episodes & Specials	FAMILY	3.9	85578	Varies with device	10000000	0	Teen	{Entertainment}	2018-08-01	Varies with device	Varies with device
2296	OK cashbag [point of pleasure]	TOOLS	4.6	85496	5.8M	1000000	0	Everyone	{Tools}	2018-02-14	1.6.2	4.0.3 and up
2297	Orbitz - Hotels, Flights & Package Deals	FAMILY	4.5	85484	Varies with device	1000000	0	Everyone	{Puzzle,"Brain Games"}	2018-08-02	2.17.1	4.1 and up
2298	Couple - Relationship App	GAME	4.3	85468	36M	1000000	0.99	Everyone	{Arcade}	2018-06-08	2.4.1.485300	4.0.3 and up
2299	Moto Voice	GAME	3.9	85410	39M	10000000	0	Everyone 10+	{Racing}	2017-09-20	20170920	4.1 and up
2300	Plants vs. Zombies™ Watch Face	TOOLS	4.5	85387	5.4M	1000000	0	Everyone	{Tools}	2018-07-03	2.1.54	4.0 and up
2301	Love Sticker	EDUCATION	4.6	85375	21M	5000000	0	Everyone	{Education}	2018-07-27	5.0.0	4.1 and up
2302	Pink Roses Live Wallpaper	EDUCATION	4.6	85375	21M	5000000	0	Everyone	{Education}	2018-07-27	5.0.0	4.1 and up
2303	Skype Lite - Free Video Call & Chat	EDUCATION	4.6	85375	21M	5000000	0	Everyone	{Education}	2018-07-27	5.0.0	4.1 and up
2304	Blood Pressure	GAME	3.9	85317	4.5M	5000000	0	Everyone	{Board}	2018-01-15	1.54	4.0.3 and up
2305	DELISH KITCHEN - FREE recipe movies make food fun and easy!	GAME	3.9	85278	23M	1000000	0	Mature 17+	{Music}	2018-07-17	1.8.0716	4.0.3 and up
2306	Collage&Add Stickers papelook	BUSINESS	4.3	85185	29M	5000000	0	Everyone	{Business}	2018-07-17	3.4.2	5.0 and up
2307	Monster Fishing 2018	TOOLS	4.7	85079	2.8M	1000000	0	Everyone	{Tools}	2018-07-17	1.0.4	2.3 and up
2308	Turbo Download Manager (and Browser)	FAMILY	4.5	85015	46M	1000000	0	Everyone 10+	{Strategy}	2018-08-01	1.03.06	4.0 and up
2309	AT&T Navigator: Maps, Traffic	NEWS_AND_MAGAZINES	4.4	84957	Varies with device	1000000	0	Everyone 10+	{"News & Magazines"}	2018-01-13	Varies with device	Varies with device
2310	Word Search multilingual	GAME	4.1	84911	71M	10000000	0	Everyone	{Arcade}	2018-07-19	2.5.0	4.1 and up
2311	Fun Texas Hold’em Poker	PERSONALIZATION	3.5	84779	8.5M	5000000	0	Everyone	{Personalization}	2018-06-04	2.4	4.0 and up
2312	Farming Simulator 16	FAMILY	4.7	84389	48M	1000000	0	Everyone	{"Role Playing"}	2018-08-05	1.375	4.0.3 and up
2313	Golden Launcher	EDUCATION	4.4	84311	41M	5000000	0	Everyone	{Education}	2018-07-25	2.6.6	4.1 and up
2314	Regal Cinemas	EDUCATION	4.4	84309	41M	5000000	0	Everyone	{Education}	2018-07-25	2.6.6	4.1 and up
2315	Anime X Wallpaper	FAMILY	4.6	84114	23M	500000	0.99	Everyone 10+	{Puzzle}	2018-07-05	1.13.108869	2.3.3 and up
2316	Calorie Counter & Diet Tracker	FAMILY	4.3	83977	11M	500000	0	Everyone	{Casual}	2012-11-08	1.2.2	2.1 and up
2317	POGO Games	GAME	4.4	83891	48M	10000000	0	Everyone	{Action}	2018-07-19	3.1	4.0 and up
2318	N Launcher - Nougat 7.0	FAMILY	4	83875	43M	1000000	0	Everyone	{Simulation}	2017-09-08	1.6.1	2.3.3 and up
2319	Snag - Jobs Hiring Now	GAME	3.8	83671	30M	10000000	0	Everyone 10+	{Racing}	2018-05-04	9	4.1 and up
2320	Might & Magic: Elemental Guardians	NEWS_AND_MAGAZINES	4.2	83558	Varies with device	5000000	0	Everyone	{"News & Magazines"}	2018-07-18	Varies with device	Varies with device
2321	Mad Skills Motocross	SPORTS	4.3	83545	23M	5000000	0	Everyone	{Sports}	2018-07-31	1.193	4.0 and up
2322	MLB TAP SPORTS BASEBALL 2018	SOCIAL	4.2	83488	Varies with device	5000000	0	Everyone	{Social}	2018-07-24	Varies with device	Varies with device
2323	League of Stickman 2018- Ninja Arena PVP(Dreamsky)	SOCIAL	4.2	83488	Varies with device	5000000	0	Everyone	{Social}	2018-07-24	Varies with device	Varies with device
2324	Girly Lock Screen Wallpaper with Quotes	SOCIAL	4.2	83474	Varies with device	5000000	0	Everyone	{Social}	2018-07-24	Varies with device	Varies with device
2325	Fuel Rewards® program	FAMILY	4.1	83427	16M	1000000	0	Everyone	{Simulation}	2015-01-30	2.6	4.1 and up
2326	Supermarket Cashier Kids Games	COMMUNICATION	4.2	83239	14M	5000000	0	Everyone	{Communication}	2018-04-19	3.0.4	4.0 and up
2327	Chef - Recipes & Cooking	COMMUNICATION	4.2	83239	14M	5000000	0	Everyone	{Communication}	2018-04-19	3.0.4	4.0 and up
2328	el	SPORTS	4.2	82883	Varies with device	5000000	0	Everyone	{Sports}	2018-07-30	Varies with device	Varies with device
2329	Snapfish	SPORTS	4.2	82883	Varies with device	5000000	0	Everyone	{Sports}	2018-07-30	Varies with device	Varies with device
2330	Yahoo Sports - scores, stats, news, & highlights	SPORTS	4.2	82882	Varies with device	5000000	0	Everyone	{Sports}	2018-07-30	Varies with device	Varies with device
2331	edX - Online Courses by Harvard, MIT & more	SPORTS	4.2	82882	Varies with device	5000000	0	Everyone	{Sports}	2018-07-30	Varies with device	Varies with device
2332	Learn Spanish - Español	SPORTS	4.2	82857	Varies with device	5000000	0	Everyone	{Sports}	2018-07-30	Varies with device	Varies with device
2333	Lost Journey (Dreamsky)	GAME	4.1	82827	20M	10000000	0	Teen	{Arcade}	2018-07-13	1.1.5	4.0 and up
2334	True Contact - Real Caller ID	FAMILY	4.3	82499	Varies with device	5000000	0	Everyone	{Entertainment,"Music & Video"}	2018-07-05	Varies with device	4.4 and up
2335	RocketDial Dialer & Contacts	FAMILY	4.3	82471	Varies with device	5000000	0	Everyone	{Entertainment,"Music & Video"}	2018-07-05	Varies with device	4.4 and up
2336	GPS Speedometer - Trip Meter - Altimeter	FAMILY	4.3	82471	Varies with device	5000000	0	Everyone	{Entertainment,"Music & Video"}	2018-07-05	Varies with device	4.4 and up
2337	ES App Locker	LIFESTYLE	4.5	82145	30M	50000000	0	Everyone	{Lifestyle}	2018-07-05	10.19.0.0	4.4 and up
2338	Strawberry Shortcake Ice Cream Island	FAMILY	4.2	82005	45M	10000000	0	Everyone 10+	{Action,"Action & Adventure"}	2017-10-24	1.2.1	4.4 and up
2339	BeyondPod Podcast Manager	TOOLS	3.5	81747	9.1M	10000000	0	Everyone	{Tools}	2018-05-26	3.8.2	4.1 and up
2340	EZCast – Cast Media to TV	TOOLS	4.3	81668	Varies with device	5000000	0	Everyone	{Tools}	2016-12-26	Varies with device	Varies with device
2341	Puzzle Alarm Clock ⏰	PRODUCTIVITY	4.7	81614	6.6M	500000	2.99	Everyone	{Productivity}	2018-07-11	Pro 1.1.4.1	4.0 and up
2342	Mirror - Zoom & Exposure -	FAMILY	3.9	81543	Varies with device	10000000	0	Everyone	{Casual,"Pretend Play"}	2018-07-19	Varies with device	Varies with device
2343	Alzashop.com	PRODUCTIVITY	4.5	81502	Varies with device	1000000	0	Everyone	{Productivity}	2018-03-29	Varies with device	Varies with device
2344	BigOven Recipes, Meal Planner, Grocery List & More	PHOTOGRAPHY	4.5	81219	2.6M	10000000	0	Everyone	{Photography}	2015-06-14	1.4.0	4.1 and up
2345	Selfie Camera: Beauty Camera, Photo Editor,Collage	FAMILY	4.5	81001	85M	1000000	0	Everyone	{Puzzle}	2018-04-27	2.15.2	4.1 and up
2346	Crack Attack	SOCIAL	4	80987	25M	5000000	0	Teen	{Social}	2018-07-30	2.2.4	4.4 and up
2347	Futbol24	FAMILY	4.4	80927	27M	1000000	0	Everyone	{Entertainment}	2018-07-31	7.2.5	4.0 and up
2348	Rabo Banking	FINANCE	4.5	80904	16M	5000000	0	Everyone	{Finance}	2018-07-05	5.7	4.1 and up
2349	Block Gun 3D: Call of Destiny	SPORTS	4.2	80900	21M	1000000	0	Everyone	{Sports}	2018-07-25	7.1.7.4	4.4 and up
2350	Transfer	PRODUCTIVITY	3.7	80847	Varies with device	50000000	0	Everyone	{Productivity}	2018-07-18	Varies with device	5.0 and up
2351	Bus Driver 3D: Hill Station	PRODUCTIVITY	3.7	80816	Varies with device	50000000	0	Everyone	{Productivity}	2018-07-18	Varies with device	5.0 and up
2352	Prana Breath: Calm & Meditate	BUSINESS	4.2	80805	Varies with device	5000000	0	Everyone	{Business}	2018-02-26	Varies with device	4.0.3 and up
2353	Bubble	BUSINESS	4.2	80805	Varies with device	5000000	0	Everyone	{Business}	2018-02-26	Varies with device	4.0.3 and up
2354	ZOOM Cloud Meetings	BUSINESS	4.2	80804	Varies with device	5000000	0	Everyone	{Business}	2018-02-26	Varies with device	4.0.3 and up
2355	3D Holograms Joke	GAME	4.5	80678	Varies with device	5000000	0	Mature 17+	{Action}	2018-05-25	Varies with device	Varies with device
2356	FXNOW: Movies, Shows & Live TV	PRODUCTIVITY	4.2	80581	2.5M	10000000	0	Everyone	{Productivity}	2016-10-16	2.4	2.3 and up
2357	MapleStory M	NEWS_AND_MAGAZINES	4	80368	Varies with device	10000000	0	Everyone	{"News & Magazines"}	2018-05-17	Varies with device	Varies with device
2358	SavingStar - Grocery Coupons	FAMILY	3.9	80313	3.7M	10000000	0	Everyone	{Casual}	2017-11-22	1.7	2.3 and up
2359	Microsoft News	PRODUCTIVITY	4.4	80119	Varies with device	10000000	0	Everyone	{Productivity}	2018-06-25	Varies with device	Varies with device
2360	auto fines	FAMILY	4.2	79826	Varies with device	1000000	0	Everyone 10+	{Strategy}	2018-07-26	4.0.4	4.1 and up
2361	eharmony - Online Dating App	PHOTOGRAPHY	4.2	79792	Varies with device	100000000	0	Everyone	{Photography}	2018-08-03	Varies with device	Varies with device
2362	The Societe Generale App	FAMILY	4	79667	Varies with device	10000000	0	Everyone	{Racing,"Action & Adventure"}	2018-08-03	3.52	4.2 and up
2363	Pedometer - Step Counter Free & Calorie Burner	SOCIAL	4.6	79658	17M	5000000	0	Mature 17+	{Social}	2018-08-06	2.1.3.2	4.3 and up
2364	Questland: Turn Based RPG	SPORTS	4.1	79464	27M	1000000	0	Everyone	{Sports}	2018-08-06	5.0.8	4.4 and up
2365	Toca Life: City	SHOPPING	4.5	79261	57M	5000000	0	Everyone	{Shopping}	2018-08-03	7.36	4.4 and up
2366	Disney Magic Timer by Oral-B	TOOLS	3.8	79132	2.2M	10000000	0	Everyone	{Tools}	2018-01-03	1.1.6	2.3 and up
2367	Polaris Office for LG	SOCIAL	4.2	79130	23M	5000000	0	Teen	{Social}	2018-08-02	3.10.26	4.4 and up
2368	UFC	SOCIAL	4.2	79130	23M	5000000	0	Teen	{Social}	2018-08-02	3.10.26	4.4 and up
2369	Life market	SOCIAL	4.2	79129	23M	5000000	0	Teen	{Social}	2018-08-02	3.10.26	4.4 and up
2370	News360: Personalized News	SOCIAL	4.2	79129	23M	5000000	0	Teen	{Social}	2018-08-02	3.10.26	4.4 and up
2371	News24	MEDICAL	4.8	78825	11M	1000000	0	Everyone	{Medical}	2018-08-02	1.2.16	4.1 and up
2372	Cake Shop - Kids Cooking	BUSINESS	4.5	78662	22M	1000000	0	Everyone	{Business}	2018-02-13	3.7.5	4.4 and up
2373	Mopar Drag N Brag	BUSINESS	4.5	78662	22M	1000000	0	Everyone	{Business}	2018-02-13	3.7.5	4.4 and up
2374	Casino X - Free Online Slots	TOOLS	4.5	78629	6.3M	1000000	0	Everyone	{Tools}	2018-07-20	3.4.406	4.0.3 and up
2375	Zooper Widget	SPORTS	3.1	78442	25M	5000000	0	Everyone	{Sports}	2018-06-22	5.12.4	4.1 and up
2376	United Airlines	FINANCE	4.5	78361	22M	1000000	0	Everyone	{Finance}	2018-07-05	1.2.0	4.2 and up
2377	Blamburger - Clarence	FINANCE	4	78306	46M	5000000	0	Everyone	{Finance}	2018-07-31	9.9.0	4.4 and up
2378	Multiling O Keyboard + emoji	LIFESTYLE	4.1	78298	29M	5000000	0	Everyone	{Lifestyle}	2018-08-02	3.1.2.1	4.1 and up
2379	HomeAway Vacation Rentals	BUSINESS	3.9	78172	Varies with device	10000000	0	Everyone	{Business}	2018-08-02	Varies with device	Varies with device
2380	Call Blocker - Blacklist, SMS Blocker	NEWS_AND_MAGAZINES	4.2	78154	12M	1000000	0	Everyone 10+	{"News & Magazines"}	2018-08-03	19.2.8	4.4 and up
2381	To-Do Calendar Planner	FAMILY	4.1	78142	17M	5000000	0	Everyone	{Strategy}	2015-08-22	1.2.3	3.0 and up
2382	Sky News	PHOTOGRAPHY	4.1	78140	10M	5000000	0	Everyone	{Photography}	2018-02-11	5.5.2	4.0.3 and up
2383	Bricks n Balls	HEALTH_AND_FITNESS	4.7	77777	Varies with device	1000000	0	Everyone	{"Health & Fitness"}	2018-06-29	3.401	5.0 and up
2384	GialloZafferano: Recipes	PERSONALIZATION	4.1	77724	7.1M	5000000	0	Teen	{Personalization}	2018-05-31	2.7.2	4.0 and up
2385	Call Free – Free Call	TOOLS	4.3	77717	14M	5000000	0	Everyone	{Tools}	2016-12-29	1.2.0	4.1 and up
2386	All Language Translator Free	PERSONALIZATION	4.4	77609	1.9M	1000000	0	Everyone	{Personalization}	2015-04-24	1.14	1.6 and up
2387	L.A. Crime Stories Mad City Crime	TRAVEL_AND_LOCAL	4.4	77585	Varies with device	10000000	0	Everyone	{"Travel & Local"}	2018-07-31	Varies with device	Varies with device
2388	AE Coin Mania : Arcade Fun	HEALTH_AND_FITNESS	4.6	77563	39M	10000000	0	Everyone	{"Health & Fitness"}	2018-07-23	3.6.4	4.2 and up
2389	The Grand Wars: San Andreas	HEALTH_AND_FITNESS	4.6	77563	39M	10000000	0	Everyone	{"Health & Fitness"}	2018-07-23	3.6.4	4.2 and up
2390	CppDroid - C/C++ IDE	TOOLS	4.6	77311	Varies with device	5000000	0	Everyone	{Tools}	2018-01-09	Varies with device	Varies with device
2391	All Language Translator	TOOLS	4.6	77302	Varies with device	5000000	0	Everyone	{Tools}	2018-01-09	Varies with device	Varies with device
2392	Mad Skills BMX 2	PARENTING	4.5	76795	18M	1000000	0	Everyone	{Parenting}	2018-08-01	2.0.6	4.1 and up
2393	WiFi Baby Monitor - NannyCam	TRAVEL_AND_LOCAL	4.1	76779	Varies with device	10000000	0	Everyone	{"Travel & Local"}	2018-07-30	Varies with device	Varies with device
2394	I’m Ping Pong King :)	NEWS_AND_MAGAZINES	4.5	76677	4.6M	1000000	0	Everyone 10+	{"News & Magazines"}	2017-05-25	4.4.3	4.0 and up
2395	THAI DICT 2018	DATING	3.7	76646	Varies with device	10000000	0	Mature 17+	{Dating}	2018-07-23	Varies with device	Varies with device
2396	Air conditioner remote control	GAME	4.5	76627	23M	5000000	0	Everyone	{Word}	2018-07-03	8.16g	4.2 and up
2397	Tapas – Comics, Novels, and Stories	NEWS_AND_MAGAZINES	4.5	76616	4.6M	1000000	0	Everyone 10+	{"News & Magazines"}	2017-05-25	4.4.3	4.0 and up
2398	Virtual Cigarette Smoking (prank)	FAMILY	4.5	76608	24M	1000000	0	Everyone 10+	{Action,"Action & Adventure"}	2017-01-05	1.3.1	4.0 and up
2399	BF Frontline City	TOOLS	4.1	76604	Varies with device	100000000	0	Everyone	{Tools}	2016-07-27	Varies with device	Varies with device
2400	My Location: GPS Maps, Share & Save Places	WEATHER	4.5	76593	Varies with device	500000	5.99	Everyone	{Weather}	2017-11-21	Varies with device	Varies with device
2401	T-shirt design - Snaptee	COMMUNICATION	4.3	76498	4.3M	1000000	0	Teen	{Communication}	2018-06-20	6.3.2	Varies with device
2402	A&E - Watch Full Episodes of TV Shows	PHOTOGRAPHY	4.1	76484	Varies with device	5000000	0	Everyone	{Photography}	2018-06-08	3.52	4.0 and up
2403	Camera51 - a smarter camera	SOCIAL	4.5	76480	20M	1000000	0	Mature 17+	{Social}	2018-08-06	4.95.4	5.0 and up
2404	Free TV Shows App:News, TV Series, Episode, Movies	SPORTS	3.9	76346	14M	5000000	0	Everyone	{Sports}	2018-07-25	6.3.3	4.1 and up
2405	Ziggo GO	SPORTS	3.9	76340	14M	5000000	0	Everyone	{Sports}	2018-07-25	6.3.3	4.1 and up
2406	FanDuel: Daily Fantasy Sports	PRODUCTIVITY	4.5	75951	Varies with device	5000000	0	Everyone	{Productivity}	2018-07-08	Varies with device	Varies with device
2407	Koran Read &MP3 30 Juz Offline	FAMILY	4.5	75719	30M	5000000	0	Everyone	{Educational}	2017-11-24	3.3.0	4.0.3 and up
2408	Guns - Shot Sounds	HEALTH_AND_FITNESS	4.5	75571	Varies with device	1000000	0	Everyone	{"Health & Fitness"}	2018-08-03	7.2.5	Varies with device
2409	Theme eXp - Black Z Light	HEALTH_AND_FITNESS	4.5	75571	Varies with device	1000000	0	Everyone	{"Health & Fitness"}	2018-08-03	7.2.5	Varies with device
2410	Draw N Guess Multiplayer	SPORTS	4.2	75566	Varies with device	5000000	0	Everyone	{Sports}	2018-07-23	Varies with device	Varies with device
2411	Princess Closet : Otome games free dating sim	SPORTS	4.2	75545	Varies with device	5000000	0	Everyone	{Sports}	2018-07-23	Varies with device	Varies with device
2412	Color Call - Caller Screen, LED Flash	TOOLS	3.5	75336	544k	1000000	0	Everyone	{Tools}	2016-02-05	1.3	4.0 and up
2413	Love Dance	PRODUCTIVITY	4.5	75140	Varies with device	1000000	0	Everyone	{Productivity}	2018-01-02	Varies with device	Varies with device
2414	Shoot Bubble - Fruit Splash	EDUCATION	4.6	75112	6.5M	1000000	0	Everyone	{Education}	2017-11-11	2.09	4.1 and up
2415	Drawing for Kids Learning Games for Toddlers age 3	GAME	4.2	74902	Varies with device	5000000	0	Everyone	{Racing}	2016-08-26	Varies with device	Varies with device
2416	Ambulance Simulator 3D	GAME	4.1	74842	99M	5000000	0	Teen	{Action}	2016-12-22	1.7	2.3 and up
2417	Tiny Defense	TOOLS	3.5	74819	Varies with device	100000000	0	Everyone	{Tools}	2018-06-25	Varies with device	7.1 and up
2418	Météociel	FAMILY	4.4	74744	60M	1000000	0	Everyone	{Strategy}	2018-07-26	1.5.6	4.1 and up
2419	Google Ads	GAME	4.4	74695	17M	10000000	0	Everyone	{Casual}	2018-07-06	3.3.3179	4.0.3 and up
2420	CJ: Strike Back	GAME	4.4	74673	17M	10000000	0	Everyone	{Casual}	2018-07-06	3.3.3179	4.0.3 and up
2421	Thomas & Friends: Race On!	VIDEO_PLAYERS	4.5	74531	32M	5000000	0	Everyone	{"Video Players & Editors"}	2018-06-15	2.12.0	4.3 and up
2422	Mad Day - Truck Distance Game	COMMUNICATION	4	74497	5.3M	5000000	0	Everyone	{Communication}	2018-05-19	20180518-01	4.0 and up
2423	Draw A Stickman	PHOTOGRAPHY	4.5	74476	23M	10000000	0	Everyone	{Photography}	2018-06-19	1.6	4.0 and up
2424	Freeform – Stream Full Episodes, Movies, & Live TV	NEWS_AND_MAGAZINES	4.4	74425	8.6M	1000000	0	Everyone	{"News & Magazines"}	2018-07-18	5.14.0	4.0.3 and up
2425	Vonage Mobile® Call Video Text	BUSINESS	4.4	74359	25M	1000000	0	Everyone	{Business}	2018-07-27	1.12.5	4.0 and up
2426	Photo Lock App - Hide Pictures & Videos	PRODUCTIVITY	4.2	74146	32M	10000000	0	Everyone	{Productivity}	2018-07-16	12.1.0	4.4 and up
2427	Offroad Outlaws	FAMILY	4.6	73919	40M	500000	2.99	Teen	{Strategy}	2014-11-15	1.07	2.3 and up
2428	Masha and the Bear: Good Night!	TOOLS	4.3	73821	Varies with device	5000000	0	Everyone	{Tools}	2018-03-07	Varies with device	Varies with device
2429	Auction Wars : Storage King	PRODUCTIVITY	4.6	73695	Varies with device	1000000	0	Everyone	{Productivity}	2018-08-06	Varies with device	5.0 and up
2430	Fitbit Coach	GAME	4.5	73539	96M	1000000	0	Mature 17+	{"Role Playing"}	2018-08-02	1.3.3	4.3 and up
2431	Pluto TV - It’s Free TV	EDUCATION	4.6	73404	5.3M	1000000	0	Everyone	{Education}	2017-12-25	4.5.2	4.0 and up
2432	Down Dog: Great Yoga Anywhere	FAMILY	4.6	73404	5.3M	1000000	0	Everyone	{Education}	2017-12-25	4.5.2	4.0 and up
2433	FOX Sports: Live Streaming, Scores & News	FAMILY	4	73185	46M	5000000	0	Teen	{Simulation}	2017-11-01	1.6	4.0 and up
2434	Hot Bhojpuri Video songs	MEDICAL	4.6	73118	37M	1000000	0	Everyone	{Medical}	2018-05-10	3.3	4.4 and up
2435	Device Help	SHOPPING	4.5	72596	19M	1000000	0	Teen	{Shopping}	2018-08-03	4.2.2	4.1 and up
2436	BluTV	FAMILY	4.1	72522	51M	10000000	0	Everyone	{Simulation}	2018-04-10	1.54	2.3.3 and up
2437	Horses Live Wallpaper	PRODUCTIVITY	4.5	72513	12M	5000000	0	Everyone	{Productivity}	2018-07-18	5.0.1.11068-production	5.0 and up
2438	Thomas & Friends: Delivery	BUSINESS	4.4	72202	6.7M	1000000	0	Everyone	{Business}	2018-06-25	6	4.0.3 and up
2439	My Tamagotchi Forever	MEDICAL	4.5	72167	16M	1000000	0	Everyone	{Medical}	2018-07-18	2	4.1 and up
2440	ADWLauncher 1 EX	PRODUCTIVITY	4.4	72161	4.9M	1000000	0	Everyone	{Productivity}	2018-03-21	2.68.14	4.0 and up
2441	Love Fonts for FlipFont	COMMUNICATION	4.3	72065	13M	1000000	0	Everyone	{Communication}	2018-04-18	3.0.7	4.0 and up
2442	Blendr - Chat, Flirt & Meet	PHOTOGRAPHY	4.4	71898	23M	5000000	0	Everyone	{Photography}	2017-10-10	6.1.7.100920	4.0.3 and up
2443	Change photo background	TOOLS	3.4	71852	22M	5000000	0	Everyone	{Tools}	2018-05-23	1.12.0	4.1 and up
2444	Dungeon Rush	PERSONALIZATION	4.3	71829	8.8M	5000000	0	Everyone	{Personalization}	2017-06-30	4.16	4.0 and up
2445	Nature Sounds	COMMUNICATION	4.6	71740	5.8M	5000000	0	Everyone	{Communication}	2018-06-27	2.0.7.0014	4.0 and up
2446	Photo Frames	PERSONALIZATION	4.3	71688	12M	10000000	0	Everyone	{Personalization}	2018-06-11	3.5	4.1 and up
2447	zulily - Shop Daily Deals in Fashion and Home	GAME	4.1	71476	50M	1000000	0	Everyone 10+	{Action}	2018-04-21	2.14	4.0 and up
2448	LivingSocial - Local Deals	GAME	4.3	71468	51M	1000000	0	Teen	{Card}	2018-06-12	5.8.0	4.1 and up
2449	Sid Story	PRODUCTIVITY	4.1	71432	3.8M	5000000	0	Everyone	{Productivity}	2017-11-01	4.2.2	4.1 and up
2450	Lezhin Comics - Daily Releases	HOUSE_AND_HOME	4.4	71421	Varies with device	5000000	0	Everyone	{"House & Home"}	2018-07-24	Varies with device	Varies with device
2451	Ghost In Photo	HOUSE_AND_HOME	4.4	71419	Varies with device	5000000	0	Everyone	{"House & Home"}	2018-07-24	Varies with device	Varies with device
2452	myHomework Student Planner	BOOKS_AND_REFERENCE	4.1	71328	11M	5000000	0	Everyone	{"Books & Reference"}	2017-06-11	BlueOrange	4.0.3 and up
2453	Adobe Photoshop Fix	HEALTH_AND_FITNESS	4.6	71269	49M	1000000	0	Everyone	{"Health & Fitness"}	2018-03-30	2.3.2	4.0.3 and up
2454	Housing-Real Estate & Property	HEALTH_AND_FITNESS	4.6	71266	49M	1000000	0	Everyone	{"Health & Fitness"}	2018-03-30	2.3.2	4.0.3 and up
2455	HTC Lock Screen	BUSINESS	4.4	70991	Varies with device	5000000	0	Everyone	{Business}	2018-07-24	2.19.0.204537701	4.4 and up
2456	Messaging+ SMS, MMS Free	BUSINESS	4.4	70991	Varies with device	5000000	0	Everyone	{Business}	2018-07-24	2.19.0.204537701	4.4 and up
2457	Sabbath School	BUSINESS	4.4	70991	Varies with device	5000000	0	Everyone	{Business}	2018-07-24	2.19.0.204537701	4.4 and up
2458	Aurum Blade EX	FAMILY	4.3	70903	51M	5000000	0	Everyone	{Puzzle,"Brain Games"}	2018-05-03	1.3.20	4.0.3 and up
2459	Fast Motorcycle Driver 2016	FAMILY	3.8	70903	47M	1000000	0	Everyone 10+	{"Role Playing"}	2016-10-27	2.164.4	2.3 and up
2460	Taco Bell	FAMILY	4.4	70883	31M	1000000	0	Everyone	{Puzzle,Creativity}	2018-08-07	1.7.6	4.2 and up
2461	Amazing Fart Sounds	FINANCE	4.1	70782	50M	1000000	0	Everyone	{Finance}	2018-07-25	2.34.29	4.0.3 and up
2462	Cameringo+ Filters Camera	HEALTH_AND_FITNESS	4.4	70769	35M	5000000	0	Everyone	{"Health & Fitness"}	2018-07-24	6.2.73	4.0 and up
2463	Simple Gallery	HEALTH_AND_FITNESS	4.4	70769	35M	5000000	0	Everyone	{"Health & Fitness"}	2018-07-24	6.2.73	4.0 and up
2464	Chick-fil-A	HEALTH_AND_FITNESS	4.4	70769	35M	5000000	0	Everyone	{"Health & Fitness"}	2018-07-24	6.2.73	4.0 and up
2465	Five Nights at Freddy’s 3	FAMILY	4.2	70753	14M	5000000	0	Everyone	{Puzzle}	2018-08-07	1.8.6	4.0.3 and up
2466	Resume Free	GAME	4.4	70747	99M	5000000	0	Teen	{Action}	2018-07-31	1.7	4.4 and up
2467	Metro name iD	SOCIAL	4.6	70616	Varies with device	5000000	0	Teen	{Social}	2018-07-27	Varies with device	Varies with device
2468	Free antivirus and VPN	MAPS_AND_NAVIGATION	4.3	70556	26M	10000000	0	Everyone	{"Maps & Navigation"}	2018-07-17	4.76	4.0 and up
2469	ABC Preschool Free	SOCIAL	4.6	70449	Varies with device	5000000	0	Teen	{Social}	2018-07-27	Varies with device	Varies with device
2470	Fly Delta	HEALTH_AND_FITNESS	4.4	70416	23M	5000000	0	Everyone	{"Health & Fitness"}	2018-07-27	3.19.4	4.1 and up
2471	Rescue Robots Survival Games	TOOLS	4.5	70404	4.2M	1000000	0	Everyone	{Tools}	2018-05-25	3.4.0	4.0 and up
2472	Safest Call Blocker	GAME	4.2	70389	28M	1000000	0	Teen	{Action}	2018-05-09	5.3.1	2.3.3 and up
2473	CareZone	GAME	4.4	70351	Varies with device	5000000	0	Everyone	{Arcade}	2018-03-03	Varies with device	Varies with device
2474	Ab Workouts	FAMILY	4.6	70335	58M	500000	0	Teen	{Simulation}	2017-10-17	1.0.7	4.3 and up
2475	Calorie Counter - MyNetDiary	GAME	4.2	70226	38M	5000000	0	Everyone	{Arcade}	2018-07-25	1.2.9	4.1 and up
2476	VH1	PHOTOGRAPHY	4.4	70189	13M	5000000	0	Teen	{Photography}	2015-08-11	4.0.10	4.0 and up
2477	Yidio: TV Show & Movie Guide	PHOTOGRAPHY	4.4	70189	13M	5000000	0	Teen	{Photography}	2015-08-11	4.0.10	4.0 and up
2478	Weight Loss Running by Verv	FAMILY	3.7	70105	67M	10000000	0	Everyone	{Casual}	2018-06-06	1.0.3	4.1 and up
2479	Apartments & Rentals - Zillow	FINANCE	4.6	69973	3.8M	1000000	0	Everyone	{Finance}	2018-07-23	1.17.1	4.0 and up
2480	CL Mobile - Classifieds for Craigslist	FAMILY	4	69574	45M	500000	0	Everyone 10+	{Strategy}	2018-05-24	1.8.91	4.1 and up
2481	Microsoft Edge	EDUCATION	4.2	69498	Varies with device	10000000	0	Everyone	{Education}	2018-07-19	Varies with device	Varies with device
2482	Ruler	EDUCATION	4.2	69498	Varies with device	10000000	0	Everyone	{Education}	2018-07-19	Varies with device	Varies with device
2483	Esporte Interativo Plus	EDUCATION	4.2	69493	Varies with device	10000000	0	Everyone	{Education}	2018-07-19	Varies with device	Varies with device
2484	InBrowser - Incognito Browsing	PERSONALIZATION	4.5	69488	9.7M	1000000	0	Everyone	{Personalization}	2018-07-08	6.07	4.1 and up
2485	Business Calendar Pro	PERSONALIZATION	4.1	69417	853k	10000000	0	Everyone	{Personalization}	2014-05-01	2.41	2.1 and up
2486	US Army Training Courses Game	HEALTH_AND_FITNESS	4.4	69395	Varies with device	10000000	0	Everyone	{"Health & Fitness"}	2018-08-03	Varies with device	Varies with device
2487	Financial Times	HEALTH_AND_FITNESS	4.4	69395	Varies with device	10000000	0	Everyone	{"Health & Fitness"}	2018-08-03	Varies with device	Varies with device
2488	Bubble Shooter Genies	HEALTH_AND_FITNESS	4.4	69395	Varies with device	10000000	0	Everyone	{"Health & Fitness"}	2018-08-03	Varies with device	Varies with device
2489	Rainfall radar - weather	HEALTH_AND_FITNESS	4.8	69279	10M	10000000	0	Everyone	{"Health & Fitness"}	2018-07-23	1.1.8	4.2 and up
2490	aCalendar+ Calendar & Tasks	LIFESTYLE	4.6	69177	15M	1000000	0	Teen	{Lifestyle}	2017-08-02	2.7.3	4.4 and up
2491	My Wild Pet: Online Animal Sim	MEDICAL	4.8	69126	61M	1000000	0	Everyone	{Medical}	2018-06-01	2.6.1	4.1 and up
2492	Gun Shoot War Q	FAMILY	4.2	69126	60M	1000000	0	Everyone	{Puzzle}	2018-04-19	2.9.4	4.0 and up
2493	English Persian Dictionary	GAME	4	69115	2.4M	10000000	0	Everyone	{Arcade}	2018-06-13	1.36	4.1 and up
2494	Google Trips - Travel Planner	FAMILY	4.5	69013	Varies with device	1000000	0	Teen	{"Role Playing"}	2017-09-02	Varies with device	Varies with device
2495	Migraine Buddy - The Migraine and Headache tracker	SPORTS	4	68935	48M	5000000	0	Everyone	{Sports}	2018-06-27	9.4.0	4.2 and up
2496	Sephora: Skin Care, Beauty Makeup & Fragrance Shop	FAMILY	4	68664	55M	10000000	0	Everyone	{Simulation}	2018-04-20	1.7	4.1 and up
2497	BlackJack 21 Pro	FAMILY	4	68559	75M	5000000	0	Everyone	{Board,"Action & Adventure"}	2018-07-31	1.19.56.434	4.4 and up
2498	Poynt	SHOPPING	4.1	68406	24M	10000000	0	Everyone	{Shopping}	2018-07-25	6.25.0+1906001476	5.0 and up
2499	My Cycles Period and Ovulation	SHOPPING	4.1	68406	24M	10000000	0	Everyone	{Shopping}	2018-07-25	6.25.0+1906001476	5.0 and up
2500	Dinosaur Simulator: Dino World	SHOPPING	4.1	68406	24M	10000000	0	Everyone	{Shopping}	2018-08-06	6.25.0+1906001476	5.0 and up
2501	One Launcher	SOCIAL	4.4	68358	7.2M	5000000	0	Mature 17+	{Social}	2016-05-07	3.22	4.1 and up
2502	CreditWise from Capital One	TOOLS	4.2	68309	2.1M	1000000	0	Everyone	{Tools}	2017-11-23	v3.9f	4.0 and up
2503	Good&Co: Career match tests	FAMILY	4.1	68286	85M	10000000	0	Everyone	{Casual,Creativity}	2018-07-30	1.3.7	4.1 and up
2504	ASUS SuperNote	FOOD_AND_DRINK	4.2	68270	66M	1000000	0	Everyone	{"Food & Drink"}	2018-06-20	5.0.0	4.4 and up
2505	Talking Husky Dog	BOOKS_AND_REFERENCE	4.5	68226	16M	1000000	0	Everyone	{"Books & Reference"}	2018-08-06	1.9.1	4.2 and up
2506	Relax Meditation: Sleep with Sleep Sounds	FOOD_AND_DRINK	4.2	68103	66M	1000000	0	Everyone	{"Food & Drink"}	2018-06-20	5.0.0	4.4 and up
2507	HD Camera - silent shutter	SPORTS	4.5	68072	40M	5000000	0	Everyone	{Sports}	2018-07-26	1.1.7	4.1 and up
2508	Do it (Tomorrow)	PHOTOGRAPHY	4.3	68071	Varies with device	5000000	0	Everyone	{Photography}	2018-05-05	Varies with device	Varies with device
2509	Kids A-Z	PHOTOGRAPHY	4.3	68070	Varies with device	5000000	0	Everyone	{Photography}	2018-05-05	Varies with device	Varies with device
2510	video player	GAME	4.1	68057	85M	10000000	0	Everyone	{Casual,Creativity}	2018-07-30	1.3.7	4.1 and up
2511	daily News	SOCIAL	4.1	68025	3.9M	10000000	0	Everyone	{Social}	2018-04-16	1	4.1 and up
2512	Pretty Makeup, Beauty Photo Editor & Snappy Camera	WEATHER	4.2	67854	Varies with device	5000000	0	Everyone	{Weather}	2018-08-02	Varies with device	Varies with device
2513	CamScanner (License)	WEATHER	4.2	67772	Varies with device	5000000	0	Everyone	{Weather}	2018-08-02	Varies with device	Varies with device
2514	Gun Disassembly 2	PERSONALIZATION	4.5	67707	4.8M	1000000	0	Everyone	{Personalization}	2016-02-07	1.8.0.4	4.0 and up
2515	Dungeon Hunter Champions: Epic Online Action RPG	SOCIAL	4.5	67611	21M	1000000	0	Mature 17+	{Social}	2018-04-23	263.16.29	4.0.3 and up
2516	Thumbnail Maker	ENTERTAINMENT	4.4	67554	7.7M	1000000	0	Teen	{Entertainment}	2015-09-15	4	2.3.3 and up
2517	Offroad 4x4 Car Driving	PRODUCTIVITY	4.6	67523	Varies with device	1000000	0	Everyone	{Productivity}	2018-07-19	2.5.4	4.1 and up
2518	Holy Knight EN	FAMILY	4.6	67410	865k	1000000	0	Everyone	{Entertainment}	2017-11-02	1.0.9	2.2 and up
2519	myMetro	BOOKS_AND_REFERENCE	4.5	67186	6.3M	1000000	0	Everyone 10+	{"Books & Reference"}	2018-05-18	4.4.10	2.3.3 and up
2520	Sonic CD Classic	SHOPPING	4.7	67071	40M	1000000	0	Everyone	{Shopping}	2018-08-01	2.24.0	4.4 and up
2521	GolfNow: Tee Time Deals at Golf Courses, Golf GPS	LIBRARIES_AND_DEMO	3.8	67007	232k	5000000	0	Everyone	{"Libraries & Demo"}	2013-03-06	1.2.0	2.2 and up
2522	StubHub - Tickets to Sports, Concerts & Events	BUSINESS	4.5	67000	Varies with device	1000000	0	Everyone	{Business}	2018-07-17	Varies with device	4.3 and up
2523	Czech Public Transport IDOS	NEWS_AND_MAGAZINES	4.5	66978	Varies with device	1000000	0	Teen	{"News & Magazines"}	2018-08-06	Varies with device	Varies with device
2524	New Calendar	GAME	4.1	66894	Varies with device	1000000	0	Everyone 10+	{Racing}	2018-07-21	Varies with device	Varies with device
2525	World of Warriors: Duel	HEALTH_AND_FITNESS	4.9	66791	10M	1000000	0	Everyone	{"Health & Fitness"}	2018-07-30	Varies with device	Varies with device
2526	Samsung Video Library	FAMILY	4.5	66740	23M	1000000	0	Everyone	{Arcade,"Action & Adventure"}	2016-07-08	2.4.4	2.3 and up
2527	Will it Crush?	PERSONALIZATION	4.2	66730	7.0M	5000000	0	Everyone	{Personalization}	2018-05-21	18	4.1 and up
2528	Dolphins Live Wallpaper	FAMILY	4.1	66661	22M	5000000	0	Everyone	{Casual,"Pretend Play"}	2018-02-02	5.2	4.1 and up
2529	Bitcoin Ticker Widget	FAMILY	4.1	66660	22M	5000000	0	Everyone	{Casual,"Pretend Play"}	2018-02-02	5.2	4.1 and up
2530	British Airways	COMMUNICATION	4.3	66602	Varies with device	50000000	0	Everyone	{Communication}	2018-06-26	2.8.4.201036949	5.0 and up
2531	Overstock – Home Decor, Furniture Shopping	PERSONALIZATION	4.1	66473	3.0M	1000000	0	Everyone	{Personalization}	2015-07-30	3.8.4	4.1 and up
2532	Jiji.ng	PERSONALIZATION	4.6	66453	14M	5000000	0	Everyone	{Personalization}	2018-04-10	1.57	2.3 and up
2533	DC Comics	NEWS_AND_MAGAZINES	4.6	66407	19M	1000000	0	Teen	{"News & Magazines"}	2018-07-25	4.1.0.72	4.0 and up
2625	ASUS Quick Memo	GAME	4.6	59907	7.8M	5000000	0	Everyone	{Puzzle}	2018-03-06	2.9	2.3 and up
2534	Extreme- Personal Voice Assistant	NEWS_AND_MAGAZINES	4.6	66384	19M	1000000	0	Teen	{"News & Magazines"}	2018-07-25	4.1.0.72	4.0 and up
2535	Calculator - free calculator, multi calculator app	PERSONALIZATION	4.5	66321	18M	5000000	0	Everyone	{Personalization}	2018-06-11	2.4	4.1 and up
2536	VidStatus app - Status Videos & Status Downloader	FAMILY	3.8	66033	6.8M	10000000	0	Everyone	{Casual}	2018-01-01	2.5.1	4.0 and up
2537	IKEA Store	HOUSE_AND_HOME	4	65914	Varies with device	10000000	0	Everyone	{"House & Home"}	2018-06-29	Varies with device	Varies with device
2538	GCash - Buy Load, Pay Bills, Send Money	HOUSE_AND_HOME	4.1	65913	7.7M	5000000	0	Everyone	{"House & Home"}	2018-07-16	4.47.3	4.0.3 and up
2539	Subway Simulator 3D	AUTO_AND_VEHICLES	4.6	65786	Varies with device	1000000	0	Everyone	{"Auto & Vehicles"}	2018-08-02	Varies with device	4.0.3 and up
2540	Flash Light on Call & SMS	PHOTOGRAPHY	4.4	65766	Varies with device	5000000	0	Everyone	{Photography}	2018-04-02	3.4.23	5.0 and up
2541	Mahalaxmi Dindarshika 2018	TOOLS	4.1	65597	2.4M	10000000	0	Everyone	{Tools}	2017-04-28	4.20.1	2.3 and up
2542	TickTick: To Do List with Reminder, Day Planner	MAPS_AND_NAVIGATION	4.5	65590	18M	5000000	0	Everyone	{"Maps & Navigation"}	2018-07-09	3.1.0	4.0 and up
2543	PRO MX MOTOCROSS 2	MAPS_AND_NAVIGATION	4.5	65448	Varies with device	5000000	0	Everyone	{"Maps & Navigation"}	2018-08-02	Varies with device	Varies with device
2544	Weather & Radar Pro - Ad-Free	FAMILY	4.3	65146	100M	10000000	0	Mature 17+	{Simulation}	2018-05-31	2.1	4.0 and up
2545	Banco Sabadell App. Your mobile bank	FAMILY	3.9	65119	46M	1000000	0	Everyone 10+	{Strategy}	2018-05-22	2.1.0	3.0 and up
2546	Augment - 3D Augmented Reality	FINANCE	4.5	64983	39M	1000000	0	Everyone	{Finance}	2018-06-18	5.0.1	4.1 and up
2547	Learn JavaScript	FINANCE	4.5	64959	39M	1000000	0	Everyone	{Finance}	2018-06-18	5.0.1	4.1 and up
2548	GollerCepte 1903	FAMILY	4.3	64884	37M	5000000	0	Everyone	{Simulation}	2016-07-12	1	2.3.3 and up
2549	Credit Sesame	FAMILY	4.2	64815	23M	5000000	0	Teen	{Strategy}	2018-06-01	1.7.5	2.3 and up
2550	Tokyo Ghoul: Dark War	FOOD_AND_DRINK	4.1	64784	13M	10000000	0	Everyone	{"Food & Drink"}	2018-08-02	18.6.0.10	5.0 and up
2551	App vault	TRAVEL_AND_LOCAL	4.3	64713	58M	1000000	0	Everyone	{"Travel & Local"}	2018-06-09	10.9.8 (Play)	5.0 and up
2552	Beautiful Widgets Free	BOOKS_AND_REFERENCE	4.3	64513	Varies with device	5000000	0	Everyone	{"Books & Reference"}	2018-07-31	Varies with device	Varies with device
2553	My Vodacom SA	ENTERTAINMENT	4.3	64448	4.4M	1000000	0	Mature 17+	{Entertainment}	2018-07-21	43	4.0.3 and up
2554	WhatsVPN - Unlimited Free VPN	TRAVEL_AND_LOCAL	4	64164	3.6M	10000000	0	Everyone	{"Travel & Local"}	2018-04-07	1.9	4.1 and up
2555	ET Markets : NSE & BSE India	DATING	4.2	63986	20M	5000000	0	Mature 17+	{Dating}	2018-05-31	3.0.15	4.0 and up
2556	591 housing transactions - renting houses, middle-class houses, new cases, real-time registration, villas through the sky, apartment suites, MRT, buying a house selling prices, housing mortgages	GAME	3.7	63986	26M	1000000	0	Teen	{Action}	2017-10-10	6	2.3 and up
2557	Coupons.com – Grocery Coupons & Cash Back Savings	SPORTS	3.9	63938	Varies with device	5000000	0	Everyone	{Sports}	2018-08-06	Varies with device	Varies with device
2558	Kids Educational Game 3 Free	MAPS_AND_NAVIGATION	4.3	63920	29M	5000000	0	Everyone	{"Maps & Navigation"}	2018-07-28	7.16.8	4.0.3 and up
2559	PAC-MAN Pop	SPORTS	4.3	63782	24M	5000000	0	Everyone	{Sports}	2018-08-07	1.1.5	4.1 and up
2560	NPR News	SPORTS	4.4	63779	95M	1000000	0	Everyone	{Sports}	2018-07-16	1.5.6	5.0 and up
2561	Southwest Airlines	FAMILY	4.4	63773	8.8M	5000000	0	Everyone	{Entertainment}	2018-07-30	5.7.2	5.0 and up
2562	Adventure Xpress	SOCIAL	4.5	63765	11M	1000000	0	Mature 17+	{Social}	2018-07-31	4.17.2	4.1 and up
2563	Amex Mobile	TOOLS	4.3	63712	Varies with device	5000000	0	Everyone	{Tools}	2016-05-12	Varies with device	2.3 and up
2564	Route Z	PERSONALIZATION	4.2	63699	2.3M	5000000	0	Teen	{Personalization}	2015-09-21	1.1.6	2.3 and up
2565	Offroad Car Q	GAME	4.1	63680	46M	1000000	0	Everyone 10+	{Adventure}	2018-06-02	2.2.2	4.1 and up
2566	CNBC: Breaking Business News & Live Market Data	SPORTS	4.4	63650	4.6M	1000000	0	Everyone	{Sports}	2018-08-03	7.0.2	4.1 and up
2567	Adventure Time Run	NEWS_AND_MAGAZINES	3.9	63647	23M	10000000	0	Everyone 10+	{"News & Magazines"}	2018-08-01	6.19.5	4.4 and up
2568	Vuze Torrent Downloader	NEWS_AND_MAGAZINES	3.9	63647	23M	10000000	0	Everyone 10+	{"News & Magazines"}	2018-08-01	6.19.5	4.4 and up
2569	Color By Number - Sandbox Pixel Coloring Book	NEWS_AND_MAGAZINES	3.9	63640	23M	10000000	0	Everyone 10+	{"News & Magazines"}	2018-08-01	6.19.5	4.4 and up
2570	U+Box	PERSONALIZATION	4.3	63624	10M	5000000	0	Everyone	{Personalization}	2017-11-20	11	4.0.3 and up
2571	Al Jazeera English	SPORTS	4.3	63580	24M	5000000	0	Everyone	{Sports}	2018-07-20	1.1.5	4.1 and up
2572	Faster for Facebook Lite	COMMUNICATION	4.4	63576	Varies with device	5000000	0	Everyone	{Communication}	2018-08-02	69.0.3497.24	Varies with device
2573	Wetter by t-online.de	COMMUNICATION	4.4	63543	Varies with device	5000000	0	Everyone	{Communication}	2018-08-02	69.0.3497.24	Varies with device
2574	Super Dancer VN	FAMILY	4.2	63197	11M	1000000	0	Everyone	{Simulation}	2018-06-27	Varies with device	Varies with device
2575	JetBlue	FAMILY	4.3	63192	17M	1000000	0	Everyone	{Simulation,"Pretend Play"}	2016-07-22	1.0.0	2.3 and up
2576	EGW Writings	FAMILY	4.3	63186	16M	10000000	0	Everyone	{Puzzle,"Brain Games"}	2018-07-12	7.5	4.0.3 and up
2577	Age Calculator	FAMILY	4.3	63160	17M	1000000	0	Everyone	{Simulation,"Pretend Play"}	2016-07-22	1.0.0	2.3 and up
2578	Speed Test - WiFi / Cellular speed test	GAME	4.2	63056	8.1M	1000000	0	Teen	{Word}	2018-07-03	1.9.7	2.3 and up
2579	OnePlus Launcher	NEWS_AND_MAGAZINES	4.1	63020	Varies with device	5000000	0	Everyone 10+	{"News & Magazines"}	2018-02-13	Varies with device	Varies with device
2580	Hero Fighter X	NEWS_AND_MAGAZINES	4.1	63020	Varies with device	5000000	0	Everyone 10+	{"News & Magazines"}	2018-02-13	Varies with device	Varies with device
2581	Motorola Alert	NEWS_AND_MAGAZINES	4.6	62740	8.6M	500000	0	Mature 17+	{"News & Magazines"}	2018-06-16	16.3	4.1 and up
2582	GO SMS Pro Z Glass Theme EX	GAME	4.2	62636	17M	1000000	0	Teen	{Action}	2018-07-02	1.8.0	4.0.3 and up
2583	HTC Sense Input - EN	HEALTH_AND_FITNESS	4.1	62616	Varies with device	5000000	0	Teen	{"Health & Fitness"}	2018-08-02	Varies with device	Varies with device
2584	Clear	GAME	4.7	62561	53M	1000000	0	Everyone	{Board}	2018-07-31	2.4.11	4.1 and up
2585	Google Arts & Culture	NEWS_AND_MAGAZINES	4.1	62465	Varies with device	5000000	0	Everyone 10+	{"News & Magazines"}	2018-08-02	Varies with device	Varies with device
2586	DIRECTV for Tablets	PHOTOGRAPHY	4.4	62421	9.6M	5000000	0	Everyone	{Photography}	2018-07-28	2.4	4.1 and up
2587	MyPlate Calorie Tracker	PARENTING	4.6	62386	3.4M	1000000	0	Everyone	{Parenting}	2018-06-12	2.7	4.0 and up
2588	No Pimple - Fun games	PERSONALIZATION	4.1	62301	1.9M	1000000	0	Everyone	{Personalization}	2016-05-11	1.7.2	4.2 and up
2589	The Championships, Wimbledon 2018	FAMILY	4.2	62301	72M	5000000	0	Teen	{Strategy}	2018-08-01	1.6	4.1 and up
2590	Manga Master - Best manga & comic reader	BUSINESS	4.4	62272	18M	10000000	0	Everyone	{Business}	2018-06-26	3.550.2	4.1 and up
2591	Weapon stripping 3D	PERSONALIZATION	4.1	62209	7.4M	10000000	0	Everyone	{Personalization}	2018-07-01	6.7.1	4.0.3 and up
2592	Sleep as Android Unlock	PHOTOGRAPHY	4.3	61990	Varies with device	10000000	0	Everyone	{Photography}	2018-02-09	1.5.1.182070924	5.0 and up
2593	Epocrates Plus	FOOD_AND_DRINK	4.5	61881	Varies with device	5000000	0	Everyone	{"Food & Drink"}	2018-04-10	Varies with device	Varies with device
2594	ES Chromecast plugin	TRAVEL_AND_LOCAL	4.4	61776	Varies with device	1000000	0	Teen	{"Travel & Local"}	2018-07-10	Varies with device	Varies with device
2595	The translator	EDUCATION	4.7	61749	5.4M	1000000	0	Everyone	{Education}	2017-12-25	5.5.2	4.0 and up
2596	CM Launcher 3D Pro💎	GAME	4.4	61746	Varies with device	500000	0	Teen	{Casino}	2016-09-30	Varies with device	2.3.3 and up
2597	Create apps fast with beautiful design and no code	NEWS_AND_MAGAZINES	4.2	61692	27M	10000000	0	Everyone	{"News & Magazines"}	2018-07-25	5.9.1.1347176.a3ca6ab274	4.4 and up
2598	SolMail - All-in-One email app	DATING	4.5	61637	11M	5000000	0	Mature 17+	{Dating}	2018-07-31	4.17.2	4.1 and up
2599	Broken Screen Prank	DATING	4.5	61637	11M	5000000	0	Mature 17+	{Dating}	2018-07-31	4.17.2	4.1 and up
2600	LEGO® Friends: Heartlake Rush	FAMILY	4.7	61600	3.4M	1000000	0	Everyone	{Education}	2018-02-24	3.1	2.3 and up
2601	Funny Quotes Free	TOOLS	4.7	61445	7.8M	1000000	0	Everyone	{Tools}	2018-07-26	1.9.734	4.1 and up
2602	CBS News	SHOPPING	4.4	61392	Varies with device	1000000	0	Everyone	{Shopping}	2018-08-08	Varies with device	Varies with device
2603	Dance On Mobile	FAMILY	4.6	61264	43M	1000000	0.99	Everyone	{Puzzle}	2018-06-19	3.7.0	4.1 and up
2604	Sword of Chaos - Lame du Chaos	FAMILY	3.9	61230	Varies with device	10000000	0	Teen	{Entertainment}	2018-07-19	Varies with device	Varies with device
2605	No.Color – Color by Number	ENTERTAINMENT	3.9	61201	Varies with device	10000000	0	Teen	{Entertainment}	2018-07-19	Varies with device	Varies with device
2606	What’s Up	ENTERTAINMENT	3.9	61201	Varies with device	10000000	0	Teen	{Entertainment}	2018-07-19	Varies with device	Varies with device
2607	KVAD Camera +: Selfie, Photo Filter, Grids	ENTERTAINMENT	3.9	61201	Varies with device	10000000	0	Teen	{Entertainment}	2018-07-19	Varies with device	Varies with device
2608	Time Recording - Timesheet App	ENTERTAINMENT	3.9	60841	Varies with device	5000000	0	Teen	{Entertainment}	2018-07-26	Varies with device	4.4 and up
2609	Turbo Downloader	ENTERTAINMENT	3.9	60841	Varies with device	5000000	0	Teen	{Entertainment}	2018-07-26	Varies with device	4.4 and up
2610	dr.fone - Recovery & Transfer wirelessly & Backup	ENTERTAINMENT	3.9	60841	Varies with device	5000000	0	Teen	{Entertainment}	2018-07-26	Varies with device	4.4 and up
2611	Hangman	PRODUCTIVITY	4.2	60840	1.9M	5000000	0	Everyone	{Productivity}	2018-05-31	1.26.2	4.0.3 and up
2612	AC - Tips & News for Android™	MAPS_AND_NAVIGATION	4.2	60838	Varies with device	5000000	0	Everyone	{"Maps & Navigation"}	2018-08-06	Varies with device	Varies with device
2613	Urban Car Simulator	MAPS_AND_NAVIGATION	4.2	60820	Varies with device	5000000	0	Everyone	{"Maps & Navigation"}	2018-08-01	Varies with device	Varies with device
2614	FindShip	TOOLS	4.5	60571	Varies with device	5000000	0	Everyone	{Tools}	2018-07-02	Varies with device	Varies with device
2615	UPS Mobile	SOCIAL	4.6	60562	15M	5000000	0	Mature 17+	{Social}	2018-08-06	1.3.2	4.3 and up
2616	CheckPoints 🏆 Rewards App	FINANCE	4.5	60449	100M	1000000	0	Everyone	{Finance}	2018-07-23	2.9.12	4.0 and up
2617	QuickBooks Accounting: Invoicing & Expenses	COMMUNICATION	4	60308	Varies with device	5000000	0	Everyone	{Communication}	2018-06-22	Varies with device	Varies with device
2618	Glam - Premium Dating App	PERSONALIZATION	4.3	60298	13M	5000000	0	Everyone	{Personalization}	2015-01-08	1.38	1.6 and up
2619	7 Nights at Pixel Pizzeria - 2	LIBRARIES_AND_DEMO	4.5	60170	28M	1000000	0	Everyone	{"Libraries & Demo"}	2018-07-13	2.4	5.0 and up
2620	w UN map	FAMILY	3.9	60097	19M	1000000	0	Everyone	{Entertainment,"Pretend Play"}	2018-02-10	5.1	4.2 and up
2621	1800 Contacts - Lens Store	HEALTH_AND_FITNESS	4.5	60096	27M	5000000	0	Teen	{"Health & Fitness"}	2018-04-07	10	4.0.3 and up
2622	The Washington Post Classic	TOOLS	4	59973	11M	10000000	0	Everyone	{Tools}	2018-03-16	1.2.5	4.0 and up
2623	Experian - Free Credit Report	FAMILY	4.1	59917	92M	5000000	0	Everyone	{Education,"Pretend Play"}	2018-07-31	2.3	4.4 and up
2624	Extreme Super Car Driving 3D	FAMILY	4.1	59917	92M	5000000	0	Everyone	{Education,"Pretend Play"}	2018-07-31	2.3	4.4 and up
2626	Low Poly – Puzzle art game	GAME	4.6	59907	7.8M	5000000	0	Everyone	{Puzzle}	2018-03-06	2.9	2.3 and up
2627	Doctor Pets	GAME	4.6	59854	7.8M	5000000	0	Everyone	{Puzzle}	2018-03-06	2.9	2.3 and up
2628	Easy Installer - Apps On SD	FAMILY	4.4	59843	20M	5000000	0	Everyone	{Puzzle,"Brain Games"}	2018-01-09	2.3.3122	2.3 and up
2629	Bubble Shooter 2	GAME	4.6	59800	7.8M	5000000	0	Everyone	{Puzzle}	2018-03-06	2.9	2.3 and up
2630	Dr. Panda Ice Cream Truck Free	FAMILY	4.1	59768	Varies with device	10000000	0	Everyone	{Racing,"Action & Adventure"}	2018-08-07	3.53	4.2 and up
2631	DaBang - Rental Homes in Korea	FAMILY	4.1	59729	Varies with device	10000000	0	Everyone	{Racing,"Action & Adventure"}	2018-06-27	3.46	4.2 and up
2632	Univision NOW - Live TV and On Demand	HOUSE_AND_HOME	3.9	59660	72M	1000000	0	Everyone	{"House & Home"}	2017-03-14	3.4	2.3 and up
2633	Free DS Emulator	TOOLS	4.7	59632	10M	1000000	0	Everyone	{Tools}	2018-04-03	1.5.2	4.1 and up
2634	Postmates Food Delivery: Order Eats & Alcohol	GAME	4	59223	46M	5000000	0	Teen	{Action}	2018-06-26	1.6.5	4.1 and up
2635	Seeking Alpha	MEDICAL	4.8	59158	11M	1000000	0	Everyone	{Medical}	2018-07-26	5.4.8	4.1 and up
2636	Tiny Call Confirm	FAMILY	4.3	59152	50M	1000000	0	Everyone 10+	{"Role Playing"}	2018-03-29	1.14.00	4.0.3 and up
2637	The Emirates App	FAMILY	3	59096	Varies with device	5000000	0	Everyone	{Casual}	2017-09-14	Varies with device	4.0.3 and up
2638	AT&T Mobile Transfer	VIDEO_PLAYERS	4.2	59089	5.4M	10000000	0	Everyone	{"Video Players & Editors"}	2018-08-03	1.0.8	4.4 and up
2639	Critical Strike CS: Counter Terrorist Online FPS	GAME	4.7	59017	82M	1000000	0	Teen	{Action}	2018-07-03	2.2.1	4.3 and up
2640	MobilePatrol Public Safety App	GAME	4.7	59017	82M	1000000	0	Teen	{Action}	2018-07-03	2.2.1	4.3 and up
2641	AdventureQuest 3D MMO	VIDEO_PLAYERS	4.2	58981	5.4M	10000000	0	Everyone	{"Video Players & Editors"}	2018-08-03	1.0.8	4.4 and up
2642	All Social Networks	VIDEO_PLAYERS	4.5	58820	37M	1000000	0	Everyone	{"Video Players & Editors"}	2018-04-26	3.5.1.8	4.4 and up
2643	Apartments.com Rental Search	FAMILY	4.5	58795	77M	10000000	0	Everyone	{Racing,"Action & Adventure"}	2018-05-21	1.6	4.0.3 and up
2644	Motocross Fun Simulator	PRODUCTIVITY	4.2	58675	1.3M	10000000	0	Everyone	{Productivity}	2018-03-09	0.1.187945513	5.0 and up
2645	Marvel Unlimited	PERSONALIZATION	4.3	58617	26M	1000000	0.99	Everyone	{Personalization}	2016-12-07	4.3.2	4.4 and up
2646	FastMeet: Chat, Dating, Love	PERSONALIZATION	4.3	58614	26M	1000000	0.99	Everyone	{Personalization}	2016-12-07	4.3.2	4.4 and up
2647	HungerStation	GAME	4.6	58575	96M	1000000	0	Teen	{Action}	2018-02-21	2.55	4.1 and up
2648	Motorola Spotlight Player™	FAMILY	4.2	58553	50M	1000000	0	Everyone	{Simulation}	2016-12-25	3.1	2.3.3 and up
2649	S S9 Launcher - Galaxy S8/S9 Launcher, theme, cool	GAME	4.4	58387	3.3M	1000000	0	Everyone	{Word}	2013-12-13	1.1.2	2.1 and up
2650	Book store	TOOLS	4.7	58366	6.3M	1000000	0	Everyone	{Tools}	2017-12-07	1	4.1 and up
2651	The Walking Dead: Our World	SOCIAL	4.2	58341	9.3M	1000000	0	Everyone	{Social}	2015-07-25	4.6.2.0	2.3 and up
2652	Google I/O 2018	FOOD_AND_DRINK	4.3	58316	Varies with device	5000000	0	Everyone	{"Food & Drink"}	2018-07-25	Varies with device	Varies with device
2653	Udacity - Lifelong Learning	FAMILY	4.1	58104	17M	5000000	0	Teen	{Entertainment}	2018-07-05	4.18.1	4.1 and up
2654	DS Speedometer & Odometer	ENTERTAINMENT	3.9	58082	Varies with device	10000000	0	Teen	{Entertainment}	2018-08-01	Varies with device	Varies with device
2655	Comedy Central	LIBRARIES_AND_DEMO	3.9	58055	41k	5000000	0	Everyone	{"Libraries & Demo"}	2016-11-07	2.0.3	1.5 and up
2656	Justice League Action Run	PERSONALIZATION	4.2	58052	4.0M	5000000	0	Teen	{Personalization}	2017-09-14	1.1.8	2.3.3 and up
2657	Pixyfy: coloring by number coloring book	ENTERTAINMENT	4.1	58028	17M	5000000	0	Teen	{Entertainment}	2018-07-05	4.18.1	4.1 and up
2658	C Programming	SHOPPING	4.7	57920	Varies with device	1000000	0	Everyone	{Shopping}	2018-05-31	Varies with device	Varies with device
2659	Four In A Line	SHOPPING	4.7	57920	Varies with device	1000000	0	Everyone	{Shopping}	2018-05-31	Varies with device	Varies with device
2660	Pu - Cute giant panda bear, baby pet care game	PRODUCTIVITY	4.6	57904	11M	1000000	0	Everyone	{Productivity}	2018-07-01	12.8.2-pi	4.2 and up
2661	English Conversation Courses	HEALTH_AND_FITNESS	4.4	57634	41M	1000000	0	Everyone	{"Health & Fitness"}	2018-06-25	7.4	4.1 and up
2662	HTC Weather	TRAVEL_AND_LOCAL	4.4	57573	Varies with device	5000000	0	Everyone	{"Travel & Local"}	2018-07-31	Varies with device	Varies with device
2663	💘 WhatsLov: Smileys of love, stickers and GIF	TRAVEL_AND_LOCAL	4.4	57573	Varies with device	5000000	0	Everyone	{"Travel & Local"}	2018-07-31	Varies with device	Varies with device
2664	My CookBook (Recipe Manager)	TRAVEL_AND_LOCAL	4.4	57556	Varies with device	5000000	0	Everyone	{"Travel & Local"}	2018-07-31	Varies with device	Varies with device
2665	Atlan3D Navigation: Korea navigator	FINANCE	4.6	57493	Varies with device	1000000	0	Everyone	{Finance}	2018-07-31	Varies with device	Varies with device
2666	Deep Sleep Battery Saver	FINANCE	4.6	57493	Varies with device	1000000	0	Everyone	{Finance}	2018-07-31	Varies with device	Varies with device
2667	The X-Files: Deep State - Hidden Object Adventure	PRODUCTIVITY	4.5	57449	5.0M	1000000	0	Everyone	{Productivity}	2018-08-04	1.2.187-83	4.0 and up
2668	Kitchen Stories - Recipes & Cooking	BOOKS_AND_REFERENCE	4.8	57400	14M	500000	0	Everyone	{"Books & Reference"}	2018-07-30	1.6.5	4.0 and up
2669	MyMo by GSB	SOCIAL	4.5	57146	Varies with device	1000000	0	Everyone	{Social}	2018-07-27	Varies with device	4.0.3 and up
2670	Battery Notifier BT Free	COMICS	4.7	57106	27M	1000000	0	Teen	{Comics}	2018-07-23	2.11.3	4.1 and up
2671	Cartoon Network Match Land	DATING	4.2	57083	7.9M	1000000	0	Mature 17+	{Dating}	2018-07-27	1.31.3	4.0.3 and up
2672	Don’t touch my phone	DATING	4.2	57081	7.9M	1000000	0	Mature 17+	{Dating}	2018-07-27	1.31.3	4.0.3 and up
2673	Jewels Star: OZ adventure	TOOLS	4.5	57076	35M	100000	4.49	Everyone	{Tools}	2018-07-24	Paid-9.4.1.3	4.1 and up
2674	Cinemark Theatres	PRODUCTIVITY	4.4	57033	Varies with device	5000000	0	Everyone	{Productivity}	2016-10-18	4.2.11	Varies with device
2675	Chrome Canary (Unstable)	EDUCATION	4.4	56897	97M	1000000	0	Everyone	{Education,"Brain Games"}	2017-01-16	1.10.0	4.1 and up
2676	HD Camera - Quick Snap Photo & Video	TOOLS	4.3	56848	9.6M	1000000	0	Everyone	{Tools}	2018-05-18	1.6.11	4.1 and up
2677	Infinity Dungeon VIP	NEWS_AND_MAGAZINES	4.1	56807	Varies with device	5000000	0	Everyone 10+	{"News & Magazines"}	2018-07-30	Varies with device	Varies with device
2678	Virtual Walkie Talkie	PRODUCTIVITY	4.4	56713	25M	1000000	0	Everyone	{Productivity}	2018-07-05	9.3.5776	4.1 and up
2679	CarMax – Cars for Sale: Search Used Car Inventory	FAMILY	3.7	56664	8.3M	1000000	0	Everyone	{Casual}	2015-02-05	1.4	2.3 and up
2680	DU Privacy-hide apps、sms、file	NEWS_AND_MAGAZINES	4.6	56524	14M	1000000	0	Teen	{"News & Magazines"}	2018-08-06	3.5.13	4.0.3 and up
2681	Real Airplane Flight Simulator: Pilot Games	GAME	4.3	56496	81M	1000000	0	Teen	{Action}	2018-08-07	1.5.447	4.0 and up
2682	Sport.pl LIVE	MAPS_AND_NAVIGATION	4.4	56471	Varies with device	5000000	0	Everyone	{"Maps & Navigation"}	2018-07-31	Varies with device	Varies with device
2683	Beauty Makeup – Photo Makeover	FAMILY	4.3	56444	43M	500000	4.99	Everyone	{Sports,"Action & Adventure"}	2017-02-08	04.00.40	2.3 and up
2684	Soccer Clubs Logo Quiz	MAPS_AND_NAVIGATION	4.5	56443	43M	1000000	0	Everyone	{"Maps & Navigation"}	2018-06-26	6.2.0	4.1 and up
2685	AT&T FamilyMap®	MAPS_AND_NAVIGATION	4.5	56409	43M	1000000	0	Everyone	{"Maps & Navigation"}	2018-06-26	6.2.0	4.1 and up
2686	Soviet Military Maps Free	PRODUCTIVITY	4.2	56403	49M	5000000	0	Everyone	{Productivity}	2018-07-27	4.0.5	4.4 and up
2687	Add Text To Photo	SPORTS	4.3	56270	15M	5000000	0	Everyone	{Sports}	2018-08-03	5.4.2	5.0 and up
2688	Expense IQ Money Manager	FAMILY	4.2	56259	23M	10000000	0	Everyone	{Casual}	2018-03-14	4	4.0 and up
2689	Sticky Note + : Sync Notes	LIFESTYLE	4.7	56197	15M	1000000	0	Everyone	{Lifestyle}	2018-08-06	1.6.17	1.6 and up
2690	Wisepilot for XPERIA™	HEALTH_AND_FITNESS	4.6	56145	23M	1000000	0	Everyone	{"Health & Fitness"}	2018-08-01	7.3.4-play	5.0 and up
2691	[adult swim]	PHOTOGRAPHY	4.3	56114	17M	10000000	0	Everyone	{Photography}	2018-07-09	2.6	2.3 and up
2692	RetroArch	EDUCATION	4.6	56065	37M	1000000	0	Everyone	{Education}	2018-07-26	3.3	4.1 and up
2693	Info BMKG	GAME	4.7	55952	61M	1000000	0	Everyone 10+	{Arcade}	2017-07-13	1.0.10	4.1 and up
2694	SUBWAY®	FAMILY	4.9	55723	14M	1000000	0	Everyone	{Entertainment}	2018-06-04	3.3	4.0.3 and up
2695	eBoox: book reader fb2 epub zip	EDUCATION	4.3	55704	15M	1000000	0	Everyone	{Education}	2018-08-04	4.2.8	4.1 and up
2696	Five Nights at Freddy’s 4	HEALTH_AND_FITNESS	4.7	55571	12M	1000000	0	Everyone	{"Health & Fitness"}	2018-02-21	1.23	4.0 and up
2697	Woody Puzzle	PERSONALIZATION	4.4	55525	22M	10000000	0	Everyone	{Personalization}	2018-02-26	1.2.7	4.0 and up
2698	Ao Oni2	PHOTOGRAPHY	3.9	55427	6.6M	10000000	0	Everyone	{Photography}	2016-03-25	5.1	2.3.3 and up
2699	Zoopla Property Search UK - Home to buy & rent	FAMILY	4.3	55408	Varies with device	1000000	0	Everyone	{Education}	2018-01-08	Varies with device	Varies with device
2700	mySugr: the blood sugar tracker made just for you	GAME	4.1	55380	39M	5000000	0	Everyone	{Action}	2018-07-24	1.2.1	5.0 and up
2701	DW Contacts & Phone & Dialer	MAPS_AND_NAVIGATION	4.2	55313	16M	1000000	0	Everyone	{"Maps & Navigation"}	2018-08-05	4.435	4.1 and up
2702	Groovebook Photo Books & Gifts	EDUCATION	4.4	55256	14M	5000000	0	Everyone	{Education}	2018-06-19	10.9.1	4.0 and up
2703	Office Bike Racing Simulator	EDUCATION	4.4	55256	14M	5000000	0	Everyone	{Education}	2018-06-19	10.9.1	4.0 and up
2704	Vietnam Today - Read online newspapers, the hottest news 24h	COMMUNICATION	4.1	55110	4.3M	1000000	0	Everyone	{Communication}	2018-06-20	2.2	4.0 and up
2705	The Room: Old Sins	COMMUNICATION	4.1	55098	4.3M	1000000	0	Everyone	{Communication}	2018-06-20	2.2	4.0 and up
2706	DJMAX TECHNIKA Q - Music Game	GAME	4.2	55014	28M	1000000	0	Teen	{Action}	2017-12-04	1.2.6	4.1 and up
2707	Resources For Virtual DJ	BOOKS_AND_REFERENCE	4.7	55011	68M	1000000	0	Everyone	{"Books & Reference"}	2017-11-02	1.1.3	4.1 and up
2708	Home Pony 2	VIDEO_PLAYERS	3.9	54815	Varies with device	100000000	0	Everyone	{"Video Players & Editors"}	2018-05-02	Varies with device	Varies with device
2709	AirWatch Agent	VIDEO_PLAYERS	3.9	54807	Varies with device	100000000	0	Everyone	{"Video Players & Editors"}	2018-05-02	Varies with device	Varies with device
2710	DU Browser Mini(Small&Fast)	EDUCATION	4.4	54798	11M	1000000	0	Everyone	{Education}	2018-07-30	20.7.2	4.4 and up
2711	Resume Builder Free, CV Maker & Resume Templates	SOCIAL	4.4	54768	2.6M	5000000	0	Everyone	{Social}	2018-05-16	3.6.1	4.0.3 and up
2712	All Email Providers	BUSINESS	4.3	54520	Varies with device	10000000	0	Everyone	{Business}	2018-07-30	3.12.4	Varies with device
2713	AS - News and sports results.	NEWS_AND_MAGAZINES	3.8	54256	Varies with device	5000000	0	Everyone	{"News & Magazines"}	2018-07-23	Varies with device	Varies with device
2714	ES Classic Theme	GAME	4.3	54221	47M	1000000	0	Everyone	{Racing}	2013-06-15	1.2	2.3 and up
2715	AMC	TOOLS	4.3	54207	4.4M	5000000	0	Everyone	{Tools}	2017-07-11	3.2	3.0 and up
2716	Bluetooth Auto Connect	WEATHER	4.5	54090	4.0M	5000000	0	Everyone	{Weather}	2018-02-28	6.6	4.0 and up
2717	Asana: organize team projects	GAME	4.4	54082	21M	10000000	0	Everyone	{Adventure}	2018-07-11	1.6.8	4.0.3 and up
2718	Running Weight Loss Walking Jogging Hiking FITAPP	TOOLS	4.2	54063	16M	5000000	0	Everyone	{Tools}	2018-06-01	2.7.2	4.1 and up
2719	Builder Craft: House Building & Exploration	MAPS_AND_NAVIGATION	4.1	54034	5.8M	5000000	0	Teen	{"Maps & Navigation"}	2018-05-30	2.1.15	4.0 and up
2720	TracFone My Account	MEDICAL	4.8	53747	13M	1000000	0	Everyone	{Medical}	2018-07-27	Varies with device	4.3 and up
2721	Learn to Read with Tommy Turtle	MEDICAL	4.8	53743	13M	1000000	0	Everyone	{Medical}	2018-07-27	Varies with device	4.3 and up
2722	HD Video Download for Facebook	LIFESTYLE	4.5	53652	39M	1000000	0	Everyone	{Lifestyle}	2018-08-05	2.15	5.0 and up
2723	Carros Rebaixados BR	MAPS_AND_NAVIGATION	4.5	53562	60M	1000000	0	Everyone	{"Maps & Navigation"}	2018-05-04	2.10.06	5.0 and up
2724	BOO! - Next Generation Messenger	MAPS_AND_NAVIGATION	4.1	53481	Varies with device	10000000	0	Everyone	{"Maps & Navigation"}	2018-05-22	Varies with device	Varies with device
2725	Capitec Remote Banking	PHOTOGRAPHY	4.4	53421	26M	10000000	0	Everyone	{Photography}	2018-08-06	2.74.685	4.0.3 and up
2726	Ei Samay - Bengali News Paper	FAMILY	3.9	53301	7.6M	10000000	0	Everyone	{Entertainment}	2017-06-16	1.6.0	4.0.3 and up
2727	Fever	LIFESTYLE	4	53144	21M	5000000	0	Everyone	{Lifestyle}	2018-07-13	4.8.0	5.0 and up
2728	SBB Mobile	PRODUCTIVITY	4.2	53015	2.2M	5000000	0	Everyone	{Productivity}	2017-11-12	2.2.2	2.3 and up
2729	Weight Loss Tracker - RecStyle	VIDEO_PLAYERS	4.7	53006	44M	1000000	0	Everyone	{"Video Players & Editors"}	2018-08-03	1.5.1	4.4 and up
2730	CoinMarketApp - CryptoCurrency Portfolio, News,ICO	SHOPPING	4.1	52896	Varies with device	10000000	0	Everyone	{Shopping}	2018-06-18	Varies with device	Varies with device
2731	AE + Aerie: Jeans, Dresses, Swimsuits & Bralettes	SHOPPING	4.1	52896	Varies with device	10000000	0	Everyone	{Shopping}	2018-06-18	Varies with device	Varies with device
2732	Teeny Titans - Teen Titans Go!	SHOPPING	4.1	52896	Varies with device	10000000	0	Everyone	{Shopping}	2018-06-18	Varies with device	Varies with device
2733	El Laberinto del Demonio 3D	EDUCATION	4.7	52743	5.4M	1000000	0	Everyone	{Education}	2017-12-25	3.5.2	4.0 and up
2734	Flashlight X	PRODUCTIVITY	4.3	52677	2.9M	1000000	0	Everyone	{Productivity}	2017-12-13	3.3	4.0 and up
2735	RPG End of Aspiration F	AUTO_AND_VEHICLES	4.2	52530	7.0M	5000000	0	Everyone	{"Auto & Vehicles"}	2018-07-16	4.47.3	4.0.3 and up
2736	Crazy Bike attack Racing New: motorcycle racing	GAME	4.2	52390	20M	5000000	0	Everyone	{Arcade}	2018-05-04	1.28ggl	2.3.3 and up
2737	Eve Period Tracker - Love, Sex & Relationships App	BOOKS_AND_REFERENCE	4.1	52312	11M	5000000	0	Teen	{"Books & Reference"}	2018-05-19	5.3.4	4.4 and up
2738	CWT To Go	FINANCE	3.6	52306	42M	5000000	0	Everyone	{Finance}	2018-07-27	20.1.0	5.0 and up
2739	StyleSeat	GAME	4.3	52199	Varies with device	1000000	0	Teen	{Casino}	2017-05-18	1.2.4.69	2.3 and up
2740	The Bump Pregnancy Tracker	GAME	4.1	52163	70M	1000000	0	Mature 17+	{Action}	2016-07-13	1.1.2	2.3 and up
2741	Pet Beauty Salon	TRAVEL_AND_LOCAL	4.4	52029	Varies with device	5000000	0	Everyone	{"Travel & Local"}	2018-06-29	Varies with device	5.0 and up
2742	Super ABC! Learning games for kids! Preschool apps	TRAVEL_AND_LOCAL	4.4	52028	Varies with device	5000000	0	Everyone	{"Travel & Local"}	2018-06-29	Varies with device	5.0 and up
2743	Colorfit - Drawing & Coloring	COMICS	4.4	51981	Varies with device	5000000	0	Everyone	{Comics}	2018-08-01	4.2.0.2	2.3 and up
2744	Wayfair - Shop All Things Home	FAMILY	4.6	51973	27M	1000000	0	Everyone	{"Role Playing"}	2018-08-02	1.2.5	4.4 and up
2745	Alchemy Classic Ad Free	FAMILY	4.1	51895	22M	10000000	0	Everyone	{Educational,"Brain Games"}	2018-06-16	18.1	4.2 and up
2746	Insight Timer - Free Meditation App	FAMILY	4.2	51838	15M	5000000	0	Everyone	{Casual,Creativity}	2017-11-21	1.6	4.1 and up
2747	Market Update Helper	GAME	4.2	51791	57M	1000000	0	Everyone	{Racing}	2018-06-06	1.53	4.1 and up
2748	Baldur’s Gate: Enhanced Edition	GAME	4.2	51787	Varies with device	5000000	0	Everyone	{Arcade}	2018-01-12	Varies with device	Varies with device
2749	LG Health	DATING	4	51698	63M	1000000	0	Mature 17+	{Dating}	2018-07-26	3.0.0	4.0.3 and up
2750	APE Weather ( Live Forecast)	NEWS_AND_MAGAZINES	4.5	51684	8.5M	10000000	0	Teen	{"News & Magazines"}	2018-07-31	4.2.2254.129147	Varies with device
2751	Fu*** Weather (Funny Weather)	SOCIAL	4.3	51569	26M	1000000	0	Teen	{Social}	2018-07-30	5.4.7	4.1 and up
2752	Clue	FOOD_AND_DRINK	4.7	51543	Varies with device	1000000	0	Everyone	{"Food & Drink"}	2018-08-01	Varies with device	Varies with device
2753	Third Eye	GAME	3.8	51523	36M	500000	0	Teen	{Adventure}	2018-08-02	1.0.90	7.0 and up
2754	Fresh EBT - Food Stamp Balance	FOOD_AND_DRINK	4.7	51517	Varies with device	1000000	0	Everyone	{"Food & Drink"}	2018-08-01	Varies with device	Varies with device
2755	Car Driving Simulator Drift	BUSINESS	4.4	51510	Varies with device	5000000	0	Everyone	{Business}	2018-08-02	Varies with device	Varies with device
2756	My Budget Book	BUSINESS	4.4	51507	Varies with device	5000000	0	Everyone	{Business}	2018-08-02	Varies with device	Varies with device
2757	Mobile Number Tracker	BUSINESS	4.4	51507	Varies with device	5000000	0	Everyone	{Business}	2018-08-02	Varies with device	Varies with device
2758	OBJECTIVE	SOCIAL	4.3	51504	20M	5000000	0	Teen	{Social}	2018-07-25	2.69	5.0 and up
2759	Hands ’n Guns Simulator	SOCIAL	4.3	51502	20M	5000000	0	Teen	{Social}	2018-07-25	2.69	5.0 and up
2760	Starfall Free & Member	GAME	3.6	51366	16M	5000000	0	Everyone	{Racing}	2017-06-14	Varies with device	2.3 and up
2761	ByssWeather for Wear OS	LIFESTYLE	4.6	51357	80M	5000000	0	Everyone	{Lifestyle}	2018-07-31	8	4.0 and up
2762	Sleeping Delivery	BOOKS_AND_REFERENCE	4.4	51269	6.1M	1000000	0	Everyone	{"Books & Reference"}	2018-07-19	7.0.4.6	4.2 and up
2763	SleepyTime: Bedtime Calculator	HEALTH_AND_FITNESS	4.8	51227	28M	1000000	0	Everyone	{"Health & Fitness"}	2018-07-13	4.0.1	4.0.3 and up
2764	ER Surgery Simulator	PERSONALIZATION	4.1	51145	6.2M	10000000	0	Everyone	{Personalization}	2018-06-28	1	4.0.3 and up
2765	Moment	COMMUNICATION	4.5	51110	Varies with device	1000000	2.99	Everyone	{Communication}	2018-08-03	Varies with device	Varies with device
2766	Relax Melodies P: Sleep Sounds	FAMILY	4.8	51068	57M	100000	4.99	Teen	{"Role Playing"}	2018-06-21	1.574	4.0.3 and up
2767	MyChart	GAME	4	51067	48M	5000000	0	Teen	{Action}	2018-05-29	1.18	4.1 and up
2768	Frontback - Social Photos	PHOTOGRAPHY	4.3	50893	35M	1000000	0	Everyone	{Photography}	2014-11-20	1.0.6	4.0.3 and up
2769	Discovery K!ds Play!	FAMILY	4.3	50887	91M	5000000	0	Everyone	{Education,Education}	2018-07-03	7.2.0	4.4 and up
2770	SONIC Drive-In	FAMILY	4.2	50771	Varies with device	1000000	0	Everyone	{Education}	2016-05-12	Varies with device	Varies with device
2771	Content Transfer	ENTERTAINMENT	4.6	50725	19M	5000000	0	Everyone	{Entertainment}	2018-05-25	1.0.64	4.0.3 and up
2772	Dr. Shogi	HEALTH_AND_FITNESS	4.5	50679	38M	1000000	0	Everyone	{"Health & Fitness"}	2018-08-01	3.6.2	4.4 and up
2773	Learn SQL	MAPS_AND_NAVIGATION	4.4	50459	Varies with device	5000000	0	Everyone	{"Maps & Navigation"}	2018-07-26	Varies with device	Varies with device
2774	Transformers Rescue Bots: Disaster Dash	FAMILY	3.3	50428	Varies with device	5000000	0	Teen	{Entertainment}	2018-07-25	Varies with device	5.0 and up
2775	DU Emoji Keyboard（Simeji）	PHOTOGRAPHY	4.7	50424	82M	1000000	0	Everyone	{Photography}	2018-08-02	584	4.1 and up
2776	TouchNote: Cards & Gifts	LIFESTYLE	4.6	50338	Varies with device	1000000	0	Everyone	{Lifestyle}	2018-07-23	Varies with device	Varies with device
2777	Baby Panda’s Juice Shop	HEALTH_AND_FITNESS	4.7	50294	11M	1000000	0	Everyone	{"Health & Fitness"}	2018-07-09	3.0.7	4.1 and up
2778	Golf Channel	SPORTS	3.5	50179	23M	1000000	0	Everyone	{Sports}	2018-08-02	2.5.7.1	5.0 and up
2779	BURGER KING® MOBILE APP	SPORTS	3.5	50179	23M	1000000	0	Everyone	{Sports}	2018-08-02	2.5.7.1	5.0 and up
2780	ePN Cashback AliExpress	PHOTOGRAPHY	4	50109	Varies with device	10000000	0	Everyone	{Photography}	2018-06-07	Varies with device	Varies with device
2781	Attack the Light	FAMILY	4.6	50060	98M	1000000	0	Everyone	{Puzzle,"Brain Games"}	2018-08-07	1.4.83	4.1 and up
2782	Cardinal Quest 2	SPORTS	4.5	50017	41M	1000000	0	Adults only 18+	{Sports}	2018-07-24	3.21.324	4.4 and up
2783	Monster High™ Minis Mania	GAME	4.5	49971	61M	5000000	0	Everyone	{Arcade}	2017-08-29	1.3.1	4.0.3 and up
2784	Free & Premium VPN - FinchVPN	PRODUCTIVITY	4.5	49794	6.5M	1000000	0	Everyone	{Productivity}	2017-06-17	1.7.3	2.3 and up
2785	NOOK App for NOOK Devices	BEAUTY	4.9	49790	14M	1000000	0	Everyone	{Beauty}	2017-11-09	2.3.0	4.1 and up
2786	Meditate OM	PHOTOGRAPHY	4.3	49680	8.7M	5000000	0	Everyone	{Photography}	2018-07-11	1.8.5	4.2 and up
2787	Guns Royale - Multiplayer Blocky Battle Royale	PERSONALIZATION	4.6	49657	8.7M	5000000	0	Everyone	{Personalization}	2018-08-06	3.6.21_pre	4.4 and up
2788	Facebook Ads Manager	SOCIAL	4.4	49580	4.0M	10000000	0	Everyone	{Social}	2018-06-04	1.24	4.1 and up
2789	KPOP Amino for K-Pop Entertainment	PHOTOGRAPHY	4.4	49553	48M	1000000	5.99	Everyone	{Photography}	2018-07-25	1.3.1	4.1 and up
2790	Dino War: Rise of Beasts	PHOTOGRAPHY	4.4	49553	48M	1000000	5.99	Everyone	{Photography}	2018-07-25	1.3.1	4.1 and up
2791	Jungle Marble Blast	PHOTOGRAPHY	4.4	49553	48M	1000000	5.99	Everyone	{Photography}	2018-07-25	1.3.1	4.1 and up
2792	ABC News - US & World News	PHOTOGRAPHY	3.5	49523	Varies with device	5000000	0	Everyone	{Photography}	2016-10-05	Varies with device	Varies with device
2793	Dollhouse Decorating Games	HEALTH_AND_FITNESS	4	49479	57M	1000000	0	Teen	{"Health & Fitness"}	2018-07-10	5.13.0	5.0 and up
2794	Caf - My Account	FAMILY	4.5	49381	6.8M	1000000	0	Everyone	{Puzzle}	2018-06-25	1.0.17	2.0 and up
2795	EZ Launcher	FINANCE	4.6	49275	91M	500000	0	Everyone	{Finance}	2018-07-17	2.0.3.1	4.4 and up
2796	6 Pack Promise - Ultimate Abs	NEWS_AND_MAGAZINES	4.1	49259	Varies with device	5000000	0	Everyone 10+	{"News & Magazines"}	2018-08-02	Varies with device	Varies with device
2797	Romantic Love Photo Frames	NEWS_AND_MAGAZINES	4.1	49259	Varies with device	5000000	0	Everyone 10+	{"News & Magazines"}	2018-08-02	Varies with device	Varies with device
2798	Hush - Beauty for Everyone	NEWS_AND_MAGAZINES	4.1	49259	Varies with device	5000000	0	Everyone 10+	{"News & Magazines"}	2018-08-02	Varies with device	Varies with device
2799	Little Pets Animal Guardians	PHOTOGRAPHY	4.1	49211	1.9M	1000000	0	Everyone	{Photography}	2017-01-19	1.5.5	2.1 and up
2800	National Rail Enquiries	FAMILY	4.6	49210	99M	1000000	0	Everyone 10+	{"Role Playing"}	2018-07-05	1.2.1107	4.1 and up
2801	WE	TRAVEL_AND_LOCAL	4.4	49190	25M	1000000	0	Everyone	{"Travel & Local"}	2018-06-15	7.5.0	5.0 and up
2802	pixiv comic - everyone’s manga app	SOCIAL	4.4	49173	4.0M	10000000	0	Everyone	{Social}	2018-06-04	1.24	4.1 and up
2803	Weather	LIFESTYLE	4.1	49147	13M	1000000	0	Everyone	{Lifestyle}	2018-05-07	2.9.5	4.1 and up
2804	Anti Adware	TOOLS	4.6	48979	14M	1000000	0	Everyone	{Tools}	2018-08-04	5.0.0.8	4.0.3 and up
2805	Speed Cameras Radar	TRAVEL_AND_LOCAL	4.4	48930	15M	5000000	0	Everyone	{"Travel & Local"}	2018-07-26	4.38.176	4.4 and up
2806	HD Movie Video Player	TRAVEL_AND_LOCAL	4.4	48930	15M	5000000	0	Everyone	{"Travel & Local"}	2018-07-26	4.38.176	4.4 and up
2807	BBC Sport	TRAVEL_AND_LOCAL	4.4	48930	15M	5000000	0	Everyone	{"Travel & Local"}	2018-07-26	4.38.176	4.4 and up
2808	Doctor On Demand	FAMILY	3.8	48929	45M	5000000	0	Everyone	{Educational,Education}	2017-09-08	1.5.0	4.0 and up
2809	Amazon Drive	DATING	4	48845	40M	1000000	0	Mature 17+	{Dating}	2018-08-01	4.19.0.2320	4.4 and up
2810	The Game of Life	DATING	4	48845	40M	1000000	0	Mature 17+	{Dating}	2018-08-01	4.19.0.2320	4.4 and up
2811	IHG®: Hotel Deals & Rewards	FAMILY	4.5	48754	9.3M	100000	0.99	Everyone	{Arcade,"Action & Adventure"}	2014-10-07	1.5.2	2.3 and up
2905	HomeWork	TOOLS	4.2	43677	Varies with device	1000000	0	Everyone	{Tools}	2017-08-30	20170828	Varies with device
2812	Draw.ly - Color by Number Pixel Art Coloring	SHOPPING	3.8	48732	20M	10000000	0	Everyone	{Shopping}	2018-07-31	7.8.1	4.0 and up
2813	X Construction	FAMILY	4	48731	68M	5000000	0	Everyone	{Simulation}	2018-04-19	4.0.5	4.1 and up
2814	Abs workout - 21 Day Fitness Challenge	FAMILY	4.7	48701	24M	10000000	0	Everyone	{Simulation,"Action & Adventure"}	2018-05-22	1.4.12	4.1 and up
2815	Strike! Ten Pin Bowling	GAME	4.7	48615	24M	10000000	0	Everyone	{Simulation,"Action & Adventure"}	2018-05-22	1.4.12	4.1 and up
2816	My Diet Diary Calorie Counter	FAMILY	4.7	48615	24M	10000000	0	Everyone	{Simulation,"Action & Adventure"}	2018-05-22	1.4.12	4.1 and up
2817	Showtime Anytime	FAMILY	3.8	48545	38M	1000000	0	Everyone	{Casual}	2018-08-03	1.2.14	4.1 and up
2818	AT&T Smart Wi-Fi	FAMILY	4.4	48451	52M	1000000	0	Teen	{Strategy}	2018-08-01	4.6.00	4.0.3 and up
2819	Fast Download Manager	FINANCE	4	48445	10M	5000000	0	Everyone	{Finance}	2018-07-16	2.6.0	4.0.3 and up
2820	ForecaWeather	FAMILY	4.4	48427	Varies with device	500000	0	Everyone 10+	{Puzzle}	2018-03-31	Varies with device	Varies with device
2821	Ready4 GMAT (Prep4 GMAT)	HEALTH_AND_FITNESS	4.6	48286	Varies with device	1000000	0	Everyone	{"Health & Fitness"}	2018-07-27	Varies with device	Varies with device
2822	Chilindo	HEALTH_AND_FITNESS	4.8	48276	7.5M	1000000	0	Everyone	{"Health & Fitness"}	2018-08-04	3.0.6	4.4 and up
2823	Add Watermark Free	GAME	4.6	48256	62M	1000000	0	Everyone	{Puzzle}	2018-07-20	1.2.0	4.1 and up
2824	German Listening	HEALTH_AND_FITNESS	4.3	48253	Varies with device	1000000	0	Everyone	{"Health & Fitness"}	2017-12-13	Varies with device	Varies with device
2825	Sygic Truck GPS Navigation	HEALTH_AND_FITNESS	4.6	48226	28M	1000000	0	Everyone	{"Health & Fitness"}	2018-03-05	3.1.9	4.0.3 and up
2826	GLASS GO Launcher EX Theme	HEALTH_AND_FITNESS	4.6	48226	28M	1000000	0	Everyone	{"Health & Fitness"}	2018-03-05	3.1.9	4.0.3 and up
2827	AE Lucky Fishing	TOOLS	4.8	48211	7.4M	1000000	0	Everyone	{Tools}	2017-11-18	32.1	4.1 and up
2828	CJmall	TRAVEL_AND_LOCAL	4	48082	Varies with device	5000000	0	Everyone	{"Travel & Local"}	2018-07-25	4.1.3	4.0.3 and up
2829	Puffin Browser Pro	EDUCATION	4.3	47847	21M	1000000	0	Everyone	{Education}	2017-06-13	6.1.3	4.0.3 and up
2830	Moto Display	TRAVEL_AND_LOCAL	4.4	47780	19M	5000000	0	Everyone	{"Travel & Local"}	2018-07-31	Varies with device	Varies with device
2831	Weather Radar Widget	TRAVEL_AND_LOCAL	4.4	47777	19M	5000000	0	Everyone	{"Travel & Local"}	2018-07-31	Varies with device	Varies with device
2832	Farming Simulator 18	GAME	4.3	47698	4.1M	5000000	0	Everyone	{Board}	2016-04-12	1.0.21	1.5 and up
2833	Flights	SPORTS	3.9	47688	17M	5000000	0	Everyone	{Sports}	2016-05-18	1.0.15	2.3 and up
2834	CB Radio Chat - for friends!	GAME	4.4	47644	15M	5000000	0	Everyone	{Puzzle}	2018-06-15	2.4.2	4.0 and up
2835	Don’t Starve: Pocket Edition	FAMILY	4.5	47644	27M	1000000	0	Everyone	{Adventure,"Action & Adventure"}	2018-05-31	10.18053	4.0.3 and up
2836	Mirrativ: Live Stream Any App	FAMILY	4.1	47576	14M	1000000	0	Everyone 10+	{Simulation}	2017-03-01	1.95	4.0 and up
2837	Loop - Habit Tracker	LIFESTYLE	4.1	47497	34M	10000000	0	Everyone	{Lifestyle}	2018-06-08	5.3.0.54.7	5.0 and up
2838	Fandom: Five Nights at Freddys	FAMILY	4.7	47463	22M	1000000	0	Everyone	{Education}	2018-04-24	4.4	4.0.3 and up
2839	My baby Piano	PERSONALIZATION	4.4	47393	7.2M	10000000	0	Everyone	{Personalization}	2018-05-24	1.8.0.24_180511	5.0 and up
2840	Selfie Camera	GAME	3.8	47386	96M	1000000	0	Everyone	{Racing}	2018-06-06	31	4.2 and up
2841	Choice Hotels	GAME	4.2	47340	61M	1000000	0	Teen	{Card}	2018-07-30	2.2.15	4.1 and up
2842	Yoriza Pension - travel, lodging, pension, camping, caravan, pool villas accommodation discount	BOOKS_AND_REFERENCE	4.8	47303	21M	1000000	0	Everyone	{"Books & Reference"}	2018-06-02	18.05.31+530	4.1 and up
2843	Hostelworld: Hostels & Cheap Hotels Travel App	FAMILY	4.1	47213	14M	5000000	0	Everyone	{Entertainment,"Pretend Play"}	2017-12-09	1.8	4.2 and up
2844	AE Master Moto	GAME	4	47151	36M	5000000	0	Everyone 10+	{Action}	2017-12-26	2.4.0	4.3 and up
2845	Battery HD Pro	PHOTOGRAPHY	4.4	47090	Varies with device	5000000	0	Everyone	{Photography}	2018-07-28	Varies with device	Varies with device
2846	Little Lovely Dentist	NEWS_AND_MAGAZINES	4.3	47069	Varies with device	5000000	0	Everyone 10+	{"News & Magazines"}	2018-06-25	Varies with device	Varies with device
2847	Fruit Boom	FAMILY	4.2	47031	58M	1000000	0	Everyone	{Simulation,"Action & Adventure"}	2018-07-30	3.2.4	4.4 and up
2848	Spreaker Podcast Radio	ENTERTAINMENT	4.4	46916	4.5M	1000000	0	Everyone	{Entertainment}	2018-07-18	7.3	4.2 and up
2849	StarTimes - Live International Champions Cup	GAME	3.5	46801	60M	1000000	0	Everyone	{Card}	2018-08-03	3.4.6	4.1 and up
2850	DW - Breaking World News	FAMILY	4.6	46741	50M	10000000	0	Everyone	{Music,"Music & Video"}	2018-08-03	1.73	4.0.3 and up
2851	Home Decoration Game	COMMUNICATION	4.3	46702	Varies with device	1000000	0	Everyone	{Communication}	2018-07-04	Varies with device	Varies with device
2852	FamilySearch Tree	ENTERTAINMENT	3.4	46618	Varies with device	5000000	0	Teen	{Entertainment}	2018-07-19	Varies with device	Varies with device
2853	Weather Live Pro	FOOD_AND_DRINK	4.1	46539	Varies with device	5000000	0	Teen	{"Food & Drink"}	2018-07-23	Varies with device	Varies with device
2854	LA Stories 4 New Order Sandbox 2018	BUSINESS	4.2	46505	19M	1000000	0	Everyone	{Business}	2018-08-02	3.4.49	4.1 and up
2855	Smart File Manager	BUSINESS	4.2	46505	19M	1000000	0	Everyone	{Business}	2018-08-02	3.4.49	4.1 and up
2856	Zombie Death Shooter	GAME	4.2	46416	73M	10000000	0	Everyone	{Arcade}	2018-07-23	1.0.8	4.1 and up
2857	Rate Guide Bill Letter	FAMILY	4.5	46369	33M	10000000	0	Everyone	{Educational,"Brain Games"}	2018-07-13	2.3	4.0.3 and up
2858	Greeting Cards & Wishes	BUSINESS	4.3	46353	21M	1000000	0	Everyone	{Business}	2016-04-13	2.8	1.5 and up
2859	Sudy – Meet Elite & Rich Single	FAMILY	4.9	46253	56M	500000	0	Everyone 10+	{Simulation}	2018-02-07	1.0.1	4.0 and up
2860	AE Spider Solitaire	PHOTOGRAPHY	4.3	46242	5.2M	1000000	0	Everyone	{Photography}	2016-09-20	2.1.3	4.0 and up
2861	LEGO® TV	SHOPPING	4.3	46153	17M	10000000	0	Everyone	{Shopping}	2018-08-04	2.124.01	4.4 and up
2862	JailBase - Arrests + Mugshots	SHOPPING	4.3	46153	17M	10000000	0	Everyone	{Shopping}	2018-08-04	2.124.01	4.4 and up
2863	Hotels Combined - Cheap deals	FINANCE	4.5	46106	22M	1000000	0	Everyone	{Finance}	2018-07-31	1.28.0.5402	4.4 and up
2864	B&H Photo Video Pro Audio	BUSINESS	3.9	45964	16M	1000000	0	Everyone	{Business}	2018-07-18	5.1.5	4.1 and up
2865	Myth Defense 2: DF	FINANCE	4.3	45962	Varies with device	1000000	0	Everyone	{Finance}	2018-07-31	Varies with device	Varies with device
2866	Instacart: Grocery Delivery	FINANCE	4.3	45957	Varies with device	1000000	0	Everyone	{Finance}	2018-07-31	Varies with device	Varies with device
2867	Like A Boss	GAME	4.4	45871	99M	5000000	0	Teen	{Action}	2017-05-08	1.6	2.3 and up
2868	Sexy Hot Detector Prank	TOOLS	3.1	45838	16M	50000000	0	Everyone	{Tools}	2018-07-25	7.6.1	4.1 and up
2869	Used Cars and Trucks for Sale	FAMILY	4.6	45771	28M	1000000	0	Mature 17+	{Entertainment}	2018-06-08	1.39	4.1 and up
2870	Block Puzzle Classic Legend !	VIDEO_PLAYERS	4.1	45744	Varies with device	10000000	0	Everyone	{"Video Players & Editors"}	2016-06-03	9.51.755029	4.4 and up
2871	HTC Sense Input	COMICS	4.1	45651	Varies with device	5000000	0	Teen	{Comics}	2018-05-24	Varies with device	Varies with device
2872	American Airlines	TOOLS	4.1	45610	176k	10000000	0	Everyone	{Tools}	2018-01-02	1.56	1.6 and up
2873	Slice: Package Tracker	FAMILY	4.3	45579	64M	1000000	0	Everyone	{Arcade,"Action & Adventure"}	2016-04-14	1.1.0	4.0 and up
2874	Prism Pay Bills, Track Money, Personal Finance	TRAVEL_AND_LOCAL	4.4	45562	Varies with device	5000000	0	Everyone	{"Travel & Local"}	2018-07-30	4.0.9.1	4.1 and up
2875	AllTrails: Hiking, Running & Mountain Bike Trails	GAME	4.3	45558	53M	5000000	0	Everyone 10+	{Action}	2018-05-24	1.1.9	4.1 and up
2876	Flashlight Ultimate	COMMUNICATION	4.1	45487	Varies with device	10000000	0	Everyone	{Communication}	2016-10-27	Varies with device	Varies with device
2877	V for Voodoo	TOOLS	3.6	45483	Varies with device	10000000	0	Everyone	{Tools}	2018-07-30	Varies with device	Varies with device
2878	Cytus II	FAMILY	4.5	45458	35M	1000000	0	Mature 17+	{Entertainment}	2018-08-03	1.5.49	4.4 and up
2879	Amtrak	BEAUTY	4.5	45452	9.2M	5000000	0	Everyone	{Beauty}	2018-07-19	1.25	4.0 and up
2880	Magnum 3.0 Gun Custom SImulator	FAMILY	4.3	45370	14M	1000000	0	Teen	{Simulation}	2018-08-02	2.59.8	2.3 and up
2881	Stocks: Realtime Quotes Charts	SHOPPING	4.3	45362	Varies with device	5000000	0	Everyone	{Shopping}	2018-07-20	Varies with device	Varies with device
2882	Snaappy – 3D fun AR core communication platform	FAMILY	4	45359	32M	1000000	0	Everyone 10+	{"Role Playing"}	2018-07-26	1.0.9	4.4 and up
2883	Hipmunk Hotels & Flights	LIFESTYLE	4	45224	49M	5000000	0	Everyone	{Lifestyle}	2018-08-01	6.5.1	4.1 and up
2884	Dollar General - Digital Coupons, Ads And More	PHOTOGRAPHY	4.2	44941	16M	1000000	0	Everyone	{Photography}	2016-10-19	1.6.2	3.0 and up
2885	Map Coordinates	HEALTH_AND_FITNESS	4.4	44939	Varies with device	10000000	0	Everyone	{"Health & Fitness"}	2018-06-14	Varies with device	Varies with device
2886	Scarf Fashion Designer	ART_AND_DESIGN	4.2	44829	20M	10000000	0	Teen	{"Art & Design"}	2018-04-02	3.8	4.1 and up
2887	Fate/Grand Order (English)	COMMUNICATION	4.2	44706	Varies with device	1000000	0	Everyone	{Communication}	2018-07-25	Varies with device	Varies with device
2888	U by BB&T	FAMILY	3.8	44636	Varies with device	1000000	0	Everyone	{Simulation}	2017-01-23	Varies with device	Varies with device
2889	USPS MOBILE®	SHOPPING	4.5	44588	20M	5000000	0	Everyone	{Shopping}	2018-07-12	9.0.0	4.4 and up
2890	White Sound Pro	SHOPPING	4.5	44588	20M	5000000	0	Everyone	{Shopping}	2018-07-12	9.0.0	4.4 and up
2891	Pencil Photo Sketch-Sketching Drawing Photo Editor	ENTERTAINMENT	4.3	44550	72M	1000000	0	Everyone	{Entertainment}	2018-07-18	6.18.3	5.0 and up
2892	AU Mobile Indonesia	FINANCE	4	44545	Varies with device	1000000	0	Everyone	{Finance}	2018-07-31	Varies with device	Varies with device
2893	Guide for CS:GO	MAPS_AND_NAVIGATION	4.5	44348	11M	5000000	0	Everyone	{"Maps & Navigation"}	2018-07-06	6.2.3	4.1 and up
2894	Nights Keeper (do not disturb)	NEWS_AND_MAGAZINES	4.5	44274	8.0M	1000000	0	Everyone	{"News & Magazines"}	2018-08-06	4.0.6	4.4 and up
2895	Invoice 2go — Professional Invoices and Estimates	SHOPPING	3.8	44255	15M	10000000	0	Everyone	{Shopping}	2018-08-03	6.0.4	4.1 and up
2896	SugarSync	COMMUNICATION	4.2	44233	31M	10000000	0	Everyone	{Communication}	2018-07-02	Fennec-52.9.0esr/TorBrowser-7.5-1/Orfox-1.5.4-RC-1	4.0.3 and up
2897	Love Images	SHOPPING	4.3	44071	56M	5000000	0	Everyone	{Shopping}	2018-07-19	5.1	4.4 and up
2898	Scientific Calculator Free	FAMILY	3.9	44062	54M	1000000	0	Everyone	{Casual,"Pretend Play"}	2016-12-30	1.3	4.0.3 and up
2899	CW Seed	FAMILY	4.1	44027	52M	5000000	0	Mature 17+	{Strategy}	2018-02-21	1.0.9	2.3 and up
2900	Today Calendar 2017	PERSONALIZATION	4.4	43960	9.8M	10000000	0	Everyone	{Personalization}	2017-12-01	2.0.0.39_171124	5.0 and up
2901	Camera FV-5	TRAVEL_AND_LOCAL	3.8	43935	Varies with device	10000000	0	Everyone	{"Travel & Local"}	2018-08-01	8.13.3	5.0 and up
2902	Block Gun 3D: Haunted Hollow	FAMILY	4.5	43852	77M	10000000	0	Everyone	{"Role Playing","Pretend Play"}	2018-07-19	1.9.10	4.1 and up
2903	theScore esports	HOUSE_AND_HOME	4.3	43847	Varies with device	1000000	0	Everyone	{"House & Home"}	2018-07-06	Varies with device	Varies with device
2904	Dubai Racing	HOUSE_AND_HOME	4.3	43800	Varies with device	1000000	0	Everyone	{"House & Home"}	2018-07-06	Varies with device	Varies with device
2906	Advanced Download Manager Holo	GAME	4.5	43645	46M	5000000	0	Everyone	{Arcade}	2018-05-25	2.2.13	4.1 and up
2907	Batman: Gotham’s Most Wanted!	FOOD_AND_DRINK	4	43614	25M	1000000	0	Everyone	{"Food & Drink"}	2016-10-12	2.14.36	4.0.3 and up
2908	Entel	SPORTS	4	43611	27M	1000000	0	Everyone	{Sports}	2018-06-27	3.17.0+3	5.0 and up
2909	Five Nights at Freddy’s: SL	SPORTS	4	43611	27M	1000000	0	Everyone	{Sports}	2018-06-27	3.17.0+3	5.0 and up
2910	pCloud: Free Cloud Storage	GAME	4.5	43576	50M	5000000	0	Everyone	{Arcade}	2017-09-13	4.4	2.3 and up
2911	Visual Voicemail by MetroPCS	FAMILY	4.6	43314	83M	1000000	0	Everyone 10+	{"Role Playing","Action & Adventure"}	2017-06-20	1.0.2	4.1 and up
2912	City Taxi Driver sim 2016: Cab simulator Game-s	FINANCE	4.4	43313	40M	1000000	0	Everyone	{Finance}	2018-07-09	5.16.2	4.1 and up
2913	Blinkist - Nonfiction Books	PHOTOGRAPHY	4.1	43296	Varies with device	5000000	0	Everyone	{Photography}	2017-09-20	Varies with device	Varies with device
2914	VZ Navigator	MAPS_AND_NAVIGATION	4.2	43269	Varies with device	5000000	0	Everyone	{"Maps & Navigation"}	2018-07-18	4.4.7	Varies with device
2915	GPS Speedometer, Distance Meter	MAPS_AND_NAVIGATION	4.2	43252	Varies with device	5000000	0	Everyone	{"Maps & Navigation"}	2018-07-18	4.4.7	Varies with device
2916	ZOMBIE RIPPER	SPORTS	4.2	43191	14M	5000000	0	Everyone	{Sports}	2018-01-10	1.0.3	2.1 and up
2917	Body scanner (prank)	FAMILY	4.3	43090	95M	5000000	0	Everyone	{Action,"Action & Adventure"}	2018-06-29	2.8.0	4.0 and up
2918	PixelDot - Color by Number Sandbox Pixel Art	BOOKS_AND_REFERENCE	4.4	43088	3.0M	1000000	0	Teen	{"Books & Reference"}	2017-04-19	2.7.3	4.0 and up
2919	Top Mercato: football news	FAMILY	4.3	43060	95M	5000000	0	Everyone	{Action,"Action & Adventure"}	2018-06-29	2.8.0	4.0 and up
2920	NetSpend Prepaid	FAMILY	4.3	43060	95M	5000000	0	Everyone	{Action,"Action & Adventure"}	2018-06-29	2.8.0	4.0 and up
2921	AEMET’s time	GAME	4.3	43055	95M	5000000	0	Everyone	{Action,"Action & Adventure"}	2018-06-29	2.8.0	4.0 and up
2922	FINAL FANTASY V	TRAVEL_AND_LOCAL	4.8	43054	Varies with device	1000000	0	Everyone	{"Travel & Local"}	2018-08-06	Varies with device	Varies with device
2923	Mappy - Plan, route comparison, GPS	TOOLS	4.6	43045	Varies with device	1000000	2.99	Everyone	{Tools}	2018-06-25	Varies with device	Varies with device
2924	Remote | Fire TV | Android TV | KODI | CetusPlay	COMMUNICATION	4.2	42925	2.8M	1000000	0	Everyone	{Communication}	2017-08-27	6.1	2.3 and up
2925	FC Porto	SHOPPING	4.1	42871	23M	1000000	0	Everyone	{Shopping}	2018-07-27	8.9.1	4.1 and up
2926	2ndLine - Second Phone Number	TRAVEL_AND_LOCAL	4.5	42849	Varies with device	1000000	0	Everyone	{"Travel & Local"}	2016-08-10	Varies with device	Varies with device
2927	Drugs.com Medication Guide	EDUCATION	4.5	42828	Varies with device	1000000	0	Everyone	{Education}	2018-07-20	Varies with device	Varies with device
2928	Nights at Cube Pizzeria 3D – 3	FINANCE	4.4	42809	23M	1000000	0	Everyone	{Finance}	2018-07-27	3.04 - Beta	4.1 and up
2929	Play Tube	SPORTS	4.2	42767	72M	1000000	0	Everyone	{Sports}	2018-07-26	2.0.5	4.3 and up
2930	Rossmann PL	SHOPPING	4.2	42750	9.9M	10000000	0	Everyone	{Shopping}	2018-08-04	2.8.7	4.1 and up
2931	GPS Speedometer and Odometer	BOOKS_AND_REFERENCE	4.5	42729	Varies with device	5000000	0	Everyone	{"Books & Reference"}	2014-11-26	Varies with device	Varies with device
2932	Free Resume App	PHOTOGRAPHY	4.3	42677	22M	1000000	0	Everyone	{Photography}	2018-06-15	1.28	4.0.3 and up
2933	Dr. Parker : Real car parking simulation	FINANCE	3.8	42644	19M	5000000	0	Everyone	{Finance}	2018-06-28	8.18	4.2 and up
2934	The Vikings	NEWS_AND_MAGAZINES	4.3	42624	16M	1000000	0	Everyone 10+	{"News & Magazines"}	2018-08-01	6.6.4	4.0 and up
2935	AX Player -Nougat Video Player	SOCIAL	4.5	42621	23M	1000000	0	Teen	{Social}	2018-08-07	2.1.05	4.4 and up
2936	The Fish Master!	TRAVEL_AND_LOCAL	4.2	42546	24M	5000000	0	Everyone	{"Travel & Local"}	2018-04-25	7.6.5	4.4 and up
2937	Tools & Mi Band	GAME	3.7	42529	92M	500000	1.99	Teen	{Action}	2016-11-23	2.8.2	4.1 and up
2938	SNCF	FAMILY	3	42515	1.6M	5000000	0	Everyone	{Casual}	2018-05-23	1.0.3	2.3.3 and up
2939	Bluebird by American Express	FINANCE	3.4	42497	61M	1000000	0	Teen	{Finance}	2018-07-02	10.1.28.560	4.3 and up
2940	Kids Photo Frames	BUSINESS	4.4	42492	Varies with device	1000000	0	Everyone	{Business}	2018-07-11	Varies with device	Varies with device
2941	WiFi Overview 360	BUSINESS	4.4	42492	Varies with device	1000000	0	Everyone	{Business}	2018-07-11	Varies with device	Varies with device
2942	T map (te map, T map, navigation)	FAMILY	4.3	42432	36M	1000000	0	Everyone	{Simulation}	2016-07-13	1.3	2.3.3 and up
2943	Free Radar Detector	FINANCE	4.5	42410	Varies with device	1000000	0	Everyone	{Finance}	2018-08-03	Varies with device	Varies with device
2944	Couch to 5K by RunDouble	COMMUNICATION	3.9	42370	37M	1000000	0	Everyone	{Communication}	2018-06-25	7.5.1	5.0 and up
2945	BTNotification	COMMUNICATION	3.7	42329	Varies with device	5000000	0	Everyone	{Communication}	2018-06-04	Varies with device	Varies with device
2946	Funny Alarm Clock Ringtones	DATING	4	42197	Varies with device	5000000	0	Mature 17+	{Dating}	2018-07-24	Varies with device	Varies with device
2947	EasyNote Notepad | To Do List	DATING	4	42194	Varies with device	5000000	0	Mature 17+	{Dating}	2018-07-24	Varies with device	Varies with device
2948	SeatGeek – Tickets to Sports, Concerts, Broadway	PERSONALIZATION	4.2	42190	11M	5000000	0	Teen	{Personalization}	2018-07-08	Varies with device	Varies with device
2949	Diabetes:M	GAME	4	42182	3.4M	1000000	0	Everyone	{Arcade}	2018-01-06	1.11	4.1 and up
2950	Supermarket Manager: Cashier Simulator Kids Games	GAME	4.4	42145	20M	10000000	0	Everyone	{Casual,"Brain Games"}	2018-07-04	2.9.3181	4.0.3 and up
2951	E! News	FAMILY	4.4	42145	20M	10000000	0	Everyone	{Casual,"Brain Games"}	2018-07-04	2.9.3181	4.0.3 and up
2952	AntennaPict β	GAME	4.1	42079	93M	5000000	0	Everyone	{Board}	2018-07-05	5.6.5	4.1 and up
2953	Pic Stitch - #1 Collage Maker	PHOTOGRAPHY	4.3	42079	17M	1000000	0	Everyone	{Photography}	2015-09-24	Varies with device	4.0.3 and up
2954	Ice Crush 2018 - A new Puzzle Matching Adventure	FAMILY	4.4	42069	Varies with device	1000000	0	Teen	{Entertainment}	2018-08-03	Varies with device	Varies with device
2955	Free live weather on screen	GAME	4.3	42053	24M	10000000	0	Everyone	{Puzzle}	2018-06-21	4.9	4.0.3 and up
2956	Samsung Notes	BEAUTY	4.7	42050	Varies with device	1000000	0	Everyone	{Beauty}	2018-06-05	5.4	5.0 and up
2957	Mind Games Pro	ENTERTAINMENT	4.4	42050	Varies with device	1000000	0	Teen	{Entertainment}	2018-08-03	Varies with device	Varies with device
2958	Video Caller Id	SHOPPING	4	41986	26M	5000000	0	Teen	{Shopping}	2018-08-06	3.69.0	4.1 and up
2959	VRV: Anime, game videos & more	GAME	4.4	41975	79M	1000000	0	Everyone	{Racing}	2018-07-19	3.00.11034	5.0 and up
2960	Standard Bank / Stanbic Bank	LIFESTYLE	3.7	41941	14M	10000000	0	Everyone	{Lifestyle}	2018-07-30	9.6.3	4.4 and up
2961	Moana Island Life	LIFESTYLE	3.7	41917	14M	10000000	0	Everyone	{Lifestyle}	2018-07-30	9.6.3	4.4 and up
2962	FC Barcelona Fantasy Manager: Real football mobile	FAMILY	4.1	41867	78M	1000000	0	Everyone	{Racing,"Action & Adventure"}	2017-05-18	1.4.2.1	2.3.3 and up
2963	Maps & GPS Navigation OsmAnd+	GAME	4	41759	12M	1000000	0	Everyone	{Arcade}	2014-01-19	2.4.4	2.0 and up
2964	Manga Zero - Japanese cartoon and comic reader	LIFESTYLE	4	41747	39M	5000000	0	Everyone	{Lifestyle}	2017-01-12	3.7.1	4.1 and up
2965	Citizens Bank Mobile Banking	FAMILY	4.2	41693	74M	1000000	0	Everyone	{Simulation}	2018-06-04	1.0.23	4.0 and up
2966	PakWheels: Buy & Sell Cars	GAME	3.9	41683	63M	1000000	0	Everyone	{Arcade}	2017-02-02	1.67	2.3 and up
2967	QuickBooks Self-Employed:Mileage Tracker and Taxes	BUSINESS	4.7	41625	5.4M	1000000	0	Everyone	{Business}	2017-12-21	2.3.4	4.1 and up
2968	InstaCam - Camera for Selfie	PRODUCTIVITY	4.5	41624	3.4M	1000000	0	Everyone	{Productivity}	2018-05-24	1.2.4	4.0.3 and up
2969	S’more - Earn Cash Rewards	BOOKS_AND_REFERENCE	4.6	41608	49M	1000000	0	Everyone	{"Books & Reference"}	2017-11-05	1.1.7	2.2 and up
2970	Mingle - Online Dating App to Chat & Meet People	DATING	4.4	41605	8.1M	500000	0	Mature 17+	{Dating}	2018-07-26	4.813	4.0.3 and up
2971	Authy 2-Factor Authentication	TOOLS	3.6	41502	Varies with device	50000000	0	Everyone	{Tools}	2018-07-31	Varies with device	Varies with device
2972	PORTABLE SOCCER DX Lite	NEWS_AND_MAGAZINES	3.4	41490	25M	5000000	0	Teen	{"News & Magazines"}	2018-07-24	4.6.0	4.1 and up
2973	Meu Cartão BV	GAME	4.2	41444	56M	1000000	0	Teen	{Action}	2016-07-31	1.0.11	4.0.3 and up
2974	Wi-Fi Auto-connect	COMMUNICATION	4.3	41420	19M	5000000	0	Everyone	{Communication}	2018-06-21	3.2.0	4.0 and up
2975	PokerStars Play: Free Texas Holdem Poker Game	PRODUCTIVITY	4.4	41418	1.2M	1000000	0	Everyone	{Productivity}	2016-12-11	v1.39.3	2.2 and up
2976	SEEK Job Search	PHOTOGRAPHY	4.5	41331	5.0M	5000000	0	Everyone	{Photography}	2018-07-31	1.4.4	4.0.3 and up
2977	OpenRice	FAMILY	4.2	41273	16M	5000000	0	Everyone	{Adventure,"Action & Adventure"}	2018-07-05	1.5	4.1 and up
2978	Burner - Free Phone Number	SOCIAL	4.4	41269	Varies with device	1000000	0	Mature 17+	{Social}	2017-05-10	1.3.6.4	4.0.3 and up
2979	TwitCasting Live	MAPS_AND_NAVIGATION	4.2	41225	Varies with device	5000000	0	Everyone	{"Maps & Navigation"}	2018-08-03	Varies with device	Varies with device
2980	OO Launcher for Android O 8.0 Oreo™ Launcher	EDUCATION	4.5	41185	Varies with device	1000000	0	Everyone	{Education}	2018-08-03	Varies with device	Varies with device
2981	Shooter Sniper CS - FPS Games	EDUCATION	4.5	41185	Varies with device	1000000	0	Everyone	{Education}	2018-08-03	Varies with device	Varies with device
2982	Keep Trainer - Workout Trainer & Fitness Coach	TOOLS	4	41137	4.6M	1000000	0	Everyone	{Tools}	2017-11-15	1.7.3	3.2 and up
2983	BET NOW - Watch Shows	GAME	4.2	41089	42M	5000000	0	Teen	{Action}	2018-07-25	2.7	4.1 and up
2984	Jewels Crush- Match 3 Puzzle	SHOPPING	4.1	41074	16M	5000000	0	Everyone	{Shopping}	2018-06-27	68	4.1 and up
2985	SDA Sabbath School Quarterly	PERSONALIZATION	4.6	41000	2.0M	1000000	0	Everyone	{Personalization}	2014-02-23	2.4.0	1.6 and up
2986	LokLok: Draw on a Lock Screen	NEWS_AND_MAGAZINES	4.1	40975	36M	1000000	0	Everyone 10+	{"News & Magazines"}	2018-08-02	4.4.2.19	4.1 and up
2987	Secure Folder	NEWS_AND_MAGAZINES	4.1	40975	36M	1000000	0	Everyone 10+	{"News & Magazines"}	2018-08-02	4.4.2.19	4.1 and up
2988	Chest Calculator for CR	TOOLS	3.8	40934	5.2M	1000000	0	Everyone	{Tools}	2018-07-28	acremotecontrol18	4.0.3 and up
2989	BetterMe: Weight Loss Workouts	TOOLS	4.3	40907	2.6M	5000000	0	Everyone	{Tools}	2017-07-27	6.0.932740	2.2 and up
2990	Chegg Study - Homework Help	GAME	4.2	40847	94M	1000000	0	Everyone	{Action}	2016-01-08	3.1.0	2.3.3 and up
2991	Disaster Will Strike	TOOLS	4.3	40770	Varies with device	100000000	0	Everyone	{Tools}	2017-11-21	Varies with device	Varies with device
2992	realestate.com.au - Buy, Rent & Sell Property	COMMUNICATION	3.9	40751	35M	10000000	0	Teen	{Communication}	2016-11-04	2.2.7600	4.0.3 and up
2993	BankMobile Vibe App	PERSONALIZATION	4.6	40704	Varies with device	100000	4.49	Everyone	{Personalization}	2018-03-16	Varies with device	Varies with device
2994	Case Simulator Hero for CS:GO	FAMILY	3.7	40678	15M	1000000	0	Everyone	{Casual}	2017-05-22	2.1.3	4.0 and up
2995	Multicraft Miner Exploration	TOOLS	4.2	40676	25M	1000000	0	Everyone	{Tools}	2018-07-05	2.27.1	4.1 and up
2996	Sound Recorder: Recorder & Voice Changer Free	TOOLS	4.5	40617	21M	5000000	0	Everyone	{Tools}	2018-07-31	65	4.1 and up
2997	Lufthansa	WEATHER	4.4	40606	15M	10000000	0	Everyone	{Weather}	2018-08-05	v7.0.02.3.0516.1_06_0713	5.0 and up
2998	Adguard Content Blocker	PRODUCTIVITY	4.1	40437	Varies with device	5000000	0	Everyone	{Productivity}	2018-02-06	Varies with device	Varies with device
2999	Ultimate Background Eraser	PRODUCTIVITY	4.5	40328	23M	1000000	0	Everyone	{Productivity}	2016-10-17	1.9	2.3 and up
3000	Microsoft To-Do: List, Task & Reminder	HEALTH_AND_FITNESS	4.5	40296	Varies with device	1000000	0	Everyone	{"Health & Fitness"}	2018-06-15	Varies with device	Varies with device
3001	Dr. Cares - Pet Rescue 911 🐶	PHOTOGRAPHY	4.4	40289	19M	5000000	0	Everyone	{Photography}	2018-07-11	2.2	5.0 and up
3002	ES Material Theme for Pro	COMMUNICATION	4.3	40241	Varies with device	5000000	0	Everyone	{Communication}	2018-06-30	1.0.52	4.1 and up
3003	Fooducate Healthy Weight Loss & Calorie Counter	TRAVEL_AND_LOCAL	4.2	40225	4.1M	1000000	0	Everyone	{"Travel & Local"}	2018-07-18	4.0.3	4.1 and up
3004	Self Healing	AUTO_AND_VEHICLES	4.3	40211	Varies with device	5000000	0	Everyone	{"Auto & Vehicles"}	2018-07-30	Varies with device	Varies with device
3005	Sandbox Number Coloring Book Art - Color By Number	EDUCATION	4.2	40209	Varies with device	1000000	0	Everyone	{Education}	2018-05-24	Varies with device	Varies with device
3006	Mermaids	NEWS_AND_MAGAZINES	4.2	40167	8.7M	1000000	0	Everyone	{"News & Magazines"}	2018-07-30	3.12.0	4.4 and up
3007	Thai Sic Bo	FOOD_AND_DRINK	4.3	40116	Varies with device	1000000	0	Everyone	{"Food & Drink"}	2018-08-02	Varies with device	Varies with device
3008	Dr. Parker : Parking Simulator	EVENTS	4	40113	36M	5000000	0	Everyone	{Events}	2018-07-23	Varies with device	Varies with device
3009	S Player - Lightest and Most Powerful Video Player	DATING	4.2	40039	6.5M	1000000	0	Mature 17+	{Dating}	2018-07-27	1.31.3	4.0.3 and up
3010	Lotto Results - Mega Millions Powerball Lottery US	DATING	4.2	40035	6.5M	1000000	0	Mature 17+	{Dating}	2018-07-27	1.31.3	4.0.3 and up
3011	Oral-B App	GAME	4.1	39895	25M	5000000	0	Mature 17+	{Adventure}	2018-01-02	1.2.3	4.1 and up
3012	Innovative: Learn 34 Languages	SPORTS	4.3	39878	6.1M	1000000	0	Everyone	{Sports}	2018-07-28	3.6.7	4.1 and up
3013	20 Minuten (CH)	TOOLS	4.3	39833	9.9M	1000000	0	Everyone	{Tools}	2018-07-09	2.5.1.7592	4.0.3 and up
3014	ao	FAMILY	4	39779	19M	5000000	0	Everyone	{"Video Players & Editors","Music & Video"}	2016-08-05	4.0.1	4.0.3 and up
3015	League18	SHOPPING	4.2	39735	18M	5000000	0	Teen	{Shopping}	2018-07-25	3.13.09	4.0 and up
3016	Turo - Better Than Car Rental	SHOPPING	4.2	39735	18M	5000000	0	Teen	{Shopping}	2018-07-25	3.13.09	4.0 and up
3017	Air Traffic	SHOPPING	4.2	39735	18M	5000000	0	Teen	{Shopping}	2018-07-25	3.13.09	4.0 and up
3018	My Effectiveness: To do, Tasks	LIFESTYLE	4.6	39724	Varies with device	1000000	0	Everyone	{Lifestyle}	2018-06-29	Varies with device	Varies with device
3019	Recipes Pastries and homemade pies More than 500 recipes for pastries	GAME	4.4	39698	51M	5000000	0	Everyone	{Arcade}	2016-12-01	1.0.0	4.1 and up
3020	Weather Forecast Pro	FAMILY	4	39682	6.2M	1000000	0	Everyone	{Entertainment}	2018-04-03	3.5.5	4.1 and up
3021	Koi Live Wallpaper	FAMILY	4.1	39661	47M	1000000	0	Teen	{"Role Playing"}	2018-08-02	1.10.4	5.0 and up
3022	Toddler Kids Puzzles PUZZINGO	FAMILY	4	39647	72M	10000000	0	Everyone 10+	{Casual}	2017-09-30	1.7	4.0.3 and up
3023	NDS Emulator - For Android 6	VIDEO_PLAYERS	3.9	39495	59M	5000000	0	Everyone	{"Video Players & Editors"}	2018-06-26	1.1.4.1296	4.4 and up
3024	Onet - news, weather, sport	FAMILY	4.8	39480	14M	500000	0	Everyone	{Puzzle}	2017-06-16	4.1.1	4.1 and up
3025	iDates - Chats, Flirts, Dating, Love & Relations	LIFESTYLE	4.4	39364	28M	5000000	0	Everyone	{Lifestyle}	2018-07-17	10.19	4.0.3 and up
3026	Text on Photo - Fonteee	HOUSE_AND_HOME	4.6	39189	Varies with device	1000000	0	Everyone	{"House & Home"}	2018-07-30	Varies with device	Varies with device
3027	NSE Mobile Trading	FAMILY	4.7	39153	98M	1000000	0	Everyone	{Puzzle}	2018-07-25	1.1.7	4.1 and up
3028	Financial Calculator India	HOUSE_AND_HOME	4.5	39123	Varies with device	1000000	0	Everyone	{"House & Home"}	2018-08-03	Varies with device	Varies with device
3029	7 Cups: Anxiety & Stress Chat	FAMILY	4.3	39109	4.0M	1000000	0	Everyone	{Entertainment}	2017-12-20	6.5	4.0 and up
3030	Garden Coloring Book	HEALTH_AND_FITNESS	4.8	39068	4.0M	500000	0	Everyone	{"Health & Fitness"}	2018-07-07	1.2.2	4.1 and up
3031	GRE Flashcards	FINANCE	4.4	39041	Varies with device	1000000	0	Everyone	{Finance}	2018-08-03	Varies with device	Varies with device
3032	Q*bert: Rebooted	FAMILY	3.9	39038	9.5M	5000000	0	Mature 17+	{Entertainment}	2018-06-06	2.9.8	4.4 and up
3033	Messenger Pro	SHOPPING	4.3	38961	27M	5000000	0	Everyone	{Shopping}	2018-08-02	14.2.1	5.0 and up
3034	AT&T Visual Voicemail	GAME	4.3	38957	Varies with device	1000000	0	Everyone	{Simulation}	2018-08-02	4.9.31	Varies with device
3035	XCOM®: Enemy Within	PHOTOGRAPHY	4.5	38953	9.7M	5000000	0	Everyone	{Photography}	2018-07-26	2.2.4	4.2 and up
3036	PJ Masks: HQ	AUTO_AND_VEHICLES	4.3	38846	8.6M	1000000	0	Everyone	{"Auto & Vehicles"}	2018-07-28	2.20 Build 02	4.1 and up
3037	Binaural Beats Therapy	SOCIAL	4.3	38826	7.0M	10000000	0	Everyone	{Social}	2018-08-07	1.6	4.1 and up
3038	Stickman Warriors Heroes 2	FAMILY	3.5	38824	12M	1000000	0	Mature 17+	{Entertainment}	2018-01-21	2.4.1	5.0 and up
3039	Cricket Visual Voicemail	ENTERTAINMENT	4.2	38769	44M	1000000	0	Mature 17+	{Entertainment}	2015-09-22	7.2.3	2.3 and up
3040	Al Mayadeen	GAME	3.7	38767	4.1M	5000000	0	Everyone 10+	{Action}	2011-04-11	1.4.3	2.0 and up
3041	Ready4 SAT (Prep4 SAT)	TOOLS	4.1	38679	5.9M	10000000	0	Everyone	{Tools}	2018-02-01	v3.7.93	5.0 and up
3042	Zombie Avengers:(Dreamsky)Stickman War Z	TOOLS	4.1	38655	5.9M	10000000	0	Everyone	{Tools}	2018-02-01	v3.7.93	5.0 and up
3043	Girly Wallpapers Backgrounds	VIDEO_PLAYERS	4.4	38630	89M	1000000	0	Everyone	{"Video Players & Editors"}	2018-08-05	2.1.6	4.4 and up
3044	Boomerang	VIDEO_PLAYERS	4.3	38607	2.9M	1000000	0	Everyone	{"Video Players & Editors"}	2017-03-19	3.1.8	2.3 and up
3045	HTC File Manager	FAMILY	3.7	38606	96M	1000000	0	Everyone	{Entertainment}	2018-06-13	5.9.0.0031	4.1 and up
3046	RPG Dragon Lapis	FAMILY	4.4	38517	17M	1000000	0	Teen	{Entertainment}	2018-08-02	2.29.2	5.0 and up
3047	WeFi - Free Fast WiFi Connect & Find Wi-Fi Map	HEALTH_AND_FITNESS	4.5	38487	60M	1000000	0	Teen	{"Health & Fitness"}	2018-07-03	5.1.0	4.1 and up
3048	Launcher Oreo 8.1	FAMILY	4.2	38473	23M	10000000	0	Everyone	{Casual,"Pretend Play"}	2018-04-11	1.0.5	4.1 and up
3049	JustDating	GAME	4	38448	27M	5000000	0	Everyone	{Racing}	2018-06-16	1.4.3	4.1 and up
3050	Live Weather & Daily Local Weather Forecast	GAME	4.4	38419	100M	1000000	0.99	Everyone 10+	{Action}	2018-08-03	2.3.24	4.1 and up
3051	Eh Amego!	MAPS_AND_NAVIGATION	4.7	38375	49M	1000000	0	Everyone	{"Maps & Navigation"}	2018-07-26	3.0.2	4.1 and up
3052	AutoScout24 Switzerland – Find your new car	HEALTH_AND_FITNESS	4.4	38343	55M	1000000	0	Everyone	{"Health & Fitness"}	2018-07-27	18.7.1	5.0 and up
3053	Masha and The Bear Puzzle Game	GAME	4.5	38297	6.4M	10000000	0	Everyone	{Arcade}	2018-07-05	1.0.8	4.0.3 and up
3054	BombSquad Remote	GAME	4.5	38207	15M	100000	9.99	Teen	{"Role Playing"}	2015-10-19	1.0.6	4.1 and up
3055	Gaode Map	HEALTH_AND_FITNESS	4.9	38098	11M	5000000	0	Everyone	{"Health & Fitness"}	2018-06-21	1.0.4	4.2 and up
3056	Footej Camera	PHOTOGRAPHY	3.9	38055	4.1M	5000000	0	Everyone	{Photography}	2017-06-16	1.17	4.0 and up
3057	Garden Fever - Free!	FAMILY	4.1	38021	19M	10000000	0	Everyone	{Casual,"Music & Video"}	2018-07-06	18.2	4.0.3 and up
3058	ricardo.ch	FAMILY	4.1	38021	19M	10000000	0	Everyone	{Casual,"Music & Video"}	2018-07-06	18.2	4.0.3 and up
3059	HTC Social Plugin - Facebook	TOOLS	4.1	37975	23M	5000000	0	Everyone	{Tools}	2017-02-02	1.4.0	4.1 and up
3060	NPR One	MAPS_AND_NAVIGATION	4.5	37937	25M	1000000	0	Everyone	{"Maps & Navigation"}	2018-08-01	3.6.7	4.0.3 and up
3061	Keller Williams Real Estate	NEWS_AND_MAGAZINES	4.3	37882	9.1M	1000000	0	Teen	{"News & Magazines"}	2018-06-01	8.2.9	4.0.3 and up
3062	Tencent Video - Supporting the whole network	EDUCATION	4.6	37862	5.4M	1000000	0	Everyone	{Education}	2018-06-07	1.8.1	4.1 and up
3063	stranger chat - anonymous chat	EDUCATION	4.6	37862	5.4M	1000000	0	Everyone	{Education}	2018-06-07	1.8.1	4.1 and up
3064	Reuters News	GAME	4	37789	58M	1000000	0	Teen	{Adventure}	2018-06-06	1.5.2	4.1 and up
3065	Sago Mini Friends	HOUSE_AND_HOME	4.3	37711	40M	1000000	0	Everyone	{"House & Home"}	2018-07-31	2.51.0	4.4 and up
3066	Law of Creation: A Playable Manga	TOOLS	4.5	37607	Varies with device	1000000	0	Everyone	{Tools}	2018-04-04	Varies with device	Varies with device
3067	Ghostery Privacy Browser	FAMILY	3.2	37584	34M	5000000	0	Everyone	{Casual,"Pretend Play"}	2016-08-31	1.0.8	4.1 and up
3068	Golf GPS Rangefinder: Golf Pad	FINANCE	4.3	37580	Varies with device	5000000	0	Everyone	{Finance}	2018-08-01	4.5.2.1	4.4 and up
3069	F-Secure Mobile Security	FOOD_AND_DRINK	4.3	37517	17M	5000000	0	Everyone	{"Food & Drink"}	2018-07-20	11.11.1	4.1 and up
3070	JackThreads: Men’s Shopping	GAME	4.3	37513	31M	5000000	0	Everyone	{Arcade}	2015-12-07	4	2.3 and up
3071	Destiny Ninja Shall we date otome games love story	TOOLS	4.1	37333	Varies with device	50000000	0	Everyone	{Tools}	2016-01-17	Varies with device	Varies with device
3072	Bixby Button Remapper - bxActions	COMMUNICATION	4.3	37320	8.4M	1000000	0	Everyone	{Communication}	2018-07-30	6.5.1	4.0.3 and up
3073	Dating for 50 plus Mature Singles – FINALLY	GAME	4.9	37302	35M	500000	0	Everyone	{Card}	2017-05-08	1.3.3	4.1 and up
3074	Limbo PC Emulator QEMU ARM x86	PRODUCTIVITY	4.3	37277	13M	1000000	0	Everyone	{Productivity}	2018-02-26	2.3.1	4.0.3 and up
3075	Call of Duty:Black Ops Zombies	SHOPPING	4.5	37253	31M	1000000	0	Everyone	{Shopping}	2018-08-03	4.31.2	4.4 and up
3076	Upgrade for Android DU Master	PERSONALIZATION	4.2	37237	3.9M	5000000	0	Everyone	{Personalization}	2014-04-04	3.5.6	1.6 and up
3077	Fertility Friend Ovulation App	PERSONALIZATION	4.4	37234	7.3M	1000000	0	Everyone	{Personalization}	2018-03-22	1.4.9	4.1 and up
3078	Candy Pop Story	HEALTH_AND_FITNESS	4.6	37224	Varies with device	1000000	0	Everyone	{"Health & Fitness"}	2018-06-13	Varies with device	Varies with device
3079	PBS KIDS Games	PRODUCTIVITY	4.2	37204	19M	1000000	0	Everyone	{Productivity}	2018-07-21	3.4.4.4-GP	4.0 and up
3080	Ladies’ Ab Workout FREE	SHOPPING	4.5	37186	7.9M	1000000	0	Everyone	{Shopping}	2018-06-30	3.4.5	4.0 and up
3081	Lapse It • Time Lapse • Pro	SPORTS	4.6	37167	Varies with device	1000000	0	Everyone	{Sports}	2018-07-30	Varies with device	4.4 and up
3082	Map My Hike GPS Hiking	FAMILY	4.2	37165	22M	1000000	0	Teen	{Simulation}	2018-02-14	5.1.0	2.3 and up
3083	Texas Hold’em Poker	SPORTS	4.6	37140	71M	1000000	0	Everyone	{Sports}	2018-08-01	1.3.11	4.1 and up
3084	Sandbox Art-Sandbox Color by Number Coloring Pages	GAME	4.7	37139	49M	1000000	0	Everyone 10+	{Action}	2018-01-24	8	4.1 and up
3085	Doctor X - ER On Wheels	FAMILY	4.4	37122	89M	1000000	0	Everyone	{Educational}	2018-06-14	1.03	4.1 and up
3086	Iqiyi (for tablet)	SOCIAL	4.7	37090	4.8M	500000	0	Teen	{Social}	2018-08-01	5.4	4.1 and up
3087	Coloring & Learn	DATING	4.3	37053	44M	1000000	0	Mature 17+	{Dating}	2018-08-03	4.4B	4.1 and up
3088	Slendrina X	GAME	4.4	37023	33M	10000000	0	Everyone	{Casual}	2018-07-06	5.2	5.0 and up
3089	Learn programming	ENTERTAINMENT	4.4	37000	15M	1000000	0	Mature 17+	{Entertainment}	2018-06-21	4.0.5	4.1 and up
3090	F-Stop Gallery	COMMUNICATION	4.4	36981	4.0M	1000000	0	Everyone	{Communication}	2018-07-06	5.2	5.0 and up
3091	Unit Converter Pro	VIDEO_PLAYERS	4.6	36969	27M	1000000	0	Everyone	{"Video Players & Editors"}	2018-08-06	1.137.22	4.3 and up
3092	Home Workout for Men - Bodybuilding	FAMILY	4.8	36968	16M	1000000	0	Everyone	{Entertainment}	2017-11-03	1.2.9	2.3 and up
3093	Kernel Manager for Franco Kernel ✨	COMMUNICATION	4	36901	6.6M	5000000	0	Everyone	{Communication}	2018-07-04	11.8.6	4.0.3 - 7.1.1
3094	G-Switch 2	WEATHER	4.6	36900	4.8M	500000	0	Everyone	{Weather}	2018-07-28	1.3.6	4.0 and up
3095	My Vodafone (GR)	COMMUNICATION	4.4	36893	4.0M	1000000	0	Everyone	{Communication}	2018-07-06	5.2	5.0 and up
3096	OpenCV Manager	COMMUNICATION	4.4	36880	4.0M	1000000	0	Everyone	{Communication}	2018-07-06	5.2	5.0 and up
3097	DC All Access	HOUSE_AND_HOME	4.6	36857	19M	1000000	0	Everyone	{"House & Home"}	2018-07-25	220	5.0 and up
3098	BBW Dating & Plus Size Chat	HOUSE_AND_HOME	4.6	36857	19M	1000000	0	Everyone	{"House & Home"}	2018-07-25	220	5.0 and up
3099	Lightning Web Browser	ART_AND_DESIGN	4.1	36815	29M	1000000	0	Everyone	{"Art & Design"}	2018-06-14	6.1.61.1	4.2 and up
3100	ÖBB Scotty	FAMILY	4.6	36813	33M	500000	0	Everyone	{Entertainment}	2018-05-01	4.2.0	4.1 and up
3101	Hypocam	FINANCE	4.2	36746	Varies with device	5000000	0	Everyone	{Finance}	2018-07-24	Varies with device	Varies with device
3102	Restaurant Finder	FINANCE	3.7	36718	Varies with device	5000000	0	Everyone	{Finance}	2018-07-16	Varies with device	Varies with device
3103	B-Messenger Video Chat	ART_AND_DESIGN	4.1	36639	Varies with device	5000000	0	Everyone	{"Art & Design"}	2018-07-14	Varies with device	2.3.3 and up
3104	My Dressing - Fashion closet	FAMILY	4.5	36606	Varies with device	10000000	0	Everyone	{Educational,Education}	2018-06-22	Varies with device	4.0 and up
3105	DS video	FAMILY	4	36578	Varies with device	1000000	0	Everyone	{Education,"Pretend Play"}	2018-08-03	Varies with device	Varies with device
3106	S Note	TOOLS	4.8	36557	14M	1000000	0	Everyone	{Tools}	2018-08-03	2.51f	5.0 and up
3107	Codes for GTA San Andreas	SPORTS	4.3	36490	Varies with device	1000000	0	Everyone	{Sports}	2018-07-25	Varies with device	Varies with device
3108	The House of Da Vinci	FAMILY	4.4	36268	41M	1000000	0	Teen	{Entertainment}	2017-04-25	3.0.15	4.2 and up
3109	SHOWTIME	SPORTS	4.5	36255	25M	1000000	0	Everyone	{Sports}	2018-08-01	5.10.5	4.1 and up
3110	Graphing Calculator	SPORTS	4.5	36255	25M	1000000	0	Everyone	{Sports}	2018-08-01	5.10.5	4.1 and up
3111	Al-Quran 30 Juz free copies	FAMILY	4.2	36214	Varies with device	5000000	0	Everyone	{Education,"Music & Video"}	2018-07-12	Varies with device	Varies with device
3112	Simple Notepad	EDUCATION	4.2	36212	Varies with device	5000000	0	Everyone	{Education,"Music & Video"}	2018-07-12	Varies with device	Varies with device
3113	Even - organize your money, get paid early	SPORTS	4.2	36183	20M	5000000	0	Teen	{Sports}	2018-01-20	1.4	2.1 and up
3114	PixBox Coloring - Color by number Sandbox	FAMILY	4.1	36151	46M	1000000	0	Everyone	{Simulation}	2017-04-22	2.7	3.2 and up
3115	SnowMobile Parking Adventure	FAMILY	3.8	36028	50M	5000000	0	Everyone	{Educational,Education}	2018-07-02	1.3.51	4.4 and up
3116	Investigation Discovery GO	FAMILY	3.9	35989	46M	1000000	0	Everyone	{Simulation}	2015-08-07	2.3	2.3.3 and up
3117	Nokia mobile support	ENTERTAINMENT	4	35931	19M	1000000	0	Teen	{Entertainment}	2018-07-16	3.1.4	4.4 and up
3118	Canon CameraWindow	ENTERTAINMENT	4	35931	19M	1000000	0	Teen	{Entertainment}	2018-07-16	3.1.4	4.4 and up
3119	UBA Mobile Banking	ENTERTAINMENT	4	35928	19M	1000000	0	Teen	{Entertainment}	2018-07-16	3.1.4	4.4 and up
3120	Northern Lights FREE (Aurora)	PERSONALIZATION	4.1	35771	3.5M	5000000	0	Everyone	{Personalization}	2018-05-04	4.1	4.1 and up
3121	[ROOT] X Privacy Installer	SPORTS	3.8	35746	55M	5000000	0	Everyone	{Sports}	2017-12-15	1.4.3	4.0.3 and up
3122	Fuzzy Seasons: Animal Forest	PHOTOGRAPHY	4	35725	9.9M	1000000	0	Everyone	{Photography}	2015-02-11	1.4	4.0 and up
3123	Open in WhatsApp (click to chat)	PHOTOGRAPHY	4	35724	9.9M	1000000	0	Everyone	{Photography}	2015-02-11	1.4	4.0 and up
3124	Qeek for Instagram - Zoom profile insta DP	GAME	3.8	35572	Varies with device	1000000	0	Teen	{Arcade}	2013-09-04	Varies with device	Varies with device
3125	FUN Keyboard – Emoji Keyboard, Sticker,Theme & GIF	SHOPPING	4.4	35563	4.2M	1000000	0	Everyone	{Shopping}	2018-07-23	10.2.1	4.1 and up
3126	漫咖 Comics - Manga,Novel and Stories	TRAVEL_AND_LOCAL	4.2	35560	13M	5000000	0	Everyone	{"Travel & Local"}	2016-07-05	4.0.21	4.0.3 and up
3127	Ecobank Mobile Banking	FINANCE	3.6	35518	Varies with device	1000000	0	Everyone	{Finance}	2018-07-02	Varies with device	Varies with device
3128	Color by Number: Pixel Art	SHOPPING	4.5	35497	16M	1000000	0	Everyone	{Shopping}	2018-07-11	4.16.0	4.4 and up
3129	Bike Computer - GPS Cycling Tracker	SHOPPING	4.5	35479	16M	1000000	0	Everyone	{Shopping}	2018-07-11	4.16.0	4.4 and up
3130	Lavender Emoji Keyboard Theme	SPORTS	4.5	35394	21M	500000	0	Everyone	{Sports}	2018-07-05	1.2.0	4.2 and up
3131	Baby puzzles	FAMILY	3.5	35337	7.4M	5000000	0	Teen	{Entertainment}	2018-05-25	1.7.28	4.0 and up
3132	Stash: Invest. Learn. Save.	ENTERTAINMENT	3.8	35279	15M	1000000	0	Teen	{Entertainment}	2018-07-08	11.45.0	4.4 and up
3133	Bengali Newspaper - The first L.	ENTERTAINMENT	3.8	35279	15M	1000000	0	Teen	{Entertainment}	2018-07-08	11.45.0	4.4 and up
3134	C++ Programming	FOOD_AND_DRINK	4.5	35218	34M	1000000	0	Everyone	{"Food & Drink"}	2018-08-02	7.12	5.0 and up
3135	Dragon Nest M	DATING	4.4	35206	7.2M	1000000	0	Everyone	{Dating}	2018-05-21	2.9.6	4.0 and up
3136	ixigo Cabs-Compare & Book Taxi	DATING	4.4	35205	7.2M	1000000	0	Everyone	{Dating}	2018-05-21	2.9.6	4.0 and up
3137	RandoChat - Chat roulette	PHOTOGRAPHY	4	35188	6.2M	1000000	0	Everyone	{Photography}	2018-02-22	1.0.11	3.2 and up
3138	Extreme Coupon Finder	FAMILY	4.2	35172	34M	1000000	0	Teen	{Strategy}	2017-01-20	3.2.2	2.3.3 and up
3139	Dr. Panda Café Freemium	GAME	3.8	35171	45M	1000000	0	Everyone	{Racing}	2014-02-11	1.2	2.3 and up
3140	PS4 Second Screen	FAMILY	3.6	35121	5.1M	5000000	0	Everyone	{Entertainment}	2018-05-22	1.0.6	4.0 and up
3141	Dormi - Baby Monitor	ENTERTAINMENT	3.9	34923	Varies with device	5000000	0	Teen	{Entertainment}	2018-07-27	Varies with device	Varies with device
3142	Pet Vet Dr - Animals Hospital	FAMILY	4.3	34898	92M	1000000	0	Teen	{Strategy}	2018-06-28	4.05	4.0.3 and up
3143	Candy Day	FINANCE	4.3	34861	Varies with device	1000000	0	Everyone	{Finance}	2018-08-03	Varies with device	Varies with device
3144	My Recipes Cookbook : RecetteTek	LIFESTYLE	4.6	34802	12M	1000000	0	Everyone	{Lifestyle}	2018-06-22	5.2.2	4.3 and up
3145	Simple Habit Meditation	LIFESTYLE	4.6	34782	12M	1000000	0	Everyone	{Lifestyle}	2018-06-22	5.2.2	4.3 and up
3146	Selfie Photo Editor	PHOTOGRAPHY	4	34753	22M	1000000	0	Everyone	{Photography}	2018-07-03	1.4.0_180703	4.2 and up
3147	🔥 Football Wallpapers 4K | Full HD Backgrounds 😍	TOOLS	3.9	34612	2.4M	5000000	0	Everyone	{Tools}	2018-06-12	2.0.7	4.1 and up
3148	Complete Spanish Movies	FAMILY	4.3	34514	60M	5000000	0	Everyone	{Puzzle,"Brain Games"}	2018-07-20	1.2.8	4.1 and up
3149	Clover Dating App	GAME	4.3	34494	23M	5000000	0	Everyone 10+	{Arcade}	2018-07-11	2.5.3182	2.3 and up
3150	Jobs in Alabama - Jobs in Alba	COMMUNICATION	4.8	34443	27M	1000000	0	Teen	{Communication}	2018-06-28	1.14.3	5.0 and up
3151	Educational Games 4 Kids	FINANCE	4	34428	15M	10000000	0	Everyone	{Finance}	2018-08-02	2.31.1	5.0 and up
3152	Sports Alerts - NFL edition	FAMILY	4	34417	48M	1000000	0	Everyone	{Educational}	2018-08-06	1.0.9	4.1 and up
3153	SVT Play	HEALTH_AND_FITNESS	4.2	34356	Varies with device	1000000	0	Everyone	{"Health & Fitness"}	2018-07-31	Varies with device	Varies with device
3154	Emoji Android L Keyboard	PARENTING	4.7	34336	Varies with device	1000000	0	Everyone	{Parenting}	2018-07-31	Varies with device	Varies with device
3155	search.ch	LIFESTYLE	4.3	34327	8.1M	5000000	0	Everyone	{Lifestyle}	2018-07-17	2.5.1	4.0 and up
3156	Moonlight GO Weather EX	FAMILY	4.7	34279	24M	1000000	0	Everyone	{Casual,Creativity}	2018-08-02	1.2.3	4.4 and up
3157	21-Day Meditation Experience	SHOPPING	3.9	34171	Varies with device	1000000	0	Everyone	{Shopping}	2018-07-24	Varies with device	Varies with device
3158	Safe365 – Cell Phone GPS Locator For Your Family	TOOLS	4.5	34126	Varies with device	10000000	0	Everyone	{Tools}	2018-07-13	Varies with device	Varies with device
3159	Beauty Rental Shop	SPORTS	4.1	34123	19M	5000000	0	Everyone	{Sports}	2018-03-30	7.1.0	5.0 and up
3160	Football Manager Mobile 2018	LIFESTYLE	3.7	34079	9.2M	5000000	0	Everyone	{Lifestyle}	2018-05-21	Arrow-202	4.1 and up
3161	ES Holo Theme	SOCIAL	4.1	34079	1.3M	1000000	0	Teen	{Social}	2017-03-14	2.001	4.0.3 and up
3162	TurboScan: scan documents and receipts in PDF	SPORTS	4.3	34062	85M	1000000	0	Everyone	{Sports}	2018-04-03	1.6.7	4.4 and up
3163	Princess Palace: Royal Pony	FAMILY	4.5	33983	22M	5000000	0	Everyone	{Puzzle,"Brain Games"}	2018-08-02	1.24.3181	4.0.3 and up
3164	Candy Smash	FAMILY	3.5	33944	28M	1000000	0	Everyone 10+	{Strategy}	2016-03-10	2.0.0	4.1 and up
3165	Pixel Z Gunner 3D - Battle Survival Fps	TOOLS	4.1	33926	17M	1000000	0	Everyone	{Tools}	2018-08-03	4.78.06	4.2 and up
3166	U-Craft Mobile	FAMILY	3.6	33812	12M	5000000	0	Teen	{Entertainment}	2018-07-30	2.5	4.1 and up
3167	Adobe Fill & Sign: Easy PDF Form Filler	GAME	4.2	33788	27M	1000000	0	Everyone	{Racing}	2018-03-29	1.8.5	4.1 and up
3168	O Launcher 8.0 for Android™ O Oreo Launcher	FAMILY	4.3	33785	16M	5000000	0	Everyone	{Casual,"Action & Adventure"}	2017-12-20	1.3	4.1 and up
3169	Pacific Navy Fighter C.E. (AS)	COMICS	4.8	33783	6.4M	1000000	0	Teen	{Comics}	2018-07-28	1.3.34	4.1 and up
3170	Tropical Beach Live Wallpaper	TRAVEL_AND_LOCAL	4	33782	7.6M	5000000	0	Everyone	{"Travel & Local"}	2018-07-11	4.6	4.0 and up
3171	Resume App	SHOPPING	4.2	33758	Varies with device	1000000	0	Everyone	{Shopping}	2018-08-06	Varies with device	Varies with device
3172	SMHI Weather	GAME	4.4	33661	60M	100000	2.99	Everyone	{Card}	2018-08-03	3.4.6	4.1 and up
3173	Huntington Mobile	EDUCATION	4.4	33646	7.0M	1000000	0	Everyone	{Education}	2018-07-15	2.3.9	4.0 and up
3174	Discovery K!ds Play! Español	SHOPPING	4.5	33599	12M	1000000	0	Everyone	{Shopping}	2018-07-30	3.9	4.4 and up
3175	Rage Z: Multiplayer Zombie FPS Online Shooter	SHOPPING	4.5	33583	12M	1000000	0	Everyone	{Shopping}	2018-07-30	3.9	4.4 and up
3176	CHRONO TRIGGER (Upgrade Ver.)	SHOPPING	4.5	33583	12M	1000000	0	Everyone	{Shopping}	2018-07-30	3.9	4.4 and up
3177	S Launcher for Galaxy TouchWiz	LIFESTYLE	4.3	33572	37M	1000000	0	Everyone	{Lifestyle}	2018-08-02	6.2.0	4.4 and up
3178	Solitaire+	TOOLS	4.6	33509	3.6M	1000000	0	Everyone	{Tools}	2018-05-12	2.2.7	4.4 and up
3179	Zumper - Apartment Rental Finder	PHOTOGRAPHY	4	33439	3.9M	5000000	0	Everyone	{Photography}	2016-07-18	3.2	2.3.3 and up
3180	My Claro Peru	ENTERTAINMENT	4.1	33387	20M	1000000	0	Teen	{Entertainment}	2018-07-16	3.1.4	4.4 and up
3181	Mediatek SmartDevice	ENTERTAINMENT	4.1	33387	20M	1000000	0	Teen	{Entertainment}	2018-07-16	3.1.4	4.4 and up
3182	Qatar Airways	ENTERTAINMENT	4.1	33387	20M	1000000	0	Teen	{Entertainment}	2018-07-16	3.1.4	4.4 and up
3183	Death Dragon Knights RPG	LIFESTYLE	3.7	33264	18M	10000000	0	Everyone	{Lifestyle}	2018-06-15	6.2.1	4.0 and up
3184	PGA TOUR	TRAVEL_AND_LOCAL	4.4	33256	Varies with device	1000000	0	Everyone	{"Travel & Local"}	2018-07-31	Varies with device	Varies with device
3185	Dr. Panda Restaurant 3	TRAVEL_AND_LOCAL	4.4	33256	Varies with device	1000000	0	Everyone	{"Travel & Local"}	2018-07-31	Varies with device	Varies with device
3186	weather - weather forecast	SOCIAL	4	33249	8.4M	1000000	0	Everyone	{Social}	2015-03-05	1.8.0	2.3 and up
3187	Red Transporte DF	SOCIAL	4	33249	8.4M	1000000	0	Everyone	{Social}	2015-03-05	1.8.0	2.3 and up
3188	AZ Plugin 2 (newest)	TOOLS	4.1	33216	Varies with device	10000000	0	Everyone	{Tools}	2018-06-05	Varies with device	Varies with device
3189	GolfLogix GPS + Putt Breaks	FAMILY	3.5	33178	3.1M	1000000	0	Everyone	{Casual}	2015-02-02	1.0.5	4.3 and up
3190	JStock - Stock Market, Portfolio & News	SOCIAL	4.6	33177	10M	1000000	0	Everyone	{Social}	2018-06-12	2.1.6	4.0 and up
3191	Stickers for Facebook	PERSONALIZATION	4.2	33074	3.3M	1000000	0	Everyone	{Personalization}	2018-05-04	4.1	4.1 and up
3192	FaFaFa™ Gold Casino: Free slot machines	COMMUNICATION	4.2	33053	22M	5000000	0	Everyone	{Communication}	2018-07-31	1.60.0.31354-release	4.0.3 and up
3193	Superbrothers Sword & Sworcery	MEDICAL	4.2	33033	7.4M	5000000	0	Everyone	{Medical}	2018-07-24	3.27.3	4.1 and up
3194	UniFi	MEDICAL	4.2	33033	7.4M	5000000	0	Everyone	{Medical}	2018-07-24	3.27.3	4.1 and up
3195	My Little Pony: Story Creator	FOOD_AND_DRINK	4.6	32997	13M	1000000	0	Everyone	{"Food & Drink"}	2018-08-04	2.2.7	4.1 and up
3196	Web Browser	PHOTOGRAPHY	4	32896	31M	5000000	0	Everyone	{Photography}	2018-03-14	3.3.5	2.3.3 and up
3197	Anime Avatar Creator: Make Your Own Avatar	SPORTS	4.4	32881	76M	1000000	0	Everyone	{Sports}	2018-08-07	0.0.80	4.1 and up
3198	Mobile TV	TOOLS	4	32879	3.2M	5000000	0	Everyone	{Tools}	2018-08-04	5.19	4.0.3 and up
3199	PINKFONG Baby Shark	TRAVEL_AND_LOCAL	3.6	32862	14M	10000000	0	Everyone	{"Travel & Local"}	2016-12-06	5.10.6.2.8466393	4.1 and up
3200	Extreme X Ray Robot Stunts	GAME	4.2	32849	1.5M	1000000	0	Everyone	{Word}	2015-09-30	2.2.13	2.3 and up
3201	Pink Diamond Princess Keyboard Theme	GAME	4.5	32831	24M	500000	0	Teen	{Casino}	2017-05-12	17.05.11	4.0.3 and up
3202	RollerCoaster Tycoon® Classic	FAMILY	4.2	32812	14M	500000	2.99	Everyone	{Simulation,Education}	2018-04-10	1.1.1.6	4.0.3 and up
3203	Destroy Gunners Σ	PERSONALIZATION	4.4	32794	12M	5000000	0	Everyone	{Personalization}	2018-07-31	1.284.1.83	4.2 and up
3204	Profile pictures for WhatsApp	ENTERTAINMENT	4.3	32732	Varies with device	1000000	0	Everyone	{Entertainment}	2018-07-19	Varies with device	Varies with device
3205	Fingerprint Lock Screen Prank	PERSONALIZATION	4.7	32613	3.2M	1000000	0	Everyone	{Personalization}	2018-05-31	3.11	4.1 and up
3206	Burrito Bash – We Bare Bears	HEALTH_AND_FITNESS	4.5	32606	Varies with device	1000000	0	Everyone	{"Health & Fitness"}	2018-03-22	Varies with device	Varies with device
3207	cloudLibrary	HEALTH_AND_FITNESS	4.5	32606	Varies with device	1000000	0	Everyone	{"Health & Fitness"}	2018-03-22	Varies with device	Varies with device
3208	English Audio Books - Librivox	FAMILY	3.8	32600	26M	1000000	0	Everyone	{Casual}	2017-02-22	1.4.10	4.1 and up
3209	LEGO ® Batman: Beyond Gotham	PERSONALIZATION	4.4	32597	8.4M	1000000	0	Everyone	{Personalization}	2018-05-24	1.5.2	4.1 and up
3210	Earth to Luna! Watch and Play	BUSINESS	4.3	32584	Varies with device	1000000	0	Everyone	{Business}	2018-05-04	Varies with device	Varies with device
3211	Space X: Sky Wars of Air Force	GAME	4.3	32551	35M	500000	0	Mature 17+	{"Role Playing"}	2018-07-12	1.93	4.4 and up
3212	Puffin for Facebook	GAME	4	32522	44M	1000000	0	Everyone	{Racing}	2016-01-25	1.2.0	2.0 and up
3213	Refreshing app Free application that can use deal coupons	GAME	4.6	32506	82M	1000000	0	Everyone	{Sports}	2018-06-27	1.2.1	4.2 and up
3214	DreamMapper	GAME	4.4	32496	99M	1000000	0.99	Teen	{Action}	2018-07-03	5.3.3	2.3 and up
3215	People’s Bank	ENTERTAINMENT	4.2	32458	18M	5000000	0	Everyone	{Entertainment}	2018-06-19	2.2	4.1 and up
3216	DS file	LIFESTYLE	4.6	32433	46M	1000000	0	Everyone	{Lifestyle}	2018-06-26	2.9.1	5.0 and up
3217	Best Applock - Locker & No Ads	FAMILY	3.6	32416	Varies with device	1000000	0	Everyone	{Educational}	2017-07-10	Varies with device	Varies with device
3218	E*TRADE Mobile	FOOD_AND_DRINK	4.1	32405	12M	5000000	0	Everyone	{"Food & Drink"}	2018-07-03	3.3.21	4.1 and up
3219	Ultimate Notepad	FAMILY	4.3	32405	47M	1000000	0	Everyone	{Casual}	2014-12-18	1.2.1	4.2 and up
3220	Speed Reading	PHOTOGRAPHY	4.1	32398	28M	1000000	0	Everyone	{Photography}	2018-08-01	9.6.4	4.4 and up
3221	Job Korea - Career Jobs	SPORTS	4.5	32386	19M	1000000	0	Everyone	{Sports}	2018-08-01	7.8.0	5.1 and up
3222	WiFi Automatic	SPORTS	4.5	32386	19M	1000000	0	Everyone	{Sports}	2018-08-01	7.8.0	5.1 and up
3223	Circle ratio	SPORTS	4.5	32386	19M	1000000	0	Everyone	{Sports}	2018-08-01	7.8.0	5.1 and up
3224	White Noise Baby	EDUCATION	4.6	32381	10M	1000000	0	Everyone 10+	{Education}	2018-07-15	2.15.1	4.1 and up
3225	Zombie Hunter King	EDUCATION	4.6	32380	10M	1000000	0	Everyone 10+	{Education}	2018-07-15	2.15.1	4.1 and up
3226	Makeup Photo Editor: Makeup Camera & Makeup Editor	EDUCATION	4.7	32346	3.2M	1000000	0	Everyone	{Education}	2017-12-18	1.3.8	4.0 and up
3227	Můj T-Mobile Business	GAME	4.5	32344	29M	1000000	0.99	Everyone	{Adventure}	2016-10-21	1.3.12	3.0 and up
3228	Notes : Colorful Notepad Note,To Do,Reminder,Memo	COMMUNICATION	4.1	32283	Varies with device	1000000	0	Everyone	{Communication}	2018-07-26	Varies with device	Varies with device
3229	Tickets SDA 2018 and Exam from the State Traffic Safety Inspectorate with Drom.ru	COMMUNICATION	4.4	32254	5.5M	1000000	0	Everyone	{Communication}	2017-12-04	3.9.7	2.1 and up
3230	Super Jim Jump - pixel 3d	MAPS_AND_NAVIGATION	4.3	32225	3.2M	1000000	0	Everyone	{"Maps & Navigation"}	2018-07-26	2.0.0	4.2 and up
3231	Ankle Surgery ER Emergency	TOOLS	4.3	32207	3.4M	1000000	0	Everyone	{Tools}	2017-08-16	1.1.8.2	2.1 and up
3232	Cute Pet Puppies	FAMILY	4.2	32200	15M	5000000	0	Everyone	{Casual,"Pretend Play"}	2017-11-06	1.2	4.1 and up
3233	Axe Clicker	NEWS_AND_MAGAZINES	3.9	32121	Varies with device	1000000	0	Everyone	{"News & Magazines"}	2018-04-13	Varies with device	Varies with device
3234	Couch to 10K Running Trainer	VIDEO_PLAYERS	3.6	32112	Varies with device	1000000	0	Everyone	{"Video Players & Editors"}	2018-07-04	Varies with device	Varies with device
3235	Shadow Fight 2 Special Edition	TOOLS	4.3	32111	5.3M	1000000	0	Everyone	{Tools}	2018-08-03	3.1.0.1126	4.4 and up
3236	Desperate Housewives: The Game	BEAUTY	3.9	32090	Varies with device	1000000	0	Everyone	{Beauty}	2016-10-24	Varies with device	Varies with device
3237	Force LTE Only	FAMILY	4.2	32029	15M	5000000	0	Everyone	{Casual,"Pretend Play"}	2017-11-06	1.2	4.1 and up
3238	Wolves Live Wallpaper	SHOPPING	4.5	32014	18M	500000	0	Everyone	{Shopping}	2018-08-03	Varies with device	Varies with device
3239	AD - News, Sports, Region & Entertainment	FOOD_AND_DRINK	4.3	31986	76M	1000000	0	Teen	{"Food & Drink"}	2017-11-23	5.7.23	5.0 and up
3240	E-NUM	PHOTOGRAPHY	4.7	31985	9.1M	1000000	0	Everyone	{Photography}	2018-08-06	1.7.14	4.2 and up
3241	AD - Nieuws, Sport, Regio & Entertainment	FAMILY	4.3	31970	77M	1000000	0	Everyone	{Puzzle}	2017-06-07	1.8	Varies with device
3242	Dr. Panda Town: Vacation	SPORTS	4.3	31908	Varies with device	1000000	0	Everyone	{Sports}	2017-09-27	Varies with device	Varies with device
3243	Ouedkniss	FINANCE	3.4	31906	Varies with device	1000000	0	Everyone	{Finance}	2018-07-19	5.16.0	4.0 and up
3244	Waterfall Photo Frames	GAME	3.7	31883	20M	1000000	0	Teen	{Action}	2017-03-23	1.4.3	2.3 and up
3245	BD Data Plan (3G & 4G)	FINANCE	4.1	31804	9.8M	5000000	0	Everyone	{Finance}	2018-07-27	3.1.6.12	4.0 and up
3246	Hotwire Hotel & Car Rental App	FAMILY	4.3	31705	49M	5000000	0	Everyone	{Simulation}	2017-11-06	1.7	4.1 and up
3247	Krazy Coupon Lady	HEALTH_AND_FITNESS	4.8	31665	8.4M	1000000	0	Everyone	{"Health & Fitness"}	2018-07-19	8.2.0_8	4.0 and up
3248	Tiny Scanner Pro: PDF Doc Scan	TOOLS	4.5	31621	208k	5000000	0	Everyone	{Tools}	2011-07-10	2.0.1	1.6 and up
3249	Vigo Lite	BUSINESS	4.4	31614	37M	10000000	0	Everyone	{Business}	2018-07-20	4.1.28165.0716	4.0 and up
3250	Planner Pro-Personal Organizer	BUSINESS	4.4	31614	37M	10000000	0	Everyone	{Business}	2018-07-20	4.1.28165.0716	4.0 and up
3251	Vikings: an Archer’s Journey	FAMILY	2.9	31596	31M	5000000	0	Teen	{Simulation}	2016-12-23	1.5	2.3 and up
3252	Pacifica - Stress & Anxiety	FAMILY	3.9	31552	Varies with device	1000000	0	Teen	{Entertainment}	2018-07-23	Varies with device	4.4 and up
3253	Alarmy (Sleep If U Can) - Pro	FAMILY	3.5	31538	82M	1000000	0	Everyone 10+	{"Role Playing"}	2018-07-24	1.2703.273	4.4 and up
3254	Color by Number - Draw Sandbox Pixel Art	SHOPPING	4.2	31519	21M	1000000	0	Everyone	{Shopping}	2018-06-12	4.9.1	4.0 and up
3255	Panera Bread	NEWS_AND_MAGAZINES	4.2	31504	31M	1000000	0	Everyone 10+	{"News & Magazines"}	2018-07-30	18.201.01	5.0 and up
3256	hum app	AUTO_AND_VEHICLES	4.6	31433	17M	1000000	0	Everyone	{"Auto & Vehicles"}	2018-08-02	1.4	4.0.3 and up
3257	Black People Meet Singles Date	DATING	3.1	31320	53M	5000000	0	Mature 17+	{Dating}	2018-07-30	6.6.5	4.1 and up
3258	StartPage Private Search	FINANCE	4.1	31218	Varies with device	1000000	0	Everyone	{Finance}	2018-07-31	Varies with device	Varies with device
3259	Cymath - Math Problem Solver	HEALTH_AND_FITNESS	4.8	31139	6.9M	1000000	0	Everyone	{"Health & Fitness"}	2018-07-24	1.0.11	4.1 and up
3260	Z Ringtones PREMIUM 2018	FAMILY	4.6	31134	48M	1000000	0	Everyone 10+	{"Role Playing"}	2018-08-02	1.10.6	4.1 and up
3261	Apartment, Home Rental Search: Realtor.com Rentals	FAMILY	4.7	31100	24M	500000	3.99	Everyone	{Education,"Pretend Play"}	2018-07-06	1.5-play	4.4 and up
3262	AdventureQuest Dragons	EDUCATION	4.7	31085	24M	500000	3.99	Everyone	{Education,"Pretend Play"}	2018-07-06	1.5-play	4.4 and up
3263	Bed Time Fan - White Noise Sleep Sounds	FAMILY	3.9	31061	83M	1000000	0	Everyone	{"Health & Fitness","Action & Adventure"}	2018-06-16	4.0.6	4.2 and up
3264	Technology CM Locker Theme	BUSINESS	4.2	30847	55M	5000000	0	Everyone	{Business}	2018-02-08	7.3.21	4.1 and up
3265	L.O.L. Surprise Ball Pop	SPORTS	4	30840	Varies with device	1000000	0	Teen	{Sports}	2018-05-22	Varies with device	Varies with device
3266	AT&T Digital Life	SPORTS	4	30840	Varies with device	1000000	0	Teen	{Sports}	2018-05-22	Varies with device	Varies with device
3267	Gold Butterfly Keyboard Theme	SHOPPING	4.5	30834	13M	1000000	0	Everyone	{Shopping}	2018-07-17	3.2.6	4.0.3 and up
3268	Skiplagged — Exclusive Flights & Hotels	NEWS_AND_MAGAZINES	4.4	30722	Varies with device	1000000	0	Teen	{"News & Magazines"}	2018-08-02	Varies with device	Varies with device
3269	Dino in City-Dinosaur N Police	NEWS_AND_MAGAZINES	4.1	30693	Varies with device	1000000	0	Everyone 10+	{"News & Magazines"}	2018-08-01	Varies with device	Varies with device
3270	Philips Hue	FAMILY	4.3	30668	33M	5000000	0	Everyone	{Casual,"Pretend Play"}	2018-07-16	2.1.3181	4.0.3 and up
3271	GollerCepte Live Score	GAME	4.2	30630	17M	1000000	0	Everyone	{Racing}	2015-05-25	1.2.5	4.1 and up
3272	SnipSnap Coupon App	GAME	4.5	30515	Varies with device	1000000	0	Teen	{Casino}	2018-05-22	2.92	4.0 and up
3273	US Open Tennis Championships 2018	PERSONALIZATION	4	30498	5.9M	1000000	0	Everyone	{Personalization}	2015-03-11	2.6	3.2 and up
3274	DreamTrips	TRAVEL_AND_LOCAL	3.5	30447	80M	5000000	0	Everyone	{"Travel & Local"}	2018-07-20	2.1.56	5.0 and up
3275	BSPlayer ARMv7 VFP CPU support	TRAVEL_AND_LOCAL	3.5	30447	80M	5000000	0	Everyone	{"Travel & Local"}	2018-07-20	2.1.56	5.0 and up
3276	Buff Thun - Daily Free Webtoon / Comics / Web Fiction / Mini Game	FAMILY	4.1	30444	27M	1000000	0	Everyone 10+	{Arcade,"Action & Adventure"}	2015-10-26	1.0.5	4.3 and up
3277	Al jazeera TV	PRODUCTIVITY	4.3	30443	540k	1000000	0	Everyone	{Productivity}	2018-07-03	0.54.2.4	2.1 and up
3278	Rope Hero Return of a Legend	TRAVEL_AND_LOCAL	4.3	30403	Varies with device	5000000	0	Everyone	{"Travel & Local"}	2018-08-01	Varies with device	Varies with device
3279	tutti.ch - Free Classifieds	COMMUNICATION	4.2	30350	3.7M	1000000	0	Everyone	{Communication}	2018-01-16	10.0.0	4.1 and up
3280	Teach Me Anatomy	PRODUCTIVITY	4.2	30291	Varies with device	1000000	0	Everyone	{Productivity}	2018-05-29	Varies with device	Varies with device
3281	Funny Pics	PRODUCTIVITY	4.2	30291	Varies with device	1000000	0	Everyone	{Productivity}	2018-05-29	Varies with device	Varies with device
3282	Adblock Fast	NEWS_AND_MAGAZINES	4	30287	19M	1000000	0	Everyone 10+	{"News & Magazines"}	2018-08-03	4.11.0.611033	4.1 and up
3283	Gang Wars of San Andreas	GAME	4.4	30253	Varies with device	1000000	0	Everyone	{Casual}	2018-08-05	1.0.1.049	4.1 and up
3284	Display Phone Screen On TV	FOOD_AND_DRINK	4.3	30224	Varies with device	1000000	0	Everyone	{"Food & Drink"}	2018-05-28	Varies with device	Varies with device
3285	FreedomPop Messaging Phone/SIM	COMMUNICATION	4.3	30209	15M	5000000	0	Everyone	{Communication}	2018-07-28	1.3.4	4.1 and up
3286	English words application mikan	BOOKS_AND_REFERENCE	4.4	30105	2.1M	1000000	0	Everyone	{"Books & Reference"}	2018-07-29	1.15	4.0.3 and up
3287	Sworkit Kids - Fitness Meets Fun	GAME	4	30008	99M	1000000	0	Mature 17+	{Racing}	2017-03-30	1.26	2.3 and up
3288	Princess Coloring Book	GAME	4.3	30002	29M	1000000	0	Teen	{Casino}	2018-02-08	2.3.5	4.0.3 and up
3289	B.M.Snowboard Free	GAME	3.9	29990	96M	1000000	0	Teen	{Action}	2017-12-08	Varies with device	2.3 and up
3290	Farsi Keyboard	EDUCATION	4.1	29980	Varies with device	1000000	0	Everyone	{Education}	2017-08-17	Varies with device	Varies with device
3291	Gyft - Mobile Gift Card Wallet	FAMILY	4.1	29978	Varies with device	1000000	0	Everyone	{Education}	2017-08-17	Varies with device	Varies with device
3292	Deus Ex GO	TOOLS	4	29944	2.1M	5000000	0	Everyone	{Tools}	2015-10-03	1.6	2.3 and up
3293	Family convenience store FamilyMart	GAME	4.5	29940	80M	1000000	0	Everyone	{Action}	2018-07-26	1.1.4	4.1 and up
3294	DRAGON QUEST	VIDEO_PLAYERS	4.1	29867	1.7M	5000000	0	Everyone	{"Video Players & Editors"}	2017-05-24	3.1.0 (build 1210)	2.3.3 and up
3295	Power Booster - Junk Cleaner & CPU Cooler & Boost	SPORTS	4.4	29864	40M	1000000	0	Everyone	{Sports}	2018-07-26	2.5	4.1 and up
3296	Baby ABC in box! Kids alphabet games for toddlers!	EDUCATION	4.4	29855	Varies with device	1000000	0	Mature 17+	{Education}	2018-07-29	Varies with device	Varies with device
3297	Satellite AR	TOOLS	3.4	29854	5.0M	1000000	0	Everyone	{Tools}	2017-07-19	5	2.3 and up
3298	Henry Danger Crime Warp	COMICS	4.5	29839	29M	1000000	0	Teen	{Comics}	2018-07-31	4.1.0	4.4 and up
3299	Blood Glucose Tracker	FAMILY	3.7	29838	Varies with device	5000000	0	Mature 17+	{Entertainment}	2018-06-28	2.2	Varies with device
3300	Phoenix - Facebook & Messenger	GAME	4.1	29798	80M	1000000	0	Mature 17+	{Action}	2017-03-06	5.1.7	2.3 and up
3301	Samsung Calculator	MAPS_AND_NAVIGATION	4.3	29768	Varies with device	5000000	0	Everyone	{"Maps & Navigation"}	2018-08-04	Varies with device	Varies with device
3302	Swift for Facebook Lite	LIFESTYLE	4.2	29756	45M	1000000	0	Everyone	{Lifestyle}	2018-07-19	1.1.6.1	4.1 and up
3303	Free resume builder CV maker templates PDF formats	FAMILY	4	29708	19M	1000000	0	Teen	{Entertainment}	2018-07-16	3.1.4	4.4 and up
3304	BaBe Lite - Read Quota Saving News	PHOTOGRAPHY	4	29707	18M	1000000	0	Everyone	{Photography}	2015-02-10	1.1.6	4.0 and up
3305	ac remote control	ENTERTAINMENT	4	29706	19M	1000000	0	Teen	{Entertainment}	2018-07-16	3.1.4	4.4 and up
3306	European War 5:Empire	ENTERTAINMENT	4	29706	19M	1000000	0	Teen	{Entertainment}	2018-07-16	3.1.4	4.4 and up
3307	Caller ID +	ENTERTAINMENT	4	29706	19M	1000000	0	Teen	{Entertainment}	2018-07-16	3.1.4	4.4 and up
3308	NETGEAR WiFi Analytics	NEWS_AND_MAGAZINES	4.6	29706	11M	1000000	0	Teen	{"News & Magazines"}	2018-08-02	2.71	4.1 and up
3309	Evolution CP & IV Calculator for pokemon	ENTERTAINMENT	4.1	29690	78M	1000000	0	Teen	{Entertainment}	2018-08-03	2.3.34 Prod	4.3 and up
3310	Relax Ocean ~ Nature Sounds	SPORTS	4.6	29673	57M	1000000	0	Mature 17+	{Sports}	2018-08-06	2.46.1	5.0 and up
3311	Be My Princess: PARTY	BOOKS_AND_REFERENCE	4.8	29551	67M	1000000	0	Everyone	{"Books & Reference"}	2018-04-06	1.0.7	4.0.3 and up
3312	F-Secure SAFE	FAMILY	3.8	29544	10M	10000000	0	Everyone	{Entertainment}	2018-07-25	3.15	4.0 and up
3313	H Pack	PERSONALIZATION	4.3	29540	4.3M	1000000	0	Everyone	{Personalization}	2016-06-15	2	5.0 and up
3314	San Andreas Crime City Gangster 3D	GAME	3.9	29505	69M	1000000	0	Everyone	{Word}	2018-04-04	3.0.11	4.0.3 and up
3315	Synd e-Passbook	FAMILY	4.5	29495	56M	1000000	0	Teen	{Simulation}	2018-05-24	1.11.0	4.0.3 and up
3316	Monument Valley 2	PERSONALIZATION	4.7	29485	9.9M	1000000	0	Everyone	{Personalization}	2018-07-20	1.0.4	4.0 and up
3317	Survival Forest : Survivor Home Builder	GAME	4	29462	44M	1000000	0	Teen	{Music}	2018-06-14	1.1.7	4.0 and up
3318	My Class Schedule: Timetable	GAME	4.6	29445	29M	5000000	0	Everyone	{Casual}	2018-05-11	14	4.0.3 and up
3319	Five nights at Minecraft	FAMILY	4.6	29436	43M	1000000	0	Everyone	{Educational,Education}	2018-03-21	2.0.5.0	4.1 and up
3320	English for beginners	FAMILY	3.9	29415	66M	1000000	0	Mature 17+	{Simulation}	2016-12-11	2.0.1	2.3 and up
3321	Mirror Camera (Mirror + Selfie Camera)	FAMILY	4.1	29387	16M	1000000	0	Everyone	{Strategy}	2015-08-22	1.0.6	3.0 and up
3322	Windguru Lite	WEATHER	4.5	29344	22M	500000	0	Everyone	{Weather}	2018-07-25	4.1.11 - Hegoa	4.1 and up
3323	Farm Fruit Pop: Party Time	BUSINESS	4.3	29331	20M	5000000	0	Everyone	{Business}	2018-07-30	1.12.0	4.0.3 and up
3324	Scary Video Maker	GAME	4.3	29330	6.9M	1000000	0	Everyone	{Action}	2012-08-17	1.0.9	2.0.1 and up
3325	My baby Phone	FAMILY	4.1	29319	26M	5000000	0	Everyone	{Casual,"Action & Adventure"}	2018-05-18	2.4	4.4 and up
3326	AppBrain Ad Detector	FAMILY	4.1	29319	26M	5000000	0	Everyone	{Casual,"Action & Adventure"}	2018-05-18	2.4	4.4 and up
3327	Fruit Cube Blast	BUSINESS	4.3	29313	20M	5000000	0	Everyone	{Business}	2018-07-30	1.12.0	4.0.3 and up
3328	Jingdong - pick good things, go to Jingdong	BUSINESS	4.3	29313	20M	5000000	0	Everyone	{Business}	2018-07-30	1.12.0	4.0.3 and up
3329	Frontline Terrorist Battle Shoot: Free FPS Shooter	GAME	4.3	29270	44M	5000000	0	Everyone	{Action}	2018-07-25	1.4.3	4.0.3 and up
3330	Offroad Police Car DE	GAME	3.4	29265	17M	1000000	0	Everyone	{Adventure}	2017-05-19	1.1.0	4.0.3 and up
3331	CIRCLE K	FAMILY	3.7	29229	Varies with device	1000000	0	Teen	{Entertainment}	2018-08-06	Varies with device	Varies with device
3332	au	COMMUNICATION	4.1	29208	23M	1000000	0	Everyone	{Communication}	2016-09-28	2.9.8	2.3.3 and up
3333	Cycling - Bike Tracker	PERSONALIZATION	4.5	29203	3.3M	5000000	0	Everyone	{Personalization}	2017-12-10	40	4.0 and up
3334	Family GPS Tracker and Chat + Baby Monitor Online	GAME	4.4	29168	Varies with device	1000000	0	Everyone	{Racing}	2018-05-29	2.0.1	4.1 and up
3335	ChefTap Recipes & Grocery List	FAMILY	4.6	29155	83M	1000000	0	Everyone	{Educational,"Pretend Play"}	2018-07-26	1.0.4	4.1 and up
3336	Let’s Poke The Egg	GAME	4.1	29062	63M	1000000	0	Everyone	{Casino}	2017-09-15	2.1	2.3 and up
3337	Preschool All-In-One	HEALTH_AND_FITNESS	4.6	28951	60M	1000000	0	Everyone	{"Health & Fitness"}	2018-07-16	4.4	4.4 and up
3338	No.Diamond – Colors by Number	HEALTH_AND_FITNESS	4.6	28951	60M	1000000	0	Everyone	{"Health & Fitness"}	2018-07-16	4.4	4.4 and up
3339	Blur	ENTERTAINMENT	4.2	28948	Varies with device	1000000	0	Teen	{Entertainment}	2018-08-04	Varies with device	Varies with device
3340	Calendar+ Schedule Planner App	HEALTH_AND_FITNESS	4.9	28945	12M	500000	0	Teen	{"Health & Fitness"}	2018-05-17	2.6.1	4.2 and up
3341	SignEasy | Sign and Fill PDF and other Documents	SPORTS	4	28895	82M	5000000	0	Teen	{Sports}	2018-08-02	4.4.15	5.0 and up
3342	Nick Jr. - Shows & Games	SPORTS	4	28895	82M	5000000	0	Teen	{Sports}	2018-08-02	4.4.15	5.0 and up
3343	Alba Heaven - Alvarez Job Portal Services	FAMILY	4.1	28892	6.3M	5000000	0	Teen	{Entertainment}	2018-07-11	1.3	4.0 and up
3344	Bloglovin’	TOOLS	4.2	28860	Varies with device	100000000	0	Everyone	{Tools}	2018-07-18	Varies with device	Varies with device
3345	Adult Glitter Color by Number Book - Sandbox Pages	VIDEO_PLAYERS	3.9	28835	Varies with device	1000000	0	Teen	{"Video Players & Editors"}	2018-07-26	Varies with device	Varies with device
3346	BakaReader EX	PERSONALIZATION	4.2	28806	7.1M	1000000	0	Everyone	{Personalization}	2018-05-22	18	4.1 and up
3347	BBMoji - Your personalized BBM Stickers	FAMILY	4.2	28737	17M	1000000	0	Everyone	{Casual,"Action & Adventure"}	2016-02-05	1	2.3 and up
3348	Lotte Home Shopping LOTTE Homeshopping	FAMILY	4.3	28735	91M	1000000	0	Everyone	{Casual}	2018-08-01	1.12.0.1654	4.2 and up
3349	Gametime - Tickets to Sports, Concerts, Theater	PERSONALIZATION	4.3	28728	2.8M	500000	2.49	Everyone	{Personalization}	2013-07-27	1.3.3.9	1.6 and up
3350	Name Art Photo Editor - Focus n Filters	PERSONALIZATION	3.9	28694	2.9M	1000000	0	Everyone	{Personalization}	2018-01-14	1.4.6	4.0.3 and up
3351	English-Myanmar Dictionary	DATING	4	28671	Varies with device	1000000	0	Mature 17+	{Dating}	2018-08-01	Varies with device	Varies with device
3352	Download Manager - File & Video	DATING	4	28671	Varies with device	1000000	0	Mature 17+	{Dating}	2018-08-01	Varies with device	Varies with device
3353	RIDE ZERO	PHOTOGRAPHY	3.8	28660	6.4M	5000000	0	Everyone	{Photography}	2018-03-21	1.0.12	4.0.3 and up
3354	Adblock Plus for Samsung Internet - Browse safe.	FAMILY	4	28633	81M	1000000	0	Everyone 10+	{"Role Playing"}	2016-12-23	1.14.0	2.3 and up
3355	Christian Dating For Free App	LIFESTYLE	4.8	28588	24M	1000000	0	Everyone	{Lifestyle}	2018-03-01	3.1.8	4.0.3 and up
3356	GO Weather EX Theme White	PHOTOGRAPHY	4.3	28578	23M	10000000	0	Everyone	{Photography}	2018-07-28	6.21	4.0 and up
3357	Ez Screen Recorder (no ad)	SHOPPING	4.5	28560	Varies with device	1000000	0	Everyone	{Shopping}	2018-07-23	Varies with device	Varies with device
3358	Telemundo Now	SHOPPING	4.1	28523	29M	5000000	0	Everyone	{Shopping}	2018-08-03	18.10.157066	4.4 and up
3359	Wifi Test	SHOPPING	4.1	28523	29M	5000000	0	Everyone	{Shopping}	2018-08-03	18.10.157066	4.4 and up
3360	CS16Client	SHOPPING	4.1	28523	29M	5000000	0	Everyone	{Shopping}	2018-08-03	18.10.157066	4.4 and up
3361	Qapital - Save Small. Live Large	GAME	4.4	28510	78M	500000	0	Teen	{Card}	2018-08-01	2.6.6	4.0.3 and up
3362	Meet, chat & date. Free dating app - Chocolate app	COMICS	3	28447	15M	1000000	0	Teen	{Comics}	2018-07-31	Varies with device	Varies with device
3363	BROTHER IN WARS: GUNNER CITY WARLORDS	PHOTOGRAPHY	3.9	28429	14M	5000000	0	Teen	{Photography}	2018-03-16	2	2.3 and up
3364	The TK-App - everything under control	EDUCATION	4	28392	Varies with device	1000000	0	Everyone	{Education}	2018-03-07	Varies with device	Varies with device
3365	Create A Superhero HD	PHOTOGRAPHY	4.2	28390	38M	5000000	0	Everyone	{Photography}	2017-07-19	1.0.499	5.0 and up
3366	NEW Theme for Phone X	LIFESTYLE	4.1	28301	Varies with device	1000000	0	Everyone	{Lifestyle}	2018-07-13	12.1.0	4.1 and up
3367	AE Archer	TOOLS	4.1	28250	Varies with device	10000000	0	Everyone	{Tools}	2017-03-21	Varies with device	Varies with device
3368	HANGAME Casino - Baccarat & Texas Hold’em	COMMUNICATION	4.1	28238	17M	1000000	0	Everyone	{Communication}	2018-08-02	4.98	2.3 and up
3369	Fantastic Chefs: Match ’n Cook	BOOKS_AND_REFERENCE	4.7	28237	10M	100000	0	Everyone	{"Books & Reference"}	2018-04-22	3.2.994	4.0.3 and up
3370	Lynda - Online Training Videos	FAMILY	4.3	28151	17M	1000000	0	Everyone 10+	{"Role Playing"}	2015-06-04	1.0.2	2.2 and up
3371	AE Gun Ball: arcade ball games	GAME	4.2	28151	49M	1000000	0	Everyone 10+	{Racing}	2016-12-25	1.2	2.3.3 and up
3372	Stop, Breathe & Think: Meditation & Mindfulness	LIFESTYLE	3.8	28140	16M	1000000	0	Everyone	{Lifestyle}	2018-07-30	5.0.4	4.2 and up
3373	Filters for Selfie	FAMILY	4	28136	Varies with device	5000000	0	Everyone	{Casual}	2017-08-24	Varies with device	Varies with device
3374	MyMTN	PHOTOGRAPHY	4.6	28107	5.7M	500000	2.99	Everyone	{Photography}	2018-06-11	2.8.26	4.0 and up
3375	Dragon X Adventure: Warrior Z	TOOLS	4.5	28030	9.0M	1000000	0	Everyone	{Tools}	2018-08-02	4.4.4	4.1 and up
3376	Dr. Oetker recipe ideas	FOOD_AND_DRINK	4.3	28009	17M	5000000	0	Everyone	{"Food & Drink"}	2018-08-03	6.0.1	5.0 and up
3377	Ninja Dash - Ronin Jump RPG	FOOD_AND_DRINK	4.3	28008	17M	5000000	0	Everyone	{"Food & Drink"}	2018-08-03	6.0.1	5.0 and up
3378	Fingerprint Quick Action	FOOD_AND_DRINK	4.3	27931	17M	5000000	0	Everyone	{"Food & Drink"}	2018-08-03	6.0.1	5.0 and up
3379	Fast Racing Car Simulator	GAME	4.7	27856	50M	100000	2.99	Teen	{Action}	2015-04-02	1.07	2.3 and up
3380	Apartment List: Housing, Apt, and Property Rentals	PRODUCTIVITY	4.5	27820	4.7M	1000000	0	Everyone	{Productivity}	2018-07-29	2.1	2.3.3 and up
3381	AT&T DriveMode	PRODUCTIVITY	4	27800	Varies with device	10000000	0	Everyone	{Productivity}	2017-08-10	Varies with device	Varies with device
3382	FINAL FANTASY DIMENSIONS	TOOLS	4.3	27749	16M	1000000	0	Everyone	{Tools}	2018-07-19	3.3.6	4.0.3 and up
3383	Weather BZ	EDUCATION	3.8	27572	25M	5000000	0	Everyone	{Education,Education}	2017-10-25	3	2.3 and up
3384	Dash Quest Heroes	TRAVEL_AND_LOCAL	3.7	27560	46M	5000000	0	Everyone	{"Travel & Local"}	2018-07-31	4.13.2	5.0 and up
3385	Gaydorado	TRAVEL_AND_LOCAL	3.7	27560	46M	5000000	0	Everyone	{"Travel & Local"}	2018-07-31	4.13.2	5.0 and up
3386	Be My Eyes - Helping the blind	GAME	4	27557	69M	5000000	0	Teen	{Action}	2018-07-06	F2i	4.1 and up
3387	Pyaterochka	COMMUNICATION	4.4	27540	3.7M	1000000	0	Everyone	{Communication}	2018-01-05	1.26.001	4.0 and up
3388	Equestria Amino for MLP	MEDICAL	4.4	27524	Varies with device	1000000	0	Everyone	{Medical}	2018-07-30	Varies with device	Varies with device
3389	Blood Pressure Log - MyDiary	HEALTH_AND_FITNESS	4.1	27501	7.0M	1000000	0	Everyone	{"Health & Fitness"}	2018-01-05	5.1.9	4.0 and up
3390	AirWatch Inbox	HEALTH_AND_FITNESS	4.5	27439	19M	1000000	0	Everyone	{"Health & Fitness"}	2018-07-16	6.5.1	5.0 and up
3391	Baby Connect (activity log)	HEALTH_AND_FITNESS	4.5	27439	19M	1000000	0	Everyone	{"Health & Fitness"}	2018-07-16	6.5.1	5.0 and up
3392	HTC Help	ENTERTAINMENT	4.1	27424	17M	1000000	0	Teen	{Entertainment}	2018-07-08	11.45.0	4.4 and up
3393	UNICORN - Color By Number & Pixel Art Coloring	ENTERTAINMENT	4.1	27424	17M	1000000	0	Teen	{Entertainment}	2018-07-08	11.45.0	4.4 and up
3394	Software Update	ENTERTAINMENT	3.9	27424	Varies with device	1000000	0	Teen	{Entertainment}	2018-07-31	Varies with device	Varies with device
3395	SPG: Starwood Hotels & Resorts	ENTERTAINMENT	4.1	27424	17M	1000000	0	Teen	{Entertainment}	2018-07-08	11.45.0	4.4 and up
3396	Vivid Seats – Event Tickets	HEALTH_AND_FITNESS	4.5	27396	59M	1000000	0	Mature 17+	{"Health & Fitness"}	2018-07-16	6.5.3	4.1 and up
3397	QR Scanner & Barcode Scanner 2018	HEALTH_AND_FITNESS	4.5	27396	59M	1000000	0	Mature 17+	{"Health & Fitness"}	2018-07-16	6.5.3	4.1 and up
3398	Endless Ducker	HEALTH_AND_FITNESS	4.5	27393	59M	1000000	0	Mature 17+	{"Health & Fitness"}	2018-07-16	6.5.3	4.1 and up
3399	CT-ART 4.0 (Chess Tactics 1200-2400 ELO)	HOUSE_AND_HOME	4.2	27387	Varies with device	1000000	0	Everyone	{"House & Home"}	2018-06-21	Varies with device	Varies with device
3400	Digit Save Money Automatically	HOUSE_AND_HOME	4.2	27386	Varies with device	1000000	0	Everyone	{"House & Home"}	2018-06-21	Varies with device	Varies with device
3401	BN Más Cerca de Usted	SHOPPING	4.4	27275	8.3M	1000000	0	Teen	{Shopping}	2018-07-30	27500000	4.1 and up
3402	Grabo.bg	COMMUNICATION	4.3	27187	66M	5000000	0	Everyone	{Communication}	2018-07-28	42.0.0.2059	4.4 and up
3403	True Skateboarding Ride Skateboard Game Freestyle	TOOLS	4.5	27180	4.1M	1000000	0	Everyone	{Tools}	2018-07-06	3.24	4.1 and up
3404	I Screen Dialer	SPORTS	3.7	27179	20M	1000000	0	Everyone	{Sports}	2018-07-30	5.12.1	4.1 and up
3405	Mad Libs	COMMUNICATION	4.2	27156	Varies with device	1000000	0	Everyone	{Communication}	2018-05-31	Varies with device	Varies with device
3406	Zombie Sniper 3D III	COMMUNICATION	4.3	27156	66M	5000000	0	Everyone	{Communication}	2018-07-28	42.0.0.2059	4.4 and up
3407	BusyBox Pro	PRODUCTIVITY	4.6	27135	Varies with device	100000	4.99	Everyone	{Productivity}	2018-05-24	Varies with device	Varies with device
3408	AE Basketball	FAMILY	4.1	27130	35M	5000000	0	Everyone	{Simulation}	2017-12-08	1.4	2.3 and up
3409	CPlus for Craigslist - Officially Licensed	NEWS_AND_MAGAZINES	4.2	27104	8.2M	1000000	0	Everyone 10+	{"News & Magazines"}	2018-08-03	2.42.1.9	4.4 and up
3410	Lily & Leo - Crazy Circus Day	GAME	4.5	26985	41M	5000000	0	Everyone	{Casual}	2018-06-04	1.9.1	4.0.3 and up
3411	Them Bombs: co-op board game play with 2-4 friends	WEATHER	3.7	26941	Varies with device	5000000	0	Everyone	{Weather}	2018-07-13	Varies with device	Varies with device
3412	Sonic 4™ Episode I	PRODUCTIVITY	4.6	26919	Varies with device	100000	5.99	Everyone	{Productivity}	2018-06-25	Varies with device	Varies with device
3413	El Nuevo Día	FAMILY	4.5	26916	67M	500000	0	Everyone	{Casual,"Pretend Play"}	2017-03-17	2.7	4.0.3 and up
3414	Trell: An app for Explorers | Best Wanderlust App	GAME	4.2	26893	20M	1000000	0	Teen	{Arcade}	2017-03-01	1.0.5	2.3 and up
3415	My Little Pony AR Guide	BOOKS_AND_REFERENCE	4.5	26875	73M	500000	0	Everyone	{"Books & Reference"}	2018-08-01	6.0.8	4.0.3 and up
3416	Yoga - Track Yoga	TRAVEL_AND_LOCAL	4.1	26871	Varies with device	5000000	0	Everyone	{"Travel & Local"}	2018-07-26	1.10.0.205086730	4.1 and up
3417	LinkedIn Learning: Online Courses to Learn Skills	MEDICAL	4.7	26862	30M	500000	0	Everyone	{Medical}	2018-06-25	25.3.1	4.0.3 and up
3418	Shoot`Em Down: Shooting game	BEAUTY	4.5	26834	57M	1000000	0	Everyone	{Beauty}	2018-07-24	18.5	5.0 and up
3419	Goal Meter: Goal Tracker, Habit Changer,To-Do List	GAME	4.5	26744	51M	500000	0	Teen	{Casino}	2018-07-27	7.4.0	4.0.3 and up
3420	gCMOB	TRAVEL_AND_LOCAL	4	26665	10M	5000000	0	Everyone	{"Travel & Local"}	2018-03-29	2.5.26	4.1 and up
3421	Get ’Em	HEALTH_AND_FITNESS	4.3	26652	41M	1000000	0	Everyone	{"Health & Fitness"}	2018-05-04	2.3.3	4.0.3 and up
3422	World Webcams	GAME	4	26649	66M	5000000	0	Teen	{Action}	2018-08-05	1.2	4.2 and up
3423	Health and Nutrition Guide	PERSONALIZATION	4.3	26601	5.4M	1000000	0	Everyone	{Personalization}	2018-07-16	26.1.0.20180713	2.3.3 and up
3424	TryDate - Free Online Dating App, Chat Meet Adults	FINANCE	4.6	26587	8.4M	1000000	0	Everyone	{Finance}	2018-07-19	1.18.0	4.4 and up
3425	Project Grand Auto Town Sandbox Beta	BUSINESS	4.4	26572	41M	1000000	0	Everyone	{Business}	2018-07-24	2.9.1	4.1 and up
3426	Learn English Daily	PRODUCTIVITY	4.5	26559	Varies with device	10000000	0	Everyone	{Productivity}	2017-04-14	Varies with device	Varies with device
3427	Zona Azul Digital Fácil SP CET - OFFICIAL São Paulo	FAMILY	4.4	26545	40M	1000000	0	Everyone	{Casual}	2018-07-20	2.08	4.1 and up
3428	Al Quran Audio (Full 30 Juz)	HEALTH_AND_FITNESS	4.4	26540	43M	1000000	0	Everyone	{"Health & Fitness"}	2017-02-09	2.5.1	4.0.3 and up
3429	PASS by KT (formerly KT certified)	HEALTH_AND_FITNESS	4.4	26540	43M	1000000	0	Everyone	{"Health & Fitness"}	2017-02-09	2.5.1	4.0.3 and up
3430	ES Dark Theme for free	PHOTOGRAPHY	4	26530	3.9M	1000000	0	Everyone	{Photography}	2018-07-23	2.3.5	3.2 and up
3431	PulsePoint Respond	PRODUCTIVITY	4.3	26452	4.0M	1000000	0	Everyone	{Productivity}	2014-11-03	2.3.5	2.1 and up
3432	Litnet - E-books	FAMILY	4.2	26426	30M	1000000	0	Everyone	{Education,Education}	2018-08-02	4.1.0	4.4 and up
3433	Food Network	VIDEO_PLAYERS	4.4	26421	Varies with device	1000000	0	Everyone	{"Video Players & Editors"}	2018-05-30	3.4.5	4.1 and up
3434	A/C Air Conditioner Remote	NEWS_AND_MAGAZINES	4.5	26411	26M	1000000	0	Everyone	{"News & Magazines"}	2018-03-26	2.3.2	4.1 and up
3435	DRAGON QUEST VIII	PHOTOGRAPHY	4.5	26361	29M	5000000	0	Everyone	{Photography}	2018-07-25	5.3	4.1 and up
3436	BP and Sugar Test Prank	PRODUCTIVITY	4.4	26358	50k	500000	1.99	Everyone	{Productivity}	2014-01-17	1.7	2.0 and up
3437	To-Do List Widget	FAMILY	4.1	26347	48M	1000000	0	Everyone 10+	{Entertainment}	2017-09-15	14.0.1	2.2 and up
3438	Coupon Sherpa	FAMILY	4.2	26307	Varies with device	1000000	0	Teen	{"Role Playing"}	2018-07-26	1.1.40	4.0.3 and up
3439	Hinge: Dating & Relationships	PHOTOGRAPHY	4.4	26252	24M	1000000	0	Everyone	{Photography}	2018-05-26	1.7	4.2 and up
3440	CDL Practice Test 2018 Edition	GAME	4.2	26247	Varies with device	1000000	0	Teen	{"Role Playing"}	2018-07-26	1.1.40	4.0.3 and up
3441	Apk Installer	FAMILY	4.3	26224	43M	1000000	0	Everyone	{Simulation}	2017-04-29	1.0.4	2.3 and up
3442	Simple - Better Banking	FAMILY	4	26202	41M	1000000	0	Teen	{"Role Playing"}	2018-05-05	1.1.700	2.3 and up
3443	Nights at Cube Pizzeria 3D – 4	TOOLS	4	26189	5.3M	10000000	0	Everyone	{Tools}	2018-06-27	MyMetro_HTML_2.0_430029	4.0 and up
3444	Armored Warfare: Assault	GAME	4.6	26138	15M	1000000	0	Everyone	{Action}	2018-02-14	1.0.2	4.2 and up
3445	Offroad G-Class 2018	SPORTS	4.5	26102	Varies with device	1000000	0	Everyone	{Sports}	2018-05-03	Varies with device	Varies with device
3446	KLM - Royal Dutch Airlines	EVENTS	4	26089	Varies with device	5000000	0	Everyone	{Events}	2018-08-02	4.2.1	Varies with device
3447	Superheroes Wallpapers | 4K Backgrounds	MAPS_AND_NAVIGATION	4.3	26014	7.7M	1000000	0	Everyone	{"Maps & Navigation"}	2017-11-06	2.4.1	4.0.3 and up
3448	Combat BF: Black Ops 3	PRODUCTIVITY	4.5	25985	6.9M	1000000	0	Everyone	{Productivity}	2018-07-20	1.0.167	4.0.3 and up
3449	EatStreet Food Delivery App	GAME	4.3	25952	36M	500000	0	Everyone 10+	{Action}	2015-09-07	1.1.2	2.3 and up
3450	R-TYPE	VIDEO_PLAYERS	4.4	25922	6.1M	50000000	0	Everyone	{"Video Players & Editors"}	2018-05-09	1.4.08.2	7.0 and up
3451	Best Friends Dress Up & Makeup	GAME	3.1	25825	16M	5000000	0	Everyone	{Simulation}	2018-05-22	1.3.3	4.4 and up
3452	XX HD Video downloader-Free Video Downloader	PERSONALIZATION	4.2	25807	5.5M	1000000	0	Everyone	{Personalization}	2017-10-29	15	4.1 and up
3453	Klart.se - Sweden’s best weather	FINANCE	4.6	25744	Varies with device	500000	0	Everyone	{Finance}	2018-07-30	Varies with device	Varies with device
3454	N1.RU - Real estate: apartments, new buildings, lodging	TRAVEL_AND_LOCAL	4.2	25740	51M	1000000	0	Everyone	{"Travel & Local"}	2018-07-24	4.2	4.4 and up
3455	DU GIF Maker: GIF Maker, Video to GIF & GIF Editor	TRAVEL_AND_LOCAL	4.2	25726	51M	1000000	0	Everyone	{"Travel & Local"}	2018-07-24	4.2	4.4 and up
3456	My Chakra Meditation	SHOPPING	4.4	25719	Varies with device	1000000	0	Teen	{Shopping}	2018-08-06	Varies with device	Varies with device
3457	4K Wallpapers and Ultra HD Backgrounds	SHOPPING	4.4	25717	Varies with device	1000000	0	Teen	{Shopping}	2018-07-31	Varies with device	Varies with device
3458	du app	SHOPPING	4.4	25714	12M	1000000	0	Everyone	{Shopping}	2018-07-24	3.8.2.2	4.0.3 and up
3459	LIFULL HOME’S	COMICS	4.2	25673	Varies with device	1000000	0	Teen	{Comics}	2018-06-05	Varies with device	Varies with device
3460	Memory Helper - To do list, Notepad, Notes, Memo	COMICS	4.2	25671	Varies with device	1000000	0	Teen	{Comics}	2018-06-05	Varies with device	Varies with device
3461	All Video Downloader 2018	PRODUCTIVITY	4.4	25627	9.8M	1000000	0	Everyone	{Productivity}	2018-08-05	132	5.0 and up
3462	Be the Manager 2018 - Football Strategy	TOOLS	4.6	25592	7.5M	10000000	0	Everyone	{Tools}	2018-07-31	v8.0.1.8.0629.1	4.2 and up
3463	Golfshot: Golf GPS + Tee Times	SOCIAL	4.5	25562	31M	5000000	0	Teen	{Social}	2018-08-02	2.6.10	4.1 and up
3464	Speed Car CM Locker Theme	SHOPPING	3.4	25515	Varies with device	10000000	0	Everyone	{Shopping}	2018-07-16	Varies with device	Varies with device
3465	Everlance: Free Mileage Log	FINANCE	4	25508	Varies with device	1000000	0	Everyone	{Finance}	2018-07-31	Varies with device	4.2 and up
3466	Rent.com Apartment Homes	FAMILY	4	25489	62M	1000000	0	Everyone	{Simulation}	2018-08-06	2.9.0	4.1 and up
3467	The first year of a baby’s life	TOOLS	4.1	25438	3.2M	1000000	0	Everyone	{Tools}	2018-04-24	1.2.3	4.0.3 and up
3468	Camera Pro	PRODUCTIVITY	4.2	25427	9.2M	1000000	0	Everyone	{Productivity}	2018-01-05	18	4.0 and up
3469	Read Unlimitedly! Kids’n Books	PRODUCTIVITY	4.6	25370	Varies with device	1000000	0	Everyone	{Productivity}	2018-08-06	Varies with device	Varies with device
3470	BDCast - Bangla Live TV,Radio	PRODUCTIVITY	4.6	25370	Varies with device	1000000	0	Everyone	{Productivity}	2018-08-06	Varies with device	Varies with device
3471	Tattoodo - Find your next tattoo	GAME	3.8	25275	21M	5000000	0	Everyone	{Racing}	2017-08-11	1.1	2.3 and up
3472	Yahoo! Weather for SH Forecast for understanding the approach of rain clouds Free	WEATHER	4.5	25243	26M	100000	2.99	Everyone	{Weather}	2018-08-01	4.34.0	4.4 and up
3473	What was I in my Past Life	FINANCE	3.9	25205	Varies with device	1000000	0	Everyone	{Finance}	2018-07-27	Varies with device	Varies with device
3474	I am Dentist - Save my Teeth	BUSINESS	4.1	25195	21M	1000000	0	Everyone	{Business}	2018-02-26	v3.4.0-3	4.0.3 and up
3475	Survival Mobile:10,000 BC	EDUCATION	4.6	25183	5.4M	1000000	0	Everyone	{Education}	2017-12-25	5.7.2	4.0 and up
3476	TouchPal Purple Butterfly Theme	SPORTS	4.7	25172	30M	500000	0	Everyone	{Sports}	2018-05-23	5.5	4.1 and up
3477	Battleheart Legacy	FINANCE	4.3	25166	11M	1000000	0	Everyone	{Finance}	2018-07-25	3.1.16	4.1 and up
3478	The Escapists	GAME	4.3	25094	82M	1000000	0	Teen	{"Role Playing"}	2018-07-06	1.2.0	4.3 and up
3479	Top Popular Ringtones 2018 Free 🔥	TOOLS	3.4	25094	Varies with device	10000000	0	Everyone	{Tools}	2018-07-18	Varies with device	Varies with device
3480	Ultimate Calculator for CR	PERSONALIZATION	3.9	25037	14M	1000000	0	Everyone	{Personalization}	2016-10-20	5.7.6	2.3 and up
3481	MLP Colouring Adventures	PERSONALIZATION	3.9	25035	14M	1000000	0	Everyone	{Personalization}	2016-10-20	5.7.6	2.3 and up
3482	Wedding Countdown Widget	COMMUNICATION	3.7	25021	61M	5000000	0	Everyone	{Communication}	2018-06-26	9.9.0	4.3 and up
3483	Q-See QT View	TOOLS	4.7	24985	7.8M	500000	0	Everyone	{Tools}	2018-07-27	2.2.927	4.1 and up
3484	Project Fi by Google	FINANCE	4.2	24980	9.2M	1000000	0	Everyone	{Finance}	2018-07-16	2.1.3	4.1 and up
3485	Reindeer VPN - Proxy VPN	HOUSE_AND_HOME	4.1	24977	21M	1000000	0	Everyone	{"House & Home"}	2018-08-01	3.5.9	4.0.3 and up
3486	DS photo	SHOPPING	4.2	24953	Varies with device	1000000	0	Everyone	{Shopping}	2018-06-21	Varies with device	Varies with device
3487	Manga Books	FAMILY	4.3	24936	38M	5000000	0	Everyone	{Educational,Education}	2018-05-16	3.1	4.1 and up
3488	Learn To Draw Glow Flower	FAMILY	4.3	24877	54M	5000000	0	Everyone	{Puzzle,"Action & Adventure"}	2018-06-20	2.1.6579	4.1 and up
3489	AW - free video calls and chat	NEWS_AND_MAGAZINES	4	24790	Varies with device	1000000	0	Everyone	{"News & Magazines"}	2018-07-20	Varies with device	Varies with device
3490	Offline Jízdní řády CG Transit	NEWS_AND_MAGAZINES	4	24790	Varies with device	1000000	0	Everyone	{"News & Magazines"}	2018-07-20	Varies with device	Varies with device
3491	Ez iCam	TRAVEL_AND_LOCAL	3.9	24781	8.3M	5000000	0	Everyone	{"Travel & Local"}	2018-07-11	5.6.1	6.0 and up
3492	Easy Makeup Tutorials	TRAVEL_AND_LOCAL	3.9	24781	8.3M	5000000	0	Everyone	{"Travel & Local"}	2018-07-11	5.6.1	6.0 and up
3493	4x4 Jeep Racer	FAMILY	4.2	24775	30M	100000	0	Everyone 10+	{Puzzle}	2015-10-12	1.2.1	2.3.3 and up
3494	Pujie Black Watch Face for Android Wear OS	FINANCE	4.3	24729	32M	1000000	0	Everyone	{Finance}	2018-08-03	6.7.0	5.0 and up
3495	Advanced calculator fx 991 es plus & 991 ms plus	GAME	3.9	24697	16M	500000	0	Teen	{Action}	2015-07-10	1.5	4.0 and up
3496	Learn Body Parts in English	FAMILY	4.1	24668	40M	1000000	0	Everyone	{Simulation}	2016-08-04	1.0.2	2.3.3 and up
3497	Zenith Bank Mobile App	FINANCE	4.2	24666	Varies with device	1000000	0	Everyone	{Finance}	2018-07-13	Varies with device	Varies with device
3498	TAXI DRIVER	FINANCE	4.2	24647	Varies with device	1000000	0	Everyone	{Finance}	2018-07-13	Varies with device	Varies with device
3499	PLANK!	GAME	4.3	24628	88M	1000000	0	Everyone	{Action}	2018-07-26	1.25.396	4.4 and up
3500	HauteLook	VIDEO_PLAYERS	4.1	24565	5.5M	1000000	0	Everyone	{"Video Players & Editors"}	2016-03-04	2.1	2.3.3 and up
3501	Cheap hotel deals and discounts — Hotellook	FAMILY	4.7	24557	24M	1000000	0	Everyone	{Casual,Creativity}	2018-08-03	1.3.6	4.4 and up
3502	AdWords Express	PRODUCTIVITY	3.8	24517	22M	10000000	0	Everyone	{Productivity}	2018-05-23	4.2.17	5.0 and up
3503	The Hunt for the Lost Treasure	NEWS_AND_MAGAZINES	4.1	24456	Varies with device	1000000	0	Everyone	{"News & Magazines"}	2018-07-24	Varies with device	Varies with device
3504	Funny Ringtones	SOCIAL	4.3	24456	4.6M	1000000	0	Teen	{Social}	2018-05-29	4.7	4.1 and up
3505	Cut Out : Background Eraser and background changer	WEATHER	4.2	24349	9.2M	1000000	0	Everyone	{Weather}	2018-05-14	1.8.4.5	4.1 and up
3506	Al-Quran Ahmad Saud Offline	GAME	4	24312	25M	500000	0	Everyone	{Music}	2018-07-22	3.3	4.0.3 and up
3507	Yoong: Kick ’Em Up!	TRAVEL_AND_LOCAL	4.4	24281	29M	1000000	0	Everyone	{"Travel & Local"}	2018-07-25	4.4.2	4.4 and up
3508	MAIN	BOOKS_AND_REFERENCE	4.7	24278	3.1M	1000000	0	Everyone	{"Books & Reference"}	2017-12-27	2.1.2	2.2 and up
3509	Reminder	TOOLS	4.4	24265	3.3M	1000000	0	Everyone	{Tools}	2017-07-25	4.0.6	4.0.3 and up
3510	Battle Result Predictor for CR	TOOLS	4.1	24226	Varies with device	1000000	0	Everyone	{Tools}	2017-06-27	1.0.5	Varies with device
3511	File Viewer for Android	PERSONALIZATION	4	24215	Varies with device	1000000	0	Everyone	{Personalization}	2018-08-03	Varies with device	Varies with device
3512	Educational Games for Kids	GAME	4.5	24210	45M	500000	0	Teen	{Action}	2015-11-13	1.091	2.2 and up
3513	Block Survival Craft:The Story	TOOLS	4.2	24199	3.9M	50000000	0	Everyone	{Tools}	2014-11-21	1.02.53	4.4 and up
3514	Tickets SDA 2019 + Exam RF	PERSONALIZATION	3.8	24198	2.2M	1000000	0	Everyone	{Personalization}	2014-07-10	1	1.6 and up
3515	Tencent News	TOOLS	4.3	24175	8.5M	5000000	0	Everyone	{Tools}	2015-10-30	1.0.612931	5.0 and up
3516	Sharaf DG	TOOLS	3.1	24151	15M	10000000	0	Everyone	{Tools}	2018-08-06	11.7.0	4.1 and up
3517	Game for KIDS: KIDS match’em	FAMILY	3.7	24137	Varies with device	5000000	0	Everyone	{Education}	2018-06-25	Varies with device	Varies with device
3518	CA Lottery Official App	FAMILY	3.9	24123	69M	1000000	0	Teen	{Entertainment}	2018-06-01	5.9.006	4.1 and up
3519	Barclays US for Android	HEALTH_AND_FITNESS	4.6	24094	18M	1000000	0	Everyone	{"Health & Fitness"}	2018-07-09	3.3.0(1)	4.1 and up
3520	CV-Library Job Search	HEALTH_AND_FITNESS	4.6	24094	18M	1000000	0	Everyone	{"Health & Fitness"}	2018-07-09	3.3.0(1)	4.1 and up
3521	join.me - Simple Meetings	FAMILY	3.3	24091	16M	5000000	0	Teen	{Casual}	2016-08-04	1.1.0	2.3 and up
3522	AE GTO Racing	SPORTS	4.3	24082	95M	1000000	0	Everyone	{Sports}	2018-07-04	6.5	4.4 and up
3523	The green alien dance	COMICS	4.6	24005	4.9M	500000	0	Adults only 18+	{Comics}	2018-07-04	1.1.7.0	4.1 and up
3524	AE Bubble:Offline Bubble Games	FAMILY	4.6	23971	24M	1000000	0	Everyone	{Simulation}	2018-08-04	39.231	4.1 and up
3525	eHub	LIFESTYLE	4.5	23966	872k	1000000	5.99	Everyone	{Lifestyle}	2018-06-27	20180608	4.0 and up
3526	HTC Calendar	MEDICAL	4.3	23889	Varies with device	1000000	0	Everyone	{Medical}	2018-07-10	Varies with device	4.0 and up
3527	Chinese Chess / Co Tuong	LIBRARIES_AND_DEMO	4.2	23859	860k	1000000	0	Everyone	{"Libraries & Demo"}	2014-10-29	1	4.0 and up
3528	NAVITIME Bus Transit JAPAN	TOOLS	4.5	23805	4.1M	1000000	0	Everyone	{Tools}	2017-08-13	2.0.4	4.0.3 and up
3529	CheapTickets – Hotels, Flights & Travel Deals	PERSONALIZATION	4.7	23802	173k	100000	4.99	Everyone	{Personalization}	2016-11-17	1.0.9	4.0 and up
3530	Become a Job - Find a job or advertise	FAMILY	4.3	23772	17M	5000000	0	Everyone	{Board,"Brain Games"}	2017-08-02	1.15.3028.0	2.3 and up
3531	Elmo Calls by Sesame Street	BUSINESS	3.7	23729	24M	1000000	0	Everyone	{Business}	2018-05-14	7.2	4.4 and up
3532	RadPad: Apartment Finder App	COMMUNICATION	4.3	23707	Varies with device	500000	0	Everyone	{Communication}	2017-08-09	2.3.17	Varies with device
3533	DC Metro Transit - Free	FAMILY	3.3	23682	9.8M	1000000	0	Teen	{Casual}	2018-06-14	6.2	4.0 and up
3534	Unclouded - Cloud Manager	FAMILY	4.5	23671	91M	1000000	0	Everyone	{Arcade,"Pretend Play"}	2018-07-31	1.2.0	4.1 and up
3535	EZ Clock & Weather Widget	ENTERTAINMENT	4.2	23666	3.6M	1000000	0	Teen	{Entertainment}	2018-05-04	8.1	4.0 and up
3536	XDV	NEWS_AND_MAGAZINES	4.3	23641	23M	1000000	0	Everyone 10+	{"News & Magazines"}	2018-06-29	3.9.0	4.1 and up
3537	Simply Yoga - Fitness Trainer for Workouts & Poses	FAMILY	4.1	23609	31M	1000000	0	Teen	{Casual}	2018-04-13	1.26	4.0 and up
3538	Wheretoget: Shop in style	GAME	4.5	23599	96M	100000	0	Teen	{Action}	2018-06-01	11.0.2	4.0 and up
3539	EZ Cleaner - Booster Optimizer	FAMILY	4.4	23474	8.8M	5000000	0	Everyone	{Casual,Creativity}	2018-07-26	1.0.7	4.1 and up
3540	Hallmark Channel Everywhere	LIFESTYLE	4.1	23453	10M	1000000	0	Everyone	{Lifestyle}	2017-10-26	2	4.0 and up
3541	Airport + Flight Tracker Radar	PHOTOGRAPHY	4.1	23440	30M	1000000	0	Everyone	{Photography}	2018-07-11	1.8.2	4.0 and up
3542	Wolfify - Be a Werewolf	PRODUCTIVITY	4.6	23393	Varies with device	1000000	0	Everyone	{Productivity}	2018-07-12	Varies with device	Varies with device
3543	e-Boks.dk	TOOLS	3.9	23348	3.2M	5000000	0	Everyone	{Tools}	2018-07-04	3.48	4.0.3 and up
3544	Dash Tag - Fun Endless Runner!	TOOLS	3.7	23347	7.6M	5000000	0	Everyone	{Tools}	2018-05-28	3.2.0.169	2.3 and up
3545	myChevrolet	FAMILY	4.4	23302	12M	5000000	0	Everyone	{Puzzle}	2018-03-24	1.0.6	4.0 and up
3546	AG Subway Simulator Lite	NEWS_AND_MAGAZINES	4.2	23292	14M	1000000	0	Everyone 10+	{"News & Magazines"}	2018-05-24	3.1.12	4.1 and up
3547	Kanji test · Han search Kanji training (free version)	FAMILY	4.2	23292	20M	1000000	0	Everyone	{Simulation}	2017-09-19	1.4	2.3 and up
3548	[root] Pry-Fi	NEWS_AND_MAGAZINES	4.2	23291	14M	1000000	0	Everyone 10+	{"News & Magazines"}	2018-05-24	3.1.12	4.1 and up
3549	Rope Superhero Unlimited	MAPS_AND_NAVIGATION	4.2	23279	8.5M	1000000	0	Everyone	{"Maps & Navigation"}	2018-04-26	5.2.10	4.1 and up
3550	DR TV	BUSINESS	3.9	23243	Varies with device	5000000	0	Everyone	{Business}	2018-06-25	Varies with device	Varies with device
3551	FANDOM for: DC	SHOPPING	4.1	23187	25M	1000000	0	Everyone	{Shopping}	2018-06-21	4.89	4.3 and up
3552	WannaMeet – Dating & Chat App	BUSINESS	4.3	23175	41M	1000000	0	Everyone	{Business}	2018-07-13	18.7	4.1 and up
3553	Block Battles: Heroes at War - Multiplayer PVP	BUSINESS	4.3	23175	41M	1000000	0	Everyone	{Business}	2018-07-13	18.7	4.1 and up
3554	DX	BUSINESS	4.3	23175	41M	1000000	0	Everyone	{Business}	2018-07-13	18.7	4.1 and up
3555	Quran for All (Al-Huda Int.)	DATING	4.3	23170	9.0M	500000	0	Mature 17+	{Dating}	2018-07-25	1.5.4.0	4.1 and up
3556	Video Status	GAME	4	23168	54M	1000000	0	Teen	{Adventure}	2018-07-09	1.3.0	4.4 and up
3557	MK eCatalog	LIFESTYLE	4.2	23164	10.0M	1000000	0	Mature 17+	{Lifestyle}	2018-07-24	2.6	5.0 and up
3558	Connect’Em Halloween	MEDICAL	4.7	23160	26M	1000000	0	Everyone	{Medical}	2018-07-27	7.4.1	5.0 and up
3559	Ambulance Rescue Simulator 17	MEDICAL	4.7	23160	26M	1000000	0	Everyone	{Medical}	2018-07-27	7.4.1	5.0 and up
3560	Rainbow - Journal & Activities	NEWS_AND_MAGAZINES	4.5	23158	Varies with device	1000000	0	Everyone 10+	{"News & Magazines"}	2018-07-17	Varies with device	Varies with device
3561	Voice Lock Screen	FINANCE	4.6	23130	46M	1000000	0	Everyone	{Finance}	2018-07-12	2.1.4	4.2 and up
3562	Wall Decorating Ideas	GAME	3.9	23104	48M	1000000	0	Everyone	{Racing}	2015-08-05	2.2	2.3.3 and up
3563	Fossil Q	PRODUCTIVITY	4.5	23089	1.6M	10000000	0	Everyone	{Productivity}	2018-04-11	1.10.0.33_180403	5.0 - 8.0
3564	Live 3D Neon Blue Love Heart Keyboard Theme	ENTERTAINMENT	4.5	23063	17M	1000000	0	Everyone	{Entertainment,"Brain Games"}	2018-08-03	1.0.9	4.1 and up
3565	U - Webinars, Meetings & Messenger	FAMILY	4.2	23060	21M	1000000	0	Everyone	{Educational,Education}	2018-07-26	1.19	4.1 and up
3566	English in a Month Free	BUSINESS	4.1	23055	Varies with device	5000000	0	Everyone	{Business}	2018-06-08	Varies with device	Varies with device
3567	HTC Mail	GAME	4.3	23043	Varies with device	5000000	0	Everyone	{Arcade}	2018-07-25	3.5	4.1 and up
3568	US Mission - buy gourmet movie KTV	FAMILY	4.4	23022	80M	1000000	0	Everyone	{"Role Playing","Pretend Play"}	2018-08-02	2.16	4.1 and up
3569	EGW Writings 2	HOUSE_AND_HOME	4.4	23013	26M	5000000	0	Everyone	{"House & Home"}	2018-07-17	3.2.4	4.1 and up
3570	DB Train Simulator	GAME	4.3	23005	Varies with device	5000000	0	Everyone	{Arcade}	2018-07-25	3.5	4.1 and up
3571	Wendy’s – Food and Offers	ENTERTAINMENT	4	22998	Varies with device	1000000	0	Teen	{Entertainment}	2018-06-27	8.0626	Varies with device
3572	Advanced Download Manager Pro	ENTERTAINMENT	4	22997	Varies with device	1000000	0	Teen	{Entertainment}	2018-06-27	8.0626	Varies with device
3573	HumorCast - Authentic Weather	GAME	4.1	22896	19M	1000000	0	Everyone	{Arcade}	2018-07-26	pb1.0.0.1	4.0.3 and up
3574	My Movies Pro - Movie & TV Collection Library	FOOD_AND_DRINK	3.6	22875	22M	1000000	0	Everyone	{"Food & Drink"}	2018-07-27	4.2.6	5.0 and up
3575	AT&T Call Protect	FOOD_AND_DRINK	3.6	22875	22M	1000000	0	Everyone	{"Food & Drink"}	2018-07-27	4.2.6	5.0 and up
3576	Daddyhunt: Gay Dating	FINANCE	4.5	22808	Varies with device	1000000	0	Everyone	{Finance}	2018-08-03	Varies with device	Varies with device
3577	HTC Service—Video Player	COMMUNICATION	4.1	22782	351k	1000000	0	Everyone	{Communication}	2015-03-25	4.2.0	2.2 and up
3578	Kpop Music Quiz (K-pop Game)	TRAVEL_AND_LOCAL	4.4	22776	55M	1000000	0	Everyone	{"Travel & Local"}	2018-08-06	4.7.1	5.0 and up
3579	Kids Corner: Interactive Tales and Games for kids	PRODUCTIVITY	4.6	22775	26M	10000000	0	Everyone	{Productivity}	2018-07-31	3.8.2	4.4 and up
3580	Who viewed my fb profile pro★★	GAME	4.3	22773	Varies with device	1000000	0	Mature 17+	{Action}	2018-08-03	4.84	4.1 and up
3581	Stream - Live Video Community	TRAVEL_AND_LOCAL	4.4	22748	55M	1000000	0	Everyone	{"Travel & Local"}	2018-08-06	4.7.1	5.0 and up
3582	Dreamland Arcade - Steven Universe	SOCIAL	4	22695	Varies with device	1000000	0	Everyone 10+	{Social}	2018-06-21	Varies with device	Varies with device
3583	Boxed Wholesale	FAMILY	4.3	22667	35M	1000000	0	Teen	{"Role Playing"}	2018-07-26	1.10.1	4.4 and up
3584	Offroad Pickup Truck R	SOCIAL	4.2	22650	1.5M	1000000	0	Everyone	{Social}	2018-05-21	2.4.12	4.0 and up
3585	Cutie Cubies	HOUSE_AND_HOME	4.3	22584	16M	1000000	0	Everyone	{"House & Home"}	2018-07-16	4.7.13	4.4 and up
3586	Zlax.io Zombs Luv Ax	HOUSE_AND_HOME	4.3	22584	16M	1000000	0	Everyone	{"House & Home"}	2018-07-16	4.7.13	4.4 and up
3587	Goku Wallpaper Art	FAMILY	3.8	22570	35M	1000000	0	Everyone	{Simulation}	2017-01-09	1.2	2.3.3 and up
3588	3D DJ – DJ Mixer 2018	COMICS	3.7	22551	11M	1000000	0	Teen	{Comics}	2018-07-24	3.16.0	4.4 and up
3589	Ike - To-Do List, Task List	DATING	4.2	22545	5.9M	1000000	0	Mature 17+	{Dating}	2018-07-27	1.31.4	4.0.3 and up
3590	Soccer FC	DATING	4.2	22544	5.9M	1000000	0	Mature 17+	{Dating}	2018-07-27	1.31.4	4.0.3 and up
3591	City light CM Locker Theme	FOOD_AND_DRINK	3.8	22513	11M	1000000	0	Everyone	{"Food & Drink"}	2018-05-21	5.3.8	4.0.3 and up
3592	Photo Compress 2.0 - Ad Free	ENTERTAINMENT	4.6	22508	3.3M	10000000	0	Everyone	{Entertainment}	2015-07-16	v1.8b22p13	4.2 and up
3593	OneTouch Reveal	TOOLS	4.4	22503	6.5M	1000000	0	Everyone	{Tools}	2018-07-06	4.1	4.1 and up
3594	Messenger L SMS, MMS	SOCIAL	4.2	22492	1.5M	1000000	0	Everyone	{Social}	2018-05-21	2.4.12	4.0 and up
3595	My Talking Pet	BOOKS_AND_REFERENCE	4.4	22486	5.4M	1000000	0	Teen	{"Books & Reference"}	2018-06-06	3.2.1	4.0 and up
3596	Running & Jogging	GAME	4	22435	100M	1000000	0	Teen	{Action}	2018-08-01	1.1.0.3	5.0 and up
3597	Soccer Board Tactics	BOOKS_AND_REFERENCE	4.3	22401	4.6M	500000	0	Everyone	{"Books & Reference"}	2018-05-07	6.1.2	5.0 and up
3598	Masha and the Bear. Games for kids	EDUCATION	4.3	22384	17M	1000000	0	Everyone	{Education}	2018-07-31	4.7.0	5.0 and up
3599	BackCountry Navigator TOPO GPS PRO	EDUCATION	4.3	22384	17M	1000000	0	Everyone	{Education}	2018-07-31	4.7.0	5.0 and up
3600	Service CU Mobile Banking	MAPS_AND_NAVIGATION	3.9	22382	6.6M	1000000	0	Everyone	{"Maps & Navigation"}	2018-03-22	6.93	2.3.3 and up
3601	Bits Watch Face	ENTERTAINMENT	3.9	22378	19M	1000000	0	Teen	{Entertainment}	2018-07-08	11.45.0	4.4 and up
3602	SuperBikers 2	ENTERTAINMENT	3.9	22378	19M	1000000	0	Teen	{Entertainment}	2018-07-08	11.45.0	4.4 and up
3603	Sweet mi - unlimited hunnam hunting blind date	GAME	4.3	22333	9.7M	1000000	0	Everyone 10+	{Action}	2018-08-07	2.01	4.3 and up
3604	Sounds for Toddlers FREE	FAMILY	4.8	22290	13M	500000	0	Everyone	{Puzzle}	2018-08-05	18.08.05	4.0 and up
3605	Monica Toy TV	EDUCATION	4.3	22251	1.8M	1000000	0	Everyone	{Education}	2015-06-28	3	2.3 and up
3606	Rock N’ Cash Casino Slots -Free Vegas Slot Games	FAMILY	4.3	22248	1.8M	1000000	0	Everyone	{Education}	2015-06-28	3	2.3 and up
3607	Ovia Parenting & Baby Development Tracker	GAME	3.8	22191	3.0M	1000000	0	Everyone	{Board}	2015-05-04	1.1	2.3 and up
3608	Direct Express®	FAMILY	4.5	22167	88M	1000000	0	Everyone	{Educational}	2018-06-12	1.18	4.1 and up
3609	Walmart MoneyCard	FAMILY	4.6	22165	6.8M	1000000	0	Everyone	{Education}	2018-06-28	4.1806.3	4.0 and up
3610	HTC Speak	WEATHER	3.9	22154	Varies with device	10000000	0	Everyone	{Weather}	2017-08-10	8.50.935520	4.4 and up
3611	Poker Live! 3D Texas Hold’em	SOCIAL	4.6	22098	18M	1000000	0	Everyone	{Social}	2018-07-24	4.2.4	4.0.3 and up
3612	Learn English with El Chavo.	FOOD_AND_DRINK	4.5	22071	Varies with device	1000000	0	Everyone	{"Food & Drink"}	2018-06-29	Varies with device	Varies with device
3613	The Gang Sniper V. Pocket Edition.	MAPS_AND_NAVIGATION	4.2	22063	Varies with device	1000000	0	Everyone	{"Maps & Navigation"}	2018-07-31	Varies with device	Varies with device
3614	Do Not Disturb	TOOLS	4.1	22032	3.7M	1000000	0	Everyone	{Tools}	2017-08-17	5.1	4.1 and up
3615	Pastry & Cooking (Without Net)	FAMILY	4.5	22018	53M	500000	0	Teen	{Casual}	2018-07-18	2.6.1	5.0 and up
3616	Hole19: Golf GPS App, Rangefinder & Scorecard	FOOD_AND_DRINK	4.6	22015	Varies with device	1000000	0	Everyone	{"Food & Drink"}	2018-07-06	Varies with device	5.0 and up
3617	Digg	FINANCE	4.2	21996	14M	1000000	0	Everyone	{Finance}	2018-07-19	1.17.2	4.0.3 and up
3618	Zocdoc: Find Doctors & Book Appointments	TOOLS	4.5	21979	982k	1000000	0	Everyone	{Tools}	2017-06-07	2.1.15	1.6 and up
3619	DMV Permit Practice Test 2018 Edition	FAMILY	4.7	21979	38M	1000000	0	Everyone	{Puzzle}	2018-07-09	1.1.3	5.1 and up
3620	Free Messages, Video, Chat,Text for Messenger Plus	TOOLS	3.8	21943	2.3M	5000000	0	Everyone	{Tools}	2016-10-19	30	2.3 and up
3621	OnTrack Diabetes	GAME	4.5	21892	14M	1000000	0	Everyone	{Puzzle}	2017-12-29	1.3	4.0 and up
3622	Helper for Clash Royale (All-in-1)	GAME	4.5	21892	14M	1000000	0	Everyone	{Puzzle}	2017-12-29	1.3	4.0 and up
3623	Nedbank Money	ENTERTAINMENT	4.1	21867	39M	1000000	0	Teen	{Entertainment}	2018-07-12	2.19.0	5.0 and up
3624	あなカレ【BL】無料ゲーム	PRODUCTIVITY	4.3	21866	Varies with device	1000000	0	Everyone	{Productivity}	2018-08-04	70.0.3512.0	Varies with device
3625	Wireless news	PHOTOGRAPHY	4.5	21841	7.7M	1000000	0	Everyone	{Photography}	2018-07-24	1.6.4	4.2 and up
3626	Secret Codes For Android	FAMILY	4.3	21804	44M	1000000	0.99	Everyone 10+	{"Role Playing"}	2018-07-03	2.6.6	2.3 and up
3627	Moodpath - Depression & Anxiety Test	COMMUNICATION	3.8	21785	2.5M	1000000	0	Everyone	{Communication}	2015-08-13	1.41	2.3 and up
3628	Archery Physics Objects Destruction Apple shooter	AUTO_AND_VEHICLES	4.4	21777	Varies with device	1000000	0	Everyone	{"Auto & Vehicles"}	2018-08-04	Varies with device	Varies with device
3629	World Travel Guide by Triposo	VIDEO_PLAYERS	4.4	21762	Varies with device	1000000	0	Everyone	{"Video Players & Editors"}	2017-08-16	Varies with device	4.0.3 and up
3630	7 Weeks - Habit & Goal Tracker	FAMILY	3.3	21735	37M	1000000	0	Everyone	{Simulation}	2018-07-11	1.0.03	4.0 and up
3631	Tic Tac Toe	SPORTS	4.4	21733	Varies with device	1000000	0	Mature 17+	{Sports}	2018-06-29	Varies with device	Varies with device
3632	Homes.com 🏠 For Sale, Rent	PHOTOGRAPHY	4.3	21730	19M	1000000	0	Everyone	{Photography}	2018-05-23	1.6.0	4.0 and up
3633	DJ Mix Effects Simulator	GAME	4.2	21661	16M	1000000	0	Everyone	{Trivia}	2018-05-24	1.3.81	4.0 and up
3634	Business Dictionary	TOOLS	3.5	21592	25M	10000000	0	Everyone	{Tools}	2017-10-24	10.1.1	4.0.3 and up
3635	Fake Chat (Direct Message)	MAPS_AND_NAVIGATION	4.3	21589	5.6M	1000000	0	Everyone	{"Maps & Navigation"}	2018-08-01	5.1.0 free	4.0 and up
3636	Carrier Landings Pro	PHOTOGRAPHY	4.1	21578	1.6M	1000000	0	Everyone	{Photography}	2017-09-08	1.1.3	2.3 and up
3637	Memes Button	FINANCE	4.4	21570	27M	1000000	0	Everyone	{Finance}	2018-06-19	2.0.4	4.0 and up
3638	Six Pack Abs Photo Editor	PRODUCTIVITY	4.2	21507	6.6M	1000000	0	Everyone	{Productivity}	2017-08-31	13.4	4.0 and up
3639	Across Age DX	TRAVEL_AND_LOCAL	3.7	21443	Varies with device	5000000	0	Everyone	{"Travel & Local"}	2018-01-30	Varies with device	Varies with device
3640	Navmii GPS USA (Navfree)	FAMILY	3.6	21433	21M	1000000	0	Mature 17+	{Entertainment}	2018-05-29	3.0.1805181047	5.0 and up
3641	GoBank	GAME	3.8	21423	84M	1000000	0	Everyone	{Action}	2018-05-04	1.7.3	2.3 and up
3642	Learn to code with el Chavo	WEATHER	4.3	21404	7.6M	1000000	0	Everyone	{Weather}	2017-06-15	2.2	4.4 and up
3643	Chime - Mobile Banking	FOOD_AND_DRINK	3.8	21381	41M	1000000	0	Everyone	{"Food & Drink"}	2018-07-24	7.9.0.0	4.4 and up
3644	BBVA Compass Banking	BOOKS_AND_REFERENCE	4.7	21336	23M	1000000	0	Everyone	{"Books & Reference"}	2018-06-20	1.28	3.0 and up
3645	X-Wing Squadron Builder	FOOD_AND_DRINK	3.8	21314	41M	1000000	0	Everyone	{"Food & Drink"}	2018-07-24	7.9.0.0	4.4 and up
3646	Z Day: Hearts of Heroes	GAME	4.6	21266	45M	100000	2.99	Teen	{Action}	2015-07-26	1.1	2.3 and up
3647	Electric Car Taxi Driver: NY City Cab Taxi Games	GAME	4.7	21262	29M	1000000	0	Everyone	{Puzzle}	2018-08-03	1.0.9	4.4 and up
3648	iPlayIT for YouTube VR Player	GAME	4.1	21223	48M	1000000	0	Teen	{Adventure}	2018-04-20	1.6.6	4.1 and up
3649	HipChat - Chat Built for Teams	LIFESTYLE	4.1	21195	Varies with device	1000000	0	Everyone	{Lifestyle}	2018-06-22	Varies with device	Varies with device
3650	ES Disk Analyzer - Storage Space	MEDICAL	4.6	21189	36M	1000000	0	Everyone	{Medical}	2018-08-06	3.52.1	5.0 and up
3651	QR Code Pro	MEDICAL	4.6	21189	36M	1000000	0	Everyone	{Medical}	2018-08-06	3.52.1	5.0 and up
3652	Snap Cat Face Camera	MEDICAL	4.6	21187	35M	1000000	0	Everyone	{Medical}	2018-07-23	3.52.0	5.0 and up
3653	Who am I? (Biblical)	COMMUNICATION	4.3	21186	10M	1000000	0	Everyone	{Communication}	2018-08-04	Varies with device	Varies with device
3654	vide-greniers.org	PHOTOGRAPHY	4	21159	36M	500000	0	Everyone	{Photography}	2018-01-31	2.1.9	4.0.3 and up
3655	Master of Eternity(MOE)	FAMILY	3.8	21149	30M	1000000	0	Everyone	{Simulation}	2015-10-09	2.1	2.3 and up
3656	Invoice & Time Tracking - Zoho	NEWS_AND_MAGAZINES	4.2	21147	9.0M	5000000	0	Teen	{"News & Magazines"}	2018-08-06	2.2.1	4.0.3 and up
3657	Crime Wars S. Andreas	GAME	4.9	21119	48M	100000	4.99	Everyone	{Puzzle}	2018-04-18	1.0.1	4.4 and up
3658	Golden Dictionary (FR-AR)	GAME	4.3	21107	95M	100000	0	Everyone	{Music}	2018-07-30	1.2.1	4.0.3 and up
3659	Toy Pop Cubes	FAMILY	3.6	21095	7.9M	1000000	0	Everyone	{Entertainment}	2016-12-16	4	4.0.3 and up
3660	X Launcher: With OS11 Style Theme & Control Center	FAMILY	4	20977	26M	1000000	0	Everyone	{Simulation}	2018-06-18	1.4.5	4.0 and up
3661	Free intellectual training game application |	BUSINESS	3.1	20973	31M	5000000	0	Everyone	{Business}	2018-08-01	8.2.0.84	4.0 and up
3662	The Visitor: Ep.2 - Sleepover Slaughter	TOOLS	4.2	20941	2.0M	1000000	0	Everyone	{Tools}	2016-12-23	1.12.23	4.0 and up
3663	Color by Disney	BUSINESS	4.4	20921	5.7M	1000000	0	Everyone	{Business}	2018-01-11	4.0.3	4.1 and up
3664	Learn English with Phrases	COMMUNICATION	4.1	20901	7.3M	1000000	0	Everyone	{Communication}	2018-04-03	5.0.9	4.1 and up
3665	iSmart DV	SPORTS	3.7	20879	22M	1000000	0	Everyone	{Sports}	2018-06-09	5.1.13	4.1 and up
3666	R-TYPE II	TOOLS	4.3	20865	2.2M	1000000	0	Everyone	{Tools}	2015-10-30	2.0.3	2.1 and up
3667	EXO-L Amino for EXO Fans	FAMILY	3.2	20843	14M	1000000	0	Teen	{Entertainment}	2018-08-02	3.3.85 (2)	4.4 and up
3668	FC Zenit official Android app	COMMUNICATION	3.9	20829	1.9M	5000000	0	Everyone	{Communication}	2017-11-17	4.5.4	3.0 and up
3669	Blood Pressure Log - bpresso.com	BUSINESS	4.3	20815	10M	1000000	0	Everyone	{Business}	2018-07-26	6.4.4	5.0 and up
3670	Pool Billiards Classic - bi a	BUSINESS	4.3	20815	10M	1000000	0	Everyone	{Business}	2018-07-26	6.4.4	5.0 and up
3671	VPlayer	HEALTH_AND_FITNESS	4.4	20812	Varies with device	1000000	0	Teen	{"Health & Fitness"}	2018-07-27	Varies with device	Varies with device
3672	Flud (Ad free)	FAMILY	4.2	20807	52M	1000000	0	Everyone 10+	{Simulation}	2017-08-02	1.3	4.1 and up
3673	Kingdom in Chaos	COMMUNICATION	3.6	20769	18M	1000000	0	Everyone	{Communication}	2018-07-11	R6.0.3	4.1 and up
3674	Pro App for Craigslist	FAMILY	4	20763	Varies with device	5000000	0	Everyone	{Educational,Education}	2018-03-06	3.6.17	2.3 and up
3675	Waiting For U Launcher Theme	VIDEO_PLAYERS	4.4	20755	17M	1000000	0	Everyone	{"Video Players & Editors"}	2018-03-16	4.0.3	4.1 and up
3676	WiFi Tether Router	GAME	4.3	20691	89M	1000000	0	Everyone	{Racing}	2018-07-31	5.7.1	4.4 and up
3677	Allegiant	SOCIAL	3.5	20675	96M	1000000	0	Teen	{Social}	2018-08-02	4.4.0	5.0 and up
3678	f.lux (preview, root-only)	FINANCE	4.3	20672	Varies with device	1000000	0	Everyone	{Finance}	2018-05-08	Varies with device	Varies with device
3679	OnePlus Gallery	NEWS_AND_MAGAZINES	4.3	20620	Varies with device	1000000	0	Everyone	{"News & Magazines"}	2018-07-17	Varies with device	Varies with device
3680	Loved by King Bs	EVENTS	4	20611	12M	1000000	0	Teen	{Events}	2018-07-18	4.3.6	4.1 and up
3681	Lollipop Keyboard L Pro	MAPS_AND_NAVIGATION	3.7	20605	Varies with device	1000000	0	Everyone	{"Maps & Navigation"}	2018-08-06	Varies with device	Varies with device
3682	Pzizz - Sleep, Nap, Focus	HEALTH_AND_FITNESS	4.4	20547	5.7M	1000000	0	Everyone	{"Health & Fitness"}	2017-11-29	3.2.7	4.1 and up
3683	Thuuz Sports	HEALTH_AND_FITNESS	4.4	20547	5.7M	1000000	0	Everyone	{"Health & Fitness"}	2017-11-29	3.2.7	4.1 and up
3684	MLB Ballpark	FINANCE	4.7	20535	Varies with device	500000	0	Everyone	{Finance}	2018-07-31	Varies with device	Varies with device
3685	Pharmacy CI - Pharmacies de garde Côte d’Ivoire	SHOPPING	4.2	20476	28M	1000000	0	Everyone	{Shopping}	2018-07-17	5.6.0	4.4 and up
3686	Yoga Studio: Mind & Body	FAMILY	4.6	20463	25M	100000	3.99	Everyone 10+	{Strategy,"Action & Adventure"}	2018-07-18	1.2.1	4.1 and up
3687	LightMeter Free	FAMILY	4	20421	31M	1000000	0	Teen	{Puzzle}	2015-08-20	1.5	2.3 and up
3688	Local weather Forecast	TOOLS	4.6	20418	4.3M	1000000	0	Everyone	{Tools}	2018-04-08	4.54	4.0 and up
3689	3D Color by Number with Voxels	FAMILY	4.4	20368	31M	500000	0	Teen	{"Role Playing"}	2016-12-15	3.0.0fr	2.3 and up
3690	ExDialer PRO Key	GAME	4.2	20364	45M	5000000	0	Everyone	{Racing}	2018-07-12	1.2.1	4.1 and up
3691	CA DMV	HEALTH_AND_FITNESS	4.6	20326	28M	1000000	0	Teen	{"Health & Fitness"}	2018-08-04	2.9.18	4.1 and up
3692	The Great Wobo Escape Ep. 1	TRAVEL_AND_LOCAL	4.4	20313	57M	100000	0	Everyone	{"Travel & Local"}	2018-08-05	17.7.8	4.4 and up
3693	MailChimp - Email, Marketing Automation	LIFESTYLE	4.7	20304	24M	500000	0	Everyone	{Lifestyle}	2018-07-31	4.35	4.0.3 and up
3694	Baldur’s Gate II	LIFESTYLE	4.7	20304	24M	500000	0	Everyone	{Lifestyle}	2018-07-31	4.35	4.0.3 and up
3695	Poker Pro.Fr	HEALTH_AND_FITNESS	4.6	20301	22M	1000000	0	Everyone	{"Health & Fitness"}	2018-05-16	3.22	4.3 and up
3696	DuraSpeed	FAMILY	3.8	20292	47M	1000000	0	Everyone	{Educational,Creativity}	2015-05-24	1.2	2.3 and up
3697	F-Sim Space Shuttle	FAMILY	4.6	20267	46M	1000000	0	Everyone	{Educational,Education}	2018-07-16	1.1.6.7	4.1 and up
3698	Workout Tracker & Gym Trainer - Fitness Log Book	FAMILY	4.6	20267	46M	1000000	0	Everyone	{Educational,Education}	2018-07-16	1.1.6.7	4.1 and up
3699	Used car search Goo net whole car Go to net	ART_AND_DESIGN	4.7	20260	25M	500000	0	Everyone	{"Art & Design",Creativity}	2017-10-11	1.0.8	4.0.3 and up
3700	Door Lock Screen	SHOPPING	4.5	20247	47M	5000000	0	Everyone	{Shopping}	2018-08-03	4.70.30	4.1 and up
3701	Super Slime Blitz - Gumball	FAMILY	4.6	20178	9.0M	100000	0	Everyone	{Puzzle}	2014-05-26	1.7.3	1.6 and up
3702	EliteSingles – Dating for Single Professionals	HEALTH_AND_FITNESS	4.6	20161	Varies with device	1000000	0	Everyone	{"Health & Fitness"}	2018-08-01	Varies with device	Varies with device
3703	R. Physics Puzzle Game	LIBRARIES_AND_DEMO	4.1	20145	11k	1000000	0	Everyone	{"Libraries & Demo"}	2013-02-12		1.5 and up
3704	Undertale AU Amino	FAMILY	4.5	20101	7.8M	100000	9.99	Teen	{"Role Playing"}	2015-10-02	1.3	3.0 and up
3705	Baby Monitor	HEALTH_AND_FITNESS	3.3	20098	25M	10000000	0	Everyone	{"Health & Fitness"}	2018-05-14	5.31.75	4.4 and up
3706	Mental Hospital:EB 2 Lite	WEATHER	4.3	20008	9.1M	5000000	0	Everyone	{Weather}	2018-07-03	7.1.34.28	5.0 and up
3707	Traffic Sniper Counter Attack	WEATHER	4.7	20001	Varies with device	1000000	0	Mature 17+	{Weather}	2018-07-26	Varies with device	Varies with device
3708	Online Girls Chat	GAME	4.6	19922	35M	100000	1.99	Everyone 10+	{Board}	2018-07-30	2.2.5	5.0 and up
3709	Tennis Temple - Live Scores	TOOLS	4.4	19877	4.5M	1000000	0	Everyone	{Tools}	2018-01-07	1.1.6	4.0 and up
3710	Oxford A-Z of English Usage	FINANCE	4.5	19870	7.4M	1000000	0	Everyone	{Finance}	2018-07-24	2.9.5	4.0.3 and up
3711	Decay: The Mare - Ep.1 (Trial)	GAME	4.4	19816	57M	1000000	0	Everyone	{Racing}	2017-11-03	1.8.1	4.4 and up
3712	Camping RV Caravan Parking 3D	FINANCE	4.7	19784	7.3M	100000	2.99	Everyone	{Finance}	2018-06-13	7.6	4.0 and up
3713	Pink Color for Facebook	TOOLS	3.9	19758	2.9M	5000000	0	Everyone	{Tools}	2018-01-14	2.7	4.0 and up
3714	AE Roundy POP	VIDEO_PLAYERS	3.8	19738	33M	1000000	0	Teen	{"Video Players & Editors"}	2018-08-07	9.7.6	4.0 and up
3715	Digital TV	FAMILY	3.9	19727	76M	1000000	0	Teen	{Simulation}	2018-07-03	32	4.1 and up
3716	FC Barcelona Official Keyboard	FAMILY	4.2	19720	41M	1000000	0	Everyone	{Education,Education}	2017-11-07	1.35.23	4.0 and up
3717	JW Caleb y Sofia	WEATHER	4.2	19666	Varies with device	1000000	0	Everyone	{Weather}	2018-04-11	Varies with device	Varies with device
3718	ClickMeeting Webinars	FAMILY	4.6	19640	67M	100000	0	Teen	{Simulation}	2018-05-18	2	4.4 and up
3719	Creative Ideas - DIY & Craft	LIFESTYLE	4.4	19621	Varies with device	500000	0	Everyone	{Lifestyle}	2016-02-27	Varies with device	Varies with device
3720	virtual lover 3D	FAMILY	3.6	19601	56M	1000000	0	Everyone 10+	{Casual}	2018-06-06	1.0.4	4.1 and up
3721	Offroad Pickup Truck S	SOCIAL	4.5	19583	37M	1000000	0	Teen	{Social}	2018-08-01	5.2.1	4.4 and up
3722	Lock Screen - DU Locker & Lock screen wallpaper	HEALTH_AND_FITNESS	4.8	19543	Varies with device	100000	2.99	Everyone	{"Health & Fitness"}	2018-01-19	Varies with device	Varies with device
3723	muzmatch: Muslim & Arab Singles, Marriage & Dating	MEDICAL	4.2	19473	Varies with device	1000000	0	Everyone	{Medical}	2018-07-24	Varies with device	Varies with device
3724	Planning Center Services	SOCIAL	3.8	19446	Varies with device	1000000	0	Mature 17+	{Social}	2017-12-01	3.4.5	4.0.3 and up
3725	JustSayHi- Dating App. Chat & Meet Singles Nearby	FAMILY	4.1	19388	35M	1000000	0	Everyone	{Entertainment,"Music & Video"}	2018-05-03	2.1.0.2173	4.0.3 and up
3726	Trip by Skyscanner - City & Travel Guide	FOOD_AND_DRINK	4.3	19373	43M	1000000	0	Everyone	{"Food & Drink"}	2018-07-31	3.3.6	4.4 and up
3727	La La-Shop Designer Brands Street	FOOD_AND_DRINK	4.3	19314	43M	1000000	0	Everyone	{"Food & Drink"}	2018-07-31	3.3.6	4.4 and up
3728	Modcloth – Unique Indie Women’s Fashion & Style	PRODUCTIVITY	4.7	19302	7.2M	5000000	0	Everyone	{Productivity}	2018-06-28	3.5.12	4.0.3 and up
3729	RightNow English Conversation	GAME	3.3	19291	5.1M	1000000	0	Everyone	{Board}	2018-01-02	1.24	4.1 and up
3730	Where to travel - ticket. hotel. train ticket. car ticket. travel. tickets	EDUCATION	4.7	19277	5.3M	1000000	0	Everyone	{Education}	2017-12-25	3.4.2	4.0 and up
3731	Ad Detect Plugin - Handy Tool	FAMILY	4.4	19245	25M	1000000	0	Everyone	{Casual,"Action & Adventure"}	2018-03-28	1.3	4.1 and up
3732	ABS Workout - Belly workout, 30 days AB	TOOLS	4.3	19234	14M	500000	0	Everyone	{Tools}	2017-02-23	3.1.3	4.0.3 and up
3733	Used car is the first car - used car purchase, used car quotation, dealer information to	PHOTOGRAPHY	4.1	19232	28M	1000000	0	Everyone	{Photography}	2018-08-06	7.4.2	4.4 and up
3734	Whataburger	FAMILY	4.5	19230	45M	5000000	0	Everyone	{Educational,"Brain Games"}	2018-07-12	8.25.10.01	4.0.3 and up
3735	USA Singles Meet, Match and Date Free - Date	SPORTS	4.1	19230	88M	1000000	0	Everyone	{Sports}	2018-05-30	4.5.19.56	4.1 and up
3736	Archie Comics	LIFESTYLE	3.8	19221	13M	5000000	0	Everyone	{Lifestyle}	2018-05-24	Varies with device	Varies with device
3737	Driving School 3D 2017	SHOPPING	4.4	19212	6.9M	500000	0	Everyone	{Shopping}	2018-08-03	0.2.9.17	4.1 and up
3738	Birds Sounds Ringtones & Wallpapers	FAMILY	4.7	19209	21M	100000	2.99	Everyone	{"Role Playing","Action & Adventure"}	2016-02-23	1.1.4	4.0 and up
3739	Bi en Línea	FAMILY	4.4	19207	36M	100000	0	Everyone	{"Role Playing"}	2016-09-19	1.19	2.3 and up
3740	Brain Waves - Binaural Beats	FAMILY	4.6	19170	70M	1000000	0	Everyone	{Strategy,"Action & Adventure"}	2017-03-15	1.4.2	4.0.3 and up
3741	Anime Manga Coloring Book	TOOLS	4.2	19096	10M	1000000	0	Everyone	{Tools}	2018-07-05	2.0.2	4.1 and up
3742	DAILY: Free Classifieds App for Android	BOOKS_AND_REFERENCE	4.7	19090	Varies with device	500000	0	Everyone	{"Books & Reference"}	2018-04-25	Varies with device	Varies with device
3743	Mobile FC	BOOKS_AND_REFERENCE	4.7	19080	Varies with device	500000	0	Everyone	{"Books & Reference"}	2018-04-25	Varies with device	Varies with device
3744	BQ Services	HEALTH_AND_FITNESS	4.5	19074	4.2M	1000000	0	Everyone	{"Health & Fitness"}	2018-01-17	16	4.0 and up
3745	OLX Uganda Sell Buy Cellphones	GAME	4.6	19070	90M	100000	0	Everyone 10+	{Action}	2018-08-04	1	Varies with device
3746	My baby firework	BUSINESS	4.1	19051	Varies with device	1000000	0	Everyone	{Business}	2018-08-01	99.0.0.35.75	4.1 and up
3747	95Live -SG#1 Live Streaming App	SOCIAL	4.8	19047	63M	100000	0	Teen	{Social}	2018-07-13	1.8.19106	4.0.3 and up
3748	Your rank CS:GO	BUSINESS	4.1	19023	Varies with device	1000000	0	Everyone	{Business}	2018-08-01	99.0.0.35.75	4.1 and up
3749	FlashLight HD LED Pro	GAME	4.1	18996	81M	1000000	0	Teen	{Strategy}	2018-08-01	1.5.2	4.1 and up
3750	Eat Fast Prepare "Without Internet"	GAME	4.3	18985	23M	5000000	0	Everyone	{Casual}	2018-07-23	1.5.4	4.0.3 and up
3751	Grim Tales: The Wishes CE	NEWS_AND_MAGAZINES	4	18976	35M	1000000	0	Everyone 10+	{"News & Magazines"}	2018-06-06	3.19.11	5.0 and up
3752	The Messenger App	NEWS_AND_MAGAZINES	4	18976	35M	1000000	0	Everyone 10+	{"News & Magazines"}	2018-06-06	3.19.11	5.0 and up
3753	DS cloud	LIFESTYLE	4.1	18968	32M	5000000	0	Teen	{Lifestyle}	2018-04-26	5.1	4.1 and up
3754	CF.lumen	LIFESTYLE	3.9	18961	1.8M	5000000	0	Everyone	{Lifestyle}	2015-09-24	1.1.1	2.3 and up
3755	Laftel - Watching and Announcing Snooping, Streaming	PERSONALIZATION	4.2	18926	2.9M	1000000	0	Everyone	{Personalization}	2013-09-28	0.5.2 beta	2.2 and up
3756	X-WOLF	HEALTH_AND_FITNESS	4.6	18921	Varies with device	1000000	0	Everyone	{"Health & Fitness"}	2018-08-04	Varies with device	Varies with device
3757	Video Maker with Photo and Music	PERSONALIZATION	4.4	18918	12M	5000000	0	Everyone	{Personalization}	2018-06-19	1.14	4.0 and up
3758	Day Night Live Wallpaper (All)	BEAUTY	4.7	18900	17M	500000	0	Everyone	{Beauty}	2018-08-02	6.10.1	5.0 and up
3759	Deep Sleep and Relax Hypnosis	FAMILY	4.6	18893	91M	100000	0	Everyone	{Casual,"Pretend Play"}	2018-06-09	1.4.1	4.0.3 and up
3760	Home workouts - fat burning, abs, legs, arms,chest	MAPS_AND_NAVIGATION	3.5	18857	7.0M	1000000	0	Everyone	{"Maps & Navigation"}	2018-05-24	9.3.3	4.0.3 and up
3761	DU Security	NEWS_AND_MAGAZINES	3.8	18818	Varies with device	1000000	0	Everyone 10+	{"News & Magazines"}	2018-06-26	Varies with device	Varies with device
3762	Talkie - Wi-Fi Calling, Chats, File Sharing	COMICS	4.4	18814	Varies with device	1000000	0	Mature 17+	{Comics}	2018-07-30	Varies with device	Varies with device
3763	AL Voice Recorder	WEATHER	4.2	18773	12M	10000000	0	Everyone	{Weather}	2018-05-24	1.3.A.2.9	4.4 and up
3764	Mango Languages: Lovable Language Courses	TOOLS	3.9	18751	3.6M	1000000	0	Everyone	{Tools}	2018-06-19	3.6	4.1 and up
3765	DP Creator for WhatsApp	MAPS_AND_NAVIGATION	4.4	18710	4.0M	1000000	0	Everyone	{"Maps & Navigation"}	2018-08-03	3.2.2	4.0.3 and up
3766	SKencar	VIDEO_PLAYERS	4.5	18699	4.1M	1000000	0	Everyone	{"Video Players & Editors"}	2018-03-27	1	4.0.3 and up
3767	ER Doctor Kids Emergency Room	SPORTS	4.2	18679	Varies with device	1000000	0	Everyone	{Sports}	2018-04-25	Varies with device	Varies with device
3768	Smart Air Conditioner	SPORTS	4.2	18678	Varies with device	1000000	0	Everyone	{Sports}	2018-04-25	Varies with device	Varies with device
3769	Chest Simulator for Clash Royale	MEDICAL	4.7	18674	Varies with device	1000000	0	Everyone	{Medical}	2018-07-27	3.25.0	4.4 and up
3770	Facebook Local	PRODUCTIVITY	4.4	18669	4.1M	1000000	0	Everyone	{Productivity}	2018-01-08	1.9.1.147.0-google	4.2 and up
3771	ES Holo Theme for Pro	GAME	4.4	18652	63M	100000	2.99	Everyone	{Board}	2018-07-04	2.1.2	4.4 and up
3772	Brica BPRO5 AE	TRAVEL_AND_LOCAL	4.3	18622	44M	1000000	0	Everyone	{"Travel & Local"}	2018-08-03	4.15.1	4.4 and up
3773	Cute wallpapers & kawaii backgrounds images	GAME	4.4	18621	63M	100000	2.99	Everyone	{Board}	2018-07-04	2.1.2	4.4 and up
3774	BeFunky Photo Editor Pro	FAMILY	4.4	18616	10M	1000000	0	Everyone	{Casual,Education}	2018-08-05	1.0.9	4.0.3 and up
3775	BJ’s Mobile App	FAMILY	4.5	18612	8.5M	100000	1.49	Everyone	{Puzzle}	2015-07-28	1.57	2.3 and up
3776	Hide N Seek : Mini Game	HEALTH_AND_FITNESS	4.8	18604	15M	1000000	0	Everyone	{"Health & Fitness"}	2018-05-02	1.0.0.9	4.1 and up
3777	G-SHOCK+	SPORTS	4.2	18584	49M	5000000	0	Everyone	{Sports}	2018-06-27	1.7.0	4.1 and up
3778	Multiple Videos at Same Time	HEALTH_AND_FITNESS	4.1	18539	57M	1000000	0	Everyone	{"Health & Fitness"}	2018-07-30	1.11.4	4.0.3 and up
3779	Undead Assault	HEALTH_AND_FITNESS	4.1	18539	57M	1000000	0	Everyone	{"Health & Fitness"}	2018-07-30	1.11.4	4.0.3 and up
3780	EX File Explorer File Manager	ENTERTAINMENT	3.7	18523	Varies with device	1000000	0	Teen	{Entertainment}	2018-07-02	Varies with device	Varies with device
3781	Guns’n’Glory WW2 Premium	FAMILY	3.7	18522	Varies with device	1000000	0	Teen	{Entertainment}	2018-07-02	Varies with device	Varies with device
3782	2Do - Reminders, To-do List & Notes	TOOLS	3.9	18513	6.1M	10000000	0	Everyone	{Tools}	2018-04-26	3.2	4.1 and up
3783	Relaxing Sounds	TOOLS	4	18478	1.7M	1000000	0	Everyone	{Tools}	2018-08-04	1.0.5	2.3 and up
3784	Tigo Money El Salvador	WEATHER	4.2	18425	5.3M	1000000	0	Everyone	{Weather}	2017-07-29	3.1.7	4.1 and up
3785	How Old am I?	EDUCATION	4.6	18372	47M	100000	0	Everyone	{Education}	2018-05-21	7.2.3634	4.4 and up
3786	Heart mill	SHOPPING	3.8	18364	29M	1000000	0	Everyone	{Shopping}	2018-08-04	29.14	4.2 and up
3787	Mobile C [ C/C++ Compiler ]	PHOTOGRAPHY	4.3	18325	Varies with device	1000000	0	Everyone	{Photography}	2017-09-03	Varies with device	Varies with device
3788	English to Urdu Dictionary	FAMILY	4.8	18298	8.0M	500000	0	Everyone	{Education}	2018-07-23	2.94	2.3.3 and up
3789	CP RACING 2 FREE	TRAVEL_AND_LOCAL	4.2	18294	28M	1000000	0	Everyone	{"Travel & Local"}	2018-08-02	13.8.3	4.0 and up
3790	Find&Save - Local Shopping	PERSONALIZATION	4.2	18280	6.0M	1000000	0	Everyone	{Personalization}	2015-01-08	1.28	1.6 and up
3791	Esporte Interativo - Notícias e Resultados Ao Vivo	GAME	4.3	18277	17M	1000000	0	Teen	{Arcade}	2016-03-14	2.0.2	2.3 and up
3792	DU Collage Maker - Photo Collage & Grid & Layout	SHOPPING	3.7	18253	10M	10000000	0	Everyone	{Shopping}	2018-08-06	6.3.8	4.1 and up
3793	BSPlayer	SHOPPING	3.6	18252	10M	10000000	0	Everyone	{Shopping}	2018-08-06	6.3.8	4.1 and up
3794	FD VR Theater - for Youtube VR	COMMUNICATION	4	18247	Varies with device	100000	3.99	Everyone	{Communication}	2018-07-05	7.5.3.20547	4.1 and up
3795	Coast To Coast AM Insider	TOOLS	4.2	18239	Varies with device	10000000	0	Everyone	{Tools}	2018-08-06	Varies with device	Varies with device
3796	U-48 Submarine Commander Free	WEATHER	4.3	18194	3.2M	1000000	0	Everyone	{Weather}	2017-06-28	1.7.7	3.0 and up
3797	Curriculum vitae App CV Builder Free Resume Maker	GAME	4.5	18125	15M	100000	4.99	Everyone	{Simulation,Education}	2018-07-09	Varies with device	4.4 and up
3798	Mupen64Plus AE (N64 Emulator)	TRAVEL_AND_LOCAL	4.4	18039	3.1M	1000000	0	Everyone	{"Travel & Local"}	2018-07-26	3.6.6	4.1 and up
3799	DB Streckenagent	COMMUNICATION	4	17998	7.9M	1000000	0	Teen	{Communication}	2018-03-27	2.6.3	4.0 and up
3800	Cardiac diagnosis (heart rate, arrhythmia)	GAME	4.4	17988	7.9M	100000	4.99	Teen	{Adventure}	2018-07-25	1.06	5.0 and up
3801	Snowboard Racing Free Fun Game	SOCIAL	4.1	17955	89M	500000	0	Teen	{Social}	2018-08-02	7.23.4	4.1 and up
3802	Offroad Pickup Truck F	PRODUCTIVITY	4.7	17955	3.8M	1000000	0	Everyone	{Productivity}	2018-05-23	1.7.9	4.0.3 and up
3803	MUTV - Manchester United TV	FAMILY	4.4	17945	9.5M	1000000	0	Mature 17+	{Entertainment}	2018-06-06	2.9.8	4.4 and up
3804	AX Battery Saver	PARENTING	3.9	17941	Varies with device	5000000	0	Everyone	{Parenting,"Music & Video"}	2018-05-27	Varies with device	Varies with device
3805	CB Background - Free HD Wallpaper Images	BEAUTY	4.2	17934	Varies with device	1000000	0	Everyone	{Beauty}	2017-09-12	Varies with device	Varies with device
3806	What Am I? - Brain Teasers	TRAVEL_AND_LOCAL	4.4	17915	Varies with device	1000000	0	Everyone	{"Travel & Local"}	2018-07-18	Varies with device	Varies with device
3807	codeSpark Academy & The Foos	TRAVEL_AND_LOCAL	4.8	17882	86M	1000000	0	Everyone	{"Travel & Local"}	2018-08-03	3.4.5	5.0 and up
3808	Super Dr. Parking 3D	TRAVEL_AND_LOCAL	4.4	17878	28M	1000000	0	Everyone	{"Travel & Local"}	2018-07-16	6.7.1	4.1 and up
3809	Facebook Face to Face Events	TRAVEL_AND_LOCAL	4.4	17878	28M	1000000	0	Everyone	{"Travel & Local"}	2018-07-16	6.7.1	4.1 and up
3810	Pocket RxTx Free	GAME	4	17876	37M	1000000	0	Everyone	{Racing}	2015-12-10	1.8.6	2.3 and up
3811	PlugShare	TOOLS	4.7	17861	Varies with device	100000	3.99	Everyone	{Tools}	2018-05-06	Varies with device	Varies with device
3812	Comics Reader	FAMILY	4.2	17786	16M	1000000	0	Everyone	{Casual}	2018-05-14	1.1.8	4.0 and up
3813	Mass Effect: Andromeda APEX HQ	FAMILY	4.4	17753	16M	1000000	0	Everyone	{Casual,"Brain Games"}	2018-05-25	2.2.3172	4.0.3 and up
3814	Download free book with green book	NEWS_AND_MAGAZINES	4.5	17703	6.6M	500000	0	Teen	{"News & Magazines"}	2018-06-07	4.10.0	4.4 and up
3815	Blood Donor	ENTERTAINMENT	4.4	17682	9.7M	1000000	0	Everyone	{Entertainment}	2018-08-03	5.2	4.0.3 and up
3816	Living Room Decorating Ideas	NEWS_AND_MAGAZINES	4.4	17671	17M	1000000	0	Everyone 10+	{"News & Magazines"}	2018-08-06	2.3.10	4.2 and up
3817	Room Painting Ideas	FAMILY	4	17543	19M	5000000	0	Everyone	{Casual}	2018-01-25	3.0.1	4.0 and up
3818	OST)	COMMUNICATION	4.1	17529	10M	1000000	0	Everyone	{Communication}	2018-07-26	5.86	4.0.3 and up
3819	MyLifeOrganized: To-Do List	BOOKS_AND_REFERENCE	4.3	17506	17M	1000000	0	Everyone	{"Books & Reference"}	2018-07-20	2.3.18	4.1 and up
3820	Mortgage by Zillow: Calculator & Rates	WEATHER	4.8	17493	11M	100000	4.49	Everyone	{Weather}	2018-04-20	1.3	4.4 and up
3821	Meet U - Get Friends for Snapchat, Kik & Instagram	GAME	4.2	17453	99M	1000000	0	Mature 17+	{Racing}	2018-06-01	1.06	2.3 and up
3822	White Noise ~ Sleeping Sounds	PRODUCTIVITY	4.2	17415	4.1M	1000000	0	Everyone	{Productivity}	2018-07-05	3.5.9	4.0 and up
3823	Z Origins - (Z The Game)	GAME	3.8	17372	45M	1000000	0	Mature 17+	{Arcade}	2015-08-08	1.3	2.3 and up
3824	Texas Hold’em Poker + | Social	LIFESTYLE	3.8	17368	14M	10000000	0	Everyone	{Lifestyle}	2018-06-27	5.1.3	4.0 and up
3825	DSLR Camera Hd Ultra Professional	SOCIAL	4.5	17350	12M	500000	0	Everyone	{Social}	2018-07-18	1.078	Varies with device
3826	Night Photo Frame	DATING	4.1	17268	40M	500000	0	Mature 17+	{Dating}	2018-06-25	4.1.2	4.0.3 and up
3827	Millionaire : Who want to be?	DATING	4.1	17268	40M	500000	0	Mature 17+	{Dating}	2018-06-25	4.1.2	4.0.3 and up
3828	Q Cat Live Wallpaper	GAME	4.5	17263	Varies with device	500000	0	Everyone	{Card}	2017-06-07	Varies with device	Varies with device
3829	20 minutes (CH)	FAMILY	3.7	17250	7.2M	1000000	0	Everyone 10+	{Entertainment,"Music & Video"}	2018-08-04	4.0.2	5.0 and up
3830	AS Guía de las Ligas 2017-2018	ENTERTAINMENT	3.7	17247	7.2M	1000000	0	Everyone 10+	{Entertainment,"Music & Video"}	2018-08-04	4.0.2	5.0 and up
3831	BT Controller	NEWS_AND_MAGAZINES	4	17240	Varies with device	1000000	0	Everyone 10+	{"News & Magazines"}	2018-08-03	Varies with device	4.1 and up
3832	Hairstyles step by step	TRAVEL_AND_LOCAL	4.1	17202	12M	5000000	0	Everyone	{"Travel & Local"}	2017-11-13	4.9.2	4.1 and up
3833	Bubble Shooter Space	SHOPPING	4.6	17180	31M	1000000	0	Everyone	{Shopping}	2018-08-03	5.3.1	4.4 and up
3834	Female Daily	FAMILY	4.2	17108	8.3M	100000	0	Everyone	{Strategy}	2016-06-23	1.3.9	2.3.3 and up
3835	Stock Quote	FOOD_AND_DRINK	4.4	17071	Varies with device	1000000	0	Everyone	{"Food & Drink"}	2018-08-02	Varies with device	5.0 and up
3836	BGCN TV	FAMILY	4.4	17069	94M	500000	0	Everyone 10+	{"Role Playing"}	2018-08-01	1.0.17.2	5.0 and up
3837	Loop - Caribbean Local News	FAMILY	3.9	17067	2.7M	5000000	0	Everyone	{Casual}	2018-02-13	2.4.4	4.1 and up
3838	Be the Manager 2016 (football)	AUTO_AND_VEHICLES	4.6	17057	Varies with device	1000000	0	Everyone	{"Auto & Vehicles"}	2018-07-30	Varies with device	Varies with device
3839	Riptide GP: Renegade	GAME	4.2	17044	4.9M	5000000	0	Everyone	{Puzzle}	2018-04-13	2.9	2.3.3 and up
3840	Mandala Coloring Book	GAME	4.2	17039	4.9M	5000000	0	Everyone	{Puzzle}	2018-04-13	2.9	2.3.3 and up
3841	Baritastic - Bariatric Tracker	TOOLS	3.4	17030	Varies with device	10000000	0	Everyone	{Tools}	2017-05-12	Varies with device	Varies with device
3842	Magic Tiles - Blackpink Edition (K-Pop)	TRAVEL_AND_LOCAL	3.7	16980	Varies with device	5000000	0	Everyone	{"Travel & Local"}	2018-07-18	Varies with device	Varies with device
3843	Free Hypnosis	TRAVEL_AND_LOCAL	3.7	16980	Varies with device	5000000	0	Everyone	{"Travel & Local"}	2018-07-18	Varies with device	Varies with device
3844	KudaGo - things to do in NY	TRAVEL_AND_LOCAL	3.7	16973	Varies with device	5000000	0	Everyone	{"Travel & Local"}	2018-07-18	Varies with device	Varies with device
3845	First Tech Federal CU	SHOPPING	4.2	16966	34M	1000000	0	Everyone	{Shopping}	2018-07-12	6.10.0	4.0.3 and up
3846	Garden Fruit Legend	FINANCE	4.6	16961	32M	500000	0	Everyone	{Finance}	2018-08-04	2.12.100	4.1 and up
3847	Mod GTA V for MCPE	HEALTH_AND_FITNESS	4.3	16943	32M	1000000	0	Everyone	{"Health & Fitness"}	2018-07-30	8.8.14	4.4 and up
3848	Room planner: Interior & Floorplan Design for IKEA	TOOLS	4.6	16936	5.0M	1000000	0	Everyone	{Tools}	2018-01-25	2.94	4.0 and up
3849	NCAA Sports	GAME	4.2	16876	59M	1000000	0	Teen	{Trivia}	2018-06-28	3.0.1	6.0 and up
3850	Q Remote Control	GAME	4.7	16851	81M	100000	1.99	Everyone 10+	{Music}	2018-08-03	1.5.0	4.4 and up
3851	Telstra	TRAVEL_AND_LOCAL	3.7	16815	28M	1000000	0	Everyone	{"Travel & Local"}	2018-07-15	3.1.3	5.0 and up
3852	The dollar in mexico	GAME	4.5	16815	59M	1000000	0	Teen	{Action}	2018-08-04	1.0404	4.0.3 and up
3853	Blogaway for Android (Blogger)	FINANCE	4.5	16808	Varies with device	1000000	0	Everyone	{Finance}	2018-05-01	Varies with device	Varies with device
3854	French to English Speaking - Apprendre l’ Anglais	SOCIAL	4.6	16801	Varies with device	1000000	0	Everyone	{Social}	2018-07-16	1.5.341	4.0.3 and up
3855	SIM Card Info	TRAVEL_AND_LOCAL	4.3	16734	10.0M	1000000	0	Everyone	{"Travel & Local"}	2018-07-31	8.8.2	5.0 and up
3856	EI Mobile	SHOPPING	3.9	16678	Varies with device	5000000	0	Everyone	{Shopping}	2018-07-25	Varies with device	Varies with device
3857	What is my IP address	MAPS_AND_NAVIGATION	4.3	16657	3.6M	1000000	0	Everyone	{"Maps & Navigation"}	2018-07-17	4.7.5	4.0.3 and up
3858	Safety stepping stone	LIFESTYLE	4.4	16637	10M	1000000	0	Everyone	{Lifestyle}	2017-06-18	1.8	2.3 and up
3859	X Home Bar - Free	LIFESTYLE	4.4	16637	10M	1000000	0	Everyone	{Lifestyle}	2017-06-18	1.8	2.3 and up
3860	Rhythm Patrol	GAME	4.4	16601	55M	500000	0	Teen	{"Role Playing"}	2018-07-26	1.18.0	4.0 and up
3861	Extreme Racing 2 - Real driving RC cars game!	FINANCE	4.3	16600	24M	1000000	0	Everyone	{Finance}	2018-06-19	1.7.7	4.4 and up
3862	Menstrual Calendar Premium	BUSINESS	3.9	16589	9.1M	1000000	0	Everyone	{Business}	2018-06-14	4.9.10	4.0.3 and up
3863	TappyToon Comics & Webtoons	HEALTH_AND_FITNESS	4.7	16570	73M	500000	0	Everyone	{"Health & Fitness"}	2018-07-29	4.8.0	4.4 and up
3864	Chispa, the Dating App for Latino, Latina Singles	PHOTOGRAPHY	4.4	16523	Varies with device	1000000	0	Everyone	{Photography}	2018-07-30	1.2.31	4.1 and up
3865	Real time Weather Forecast	GAME	3.6	16521	23M	1000000	0	Everyone	{Music}	2018-05-09	1.8.0502	2.3 and up
3866	ATI Cargoes and Transportation	FAMILY	4.4	16459	88M	500000	0	Everyone	{Entertainment}	2017-07-15	3.2.0	2.3 and up
3867	Burger King Italia	LIFESTYLE	4.5	16426	1.6M	500000	0	Everyone	{Lifestyle}	2017-02-26	2.7.8	2.2 and up
3868	Crew - Free Messaging and Scheduling	BUSINESS	4.2	16422	28M	1000000	0	Everyone	{Business}	2018-08-01	10.46.2	4.1 and up
3869	Urban Outfitters	BUSINESS	4.2	16422	28M	1000000	0	Everyone	{Business}	2018-08-01	10.46.2	4.1 and up
3870	Ulysse Speedometer Pro	PRODUCTIVITY	4.1	16420	3.8M	1000000	0	Everyone	{Productivity}	2018-05-16	4.4.0.4	2.3.3 and up
3871	G-Switch	SOCIAL	4.3	16404	2.3M	1000000	0	Everyone	{Social}	2018-06-24	1.6	2.3 and up
3872	C Pattern Programs Free	TOOLS	4.3	16395	Varies with device	1000000	0	Everyone	{Tools}	2018-06-28	Varies with device	Varies with device
3873	My EF	FAMILY	4.5	16391	13M	500000	0	Teen	{Entertainment}	2018-07-18	1.16	4.4 and up
3874	The World Ends With You	ENTERTAINMENT	4.5	16372	13M	500000	0	Teen	{Entertainment}	2018-07-18	1.16	4.4 and up
3875	Dosecast - Medication Reminder	PRODUCTIVITY	4.2	16349	9.0M	1000000	0	Everyone	{Productivity}	2016-04-25	4.0.7.3	4.1 and up
3876	Adventure Time Game Wizard	PHOTOGRAPHY	3.8	16320	Varies with device	100000	3.95	Everyone	{Photography}	2017-11-10	Varies with device	Varies with device
3877	Spot On Period, Birth Control, & Cycle Tracker	PHOTOGRAPHY	3.8	16317	Varies with device	100000	3.95	Everyone	{Photography}	2017-11-10	Varies with device	Varies with device
3878	BJ’s Wholesale Club	GAME	3.8	16282	35M	1000000	0	Teen	{Action}	2017-10-09	1.1.4	2.3 and up
3879	Hemnet	SPORTS	4.5	16257	14M	500000	0	Everyone 10+	{Sports}	2017-02-03	2.8	4.1 and up
3880	Moto LED for Moto X & E [Root]	GAME	4.2	16237	23M	500000	0	Everyone	{Racing}	2015-12-23	1.9.1	2.3 and up
3881	Basketball FRVR - Shoot the Hoop and Slam Dunk!	EDUCATION	4.3	16195	5.2M	1000000	0	Everyone	{Education}	2016-09-20	8.5.2	4.0 and up
3882	CJ VLC HD Remote (+ Stream)	TOOLS	4.4	16192	1.6M	1000000	0	Everyone	{Tools}	2016-07-13	4.1.9o	4.0 and up
3883	Youboox - Livres, BD et magazines	FAMILY	4	16190	88M	1000000	0	Everyone	{Action,"Action & Adventure"}	2018-04-24	2.1.1	4.0 and up
3884	Cathay Pacific	LIFESTYLE	3.2	16168	55M	1000000	0	Everyone	{Lifestyle}	2018-07-26	2.2.9	4.0.3 and up
3885	SportsManias Fantasy Team News	GAME	4.5	16162	99M	100000	2.99	Teen	{Action}	2017-04-06	1.2	2.3 and up
3886	KDRAMA Amino for K-Drama Fans	PRODUCTIVITY	4.3	16149	Varies with device	1000000	0	Everyone	{Productivity}	2018-07-24	Varies with device	Varies with device
3887	Five Nights at Flappy’s	BUSINESS	4.1	16129	Varies with device	10000000	0	Everyone	{Business}	2018-07-30	Varies with device	Varies with device
3888	Plugin:AOT v5.0	FAMILY	4.1	16111	57M	1000000	0	Everyone	{Simulation}	2018-06-12	1.11	4.1 and up
3889	H Band 2.0	EDUCATION	4.1	16103	13M	1000000	0	Everyone	{Education}	2018-07-31	5.7.1	4.1 and up
3890	Diabetes Connect	TRAVEL_AND_LOCAL	4	16101	Varies with device	50000000	0	Everyone	{"Travel & Local"}	2018-01-22	Varies with device	4.2 and up
3891	Bacteria Vaginosis	MAPS_AND_NAVIGATION	4.6	16094	5.4M	1000000	0	Everyone	{"Maps & Navigation"}	2018-07-31	2.7.2	4.0 and up
3892	World Cup 2018	GAME	3.7	16073	94M	500000	0	Mature 17+	{Action}	2017-11-14	1.4	4.0 and up
3893	Virtual DJ Sound Mixer	FAMILY	3.3	16063	3.8M	1000000	0	Teen	{Casual}	2016-06-02	3	2.3 and up
3894	CM Launcher Default Theme	FAMILY	4.6	16041	7.3M	1000000	0	Everyone	{Entertainment}	2018-07-05	1.3.3.1	4.3 and up
3895	Remote CT - Smart Remote	SPORTS	4.3	16016	6.9M	1000000	0	Everyone	{Sports}	2016-01-07	2.7.0	4.2 and up
3896	Z City	FINANCE	4.2	15993	45M	1000000	0	Everyone	{Finance}	2018-05-09	4.10.0	4.4 and up
3897	CV S ( CV Editor - Resume )	WEATHER	3.8	15966	9.2M	1000000	0	Everyone	{Weather}	2017-07-17	2	2.3 and up
3898	REG - Check the regnumber, find information about Swedish vehicles	FAMILY	4.5	15924	4.2M	100000	7.99	Teen	{"Role Playing"}	2017-03-15	1.2.1	4.0 and up
3899	Sketch ’n’ go	MAPS_AND_NAVIGATION	4.1	15922	Varies with device	1000000	0	Everyone	{"Maps & Navigation"}	2018-07-26	Varies with device	Varies with device
3900	GRE Prep & Practice by Magoosh	TOOLS	4.4	15911	16M	1000000	0	Everyone	{Tools}	2018-06-30	4.1.8.1	4.1 and up
3901	WebCams	SPORTS	4.9	15883	21M	100000	0	Everyone	{Sports}	2018-06-19	2.6.0	4.0.3 and up
3902	L.A. Crime Stories 2 Mad City Crime	COMMUNICATION	4.2	15880	32M	1000000	0	Everyone	{Communication}	2018-08-03	5.65.0	4.0 and up
3903	Barcode Scanner	MEDICAL	4.4	15875	Varies with device	1000000	0	Everyone	{Medical}	2018-05-22	Varies with device	4.4 and up
3904	FlashLight F.Light	FAMILY	4	15875	40M	1000000	0	Teen	{Simulation}	2017-03-03	1.5	4.2 and up
3905	ZipRealty Real Estate & Homes	VIDEO_PLAYERS	4.3	15874	5.4M	1000000	0	Everyone	{"Video Players & Editors"}	2018-07-05	1.2	4.1 and up
3906	FANDOM: Arrow and The Flash	SHOPPING	4	15867	Varies with device	5000000	0	Everyone	{Shopping}	2018-08-06	Varies with device	4.0.3 and up
3907	Video Player All Format for Android	MAPS_AND_NAVIGATION	4.8	15865	3.3M	1000000	0	Everyone	{"Maps & Navigation"}	2018-08-03	10	4.1 and up
3908	Epson iProjection	BUSINESS	4.6	15830	Varies with device	1000000	0	Everyone	{Business}	2018-07-19	Varies with device	Varies with device
3909	Abs, Core & Back Workout Challenge	GAME	4.6	15829	95M	1000000	0	Everyone	{Racing}	2018-07-24	1.29	4.0 and up
3910	Best Park in the Universe	GAME	4.4	15806	42M	1000000	0	Teen	{Arcade}	2018-06-06	1.0.7	4.1 and up
3911	Facebook Creator	VIDEO_PLAYERS	4.1	15765	10M	1000000	0	Everyone	{"Video Players & Editors"}	2014-09-12	2	2.2 and up
3912	REI – Shop Outdoor Gear	GAME	4.1	15763	54M	1000000	0	Everyone	{Arcade}	2018-07-17	1.6	4.1 and up
3913	Toy Attack	HEALTH_AND_FITNESS	4.4	15753	13M	100000	3.49	Everyone	{"Health & Fitness"}	2018-07-26	3.7.3	4.3 and up
3914	LBB - Find New & Unique Things To Do Around You	TRAVEL_AND_LOCAL	3.4	15750	Varies with device	5000000	0	Everyone	{"Travel & Local"}	2018-08-02	Varies with device	Varies with device
3915	Jamaa Amino for Animal Jam	FINANCE	4.2	15703	Varies with device	1000000	0	Everyone	{Finance}	2018-07-25	Varies with device	Varies with device
3916	Rainbow Camera	PHOTOGRAPHY	4.6	15700	10M	1000000	0	Everyone	{Photography}	2018-07-07	2.3	4.0.3 and up
3917	CN Superstar Soccer: Goal!!!	TOOLS	4.1	15693	18M	1000000	0	Everyone	{Tools}	2018-08-03	4.32.07	4.2 and up
3918	T-Mobile in	MAPS_AND_NAVIGATION	4.2	15681	Varies with device	5000000	0	Everyone	{"Maps & Navigation"}	2018-08-02	Varies with device	Varies with device
3919	Lerni. Learn languages.	TRAVEL_AND_LOCAL	4.3	15680	11M	1000000	0	Everyone	{"Travel & Local"}	2018-07-06	6.2.3	4.1 and up
3920	Dr. Unblock	HEALTH_AND_FITNESS	4.7	15674	6.1M	1000000	0	Everyone	{"Health & Fitness"}	2018-07-31	4.5.4	4.1 and up
3921	AXE.IO - Brutal Survival Battleground	TOOLS	3.9	15665	373k	5000000	0	Everyone	{Tools}	2016-07-08	1.1.43	4.0 and up
3922	Download Facebook Photo Albums	PERSONALIZATION	4.5	15633	14M	1000000	0	Everyone	{Personalization}	2017-03-09	1.1	4.0.3 and up
3923	Homesnap Real Estate & Rentals	TOOLS	4.3	15618	2.4M	1000000	0	Everyone	{Tools}	2017-11-27	1.5.2	2.3 and up
3924	Van Nien 2018 - Lich Van su & Lich Am	EVENTS	4.4	15558	26M	1000000	0	Everyone	{Events}	2018-08-03	2018.07.31229	5.0 and up
3925	Study Checker	MEDICAL	4.6	15545	Varies with device	100000	0	Everyone	{Medical}	2018-08-01	6.1.3	Varies with device
3926	Hotel Insanity	MEDICAL	4.6	15537	Varies with device	100000	0	Everyone	{Medical}	2018-08-01	6.1.3	Varies with device
3927	Simple Recipes	FAMILY	4	15489	60M	1000000	0	Everyone	{Casual,"Pretend Play"}	2017-10-11	2.4.9	4.0 and up
3928	MyQuest for Patients	NEWS_AND_MAGAZINES	4	15443	25M	1000000	0	Teen	{"News & Magazines"}	2018-06-19	4.2.133	4.4 and up
3929	Baby Panda Learns Shapes	COMMUNICATION	4.3	15439	2.2M	1000000	0	Everyone	{Communication}	2016-11-07	2.0.0	2.3 and up
3930	Wedding Planner by WeddingWire - Venues, Checklist	PHOTOGRAPHY	4.2	15426	50M	1000000	0	Everyone	{Photography}	2018-07-24	3.8.3	5.1 and up
3931	Quiz for Clash Royale™	GAME	4.6	15403	25M	1000000	0	Everyone	{Casual}	2018-08-02	1.8.1	4.1 and up
3932	Club	WEATHER	4.4	15370	21M	1000000	0	Everyone	{Weather}	2018-08-02	12.2.6.3660	4.1 and up
3933	All Events in City	PRODUCTIVITY	3.9	15368	Varies with device	100000000	0	Everyone	{Productivity}	2018-01-22	Varies with device	Varies with device
3934	Anime et Manga Amino en Français	FAMILY	4.6	15301	18M	100000	2.99	Everyone	{Puzzle,"Brain Games"}	2018-07-18	3.0.5	2.3 and up
3935	New Ringtones 2018	COMMUNICATION	4.2	15287	17M	1000000	0	Everyone	{Communication}	2018-01-24	2.2.245	4.0.3 and up
3936	Betterment	ENTERTAINMENT	3.9	15254	Varies with device	1000000	0	Teen	{Entertainment}	2018-06-19	Varies with device	Varies with device
3937	My Handbook : EE, EC, EI, E&T, EEE, EECS	FINANCE	3.6	15247	28M	1000000	0	Everyone	{Finance}	2018-07-13	3.0.5	4.0.3 and up
3938	Bible with EGW Comments	FAMILY	4.1	15246	78M	1000000	0	Everyone	{Simulation,"Action & Adventure"}	2017-07-12	3.2.473.202	4.0 and up
3939	Meme Generator	SPORTS	4.4	15221	30M	1000000	0	Everyone	{Sports}	2017-10-02	7.30.005	4.0.3 and up
3940	Little Fire Station	TRAVEL_AND_LOCAL	4.3	15209	Varies with device	100000	8.99	Everyone	{"Travel & Local"}	2018-08-01	Varies with device	Varies with device
3941	Curriculum Vitae	COMICS	4.2	15194	15M	1000000	0	Teen	{Comics}	2018-07-19	4.7.3	4.2 and up
3942	Caviar - Food Delivery	FINANCE	4.1	15192	38M	1000000	0	Everyone	{Finance}	2018-05-23	4.2.1	4.1 and up
3943	Cursive Writing Wizard - Handwriting	AUTO_AND_VEHICLES	4.4	15168	37M	1000000	0	Everyone	{"Auto & Vehicles"}	2018-07-27	10.0.2	4.2 and up
3944	APN Settings	FINANCE	4.4	15141	25M	1000000	0	Everyone	{Finance}	2018-07-24	4.63	5.0 and up
3945	Dr. Panda Restaurant 2	FAMILY	4.4	15105	36M	1000000	0	Everyone	{Education}	2018-06-11	3.1.8	4.3 and up
3946	A Call From Santa Claus!	PHOTOGRAPHY	4	15098	10.0M	1000000	0	Everyone	{Photography}	2017-03-03	1.43	2.3 and up
3947	Avenger Legends	PRODUCTIVITY	4.1	15097	14M	1000000	0	Everyone	{Productivity}	2018-07-23	1.6.0	4.2 and up
3948	CVS Caremark	DATING	4.1	15081	38M	1000000	0	Mature 17+	{Dating}	2018-07-26	4.7.6	4.1 and up
3949	Banking Calculator	TOOLS	4.3	15070	6.3M	1000000	0	Everyone	{Tools}	2018-07-30	23.2.7	4.0.3 and up
3950	Little Magnet BT	SPORTS	4.2	15068	2.5M	1000000	0	Everyone	{Sports}	2018-06-19	3.4	2.3 and up
3951	EZ-GUI Ground Station	FINANCE	4.1	15057	5.7M	500000	0	Everyone	{Finance}	2018-08-03	2.4.0	5.0 and up
3952	play2prep: ACT, SAT prep	COMMUNICATION	3.8	15036	253k	1000000	0	Everyone	{Communication}	2015-08-01	1.2.0	1.6 and up
3953	Haystack TV: Local & World News - Free	GAME	4.6	14989	78M	500000	0	Teen	{Card}	2018-07-06	1.9.2	4.0.3 and up
3954	Truck Car Navi by Navitime Large size car, traffic jam, traffic closure, live camera, typhoon / precipitation map	BUSINESS	4.3	14955	Varies with device	1000000	0	Everyone	{Business}	2018-07-30	Varies with device	Varies with device
3955	Patook - make platonic friends	FOOD_AND_DRINK	3.6	14952	39M	1000000	0	Everyone	{"Food & Drink"}	2018-06-08	5.8.5	4.1 and up
3956	Etihad Airways	COMMUNICATION	4.3	14873	Varies with device	1000000	0	Everyone	{Communication}	2018-07-12	Varies with device	Varies with device
3957	Wi-Fi Master	SOCIAL	3.6	14835	Varies with device	1000000	0	Teen	{Social}	2018-08-02	Varies with device	Varies with device
3958	Meritrust CU Mobile Banking	PERSONALIZATION	4.4	14832	8.6M	1000000	0	Everyone	{Personalization}	2018-08-03	4.6	4.0 and up
3959	EHS Dongsen Shopping	GAME	3.5	14823	40M	1000000	0	Teen	{Action}	2017-02-15	4	2.3 and up
3960	G-Switch 3	HEALTH_AND_FITNESS	4.7	14810	Varies with device	1000000	0	Everyone	{"Health & Fitness"}	2018-07-24	Varies with device	Varies with device
3961	El Laberinto del Demonio 2	ENTERTAINMENT	4.2	14807	19M	1000000	0	Teen	{Entertainment}	2018-07-08	11.45.0	4.4 and up
3962	Map and Router Badge	ENTERTAINMENT	4.2	14807	19M	1000000	0	Teen	{Entertainment}	2018-07-08	11.45.0	4.4 and up
3963	Klix.ba	ENTERTAINMENT	4.2	14807	19M	1000000	0	Teen	{Entertainment}	2018-07-08	11.45.0	4.4 and up
3964	myQ	FAMILY	4.4	14774	19M	1000000	0	Everyone	{Casual,"Brain Games"}	2018-07-23	1.9.3901	4.0.3 and up
3965	Gayvox - Gay Lesbian Bi Dating	BOOKS_AND_REFERENCE	4.7	14773	6.4M	500000	0	Everyone	{"Books & Reference"}	2017-10-09	4.1.92	3.0 and up
3966	Photo Designer - Write your name with shapes	COMMUNICATION	4.1	14766	16M	500000	0	Teen	{Communication}	2017-09-20	0.81 beta	4.0.3 and up
3967	AC & TV, DVD, Set Top Box - Remote control IR	BUSINESS	3.8	14760	8.6M	50000000	0	Everyone	{Business}	2018-01-31	1.1.07.6	7.0 and up
3968	SMS Park	FAMILY	3.9	14754	21M	1000000	0	Everyone 10+	{Entertainment}	2018-07-22	1.8.1	4.1 and up
3969	Checkers ✔️	HEALTH_AND_FITNESS	4.2	14709	15M	5000000	0	Everyone	{"Health & Fitness"}	2018-07-26	2.8.2	5.0 and up
3970	My baby Game (Balloon POP!)	EDUCATION	4.3	14700	21M	1000000	0	Everyone	{Education}	2018-07-30	5.7.0	4.4 and up
3971	My Ooredoo Algeria	FAMILY	4.5	14692	45M	1000000	0	Everyone	{Puzzle}	2018-07-19	1.173.126	4.1 and up
3972	ChatBot AI Talking Girl	HOUSE_AND_HOME	3.8	14657	Varies with device	1000000	0	Everyone	{"House & Home"}	2018-07-16	Varies with device	Varies with device
3973	Best Wallpapers Backgrounds(100,000+ 4K HD)	HOUSE_AND_HOME	3.8	14653	Varies with device	1000000	0	Everyone	{"House & Home"}	2018-07-16	Varies with device	Varies with device
3974	Hurdlr: Track Mileage, Expenses, and Log Receipts	FINANCE	4.3	14627	23M	1000000	0	Everyone	{Finance}	2018-07-09	5.1	4.1 and up
3975	Blood Pressure(BP) Diary	FAMILY	4.3	14604	68M	500000	0	Teen	{Simulation}	2018-07-04	3.1.2	4.2 and up
3976	Rail Planner Eurail/Interrail	GAME	4	14563	74M	1000000	0	Everyone 10+	{Adventure}	2017-12-22	0.6.49	4.1 and up
3977	Girls Hairstyles	TOOLS	3.9	14552	17M	10000000	0	Everyone	{Tools}	2018-07-31	v7.0.9.1.0526.1_06_0704	5.0 and up
3978	Ludo Family Dice Game	TRAVEL_AND_LOCAL	3.6	14544	43M	1000000	0	Everyone	{"Travel & Local"}	2018-07-27	7.2.5	4.1 and up
3979	Pixelmania - Color by number & create pixel art	TOOLS	4.1	14491	4.3M	1000000	0	Everyone	{Tools}	2018-02-26	2.1.2	Varies with device
3980	Dr. Cares - Amy’s Pet Clinic 🐈 🐕	PHOTOGRAPHY	4.3	14453	21M	1000000	0	Everyone	{Photography}	2018-03-13	1.9	4.1 and up
3981	Police Detector (Speed Camera Radar)	PRODUCTIVITY	4.1	14432	16M	1000000	0	Everyone	{Productivity}	2018-07-31	1.36.82	4.4 and up
3982	Guns’n’Glory Premium	FAMILY	4.2	14432	35M	500000	0	Everyone	{Casual}	2017-09-21	1.5	4.0.3 and up
3983	I am rich	PRODUCTIVITY	4.2	14428	1.2M	1000000	0	Everyone	{Productivity}	2015-12-03	2.0.3	2.2 and up
3984	VidPlay	HEALTH_AND_FITNESS	4.4	14402	Varies with device	1000000	0	Everyone	{"Health & Fitness"}	2018-08-03	Varies with device	Varies with device
3985	PlayTexas Hold’em Poker Free	HEALTH_AND_FITNESS	4.5	14394	9.9M	500000	0	Everyone	{"Health & Fitness"}	2017-07-16	Public.Heal	4.0.3 and up
3986	FJ 4x4 Cruiser Offroad Driving	FAMILY	4.2	14356	Varies with device	1000000	0	Everyone	{Entertainment,"Brain Games"}	2018-03-09	2.5	4.1 and up
3987	Toca Life: Hospital	EDUCATION	4.2	14286	Varies with device	5000000	0	Everyone	{Education,Creativity}	2018-04-26	Varies with device	4.1 and up
3988	Treasure Defense	GAME	4.1	14283	4.2M	1000000	0	Teen	{Casino}	2017-10-01	1.1.2	4.0 and up
3989	591 Housing Trading - Hong Kong	GAME	4.5	14253	81M	1000000	0	Everyone	{Racing}	2018-01-18	3.1	4.0 and up
3990	HTC Sense Input - ES	TOOLS	4.6	14224	7.1M	1000000	0	Everyone	{Tools}	2017-10-12	1.0.98_ww	2.3 and up
3991	Police VAZ LADA Simulator	NEWS_AND_MAGAZINES	4.5	14221	1.8M	1000000	0	Teen	{"News & Magazines"}	2015-12-11	2.0.3	2.3.3 and up
3992	Super Ear	HEALTH_AND_FITNESS	3.3	14210	96M	1000000	0	Everyone	{"Health & Fitness"}	2018-07-19	6.0.1	5.0 and up
3993	Moto Photo Editor	EDUCATION	4.5	14206	21M	500000	0	Everyone	{Education}	2018-07-26	1.16	3.0 and up
3994	Remote for Sony TV & Sony Blu-Ray Players MyAV	NEWS_AND_MAGAZINES	3.5	14153	Varies with device	1000000	0	Everyone 10+	{"News & Magazines"}	2018-08-03	Varies with device	Varies with device
3995	Paw Patrol by ShuffleCards	FAMILY	3.5	14145	5.9M	1000000	0	Everyone	{Strategy}	2016-06-08	1.0.9	4.0 and up
3996	HTC Service － DLNA	SPORTS	4.3	14123	13M	500000	0	Everyone	{Sports}	2018-08-01	4.0.0	4.0 and up
3997	GoPlus Cam	TRAVEL_AND_LOCAL	4.4	14114	46M	1000000	0	Everyone	{"Travel & Local"}	2018-08-04	18.21.0	5.0 and up
3998	Plastic Surgery Surgeon Simulator Er Doctor Games	MAPS_AND_NAVIGATION	4.3	14110	6.8M	1000000	0	Everyone	{"Maps & Navigation"}	2018-07-24	4.3	5.0 and up
3999	Local Weather Forecast & Visual Widget	PRODUCTIVITY	4.6	14089	8.4M	500000	0	Everyone	{Productivity}	2018-08-05	0.21.1	4.1 and up
4000	The Grand Bike V	FOOD_AND_DRINK	4.7	14065	7.1M	500000	0	Everyone	{"Food & Drink"}	2018-06-12	1.2.2	4.1 and up
4001	Messenger Kids – Safer Messaging and Video Chat	WEATHER	4.7	14051	8.7M	100000	3.99	Everyone	{Weather}	2018-08-04	8.5	4.0 and up
4002	My Earthquake Alerts - US & Worldwide Earthquakes	PERSONALIZATION	4.6	14026	12M	100000	0.99	Everyone	{Personalization}	2014-06-24	1.9	2.2 and up
4003	Wedding LookBook by The Knot	FAMILY	4.6	14014	60M	1000000	0	Everyone	{Education,Education}	2018-07-06	7.32	4.0.3 and up
4004	Counter Deck Calculator for CR	GAME	4.1	14002	19M	1000000	0	Everyone	{Arcade}	2018-07-26	pb1.0.0.1	4.0.3 and up
4005	Shiver: Moonlit Grove CE	NEWS_AND_MAGAZINES	4	13950	Varies with device	1000000	0	Mature 17+	{"News & Magazines"}	2018-08-06	Varies with device	Varies with device
4006	Robocar X Ray	DATING	3.4	13890	20M	500000	0	Mature 17+	{Dating}	2018-06-19	4.9.2 (Oasis)	4.2 and up
4007	Goodbox - Mega App	ART_AND_DESIGN	4.4	13880	28M	1000000	0	Everyone	{"Art & Design"}	2017-10-27	1.0.4	4.1 and up
4008	Ratings by Consumer Reports	FINANCE	4.1	13868	1.4M	1000000	0	Everyone	{Finance}	2017-08-03	1.1.16	2.1 and up
4009	Stranger Chat & Date	FINANCE	4.6	13819	3.9M	1000000	0	Everyone	{Finance}	2018-07-04	3.3	4.0 and up
4010	Digital Falak	HEALTH_AND_FITNESS	4.2	13799	Varies with device	500000	0	Teen	{"Health & Fitness"}	2018-07-31	Varies with device	Varies with device
4011	Lark - 24/7 Health Coach	ART_AND_DESIGN	4.4	13791	33M	1000000	0	Everyone	{"Art & Design"}	2017-09-20	2.9.2	3.0 and up
4012	Dr. Panda & Toto’s Treehouse	EDUCATION	4.5	13791	Varies with device	500000	0	Everyone	{Education}	2018-06-06	Varies with device	Varies with device
4013	easyFocus	GAME	4.3	13788	55M	1000000	0	Everyone	{Arcade}	2017-04-01	1.1	4.4 and up
4014	Du Chinese – Mandarin Lessons	SOCIAL	4.4	13762	3.9M	1000000	0	Everyone	{Social}	2018-05-09	1.0.2	4.1 and up
4015	Golfshot Plus: Golf GPS	COMMUNICATION	3.7	13761	Varies with device	10000000	0	Everyone	{Communication}	2018-06-27	Varies with device	Varies with device
4016	BL 女性向け恋愛ゲーム◆俺プリクロス	FAMILY	4.2	13752	21M	100000	9.99	Mature 17+	{Strategy}	2017-10-24	1.7.0	4.0 and up
4017	Makeup Editor -Beauty Photo Editor & Selfie Camera	FAMILY	4.1	13731	55M	1000000	0	Everyone	{Entertainment,"Action & Adventure"}	2018-06-22	1.2.1	4.0 and up
4018	Hausa Radio	HEALTH_AND_FITNESS	4.3	13724	Varies with device	1000000	0	Everyone	{"Health & Fitness"}	2017-08-17	Varies with device	Varies with device
4019	Sin City Hero : Crime Simulator of Vegas	GAME	4.4	13714	41M	1000000	0	Everyone 10+	{Action}	2017-04-15	1.0.4	4.0.3 and up
4020	Unicorn Photo	COMMUNICATION	3.9	13698	5.1M	10000000	0	Everyone	{Communication}	2018-07-02	3.2.0.100171	4.1 and up
4021	Safe Notes - Secure Ad-free notepad	NEWS_AND_MAGAZINES	4.7	13620	9.0M	500000	0	Everyone	{"News & Magazines"}	2018-04-16	2.137	4.1 and up
4022	DRAGON QUEST VI	EDUCATION	4.6	13612	48M	100000	0	Everyone	{Education}	2018-05-10	7.2.3633	4.4 and up
4023	Silence Premium Do Not Disturb	GAME	4.3	13604	96M	1000000	0.99	Teen	{Action}	2018-06-26	2.4.4	2.3 and up
4024	Rabbithole	LIFESTYLE	4.4	13565	3.3M	1000000	0	Everyone	{Lifestyle}	2018-08-05	2.5	4.0 and up
4025	7 Day Food Journal Challenge	FAMILY	4.2	13519	51M	1000000	0	Everyone	{Entertainment,"Music & Video"}	2018-07-27	2.18	5.0 and up
4026	Baby Panda Musical Genius	PRODUCTIVITY	4.2	13500	Varies with device	10000000	0	Everyone	{Productivity}	2017-12-11	Varies with device	Varies with device
4027	My AEK - Official ΑΕΚ FC app	FAMILY	4.6	13492	56M	100000	0	Teen	{"Role Playing"}	2018-07-09	1.1.4g	4.1 and up
4028	Real Car Dr Parking Master: Parking Games 2018	COMMUNICATION	4	13469	5.1M	1000000	0	Everyone	{Communication}	2018-06-05	4.7.0.2200000	4.0 and up
4029	Ez Mirror Match	PERSONALIZATION	4.5	13466	3.4M	500000	0	Everyone	{Personalization}	2018-06-19	1.9	5.0 and up
4030	CM Apps	DATING	4	13440	49M	500000	0	Mature 17+	{Dating}	2018-08-03	3.10.5	4.0.3 and up
4031	Bloomberg Professional	WEATHER	4.5	13426	19M	1000000	0	Everyone	{Weather}	2018-07-17	9.9.1.1910	4.1 and up
4032	Toca Builders	GAME	3.8	13388	7.1M	500000	0	Everyone	{Arcade}	2015-08-24	2.0.5	2.2 and up
4127	Self-help Anxiety Management	FAMILY	4.6	11872	62M	100000	0	Teen	{"Role Playing"}	2018-07-17	1.2.0	4.3 and up
4033	Learn To Draw Glow Princess	AUTO_AND_VEHICLES	4.6	13372	Varies with device	1000000	0	Everyone	{"Auto & Vehicles"}	2018-08-03	Varies with device	Varies with device
4034	DB for Fallout Shelter	FAMILY	4.3	13330	73M	1000000	0	Everyone	{Puzzle,"Brain Games"}	2018-05-24	2	4.1 and up
4035	BF Combat: Genesis	GAME	4.1	13304	1.3M	1000000	0	Everyone	{Arcade}	2016-11-30	1.2.21	4.0 and up
4036	Debonairs Pizza	TRAVEL_AND_LOCAL	3.9	13275	71M	1000000	0	Everyone	{"Travel & Local"}	2018-07-03	8.60.0.2586	4.0 and up
4037	Cardio Journal — Blood Pressure Log	PHOTOGRAPHY	4.3	13258	Varies with device	1000000	0	Everyone	{Photography}	2018-06-20	2.3.0 build 180	5.0 and up
4038	WSVN - 7 News Miami	FAMILY	3.9	13253	12M	1000000	0	Everyone	{Puzzle}	2016-08-09	2.1.080	2.3 and up
4039	Parallel U - App Cloner, Duals APP, tarallel	SHOPPING	4	13232	27M	500000	0	Everyone	{Shopping}	2018-07-21	7.5.1	4.1 and up
4040	LA Times: Your California News	SOCIAL	3.6	13223	2.8M	10000000	0	Mature 17+	{Social}	2016-06-08	8.00.752746	4.4 and up
4041	DIY Garden Ideas	NEWS_AND_MAGAZINES	3.9	13217	8.8M	1000000	0	Teen	{"News & Magazines"}	2018-08-03	1.8.7.0	5.0 and up
4042	Associated Credit Union Mobile	LIFESTYLE	4.4	13213	22M	1000000	0	Everyone	{Lifestyle}	2018-03-28	5.800.04	4.0.3 and up
4043	BTS V LINE Launcher theme	VIDEO_PLAYERS	3.5	13205	44M	1000000	0	Teen	{"Video Players & Editors"}	2018-07-31	6.2.2.17136	3.0 and up
4044	ColorSnap® Visualizer	DATING	3.5	13204	6.1M	1000000	0	Mature 17+	{Dating}	2018-07-07	2.4.1	4.1 and up
4045	Smart-AC Universal Remote Free	DATING	3.5	13202	6.1M	1000000	0	Mature 17+	{Dating}	2018-07-07	2.4.1	4.1 and up
4046	Draw with FP sDraw	NEWS_AND_MAGAZINES	4.3	13169	25M	1000000	0	Everyone 10+	{"News & Magazines"}	2018-06-06	3.4.4	4.1 and up
4047	A/C Universal Remote Control	NEWS_AND_MAGAZINES	4.3	13166	25M	1000000	0	Everyone 10+	{"News & Magazines"}	2018-06-06	3.4.4	4.1 and up
4048	ER Injection Simulator: Blood Test Doctor Hospital	FAMILY	4.4	13155	83M	1000000	0	Everyone	{Education,"Pretend Play"}	2016-06-16	1.3	4.0.3 and up
4049	My Ex Girlfriend Comes Back	FAMILY	4.4	13155	83M	1000000	0	Everyone	{Education,"Pretend Play"}	2016-06-16	1.3	4.0.3 and up
4050	Smokes for CS:GO	FAMILY	4.4	13155	83M	1000000	0	Everyone	{Education,"Pretend Play"}	2016-06-16	1.3	4.0.3 and up
4051	WeatherClear - Ad-free Weather, Minute forecast	GAME	4.5	13118	47M	500000	0	Teen	{Adventure}	2018-06-25	1.0.19	4.0.3 and up
4052	RC City Police Heavy Traffic Racer	COMMUNICATION	4.1	13100	2.2M	1000000	0	Everyone	{Communication}	2018-03-20	1.4.1.0	4.0.3 and up
4053	We learn children’s verses in kindergarten	SPORTS	4.6	13098	Varies with device	1000000	0	Everyone	{Sports}	2018-07-28	Varies with device	Varies with device
4054	Gunship Modern Combat 3D	TOOLS	4.2	13096	9.2M	500000	0	Everyone	{Tools}	2018-07-30	17.4.0014017	5.0 and up
4055	Teacher’s Gradebook - Additio	SHOPPING	4	13085	2.7M	1000000	0	Teen	{Shopping}	2017-11-08	5.1	4.0.3 and up
4056	Little Panda Run	SHOPPING	4	13085	2.7M	1000000	0	Teen	{Shopping}	2017-11-08	5.1	4.0.3 and up
4057	Chess for Kids - Play & Learn	SHOPPING	4	13085	2.7M	1000000	0	Teen	{Shopping}	2017-11-08	5.1	4.0.3 and up
4058	Hisnul Al Muslim - Hisn Invocations & Adhkaar	GAME	4.4	13079	30M	500000	0	Everyone 10+	{Adventure}	2018-04-20	1.6.2	4.0 and up
4059	DS cam	TOOLS	4.3	13064	4.6M	1000000	0	Everyone	{Tools}	2018-05-23	4.72	7.0 and up
4060	Events High - Meet Your City!	DATING	4.6	13049	13M	500000	0	Mature 17+	{Dating}	2018-07-31	4.17.2	4.1 and up
4061	ZOOKEEPER DX TouchEdition	DATING	4.6	13046	13M	500000	0	Mature 17+	{Dating}	2018-07-31	4.17.2	4.1 and up
4062	My EZ-Link Mobile	TOOLS	4.2	13005	9.7M	1000000	0	Everyone	{Tools}	2018-01-21	no_update_signal.2_9_1_arm-x86_64-alpha	4.2 and up
4063	Vegetable Fun	GAME	4.2	13004	46M	100000	6.99	Teen	{Action}	2016-12-20	1.0.11	2.3.3 and up
4064	EM Launcher for EMUI	TOOLS	3.6	12993	5.2M	1000000	0	Everyone	{Tools}	2017-01-09	1.3.0	2.3.3 and up
4065	Thai Handwriting	HEALTH_AND_FITNESS	4.5	12955	7.2M	1000000	0	Teen	{"Health & Fitness"}	2018-06-27	10.24	4.4 and up
4066	Viva Decora - Decoration, Photos, Architecture, House	FAMILY	4.7	12948	23M	1000000	0	Everyone	{Casual,"Brain Games"}	2018-05-24	2.0.3165	2.3 and up
4067	OurHome – chores, rewards, groceries and calendar	FAMILY	4.3	12919	94M	1000000	0	Everyone	{Educational,Education}	2018-06-06	1.15.2	4.4 and up
4068	TeamWard – live help for LoL	HEALTH_AND_FITNESS	4	12906	8.5M	1000000	0	Everyone	{"Health & Fitness"}	2012-10-08	1.01	2.1 and up
4069	I am Nose Doctor -Save my Nose	PHOTOGRAPHY	4.3	12865	6.9M	100000	2.99	Everyone	{Photography}	2014-11-06	4.7	2.2 and up
4070	Sweet Snap Lite - live filter, Selfie photo editor	HEALTH_AND_FITNESS	4.4	12858	55M	500000	0	Everyone	{"Health & Fitness"}	2018-07-27	18.7.1	5.0 and up
4071	Real Estate by Movoto	GAME	3.6	12846	14M	1000000	0	Teen	{Casino}	2017-12-29	3.3	4.1 and up
4072	Servidor Privado de CR y CoC - Light Royale	FAMILY	4.7	12784	15M	1000000	0	Everyone	{Entertainment}	2018-08-04	1.3.3	4.1 and up
4073	Be My Princess	FAMILY	3.6	12781	51M	1000000	0	Everyone	{Casual,"Pretend Play"}	2018-06-06	1.0.9	4.1 and up
4074	Name days	VIDEO_PLAYERS	3.6	12764	25M	1000000	0	Teen	{"Video Players & Editors"}	2018-07-11	7.1	4.0 and up
4075	Accounting App - Zoho Books	FAMILY	4.4	12753	51M	5000000	0	Everyone	{Educational,Creativity}	2018-07-17	1.49	4.0.3 and up
4076	Eddsworld Amino	GAME	4.4	12736	56M	1000000	0	Teen	{Arcade}	2017-12-18	1.02	4.0 and up
4077	SYFY	EDUCATION	4.1	12733	Varies with device	1000000	0	Everyone	{Education}	2018-05-20	Varies with device	Varies with device
4078	System Update Free	PHOTOGRAPHY	4.2	12726	15M	1000000	0	Everyone	{Photography}	2018-07-21	4.9.18	4.1 and up
4079	Funny videos for whatsapp	TOOLS	4.5	12718	Varies with device	1000000	0	Everyone	{Tools}	2018-03-05	Varies with device	Varies with device
4080	Crazy Colors: Bubbles Matching	HEALTH_AND_FITNESS	4.8	12705	15M	1000000	0	Everyone	{"Health & Fitness"}	2018-07-10	1.0.2	4.0 and up
4081	Calorie Counter - Macros	TOOLS	4.8	12700	10M	100000	3.49	Everyone	{Tools}	2018-08-03	3.2.5	5.0 and up
4082	CompTIA Exam Training	GAME	4.4	12683	19M	1000000	0	Everyone	{Action}	2018-02-05	1.1	2.3 and up
4083	VitusVet: Pet Health Care App	COMMUNICATION	3.8	12667	34M	1000000	0	Everyone	{Communication}	2018-08-01	4.5.5.1-2090AL-REL	4.3 and up
4084	Learn Bulgarian Free	LIBRARIES_AND_DEMO	3.7	12657	Varies with device	1000000	0	Everyone	{"Libraries & Demo"}	2015-09-21	3	Varies with device
4085	Ghost Hunting camera	FAMILY	4.4	12639	96M	500000	0	Teen	{Entertainment}	2017-10-17	3.5	4.1 and up
4086	MB Notifications for FB (Free)	DATING	4.4	12633	29M	1000000	0	Mature 17+	{Dating}	2018-07-27	3.5.0.1	4.1 and up
4087	AT&T Messages for Tablet	DATING	4.4	12632	29M	1000000	0	Mature 17+	{Dating}	2018-07-27	3.5.0.1	4.1 and up
4088	AC remote control mobile	DATING	4.4	12632	29M	1000000	0	Mature 17+	{Dating}	2018-07-27	3.5.0.1	4.1 and up
4089	B-Dubs®	COMMUNICATION	4.1	12578	2.3M	500000	0	Everyone	{Communication}	2017-07-10	4.5.1	4.0 and up
4090	How Do I Look	MAPS_AND_NAVIGATION	4.2	12572	24M	1000000	0	Everyone	{"Maps & Navigation"}	2018-02-19	5.4 (30)	4.0 and up
4091	Triceratops - Dino Robot	PHOTOGRAPHY	4.5	12572	8.5M	1000000	0	Everyone	{Photography}	2018-03-14	1.31	4.0 and up
4092	Official Matsumoto Kiyoshi application	TRAVEL_AND_LOCAL	4.1	12564	Varies with device	1000000	0	Everyone	{"Travel & Local"}	2018-07-05	Varies with device	Varies with device
4093	Official QR Code® Reader "Q"	SOCIAL	4.1	12495	19M	1000000	0	Mature 17+	{Social}	2017-08-19	7.1.1	2.3 and up
4094	WICShopper	LIFESTYLE	4.1	12452	Varies with device	500000	0	Everyone	{Lifestyle}	2017-01-26	Varies with device	Varies with device
4095	NBC Sports Gold	LIFESTYLE	4.1	12452	Varies with device	500000	0	Everyone	{Lifestyle}	2017-01-26	Varies with device	Varies with device
4096	The Visitor: Ep.1 - Kitty Cat Carnage	VIDEO_PLAYERS	3.8	12443	Varies with device	1000000	0	Everyone	{"Video Players & Editors"}	2018-08-06	Varies with device	Varies with device
4097	Best New Ringtones 2018 Free 🔥 For Android™	PRODUCTIVITY	4.1	12435	31M	10000000	0	Everyone	{Productivity}	2017-09-26	Varies with device	6.0 and up
4098	MyRadar NOAA Weather Radar Ad Free	FAMILY	3.8	12414	13M	1000000	0	Everyone	{Entertainment}	2017-08-04	1.0.0	4.1 and up
4099	Best DP and Status (Daily Updates Photos)	FAMILY	4.8	12400	Varies with device	100000	4.99	Everyone	{Puzzle}	2018-06-14	1.0.4	4.1 and up
4100	LG BT Reader Plus	ENTERTAINMENT	4.2	12398	Varies with device	1000000	0	Teen	{Entertainment}	2018-07-02	Varies with device	Varies with device
4101	Field Goal Tournament	ENTERTAINMENT	4.2	12398	Varies with device	1000000	0	Teen	{Entertainment}	2018-07-02	Varies with device	Varies with device
4102	tTorrent - ad free	TOOLS	3.9	12388	5.3M	1000000	0	Everyone	{Tools}	2016-04-01	1.17	2.3 and up
4103	AJ Jump: Animal Jam Kangaroos!	BOOKS_AND_REFERENCE	4.5	12322	27M	500000	0	Everyone	{"Books & Reference"}	2016-12-17	3	2.3 and up
4104	Calculator L	PRODUCTIVITY	4.3	12321	713k	1000000	0	Everyone	{Productivity}	2016-12-25	2.0.1	2.3 and up
4105	DS Barometer - Altimeter and Weather Information	FINANCE	4.8	12304	21M	100000	0	Everyone	{Finance}	2018-08-02	6.0.16	5.0 and up
4106	ARY NEWS	FAMILY	4.5	12293	4.0M	1000000	0	Everyone	{Entertainment}	2018-05-06	1.2.6	4.0.3 and up
4107	Lunar Calendar Lite	GAME	3.6	12257	49M	1000000	0	Everyone	{Racing}	2016-09-09	1.4	2.3 and up
4108	Endless Numbers	ENTERTAINMENT	4.5	12216	13M	1000000	0	Teen	{Entertainment}	2018-07-24	2.9.4	4.1 and up
4109	EMT-B Pocket Prep	TOOLS	4.4	12215	9.1M	5000000	0	Everyone	{Tools}	2018-08-01	1.7.4	7.0 and up
4110	Fantasy Football & NFL News	PHOTOGRAPHY	3.5	12204	6.8M	1000000	0	Everyone	{Photography}	2017-03-14	1.5.2.21	2.3.3 and up
4111	Elevator Simulator Lift EM ALL	FINANCE	4.3	12185	Varies with device	1000000	0	Everyone	{Finance}	2018-06-08	Varies with device	Varies with device
4112	Antillean Gold Telegram (original version)	PERSONALIZATION	4.1	12180	5.4M	1000000	0	Everyone	{Personalization}	2016-12-24	1.3	2.1 and up
4113	Crazy ER Open Heart Surgery Simulator	TOOLS	4.2	12147	118k	1000000	0	Everyone	{Tools}	2015-01-25	1.18	4.0.3 and up
4114	Denis Brogniart - AH !	FAMILY	4.8	12137	63M	100000	0	Everyone 10+	{Simulation,"Pretend Play"}	2018-08-06	149	4.1 and up
4115	Elemental Knights R Platinum	TOOLS	4.2	12121	79k	1000000	0	Everyone	{Tools}	2018-08-01	1.12	2.3.3 and up
4116	Mix Virtual DJ 2018	SOCIAL	4.6	12111	9.1M	500000	0	Everyone	{Social}	2018-05-03	1.47	4.3 and up
4117	Human Anatomy Atlas 2018: Complete 3D Human Body	PERSONALIZATION	4.7	12089	27M	500000	0	Everyone	{Personalization}	2018-07-03	1.2.5	4.0 and up
4118	Forgotten Hill: Puppeteer	COMICS	4.1	12088	21M	1000000	0	Mature 17+	{Comics}	2018-07-06	2.3.1	4.0.3 and up
4119	TANGEDCO Mobile App (Official)	FINANCE	4	12073	42M	1000000	0	Everyone	{Finance}	2018-05-25	3.3	4.2 and up
4120	Vintage Flower CM Locker Theme	FAMILY	4.6	12034	34M	1000000	0	Everyone	{Entertainment}	2018-05-26	4.8	4.1 and up
4121	CritDice - Dice Roller	HEALTH_AND_FITNESS	4.4	12029	4.3M	1000000	0	Everyone	{"Health & Fitness"}	2018-08-04	2.6	4.2 and up
4122	Sentin Information Map	PERSONALIZATION	4.1	12008	6.1M	1000000	0	Everyone	{Personalization}	2016-05-27	5	4.0 and up
4123	eBiblio	FAMILY	4.3	11950	19M	5000000	0	Everyone	{Educational,Education}	2018-07-12	6.1	4.0.3 and up
4124	Dominos Game ✔️	FINANCE	4.2	11919	23M	1000000	0	Everyone	{Finance}	2018-07-27	1.13.2.11	4.4 and up
4125	Daily Ab Workout	NEWS_AND_MAGAZINES	4	11908	5.5M	1000000	0	Everyone	{"News & Magazines"}	2018-07-01	8.3	4.1 and up
4126	ACE Elite	EDUCATION	4.3	11904	1.8M	1000000	0	Everyone	{Education}	2015-08-22	2	2.3 and up
4128	C4droid - C/C++ compiler & IDE	MAPS_AND_NAVIGATION	4.2	11838	9.2M	1000000	0	Everyone	{"Maps & Navigation"}	2018-04-09	1.7.3	4.0.3 and up
4129	Ruler(cm, inch)	DATING	3.6	11806	12M	1000000	0	Mature 17+	{Dating}	2018-06-26	4.0.18	4.0.3 and up
4130	Relax with Andrew Johnson Lite	SHOPPING	4.1	11798	Varies with device	1000000	0	Everyone	{Shopping}	2018-05-10	Varies with device	Varies with device
4131	Six Packs for Man–Body Building with No Equipment	SHOPPING	4.1	11798	Varies with device	1000000	0	Everyone	{Shopping}	2018-05-10	Varies with device	Varies with device
4132	Sabbath School 4	SHOPPING	4.1	11798	Varies with device	1000000	0	Everyone	{Shopping}	2018-05-10	Varies with device	Varies with device
4133	Clock L	FAMILY	4.1	11788	62M	1000000	0	Everyone	{Educational,"Pretend Play"}	2017-08-10	1.01	4.0 and up
4134	Shoot Em Down Free	FAMILY	2.4	11773	3.3M	1000000	0	Everyone	{Entertainment}	2018-06-13	18.6.2	4.1 and up
4135	Next Launcher 3D Theme Stun-BW	PARENTING	4.3	11760	Varies with device	1000000	0	Everyone	{Parenting}	2018-06-22	Varies with device	Varies with device
4136	Freeme Launcher—Stylish Theme	FAMILY	3.7	11748	36M	1000000	0	Teen	{Casual}	2016-10-31	1.3	4.0.3 and up
4137	eCooltra: scooter sharing. Share electric scooters	FAMILY	4.5	11716	48M	1000000	0	Everyone	{Casual,"Brain Games"}	2018-08-03	8.4.3180	4.0 and up
4138	AW - Le News di AndroidWorld	FOOD_AND_DRINK	4.6	11707	Varies with device	100000	0	Everyone	{"Food & Drink"}	2018-06-24	Varies with device	Varies with device
4139	Dz Dinars Numbers to letters	HEALTH_AND_FITNESS	4.7	11689	20M	500000	0	Everyone	{"Health & Fitness"}	2018-07-27	1.29.15	4.4 and up
4140	Be My Princess 2	HEALTH_AND_FITNESS	4.7	11689	20M	500000	0	Everyone	{"Health & Fitness"}	2018-07-27	1.29.15	4.4 and up
4141	M Notifier for M Launcher	PHOTOGRAPHY	4.6	11677	19M	1000000	0	Everyone	{Photography}	2018-07-05	1.0.3	4.4 and up
4142	Skylink Live TV CZ	ENTERTAINMENT	4.7	11661	4.0M	1000000	0	Everyone	{Entertainment}	2018-07-14	1.1.3.2	4.0.3 and up
4143	Superhero Doctor 3 ER Surgery	ENTERTAINMENT	4	11656	4.5M	1000000	0	Everyone	{Entertainment}	2018-01-20	1.02	4.0.3 and up
4144	BT Notifier	DATING	4.1	11633	23M	500000	0	Mature 17+	{Dating}	2018-07-24	2.5.1	4.1 and up
4145	V for Vampire - Free	DATING	4.1	11633	23M	500000	0	Mature 17+	{Dating}	2018-07-24	2.5.1	4.1 and up
4146	Good room network fast rent	BUSINESS	4.1	11622	Varies with device	5000000	0	Everyone	{Business}	2018-07-26	Varies with device	Varies with device
4147	C Programming - Learn Code, Theory & Discuss	FAMILY	4.3	11618	39M	5000000	0	Everyone	{Educational,Education}	2018-04-03	2.4	4.1 and up
4148	VZ Navigator for Galaxy S4	SPORTS	4.6	11549	Varies with device	100000	0	Everyone	{Sports}	2018-07-07	Varies with device	Varies with device
4149	Naidunia: MP News & CG News	VIDEO_PLAYERS	3.7	11549	Varies with device	1000000	0	Teen	{"Video Players & Editors"}	2018-07-13	Varies with device	Varies with device
4150	eBoox new: Reader for fb2 epub zip books	PRODUCTIVITY	4	11535	6.8M	1000000	0	Everyone	{Productivity}	2017-12-07	1.42	4.0 and up
4151	Companion for Fortnite & Fortnite Battle Royale	TRAVEL_AND_LOCAL	4.4	11514	2.2M	500000	0	Everyone	{"Travel & Local"}	2018-03-29	5.5	4.0 and up
4152	A-Z App Store	WEATHER	4.2	11510	3.5M	1000000	0	Everyone	{Weather}	2014-08-28	1.4	2.2 and up
4153	Best Western To Go	HEALTH_AND_FITNESS	4.4	11506	15M	100000	0	Everyone	{"Health & Fitness"}	2018-08-02	3.0.0	4.1 and up
4154	One Night at Golden Freddy’s	HEALTH_AND_FITNESS	4.4	11506	15M	100000	0	Everyone	{"Health & Fitness"}	2018-08-02	3.0.0	4.1 and up
4155	Amazon FreeTime – Kids’ Videos, Books, & TV shows	PARENTING	4.4	11501	11M	1000000	0	Everyone	{Parenting}	2018-07-30	3.7.1	4.0.3 and up
4156	Nuke Em All	FAMILY	4.6	11480	93M	100000	0	Everyone	{Simulation}	2018-05-25	1.0.4	4.4 and up
4157	Basket Manager 2017 Free	SPORTS	3.9	11460	Varies with device	100000	8.99	Everyone	{Sports}	2018-06-27	Varies with device	4.1 and up
4158	All Maths Formulas	TOOLS	4.3	11449	1.7M	500000	0	Everyone	{Tools}	2016-02-02	2.0.4	2.0 and up
4159	Easy Recipes	BUSINESS	4.7	11442	6.8M	100000	4.99	Everyone	{Business}	2018-03-25	1.5.2	4.0 and up
4160	Dr. Dominoes	BUSINESS	4.7	11442	6.8M	100000	4.99	Everyone	{Business}	2018-03-25	1.5.2	4.0 and up
4161	Money Manager Ex for Android	FAMILY	4.4	11442	66M	1000000	0	Everyone	{Educational,Creativity}	2016-06-30	1.4	2.3 and up
4162	5 Nights at Cube Pizzeria City	FAMILY	4.5	11436	15M	1000000	0	Everyone	{Casual,"Brain Games"}	2018-04-17	2.2.3169	4.0.3 and up
4163	G Guide Program Guide (SOFTBANK EMOBILE WILLCOM version)	GAME	4.2	11408	96M	1000000	0	Teen	{Action}	2018-07-06	4.1	4.0 and up
4164	Cerulean Heart	FAMILY	4.2	11404	30M	100000	0	Everyone	{Strategy}	2017-09-11	1.0.14	4.0.3 and up
4165	Beast of Lycan Isle CE	PRODUCTIVITY	4.3	11402	5.3M	1000000	0	Everyone	{Productivity}	2017-11-07	1.3.0	5.0 and up
4166	Pregnancy Tracker	TOOLS	4.4	11393	8.7M	1000000	0	Everyone	{Tools}	2018-07-27	3.9	4.4 and up
4167	Cestovné poriadky CP	GAME	4.3	11379	20M	500000	0	Everyone 10+	{Arcade}	2018-07-29	1.4	4.0.3 and up
4168	Inquiry Fines and Debits of Vehicles	PERSONALIZATION	4	11343	8.4M	1000000	0	Everyone	{Personalization}	2018-05-22	18	4.1 and up
4169	House app: beautiful everyday ~	BUSINESS	4.4	11310	Varies with device	1000000	0	Everyone	{Business}	2018-07-19	Varies with device	Varies with device
4170	Anthem Anywhere	WEATHER	3.5	11297	Varies with device	1000000	0	Everyone	{Weather}	2018-06-26	Varies with device	Varies with device
4171	Quran Juz-30 - Mahad al Zahra	FINANCE	4.2	11264	24M	1000000	0	Everyone	{Finance}	2018-06-26	5.2.203	4.2 and up
4172	Bird - Enjoy The Ride	FAMILY	4.2	11263	35M	1000000	0	Everyone	{Entertainment,"Music & Video"}	2018-05-03	2.1.0.2173	4.0.3 and up
4173	Trailer Addict Movie Trailers	GAME	4.1	11258	44M	500000	0	Mature 17+	{Action}	2016-12-08	1.25	4.2 and up
4174	Device Info Ex Live Wallpaper	FAMILY	3.8	11250	6.3M	100000	9.99	Everyone 10+	{"Role Playing"}	2018-06-12	2.0.4	4.2 and up
4175	Marcus Theatres	PERSONALIZATION	4.2	11244	2.2M	1000000	0	Everyone	{Personalization}	2018-06-12	1.1.1	4.1 and up
4176	Girls Nancy Ajram Without Net	GAME	4.6	11235	Varies with device	100000	2.99	Everyone	{Card}	2018-07-30	Varies with device	Varies with device
4177	Deck Analyzer for CR	HOUSE_AND_HOME	4.4	11200	25M	1000000	0	Everyone	{"House & Home"}	2018-07-16	4.5.15	5.0 and up
4178	Nights at Slender Pizzeria 3D	PRODUCTIVITY	3.2	11200	11M	5000000	0	Everyone	{Productivity}	2018-07-23	3.1.1	4.4 and up
4179	Yaoi Ooku: Distorted Love	TOOLS	3.6	11187	7.3M	1000000	0	Everyone	{Tools}	2017-03-17	V1.7.6	4.0 and up
4180	Pharmacie de Garde CI et Prix	TRAVEL_AND_LOCAL	4.3	11182	62M	1000000	0	Everyone	{"Travel & Local"}	2018-07-30	11.26	4.1 and up
4181	DS finder	FAMILY	4.1	11179	19M	1000000	0	Teen	{"Role Playing"}	2016-09-16	2.7	2.3 and up
4182	Fox Business	SPORTS	4	11151	52M	1000000	0	Everyone	{Sports}	2018-06-27	2018.6	5.0 and up
4183	Single Parent Meet #1 Dating	SPORTS	4	11151	52M	1000000	0	Everyone	{Sports}	2018-06-27	2018.6	5.0 and up
4184	Family Dollar	FAMILY	4.2	11126	91M	1000000	0	Everyone	{Educational,"Pretend Play"}	2018-03-23	1.6.4	4.1 and up
4185	F-Secure KEY Password manager	WEATHER	4.7	11118	9.7M	1000000	0	Everyone	{Weather}	2018-04-26	30	4.0 and up
4186	AE 3D Moto 3	MAPS_AND_NAVIGATION	4.3	11100	15M	500000	0	Everyone	{"Maps & Navigation"}	2018-04-28	2.10.0 Summer	4.0.3 and up
4187	One Today by Google	LIBRARIES_AND_DEMO	4.2	11087	34M	1000000	0	Everyone	{"Libraries & Demo"}	2017-03-16	4.1.4	5.0 and up
4188	MOMOLAND BBoom BBoom	SPORTS	4	11085	61M	1000000	0	Everyone	{Sports}	2018-06-21	8.9.3	4.0.3 and up
4189	Dentist Surgery ER Emergency Doctor Hospital Games	FINANCE	4.6	11066	9.1M	500000	0	Everyone	{Finance}	2018-07-18	1.1.39	4.0 and up
4190	DRAGON QUEST II	SOCIAL	4.3	11066	10M	1000000	0	Everyone	{Social}	2018-03-13	1.4	4.4 and up
4191	AO Surgery Reference	GAME	4.3	11051	44M	1000000	0	Teen	{Casino}	2018-06-25	1.9.58	4.0.3 and up
4192	SleepCloud Backup for Sleep as Android	GAME	4.4	11023	16M	100000	3.99	Teen	{Adventure}	2018-01-26	1.0.20	2.3 and up
4193	Hily: Dating, Chat, Match, Meet & Hook up	TOOLS	4.7	11018	25M	500000	0	Everyone	{Tools}	2018-07-25	1.7.0	4.1 and up
4194	REV Robotic Enhance Vehicles	FAMILY	4.2	11002	21M	1000000	0	Everyone	{Education,"Action & Adventure"}	2017-05-11	1	4.0.3 and up
4195	LEGO Batman: DC Super Heroes	COMMUNICATION	4.2	10965	2.3M	500000	0	Everyone	{Communication}	2015-02-02	2	3.0 and up
4196	VisualCV Resume Builder	LIFESTYLE	4.2	10944	36M	1000000	0	Everyone	{Lifestyle}	2018-06-15	2	4.1 and up
4197	CP Surprise	ENTERTAINMENT	3.5	10939	4.6M	10000000	0	Everyone	{Entertainment}	2016-04-28	2.05.0010	5.0 and up
4198	English Communication - Learn English for Chinese (Learn English for Chinese)	EDUCATION	4.5	10852	18M	1000000	0	Everyone	{Education}	2017-11-28	10	4.1 and up
4199	Breaking News, Local news, Attacks and Alerts Free	GAME	4.3	10806	49M	5000000	0	Everyone	{Racing}	2017-05-09	1.5.1	4.0 and up
4200	homegate.ch	PERSONALIZATION	3.7	10796	6.8M	1000000	0	Everyone	{Personalization}	2018-07-06	6.7.5	4.0.3 and up
4201	NOOK Audiobooks	GAME	4.6	10795	69M	100000	5.99	Everyone	{Simulation}	2017-12-21	1.2.1.1712080	4.0.3 and up
4202	N Launcher Pro - Nougat 7.0	GAME	4.4	10786	21M	1000000	0	Everyone	{Arcade}	2017-01-14	1.02	4.0.3 and up
4203	Time Planner - Schedule, To-Do List, Time Tracker	PERSONALIZATION	4.7	10786	9.4M	500000	0	Mature 17+	{Personalization}	2018-05-20	2.3.1	4.3 and up
4204	Adivina el Emoji	TOOLS	4.1	10786	4.3M	1000000	0	Everyone	{Tools}	2017-12-09	5	4.0 and up
4205	Dance Magic Fashion Style Games	FAMILY	4.3	10776	21M	1000000	0	Everyone	{Arcade,"Action & Adventure"}	2017-10-26	3.4	4.1 and up
4206	Finger Scanner Gestures	BOOKS_AND_REFERENCE	4	10774	35M	100000	0	Everyone	{"Books & Reference"}	2018-06-28	3.8.10	4.1 and up
4207	Zagat	FAMILY	4	10773	10M	1000000	0	Everyone	{Education}	2017-11-29	8.02	4.1 and up
4208	BQ Camera	FAMILY	4.1	10758	8.0M	100000	4.99	Everyone 10+	{Adventure,"Action & Adventure"}	2015-12-15	Varies with device	4.0.3 and up
4209	Ultimate Quiz for CS:GO - Skins | Cases | Players	FAMILY	3.9	10753	84M	1000000	0	Everyone	{Educational,Education}	2018-07-23	2.5.6	4.1 and up
4210	Homework Planner	GAME	4.5	10748	47M	1000000	0	Everyone	{Arcade}	2018-08-04	4	4.1 and up
4211	YAY - TBH	SOCIAL	4	10743	Varies with device	500000	0	Teen	{Social}	2017-12-28	7.0.4.17908	4.1 and up
4212	OurTime Dating for Singles 50+	FOOD_AND_DRINK	3.5	10741	41M	1000000	0	Everyone	{"Food & Drink"}	2018-07-23	5.2.2	4.2 and up
4213	Heart Surgery Doctor - ER Emergency Game	MEDICAL	4.2	10710	8.5M	100000	0	Everyone	{Medical}	2018-07-03	2.15	5.0 and up
4214	Women"s Health Tips(Breast,Face,Body,weight lose)	FINANCE	3.6	10697	46M	1000000	0	Everyone	{Finance}	2018-07-18	3.22.1	4.1 and up
4215	Web Browser ( Fast & Secure Web Explorer)	PRODUCTIVITY	4.1	10676	12M	1000000	0	Everyone	{Productivity}	2018-05-23	4.11.0	4.1 and up
4216	Chatting - Free chat, random chat, boyfriend, girlfriend	PRODUCTIVITY	4.7	10672	6.9M	100000	0	Everyone	{Productivity}	2018-06-23	2.1.1	4.1 and up
4217	Mike V: Skateboard Party PRO	FINANCE	3.9	10658	58M	1000000	0	Everyone	{Finance}	2018-08-02	6.8.2	4.4 and up
4218	Funny Jokes	FINANCE	3.9	10657	58M	1000000	0	Everyone	{Finance}	2018-08-02	6.8.2	4.4 and up
4219	At home - rental · real estate · room finding application such as apartment · apartment	PRODUCTIVITY	4	10643	Varies with device	5000000	0	Everyone	{Productivity}	2018-05-19	Varies with device	Varies with device
4220	10 Best Foods for You	EDUCATION	4.6	10611	11M	500000	0	Everyone	{Education}	2018-05-27	2.3.7	4.0 and up
4221	Speed Boat Racing	BUSINESS	4.3	10600	6.5M	1000000	0	Everyone	{Business}	2018-08-01	2.5.6	4.0 and up
4222	U + professional baseball	TOOLS	4.1	10595	Varies with device	1000000	0	Everyone	{Tools}	2018-03-18	Varies with device	Varies with device
4223	Camera V7 24 Megapixel	MAPS_AND_NAVIGATION	3.7	10562	60M	1000000	0	Everyone	{"Maps & Navigation"}	2018-08-03	04.08.00	4.4 and up
4224	Frigo Magic: Easy recipe idea and anti-waste	LIFESTYLE	4.5	10544	44M	1000000	0	Everyone	{Lifestyle}	2018-06-18	5.3	4.1 and up
4225	Kids Mode	GAME	4.3	10538	50M	1000000	0	Mature 17+	{Action}	2018-08-01	1.0.8	2.3 and up
4226	Eat Fit - Diet and Health Free	PHOTOGRAPHY	4.4	10525	25M	1000000	0	Everyone	{Photography}	2018-07-27	8.9.9	4.0 and up
4227	Quiz TRUE or FALSE	GAME	4.3	10493	50M	1000000	0	Mature 17+	{Action}	2018-08-01	1.0.8	2.3 and up
4228	Mental Hospital V	PRODUCTIVITY	3.7	10490	5.8M	1000000	0	Everyone	{Productivity}	2018-07-24	3.1.7	4.1 and up
4229	Helix	LIFESTYLE	4.6	10484	9.0M	1000000	0	Everyone	{Lifestyle}	2018-06-09	1.4.9	4.1 and up
4230	BURGER KING® Puerto Rico	AUTO_AND_VEHICLES	4.9	10479	33M	100000	0	Everyone	{"Auto & Vehicles"}	2018-07-18	1.7.1	4.0 and up
4231	Ace Screen Recorder w facecam	GAME	4.5	10460	18M	1000000	0	Everyone	{Arcade}	2018-07-11	2.2.3181	4.0 and up
4232	AT&T THANKS®	FAMILY	3.3	10449	29M	1000000	0	Teen	{Educational}	2016-12-02	1.7	2.3 and up
4233	Animal Planet GO	FAMILY	4	10447	36M	1000000	0	Everyone	{Simulation,"Action & Adventure"}	2016-02-18	1.0.4	2.3 and up
4234	Pixel art pro-Sand box,paint by number,number draw	FAMILY	4.3	10446	64M	500000	0	Everyone	{Casual}	2018-07-13	1.0.142	4.0.3 and up
4235	EL NORTE	HEALTH_AND_FITNESS	4.6	10445	48M	500000	0	Everyone	{"Health & Fitness"}	2018-07-02	112	4.4 and up
4236	FlirtChat - ♥Free Dating/Flirting App♥	GAME	4.5	10440	86M	50000	4.99	Teen	{Action}	2018-05-30	1.0.3	4.1 and up
4237	Au-allstar for KR	FAMILY	4.2	10440	27M	500000	0	Teen	{"Role Playing"}	2018-08-06	18.30.22	4.4 and up
4238	Free VIN Report for Used Cars	GAME	4.5	10434	18M	1000000	0	Everyone	{Arcade}	2018-07-11	2.2.3181	4.0 and up
4239	Forgotten Hill: Surgery	TOOLS	4.1	10426	7.2M	1000000	0	Everyone	{Tools}	2018-02-04	1.4	4.0 and up
4240	Bathroom Decorating Ideas	PERSONALIZATION	4.3	10401	3.3M	1000000	0	Everyone	{Personalization}	2017-10-27	7.5	4.1 and up
4241	LG AV REMOTE	GAME	4.5	10393	18M	1000000	0	Everyone	{Arcade}	2018-07-11	2.2.3181	4.0 and up
4242	Royale Tournaments	NEWS_AND_MAGAZINES	3.7	10382	Varies with device	1000000	0	Everyone	{"News & Magazines"}	2018-07-28	Varies with device	Varies with device
4243	LateRooms: Find Hotel Deals	FINANCE	4	10374	Varies with device	500000	0	Everyone	{Finance}	2016-10-24	Varies with device	Varies with device
4244	Dr. Pixel: Pill mania Classic	NEWS_AND_MAGAZINES	3.7	10369	Varies with device	1000000	0	Everyone	{"News & Magazines"}	2018-07-28	Varies with device	Varies with device
4245	NerdWallet: Personal Finance, Credit Score & Cash	FAMILY	3.8	10366	78M	1000000	0	Everyone	{Education,"Pretend Play"}	2018-07-24	1.2.1	4.1 and up
4246	EZ Switch Widget	SHOPPING	4.3	10355	847k	1000000	0	Teen	{Shopping}	2018-06-19	1.5.1	4.0 and up
4247	San Andreas: Gang Crime V	GAME	4.3	10354	50M	1000000	0	Mature 17+	{Action}	2018-08-01	1.0.8	2.3 and up
4248	A Word A Day	PHOTOGRAPHY	4.5	10349	11M	1000000	0	Everyone	{Photography}	2017-07-29	1.6.0	2.3 and up
4249	iWnn IME for Nexus	COMMUNICATION	4.4	10341	6.9M	500000	0	Everyone	{Communication}	2018-07-05	5.2.4	4.1 and up
4250	Candy simply-Fi	TRAVEL_AND_LOCAL	4.3	10323	Varies with device	1000000	0	Everyone	{"Travel & Local"}	2018-07-19	Varies with device	Varies with device
4251	All C Programs	SHOPPING	4.7	10318	32M	1000000	0	Everyone	{Shopping}	2018-06-19	2.1.8	4.4 and up
4252	Bedroom Decorating Ideas	GAME	4.3	10306	50M	1000000	0	Mature 17+	{Action}	2018-08-01	1.0.8	2.3 and up
4253	FD VR Player - for Youtube 3D	BUSINESS	4.8	10295	39M	100000	4.99	Everyone	{Business}	2017-04-11	3.4.6	3.0 and up
4254	Savory - Deals,Freebies,Sales	BUSINESS	4.8	10295	39M	100000	4.99	Everyone	{Business}	2017-04-11	3.4.6	3.0 and up
4255	Novinky.cz	ENTERTAINMENT	4.2	10291	6.5M	5000000	0	Teen	{Entertainment}	2018-08-04	3.7.3	4.0.3 and up
4256	BayPort CU Mobile Banking	PRODUCTIVITY	4	10270	8.4M	1000000	0	Everyone	{Productivity}	2018-03-23	4.4.1	4.0 and up
4257	TownWiFi | Wi-Fi Everywhere	PRODUCTIVITY	4	10270	8.4M	1000000	0	Everyone	{Productivity}	2018-03-23	4.4.1	4.0 and up
4258	Math games for kids : times tables - AB Math	GAME	4.5	10256	39M	1000000	0	Everyone	{Action}	2017-12-11	2.1.0	4.3 and up
4259	SAT Test	HEALTH_AND_FITNESS	4.5	10253	Varies with device	500000	0	Teen	{"Health & Fitness"}	2018-07-09	6.3.1	Varies with device
4260	Jungle book-The Great Escape	LIFESTYLE	4.8	10249	Varies with device	10000	2.49	Everyone	{Lifestyle}	2018-07-30	Varies with device	Varies with device
4261	CM FILE MANAGER Pro	FAMILY	4.6	10247	15M	1000000	0	Everyone	{Entertainment}	2018-07-27	1.3.13	4.1 and up
4262	Magic Tiles - TWICE Edition (K-Pop)	FOOD_AND_DRINK	4.2	10225	36M	1000000	0	Everyone	{"Food & Drink"}	2018-08-06	4.4.2	5.0 and up
4263	Doll House Design & Decoration 2: Girls House Game	MAPS_AND_NAVIGATION	4.4	10218	78M	1000000	0	Everyone	{"Maps & Navigation"}	2018-07-31	5.072.1830.2	4.2 and up
4264	New 2018 Weather App & Widget	DATING	3.9	10212	5.0M	1000000	0	Mature 17+	{Dating}	2018-07-25	1.9.7	4.4 and up
4265	AZ Camera - Manual Pro Cam	DATING	3.9	10212	5.0M	1000000	0	Mature 17+	{Dating}	2018-07-25	1.9.7	4.4 and up
4266	Аim Training for CS	LIFESTYLE	4.6	10198	2.2M	100000	0	Everyone	{Lifestyle}	2017-08-21	1.1	2.1 and up
4267	Al-Muhaffiz	FOOD_AND_DRINK	4.2	10159	36M	1000000	0	Everyone	{"Food & Drink"}	2018-07-17	4.3.3	5.0 and up
4268	dz NEWS Algerie	FAMILY	4.5	10159	6.4M	1000000	0	Everyone	{Education}	2018-04-13	2.17	4.1 and up
4269	Deportivo Toluca FC	PERSONALIZATION	4.5	10158	3.6M	500000	0	Everyone	{Personalization}	2018-03-01	1.5	4.0.3 and up
4270	Dr. Panda’s Swimming Pool	HOUSE_AND_HOME	3.9	10117	13M	1000000	0	Everyone	{"House & Home"}	2018-06-29	3.6	4.0.3 and up
4271	Dr. Sudoku	FAMILY	3.9	10114	48M	100000	0	Everyone	{Casual}	2018-06-13	1.0.63	4.0 and up
4272	Resume Builder and CV maker app	LIFESTYLE	4.5	10097	7.5M	500000	0	Everyone	{Lifestyle}	2018-04-26	1.2	4.0 and up
4273	AT&T Smart Limits℠	PERSONALIZATION	4.4	10093	5.5M	1000000	0	Everyone	{Personalization}	2016-02-26	1.0.0	4.0 and up
4274	Do I Snore or Grind	FAMILY	4.3	10088	Varies with device	1000000	0	Everyone	{Casual,"Action & Adventure"}	2018-03-08	Varies with device	4.1 and up
4275	XCOM: TBG	LIFESTYLE	4.1	10067	Varies with device	1000000	0	Everyone	{Lifestyle}	2017-12-07	Varies with device	4.3 and up
4276	sABN	HOUSE_AND_HOME	4.3	10054	9.1M	1000000	0	Everyone	{"House & Home"}	2018-07-12	6.7.12.2018	4.0.3 and up
4277	Sirens Fashion Style Game	TRAVEL_AND_LOCAL	4.6	10035	Varies with device	1000000	0	Everyone	{"Travel & Local"}	2018-05-04	Varies with device	Varies with device
4278	Filters for B Live	FAMILY	3.7	10035	30M	1000000	0	Teen	{Simulation}	2018-05-23	2.07	4.1 and up
4279	Nordstrom	LIFESTYLE	3.1	10006	53M	1000000	0	Everyone	{Lifestyle}	2018-07-26	3.2.0	5.0 and up
\.


--
-- Name: analytics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.analytics_id_seq', 9637, true);


--
-- Name: analytics analytics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.analytics
    ADD CONSTRAINT analytics_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

