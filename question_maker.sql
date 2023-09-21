--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7
-- Dumped by pg_dump version 14.7

-- Started on 2023-09-21 12:52:51

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

DROP DATABASE questionnaire_framework;
--
-- TOC entry 3336 (class 1262 OID 17751)
-- Name: questionnaire_framework; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE questionnaire_framework WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';


ALTER DATABASE questionnaire_framework OWNER TO postgres;

\connect questionnaire_framework

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
-- TOC entry 214 (class 1259 OID 18086)
-- Name: question; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.question (
    id integer NOT NULL,
    question_label character varying(30) NOT NULL,
    label character varying(128) NOT NULL,
    error_label character varying(128) NOT NULL,
    variable character varying(40) NOT NULL,
    type character varying(15) NOT NULL,
    options json,
    question_order smallint,
    questionnaire_id integer NOT NULL,
    section_id integer,
    validation_rules text,
    skip_logic json,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    custom_attributes json,
    enabled_rules text,
    disabled_rules json,
    instruction text
);


ALTER TABLE public.question OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 18085)
-- Name: question_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.question_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.question_id_seq OWNER TO postgres;

--
-- TOC entry 3337 (class 0 OID 0)
-- Dependencies: 213
-- Name: question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.question_id_seq OWNED BY public.question.id;


--
-- TOC entry 210 (class 1259 OID 17842)
-- Name: questionnaire; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.questionnaire (
    id integer NOT NULL,
    title character varying(128) NOT NULL,
    type smallint,
    version character varying(10),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.questionnaire OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 17841)
-- Name: questionnaire_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.questionnaire_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questionnaire_id_seq OWNER TO postgres;

--
-- TOC entry 3338 (class 0 OID 0)
-- Dependencies: 209
-- Name: questionnaire_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.questionnaire_id_seq OWNED BY public.questionnaire.id;


--
-- TOC entry 212 (class 1259 OID 18060)
-- Name: section; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.section (
    id integer NOT NULL,
    label character varying(128) NOT NULL,
    slug character varying(100) NOT NULL,
    questionnaire_id integer NOT NULL,
    section_order smallint,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    type smallint DEFAULT 0 NOT NULL,
    instruction text
);


ALTER TABLE public.section OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 18059)
-- Name: section_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.section_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.section_id_seq OWNER TO postgres;

--
-- TOC entry 3339 (class 0 OID 0)
-- Dependencies: 211
-- Name: section_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.section_id_seq OWNED BY public.section.id;


--
-- TOC entry 3177 (class 2604 OID 18089)
-- Name: question id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question ALTER COLUMN id SET DEFAULT nextval('public.question_id_seq'::regclass);


--
-- TOC entry 3174 (class 2604 OID 17845)
-- Name: questionnaire id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionnaire ALTER COLUMN id SET DEFAULT nextval('public.questionnaire_id_seq'::regclass);


--
-- TOC entry 3175 (class 2604 OID 18063)
-- Name: section id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.section ALTER COLUMN id SET DEFAULT nextval('public.section_id_seq'::regclass);


