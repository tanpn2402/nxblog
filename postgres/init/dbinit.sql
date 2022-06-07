--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3 (Debian 14.3-1.pgdg110+1)
-- Dumped by pg_dump version 14.3 (Debian 14.3-1.pgdg110+1)

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
-- Name: admin_permissions; Type: TABLE; Schema: public; Owner: strost
--

CREATE TABLE public.admin_permissions (
    id integer NOT NULL,
    action character varying(255),
    subject character varying(255),
    properties jsonb,
    conditions jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.admin_permissions OWNER TO strost;

--
-- Name: admin_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: strost
--

CREATE SEQUENCE public.admin_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_permissions_id_seq OWNER TO strost;

--
-- Name: admin_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strost
--

ALTER SEQUENCE public.admin_permissions_id_seq OWNED BY public.admin_permissions.id;


--
-- Name: admin_permissions_role_links; Type: TABLE; Schema: public; Owner: strost
--

CREATE TABLE public.admin_permissions_role_links (
    permission_id integer,
    role_id integer
);


ALTER TABLE public.admin_permissions_role_links OWNER TO strost;

--
-- Name: admin_roles; Type: TABLE; Schema: public; Owner: strost
--

CREATE TABLE public.admin_roles (
    id integer NOT NULL,
    name character varying(255),
    code character varying(255),
    description character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.admin_roles OWNER TO strost;

--
-- Name: admin_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: strost
--

CREATE SEQUENCE public.admin_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_roles_id_seq OWNER TO strost;

--
-- Name: admin_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strost
--

ALTER SEQUENCE public.admin_roles_id_seq OWNED BY public.admin_roles.id;


--
-- Name: admin_users; Type: TABLE; Schema: public; Owner: strost
--

CREATE TABLE public.admin_users (
    id integer NOT NULL,
    firstname character varying(255),
    lastname character varying(255),
    username character varying(255),
    email character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    registration_token character varying(255),
    is_active boolean,
    blocked boolean,
    prefered_language character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.admin_users OWNER TO strost;

--
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: strost
--

CREATE SEQUENCE public.admin_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_users_id_seq OWNER TO strost;

--
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strost
--

ALTER SEQUENCE public.admin_users_id_seq OWNED BY public.admin_users.id;


--
-- Name: admin_users_roles_links; Type: TABLE; Schema: public; Owner: strost
--

CREATE TABLE public.admin_users_roles_links (
    user_id integer,
    role_id integer
);


ALTER TABLE public.admin_users_roles_links OWNER TO strost;

--
-- Name: files; Type: TABLE; Schema: public; Owner: strost
--

CREATE TABLE public.files (
    id integer NOT NULL,
    name character varying(255),
    alternative_text character varying(255),
    caption character varying(255),
    width integer,
    height integer,
    formats jsonb,
    hash character varying(255),
    ext character varying(255),
    mime character varying(255),
    size numeric(10,2),
    url character varying(255),
    preview_url character varying(255),
    provider character varying(255),
    provider_metadata jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.files OWNER TO strost;

--
-- Name: files_id_seq; Type: SEQUENCE; Schema: public; Owner: strost
--

CREATE SEQUENCE public.files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_id_seq OWNER TO strost;

--
-- Name: files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strost
--

ALTER SEQUENCE public.files_id_seq OWNED BY public.files.id;


--
-- Name: files_related_morphs; Type: TABLE; Schema: public; Owner: strost
--

CREATE TABLE public.files_related_morphs (
    file_id integer,
    related_id integer,
    related_type character varying(255),
    field character varying(255),
    "order" integer
);


ALTER TABLE public.files_related_morphs OWNER TO strost;

--
-- Name: i18n_locale; Type: TABLE; Schema: public; Owner: strost
--

CREATE TABLE public.i18n_locale (
    id integer NOT NULL,
    name character varying(255),
    code character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.i18n_locale OWNER TO strost;

--
-- Name: i18n_locale_id_seq; Type: SEQUENCE; Schema: public; Owner: strost
--

CREATE SEQUENCE public.i18n_locale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.i18n_locale_id_seq OWNER TO strost;

--
-- Name: i18n_locale_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strost
--

ALTER SEQUENCE public.i18n_locale_id_seq OWNED BY public.i18n_locale.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: strost
--

CREATE TABLE public.posts (
    id integer NOT NULL,
    slug character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    title character varying(255),
    excerpt text,
    content text,
    is_internal boolean
);


ALTER TABLE public.posts OWNER TO strost;

--
-- Name: posts_author_links; Type: TABLE; Schema: public; Owner: strost
--

CREATE TABLE public.posts_author_links (
    post_id integer,
    user_id integer
);


ALTER TABLE public.posts_author_links OWNER TO strost;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: strost
--

CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_id_seq OWNER TO strost;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strost
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: strapi_api_tokens; Type: TABLE; Schema: public; Owner: strost
--

CREATE TABLE public.strapi_api_tokens (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    type character varying(255),
    access_key character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_api_tokens OWNER TO strost;

--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: strost
--

CREATE SEQUENCE public.strapi_api_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_api_tokens_id_seq OWNER TO strost;

--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strost
--

ALTER SEQUENCE public.strapi_api_tokens_id_seq OWNED BY public.strapi_api_tokens.id;


--
-- Name: strapi_core_store_settings; Type: TABLE; Schema: public; Owner: strost
--

CREATE TABLE public.strapi_core_store_settings (
    id integer NOT NULL,
    key character varying(255),
    value text,
    type character varying(255),
    environment character varying(255),
    tag character varying(255)
);


ALTER TABLE public.strapi_core_store_settings OWNER TO strost;

--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: strost
--

CREATE SEQUENCE public.strapi_core_store_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_core_store_settings_id_seq OWNER TO strost;

--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strost
--

ALTER SEQUENCE public.strapi_core_store_settings_id_seq OWNED BY public.strapi_core_store_settings.id;


--
-- Name: strapi_database_schema; Type: TABLE; Schema: public; Owner: strost
--

CREATE TABLE public.strapi_database_schema (
    id integer NOT NULL,
    schema json,
    "time" timestamp without time zone,
    hash character varying(255)
);


ALTER TABLE public.strapi_database_schema OWNER TO strost;

--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE; Schema: public; Owner: strost
--

CREATE SEQUENCE public.strapi_database_schema_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_database_schema_id_seq OWNER TO strost;

--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strost
--

ALTER SEQUENCE public.strapi_database_schema_id_seq OWNED BY public.strapi_database_schema.id;


--
-- Name: strapi_migrations; Type: TABLE; Schema: public; Owner: strost
--

CREATE TABLE public.strapi_migrations (
    id integer NOT NULL,
    name character varying(255),
    "time" timestamp without time zone
);


ALTER TABLE public.strapi_migrations OWNER TO strost;

--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: strost
--

CREATE SEQUENCE public.strapi_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_migrations_id_seq OWNER TO strost;

--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strost
--

ALTER SEQUENCE public.strapi_migrations_id_seq OWNED BY public.strapi_migrations.id;


--
-- Name: strapi_webhooks; Type: TABLE; Schema: public; Owner: strost
--

CREATE TABLE public.strapi_webhooks (
    id integer NOT NULL,
    name character varying(255),
    url text,
    headers jsonb,
    events jsonb,
    enabled boolean
);


ALTER TABLE public.strapi_webhooks OWNER TO strost;

--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: strost
--

CREATE SEQUENCE public.strapi_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_webhooks_id_seq OWNER TO strost;

--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strost
--

ALTER SEQUENCE public.strapi_webhooks_id_seq OWNED BY public.strapi_webhooks.id;


--
-- Name: up_permissions; Type: TABLE; Schema: public; Owner: strost
--

CREATE TABLE public.up_permissions (
    id integer NOT NULL,
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.up_permissions OWNER TO strost;

--
-- Name: up_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: strost
--

CREATE SEQUENCE public.up_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_permissions_id_seq OWNER TO strost;

--
-- Name: up_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strost
--

ALTER SEQUENCE public.up_permissions_id_seq OWNED BY public.up_permissions.id;


--
-- Name: up_permissions_role_links; Type: TABLE; Schema: public; Owner: strost
--

CREATE TABLE public.up_permissions_role_links (
    permission_id integer,
    role_id integer
);


ALTER TABLE public.up_permissions_role_links OWNER TO strost;

--
-- Name: up_roles; Type: TABLE; Schema: public; Owner: strost
--

CREATE TABLE public.up_roles (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    type character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.up_roles OWNER TO strost;

--
-- Name: up_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: strost
--

CREATE SEQUENCE public.up_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_roles_id_seq OWNER TO strost;

--
-- Name: up_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strost
--

ALTER SEQUENCE public.up_roles_id_seq OWNED BY public.up_roles.id;


--
-- Name: up_users; Type: TABLE; Schema: public; Owner: strost
--

CREATE TABLE public.up_users (
    id integer NOT NULL,
    username character varying(255),
    email character varying(255),
    provider character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    confirmation_token character varying(255),
    confirmed boolean,
    blocked boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    name character varying(255)
);


ALTER TABLE public.up_users OWNER TO strost;

--
-- Name: up_users_id_seq; Type: SEQUENCE; Schema: public; Owner: strost
--

CREATE SEQUENCE public.up_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_users_id_seq OWNER TO strost;

--
-- Name: up_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strost
--

ALTER SEQUENCE public.up_users_id_seq OWNED BY public.up_users.id;


--
-- Name: up_users_role_links; Type: TABLE; Schema: public; Owner: strost
--

CREATE TABLE public.up_users_role_links (
    user_id integer,
    role_id integer
);


ALTER TABLE public.up_users_role_links OWNER TO strost;

--
-- Name: admin_permissions id; Type: DEFAULT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.admin_permissions ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_id_seq'::regclass);


--
-- Name: admin_roles id; Type: DEFAULT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.admin_roles ALTER COLUMN id SET DEFAULT nextval('public.admin_roles_id_seq'::regclass);


--
-- Name: admin_users id; Type: DEFAULT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.admin_users ALTER COLUMN id SET DEFAULT nextval('public.admin_users_id_seq'::regclass);


--
-- Name: files id; Type: DEFAULT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.files ALTER COLUMN id SET DEFAULT nextval('public.files_id_seq'::regclass);


--
-- Name: i18n_locale id; Type: DEFAULT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.i18n_locale ALTER COLUMN id SET DEFAULT nextval('public.i18n_locale_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: strapi_api_tokens id; Type: DEFAULT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.strapi_api_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_tokens_id_seq'::regclass);


--
-- Name: strapi_core_store_settings id; Type: DEFAULT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.strapi_core_store_settings ALTER COLUMN id SET DEFAULT nextval('public.strapi_core_store_settings_id_seq'::regclass);


--
-- Name: strapi_database_schema id; Type: DEFAULT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.strapi_database_schema ALTER COLUMN id SET DEFAULT nextval('public.strapi_database_schema_id_seq'::regclass);


--
-- Name: strapi_migrations id; Type: DEFAULT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.strapi_migrations ALTER COLUMN id SET DEFAULT nextval('public.strapi_migrations_id_seq'::regclass);


--
-- Name: strapi_webhooks id; Type: DEFAULT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.strapi_webhooks ALTER COLUMN id SET DEFAULT nextval('public.strapi_webhooks_id_seq'::regclass);


--
-- Name: up_permissions id; Type: DEFAULT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.up_permissions ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_id_seq'::regclass);


--
-- Name: up_roles id; Type: DEFAULT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.up_roles ALTER COLUMN id SET DEFAULT nextval('public.up_roles_id_seq'::regclass);


--
-- Name: up_users id; Type: DEFAULT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.up_users ALTER COLUMN id SET DEFAULT nextval('public.up_users_id_seq'::regclass);


--
-- Data for Name: admin_permissions; Type: TABLE DATA; Schema: public; Owner: strost
--

COPY public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	plugin::upload.read	\N	{}	[]	2022-05-20 10:27:40.786	2022-05-20 10:27:40.786	\N	\N
2	plugin::upload.assets.create	\N	{}	[]	2022-05-20 10:27:40.801	2022-05-20 10:27:40.801	\N	\N
3	plugin::upload.assets.update	\N	{}	[]	2022-05-20 10:27:40.811	2022-05-20 10:27:40.811	\N	\N
4	plugin::upload.assets.download	\N	{}	[]	2022-05-20 10:27:40.821	2022-05-20 10:27:40.821	\N	\N
5	plugin::upload.assets.copy-link	\N	{}	[]	2022-05-20 10:27:40.829	2022-05-20 10:27:40.829	\N	\N
6	plugin::upload.read	\N	{}	["admin::is-creator"]	2022-05-20 10:27:40.837	2022-05-20 10:27:40.837	\N	\N
7	plugin::upload.assets.create	\N	{}	[]	2022-05-20 10:27:40.844	2022-05-20 10:27:40.844	\N	\N
8	plugin::upload.assets.update	\N	{}	["admin::is-creator"]	2022-05-20 10:27:40.854	2022-05-20 10:27:40.854	\N	\N
9	plugin::upload.assets.download	\N	{}	[]	2022-05-20 10:27:40.861	2022-05-20 10:27:40.861	\N	\N
10	plugin::upload.assets.copy-link	\N	{}	[]	2022-05-20 10:27:40.874	2022-05-20 10:27:40.874	\N	\N
14	plugin::content-manager.explorer.delete	plugin::users-permissions.user	{}	[]	2022-05-20 10:27:40.933	2022-05-20 10:27:40.933	\N	\N
15	plugin::content-manager.single-types.configure-view	\N	{}	[]	2022-05-20 10:27:40.941	2022-05-20 10:27:40.941	\N	\N
16	plugin::content-manager.collection-types.configure-view	\N	{}	[]	2022-05-20 10:27:40.952	2022-05-20 10:27:40.952	\N	\N
17	plugin::content-manager.components.configure-layout	\N	{}	[]	2022-05-20 10:27:40.959	2022-05-20 10:27:40.959	\N	\N
18	plugin::content-type-builder.read	\N	{}	[]	2022-05-20 10:27:40.964	2022-05-20 10:27:40.964	\N	\N
19	plugin::email.settings.read	\N	{}	[]	2022-05-20 10:27:40.973	2022-05-20 10:27:40.973	\N	\N
20	plugin::upload.read	\N	{}	[]	2022-05-20 10:27:40.986	2022-05-20 10:27:40.986	\N	\N
21	plugin::upload.assets.create	\N	{}	[]	2022-05-20 10:27:40.993	2022-05-20 10:27:40.993	\N	\N
22	plugin::upload.assets.update	\N	{}	[]	2022-05-20 10:27:40.999	2022-05-20 10:27:40.999	\N	\N
23	plugin::upload.assets.download	\N	{}	[]	2022-05-20 10:27:41.005	2022-05-20 10:27:41.005	\N	\N
24	plugin::upload.assets.copy-link	\N	{}	[]	2022-05-20 10:27:41.01	2022-05-20 10:27:41.01	\N	\N
25	plugin::upload.settings.read	\N	{}	[]	2022-05-20 10:27:41.016	2022-05-20 10:27:41.016	\N	\N
26	plugin::i18n.locale.create	\N	{}	[]	2022-05-20 10:27:41.023	2022-05-20 10:27:41.023	\N	\N
27	plugin::i18n.locale.read	\N	{}	[]	2022-05-20 10:27:41.027	2022-05-20 10:27:41.027	\N	\N
28	plugin::i18n.locale.update	\N	{}	[]	2022-05-20 10:27:41.032	2022-05-20 10:27:41.032	\N	\N
29	plugin::i18n.locale.delete	\N	{}	[]	2022-05-20 10:27:41.036	2022-05-20 10:27:41.036	\N	\N
30	plugin::users-permissions.roles.create	\N	{}	[]	2022-05-20 10:27:41.041	2022-05-20 10:27:41.041	\N	\N
31	plugin::users-permissions.roles.read	\N	{}	[]	2022-05-20 10:27:41.045	2022-05-20 10:27:41.045	\N	\N
32	plugin::users-permissions.roles.update	\N	{}	[]	2022-05-20 10:27:41.051	2022-05-20 10:27:41.051	\N	\N
33	plugin::users-permissions.roles.delete	\N	{}	[]	2022-05-20 10:27:41.059	2022-05-20 10:27:41.059	\N	\N
34	plugin::users-permissions.providers.read	\N	{}	[]	2022-05-20 10:27:41.065	2022-05-20 10:27:41.065	\N	\N
35	plugin::users-permissions.providers.update	\N	{}	[]	2022-05-20 10:27:41.069	2022-05-20 10:27:41.069	\N	\N
36	plugin::users-permissions.email-templates.read	\N	{}	[]	2022-05-20 10:27:41.074	2022-05-20 10:27:41.074	\N	\N
37	plugin::users-permissions.email-templates.update	\N	{}	[]	2022-05-20 10:27:41.081	2022-05-20 10:27:41.081	\N	\N
38	plugin::users-permissions.advanced-settings.read	\N	{}	[]	2022-05-20 10:27:41.089	2022-05-20 10:27:41.089	\N	\N
39	plugin::users-permissions.advanced-settings.update	\N	{}	[]	2022-05-20 10:27:41.096	2022-05-20 10:27:41.096	\N	\N
40	admin::marketplace.read	\N	{}	[]	2022-05-20 10:27:41.103	2022-05-20 10:27:41.103	\N	\N
41	admin::marketplace.plugins.install	\N	{}	[]	2022-05-20 10:27:41.108	2022-05-20 10:27:41.108	\N	\N
42	admin::marketplace.plugins.uninstall	\N	{}	[]	2022-05-20 10:27:41.118	2022-05-20 10:27:41.118	\N	\N
43	admin::webhooks.create	\N	{}	[]	2022-05-20 10:27:41.142	2022-05-20 10:27:41.142	\N	\N
44	admin::webhooks.read	\N	{}	[]	2022-05-20 10:27:41.155	2022-05-20 10:27:41.155	\N	\N
45	admin::webhooks.update	\N	{}	[]	2022-05-20 10:27:41.161	2022-05-20 10:27:41.161	\N	\N
46	admin::webhooks.delete	\N	{}	[]	2022-05-20 10:27:41.168	2022-05-20 10:27:41.168	\N	\N
47	admin::users.create	\N	{}	[]	2022-05-20 10:27:41.174	2022-05-20 10:27:41.174	\N	\N
48	admin::users.read	\N	{}	[]	2022-05-20 10:27:41.178	2022-05-20 10:27:41.178	\N	\N
49	admin::users.update	\N	{}	[]	2022-05-20 10:27:41.184	2022-05-20 10:27:41.184	\N	\N
50	admin::users.delete	\N	{}	[]	2022-05-20 10:27:41.19	2022-05-20 10:27:41.19	\N	\N
51	admin::roles.create	\N	{}	[]	2022-05-20 10:27:41.197	2022-05-20 10:27:41.197	\N	\N
52	admin::roles.read	\N	{}	[]	2022-05-20 10:27:41.202	2022-05-20 10:27:41.202	\N	\N
53	admin::roles.update	\N	{}	[]	2022-05-20 10:27:41.206	2022-05-20 10:27:41.206	\N	\N
54	admin::roles.delete	\N	{}	[]	2022-05-20 10:27:41.211	2022-05-20 10:27:41.211	\N	\N
55	admin::api-tokens.create	\N	{}	[]	2022-05-20 10:27:41.216	2022-05-20 10:27:41.216	\N	\N
56	admin::api-tokens.read	\N	{}	[]	2022-05-20 10:27:41.221	2022-05-20 10:27:41.221	\N	\N
57	admin::api-tokens.update	\N	{}	[]	2022-05-20 10:27:41.23	2022-05-20 10:27:41.23	\N	\N
58	admin::api-tokens.delete	\N	{}	[]	2022-05-20 10:27:41.235	2022-05-20 10:27:41.235	\N	\N
62	plugin::content-manager.explorer.delete	api::post.post	{}	[]	2022-05-20 10:28:29.171	2022-05-20 10:28:29.171	\N	\N
63	plugin::content-manager.explorer.publish	api::post.post	{}	[]	2022-05-20 10:28:29.18	2022-05-20 10:28:29.18	\N	\N
67	plugin::content-manager.explorer.create	api::post.post	{"fields": ["slug", "title", "excerpt", "content", "cover", "isInternal", "author"]}	[]	2022-05-20 10:35:09.008	2022-05-20 10:35:09.008	\N	\N
68	plugin::content-manager.explorer.read	api::post.post	{"fields": ["slug", "title", "excerpt", "content", "cover", "isInternal", "author"]}	[]	2022-05-20 10:35:09.014	2022-05-20 10:35:09.014	\N	\N
69	plugin::content-manager.explorer.update	api::post.post	{"fields": ["slug", "title", "excerpt", "content", "cover", "isInternal", "author"]}	[]	2022-05-20 10:35:09.022	2022-05-20 10:35:09.022	\N	\N
70	plugin::documentation.read	\N	{}	[]	2022-05-20 11:12:38.371	2022-05-20 11:12:38.371	\N	\N
71	plugin::documentation.settings.update	\N	{}	[]	2022-05-20 11:12:38.378	2022-05-20 11:12:38.378	\N	\N
72	plugin::documentation.settings.regenerate	\N	{}	[]	2022-05-20 11:12:38.383	2022-05-20 11:12:38.383	\N	\N
73	plugin::documentation.settings.read	\N	{}	[]	2022-05-20 11:12:38.39	2022-05-20 11:12:38.39	\N	\N
74	plugin::content-manager.explorer.create	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role", "picture", "name"]}	[]	2022-05-20 13:44:55.207	2022-05-20 13:44:55.207	\N	\N
75	plugin::content-manager.explorer.read	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role", "picture", "name"]}	[]	2022-05-20 13:44:55.217	2022-05-20 13:44:55.217	\N	\N
76	plugin::content-manager.explorer.update	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role", "picture", "name"]}	[]	2022-05-20 13:44:55.221	2022-05-20 13:44:55.221	\N	\N
\.


--
-- Data for Name: admin_permissions_role_links; Type: TABLE DATA; Schema: public; Owner: strost
--

COPY public.admin_permissions_role_links (permission_id, role_id) FROM stdin;
1	2
2	2
3	2
4	2
5	2
6	3
7	3
8	3
9	3
10	3
14	1
15	1
16	1
17	1
18	1
19	1
20	1
21	1
22	1
23	1
24	1
25	1
26	1
27	1
28	1
29	1
30	1
31	1
32	1
33	1
34	1
35	1
36	1
37	1
38	1
39	1
40	1
41	1
42	1
43	1
44	1
45	1
46	1
47	1
48	1
49	1
50	1
51	1
52	1
53	1
54	1
55	1
56	1
57	1
58	1
62	1
63	1
67	1
68	1
69	1
70	1
71	1
72	1
73	1
74	1
75	1
76	1
\.


--
-- Data for Name: admin_roles; Type: TABLE DATA; Schema: public; Owner: strost
--

COPY public.admin_roles (id, name, code, description, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	Super Admin	strapi-super-admin	Super Admins can access and manage all features and settings.	2022-05-20 10:27:40.758	2022-05-20 10:27:40.758	\N	\N
2	Editor	strapi-editor	Editors can manage and publish contents including those of other users.	2022-05-20 10:27:40.769	2022-05-20 10:27:40.769	\N	\N
3	Author	strapi-author	Authors can manage the content they have created.	2022-05-20 10:27:40.777	2022-05-20 10:27:40.777	\N	\N
\.


--
-- Data for Name: admin_users; Type: TABLE DATA; Schema: public; Owner: strost
--

COPY public.admin_users (id, firstname, lastname, username, email, password, reset_password_token, registration_token, is_active, blocked, prefered_language, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	Tan	Pham	\N	tanpn@gmail.com	$2a$10$ZwFnHgxNREgTK1gI8hZwUO1.dFkf7i5NhQ6gy/reE4zgk64B8tqVe	\N	\N	t	f	\N	2022-05-20 10:28:04.632	2022-05-20 10:28:04.632	\N	\N
\.


--
-- Data for Name: admin_users_roles_links; Type: TABLE DATA; Schema: public; Owner: strost
--

COPY public.admin_users_roles_links (user_id, role_id) FROM stdin;
1	1
\.


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: strost
--

COPY public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	icons8-anonymous-mask-144.png	icons8-anonymous-mask-144.png	icons8-anonymous-mask-144.png	144	144	\N	icons8_anonymous_mask_144_6d07255a5e	.png	image/png	2.91	/uploads/icons8_anonymous_mask_144_6d07255a5e.png	\N	local	\N	2022-05-20 10:36:32.239	2022-05-20 10:36:32.239	1	1
2	ubuntu-thumbfix.jpg	ubuntu-thumbfix.jpg	ubuntu-thumbfix.jpg	560	292	{"small": {"ext": ".jpg", "url": "/uploads/small_ubuntu_thumbfix_10a5d97363.jpg", "hash": "small_ubuntu_thumbfix_10a5d97363", "mime": "image/jpeg", "name": "small_ubuntu-thumbfix.jpg", "path": null, "size": 82.3, "width": 500, "height": 261}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_ubuntu_thumbfix_10a5d97363.jpg", "hash": "thumbnail_ubuntu_thumbfix_10a5d97363", "mime": "image/jpeg", "name": "thumbnail_ubuntu-thumbfix.jpg", "path": null, "size": 21.91, "width": 245, "height": 128}}	ubuntu_thumbfix_10a5d97363	.jpg	image/jpeg	18.98	/uploads/ubuntu_thumbfix_10a5d97363.jpg	\N	local	\N	2022-05-20 10:36:32.503	2022-05-20 10:36:32.503	1	1
3	docker-vector-logo.png	docker-vector-logo.png	docker-vector-logo.png	900	500	{"small": {"ext": ".png", "url": "/uploads/small_docker_vector_logo_23edbfa8b5.png", "hash": "small_docker_vector_logo_23edbfa8b5", "mime": "image/png", "name": "small_docker-vector-logo.png", "path": null, "size": 17.04, "width": 500, "height": 278}, "medium": {"ext": ".png", "url": "/uploads/medium_docker_vector_logo_23edbfa8b5.png", "hash": "medium_docker_vector_logo_23edbfa8b5", "mime": "image/png", "name": "medium_docker-vector-logo.png", "path": null, "size": 28.62, "width": 750, "height": 417}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_docker_vector_logo_23edbfa8b5.png", "hash": "thumbnail_docker_vector_logo_23edbfa8b5", "mime": "image/png", "name": "thumbnail_docker-vector-logo.png", "path": null, "size": 8.86, "width": 245, "height": 136}}	docker_vector_logo_23edbfa8b5	.png	image/png	5.73	/uploads/docker_vector_logo_23edbfa8b5.png	\N	local	\N	2022-05-20 10:36:32.591	2022-05-20 10:36:32.591	1	1
4	20180714-084121-nancy-3.jpeg	20180714-084121-nancy-3.jpeg	20180714-084121-nancy-3.jpeg	600	399	{"small": {"ext": ".jpeg", "url": "/uploads/small_20180714_084121_nancy_3_c614d91872.jpeg", "hash": "small_20180714_084121_nancy_3_c614d91872", "mime": "image/jpeg", "name": "small_20180714-084121-nancy-3.jpeg", "path": null, "size": 31.06, "width": 500, "height": 333}, "thumbnail": {"ext": ".jpeg", "url": "/uploads/thumbnail_20180714_084121_nancy_3_c614d91872.jpeg", "hash": "thumbnail_20180714_084121_nancy_3_c614d91872", "mime": "image/jpeg", "name": "thumbnail_20180714-084121-nancy-3.jpeg", "path": null, "size": 9.88, "width": 235, "height": 156}}	20180714_084121_nancy_3_c614d91872	.jpeg	image/jpeg	41.53	/uploads/20180714_084121_nancy_3_c614d91872.jpeg	\N	local	\N	2022-05-24 11:06:33.091	2022-05-24 11:06:33.091	1	1
5	https://miro.medium.com/max/1400/1*Y2miwQaLjmpdSnXrT5ajWQ@2x.png	https://miro.medium.com/max/1400/1*Y2miwQaLjmpdSnXrT5ajWQ@2x.png	https://miro.medium.com/max/1400/1*Y2miwQaLjmpdSnXrT5ajWQ@2x.png	928	832	{"small": {"ext": ".png", "url": "/uploads/small_1_Y2miw_Qa_Ljmpd_Sn_Xr_T5aj_WQ_2x_883370ef2a.png", "hash": "small_1_Y2miw_Qa_Ljmpd_Sn_Xr_T5aj_WQ_2x_883370ef2a", "mime": "image/png", "name": "small_https://miro.medium.com/max/1400/1*Y2miwQaLjmpdSnXrT5ajWQ@2x.png", "path": null, "size": 43.87, "width": 500, "height": 448}, "medium": {"ext": ".png", "url": "/uploads/medium_1_Y2miw_Qa_Ljmpd_Sn_Xr_T5aj_WQ_2x_883370ef2a.png", "hash": "medium_1_Y2miw_Qa_Ljmpd_Sn_Xr_T5aj_WQ_2x_883370ef2a", "mime": "image/png", "name": "medium_https://miro.medium.com/max/1400/1*Y2miwQaLjmpdSnXrT5ajWQ@2x.png", "path": null, "size": 74.93, "width": 750, "height": 672}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_1_Y2miw_Qa_Ljmpd_Sn_Xr_T5aj_WQ_2x_883370ef2a.png", "hash": "thumbnail_1_Y2miw_Qa_Ljmpd_Sn_Xr_T5aj_WQ_2x_883370ef2a", "mime": "image/png", "name": "thumbnail_https://miro.medium.com/max/1400/1*Y2miwQaLjmpdSnXrT5ajWQ@2x.png", "path": null, "size": 10.95, "width": 174, "height": 156}}	1_Y2miw_Qa_Ljmpd_Sn_Xr_T5aj_WQ_2x_883370ef2a	.png	image/png	12.12	/uploads/1_Y2miw_Qa_Ljmpd_Sn_Xr_T5aj_WQ_2x_883370ef2a.png	\N	local	\N	2022-05-25 09:04:06.393	2022-05-25 09:04:06.393	1	1
6	grafana_influx-1.png	grafana_influx-1.png	grafana_influx-1.png	601	322	{"small": {"ext": ".png", "url": "/uploads/small_grafana_influx_1_4f6cec05b1.png", "hash": "small_grafana_influx_1_4f6cec05b1", "mime": "image/png", "name": "small_grafana_influx-1.png", "path": null, "size": 32.87, "width": 500, "height": 268}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_grafana_influx_1_4f6cec05b1.png", "hash": "thumbnail_grafana_influx_1_4f6cec05b1", "mime": "image/png", "name": "thumbnail_grafana_influx-1.png", "path": null, "size": 11.59, "width": 245, "height": 131}}	grafana_influx_1_4f6cec05b1	.png	image/png	10.93	/uploads/grafana_influx_1_4f6cec05b1.png	\N	local	\N	2022-05-26 10:33:26.297	2022-05-26 10:33:26.297	1	1
7	https://upload.wikimedia.org/wikipedia/commons/thumb/c/c6/Influxdb_logo.svg/1200px-Influxdb_logo.svg.png	https://upload.wikimedia.org/wikipedia/commons/thumb/c/c6/Influxdb_logo.svg/1200px-Influxdb_logo.svg.png	https://upload.wikimedia.org/wikipedia/commons/thumb/c/c6/Influxdb_logo.svg/1200px-Influxdb_logo.svg.png	1200	445	{"large": {"ext": ".png", "url": "/uploads/large_1200px_Influxdb_logo_svg_4a22a71a86.png", "hash": "large_1200px_Influxdb_logo_svg_4a22a71a86", "mime": "image/png", "name": "large_https://upload.wikimedia.org/wikipedia/commons/thumb/c/c6/Influxdb_logo.svg/1200px-Influxdb_logo.svg.png", "path": null, "size": 65.46, "width": 1000, "height": 371}, "small": {"ext": ".png", "url": "/uploads/small_1200px_Influxdb_logo_svg_4a22a71a86.png", "hash": "small_1200px_Influxdb_logo_svg_4a22a71a86", "mime": "image/png", "name": "small_https://upload.wikimedia.org/wikipedia/commons/thumb/c/c6/Influxdb_logo.svg/1200px-Influxdb_logo.svg.png", "path": null, "size": 25.8, "width": 500, "height": 185}, "medium": {"ext": ".png", "url": "/uploads/medium_1200px_Influxdb_logo_svg_4a22a71a86.png", "hash": "medium_1200px_Influxdb_logo_svg_4a22a71a86", "mime": "image/png", "name": "medium_https://upload.wikimedia.org/wikipedia/commons/thumb/c/c6/Influxdb_logo.svg/1200px-Influxdb_logo.svg.png", "path": null, "size": 44.68, "width": 750, "height": 278}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_1200px_Influxdb_logo_svg_4a22a71a86.png", "hash": "thumbnail_1200px_Influxdb_logo_svg_4a22a71a86", "mime": "image/png", "name": "thumbnail_https://upload.wikimedia.org/wikipedia/commons/thumb/c/c6/Influxdb_logo.svg/1200px-Influxdb_logo.svg.png", "path": null, "size": 8.93, "width": 245, "height": 91}}	1200px_Influxdb_logo_svg_4a22a71a86	.png	image/png	8.63	/uploads/1200px_Influxdb_logo_svg_4a22a71a86.png	\N	local	\N	2022-05-26 10:37:32.073	2022-05-26 10:37:32.073	1	1
8	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQ6UEZVPcQ_fE5AOhclsY2UG3moDjwYhlLe0RbUMwnGCA7bpfX7-d3-vMfbuU4ef71O_M&usqp=CAU	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQ6UEZVPcQ_fE5AOhclsY2UG3moDjwYhlLe0RbUMwnGCA7bpfX7-d3-vMfbuU4ef71O_M&usqp=CAU	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQ6UEZVPcQ_fE5AOhclsY2UG3moDjwYhlLe0RbUMwnGCA7bpfX7-d3-vMfbuU4ef71O_M&usqp=CAU	254	198	{"thumbnail": {"ext": "", "url": "/uploads/thumbnail_images_q_tbn_A_Nd9_Gc_SQ_6_UEZV_Pc_Q_f_E5_A_Ohcls_Y2_UG_3mo_Djw_Yhl_Le0_Rb_U_Mwn_GCA_7bpf_X7_d3_v_Mfbu_U4ef71_O_M_and_usqp_CAU_7cd05dcbf1", "hash": "thumbnail_images_q_tbn_A_Nd9_Gc_SQ_6_UEZV_Pc_Q_f_E5_A_Ohcls_Y2_UG_3mo_Djw_Yhl_Le0_Rb_U_Mwn_GCA_7bpf_X7_d3_v_Mfbu_U4ef71_O_M_and_usqp_CAU_7cd05dcbf1", "mime": "image/png", "name": "thumbnail_https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQ6UEZVPcQ_fE5AOhclsY2UG3moDjwYhlLe0RbUMwnGCA7bpfX7-d3-vMfbuU4ef71O_M&usqp=CAU", "path": null, "size": 9.79, "width": 200, "height": 156}}	images_q_tbn_A_Nd9_Gc_SQ_6_UEZV_Pc_Q_f_E5_A_Ohcls_Y2_UG_3mo_Djw_Yhl_Le0_Rb_U_Mwn_GCA_7bpf_X7_d3_v_Mfbu_U4ef71_O_M_and_usqp_CAU_7cd05dcbf1		image/png	3.52	/uploads/images_q_tbn_A_Nd9_Gc_SQ_6_UEZV_Pc_Q_f_E5_A_Ohcls_Y2_UG_3mo_Djw_Yhl_Le0_Rb_U_Mwn_GCA_7bpf_X7_d3_v_Mfbu_U4ef71_O_M_and_usqp_CAU_7cd05dcbf1	\N	local	\N	2022-05-26 10:39:11.188	2022-05-26 10:39:11.188	1	1
\.


--
-- Data for Name: files_related_morphs; Type: TABLE DATA; Schema: public; Owner: strost
--

COPY public.files_related_morphs (file_id, related_id, related_type, field, "order") FROM stdin;
1	1	plugin::users-permissions.user	picture	1
3	2	api::post.post	cover	1
2	1	api::post.post	cover	1
6	4	api::post.post	cover	1
4	3	api::post.post	cover	1
\.


--
-- Data for Name: i18n_locale; Type: TABLE DATA; Schema: public; Owner: strost
--

COPY public.i18n_locale (id, name, code, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	English (en)	en	2022-05-20 10:27:40.628	2022-05-20 10:27:40.628	\N	\N
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: strost
--

COPY public.posts (id, slug, created_at, updated_at, published_at, created_by_id, updated_by_id, title, excerpt, content, is_internal) FROM stdin;
3	preview	2022-05-24 11:06:39.515	2022-05-26 14:41:08.094	2022-05-24 11:06:43.182	1	1	Test CKEditor	CKEditor 4.18.0 comes with important security fixes for the HTML processing core module and dialog plugin and a browser patch.	<h1 style="margin-left:0px;text-align:center;">♔♔....Nguyễn Mai Phương</h1><p><a href="https://passion.cuongdc.co/2022/05/nguyen-mai-phuong.html#"><strong>MAY 22, 2022</strong></a></p><p style="margin-left:0px;">&nbsp;</p><p>&nbsp;</p><p><a href="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjyZVxjF-2XsQM7IekhtTTE6pf0opMhidee15iGLFAnmo-qFNOSlVEPwCz3qYCAPV-orcEWVPEfrveY53rLZn4sWZk8ZB098yUD_kwM47Xdn-7yx2RhggQ7iIffqbe-E7UbJo2yd5wDUGiD3sVdd-AQOHcmgSxbcyxqSwe9LaA-jR9uwq_O58LNGTp_Hw/s1600/52049283568_b684d82ce2_5k.jpg"><img src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjyZVxjF-2XsQM7IekhtTTE6pf0opMhidee15iGLFAnmo-qFNOSlVEPwCz3qYCAPV-orcEWVPEfrveY53rLZn4sWZk8ZB098yUD_kwM47Xdn-7yx2RhggQ7iIffqbe-E7UbJo2yd5wDUGiD3sVdd-AQOHcmgSxbcyxqSwe9LaA-jR9uwq_O58LNGTp_Hw/s1600/52049283568_b684d82ce2_5k.jpg" alt=""></a></p><p><a href="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgrGHP8LYgvAMTD85WgD5Z6KrpK1YWpdnRnjMfycfRx3ivVnl91lU3-inWJDMiVpwnEl2XBb9IqAZTmP7aZM7e5cze12eLKvWbFxZtdu4R3XwnnFQqpIVuWOpqyIc01y1ziNQumq-2tHAtb3wVMb6MNJx55LYVFge8aot7GHM9ui3OMXvUyX-ETFxxYMQ/s1600/52049482294_9946ef8854_6k.jpg"><img src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgrGHP8LYgvAMTD85WgD5Z6KrpK1YWpdnRnjMfycfRx3ivVnl91lU3-inWJDMiVpwnEl2XBb9IqAZTmP7aZM7e5cze12eLKvWbFxZtdu4R3XwnnFQqpIVuWOpqyIc01y1ziNQumq-2tHAtb3wVMb6MNJx55LYVFge8aot7GHM9ui3OMXvUyX-ETFxxYMQ/s1600/52049482294_9946ef8854_6k.jpg" alt=""></a></p><p><a href="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjQEuZKyGueGZFhrgdcOGTgIxLwjUOAyym-Gglcg_wBm0Oom06Y28SSvFeUXFzn5kJQiwGMqvQpS-lre1pIYioztG4Av_WCaj5QANOS39AwVOqXY1P-GFYTbUdlpqCzHh082d81fMTTPDtIvrQbuRY8gaelOBmjdUIRR0EnWujHgtPVLSdQ482R9RZXaQ/s1600/52049482449_d85bcfb10e_5k.jpg"><img src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjQEuZKyGueGZFhrgdcOGTgIxLwjUOAyym-Gglcg_wBm0Oom06Y28SSvFeUXFzn5kJQiwGMqvQpS-lre1pIYioztG4Av_WCaj5QANOS39AwVOqXY1P-GFYTbUdlpqCzHh082d81fMTTPDtIvrQbuRY8gaelOBmjdUIRR0EnWujHgtPVLSdQ482R9RZXaQ/s1600/52049482449_d85bcfb10e_5k.jpg" alt=""></a></p><p><a href="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiD2DUxGP8cDBDQgOJNSzYi1XrM7CZpSKg1-GUlJ9UUm96HOI0wlyWiyWNc-s3mWRn92-Rdtif_cLeSx-zhVRkXwJst5nNyGIjHSw4-vnpsnH_OdekFuaCT3Z70ZygO3MJVIOGDPd2UuISlIFQksco0KJlOYKPvUaatDNOMWQdKZPWcDWhZdhGBkd0pMw/s1600/52049744450_68c896c019_5k.jpg"><img src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiD2DUxGP8cDBDQgOJNSzYi1XrM7CZpSKg1-GUlJ9UUm96HOI0wlyWiyWNc-s3mWRn92-Rdtif_cLeSx-zhVRkXwJst5nNyGIjHSw4-vnpsnH_OdekFuaCT3Z70ZygO3MJVIOGDPd2UuISlIFQksco0KJlOYKPvUaatDNOMWQdKZPWcDWhZdhGBkd0pMw/s1600/52049744450_68c896c019_5k.jpg" alt=""></a></p><p><a href="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjNguAXArQhSLPGu78yPd91ZFO7MOgjKNvJHWUa4WIUf02S39upnKuZXM7wEJBJDinIml3sFHIv7dUuA69nXuRrMXZt4edg11btCUAM3jiffM49NrWUH_4aOvXhIa9mUAGo_9Fw3by_doSonbW66zh0fEMiK-BuOJS59YANI4ue6irybE7P1QFv2CWjUQ/s1600/52050339952_28b7b3a757_6k.jpg"><img src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjNguAXArQhSLPGu78yPd91ZFO7MOgjKNvJHWUa4WIUf02S39upnKuZXM7wEJBJDinIml3sFHIv7dUuA69nXuRrMXZt4edg11btCUAM3jiffM49NrWUH_4aOvXhIa9mUAGo_9Fw3by_doSonbW66zh0fEMiK-BuOJS59YANI4ue6irybE7P1QFv2CWjUQ/s1600/52050339952_28b7b3a757_6k.jpg" alt=""></a></p><p><a href="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiqnED59TxrPns5Z3fR8IJs3TeOdnpyCZeJ-zKsfDFZv1idxDtcZwkoiBd9gMhl6EonysHQHAzwCOSimgW_IzHS68LqOp-enMIh_GbziSgFSWFyXOxDqvw-Ykc_u2wDErnVOQU60nMyNPAQni1e9XZtFVQVVtXqxwhSTwtMze1FZyZ-r_ItMo4Q39WhvQ/s1600/52051391351_888ba0e028_5k.jpg"><img src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiqnED59TxrPns5Z3fR8IJs3TeOdnpyCZeJ-zKsfDFZv1idxDtcZwkoiBd9gMhl6EonysHQHAzwCOSimgW_IzHS68LqOp-enMIh_GbziSgFSWFyXOxDqvw-Ykc_u2wDErnVOQU60nMyNPAQni1e9XZtFVQVVtXqxwhSTwtMze1FZyZ-r_ItMo4Q39WhvQ/s1600/52051391351_888ba0e028_5k.jpg" alt=""></a></p><p><a href="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgCGkbSG6PAyXQFnpxBv6UyJP90CULfT1_z5ryA9g9zVz_ftvQvcYN3uCRPqsGpPpdeP2pLm4FbR2qRRWqXmmdFdT_9-Jt0r_0BeOjGsbanNrZ4Nx9KX5r54m1tc01L201RFWLbJijEF0i47lsS4HZtpQiEuUhq-7N_2OEH7nFzeuI38wWXWyImX9oDsQ/s1600/52051391396_c63348962a_5k.jpg"><img src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgCGkbSG6PAyXQFnpxBv6UyJP90CULfT1_z5ryA9g9zVz_ftvQvcYN3uCRPqsGpPpdeP2pLm4FbR2qRRWqXmmdFdT_9-Jt0r_0BeOjGsbanNrZ4Nx9KX5r54m1tc01L201RFWLbJijEF0i47lsS4HZtpQiEuUhq-7N_2OEH7nFzeuI38wWXWyImX9oDsQ/s1600/52051391396_c63348962a_5k.jpg" alt=""></a></p><p><a href="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiIRH-ed2lWPmfe4dmSCvqwAzWLRb0-qM7uFqZJ270V-sHOAhD866zU5KqzHa9bf2O-FzUaDoob5Lm7NzmLHt7bsr4VXS9GZcfQQUQFOxFWghByoNy3u07zyBkl5yBMWxcUxrvoIKJdodp2ZIi-37VxycBsPJ0-EJo-WIYzD6i-2EVuokSwf1J1mwDe7g/s1600/52051423308_d0a0dac310_6k.jpg"><img src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiIRH-ed2lWPmfe4dmSCvqwAzWLRb0-qM7uFqZJ270V-sHOAhD866zU5KqzHa9bf2O-FzUaDoob5Lm7NzmLHt7bsr4VXS9GZcfQQUQFOxFWghByoNy3u07zyBkl5yBMWxcUxrvoIKJdodp2ZIi-37VxycBsPJ0-EJo-WIYzD6i-2EVuokSwf1J1mwDe7g/s1600/52051423308_d0a0dac310_6k.jpg" alt=""></a></p><p><a href="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjlZlemwdBDcPZyadsA1CLTsrKSwZ3eXB7RVSxLX-T1Mbn3hTZNMXgxDYVExtvgioPdfWTpbTHkdHCjeKjuk6JHNSoZAJVq-MdqYCamD6v6n6kCgqpGrYD3i6QTkjc1T3rP3GhUID7G148krRQ_BklnJQedPwDyrjrrcMoqhcYDCOy1D1uK6UW49l8fsA/s1600/52051627959_a15124560d_5k.jpg"><img src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjlZlemwdBDcPZyadsA1CLTsrKSwZ3eXB7RVSxLX-T1Mbn3hTZNMXgxDYVExtvgioPdfWTpbTHkdHCjeKjuk6JHNSoZAJVq-MdqYCamD6v6n6kCgqpGrYD3i6QTkjc1T3rP3GhUID7G148krRQ_BklnJQedPwDyrjrrcMoqhcYDCOy1D1uK6UW49l8fsA/s1600/52051627959_a15124560d_5k.jpg" alt=""></a></p><p>&nbsp;</p>	\N
2	docker-cheatsheet	2022-05-24 10:28:02.494	2022-05-24 10:28:03.957	2022-05-24 10:28:03.953	1	1	Revision History now available with Real-time Collaboration in CKEditor 5	Revision History now available with Real-time Collaboration in CKEditor 5		\N
1	ubuntu-cheatsheet	2022-05-20 10:37:17.96	2022-05-25 10:37:09.027	2022-05-20 10:37:19.406	1	1	Ubuntu cheatsheet	\N	<h2 style="margin-left:0px;">Containers and microservices are two <i>huge</i>, emerging trends in software development today.</h2><p style="margin-left:0px;">Containers are a super cool way to package up your application, its dependencies, and configuration in a portable, easily distributable image file. A container image is a lightweight, stand-alone, executable package of a piece of software that includes everything needed to run it: code, runtime, system tools, system libraries, settings. Containers are an abstraction at the app layer that packages code and dependencies together.</p><p style="margin-left:0px;">&nbsp;</p><figure class="image image_resized" style="width:50%;"><img src="/uploads/1_Y2miw_Qa_Ljmpd_Sn_Xr_T5aj_WQ_2x_883370ef2a.png" alt="https://miro.medium.com/max/1400/1*Y2miwQaLjmpdSnXrT5ajWQ@2x.png" srcset="/uploads/thumbnail_1_Y2miw_Qa_Ljmpd_Sn_Xr_T5aj_WQ_2x_883370ef2a.png 174w,/uploads/small_1_Y2miw_Qa_Ljmpd_Sn_Xr_T5aj_WQ_2x_883370ef2a.png 500w,/uploads/medium_1_Y2miw_Qa_Ljmpd_Sn_Xr_T5aj_WQ_2x_883370ef2a.png 750w," sizes="100vw"><figcaption>Docker container</figcaption></figure><p>222222222222222222222222</p><p style="margin-left:0px;">Microservices represent an architectural style in which the system can be broken up into individual services, each one with a single, narrowly focused capability that is exposed with an API to the rest of the system as well as external consumers like web and mobile apps.</p><p style="margin-left:0px;"><strong>Software requirements</strong></p><ul><li><strong>Operating Systems</strong>: macOS (64-bit) Sierra</li><li>.NET Core SDK 2.1</li><li>Visual Studio Code 1.2x</li></ul><p><br>&nbsp;</p>	f
4	influxdb-grafana-danh-cho-metrics-va-logging	2022-05-26 10:34:03.514	2022-05-26 14:22:49.435	2022-05-26 10:34:05.988	1	1	InfluxDB + Grafana dành cho metrics và logging	\N	<h2>InfluxDB</h2><figure class="image image_resized" style="width:50%;"><img src="/uploads/1200px_Influxdb_logo_svg_4a22a71a86.png" alt="https://upload.wikimedia.org/wikipedia/commons/thumb/c/c6/Influxdb_logo.svg/1200px-Influxdb_logo.svg.png" srcset="/uploads/thumbnail_1200px_Influxdb_logo_svg_4a22a71a86.png 245w,/uploads/small_1200px_Influxdb_logo_svg_4a22a71a86.png 500w,/uploads/medium_1200px_Influxdb_logo_svg_4a22a71a86.png 750w,/uploads/large_1200px_Influxdb_logo_svg_4a22a71a86.png 1000w," sizes="100vw"></figure><p>&nbsp;</p><p><i><strong>InfluxDB </strong></i>là cơ sở dữ liệu lưu trữ theo chuỗi thời gian (time series database - TSDB)</p><blockquote><p><span style="background-color:rgb(255,255,255);color:rgb(77,81,86);font-family:arial, sans-serif;">“</span><i><strong>InfluxDB</strong></i><span style="background-color:rgb(255,255,255);color:rgb(77,81,86);font-family:arial, sans-serif;"> is a high-speed read and write database.</span></p></blockquote><p>&nbsp;</p><h3>Ưu điểm của <strong>InfluxDB</strong></h3><ul><li>Tốc độ đọc-ghi nhanh (nghe nói là vậy)</li><li>Có các câu query SQL tương đồng.</li><li>Hỗ trợ các HTTP req để thực thi các câu SQL.</li></ul><p>&nbsp;</p><h3>Các thành phần cơ bản của <strong>InfluxDB</strong></h3><ul><li>measurement<span style="font-size:17px;">: h</span>iểu đơn giản là nó tương tự như &nbsp;<strong>table </strong>trong RDB, nhưng khác ở chỗ là khóa chính của nó là field time.</li><li>tags: nó tương tự như <strong>column </strong>trong RBB, khác nó chỗ là được đánh index giúp cho việc truy xuất dữ liệu nhanh hơn.</li><li>value: cung tương tự như <strong>column</strong></li></ul><span lang="javascript" dir="undefined"><pre><code class="language-javascript">[\n    {\n        "measurement": "server_request",\n        "tags": {\n            "host": "server01",\n            "region": "us-west"\n        },\n        "time": "2009-11-10T23:00:00Z",\n        "fields": {\n            "value": 1997\n        }\n    }\n]\n</code></pre></span><p>Ở ví dụ trên, chúng ta có <strong>table </strong>server_request, gồm các column là: time (mặc định luôn có - khóa chính), host, region, và value.</p><p>Có một row dữ liệu là:</p><figure class="table"><table><tbody><tr><td>time</td><td>host</td><td>region</td><td>value</td></tr><tr><td>2009-11-10T23:00:00Z</td><td>server01</td><td>us-west</td><td>1997</td></tr></tbody></table></figure><h3>Cài đặt InfluxDB&nbsp;</h3><p>Cài đặt bằng docker-compose</p><p><code>docker-compose.ym</code></p><span lang="xml" dir="undefined"><pre><code class="language-xml">version: "3"\r\nservices:\r\n  influxdb:\r\n    image: influxdb:1.8\r\n    container_name: influxdb\r\n    restart: always\r\n    ports:\r\n      - 8086:8086\r\n    networks:\r\n      - influxdb_network\r\n    volumes:\r\n      - influxdb_data:/var/lib/influxdb\r\n    environment:\r\n      - INFLUXDB_DB=influxdb\r\n      - INFLUXDB_USER=influxdb\r\n      - INFLUXDB_USER_PASSWORD=password\r\n      - INFLUXDB_ADMIN_ENABLED=true\r\n      - INFLUXDB_ADMIN_USER=admin \r\n      - INFLUXDB_ADMIN_PASSWORD=password \r\nnetworks:\r\n  influxdb_network:\r\nvolumes:\r\n  influxdb_data:\r\n</code></pre></span><p>Chạy câu lệnh</p><span lang="python" dir="undefined"><pre><code class="language-python">$ docker-compose up -d</code></pre></span><h3>Thao tác với InfluxDB</h3><h4>Bằng cmd</h4><p>Chúng ta sẽ truy cập vào container <strong>influxdb</strong>&nbsp;</p><span lang="python" dir="undefined"><pre><code class="language-python">$ docker exec -it influxdb bash</code></pre></span><p>Sau khi đang ở container influxdb:</p><span lang="python" dir="undefined"><pre><code class="language-python">$ influx\n\n# xem tất cả database\n&gt; show databases;\n\n# để sử dụng một db nào đó\n&gt; use influxdb\n\n# xem tất cả measurement (table)\n&gt; show measurements;\n\n# xem data\n&gt; select * from server_request;\n\n# insert data\n&gt; insert server_request,host=serverA,region=us_west value=2002;</code></pre></span><h4>&nbsp;</h4><h4>Bằng http req</h4><span lang="python" dir="undefined"><pre><code class="language-python"># health check\n$ curl -XGET "localhost:8086/health"\n&gt;&gt; {"checks":[],"message":"ready for queries and writes","name":"influxdb","status":"pass","version":"1.8.10"}\n\n# query\n$ curl -G 'http://localhost:8086/query?db=influxdb' --data-urlencode 'q=SELECT * FROM "server_request"'\n&gt;&gt; {"results":[{"statement_id":0,"series":[{"name":"vertx_http_server_response_time","columns":["time","host","region","value"],"values":[["2022-05-25T09:50:57.56Z","server01","us-west",1997]]}]}]}\n\n# insert\n$ curl -i -XPOST "http://localhost:8086/write?db=influxdb&amp;precision=s" --data-binary 'server_request,host=serverA,region=us_west value=2002'\n&gt;&gt; \n\tHTTP/1.1 204 No Content\n\tContent-Type: application/json\n\tRequest-Id: 38c6336f-dcc4-11ec-9bad-0242c0a84002\n\tX-Influxdb-Build: OSS\n\tX-Influxdb-Version: 1.8.10\n\tX-Request-Id: 38c6336f-dcc4-11ec-9bad-0242c0a84002\n\tDate: Thu, 26 May 2022 07:19:46 GMT</code></pre></span><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><h2>Grafana</h2><figure class="image image_resized" style="width:50%;"><img src="/uploads/images_q_tbn_A_Nd9_Gc_SQ_6_UEZV_Pc_Q_f_E5_A_Ohcls_Y2_UG_3mo_Djw_Yhl_Le0_Rb_U_Mwn_GCA_7bpf_X7_d3_v_Mfbu_U4ef71_O_M_and_usqp_CAU_7cd05dcbf1" alt="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQ6UEZVPcQ_fE5AOhclsY2UG3moDjwYhlLe0RbUMwnGCA7bpfX7-d3-vMfbuU4ef71O_M&amp;usqp=CAU" srcset="/uploads/thumbnail_images_q_tbn_A_Nd9_Gc_SQ_6_UEZV_Pc_Q_f_E5_A_Ohcls_Y2_UG_3mo_Djw_Yhl_Le0_Rb_U_Mwn_GCA_7bpf_X7_d3_v_Mfbu_U4ef71_O_M_and_usqp_CAU_7cd05dcbf1 200w," sizes="100vw"></figure><p>Visualize dữ liệu.</p><p>&nbsp;</p>	f
\.


--
-- Data for Name: posts_author_links; Type: TABLE DATA; Schema: public; Owner: strost
--

COPY public.posts_author_links (post_id, user_id) FROM stdin;
2	1
1	1
4	1
3	1
\.


--
-- Data for Name: strapi_api_tokens; Type: TABLE DATA; Schema: public; Owner: strost
--

COPY public.strapi_api_tokens (id, name, description, type, access_key, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	webclient		read-only	30ebdbe3f8051bc609ccf116618932f4d90b9ba7962eb7827a93cedc1b3500d61bf935c6bd0f61619b5922af59dee7e6c4391071651d1c31e0223725dd55c892	2022-05-20 13:41:12.095	2022-05-20 13:41:15.692	\N	\N
\.


--
-- Data for Name: strapi_core_store_settings; Type: TABLE DATA; Schema: public; Owner: strost
--

COPY public.strapi_core_store_settings (id, key, value, type, environment, tag) FROM stdin;
2	plugin_content_manager_configuration_content_types::admin::permission	{"uid":"admin::permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"subject":{"edit":{"label":"subject","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"subject","searchable":true,"sortable":true}},"properties":{"edit":{"label":"properties","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"properties","searchable":false,"sortable":false}},"conditions":{"edit":{"label":"conditions","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"conditions","searchable":false,"sortable":false}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","subject","role"],"editRelations":["role"],"edit":[[{"name":"action","size":6},{"name":"subject","size":6}],[{"name":"properties","size":12}],[{"name":"conditions","size":12}]]}}	object	\N	\N
3	plugin_content_manager_configuration_content_types::admin::user	{"uid":"admin::user","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"firstname","defaultSortBy":"firstname","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"firstname":{"edit":{"label":"firstname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"firstname","searchable":true,"sortable":true}},"lastname":{"edit":{"label":"lastname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastname","searchable":true,"sortable":true}},"username":{"edit":{"label":"username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"username","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"password":{"edit":{"label":"password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"resetPasswordToken","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"resetPasswordToken","searchable":true,"sortable":true}},"registrationToken":{"edit":{"label":"registrationToken","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"registrationToken","searchable":true,"sortable":true}},"isActive":{"edit":{"label":"isActive","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isActive","searchable":true,"sortable":true}},"roles":{"edit":{"label":"roles","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"roles","searchable":false,"sortable":false}},"blocked":{"edit":{"label":"blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocked","searchable":true,"sortable":true}},"preferedLanguage":{"edit":{"label":"preferedLanguage","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"preferedLanguage","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","firstname","lastname","username"],"editRelations":["roles"],"edit":[[{"name":"firstname","size":6},{"name":"lastname","size":6}],[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"resetPasswordToken","size":6}],[{"name":"registrationToken","size":6},{"name":"isActive","size":4}],[{"name":"blocked","size":4},{"name":"preferedLanguage","size":6}]]}}	object	\N	\N
4	plugin_content_manager_configuration_content_types::admin::api-token	{"uid":"admin::api-token","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"accessKey":{"edit":{"label":"accessKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"accessKey","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","type"],"editRelations":[],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6},{"name":"accessKey","size":6}]]}}	object	\N	\N
5	plugin_content_manager_configuration_content_types::admin::role	{"uid":"admin::role","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"users":{"edit":{"label":"users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"firstname"},"list":{"label":"users","searchable":false,"sortable":false}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","description"],"editRelations":["users","permissions"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}],[{"name":"description","size":6}]]}}	object	\N	\N
6	plugin_content_manager_configuration_content_types::plugin::upload.file	{"uid":"plugin::upload.file","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"alternativeText":{"edit":{"label":"alternativeText","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"alternativeText","searchable":true,"sortable":true}},"caption":{"edit":{"label":"caption","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"caption","searchable":true,"sortable":true}},"width":{"edit":{"label":"width","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"width","searchable":true,"sortable":true}},"height":{"edit":{"label":"height","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"height","searchable":true,"sortable":true}},"formats":{"edit":{"label":"formats","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"formats","searchable":false,"sortable":false}},"hash":{"edit":{"label":"hash","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"hash","searchable":true,"sortable":true}},"ext":{"edit":{"label":"ext","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ext","searchable":true,"sortable":true}},"mime":{"edit":{"label":"mime","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"mime","searchable":true,"sortable":true}},"size":{"edit":{"label":"size","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"size","searchable":true,"sortable":true}},"url":{"edit":{"label":"url","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"url","searchable":true,"sortable":true}},"previewUrl":{"edit":{"label":"previewUrl","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"previewUrl","searchable":true,"sortable":true}},"provider":{"edit":{"label":"provider","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"provider","searchable":true,"sortable":true}},"provider_metadata":{"edit":{"label":"provider_metadata","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"provider_metadata","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","alternativeText","caption"],"editRelations":[],"edit":[[{"name":"name","size":6},{"name":"alternativeText","size":6}],[{"name":"caption","size":6},{"name":"width","size":4}],[{"name":"height","size":4}],[{"name":"formats","size":12}],[{"name":"hash","size":6},{"name":"ext","size":6}],[{"name":"mime","size":6},{"name":"size","size":4}],[{"name":"url","size":6},{"name":"previewUrl","size":6}],[{"name":"provider","size":6}],[{"name":"provider_metadata","size":12}]]}}	object	\N	\N
7	plugin_content_manager_configuration_content_types::plugin::i18n.locale	{"uid":"plugin::i18n.locale","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","createdAt"],"editRelations":[],"edit":[[{"name":"name","size":6},{"name":"code","size":6}]]}}	object	\N	\N
11	plugin_upload_settings	{"sizeOptimization":true,"responsiveDimensions":true,"autoOrientation":false}	object	\N	\N
9	plugin_content_manager_configuration_content_types::plugin::users-permissions.role	{"uid":"plugin::users-permissions.role","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"users":{"edit":{"label":"users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"users","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","type"],"editRelations":["permissions","users"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6}]]}}	object	\N	\N
10	plugin_content_manager_configuration_content_types::plugin::users-permissions.permission	{"uid":"plugin::users-permissions.permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","role","createdAt"],"editRelations":["role"],"edit":[[{"name":"action","size":6}]]}}	object	\N	\N
12	plugin_i18n_default_locale	"en"	string	\N	\N
13	plugin_users-permissions_grant	{"email":{"enabled":true,"icon":"envelope"},"discord":{"enabled":false,"icon":"discord","key":"","secret":"","callback":"api/auth/discord/callback","scope":["identify","email"]},"facebook":{"enabled":false,"icon":"facebook-square","key":"","secret":"","callback":"api/auth/facebook/callback","scope":["email"]},"google":{"enabled":false,"icon":"google","key":"","secret":"","callback":"api/auth/google/callback","scope":["email"]},"github":{"enabled":false,"icon":"github","key":"","secret":"","callback":"api/auth/github/callback","scope":["user","user:email"]},"microsoft":{"enabled":false,"icon":"windows","key":"","secret":"","callback":"api/auth/microsoft/callback","scope":["user.read"]},"twitter":{"enabled":false,"icon":"twitter","key":"","secret":"","callback":"api/auth/twitter/callback"},"instagram":{"enabled":false,"icon":"instagram","key":"","secret":"","callback":"api/auth/instagram/callback","scope":["user_profile"]},"vk":{"enabled":false,"icon":"vk","key":"","secret":"","callback":"api/auth/vk/callback","scope":["email"]},"twitch":{"enabled":false,"icon":"twitch","key":"","secret":"","callback":"api/auth/twitch/callback","scope":["user:read:email"]},"linkedin":{"enabled":false,"icon":"linkedin","key":"","secret":"","callback":"api/auth/linkedin/callback","scope":["r_liteprofile","r_emailaddress"]},"cognito":{"enabled":false,"icon":"aws","key":"","secret":"","subdomain":"my.subdomain.com","callback":"api/auth/cognito/callback","scope":["email","openid","profile"]},"reddit":{"enabled":false,"icon":"reddit","key":"","secret":"","state":true,"callback":"api/auth/reddit/callback","scope":["identity"]},"auth0":{"enabled":false,"icon":"","key":"","secret":"","subdomain":"my-tenant.eu","callback":"api/auth/auth0/callback","scope":["openid","email","profile"]},"cas":{"enabled":false,"icon":"book","key":"","secret":"","callback":"api/auth/cas/callback","scope":["openid email"],"subdomain":"my.subdomain.com/cas"}}	object	\N	\N
14	plugin_users-permissions_email	{"reset_password":{"display":"Email.template.reset_password","icon":"sync","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Reset password","message":"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>"}},"email_confirmation":{"display":"Email.template.email_confirmation","icon":"check-square","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Account confirmation","message":"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>"}}}	object	\N	\N
15	plugin_users-permissions_advanced	{"unique_email":true,"allow_register":true,"email_confirmation":false,"email_reset_password":null,"email_confirmation_redirection":null,"default_role":"authenticated"}	object	\N	\N
1	strapi_content_types_schema	{"admin::permission":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"}},"kind":"collectionType"},"modelType":"contentType","modelName":"permission","connection":"default","uid":"admin::permission","plugin":"admin","globalId":"AdminPermission"},"admin::user":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true},"resetPasswordToken":{"type":"string","configurable":false,"private":true},"registrationToken":{"type":"string","configurable":false,"private":true},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true},"resetPasswordToken":{"type":"string","configurable":false,"private":true},"registrationToken":{"type":"string","configurable":false,"private":true},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"user","connection":"default","uid":"admin::user","plugin":"admin","globalId":"AdminUser"},"admin::role":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"}},"kind":"collectionType"},"modelType":"contentType","modelName":"role","connection":"default","uid":"admin::role","plugin":"admin","globalId":"AdminRole"},"admin::api-token":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access"],"configurable":false,"required":false,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access"],"configurable":false,"required":false,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true}},"kind":"collectionType"},"modelType":"contentType","modelName":"api-token","connection":"default","uid":"admin::api-token","plugin":"admin","globalId":"AdminApiToken"},"api::post.post":{"kind":"collectionType","collectionName":"posts","info":{"singularName":"post","pluralName":"posts","displayName":"Post","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"slug":{"type":"uid"},"title":{"type":"string"},"excerpt":{"type":"text"},"content":{"type":"richtext"},"cover":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"]},"isInternal":{"type":"boolean"},"author":{"type":"relation","relation":"oneToOne","target":"plugin::users-permissions.user"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"posts","info":{"singularName":"post","pluralName":"posts","displayName":"Post","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"slug":{"type":"uid"},"title":{"type":"string"},"excerpt":{"type":"text"},"content":{"type":"richtext"},"cover":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"]},"isInternal":{"type":"boolean"},"author":{"type":"relation","relation":"oneToOne","target":"plugin::users-permissions.user"}},"kind":"collectionType"},"modelType":"contentType","modelName":"post","connection":"default","uid":"api::post.post","apiName":"post","globalId":"Post","actions":{},"lifecycles":{}},"plugin::upload.file":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"file","connection":"default","uid":"plugin::upload.file","plugin":"upload","globalId":"UploadFile"},"plugin::i18n.locale":{"info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"locale","connection":"default","uid":"plugin::i18n.locale","plugin":"i18n","collectionName":"i18n_locale","globalId":"I18NLocale"},"plugin::users-permissions.permission":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"permission","connection":"default","uid":"plugin::users-permissions.permission","plugin":"users-permissions","globalId":"UsersPermissionsPermission"},"plugin::users-permissions.role":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"role","connection":"default","uid":"plugin::users-permissions.role","plugin":"users-permissions","globalId":"UsersPermissionsRole"},"plugin::users-permissions.user":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"draftAndPublish":false,"timestamps":true},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true},"resetPasswordToken":{"type":"string","configurable":false,"private":true},"confirmationToken":{"type":"string","configurable":false,"private":true},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false},"picture":{"allowedTypes":["images","files","videos","audios"],"type":"media","multiple":false},"name":{"type":"string"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"config":{"attributes":{"resetPasswordToken":{"hidden":true},"confirmationToken":{"hidden":true},"provider":{"hidden":true}}},"kind":"collectionType","__filename__":"schema.json","__schema__":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"draftAndPublish":false,"timestamps":true},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true},"resetPasswordToken":{"type":"string","configurable":false,"private":true},"confirmationToken":{"type":"string","configurable":false,"private":true},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false},"picture":{"allowedTypes":["images","files","videos","audios"],"type":"media","multiple":false},"name":{"type":"string"}},"kind":"collectionType"},"modelType":"contentType","modelName":"user","connection":"default","uid":"plugin::users-permissions.user","plugin":"users-permissions","globalId":"UsersPermissionsUser"}}	object	\N	\N
8	plugin_content_manager_configuration_content_types::plugin::users-permissions.user	{"uid":"plugin::users-permissions.user","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"username","defaultSortBy":"username","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"username":{"edit":{"label":"username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"username","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"provider":{"edit":{"label":"provider","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"provider","searchable":true,"sortable":true}},"password":{"edit":{"label":"password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"resetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"resetPasswordToken","searchable":true,"sortable":true}},"confirmationToken":{"edit":{"label":"confirmationToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"confirmationToken","searchable":true,"sortable":true}},"confirmed":{"edit":{"label":"confirmed","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"confirmed","searchable":true,"sortable":true}},"blocked":{"edit":{"label":"blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocked","searchable":true,"sortable":true}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"picture":{"edit":{"label":"picture","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"picture","searchable":false,"sortable":false}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","username","email","confirmed"],"edit":[[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"confirmed","size":4}],[{"name":"blocked","size":4},{"name":"picture","size":6}],[{"name":"name","size":6}]],"editRelations":["role"]}}	object	\N	\N
16	core_admin_auth	{"providers":{"autoRegister":false,"defaultRole":null}}	object	\N	\N
18	plugin_documentation_config	{"restrictedAccess":false}	object	\N	\N
17	plugin_content_manager_configuration_content_types::api::post.post	{"uid":"api::post.post","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"slug":{"edit":{"label":"slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"slug","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"excerpt":{"edit":{"label":"excerpt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"excerpt","searchable":true,"sortable":true}},"content":{"edit":{"label":"content","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"content","searchable":false,"sortable":false}},"cover":{"edit":{"label":"cover","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"cover","searchable":false,"sortable":false}},"isInternal":{"edit":{"label":"isInternal","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isInternal","searchable":true,"sortable":true}},"author":{"edit":{"label":"author","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"author","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"edit":[[{"name":"slug","size":6}],[{"name":"title","size":6},{"name":"isInternal","size":4}],[{"name":"excerpt","size":6}],[{"name":"content","size":12}],[{"name":"cover","size":6}]],"editRelations":["author"],"list":["title","slug","createdAt","updatedAt"]}}	object	\N	\N
\.


--
-- Data for Name: strapi_database_schema; Type: TABLE DATA; Schema: public; Owner: strost
--

COPY public.strapi_database_schema (id, schema, "time", hash) FROM stdin;
5	{"tables":[{"name":"strapi_core_store_settings","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"value","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"environment","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"tag","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_webhooks","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"headers","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"events","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"enabled","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_permissions","indexes":[{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"subject","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"properties","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"conditions","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_users","indexes":[{"name":"admin_users_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"firstname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lastname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"registration_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_active","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"prefered_language","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_roles","indexes":[{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_tokens","indexes":[{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"access_key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"posts","indexes":[{"type":"unique","name":"posts_slug_unique","columns":["slug"]},{"name":"posts_created_by_id_fk","columns":["created_by_id"]},{"name":"posts_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"posts_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"posts_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false,"unique":true},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"excerpt","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"content","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_internal","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files","indexes":[{"name":"files_created_by_id_fk","columns":["created_by_id"]},{"name":"files_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"files_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"files_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"alternative_text","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"caption","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"width","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"height","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"formats","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"hash","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"ext","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"mime","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"size","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"preview_url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider_metadata","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"i18n_locale","indexes":[{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"]},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_permissions","indexes":[{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_roles","indexes":[{"name":"up_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_users","indexes":[{"name":"up_users_created_by_id_fk","columns":["created_by_id"]},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmation_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmed","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_permissions_role_links","indexes":[{"name":"admin_permissions_role_links_fk","columns":["permission_id"]},{"name":"admin_permissions_role_links_inv_fk","columns":["role_id"]}],"foreignKeys":[{"name":"admin_permissions_role_links_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"admin_permissions","onDelete":"CASCADE"},{"name":"admin_permissions_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_users_roles_links","indexes":[{"name":"admin_users_roles_links_fk","columns":["user_id"]},{"name":"admin_users_roles_links_inv_fk","columns":["role_id"]}],"foreignKeys":[{"name":"admin_users_roles_links_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"admin_users","onDelete":"CASCADE"},{"name":"admin_users_roles_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"posts_author_links","indexes":[{"name":"posts_author_links_fk","columns":["post_id"]},{"name":"posts_author_links_inv_fk","columns":["user_id"]}],"foreignKeys":[{"name":"posts_author_links_fk","columns":["post_id"],"referencedColumns":["id"],"referencedTable":"posts","onDelete":"CASCADE"},{"name":"posts_author_links_inv_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"}],"columns":[{"name":"post_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files_related_morphs","indexes":[{"name":"files_related_morphs_fk","columns":["file_id"]}],"foreignKeys":[{"name":"files_related_morphs_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"}],"columns":[{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_permissions_role_links","indexes":[{"name":"up_permissions_role_links_fk","columns":["permission_id"]},{"name":"up_permissions_role_links_inv_fk","columns":["role_id"]}],"foreignKeys":[{"name":"up_permissions_role_links_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"up_permissions","onDelete":"CASCADE"},{"name":"up_permissions_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_users_role_links","indexes":[{"name":"up_users_role_links_fk","columns":["user_id"]},{"name":"up_users_role_links_inv_fk","columns":["role_id"]}],"foreignKeys":[{"name":"up_users_role_links_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"},{"name":"up_users_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]}]}	2022-05-20 13:44:54.273	b28c33a67c7fe12ae7d62eecfbcb9011
\.


--
-- Data for Name: strapi_migrations; Type: TABLE DATA; Schema: public; Owner: strost
--

COPY public.strapi_migrations (id, name, "time") FROM stdin;
\.


--
-- Data for Name: strapi_webhooks; Type: TABLE DATA; Schema: public; Owner: strost
--

COPY public.strapi_webhooks (id, name, url, headers, events, enabled) FROM stdin;
\.


--
-- Data for Name: up_permissions; Type: TABLE DATA; Schema: public; Owner: strost
--

COPY public.up_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	plugin::users-permissions.auth.connect	2022-05-20 10:27:40.7	2022-05-20 10:27:40.7	\N	\N
2	plugin::users-permissions.user.me	2022-05-20 10:27:40.7	2022-05-20 10:27:40.7	\N	\N
5	plugin::users-permissions.auth.callback	2022-05-20 10:27:40.715	2022-05-20 10:27:40.715	\N	\N
8	plugin::users-permissions.auth.connect	2022-05-20 10:27:40.715	2022-05-20 10:27:40.715	\N	\N
10	plugin::users-permissions.user.me	2022-05-20 10:27:40.715	2022-05-20 10:27:40.715	\N	\N
11	plugin::users-permissions.auth.register	2022-05-20 10:27:40.715	2022-05-20 10:27:40.715	\N	\N
\.


--
-- Data for Name: up_permissions_role_links; Type: TABLE DATA; Schema: public; Owner: strost
--

COPY public.up_permissions_role_links (permission_id, role_id) FROM stdin;
1	1
2	1
5	2
10	2
11	2
8	2
\.


--
-- Data for Name: up_roles; Type: TABLE DATA; Schema: public; Owner: strost
--

COPY public.up_roles (id, name, description, type, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	Authenticated	Default role given to authenticated user.	authenticated	2022-05-20 10:27:40.69	2022-05-20 10:27:40.69	\N	\N
2	Public	Default role given to unauthenticated user.	public	2022-05-20 10:27:40.693	2022-05-20 10:27:40.693	\N	\N
\.


--
-- Data for Name: up_users; Type: TABLE DATA; Schema: public; Owner: strost
--

COPY public.up_users (id, username, email, provider, password, reset_password_token, confirmation_token, confirmed, blocked, created_at, updated_at, created_by_id, updated_by_id, name) FROM stdin;
1	tan.pham	tanpn@gmail.com	local	$2a$10$l.pYC45dpmAhIz0oc2KINemDVzYqJ1i7L3JHpJ6B7zDktI0BjafgG	\N	\N	f	f	2022-05-20 10:36:14.831	2022-05-20 13:49:39.099	1	1	tan.pham
\.


--
-- Data for Name: up_users_role_links; Type: TABLE DATA; Schema: public; Owner: strost
--

COPY public.up_users_role_links (user_id, role_id) FROM stdin;
1	2
\.


--
-- Name: admin_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strost
--

SELECT pg_catalog.setval('public.admin_permissions_id_seq', 76, true);


--
-- Name: admin_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strost
--

SELECT pg_catalog.setval('public.admin_roles_id_seq', 3, true);


--
-- Name: admin_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strost
--

SELECT pg_catalog.setval('public.admin_users_id_seq', 1, true);


--
-- Name: files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strost
--

SELECT pg_catalog.setval('public.files_id_seq', 8, true);


--
-- Name: i18n_locale_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strost
--

SELECT pg_catalog.setval('public.i18n_locale_id_seq', 1, true);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strost
--

SELECT pg_catalog.setval('public.posts_id_seq', 4, true);


--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strost
--

SELECT pg_catalog.setval('public.strapi_api_tokens_id_seq', 1, true);


--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strost
--

SELECT pg_catalog.setval('public.strapi_core_store_settings_id_seq', 18, true);


--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strost
--

SELECT pg_catalog.setval('public.strapi_database_schema_id_seq', 5, true);


--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strost
--

SELECT pg_catalog.setval('public.strapi_migrations_id_seq', 1, false);


--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strost
--

SELECT pg_catalog.setval('public.strapi_webhooks_id_seq', 1, false);


--
-- Name: up_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strost
--

SELECT pg_catalog.setval('public.up_permissions_id_seq', 11, true);


--
-- Name: up_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strost
--

SELECT pg_catalog.setval('public.up_roles_id_seq', 2, true);


--
-- Name: up_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strost
--

SELECT pg_catalog.setval('public.up_users_id_seq', 1, true);


--
-- Name: admin_permissions admin_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_pkey PRIMARY KEY (id);


--
-- Name: admin_roles admin_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_pkey PRIMARY KEY (id);


--
-- Name: admin_users admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- Name: files files_pkey; Type: CONSTRAINT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);


--
-- Name: i18n_locale i18n_locale_pkey; Type: CONSTRAINT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: posts posts_slug_unique; Type: CONSTRAINT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_slug_unique UNIQUE (slug);


--
-- Name: strapi_api_tokens strapi_api_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_pkey PRIMARY KEY (id);


--
-- Name: strapi_core_store_settings strapi_core_store_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.strapi_core_store_settings
    ADD CONSTRAINT strapi_core_store_settings_pkey PRIMARY KEY (id);


--
-- Name: strapi_database_schema strapi_database_schema_pkey; Type: CONSTRAINT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.strapi_database_schema
    ADD CONSTRAINT strapi_database_schema_pkey PRIMARY KEY (id);


--
-- Name: strapi_migrations strapi_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.strapi_migrations
    ADD CONSTRAINT strapi_migrations_pkey PRIMARY KEY (id);


--
-- Name: strapi_webhooks strapi_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.strapi_webhooks
    ADD CONSTRAINT strapi_webhooks_pkey PRIMARY KEY (id);


--
-- Name: up_permissions up_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_pkey PRIMARY KEY (id);


--
-- Name: up_roles up_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_pkey PRIMARY KEY (id);


--
-- Name: up_users up_users_pkey; Type: CONSTRAINT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: strost
--

CREATE INDEX admin_permissions_created_by_id_fk ON public.admin_permissions USING btree (created_by_id);


--
-- Name: admin_permissions_role_links_fk; Type: INDEX; Schema: public; Owner: strost
--

CREATE INDEX admin_permissions_role_links_fk ON public.admin_permissions_role_links USING btree (permission_id);


--
-- Name: admin_permissions_role_links_inv_fk; Type: INDEX; Schema: public; Owner: strost
--

CREATE INDEX admin_permissions_role_links_inv_fk ON public.admin_permissions_role_links USING btree (role_id);


--
-- Name: admin_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strost
--

CREATE INDEX admin_permissions_updated_by_id_fk ON public.admin_permissions USING btree (updated_by_id);


--
-- Name: admin_roles_created_by_id_fk; Type: INDEX; Schema: public; Owner: strost
--

CREATE INDEX admin_roles_created_by_id_fk ON public.admin_roles USING btree (created_by_id);


--
-- Name: admin_roles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strost
--

CREATE INDEX admin_roles_updated_by_id_fk ON public.admin_roles USING btree (updated_by_id);


--
-- Name: admin_users_created_by_id_fk; Type: INDEX; Schema: public; Owner: strost
--

CREATE INDEX admin_users_created_by_id_fk ON public.admin_users USING btree (created_by_id);


--
-- Name: admin_users_roles_links_fk; Type: INDEX; Schema: public; Owner: strost
--

CREATE INDEX admin_users_roles_links_fk ON public.admin_users_roles_links USING btree (user_id);


--
-- Name: admin_users_roles_links_inv_fk; Type: INDEX; Schema: public; Owner: strost
--

CREATE INDEX admin_users_roles_links_inv_fk ON public.admin_users_roles_links USING btree (role_id);


--
-- Name: admin_users_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strost
--

CREATE INDEX admin_users_updated_by_id_fk ON public.admin_users USING btree (updated_by_id);


--
-- Name: files_created_by_id_fk; Type: INDEX; Schema: public; Owner: strost
--

CREATE INDEX files_created_by_id_fk ON public.files USING btree (created_by_id);


--
-- Name: files_related_morphs_fk; Type: INDEX; Schema: public; Owner: strost
--

CREATE INDEX files_related_morphs_fk ON public.files_related_morphs USING btree (file_id);


--
-- Name: files_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strost
--

CREATE INDEX files_updated_by_id_fk ON public.files USING btree (updated_by_id);


--
-- Name: i18n_locale_created_by_id_fk; Type: INDEX; Schema: public; Owner: strost
--

CREATE INDEX i18n_locale_created_by_id_fk ON public.i18n_locale USING btree (created_by_id);


--
-- Name: i18n_locale_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strost
--

CREATE INDEX i18n_locale_updated_by_id_fk ON public.i18n_locale USING btree (updated_by_id);


--
-- Name: posts_author_links_fk; Type: INDEX; Schema: public; Owner: strost
--

CREATE INDEX posts_author_links_fk ON public.posts_author_links USING btree (post_id);


--
-- Name: posts_author_links_inv_fk; Type: INDEX; Schema: public; Owner: strost
--

CREATE INDEX posts_author_links_inv_fk ON public.posts_author_links USING btree (user_id);


--
-- Name: posts_created_by_id_fk; Type: INDEX; Schema: public; Owner: strost
--

CREATE INDEX posts_created_by_id_fk ON public.posts USING btree (created_by_id);


--
-- Name: posts_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strost
--

CREATE INDEX posts_updated_by_id_fk ON public.posts USING btree (updated_by_id);


--
-- Name: strapi_api_tokens_created_by_id_fk; Type: INDEX; Schema: public; Owner: strost
--

CREATE INDEX strapi_api_tokens_created_by_id_fk ON public.strapi_api_tokens USING btree (created_by_id);


--
-- Name: strapi_api_tokens_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strost
--

CREATE INDEX strapi_api_tokens_updated_by_id_fk ON public.strapi_api_tokens USING btree (updated_by_id);


--
-- Name: up_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: strost
--

CREATE INDEX up_permissions_created_by_id_fk ON public.up_permissions USING btree (created_by_id);


--
-- Name: up_permissions_role_links_fk; Type: INDEX; Schema: public; Owner: strost
--

CREATE INDEX up_permissions_role_links_fk ON public.up_permissions_role_links USING btree (permission_id);


--
-- Name: up_permissions_role_links_inv_fk; Type: INDEX; Schema: public; Owner: strost
--

CREATE INDEX up_permissions_role_links_inv_fk ON public.up_permissions_role_links USING btree (role_id);


--
-- Name: up_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strost
--

CREATE INDEX up_permissions_updated_by_id_fk ON public.up_permissions USING btree (updated_by_id);


--
-- Name: up_roles_created_by_id_fk; Type: INDEX; Schema: public; Owner: strost
--

CREATE INDEX up_roles_created_by_id_fk ON public.up_roles USING btree (created_by_id);


--
-- Name: up_roles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strost
--

CREATE INDEX up_roles_updated_by_id_fk ON public.up_roles USING btree (updated_by_id);


--
-- Name: up_users_created_by_id_fk; Type: INDEX; Schema: public; Owner: strost
--

CREATE INDEX up_users_created_by_id_fk ON public.up_users USING btree (created_by_id);


--
-- Name: up_users_role_links_fk; Type: INDEX; Schema: public; Owner: strost
--

CREATE INDEX up_users_role_links_fk ON public.up_users_role_links USING btree (user_id);


--
-- Name: up_users_role_links_inv_fk; Type: INDEX; Schema: public; Owner: strost
--

CREATE INDEX up_users_role_links_inv_fk ON public.up_users_role_links USING btree (role_id);


--
-- Name: up_users_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strost
--

CREATE INDEX up_users_updated_by_id_fk ON public.up_users USING btree (updated_by_id);


--
-- Name: admin_permissions admin_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_permissions_role_links admin_permissions_role_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_fk FOREIGN KEY (permission_id) REFERENCES public.admin_permissions(id) ON DELETE CASCADE;


--
-- Name: admin_permissions_role_links admin_permissions_role_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;


--
-- Name: admin_permissions admin_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_roles admin_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_roles admin_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_users admin_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_users_roles_links admin_users_roles_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_fk FOREIGN KEY (user_id) REFERENCES public.admin_users(id) ON DELETE CASCADE;


--
-- Name: admin_users_roles_links admin_users_roles_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;


--
-- Name: admin_users admin_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: files files_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: files_related_morphs files_related_morphs_fk; Type: FK CONSTRAINT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.files_related_morphs
    ADD CONSTRAINT files_related_morphs_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- Name: files files_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: i18n_locale i18n_locale_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: i18n_locale i18n_locale_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: posts_author_links posts_author_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.posts_author_links
    ADD CONSTRAINT posts_author_links_fk FOREIGN KEY (post_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: posts_author_links posts_author_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.posts_author_links
    ADD CONSTRAINT posts_author_links_inv_fk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;


--
-- Name: posts posts_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: posts posts_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_tokens strapi_api_tokens_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_tokens strapi_api_tokens_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_permissions up_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_permissions_role_links up_permissions_role_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_fk FOREIGN KEY (permission_id) REFERENCES public.up_permissions(id) ON DELETE CASCADE;


--
-- Name: up_permissions_role_links up_permissions_role_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;


--
-- Name: up_permissions up_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_roles up_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_roles up_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_users up_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_users_role_links up_users_role_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_fk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;


--
-- Name: up_users_role_links up_users_role_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;


--
-- Name: up_users up_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strost
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