--
-- TOC entry 3330 (class 0 OID 18086)
-- Dependencies: 214
-- Data for Name: question; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.question (id, question_label, label, error_label, variable, type, options, question_order, questionnaire_id, section_id, validation_rules, skip_logic, "createdAt", "updatedAt", custom_attributes, enabled_rules, disabled_rules, instruction) VALUES (3, '২.১', 'আপনি পুরুষ না মহিলা?', 'Gender', 'gender', 'radio', '"[{\"value\":\"1\",\"label\":\"1 পুরুষ\"},{\"value\":\"2\",\"label\":\"2 মহিলা\"},{\"value\":\"3\",\"label\":\"3 তৃতীয় লিঙ্গ - পুরুষ\"},{\"value\":\"4\",\"label\":\"4 তৃতীয় লিঙ্গ - মহিলা\"}]"', 3, 2, 2, 'object().shape({
  value: string().required(),
  label: string().required(''[this] is required!'')
})', NULL, '2023-09-11 12:10:29.843+06', '2023-09-18 15:58:01.429+06', NULL, NULL, NULL, 'প্রয়োজনে প্রাসঙ্গিক প্রশ্ন করতে হলে করুন তবে সরাসরি প্রশ্ন নয়।');
INSERT INTO public.question (id, question_label, label, error_label, variable, type, options, question_order, questionnaire_id, section_id, validation_rules, skip_logic, "createdAt", "updatedAt", custom_attributes, enabled_rules, disabled_rules, instruction) VALUES (5, '২.২', 'আপনার বয়স কত? পূর্ণ বছরে .............(সংখ্যা লিখুন)', 'Age', 'age', 'age_dropdown', '"[{\"value\":\"201\",\"label\":\"201 জানি না\"},{\"value\":\"202\",\"label\":\"202 অস্বীকৃিত \"}]"', 4, 2, 2, NULL, NULL, '2023-09-11 13:10:46.34+06', '2023-09-18 16:19:49.445+06', '"[{\"value\":\"0\",\"label\":\"start\"},{\"value\":\"150\",\"label\":\"end\"}]"', NULL, NULL, '- বয়স ১৮ বছরের নিচে হলে, বলুন য়ে আমরা এই জরিপে ১৮ বছরের উপরের মানুষের সাথে কথা বলতে চাচ্ছি; তাই ধন্যবাদ জানিয়ে শেষ করুন।<br/>
- জানি না বা অস্বীকৃিতর ক্ষেত্রেও ধন্যবাদ জানিয়ে শেষ করুন।<br/>
- যদি বয়স ১৮ বছরের কম বলে তাহলে প্রশ্নটি আবার করে উত্তর যাঁচাই করুন। <br/>
- বয়স পূর্ণ বছরে লিখতে হবে, যেমন বয়স যদি ২৫ বছর ১১ মাস হয় তবে ২৫ বছর ধরতে হবে।<br/>
- প্রয়োজনে প্রাসঙ্গিক প্রশ্ন করতে হলে করুন।');
INSERT INTO public.question (id, question_label, label, error_label, variable, type, options, question_order, questionnaire_id, section_id, validation_rules, skip_logic, "createdAt", "updatedAt", custom_attributes, enabled_rules, disabled_rules, instruction) VALUES (4, '২.৩', 'আপনি শহরে না গ্রামে বাস করেন?', 'City Or Village', 'city_or_village', 'radio', '"[{\"value\":\"1\",\"label\":\"1 শহর\"},{\"value\":\"2\",\"label\":\"2 গ্রাম\"},{\"value\":\"88\",\"label\":\"88 জানি না\"},{\"value\":\"99\",\"label\":\"99 অস্বীকৃিত\"}]"', 5, 2, 2, NULL, NULL, '2023-09-11 12:22:34.83+06', '2023-09-18 16:26:09.262+06', NULL, NULL, NULL, 'শহর বলতে বুঝানো হচ্ছে বিভাগ, জেলা বা উপজেলাা সদরের এলাকা (অর্থাৎ, সিটি করপোরেশন, পৌরসভা এবং ক্যান্টনমেন্ট এলাকা)।
<br/>
গ্রাম এলাকা হচ্ছে উপজেলাা সদরের বাইরের ইউনিয়ন সমূহের এলাকা।
<br/>
জানি না বা অস্বীকৃিতর ক্ষেত্রে ধন্যবাদ জানিয়ে শেষ করুন।');
INSERT INTO public.question (id, question_label, label, error_label, variable, type, options, question_order, questionnaire_id, section_id, validation_rules, skip_logic, "createdAt", "updatedAt", custom_attributes, enabled_rules, disabled_rules, instruction) VALUES (1, '১ . ১', 'আপনি কি কথা বলার জন্য সময় দিবেন ?  আমি কি প্রশ্ন শুরু করব ?', 'Interview Permission', 'interviewer_permission', 'radio', '"[{\"value\":\"1\",\"label\":\"1 হ্যাঁ , এখনই \"},{\"value\":\"2\",\"label\":\"2 হ্যাঁ , অন্য সময় \"},{\"value\":\"3\",\"label\":\"3 না \"}]"', 1, 2, 1, 'object().shape({
  value: string().required(),
  label: string().required(''[this] is required!'')
})', '"{\"is\":[1,2],\"route\":\"2eligibility_timeselection\",\"node\":\"eligibility_timeselection.city_or_village\"}"', '2023-09-10 23:59:10.2+06', '2023-09-13 00:26:00.133+06', NULL, NULL, '"[{\"not\":[1,2],\"fields\":{\"introduction_permission.denied_reason\":{\"value\":\"\",\"label\":\"\"}}}]"', '১। হ্যাঁ. এখনই” সম্মত হলে, ২.১-এ যান এবং যোগ্য হলে, ৩.১ থেকে প্রশ্ন শুরু করুন।
<br/>
২। হ্যাঁ, অন্য সময়ে” সম্মত হলে, ২.১-এ যোগ্যতা যাঁচাই সাপেক্ষে সময় নির্ধারণ করুন; এবং নির্ধারিত সময়/দিনে ৩.১ থেকে প্রশ্ন শুরু করুন।
<br/>
৩। সম্মত না হলে, ১.২-এর উত্তর নিন এবং তারপর সমাপনী বক্তব্য বলুন ও সাক্ষাৎকারটি শেষ করুন।');
INSERT INTO public.question (id, question_label, label, error_label, variable, type, options, question_order, questionnaire_id, section_id, validation_rules, skip_logic, "createdAt", "updatedAt", custom_attributes, enabled_rules, disabled_rules, instruction) VALUES (2, '১.২', 'অসম্মতির কারণ', 'Denied Reason', 'denied_reason', 'dropdown', '"[{\"value\":\"1\",\"label\":\"1 কোন কারণ বলেননি / কিছু না বলে ফোন কেটে দিয়েছেন\"},{\"value\":\"2\",\"label\":\"2 সময় নেই\"},{\"value\":\"3\",\"label\":\"3 জরিপে আগ্রহ বা ইচ্ছে নেই\"},{\"value\":\"4\",\"label\":\"4 জরিপ সম্পর্কে কিছু বুঝতে পারে নি\"},{\"value\":\"5\",\"label\":\"5 প্রতারনার ভয় / বিশ্বাসহীনতা\"},{\"value\":\"6\",\"label\":\"6 ভাষাগত সমস্যা\"},{\"value\":\"7\",\"label\":\"7 পারিবারিক সমস্যা\"}]"', 2, 2, 1, 'object().shape({
  value: string().required(),
  label: string().required(''[this] is required!'')
})', NULL, '2023-09-11 09:59:28.714+06', '2023-09-18 14:30:43.147+06', NULL, 'introduction_permission.interviewer_permission.value == 3 && (', NULL, 'কোন প্রশ্ন করার প্রয়োজন নেই; তিনি নিজ থেকেই কোন কারণ উল্লেখ করলে, লিপিবদ্ধ করুন।');
INSERT INTO public.question (id, question_label, label, error_label, variable, type, options, question_order, questionnaire_id, section_id, validation_rules, skip_logic, "createdAt", "updatedAt", custom_attributes, enabled_rules, disabled_rules, instruction) VALUES (7, '২ . ৬', 'দয়া করে আপনার নামটি বলুন।', 'Name', 'name_of_person', 'text_radio', '"[{\"value\":\"99\",\"label\":\"99 অস্বীকৃিত\"}]"', 8, 2, 2, '', NULL, '2023-09-18 16:16:35.147+06', '2023-09-18 22:31:06.132+06', NULL, NULL, NULL, '(লাইনটি কেটে গেলে, বা পরে আবার আপনার সাথেই ফোনে কথা বলতে হলে আপনার নামটি জানা প্রয়োজন।)
<br/>
কয়েকবার চেষ্টার পরও অস্বীকৃিত জানালে, পরবর্তী প্রশ্নে যান।');
INSERT INTO public.question (id, question_label, label, error_label, variable, type, options, question_order, questionnaire_id, section_id, validation_rules, skip_logic, "createdAt", "updatedAt", custom_attributes, enabled_rules, disabled_rules, instruction) VALUES (6, '২. ৫', 'আপনি সর্বোচ্চ কতদূর পর্যন্ত পড়াশুনা করেছেন?', 'Education', 'education', 'dropdown', '"[{\"value\":\"1\",\"label\":\"1 কোন প্রাতিষ্ঠানিক শিক্ষা নেই\"},{\"value\":\"2\",\"label\":\"2 প্রাথমিক/ সমতুল্য শিক্ষা শেষ করেননি\"},{\"value\":\"3\",\"label\":\"3 প্রাথমিক/ সমতুল্য শিক্ষা শেষ করেছেন\"},{\"value\":\"4\",\"label\":\"4 মাধ্যমিক/ সমতুল্য শিক্ষা শেষ করেছেন\"},{\"value\":\"5\",\"label\":\"5 উচ্চ মাধ্যমিক/ সমতুল্য শিক্ষা শেষ করেছেন\"},{\"value\":\"6\",\"label\":\"6 কলেজ/বিশ্ববিদ্যালয়/ সমতুল্য শিক্ষা শেষ করেছেন\"},{\"value\":\"7\",\"label\":\"7 স্নাতকোত্তর ডিগ্রী অর্জন করেছেন\"},{\"value\":\"99\",\"label\":\"99 অস্বীকৃিত\"}]"', 7, 2, 2, '', NULL, '2023-09-18 11:13:18.269+06', '2023-09-19 03:19:17.252+06', NULL, NULL, NULL, '<table className=''table-auto border-collapse border border-slate-400''>
<tr className=''bg-gray-2 text-left dark:bg-meta-4''>
<th colSpan={3}>সাধারণ শিক্ষা, ইংরেজী মাধ্যম ও মাদ্রাসা শিক্ষার সমমান নিচে দেয়া হলোঃ
</th>
</tr>
<tr><td className="border border-slate-300">প্রাথমিক</td><td className="border border-slate-300">এবতেদায়ী</td><td className="border border-slate-300">৫ বছর</td></tr>
<tr><td className="border border-slate-300">মাধ্যমিক / ও লেভেল</td><td className="border border-slate-300">দাখিল</td><td className="border border-slate-300">১০ বছর</td></tr>
<tr><td className="border border-slate-300">উচ্চ মাধ্যমিক / এ লেভেল</td><td className="border border-slate-300">আলিম</td><td className="border border-slate-300">১২  বছর</td></tr>
<tr><td className="border border-slate-300">স্নাতক</td><td className="border border-slate-300">ফাজিল</td><td className="border border-slate-300">১৬  বছর</td></tr>
<tr><td className="border border-slate-300">স্নাতকোত্তর</td><td className="border border-slate-300">কামিল</td><td className="border border-slate-300">১৮  বছর</td></tr>
<tr><td className="border border-slate-300">প্রাথমিক</td><td className="border border-slate-300">এবতেদায়ী</td><td className="border border-slate-300">৫ বছর</td></tr>
</table>
যদি উত্তরদাতা প্রাথমিক শিক্ষার কিছু বছর পড়াশোনা করে থাকনে তাহলে  2 প্রাথমিক/ সমতুল্য শিক্ষা শেষ করেননি  নির্বাচন করুন।
<br/>
আর যদি প্রাথমিকের পরে মাধ্যমিক র্পযায়ে ক্লাস করেছেন কিন্তু মাধ্যমিক পর্যায় অতিক্রম করতে পারেননি, তাহলে 3 প্রাথমিক/ সমতুল্য শিক্ষা শেষ করেছেন নির্বাচন করুন।
<br/>
প্রয়োজনে প্রাসঙ্গিক প্রশ্ন করতে হলে করুন।
<br/>
99 অস্বীকৃিতর ক্ষেত্রে ধন্যবাদ জানিয়ে শেষ করুন।');
INSERT INTO public.question (id, question_label, label, error_label, variable, type, options, question_order, questionnaire_id, section_id, validation_rules, skip_logic, "createdAt", "updatedAt", custom_attributes, enabled_rules, disabled_rules, instruction) VALUES (8, '৫ . ১', 'সাধারন একটি দিনে আপনি (ঘুম ব্যতীত) বসে অথবা হেলান  দিয়ে ঐরকমভাবে কত ঘন্টা সময় কাটান?', '', 'relax', 'hour_minutes', NULL, 10, 2, 5, '', NULL, '2023-09-19 04:05:17.909+06', '2023-09-19 04:05:17.909+06', NULL, NULL, NULL, '');


--
-- TOC entry 3326 (class 0 OID 17842)
-- Dependencies: 210
-- Data for Name: questionnaire; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.questionnaire (id, title, type, version, "createdAt", "updatedAt") VALUES (1, 'Reproductive', 1, '2', '2023-03-12 15:28:06.195+06', '2023-03-12 15:28:06.195+06');
INSERT INTO public.questionnaire (id, title, type, version, "createdAt", "updatedAt") VALUES (2, 'CATINCD', 2, '1', '2023-07-30 15:29:31.471+06', '2023-09-12 22:43:54.488+06');


--
-- TOC entry 3328 (class 0 OID 18060)
-- Dependencies: 212
-- Data for Name: section; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.section (id, label, slug, questionnaire_id, section_order, "createdAt", "updatedAt", type, instruction) VALUES (2, 'সেকশন ২  : যোগ্যতা এবং সময় নির্ধারণ', 'eligibility_timeselection', 2, 2, '2023-09-10 16:05:25.046+06', '2023-09-10 16:05:25.046+06', 0, NULL);
INSERT INTO public.section (id, label, slug, questionnaire_id, section_order, "createdAt", "updatedAt", type, instruction) VALUES (1, 'সেকশন ১: সূচনা এবং সম্মতি', 'introduction_permission', 2, 1, '2023-09-10 16:03:25.644+06', '2023-09-10 23:51:16.731+06', 0, NULL);
INSERT INTO public.section (id, label, slug, questionnaire_id, section_order, "createdAt", "updatedAt", type, instruction) VALUES (3, 'সেকশন ৩ : ডেমোগ্রাফিক অন্যান্য তথ্যসমূহ :', 'demographic_information', 2, 3, '2023-09-18 10:58:40.638+06', '2023-09-18 10:58:40.638+06', 0, NULL);
INSERT INTO public.section (id, label, slug, questionnaire_id, section_order, "createdAt", "updatedAt", type, instruction) VALUES (5, 'সেকশন ৫: অবসর বা বিশ্রাম সম্পর্কিত তথ্য:', 'relax_information', 2, 5, '2023-09-18 11:00:24.627+06', '2023-09-18 11:00:24.627+06', 0, NULL);
INSERT INTO public.section (id, label, slug, questionnaire_id, section_order, "createdAt", "updatedAt", type, instruction) VALUES (4, 'সেকশন ৪: খাদ্যাভ্যাস:', 'food_habits', 2, 4, '2023-09-18 10:59:24.028+06', '2023-09-18 11:00:36.334+06', 0, NULL);
INSERT INTO public.section (id, label, slug, questionnaire_id, section_order, "createdAt", "updatedAt", type, instruction) VALUES (6, 'সেকশন ৬ঃ শারিরীক অবস্থা (উচ্চ রক্তচাপ, ডায়াবেটিস) ও এর চিকিৎসা:', 'physical_status', 2, 6, '2023-09-18 11:02:23.961+06', '2023-09-18 11:02:23.961+06', 0, NULL);
INSERT INTO public.section (id, label, slug, questionnaire_id, section_order, "createdAt", "updatedAt", type, instruction) VALUES (7, 'সমাপনী', 'finish', 2, 9, '2023-09-19 02:39:04.667+06', '2023-09-19 03:19:40.417+06', 1, 'সমাপনী বক্তব্য বলুনঃ
<br/>
আপনার মূল্যবান সময় দিয়ে জরিপে অংশগ্রহণ করার জন্য ধন্যবাদ। দয়া করে মাস্ক পরুন, ভিড় এড়িয়ে চলুন, সাবান দিয়ে হাত ধুন এবং সুস্থ্য থাকুন।');


--
-- TOC entry 3340 (class 0 OID 0)
-- Dependencies: 213
-- Name: question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.question_id_seq', 8, true);


--
-- TOC entry 3341 (class 0 OID 0)
-- Dependencies: 209
-- Name: questionnaire_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.questionnaire_id_seq', 2, true);


--
-- TOC entry 3342 (class 0 OID 0)
-- Dependencies: 211
-- Name: section_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.section_id_seq', 7, true);


--
-- TOC entry 3183 (class 2606 OID 18093)
-- Name: question question_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question
    ADD CONSTRAINT question_pkey PRIMARY KEY (id);


--
-- TOC entry 3179 (class 2606 OID 17847)
-- Name: questionnaire questionnaire_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionnaire
    ADD CONSTRAINT questionnaire_pkey PRIMARY KEY (id);


--
-- TOC entry 3181 (class 2606 OID 18065)
-- Name: section section_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.section
    ADD CONSTRAINT section_pkey PRIMARY KEY (id);


--
-- TOC entry 3185 (class 2606 OID 18094)
-- Name: question question_questionnaire_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question
    ADD CONSTRAINT question_questionnaire_id_fkey FOREIGN KEY (questionnaire_id) REFERENCES public.questionnaire(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3184 (class 2606 OID 18066)
-- Name: section section_questionnaire_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.section
    ADD CONSTRAINT section_questionnaire_id_fkey FOREIGN KEY (questionnaire_id) REFERENCES public.questionnaire(id);


-- Completed on 2023-09-21 12:52:52

--
-- PostgreSQL database dump complete
--

