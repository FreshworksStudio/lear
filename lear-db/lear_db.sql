--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6
-- Dumped by pg_dump version 10.6
CREATE USER "userG5G" with SUPERUSER;
CREATE DATABASE legal_test OWNER "userG5G";
\c legal_test
SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
-- SELECT pg_catalog.set_config('search_path', '', false);
SET search_path=legal_test;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: addresses; Type: TABLE; Schema: public; Owner: userG5G
--

CREATE TABLE public.addresses (
    id integer NOT NULL,
    address_type character varying(4096),
    street character varying(4096),
    street_additional character varying(4096),
    city character varying(4096),
    region character varying(4096),
    country character varying(2),
    postal_code character varying(10),
    delivery_instructions character varying(4096),
    business_id integer
);


ALTER TABLE public.addresses OWNER TO "userG5G";

--
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: userG5G
--

CREATE SEQUENCE public.addresses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.addresses_id_seq OWNER TO "userG5G";

--
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userG5G
--

ALTER SEQUENCE public.addresses_id_seq OWNED BY public.addresses.id;


--
-- Name: addresses_version; Type: TABLE; Schema: public; Owner: userG5G
--

CREATE TABLE public.addresses_version (
    id integer NOT NULL,
    address_type character varying(4096),
    street character varying(4096),
    street_additional character varying(4096),
    city character varying(4096),
    region character varying(4096),
    country character varying(2),
    postal_code character varying(10),
    delivery_instructions character varying(4096),
    business_id integer,
    transaction_id bigint NOT NULL,
    end_transaction_id bigint,
    operation_type smallint NOT NULL
);


ALTER TABLE public.addresses_version OWNER TO "userG5G";

--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: userG5G
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO "userG5G";

--
-- Name: businesses; Type: TABLE; Schema: public; Owner: userG5G
--

CREATE TABLE public.businesses (
    id integer NOT NULL,
    last_modified timestamp with time zone,
    last_ledger_id integer,
    last_remote_ledger_id integer,
    last_ar_date timestamp with time zone,
    legal_name character varying(1000),
    founding_date timestamp with time zone,
    dissolution_date timestamp with time zone,
    identifier character varying(10),
    tax_id character varying(15),
    fiscal_year_end_date timestamp with time zone,
    submitter_userid integer,
    last_agm_date timestamp with time zone,
    last_ledger_timestamp timestamp with time zone,
<<<<<<< HEAD
    legal_type character varying(10)
=======
    legal_type  character varying(10)
>>>>>>> Implemented EntityFilter. Unit Testing. Updated AR component
);


ALTER TABLE public.businesses OWNER TO "userG5G";

--
-- Name: businesses_id_seq; Type: SEQUENCE; Schema: public; Owner: userG5G
--

CREATE SEQUENCE public.businesses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.businesses_id_seq OWNER TO "userG5G";

--
-- Name: businesses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userG5G
--

ALTER SEQUENCE public.businesses_id_seq OWNED BY public.businesses.id;


--
-- Name: businesses_version; Type: TABLE; Schema: public; Owner: userG5G
--

CREATE TABLE public.businesses_version (
    id integer NOT NULL,
    last_modified timestamp with time zone,
    last_ledger_id integer,
    last_remote_ledger_id integer,
    last_ar_date timestamp with time zone,
    legal_name character varying(1000),
    founding_date timestamp with time zone,
    dissolution_date timestamp with time zone,
    identifier character varying(10),
    tax_id character varying(15),
    fiscal_year_end_date timestamp with time zone,
    submitter_userid integer,
    transaction_id bigint NOT NULL,
    end_transaction_id bigint,
    operation_type smallint NOT NULL,
    last_agm_date timestamp with time zone,
    last_ledger_timestamp timestamp with time zone,
<<<<<<< HEAD
    legal_type character varying(10)
=======
    legal_type  character varying(10)
>>>>>>> Implemented EntityFilter. Unit Testing. Updated AR component
);


ALTER TABLE public.businesses_version OWNER TO "userG5G";

--
-- Name: colin_last_update; Type: TABLE; Schema: public; Owner: userG5G
--

CREATE TABLE public.colin_last_update (
    id integer NOT NULL,
    last_update timestamp with time zone,
    last_event_id integer NOT NULL
);


ALTER TABLE public.colin_last_update OWNER TO "userG5G";

--
-- Name: colin_last_update_id_seq; Type: SEQUENCE; Schema: public; Owner: userG5G
--

CREATE SEQUENCE public.colin_last_update_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.colin_last_update_id_seq OWNER TO "userG5G";

--
-- Name: colin_last_update_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userG5G
--

ALTER SEQUENCE public.colin_last_update_id_seq OWNED BY public.colin_last_update.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: userG5G
--

CREATE TABLE public.comments (
    id integer NOT NULL,
    comment character varying(4096),
    "timestamp" timestamp with time zone,
    business_id integer,
    staff_id integer
);


ALTER TABLE public.comments OWNER TO "userG5G";

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: userG5G
--

CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO "userG5G";

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userG5G
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: directors; Type: TABLE; Schema: public; Owner: userG5G
--

CREATE TABLE public.directors (
    id integer NOT NULL,
    first_name character varying(1000),
    middle_initial character varying(1000),
    last_name character varying(1000),
    title character varying(1000),
    appointment_date timestamp with time zone,
    cessation_date timestamp with time zone,
    business_id integer,
    address_id integer
);


ALTER TABLE public.directors OWNER TO "userG5G";

--
-- Name: directors_id_seq; Type: SEQUENCE; Schema: public; Owner: userG5G
--

CREATE SEQUENCE public.directors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directors_id_seq OWNER TO "userG5G";

--
-- Name: directors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userG5G
--

ALTER SEQUENCE public.directors_id_seq OWNED BY public.directors.id;


--
-- Name: directors_version; Type: TABLE; Schema: public; Owner: userG5G
--

CREATE TABLE public.directors_version (
    id integer NOT NULL,
    first_name character varying(1000),
    middle_initial character varying(1000),
    last_name character varying(1000),
    title character varying(1000),
    appointment_date timestamp with time zone,
    cessation_date timestamp with time zone,
    business_id integer,
    address_id integer,
    transaction_id bigint NOT NULL,
    end_transaction_id bigint,
    operation_type smallint NOT NULL
);


ALTER TABLE public.directors_version OWNER TO "userG5G";

--
-- Name: filings; Type: TABLE; Schema: public; Owner: userG5G
--

CREATE TABLE public.filings (
    id integer NOT NULL,
    filing_date timestamp with time zone,
    filing_type character varying(30),
    filing_json jsonb,
    payment_id character varying(4096),
    transaction_id bigint,
    business_id integer,
    submitter_id integer,
    colin_event_id integer,
    status character varying(10),
    payment_completion_date timestamp with time zone
);


ALTER TABLE public.filings OWNER TO "userG5G";

--
-- Name: filings_id_seq; Type: SEQUENCE; Schema: public; Owner: userG5G
--

CREATE SEQUENCE public.filings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.filings_id_seq OWNER TO "userG5G";

--
-- Name: filings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userG5G
--

ALTER SEQUENCE public.filings_id_seq OWNED BY public.filings.id;


--
-- Name: transaction; Type: TABLE; Schema: public; Owner: userG5G
--

CREATE TABLE public.transaction (
    issued_at timestamp without time zone,
    id bigint NOT NULL,
    remote_addr character varying(50)
);


ALTER TABLE public.transaction OWNER TO "userG5G";

--
-- Name: transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: userG5G
--

CREATE SEQUENCE public.transaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transaction_id_seq OWNER TO "userG5G";

--
-- Name: transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userG5G
--

ALTER SEQUENCE public.transaction_id_seq OWNED BY public.transaction.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: userG5G
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(1000),
    firstname character varying(1000),
    lastname character varying(1000),
    email character varying(1024),
    sub character varying(36),
    iss character varying(1024),
    creation_date timestamp with time zone
);


ALTER TABLE public.users OWNER TO "userG5G";

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: userG5G
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO "userG5G";

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userG5G
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: users_version; Type: TABLE; Schema: public; Owner: userG5G
--

CREATE TABLE public.users_version (
    id integer NOT NULL,
    username character varying(1000),
    firstname character varying(1000),
    lastname character varying(1000),
    email character varying(1024),
    sub character varying(36),
    iss character varying(1024),
    creation_date timestamp with time zone,
    transaction_id bigint NOT NULL,
    end_transaction_id bigint,
    operation_type smallint NOT NULL
);


ALTER TABLE public.users_version OWNER TO "userG5G";

--
-- Name: addresses id; Type: DEFAULT; Schema: public; Owner: userG5G
--

ALTER TABLE ONLY public.addresses ALTER COLUMN id SET DEFAULT nextval('public.addresses_id_seq'::regclass);


--
-- Name: businesses id; Type: DEFAULT; Schema: public; Owner: userG5G
--

ALTER TABLE ONLY public.businesses ALTER COLUMN id SET DEFAULT nextval('public.businesses_id_seq'::regclass);


--
-- Name: colin_last_update id; Type: DEFAULT; Schema: public; Owner: userG5G
--

ALTER TABLE ONLY public.colin_last_update ALTER COLUMN id SET DEFAULT nextval('public.colin_last_update_id_seq'::regclass);


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: userG5G
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: directors id; Type: DEFAULT; Schema: public; Owner: userG5G
--

ALTER TABLE ONLY public.directors ALTER COLUMN id SET DEFAULT nextval('public.directors_id_seq'::regclass);


--
-- Name: filings id; Type: DEFAULT; Schema: public; Owner: userG5G
--

ALTER TABLE ONLY public.filings ALTER COLUMN id SET DEFAULT nextval('public.filings_id_seq'::regclass);


--
-- Name: transaction id; Type: DEFAULT; Schema: public; Owner: userG5G
--

ALTER TABLE ONLY public.transaction ALTER COLUMN id SET DEFAULT nextval('public.transaction_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: userG5G
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: userG5G
--

COPY public.addresses (id, address_type, street, street_additional, city, region, country, postal_code, delivery_instructions, business_id) FROM stdin;
829	mailing	549 11TH AVENUE		CASTLEGAR	BC	CA	V1N 1J6		99
830	delivery	549 11TH AVENUE		CASTLEGAR	BC	CA	V1N 1J6		99
831	delivery	168 CRESCENT STREET		CASTLEGAR	BC	CA	V1N1B1		\N
832	delivery	279-3385 UPPER LEVELS RD		ROBSON	BC	CA	V0G1X0		\N
833	delivery	1037 RASPBERRY ROAD		CASTLEGAR	BC	CA	V1N4T7		\N
834	delivery	27-3969 BROADWATER RD		CASTLEGAR	BC	CA	V1N4V5		\N
835	delivery	3814-5TH AVE		CASTLEGAR	BC	CA	V1N4Y5		\N
836	delivery	1061 BRIDGEVIEW CRESCENT		CASTLEGAR	BC	CA	V1N4L1		\N
837	delivery	3708-5TH AVENUE		CASTLEGAR	BC	CA	V1N4Y3		\N
838	delivery	208, 825 MERRY CREEK ROAD		CASTLEGAR	BC	CA	V1N2P1		\N
839	mailing	3045 UNIT A JACKSON ST		VICTORIA	BC	CA	V8T 3Z7		100
840	delivery	3045 UNIT A JACKSON ST		VICTORIA	BC	CA	V8T 3Z7		100
841	delivery	38-1120 SUMMIT AVE.		VICTORIA	BC	CA	V8T2P6		\N
842	delivery	11-3045 JACKSON ST.		VICTORIA	BC	CA	V8T3Z7		\N
843	delivery	27 - 3045 JACKSON ST		VICTORIA	BC	CA	V8T3Z7		\N
844	delivery	12-1120 SUMMIT AVE.		VICTORIA	BC	CA	V8T2P6		\N
845	delivery	29-3045 JACKSON ST		VICTORIA	BC	CA	V8T3Z7		\N
846	delivery	32-1120 SUMMIT AVE.		VICTORIA	BC	CA	V8T2P6		\N
847	delivery	10-1120 SUMMIT AVE.		VICTORIA	BC	CA	V8T2P6		\N
848	mailing	502 - 373 BURNSIDE RD. E.		VICTORIA	BC	CA	V9A 1A7		101
849	delivery	502 - 373 BURNSIDE RD. E.		VICTORIA	BC	CA	V9A 1A7		101
850	delivery	3-3136 WASHINGTON AVE		VICTORIA	BC	CA	V9A1P6		\N
851	delivery	101-373 BURNSIDE RD, EAST		VICTORIA	BC	CA	V9A1A7		\N
852	delivery	1-3142 WASHINGTON AVE		VICTORIA	BC	CA	V9A1P6		\N
853	delivery	202 - 373 BURNSIDE ROAD EAST		VICTORIA	BC	CA	V9A1A7		\N
854	delivery	303-373 BURNSIDE RD, EAST		VICTORIA	BC	CA	V9A1A7		\N
855	delivery	301-373 BURNSIDE RD, EAST		VICTORIA	BC	CA	V9A1A7		\N
856	delivery	106-373 BURNSIDE ROAD E		VICTORIA	BC	CA	V9A1A7		\N
857	delivery	103-373 BURNSIDE RD. EAST		VICTORIA	BC	CA	V9A1A7		\N
858	mailing	25 - 7365 CEDAR ST.		MISSION	BC	CA	V2V 5S7		102
859	delivery	25 - 7365 CEDAR ST.		MISSION	BC	CA	V2V 5S7		102
860	delivery	58-7365 CEDAR ST		MISSION	BC	CA	V2V5S7		\N
861	delivery	44-7365 CEDAR STREET		MISSION	BC	CA	V2V5S7		\N
862	delivery	33 - 7365 CEDAR ST		MISSION	BC	CA	V2V5S7		\N
863	delivery	31 - 7365 CEDAR ST		MISSION	BC	CA	V2V5S7		\N
864	delivery	53-7365 CEDAR ST		MISSION	BC	CA	V2V5S7		\N
865	delivery	#33 - 7365 CEDAR ST.		MISSION	BC	CA	V2V5S7		\N
866	delivery	65-7365 CEDAR ST		MISSION	BC	CA	V2V5S7		\N
867	delivery	87 7365 CEDAR STREET		MISSION	BC	CA	V2V5S7		\N
868	delivery	1-7365 CEDAR STREET		MISSION	BC	CA	V2V5S7		\N
869	mailing	777 BAKER STREET		NELSON	BC	CA	V1L 4H4		103
870	delivery	777 BAKER STREET		NELSON	BC	CA	V1L 4H4		103
871	delivery	710 FELLER RD		NELSON	BC	CA	V1L4B7		\N
872	delivery	3642 MOUNTAINVIEW RD		BONNINGTON	BC	CA	V0G2G3		\N
873	delivery	233 D AVENUE		KASLO	BC	CA	V0G1M0		\N
874	delivery	6724 HARROP-PROCTOR ROAD		NELSON	BC	CA	V1L6R2		\N
875	delivery	206 DELBRUCK ST		NELSON	BC	CA	V1L5L1		\N
876	delivery	4-916 EDGEWOOD AVE		NELSON	BC	CA	V1L4C9		\N
877	delivery	203-622 FRONT STREET		NELSON	BC	CA	V1L4B7		\N
878	delivery	4761 BEASLEY ROAD		SOUTH SLOCAN	BC	CA	V0G2G2		\N
879	mailing	BOX 45		VANCOUVER	BC	CA	V6E 1V9		104
880	delivery	784 THURLOW STREET		VANCOUVER	BC	CA	V6E 1V9		104
881	delivery	28-784 THURLOW ST		VANCOUVER	BC	CA	V6E1V9		\N
882	delivery	14 - 787 THURLOW STREET		VANCOUVER	BC	CA	V6E1V9		\N
883	delivery	2 - 784 THURLOW STREET		VANCOUVER	BC	CA	V6E1V9		\N
884	delivery	29 - 784 THURLOW STREET		VANCOUVER	BC	CA	V6E1V9		\N
885	delivery	40 - 784 THURLOW STREET		VANCOUVER	BC	CA	V6E1V9		\N
886	delivery	41 - 784 THURLOW STREET		VANCOUVER	BC	CA	V6E1V9		\N
887	delivery	27 - 784 THURLOW STREET		VANCOUVER	BC	CA	V6E1V9		\N
888	delivery	25 - 784 THURLOW STREET		VACOUVER	BC	CA	V6E1V9		\N
889	mailing	7122-138TH STREET		SURREY	BC	CA	V3W 7V7		105
890	delivery	7122-138TH STREET		SURREY	BC	CA	V3W 7V7		105
891	delivery	209-7102 138TH STREET		SURREY	BC	CA	V3W7V7		\N
892	delivery	70-7158 138TH ST		SURREY	BC	CA	V3W7V7		\N
893	delivery	204 - 7102 138TH ST		SURREY	BC	CA	V3W7V8		\N
894	delivery	105, 7102 - 138 STREET		SURREY	BC	CA	V3W7V8		\N
895	delivery	53 - 7150 - 138TH STREET		SURREY	BC	CA	V3W7V8		\N
896	delivery	208-7102 138TH STREET		SURREY	BC	CA	V3W7V6		\N
897	delivery	54-7150 138TH STREET		SURREY	BC	CA	V3W7V7		\N
898	delivery	33 - 7134 - 138TH STREET		SURREY	BC	CA	V3W7V7		\N
899	delivery	205-7102-138TH ST		SURREY	BC	CA	V3W7V8		\N
900	mailing	#106-4221 MAYBERRY STREET		BURNABY	BC	CA	V5H 4E8		106
901	delivery	#106-4221 MAYBERRY STREET		BURNABY	BC	CA	V5H 4E8		106
902	delivery	#1601 - 4221 MAYBERRY STREET		BURNABY	BC	CA	V5H4E8		\N
903	delivery	1003 - 4221 MAYBERRY STREET		BURNABY	BC	CA	V5H4E8		\N
904	delivery	#0201 - 4221 MAYBERRY STREET		BURNABY	BC	CA	V5H4E8		\N
905	delivery	#1506-4221 MAYBERRY STREET		BURNABY	BC	CA	V5H4E8		\N
906	delivery	1905 - 4221 MAYBERRY STREET		BURNABY	BC	CA	V5H4E8		\N
907	delivery	1505-4221 MAYBERRY STREET		BURNABYBC	BC	CA	V5H4E8		\N
908	delivery	1504-4221 MAYBERRY STREET		BURNABY	BC	CA	V5H4E8		\N
909	mailing	81 - 1415 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H 3W1		107
910	delivery	81 - 1415 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H 3W1		107
911	delivery	56-1415 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H3W1		\N
912	delivery	12-1415 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H3W1		\N
913	delivery	5-1465 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H3W1		\N
914	delivery	1-1415 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H3W1		\N
915	delivery	7-1465 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H3W1		\N
916	delivery	10 1415 LAMEY'S MILL RD		VANCOUVER	BC	CA	V6H3W1		\N
917	delivery	3-1415 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H3W1		\N
918	delivery	38-1415 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H3W1		\N
919	mailing	1707 - 130TH ST.		SURREY	BC	CA	V4A 4A2		108
920	delivery	1707 - 130TH ST.		SURREY	BC	CA	V4A 4A2		108
921	delivery	111-1701 130TH STREET		SURREY	BC	CA	V4A4A2		\N
922	delivery	103-1739 130TH STREET		SURREY	BC	CA	V4A4A2		\N
923	delivery	110-1701 130TH STREET		SURREY	BC	CA	V4A4A2		\N
924	delivery	106-1747 130TH STREET		SURREY	BC	CA	V4A4A2		\N
925	delivery	106-1715 130TH STREET		SURREY	BC	CA	V4A4A2		\N
926	delivery	103-1703 130TH STREET		SURREY	BC	CA	V4A4A2		\N
927	delivery	102-1717 130TH STREET		SURREY	BC	CA	V4A4A2		\N
928	delivery	108-1739 130TH STREET		SURREY	BC	CA	V4A4A2		\N
929	delivery	106-1739 130TH STREET		SURREY	BC	CA	V4A4A2		\N
930	mailing	8303 - 92 AVE		FORT ST JOHN	BC	CA	V1J 6C7		109
931	delivery	8303 - 92 AVE		FORT ST JOHN	BC	CA	V1J 6C7		109
932	delivery	67-8303 92ND AVENUE		FORT ST. JOHN	BC	CA	V1J6C7		\N
933	delivery	57-8303 92ND AVENUE		FORT ST. JOHN	BC	CA	V1J6C7		\N
934	delivery	#30 8303-92ND AVE		FORT ST. JOHN	BC	CA	V1J6C7		\N
935	delivery	#50 8303-92ND AVE		FORT ST.JOHN	BC	CA	V1J6C7		\N
936	delivery	#15 8303-92ND AVE		FORT ST. JOHN	BC	CA	V1J6C7		\N
937	delivery	24-8303 92ND AVENUE		FORT ST. JOHN	BC	CA	V1J6C7		\N
938	mailing	C/O BAYWEST PROPERT MANAGEMENT SERVICES	13468 77TH AVENUE	SURREY	BC	CA	V3W 6Y3		110
939	delivery	C/O BAYWEST PROPERT MANAGEMENT SERVICES	13468 77TH AVENUE	SURREY	BC	CA	V3W 6Y3		110
940	delivery	119-13820-72 AVE		SURREY	BC	CA	V3W7V9		\N
941	delivery	305-13820-72 AVE		SURREY	BC	CA	V3W7V9		\N
942	delivery	110 - 13820 72 AVE		SURREY	BC	CA	V3W7V9		\N
943	delivery	209 - 13820 72 AVE		SURREY	BC	CA	V3W7V9		\N
944	delivery	211-13820-72 AVE		SURREY	BC	CA	V3W7V9		\N
945	delivery	117 - 13820 72 AVE		SURREY	BC	CA	V3W7V9		\N
946	delivery	214-13820-72 AVE		SURREY	BC	CA	V3W7V9		\N
947	delivery	202 - 13820 72 AVE		SURREY	BC	CA	V3W7V9		\N
948	mailing	220 - 1651 COMMERCIAL DR		VANCOUVER	BC	CA	V5L 3Y3		111
949	delivery	220 - 1651 COMMERCIAL DR		VANCOUVER	BC	CA	V5L 3Y3		111
950	delivery	4 - 12 WEST 10TH AVENUE		VANCOUVER	BC	CA	V5Y1R6		\N
951	delivery	18 - 12 WEST 10TH AVENUE		VANCOUVER	BC	CA	V5Y1R6		\N
952	delivery	27 - 12 WEST 10TH AVENUE		VANCOUVER	BC	CA	V5Y1R6		\N
953	delivery	1 - 12 WEST 10TH AVE		VANCOUVER	BC	CA	V5Y1R6		\N
954	delivery	20 - 12 WEST 10TH AVENUE		VANCOUVER	BC	CA	V5Y1R6		\N
955	mailing	400 - 2378 CRESCENT WAY		ABBOTSFORD	BC	CA	V2S 3M2		112
956	delivery	33497 BEVAN AVENUE		ABBOTSFORD	BC	CA	V2S 6H5		112
957	delivery	#207-2378 CRESCENT WAY		ABBOTSFORD	BC	CA	V2S3M2		\N
958	delivery	#20-33497 BEVAN AVENUE		ABBOTSFORD	BC	CA	V2S6H5		\N
959	delivery	#301-2378 CRESCENT WAY		ABBOTSFORD	BC	CA	V2S3M2		\N
960	delivery	#9-33493 BEVAN AVENUE		ABBOTSFORD	BC	CA	V2S6H5		\N
961	delivery	#33-33474 CANNON AVENUE		ABBOTSFORD	BC	CA	V2S6H4		\N
962	mailing	1651 COMMERCIAL DRIVE UNIT 220		VANCOUVER	BC	CA	V5L 3Y3		113
963	delivery	1651 COMMERCIAL DRIVE UNIT 220		VANCOUVER	BC	CA	V5L 3Y3		113
964	delivery	401-3637 CAMBIE STREET		VANCOUVER	BC	CA	V5Z2X3		\N
965	delivery	208-3637 CAMBIE STREET		VANCOUVER	BC	CA	V5Z2X3		\N
966	delivery	307-3637 CAMBIE ST		VANCOUVER	BC	CA	V5Z2X3		\N
967	delivery	305 - 3637 CAMBIE STREET		VANCOUVER	BC	CA	V5Z2X3		\N
968	delivery	306-3637 CAMBIE ST		VANCOUVER	BC	CA	V5Z2X3		\N
969	delivery	205-3637 CAMBIE STREET		VANCOUVER	BC	CA	V5Z2X3		\N
970	delivery	204 - 3637 CAMBIE STREET		VANCOUVER	BC	CA	V5Z2X3		\N
971	delivery	409-3637 CAMBIE ST		VANCOUVER	BC	CA	V5Z2X3		\N
972	mailing	C/O LOUISE BERKETA	55-22308 124 AVENUE	MAPLE RIDGE	BC	CA	V2X 0R6		114
973	delivery	C/O LOUISE BERKETA	55-22308 124 AVENUE	MAPLE RIDGE	BC	CA	V2X 0R6		114
974	delivery	3-2083 SHAUGNESSY ST		PORT COQUITLAM	BC	CA	V3C3C4		\N
975	delivery	11-2083 SHAUGHNESSY ST		PORT COQUITLAM	BC	CA	V3C3C4		\N
976	delivery	20-2083 SHAUGHNESSY STREET		PORT COQUITLAM	BC	CA	V3C3C4		\N
977	delivery	21 2083 SHAUGHNESSY ST		PORT COQUITLAM	BC	CA	V3C3C4		\N
978	delivery	7-2083 SHAUGHNESSY STREET		PORT COQUITLAM	BC	CA	V3C3C4		\N
979	delivery	10-2083 SHAUGHNESSY STREET		PORT COQUITLAM	BC	CA	V3C3C4		\N
980	delivery	9-2083 SHAUGHNESSY ST		PORT COQUITLAM	BC	CA	V3C3C4		\N
981	mailing	1-1692 SILVERWOOD CRESCENT		CASTLEGAR	BC	CA	V1N 2M1		115
982	delivery	1-1692 SILVERWOOD CRESCENT		CASTLEGAR	BC	CA	V1N 2M1		115
983	delivery	6 - 1682 SILVERWOOD CRES.		CASTLEGAR	BC	CA	V1N2M1		\N
984	delivery	5 1684 SILVERWOOD CRESCENT		CASTLEGAR	BC	CA	V1N2M1		\N
985	delivery	5 - 1686 SILVERWOOD CRES.		CASTLEGAR	BC	CA	V1N2M1		\N
986	delivery	6 1674 SILVERWOOD CRESC.		CASTLEGAR	BC	CA	V1N2M1		\N
987	delivery	1-1686 SILVERWOOD CRESCENT		CASTLEGAR	BC	CA	V1N2M1		\N
988	delivery	2-1676 SILVERWOOD CRESCENT		CASTELGAR	BC	CA	V1N2M1		\N
989	mailing	103 - 13435 104 AVENUE		SURREY	BC	CA	V3T 5K6		116
990	delivery	103 - 13435 104 AVENUE		SURREY	BC	CA	V3T 5K6		116
991	delivery	#1005 - 13435 104TH AVE		SURREY	BC	CA	V3T5K6		\N
992	delivery	701-13435 104TH AVE		SURREY	BC	CA	V3T5K6		\N
993	delivery	#904 13435 104 AVE		SURREY	BC	CA	V3T5K6		\N
994	delivery	#1201 - 13435 104TH AVE		SURREY	BC	CA	V3T5K6		\N
995	delivery	203-13435 104TH AVE		SURREY	BC	CA	V3T5K6		\N
996	delivery	#506 - 13435 104TH AVE		SURREY	BC	CA	V3T5K6		\N
997	delivery	#206 13435 104TH AVE		SURREY	BC	CA	V3T5K6		\N
998	mailing	PO BOX 580		PARKSVILLE	BC	CA	V9P 2G6		117
999	delivery	118 MCMILLAN STREET		PARKSVILLE	BC	CA	V9P 2G6		117
1000	delivery	B - 394 CRAIG STREET		PARKSVILLE	BC	CA	V9P1L4		\N
1001	delivery	UNIT I 394 CRAIG ST.		PARKSVILLE	BC	CA	V9P1L4		\N
1002	delivery	UNIT K 394 CRAIG ST.		PARKSVILLE	BC	CA	V9P1L4		\N
1003	delivery	H - 394 CRAIG STREET		PARKSVILLE	BC	CA	V9P1L4		\N
1004	mailing	2017 WEST 5TH AVENUE		VANCOUVER	BC	CA	V6J 1P8		118
1005	delivery	2017 WEST 5TH AVENUE		VANCOUVER	BC	CA	V6J 1P8		118
1006	delivery	202-2286 W 5TH AVE		VANCOUVER	BC	CA	V6K1S3		\N
1007	delivery	301 - 2286 WEST 5TH AVE		VANCOUVER	BC	CA	V6K1S3		\N
1008	delivery	301-2017 W 5TH AVE		VANCOUVER	BC	CA	V6J1P8		\N
1009	delivery	201 - 2017 WEST 5TH AVE		VANCOUVER	BC	CA	V6J1P8		\N
1010	delivery	302 - 2286 WEST 5TH AVE		VANCOUVER	BC	CA	V6K1S3		\N
1011	mailing	2616 WEST BROADWAY		VANCOUVER	BC	CA	V6K 2G3		119
1012	delivery	2616 WEST BROADWAY		VANCOUVER	BC	CA	V6K 2G3		119
1013	delivery	404 2616 WEST BROADWAY		VANCOUVER	BC	CA	V6K2G3		\N
1014	delivery	206-2616 W. BROADWAY		VANCOUVER	BC	CA	V6K2G3		\N
1015	delivery	303-2616 W. BROADWAY		VANCOUVER	BC	CA	V6K2G3		\N
1016	delivery	302-2616 W. BROADWAY		VANCOUVER	BC	CA	V6K2G3		\N
1017	delivery	307 2616 WEST BROADWAY		VANCOUVER	BC	CA	V6K2G3		\N
1018	delivery	208-2616 W. BROADWAY		VANCOUVER	BC	CA	V6K2G3		\N
1019	mailing	COMMUNITY HALL	620 JUDAH STREET	VICTORIA	BC	CA	V8Z 2K2		120
1020	delivery	COMMUNITY HALL	620 JUDAH STREET	VICTORIA	BC	CA	V8Z 2K2		120
1021	delivery	40-620 JUDAH ST		VICTORIA	BC	CA	V8Z2K2		\N
1022	delivery	16-620 JUDAH ST		VICTORIA	BC	CA	V8Z2K2		\N
1023	delivery	10-620 JUDAH ST		VICTORIA	BC	CA	V8Z2K2		\N
1024	delivery	32-620 JUDAH ST		VICTORIA	BC	CA	V8Z2K2		\N
1025	delivery	6-620 JUDAH ST		VICTORIA	BC	CA	V8Z2K2		\N
1026	delivery	33-620 JUDAH ST		VICTORIA	BC	CA	V8Z2K2		\N
1027	delivery	14-620 JUDAH ST		VICTORIA	BC	CA	V8Z2K2		\N
1028	mailing	B14-2820 HARRIET ROAD		VICTORIA	BC	CA	V9A 1T1		121
1029	delivery	B14-2820 HARRIET ROAD		VICTORIA	BC	CA	V9A 1T1		121
1030	delivery	A1 - 2820 HARRIET RD.		VICTORIA	BC	CA	V9A1T1		\N
1031	delivery	A13 - 2820 HARRIET RD		VICTORIA	BC	CA	V9A1T1		\N
1032	delivery	B1 - 2820 HARRIET RD.		VICTORIA	BC	CA	V9A1T1		\N
1033	delivery	A8 - 2820 HARRIET RD		VICTORIA	BC	CA	V9A1T1		\N
1034	delivery	A5 - 2820 HARRIET RD.		VICTORIA	BC	CA	V9A1T1		\N
1035	mailing	8631 BENNETT ROAD		RICHMOND	BC	CA	V6Y 1N6		122
1036	delivery	8631 BENNETT ROAD		RICHMOND	BC	CA	V6Y 1N6		122
1037	delivery	#48 - 8631 BENNETT ROAD		RICHMOND	BC	CA	V6Y3K9		\N
1038	delivery	2 - 8631 BENNETT RD		RICHMOND	BC	CA	V6Y3K4		\N
1039	delivery	#18 - 8631 BENNETT ROAD		RICHMOND	BC	CA	V6Y3K9		\N
1040	delivery	11 8631 BENNETT ROAD		RICHMOND	BC	CA	V6Y1N6		\N
1041	delivery	24 8631 BENNETT ROAD		RICHMOND	BC	CA	V6Y1N6		\N
1042	delivery	#46 8631 BENNETT ROAD		RICHMOND	BC	CA	V6Y3K6		\N
1043	delivery	16-8631 BENNETT ROAD		RICHMOND	BC	CA	V6Y3K5		\N
1044	delivery	59-8631 BENNETT ROAD		RICHMOND	BC	CA	V6Y3K6		\N
1045	mailing	1515 WEST 1ST AVE.		VANCOUVER	BC	CA	V6J 1E8		123
1046	delivery	1515 WEST 1ST AVE.		VANCOUVER	BC	CA	V6J 1E8		123
1047	delivery	#201- 1515 WEST 1ST AVENUE		VANCOUVER	BC	CA	V6J1E8		\N
1048	delivery	303 - 1515 WEST 1ST AVENUE		VANCOUVER	BC	CA	V6J1E8		\N
1049	delivery	105-1515 W. 1ST AVE		VANCOUVER	BC	CA	V6J1E8		\N
1050	delivery	205 - 1515 WEST 1ST AVENUE		VANCOUVER	BC	CA	V6J1E8		\N
1051	delivery	101 - 1515 WEST 1ST AVENUE		VANCOUVER	BC	CA	V6J1E8		\N
1052	mailing	16 - 10075 FIFTH STREET		SIDNEY	BC	CA	V8L 2X8		124
1053	delivery	16 - 10075 FIFTH STREET		SIDNEY	BC	CA	V8L 2X8		124
1054	delivery	UNIT #4 - 10075 FIFTH STREET		SIDNEY	BC	CA	V8L2X8		\N
1055	delivery	9-10075 FIFTH STREET		SIDNEY	BC	CA	V8L2X8		\N
1056	delivery	13-10075 FIFTH STREET		SIDNEY	BC	CA	V8L2X8		\N
1057	delivery	3-10075 FIFTH STREET		SIDNEY	BC	CA	V8L2X8		\N
1058	mailing	4750 BRENTON PAGE ROAD		LADYSMITH	BC	CA	V9G 1L7		125
1059	delivery	4750 BRENTON PAGE ROAD		LADYSMITH	BC	CA	V9G 1L7		125
1060	delivery	4750 BRENTON PAGE RD		LADYSMITH	BC	CA	V0R2E0		\N
1061	delivery	4744 BRENTON PAGE RD		LADYSMITH	BC	CA	V0R2E0		\N
1062	delivery	C/O 505- 1195 WEST BROADWAY		VANCOUVER	BC	CA	V6H3X5		\N
1063	delivery	4746 BRENTON PAGE RD		LADYSMITH	BC	CA	V9G1L7		\N
1064	delivery	C/O 505- 1195 WEST BROADWAY		VANCOUVER	BC	CA	V6H3X5		\N
1065	mailing	BAYWEST MANAGEMENT CORPORATION	13468 77TH AVENUE	SURREY	BC	CA	V3W 6Y3		126
1066	delivery	BAYWEST MANAGEMENT CORPORATION	13468 77TH AVENUE	SURREY	BC	CA	V3W 6Y3		126
1067	delivery	410-5250 RUPERT ST		VANCOUVER	BC	CA	V5R2J9		\N
1068	delivery	#307-5250 RUPERT ST.		VANCOUVER	BC	CA	V5R2J9		\N
1069	delivery	#204-5250 RUPERT ST.		VANCOUVER	BC	CA	V5R2J9		\N
1070	delivery	#412-5250 RUPERT ST.		VANCOUVER	BC	CA	V5R2J9		\N
1071	delivery	308-5250 RUPERT ST		VANCOUVER	BC	CA	V5R2J9		\N
1072	delivery	301 - 5250 RUPERT STREET		VANCOUVER	BC	CA	V5R2J9		\N
1073	delivery	306 - 5250 RUPERT ST		VANCOUVER	BC	CA	V5R2J9		\N
1074	mailing	1550 WOODLAND DRIVE		VANCOUVER	BC	CA	V5L 5A5		127
1075	delivery	1550 WOODLAND DRIVE		VANCOUVER	BC	CA	V5L 5A5		127
1076	delivery	202 - 1550 WOODLAND DR		VANCOUVER	BC	CA	V5L5A5		\N
1077	delivery	1503 GRAVELEY ST		VANCOUVER	BC	CA	V5L3A5		\N
1078	delivery	1517 GRAVELEY ST		VANCOUVER	BC	CA	V5L3A5		\N
1079	delivery	308 1550 WOODLAND DRIVE		VANCOUVER	BC	CA	V5L5A5		\N
1080	mailing	4160 BOND STREET		BURNABY	BC	CA	V5H 1G2		128
1081	delivery	4160 BOND STREET		BURNABY	BC	CA	V5H 1G2		128
1082	delivery	4-4160 BOND ST		BURNABY	BC	CA	V5H1G2		\N
1083	delivery	16-4160 BOND STREET		BURNABY	BC	CA	V5H1G2		\N
1084	delivery	25-4160 BOND ST		BURNABY	BC	CA	V5H1G2		\N
1085	delivery	2-4160 BOND ST		BURNABY	BC	CA	V5H1G2		\N
1086	delivery	21-4160 BOND ST		BURNABY	BC	CA	V5H1G2		\N
1087	delivery	17-4160 BOND STREET		BURNABY	BC	CA	V5H1G2		\N
1088	mailing	41-10771 GILBERT RD		RICHMOND	BC	CA	V7E 6E6		129
1089	delivery	41-10771 GILBERT RD		RICHMOND	BC	CA	V7E 6E6		129
1090	delivery	29-10771 GILBERT RD		RICHMOND	BC	CA	V7E6E6		\N
1091	delivery	38-10771 GILBERT RD		RICHMOND	BC	CA	V7E6E6		\N
1092	delivery	31 - 10771 GILBERT RD		RICHMOND	BC	CA	V7E6E6		\N
1093	delivery	28-10771 GILBERT RD		RICHMOND	BC	CA	V7E6E6		\N
1094	delivery	16- 10771 GILBERT RD		RICHMOND	BC	CA	V7E6E6		\N
1095	delivery	15-10771 GILNERT RD		RICHMOND	BC	CA	V7E6E6		\N
1096	delivery	2 - 10771 GILBERT RD		RICHMOND	BC	CA	V7E6E6		\N
1097	mailing	45 - 7235 - 18TH AVENUE		BURNABY	BC	CA	V3N 1H4		130
1098	delivery	45 - 7235 - 18TH AVENUE		BURNABY	BC	CA	V3N 1H4		130
1099	delivery	30 - 7235 18 AVENUE		BURNABY	BC	CA	V3N1H4		\N
1100	delivery	15 - 7235 18 AVENUE		BURNABY	BC	CA	V3N1H4		\N
1101	delivery	39 - 7235 18 AVENUE		BURNABY	BC	CA	V3N1H4		\N
1102	delivery	7 - 7235 18TH AVENUE		BURNABY	BC	CA	V3N1H4		\N
1103	delivery	22 - 7235 18TH AVENUE		BURNABY	BC	CA	V3N1H4		\N
1104	delivery	23 - 7235 18TH AVENUE		BURNABY	BC	CA	V3N1H4		\N
1105	mailing	C/O AM MANAGEMENT SERVICES LTD.	766 HILLSIDE AVE	VICTORIA	BC	CA	V8T 1Z6		131
1106	delivery	C/O AM MANAGEMENT SERVICES LTD.	766 HILLSIDE AVE	VICTORIA	BC	CA	V8T 1Z6		131
1107	delivery	#13 - 236 ISLAND HIGHWAY		VICTORIA	BC	CA	V9B1G2		\N
1108	delivery	#16 - 236 ISLAND HIGHWAY		VICTORIA	BC	CA	V9B1G2		\N
1109	delivery	#10 - 236 ISLAND HIGHWAY		VICTORIA	BC	CA	V9B1G2		\N
1110	delivery	#1 - 236 ISLAND HIGHWAY		VICTORIA	BC	CA	V9B1G2		\N
1111	delivery	#6 - 236 ISLAND HIGHWAY		VICTORIA	BC	CA	V9B1G2		\N
1112	mailing	220 - 1651 COMMERCIAL DRIVE		VANCOUVER	BC	CA	V5L 3Y3		132
1113	delivery	220 - 1651 COMMERCIAL DRIVE		VANCOUVER	BC	CA	V5L 3Y3		132
1114	delivery	4-8191 GENERAL CURRIE ROAD		RICHMOND	BC	CA	V6Y1L9		\N
1115	delivery	#12 - 8191 GENERAL CURRIE ROAD		RICHMOND	BC	CA	V6Y1L9		\N
1116	delivery	#22 - 8191 GENERAL CURRIE ROAD		RICHMOND	BC	CA	V6Y1L9		\N
1117	delivery	#23 - 8191 GENERAL CURRIE ROAD		RICHMOND	BC	CA	V6Y1L9		\N
1118	delivery	#8 - 8191 GENERAL CURRIE ROAD		RICHMOND	BC	CA	V6Y1L9		\N
1119	delivery	#11 - 8191 GENERAL CURRIE ROAD		RICHMOND	BC	CA	V6Y1L9		\N
1120	mailing	55 - 4080 GARRY STREET		RICHMOND	BC	CA	V7E 6J9		133
1121	delivery	55 - 4080 GARRY STREET		RICHMOND	BC	CA	V7E 6J9		133
1122	delivery	16-4080 GARRY STREET		RICHMOND	BC	CA	V7E6J9		\N
1123	delivery	2-4080 GARRY ST		RICHMOND	BC	CA	V7E6J9		\N
1124	delivery	54-4080 GARRY ST		RICHMOND	BC	CA	V7E6J9		\N
1125	delivery	13 - 4080 GARRY STREET		RICHMOND	BC	CA	V7E6J9		\N
1126	delivery	27-4080 GARRY STREET		RICHMOND	BC	CA	V7E6J9		\N
1127	delivery	31-4080 GARRY ST		RICHMOND	BC	CA	V7E6J9		\N
1128	delivery	5-4080 GARRY STREET		RICHMOND	BC	CA	V7E6J9		\N
1129	delivery	15-4080 GARRY ST		RICHMOND	BC	CA	V7E6J9		\N
1130	delivery	50-4080 GARRY ST		RICHMOND	BC	CA	V7E6J9		\N
1131	mailing	251 CRAIG STREET		DUNCAN	BC	CA	V9L 1W2		134
1132	delivery	251 CRAIG STREET		DUNCAN	BC	CA	V9L 1W2		134
1133	delivery	1835 DEBORAH DRIVE		DUNCAN	BC	CA	V9L5A9		\N
1134	delivery	251 CRAIG STREET		DUNCAN	BC	CA	V9L1W2		\N
1135	delivery	3159 GLANA PLACE		DUNCAN	BC	CA	V9L5H5		\N
1136	delivery	355 DOGWOOD PLACE		DUNCAN	BC	CA	V9L1H5		\N
1137	delivery	355 LAKE PARK RD		LAKE COWICHAN	BC	CA	V0R2G0		\N
1138	mailing	105 - 120 VERNON AVENUE		KAMLOOPS	BC	CA	V2B 1L6		135
1139	delivery	105 - 120 VERNON AVENUE		KAMLOOPS	BC	CA	V2B 1L6		135
1140	delivery	312 - 120 VERNON AVE		KAMLOOPS	BC	CA	V2B1L6		\N
1141	delivery	401 - 120 VERNON AVE		KAMLOOPS	BC	CA	V2B1L6		\N
1142	delivery	103-120 VERNON AVE		KAMLOOPS	BC	CA	V2B1L6		\N
1143	delivery	311 - 120 VERNON AVE		KAMLOOPS	BC	CA	V2B1L6		\N
1144	delivery	407-120 VERNON AVE		KAMLOOPS	BC	CA	V2B1L6		\N
1145	delivery	306-120 VERNON AVE		KAMLOOPS	BC	CA	V2B1L6		\N
1146	mailing	377 BAKER STREET		NELSON	BC	CA	V1L 4H6		136
1147	delivery	377 BAKER STREET		NELSON	BC	CA	V1L 4H6		136
1148	delivery	3711 BONNINGTON RD		BONNINGTON	BC	CA	V0G2G3		\N
1149	delivery	712 ELWYN ST		NELSON	BC	CA	V1L3S1		\N
1150	delivery	1308 CEDAR ST SUIT C		NELSON	BC	CA	V1L2E8		\N
1151	delivery	3231 VINDUSKY RD		NELSON	BC	CA	V1L6X7		\N
1152	delivery	3727 MCKENZIE RD		KRESTOVA	BC	CA	V0G1H2		\N
1153	mailing	125 HALL STREET		NELSON	BC	CA	V1L 7B4		137
1154	delivery	125 HALL STREET		NELSON	BC	CA	V1L 7B4		137
1155	delivery	302 BEASLEY ST		NELSON	BC	CA	V1L5M4		\N
1156	delivery	58-2210 COLUMBIA AVENUE		CASTLEGAR	BC	CA	V1N2X1		\N
1157	delivery	511 SAYWARD AVE		SALMO	BC	CA	V0G1Z0		\N
1158	delivery	8880 OLSON ROAD		KASLO	BC	CA	V0G1M0		\N
1159	delivery	1057 WILDROSE RD		CASTLEGAR	BC	CA	V1N4T7		\N
1160	delivery	206-710 VERNON STREET		NELSON	BC	CA	V1L4G2		\N
1161	delivery	921 HWY 3A		NELSON	BC	CA	V1L6J5		\N
1162	delivery	2065 HAAGLUND ROAD		CHRISTINA LAKE	BC	CA	V0H1E3		\N
1163	mailing	603B CARNARVON ST		NEW WESTMINSTER	BC	CA	V3M 1E5		138
1164	delivery	603B CARNARVON ST		NEW WESTMINSTER	BC	CA	V3M 1E5		138
1165	delivery	301-7040 BALMORAL ST		BURNABY	BC	CA	V5E1J5		\N
1166	delivery	160-7121 14TH AVE		BURNABY	BC	CA	V3N1Z3		\N
1167	delivery	801-706 QUEENS AVE		NEW WESTMINSTER	BC	CA	V3M1L5		\N
1168	delivery	2568 QUEENS AVE		WEST VANCOUVER	BC	CA	V7V2Y8		\N
1169	delivery	7931 16TH AVE		BURNABY	BC	CA	V3N1R4		\N
1170	delivery	1859 NAPIER ST		VANCOUVER	BC	CA	V5L2N4		\N
1171	delivery	7250 16TH AVE		BURNABY	BC	CA	V3N1N5		\N
1172	mailing	303 - 1080 HOWE STREET		VANCOUVER	BC	CA	V6Z 2T1		139
1173	delivery	303 - 1080 HOWE STREET		VANCOUVER	BC	CA	V6Z 2T1		139
1174	delivery	25 CARLSON ST		KITIMAT	BC	CA	V8C1A9		\N
1175	delivery	4445 LAZELLE AVE		TERRACE	BC	CA	V8G1R9		\N
1176	delivery	5333 MOUNTAIN VISTA DR		TERRACE	BC	CA	V8G4X4		\N
1177	delivery	2710 MOLITOR AVENUE		TERRACE	BC	CA	V8G3A4		\N
1178	delivery	3903 CORY DR		TERRACE	BC	CA	V8G0J4		\N
1179	delivery	5020 WALSH AVENUE		TERRACE	BC	CA	V8G4H2		\N
1180	delivery	4508 JOHNS RD		TERRACE	BC	CA	V8G0B3		\N
1181	delivery	2811 SKEENA ST		TERRACE	BC	CA	V8G3K3		\N
1182	mailing	2435 EASTGATE PL		VICTORIA	BC	CA	V8Z 6R7		140
1183	delivery	2435 EASTGATE PL		VICTORIA	BC	CA	V8Z 6R7		140
1184	delivery	2435 EASTGATE PLACE		VICTORIA	BC	CA	V8Z6R7		\N
1185	delivery	808 BEXHILL PL		VICTORIA	BC	CA	V9C3V5		\N
1186	delivery	2894 MURRAY DR		VICTORIA	BC	CA	V9A2S7		\N
1187	delivery	33 - 118 ALDERSMITH PLACE		VICTORIA	BC	CA	V9A7M9		\N
1188	delivery	3215 LINWOOD AVE		VICTORIA	BC	CA	V8X1E5		\N
1189	mailing	13188 DOOLE ROAD		LADYSMITH	BC	CA			141
1190	delivery	13188 DOOLE ROAD		LADYSMITH	BC	CA			141
1191	delivery	85 ROBARTS ST		NANAIO	BC	CA	V9R2S6		\N
1192	delivery	13188 DOOLE ROAD		LADYSMITH	BC	CA	V9G1G6		\N
1193	delivery	46 ROBARTS STREET		NANAIMO	BC	CA	V9R2S4		\N
1194	delivery	46 ROBARTS STREET		NANAIMO	BC	CA	V9R2S4		\N
1195	mailing	3291 RENITA RIDGE ROAD		DUNCAN	BC	CA	V9L 5J6		142
1196	delivery	3291 RENITA RIDGE ROAD		DUNCAN	BC	CA	V9L 5J6		142
1197	delivery	1229 ROCKCREST PL		VICTORIA	BC	CA	V9A4W5		\N
1198	delivery	240 MCKINSTRY RD		DUNCAN	BC	CA	V9L3L2		\N
1199	delivery	5905 INDIAN ROAD		DUNCAN	BC	CA	V9L5L9		\N
1200	delivery	1721 COWICHAN BAY ROAD		DUNCAN	BC	CA	V0R1N0		\N
1201	delivery	3291 RENITA RIDGE RD		DUNCAN	BC	CA	V9L5J6		\N
1202	delivery	1040 DUFFERIN CRES		NANAIMO	BC	CA	V9S2B6		\N
1203	mailing	P.O. BOX 415		GOLDEN	BC	CA	V0A 1H0		143
1204	delivery	421 - 9TH AVENUE NORTH, SUITE 208		GOLDEN	BC	CA	V0A 1H0		143
1205	delivery	515 TRANS CANADA HIGHWAY		GOLDEN	BC	CA	V0A1H1		\N
1206	delivery	1510 CEDAR STREET		GOLDEN	BC	CA	V0A1H6		\N
1207	delivery	1390 PINE DRIVE		GOLDEN	BC	CA	V0A1H1		\N
1208	delivery	1515 CEDAR STREET		GOLDEN	BC	CA	V0A1H6		\N
1209	mailing	1375 ELKVIEW TRAIL		CASTLEGAR	BC	CA	V1N 4S2		144
1210	delivery	1375 ELKVIEW TRAIL		CASTLEGAR	BC	CA	V1N 4S2		144
1211	delivery	1351 ELKVIEW TRAIL		CASTLEGAR	BC	CA	V1N4S2		\N
1212	delivery	1723 MOUNTAIN RIDGE ROAD		CASTLEGER	BC	CA	V1N4S2		\N
1213	delivery	1375 ELVIEW TRAIL		CASTLEGER	BC	CA	V1N4S2		\N
1214	delivery	1311 ELKVIEW TRAIL		CASTLEGAR	BC	CA	V1N4S2		\N
1215	mailing	6 - 4711 ELIZABETH STREET		PORT ALBERNI	BC	CA	V9Y 6M1		145
1216	delivery	6 - 4711 ELIZABETH STREET		PORT ALBERNI	BC	CA	V9Y 6M1		145
1217	delivery	8354 DICKSON DRIVE		PORT ALBERNI	BC	CA	V9Y9B5		\N
1218	delivery	3015 7TH AVENUE		PORT ALBERNI	BC	CA	V9Y2J2		\N
1219	delivery	5559 WOODLAND CRESENCET WEST		PORT ALBERNI	BC	CA	V9Y8E6		\N
1220	delivery	3955 16TH AVENUE		PORT ALBERNI	BC	CA	V9Y5L3		\N
1221	delivery	5510 WOODLAND CRESCENT EAST		PORT ALBERNI	BC	CA	V9Y8E6		\N
1222	delivery	4087 MARPOLE STREET		PORT ALBERNI	BC	CA	V9Y9B5		\N
1223	delivery	2132 MOTION DRIVE		PORT ALBERNI	BC	CA	V9Y1B3		\N
1224	delivery	3169 2ND AVENUE		PORT ALBERNI	BC	CA	V9Y4C4		\N
1225	delivery	4988 HELEN STREET		PORT ALBERNI	BC	CA	V9Y7N6		\N
1226	mailing	1391 COMMERCIAL DR.		VANCOUVER	BC	CA	V5L 3X5		146
1227	delivery	1391 COMMERCIAL DR.		VANCOUVER	BC	CA	V5L 3X5		146
1228	delivery	3272 W. KING EDWARD AVENUE		VANCOUVER	BC	CA	V6L1V7		\N
1229	delivery	3521 MARSHALL STREET		VANCOUVER	BC	CA	V5N4S2		\N
1230	delivery	3666 YALE STREET		VANCOUVER	BC	CA	V5K1C8		\N
1231	delivery	NO.107 - 3477 COMMERCIAL STREET		VANCOUVER	BC	CA	V5N4E8		\N
1232	delivery	1745 E. 3RD AVENUE		VANCOUVER	BC	CA	V5N1H3		\N
1233	delivery	NO. 516 - 103 POWELL STREET		VANCOUVER	BC	CA	V6A1G2		\N
1234	mailing	1483 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H 3Y7		147
1235	delivery	1483 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H 3Y7		147
1236	delivery	701-1483 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H3Y7		\N
1237	delivery	#812-1483 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H3Y7		\N
1238	delivery	309 - 1483 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H3Y7		\N
1239	delivery	602 - 1483 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H3Y7		\N
1240	delivery	414-1483 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H3Y7		\N
1241	delivery	#105 - 1483 LAMEYS MILL ROAD		VANCOUVER	BC	CA	V6H3Y7		\N
1242	delivery	709-1483 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H3Y7		\N
1243	delivery	508-1483 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H3Y7		\N
1244	delivery	415-1483 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H3Y7		\N
1245	delivery	#201-1483 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H3Y7		\N
1246	mailing	386 GINGER DRIVE		NEW WESTMINSTER	BC	CA	V3L 5L4		148
1247	delivery	386 GINGER DRIVE		NEW WESTMINSTER	BC	CA	V3L 5L4		148
1248	delivery	13-370 GINGER DR.		NEW WESTMINSTER	BC	CA	V3L5L4		\N
1249	delivery	19-390 GINGER DRIVE		NEW WESTMINSTER	BC	CA	V3L5L4		\N
1250	delivery	1-390 GINGER DRIVE		NEW WESTMINSTER	BC	CA	V3L5L4		\N
1251	delivery	13-380 GINGER DR		NEW WESTMINSTER	BC	CA	V3L5L4		\N
1252	delivery	11-390 GINGER DRIVE		NEW WESTMINSTER	BC	CA	V3L5L4		\N
1253	delivery	6-370 GINGER DR		NEW WESTMINSTER	BC	CA	V3L5L4		\N
1254	delivery	8-390 GINGER DRIVE		NEW WESTMINSTER	BC	CA	V3L5L4		\N
1255	mailing	32 - 12211 CAMBIE ROAD		RICHMOND	BC	CA	V6V 2H8		149
1256	delivery	32 - 12211 CAMBIE ROAD		RICHMOND	BC	CA	V6V 2H8		149
1257	delivery	19- 12211 CAMBIE RD		RICHMOND	BC	CA	V6V2H8		\N
1258	delivery	34- 12211 CAMBIE RD		RICHMOND	BC	CA	V6V2H8		\N
1259	delivery	31-12211 CAMBIE ROAD		RICHMOND	BC	CA	V6V2H8		\N
1260	delivery	3 - 12211 CAMBIE RD		RICHMOND	BC	CA	V6V2H8		\N
1261	delivery	12-12211 CAMBIE RD		RICHMOND	BC	CA	V6V2H8		\N
1262	delivery	#1-12211 CAMBIE ROAD		RICHMOND	BC	CA	V6V2H8		\N
1263	delivery	#50-12211 CAMBIE ROAD		RICHMOND	BC	CA	V6V2H8		\N
1264	delivery	#29-12211 CAMBIE ROAD		RICHMOND	BC	CA	V6V2H8		\N
\.


--
-- Data for Name: addresses_version; Type: TABLE DATA; Schema: public; Owner: userG5G
--

COPY public.addresses_version (id, address_type, street, street_additional, city, region, country, postal_code, delivery_instructions, business_id, transaction_id, end_transaction_id, operation_type) FROM stdin;
1	mailing	549 11TH AVENUE		CASTLEGAR	BC	CA	V1N 1J6		1	1	\N	0
2	delivery	549 11TH AVENUE		CASTLEGAR	BC	CA	V1N 1J6		1	1	\N	0
3	delivery	168 CRESCENT STREET		CASTLEGAR	BC	CA	V1N1B1		\N	1	\N	0
4	delivery	279-3385 UPPER LEVELS RD		ROBSON	BC	CA	V0G1X0		\N	1	\N	0
5	delivery	1037 RASPBERRY ROAD		CASTLEGAR	BC	CA	V1N4T7		\N	1	\N	0
6	delivery	27-3969 BROADWATER RD		CASTLEGAR	BC	CA	V1N4V5		\N	1	\N	0
7	delivery	3814-5TH AVE		CASTLEGAR	BC	CA	V1N4Y5		\N	1	\N	0
8	delivery	1061 BRIDGEVIEW CRESCENT		CASTLEGAR	BC	CA	V1N4L1		\N	1	\N	0
9	delivery	3708-5TH AVENUE		CASTLEGAR	BC	CA	V1N4Y3		\N	1	\N	0
10	delivery	208, 825 MERRY CREEK ROAD		CASTLEGAR	BC	CA	V1N2P1		\N	1	\N	0
11	mailing	3045 UNIT A JACKSON ST		VICTORIA	BC	CA	V8T 3Z7		2	2	\N	0
12	delivery	3045 UNIT A JACKSON ST		VICTORIA	BC	CA	V8T 3Z7		2	2	\N	0
13	delivery	38-1120 SUMMIT AVE.		VICTORIA	BC	CA	V8T2P6		\N	2	\N	0
14	delivery	11-3045 JACKSON ST.		VICTORIA	BC	CA	V8T3Z7		\N	2	\N	0
15	delivery	27 - 3045 JACKSON ST		VICTORIA	BC	CA	V8T3Z7		\N	2	\N	0
16	delivery	12-1120 SUMMIT AVE.		VICTORIA	BC	CA	V8T2P6		\N	2	\N	0
17	delivery	29-3045 JACKSON ST		VICTORIA	BC	CA	V8T3Z7		\N	2	\N	0
18	delivery	32-1120 SUMMIT AVE.		VICTORIA	BC	CA	V8T2P6		\N	2	\N	0
19	delivery	10-1120 SUMMIT AVE.		VICTORIA	BC	CA	V8T2P6		\N	2	\N	0
20	mailing	502 - 373 BURNSIDE RD. E.		VICTORIA	BC	CA	V9A 1A7		3	3	\N	0
21	delivery	502 - 373 BURNSIDE RD. E.		VICTORIA	BC	CA	V9A 1A7		3	3	\N	0
22	delivery	3-3136 WASHINGTON AVE		VICTORIA	BC	CA	V9A1P6		\N	3	\N	0
23	delivery	101-373 BURNSIDE RD, EAST		VICTORIA	BC	CA	V9A1A7		\N	3	\N	0
24	delivery	1-3142 WASHINGTON AVE		VICTORIA	BC	CA	V9A1P6		\N	3	\N	0
25	delivery	202 - 373 BURNSIDE ROAD EAST		VICTORIA	BC	CA	V9A1A7		\N	3	\N	0
26	delivery	303-373 BURNSIDE RD, EAST		VICTORIA	BC	CA	V9A1A7		\N	3	\N	0
27	delivery	301-373 BURNSIDE RD, EAST		VICTORIA	BC	CA	V9A1A7		\N	3	\N	0
28	delivery	106-373 BURNSIDE ROAD E		VICTORIA	BC	CA	V9A1A7		\N	3	\N	0
29	delivery	103-373 BURNSIDE RD. EAST		VICTORIA	BC	CA	V9A1A7		\N	3	\N	0
30	mailing	25 - 7365 CEDAR ST.		MISSION	BC	CA	V2V 5S7		4	4	\N	0
31	delivery	25 - 7365 CEDAR ST.		MISSION	BC	CA	V2V 5S7		4	4	\N	0
32	delivery	58-7365 CEDAR ST		MISSION	BC	CA	V2V5S7		\N	4	\N	0
33	delivery	44-7365 CEDAR STREET		MISSION	BC	CA	V2V5S7		\N	4	\N	0
34	delivery	33 - 7365 CEDAR ST		MISSION	BC	CA	V2V5S7		\N	4	\N	0
35	delivery	31 - 7365 CEDAR ST		MISSION	BC	CA	V2V5S7		\N	4	\N	0
36	delivery	53-7365 CEDAR ST		MISSION	BC	CA	V2V5S7		\N	4	\N	0
37	delivery	#33 - 7365 CEDAR ST.		MISSION	BC	CA	V2V5S7		\N	4	\N	0
38	delivery	65-7365 CEDAR ST		MISSION	BC	CA	V2V5S7		\N	4	\N	0
39	delivery	87 7365 CEDAR STREET		MISSION	BC	CA	V2V5S7		\N	4	\N	0
40	delivery	1-7365 CEDAR STREET		MISSION	BC	CA	V2V5S7		\N	4	\N	0
41	mailing	777 BAKER STREET		NELSON	BC	CA	V1L 4H4		5	5	\N	0
42	delivery	777 BAKER STREET		NELSON	BC	CA	V1L 4H4		5	5	\N	0
43	delivery	710 FELLER RD		NELSON	BC	CA	V1L4B7		\N	5	\N	0
44	delivery	3642 MOUNTAINVIEW RD		BONNINGTON	BC	CA	V0G2G3		\N	5	\N	0
45	delivery	233 D AVENUE		KASLO	BC	CA	V0G1M0		\N	5	\N	0
46	delivery	6724 HARROP-PROCTOR ROAD		NELSON	BC	CA	V1L6R2		\N	5	\N	0
47	delivery	206 DELBRUCK ST		NELSON	BC	CA	V1L5L1		\N	5	\N	0
48	delivery	4-916 EDGEWOOD AVE		NELSON	BC	CA	V1L4C9		\N	5	\N	0
49	delivery	203-622 FRONT STREET		NELSON	BC	CA	V1L4B7		\N	5	\N	0
50	delivery	4761 BEASLEY ROAD		SOUTH SLOCAN	BC	CA	V0G2G2		\N	5	\N	0
51	mailing	BOX 45		VANCOUVER	BC	CA	V6E 1V9		6	6	\N	0
52	delivery	784 THURLOW STREET		VANCOUVER	BC	CA	V6E 1V9		6	6	\N	0
53	delivery	28-784 THURLOW ST		VANCOUVER	BC	CA	V6E1V9		\N	6	\N	0
54	delivery	14 - 787 THURLOW STREET		VANCOUVER	BC	CA	V6E1V9		\N	6	\N	0
55	delivery	2 - 784 THURLOW STREET		VANCOUVER	BC	CA	V6E1V9		\N	6	\N	0
56	delivery	29 - 784 THURLOW STREET		VANCOUVER	BC	CA	V6E1V9		\N	6	\N	0
57	delivery	40 - 784 THURLOW STREET		VANCOUVER	BC	CA	V6E1V9		\N	6	\N	0
58	delivery	41 - 784 THURLOW STREET		VANCOUVER	BC	CA	V6E1V9		\N	6	\N	0
59	delivery	27 - 784 THURLOW STREET		VANCOUVER	BC	CA	V6E1V9		\N	6	\N	0
60	delivery	25 - 784 THURLOW STREET		VACOUVER	BC	CA	V6E1V9		\N	6	\N	0
61	mailing	7122-138TH STREET		SURREY	BC	CA	V3W 7V7		7	7	\N	0
62	delivery	7122-138TH STREET		SURREY	BC	CA	V3W 7V7		7	7	\N	0
63	delivery	209-7102 138TH STREET		SURREY	BC	CA	V3W7V7		\N	7	\N	0
64	delivery	70-7158 138TH ST		SURREY	BC	CA	V3W7V7		\N	7	\N	0
65	delivery	204 - 7102 138TH ST		SURREY	BC	CA	V3W7V8		\N	7	\N	0
66	delivery	105, 7102 - 138 STREET		SURREY	BC	CA	V3W7V8		\N	7	\N	0
67	delivery	53 - 7150 - 138TH STREET		SURREY	BC	CA	V3W7V8		\N	7	\N	0
68	delivery	208-7102 138TH STREET		SURREY	BC	CA	V3W7V6		\N	7	\N	0
69	delivery	54-7150 138TH STREET		SURREY	BC	CA	V3W7V7		\N	7	\N	0
70	delivery	33 - 7134 - 138TH STREET		SURREY	BC	CA	V3W7V7		\N	7	\N	0
71	delivery	205-7102-138TH ST		SURREY	BC	CA	V3W7V8		\N	7	\N	0
72	mailing	#106-4221 MAYBERRY STREET		BURNABY	BC	CA	V5H 4E8		8	8	\N	0
73	delivery	#106-4221 MAYBERRY STREET		BURNABY	BC	CA	V5H 4E8		8	8	\N	0
74	delivery	#1601 - 4221 MAYBERRY STREET		BURNABY	BC	CA	V5H4E8		\N	8	\N	0
75	delivery	1003 - 4221 MAYBERRY STREET		BURNABY	BC	CA	V5H4E8		\N	8	\N	0
76	delivery	#0201 - 4221 MAYBERRY STREET		BURNABY	BC	CA	V5H4E8		\N	8	\N	0
77	delivery	#1506-4221 MAYBERRY STREET		BURNABY	BC	CA	V5H4E8		\N	8	\N	0
78	delivery	1905 - 4221 MAYBERRY STREET		BURNABY	BC	CA	V5H4E8		\N	8	\N	0
79	delivery	1505-4221 MAYBERRY STREET		BURNABYBC	BC	CA	V5H4E8		\N	8	\N	0
80	delivery	1504-4221 MAYBERRY STREET		BURNABY	BC	CA	V5H4E8		\N	8	\N	0
81	mailing	81 - 1415 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H 3W1		9	9	\N	0
82	delivery	81 - 1415 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H 3W1		9	9	\N	0
83	delivery	56-1415 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H3W1		\N	9	\N	0
84	delivery	12-1415 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H3W1		\N	9	\N	0
85	delivery	5-1465 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H3W1		\N	9	\N	0
86	delivery	1-1415 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H3W1		\N	9	\N	0
87	delivery	7-1465 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H3W1		\N	9	\N	0
88	delivery	10 1415 LAMEY'S MILL RD		VANCOUVER	BC	CA	V6H3W1		\N	9	\N	0
89	delivery	3-1415 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H3W1		\N	9	\N	0
90	delivery	38-1415 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H3W1		\N	9	\N	0
91	mailing	1707 - 130TH ST.		SURREY	BC	CA	V4A 4A2		10	10	\N	0
92	delivery	1707 - 130TH ST.		SURREY	BC	CA	V4A 4A2		10	10	\N	0
93	delivery	111-1701 130TH STREET		SURREY	BC	CA	V4A4A2		\N	10	\N	0
94	delivery	103-1739 130TH STREET		SURREY	BC	CA	V4A4A2		\N	10	\N	0
95	delivery	110-1701 130TH STREET		SURREY	BC	CA	V4A4A2		\N	10	\N	0
96	delivery	106-1747 130TH STREET		SURREY	BC	CA	V4A4A2		\N	10	\N	0
97	delivery	106-1715 130TH STREET		SURREY	BC	CA	V4A4A2		\N	10	\N	0
98	delivery	103-1703 130TH STREET		SURREY	BC	CA	V4A4A2		\N	10	\N	0
99	delivery	102-1717 130TH STREET		SURREY	BC	CA	V4A4A2		\N	10	\N	0
100	delivery	108-1739 130TH STREET		SURREY	BC	CA	V4A4A2		\N	10	\N	0
101	delivery	106-1739 130TH STREET		SURREY	BC	CA	V4A4A2		\N	10	\N	0
102	mailing	8303 - 92 AVE		FORT ST JOHN	BC	CA	V1J 6C7		11	11	\N	0
103	delivery	8303 - 92 AVE		FORT ST JOHN	BC	CA	V1J 6C7		11	11	\N	0
104	delivery	67-8303 92ND AVENUE		FORT ST. JOHN	BC	CA	V1J6C7		\N	11	\N	0
105	delivery	57-8303 92ND AVENUE		FORT ST. JOHN	BC	CA	V1J6C7		\N	11	\N	0
106	delivery	#30 8303-92ND AVE		FORT ST. JOHN	BC	CA	V1J6C7		\N	11	\N	0
107	delivery	#50 8303-92ND AVE		FORT ST.JOHN	BC	CA	V1J6C7		\N	11	\N	0
108	delivery	#15 8303-92ND AVE		FORT ST. JOHN	BC	CA	V1J6C7		\N	11	\N	0
109	delivery	24-8303 92ND AVENUE		FORT ST. JOHN	BC	CA	V1J6C7		\N	11	\N	0
110	mailing	C/O BAYWEST PROPERT MANAGEMENT SERVICES	13468 77TH AVENUE	SURREY	BC	CA	V3W 6Y3		12	12	\N	0
111	delivery	C/O BAYWEST PROPERT MANAGEMENT SERVICES	13468 77TH AVENUE	SURREY	BC	CA	V3W 6Y3		12	12	\N	0
112	delivery	119-13820-72 AVE		SURREY	BC	CA	V3W7V9		\N	12	\N	0
113	delivery	305-13820-72 AVE		SURREY	BC	CA	V3W7V9		\N	12	\N	0
114	delivery	110 - 13820 72 AVE		SURREY	BC	CA	V3W7V9		\N	12	\N	0
115	delivery	209 - 13820 72 AVE		SURREY	BC	CA	V3W7V9		\N	12	\N	0
116	delivery	211-13820-72 AVE		SURREY	BC	CA	V3W7V9		\N	12	\N	0
117	delivery	117 - 13820 72 AVE		SURREY	BC	CA	V3W7V9		\N	12	\N	0
118	delivery	214-13820-72 AVE		SURREY	BC	CA	V3W7V9		\N	12	\N	0
119	delivery	202 - 13820 72 AVE		SURREY	BC	CA	V3W7V9		\N	12	\N	0
120	mailing	220 - 1651 COMMERCIAL DR		VANCOUVER	BC	CA	V5L 3Y3		13	13	\N	0
121	delivery	220 - 1651 COMMERCIAL DR		VANCOUVER	BC	CA	V5L 3Y3		13	13	\N	0
122	delivery	4 - 12 WEST 10TH AVENUE		VANCOUVER	BC	CA	V5Y1R6		\N	13	\N	0
123	delivery	18 - 12 WEST 10TH AVENUE		VANCOUVER	BC	CA	V5Y1R6		\N	13	\N	0
124	delivery	27 - 12 WEST 10TH AVENUE		VANCOUVER	BC	CA	V5Y1R6		\N	13	\N	0
125	delivery	1 - 12 WEST 10TH AVE		VANCOUVER	BC	CA	V5Y1R6		\N	13	\N	0
126	delivery	20 - 12 WEST 10TH AVENUE		VANCOUVER	BC	CA	V5Y1R6		\N	13	\N	0
127	mailing	400 - 2378 CRESCENT WAY		ABBOTSFORD	BC	CA	V2S 3M2		14	14	\N	0
128	delivery	33497 BEVAN AVENUE		ABBOTSFORD	BC	CA	V2S 6H5		14	14	\N	0
129	delivery	#207-2378 CRESCENT WAY		ABBOTSFORD	BC	CA	V2S3M2		\N	14	\N	0
130	delivery	#20-33497 BEVAN AVENUE		ABBOTSFORD	BC	CA	V2S6H5		\N	14	\N	0
131	delivery	#301-2378 CRESCENT WAY		ABBOTSFORD	BC	CA	V2S3M2		\N	14	\N	0
132	delivery	#9-33493 BEVAN AVENUE		ABBOTSFORD	BC	CA	V2S6H5		\N	14	\N	0
133	delivery	#33-33474 CANNON AVENUE		ABBOTSFORD	BC	CA	V2S6H4		\N	14	\N	0
134	mailing	1651 COMMERCIAL DRIVE UNIT 220		VANCOUVER	BC	CA	V5L 3Y3		15	15	\N	0
135	delivery	1651 COMMERCIAL DRIVE UNIT 220		VANCOUVER	BC	CA	V5L 3Y3		15	15	\N	0
136	delivery	401-3637 CAMBIE STREET		VANCOUVER	BC	CA	V5Z2X3		\N	15	\N	0
137	delivery	208-3637 CAMBIE STREET		VANCOUVER	BC	CA	V5Z2X3		\N	15	\N	0
138	delivery	307-3637 CAMBIE ST		VANCOUVER	BC	CA	V5Z2X3		\N	15	\N	0
139	delivery	305 - 3637 CAMBIE STREET		VANCOUVER	BC	CA	V5Z2X3		\N	15	\N	0
140	delivery	306-3637 CAMBIE ST		VANCOUVER	BC	CA	V5Z2X3		\N	15	\N	0
141	delivery	205-3637 CAMBIE STREET		VANCOUVER	BC	CA	V5Z2X3		\N	15	\N	0
142	delivery	204 - 3637 CAMBIE STREET		VANCOUVER	BC	CA	V5Z2X3		\N	15	\N	0
143	delivery	409-3637 CAMBIE ST		VANCOUVER	BC	CA	V5Z2X3		\N	15	\N	0
144	mailing	C/O LOUISE BERKETA	55-22308 124 AVENUE	MAPLE RIDGE	BC	CA	V2X 0R6		16	16	\N	0
145	delivery	C/O LOUISE BERKETA	55-22308 124 AVENUE	MAPLE RIDGE	BC	CA	V2X 0R6		16	16	\N	0
146	delivery	3-2083 SHAUGNESSY ST		PORT COQUITLAM	BC	CA	V3C3C4		\N	16	\N	0
147	delivery	11-2083 SHAUGHNESSY ST		PORT COQUITLAM	BC	CA	V3C3C4		\N	16	\N	0
148	delivery	20-2083 SHAUGHNESSY STREET		PORT COQUITLAM	BC	CA	V3C3C4		\N	16	\N	0
149	delivery	21 2083 SHAUGHNESSY ST		PORT COQUITLAM	BC	CA	V3C3C4		\N	16	\N	0
150	delivery	7-2083 SHAUGHNESSY STREET		PORT COQUITLAM	BC	CA	V3C3C4		\N	16	\N	0
151	delivery	10-2083 SHAUGHNESSY STREET		PORT COQUITLAM	BC	CA	V3C3C4		\N	16	\N	0
152	delivery	9-2083 SHAUGHNESSY ST		PORT COQUITLAM	BC	CA	V3C3C4		\N	16	\N	0
153	mailing	1-1692 SILVERWOOD CRESCENT		CASTLEGAR	BC	CA	V1N 2M1		17	17	\N	0
154	delivery	1-1692 SILVERWOOD CRESCENT		CASTLEGAR	BC	CA	V1N 2M1		17	17	\N	0
155	delivery	6 - 1682 SILVERWOOD CRES.		CASTLEGAR	BC	CA	V1N2M1		\N	17	\N	0
156	delivery	5 1684 SILVERWOOD CRESCENT		CASTLEGAR	BC	CA	V1N2M1		\N	17	\N	0
157	delivery	5 - 1686 SILVERWOOD CRES.		CASTLEGAR	BC	CA	V1N2M1		\N	17	\N	0
158	delivery	6 1674 SILVERWOOD CRESC.		CASTLEGAR	BC	CA	V1N2M1		\N	17	\N	0
159	delivery	1-1686 SILVERWOOD CRESCENT		CASTLEGAR	BC	CA	V1N2M1		\N	17	\N	0
160	delivery	2-1676 SILVERWOOD CRESCENT		CASTELGAR	BC	CA	V1N2M1		\N	17	\N	0
161	mailing	103 - 13435 104 AVENUE		SURREY	BC	CA	V3T 5K6		18	18	\N	0
162	delivery	103 - 13435 104 AVENUE		SURREY	BC	CA	V3T 5K6		18	18	\N	0
163	delivery	#1005 - 13435 104TH AVE		SURREY	BC	CA	V3T5K6		\N	18	\N	0
164	delivery	701-13435 104TH AVE		SURREY	BC	CA	V3T5K6		\N	18	\N	0
165	delivery	#904 13435 104 AVE		SURREY	BC	CA	V3T5K6		\N	18	\N	0
166	delivery	#1201 - 13435 104TH AVE		SURREY	BC	CA	V3T5K6		\N	18	\N	0
167	delivery	203-13435 104TH AVE		SURREY	BC	CA	V3T5K6		\N	18	\N	0
168	delivery	#506 - 13435 104TH AVE		SURREY	BC	CA	V3T5K6		\N	18	\N	0
169	delivery	#206 13435 104TH AVE		SURREY	BC	CA	V3T5K6		\N	18	\N	0
170	mailing	PO BOX 580		PARKSVILLE	BC	CA	V9P 2G6		19	19	\N	0
171	delivery	118 MCMILLAN STREET		PARKSVILLE	BC	CA	V9P 2G6		19	19	\N	0
172	delivery	B - 394 CRAIG STREET		PARKSVILLE	BC	CA	V9P1L4		\N	19	\N	0
173	delivery	UNIT I 394 CRAIG ST.		PARKSVILLE	BC	CA	V9P1L4		\N	19	\N	0
174	delivery	UNIT K 394 CRAIG ST.		PARKSVILLE	BC	CA	V9P1L4		\N	19	\N	0
175	delivery	H - 394 CRAIG STREET		PARKSVILLE	BC	CA	V9P1L4		\N	19	\N	0
176	mailing	2017 WEST 5TH AVENUE		VANCOUVER	BC	CA	V6J 1P8		20	20	\N	0
177	delivery	2017 WEST 5TH AVENUE		VANCOUVER	BC	CA	V6J 1P8		20	20	\N	0
178	delivery	202-2286 W 5TH AVE		VANCOUVER	BC	CA	V6K1S3		\N	20	\N	0
179	delivery	301 - 2286 WEST 5TH AVE		VANCOUVER	BC	CA	V6K1S3		\N	20	\N	0
180	delivery	301-2017 W 5TH AVE		VANCOUVER	BC	CA	V6J1P8		\N	20	\N	0
181	delivery	201 - 2017 WEST 5TH AVE		VANCOUVER	BC	CA	V6J1P8		\N	20	\N	0
182	delivery	302 - 2286 WEST 5TH AVE		VANCOUVER	BC	CA	V6K1S3		\N	20	\N	0
183	mailing	2616 WEST BROADWAY		VANCOUVER	BC	CA	V6K 2G3		21	21	\N	0
184	delivery	2616 WEST BROADWAY		VANCOUVER	BC	CA	V6K 2G3		21	21	\N	0
185	delivery	404 2616 WEST BROADWAY		VANCOUVER	BC	CA	V6K2G3		\N	21	\N	0
186	delivery	206-2616 W. BROADWAY		VANCOUVER	BC	CA	V6K2G3		\N	21	\N	0
187	delivery	303-2616 W. BROADWAY		VANCOUVER	BC	CA	V6K2G3		\N	21	\N	0
188	delivery	302-2616 W. BROADWAY		VANCOUVER	BC	CA	V6K2G3		\N	21	\N	0
189	delivery	307 2616 WEST BROADWAY		VANCOUVER	BC	CA	V6K2G3		\N	21	\N	0
190	delivery	208-2616 W. BROADWAY		VANCOUVER	BC	CA	V6K2G3		\N	21	\N	0
191	mailing	COMMUNITY HALL	620 JUDAH STREET	VICTORIA	BC	CA	V8Z 2K2		22	22	\N	0
192	delivery	COMMUNITY HALL	620 JUDAH STREET	VICTORIA	BC	CA	V8Z 2K2		22	22	\N	0
193	delivery	40-620 JUDAH ST		VICTORIA	BC	CA	V8Z2K2		\N	22	\N	0
194	delivery	16-620 JUDAH ST		VICTORIA	BC	CA	V8Z2K2		\N	22	\N	0
195	delivery	10-620 JUDAH ST		VICTORIA	BC	CA	V8Z2K2		\N	22	\N	0
196	delivery	32-620 JUDAH ST		VICTORIA	BC	CA	V8Z2K2		\N	22	\N	0
197	delivery	6-620 JUDAH ST		VICTORIA	BC	CA	V8Z2K2		\N	22	\N	0
198	delivery	33-620 JUDAH ST		VICTORIA	BC	CA	V8Z2K2		\N	22	\N	0
199	delivery	14-620 JUDAH ST		VICTORIA	BC	CA	V8Z2K2		\N	22	\N	0
200	mailing	B14-2820 HARRIET ROAD		VICTORIA	BC	CA	V9A 1T1		23	23	\N	0
201	delivery	B14-2820 HARRIET ROAD		VICTORIA	BC	CA	V9A 1T1		23	23	\N	0
202	delivery	A1 - 2820 HARRIET RD.		VICTORIA	BC	CA	V9A1T1		\N	23	\N	0
203	delivery	A13 - 2820 HARRIET RD		VICTORIA	BC	CA	V9A1T1		\N	23	\N	0
204	delivery	B1 - 2820 HARRIET RD.		VICTORIA	BC	CA	V9A1T1		\N	23	\N	0
205	delivery	A8 - 2820 HARRIET RD		VICTORIA	BC	CA	V9A1T1		\N	23	\N	0
206	delivery	A5 - 2820 HARRIET RD.		VICTORIA	BC	CA	V9A1T1		\N	23	\N	0
207	mailing	8631 BENNETT ROAD		RICHMOND	BC	CA	V6Y 1N6		24	24	\N	0
208	delivery	8631 BENNETT ROAD		RICHMOND	BC	CA	V6Y 1N6		24	24	\N	0
209	delivery	#48 - 8631 BENNETT ROAD		RICHMOND	BC	CA	V6Y3K9		\N	24	\N	0
210	delivery	2 - 8631 BENNETT RD		RICHMOND	BC	CA	V6Y3K4		\N	24	\N	0
211	delivery	#18 - 8631 BENNETT ROAD		RICHMOND	BC	CA	V6Y3K9		\N	24	\N	0
212	delivery	11 8631 BENNETT ROAD		RICHMOND	BC	CA	V6Y1N6		\N	24	\N	0
213	delivery	24 8631 BENNETT ROAD		RICHMOND	BC	CA	V6Y1N6		\N	24	\N	0
214	delivery	#46 8631 BENNETT ROAD		RICHMOND	BC	CA	V6Y3K6		\N	24	\N	0
215	delivery	16-8631 BENNETT ROAD		RICHMOND	BC	CA	V6Y3K5		\N	24	\N	0
216	delivery	59-8631 BENNETT ROAD		RICHMOND	BC	CA	V6Y3K6		\N	24	\N	0
217	mailing	1515 WEST 1ST AVE.		VANCOUVER	BC	CA	V6J 1E8		25	25	\N	0
218	delivery	1515 WEST 1ST AVE.		VANCOUVER	BC	CA	V6J 1E8		25	25	\N	0
219	delivery	#201- 1515 WEST 1ST AVENUE		VANCOUVER	BC	CA	V6J1E8		\N	25	\N	0
220	delivery	303 - 1515 WEST 1ST AVENUE		VANCOUVER	BC	CA	V6J1E8		\N	25	\N	0
221	delivery	105-1515 W. 1ST AVE		VANCOUVER	BC	CA	V6J1E8		\N	25	\N	0
222	delivery	205 - 1515 WEST 1ST AVENUE		VANCOUVER	BC	CA	V6J1E8		\N	25	\N	0
223	delivery	101 - 1515 WEST 1ST AVENUE		VANCOUVER	BC	CA	V6J1E8		\N	25	\N	0
224	mailing	16 - 10075 FIFTH STREET		SIDNEY	BC	CA	V8L 2X8		26	26	\N	0
225	delivery	16 - 10075 FIFTH STREET		SIDNEY	BC	CA	V8L 2X8		26	26	\N	0
226	delivery	UNIT #4 - 10075 FIFTH STREET		SIDNEY	BC	CA	V8L2X8		\N	26	\N	0
227	delivery	9-10075 FIFTH STREET		SIDNEY	BC	CA	V8L2X8		\N	26	\N	0
228	delivery	13-10075 FIFTH STREET		SIDNEY	BC	CA	V8L2X8		\N	26	\N	0
229	delivery	3-10075 FIFTH STREET		SIDNEY	BC	CA	V8L2X8		\N	26	\N	0
230	mailing	4750 BRENTON PAGE ROAD		LADYSMITH	BC	CA	V9G 1L7		27	27	\N	0
231	delivery	4750 BRENTON PAGE ROAD		LADYSMITH	BC	CA	V9G 1L7		27	27	\N	0
232	delivery	4750 BRENTON PAGE RD		LADYSMITH	BC	CA	V0R2E0		\N	27	\N	0
233	delivery	4744 BRENTON PAGE RD		LADYSMITH	BC	CA	V0R2E0		\N	27	\N	0
234	delivery	C/O 505- 1195 WEST BROADWAY		VANCOUVER	BC	CA	V6H3X5		\N	27	\N	0
235	delivery	4746 BRENTON PAGE RD		LADYSMITH	BC	CA	V9G1L7		\N	27	\N	0
236	delivery	C/O 505- 1195 WEST BROADWAY		VANCOUVER	BC	CA	V6H3X5		\N	27	\N	0
237	mailing	BAYWEST MANAGEMENT CORPORATION	13468 77TH AVENUE	SURREY	BC	CA	V3W 6Y3		28	28	\N	0
238	delivery	BAYWEST MANAGEMENT CORPORATION	13468 77TH AVENUE	SURREY	BC	CA	V3W 6Y3		28	28	\N	0
239	delivery	410-5250 RUPERT ST		VANCOUVER	BC	CA	V5R2J9		\N	28	\N	0
240	delivery	#307-5250 RUPERT ST.		VANCOUVER	BC	CA	V5R2J9		\N	28	\N	0
241	delivery	#204-5250 RUPERT ST.		VANCOUVER	BC	CA	V5R2J9		\N	28	\N	0
242	delivery	#412-5250 RUPERT ST.		VANCOUVER	BC	CA	V5R2J9		\N	28	\N	0
243	delivery	308-5250 RUPERT ST		VANCOUVER	BC	CA	V5R2J9		\N	28	\N	0
244	delivery	301 - 5250 RUPERT STREET		VANCOUVER	BC	CA	V5R2J9		\N	28	\N	0
245	delivery	306 - 5250 RUPERT ST		VANCOUVER	BC	CA	V5R2J9		\N	28	\N	0
246	mailing	1550 WOODLAND DRIVE		VANCOUVER	BC	CA	V5L 5A5		29	29	\N	0
247	delivery	1550 WOODLAND DRIVE		VANCOUVER	BC	CA	V5L 5A5		29	29	\N	0
248	delivery	202 - 1550 WOODLAND DR		VANCOUVER	BC	CA	V5L5A5		\N	29	\N	0
249	delivery	1503 GRAVELEY ST		VANCOUVER	BC	CA	V5L3A5		\N	29	\N	0
250	delivery	1517 GRAVELEY ST		VANCOUVER	BC	CA	V5L3A5		\N	29	\N	0
251	delivery	308 1550 WOODLAND DRIVE		VANCOUVER	BC	CA	V5L5A5		\N	29	\N	0
252	mailing	4160 BOND STREET		BURNABY	BC	CA	V5H 1G2		30	30	\N	0
253	delivery	4160 BOND STREET		BURNABY	BC	CA	V5H 1G2		30	30	\N	0
254	delivery	4-4160 BOND ST		BURNABY	BC	CA	V5H1G2		\N	30	\N	0
255	delivery	16-4160 BOND STREET		BURNABY	BC	CA	V5H1G2		\N	30	\N	0
256	delivery	25-4160 BOND ST		BURNABY	BC	CA	V5H1G2		\N	30	\N	0
257	delivery	2-4160 BOND ST		BURNABY	BC	CA	V5H1G2		\N	30	\N	0
258	delivery	21-4160 BOND ST		BURNABY	BC	CA	V5H1G2		\N	30	\N	0
259	delivery	17-4160 BOND STREET		BURNABY	BC	CA	V5H1G2		\N	30	\N	0
260	mailing	41-10771 GILBERT RD		RICHMOND	BC	CA	V7E 6E6		31	31	\N	0
261	delivery	41-10771 GILBERT RD		RICHMOND	BC	CA	V7E 6E6		31	31	\N	0
262	delivery	29-10771 GILBERT RD		RICHMOND	BC	CA	V7E6E6		\N	31	\N	0
263	delivery	38-10771 GILBERT RD		RICHMOND	BC	CA	V7E6E6		\N	31	\N	0
264	delivery	31 - 10771 GILBERT RD		RICHMOND	BC	CA	V7E6E6		\N	31	\N	0
265	delivery	28-10771 GILBERT RD		RICHMOND	BC	CA	V7E6E6		\N	31	\N	0
266	delivery	16- 10771 GILBERT RD		RICHMOND	BC	CA	V7E6E6		\N	31	\N	0
267	delivery	15-10771 GILNERT RD		RICHMOND	BC	CA	V7E6E6		\N	31	\N	0
268	delivery	2 - 10771 GILBERT RD		RICHMOND	BC	CA	V7E6E6		\N	31	\N	0
269	mailing	45 - 7235 - 18TH AVENUE		BURNABY	BC	CA	V3N 1H4		32	32	\N	0
270	delivery	45 - 7235 - 18TH AVENUE		BURNABY	BC	CA	V3N 1H4		32	32	\N	0
271	delivery	30 - 7235 18 AVENUE		BURNABY	BC	CA	V3N1H4		\N	32	\N	0
272	delivery	15 - 7235 18 AVENUE		BURNABY	BC	CA	V3N1H4		\N	32	\N	0
273	delivery	39 - 7235 18 AVENUE		BURNABY	BC	CA	V3N1H4		\N	32	\N	0
274	delivery	7 - 7235 18TH AVENUE		BURNABY	BC	CA	V3N1H4		\N	32	\N	0
275	delivery	22 - 7235 18TH AVENUE		BURNABY	BC	CA	V3N1H4		\N	32	\N	0
276	delivery	23 - 7235 18TH AVENUE		BURNABY	BC	CA	V3N1H4		\N	32	\N	0
277	mailing	C/O AM MANAGEMENT SERVICES LTD.	766 HILLSIDE AVE	VICTORIA	BC	CA	V8T 1Z6		33	33	\N	0
278	delivery	C/O AM MANAGEMENT SERVICES LTD.	766 HILLSIDE AVE	VICTORIA	BC	CA	V8T 1Z6		33	33	\N	0
279	delivery	#13 - 236 ISLAND HIGHWAY		VICTORIA	BC	CA	V9B1G2		\N	33	\N	0
280	delivery	#16 - 236 ISLAND HIGHWAY		VICTORIA	BC	CA	V9B1G2		\N	33	\N	0
281	delivery	#10 - 236 ISLAND HIGHWAY		VICTORIA	BC	CA	V9B1G2		\N	33	\N	0
282	delivery	#1 - 236 ISLAND HIGHWAY		VICTORIA	BC	CA	V9B1G2		\N	33	\N	0
283	delivery	#6 - 236 ISLAND HIGHWAY		VICTORIA	BC	CA	V9B1G2		\N	33	\N	0
284	mailing	220 - 1651 COMMERCIAL DRIVE		VANCOUVER	BC	CA	V5L 3Y3		34	34	\N	0
285	delivery	220 - 1651 COMMERCIAL DRIVE		VANCOUVER	BC	CA	V5L 3Y3		34	34	\N	0
286	delivery	4-8191 GENERAL CURRIE ROAD		RICHMOND	BC	CA	V6Y1L9		\N	34	\N	0
287	delivery	#12 - 8191 GENERAL CURRIE ROAD		RICHMOND	BC	CA	V6Y1L9		\N	34	\N	0
288	delivery	#22 - 8191 GENERAL CURRIE ROAD		RICHMOND	BC	CA	V6Y1L9		\N	34	\N	0
289	delivery	#23 - 8191 GENERAL CURRIE ROAD		RICHMOND	BC	CA	V6Y1L9		\N	34	\N	0
290	delivery	#8 - 8191 GENERAL CURRIE ROAD		RICHMOND	BC	CA	V6Y1L9		\N	34	\N	0
291	delivery	#11 - 8191 GENERAL CURRIE ROAD		RICHMOND	BC	CA	V6Y1L9		\N	34	\N	0
292	mailing	55 - 4080 GARRY STREET		RICHMOND	BC	CA	V7E 6J9		35	35	\N	0
293	delivery	55 - 4080 GARRY STREET		RICHMOND	BC	CA	V7E 6J9		35	35	\N	0
294	delivery	16-4080 GARRY STREET		RICHMOND	BC	CA	V7E6J9		\N	35	\N	0
295	delivery	2-4080 GARRY ST		RICHMOND	BC	CA	V7E6J9		\N	35	\N	0
296	delivery	54-4080 GARRY ST		RICHMOND	BC	CA	V7E6J9		\N	35	\N	0
297	delivery	13 - 4080 GARRY STREET		RICHMOND	BC	CA	V7E6J9		\N	35	\N	0
298	delivery	27-4080 GARRY STREET		RICHMOND	BC	CA	V7E6J9		\N	35	\N	0
299	delivery	31-4080 GARRY ST		RICHMOND	BC	CA	V7E6J9		\N	35	\N	0
300	delivery	5-4080 GARRY STREET		RICHMOND	BC	CA	V7E6J9		\N	35	\N	0
301	delivery	15-4080 GARRY ST		RICHMOND	BC	CA	V7E6J9		\N	35	\N	0
302	delivery	50-4080 GARRY ST		RICHMOND	BC	CA	V7E6J9		\N	35	\N	0
303	mailing	251 CRAIG STREET		DUNCAN	BC	CA	V9L 1W2		36	36	\N	0
304	delivery	251 CRAIG STREET		DUNCAN	BC	CA	V9L 1W2		36	36	\N	0
305	delivery	1835 DEBORAH DRIVE		DUNCAN	BC	CA	V9L5A9		\N	36	\N	0
306	delivery	251 CRAIG STREET		DUNCAN	BC	CA	V9L1W2		\N	36	\N	0
307	delivery	3159 GLANA PLACE		DUNCAN	BC	CA	V9L5H5		\N	36	\N	0
308	delivery	355 DOGWOOD PLACE		DUNCAN	BC	CA	V9L1H5		\N	36	\N	0
309	delivery	355 LAKE PARK RD		LAKE COWICHAN	BC	CA	V0R2G0		\N	36	\N	0
310	mailing	105 - 120 VERNON AVENUE		KAMLOOPS	BC	CA	V2B 1L6		37	37	\N	0
311	delivery	105 - 120 VERNON AVENUE		KAMLOOPS	BC	CA	V2B 1L6		37	37	\N	0
312	delivery	312 - 120 VERNON AVE		KAMLOOPS	BC	CA	V2B1L6		\N	37	\N	0
313	delivery	401 - 120 VERNON AVE		KAMLOOPS	BC	CA	V2B1L6		\N	37	\N	0
314	delivery	103-120 VERNON AVE		KAMLOOPS	BC	CA	V2B1L6		\N	37	\N	0
315	delivery	311 - 120 VERNON AVE		KAMLOOPS	BC	CA	V2B1L6		\N	37	\N	0
316	delivery	407-120 VERNON AVE		KAMLOOPS	BC	CA	V2B1L6		\N	37	\N	0
317	delivery	306-120 VERNON AVE		KAMLOOPS	BC	CA	V2B1L6		\N	37	\N	0
318	mailing	377 BAKER STREET		NELSON	BC	CA	V1L 4H6		38	38	\N	0
319	delivery	377 BAKER STREET		NELSON	BC	CA	V1L 4H6		38	38	\N	0
320	delivery	3711 BONNINGTON RD		BONNINGTON	BC	CA	V0G2G3		\N	38	\N	0
321	delivery	712 ELWYN ST		NELSON	BC	CA	V1L3S1		\N	38	\N	0
322	delivery	1308 CEDAR ST SUIT C		NELSON	BC	CA	V1L2E8		\N	38	\N	0
323	delivery	3231 VINDUSKY RD		NELSON	BC	CA	V1L6X7		\N	38	\N	0
324	delivery	3727 MCKENZIE RD		KRESTOVA	BC	CA	V0G1H2		\N	38	\N	0
325	mailing	125 HALL STREET		NELSON	BC	CA	V1L 7B4		39	39	\N	0
326	delivery	125 HALL STREET		NELSON	BC	CA	V1L 7B4		39	39	\N	0
327	delivery	302 BEASLEY ST		NELSON	BC	CA	V1L5M4		\N	39	\N	0
328	delivery	58-2210 COLUMBIA AVENUE		CASTLEGAR	BC	CA	V1N2X1		\N	39	\N	0
329	delivery	511 SAYWARD AVE		SALMO	BC	CA	V0G1Z0		\N	39	\N	0
330	delivery	8880 OLSON ROAD		KASLO	BC	CA	V0G1M0		\N	39	\N	0
331	delivery	1057 WILDROSE RD		CASTLEGAR	BC	CA	V1N4T7		\N	39	\N	0
332	delivery	206-710 VERNON STREET		NELSON	BC	CA	V1L4G2		\N	39	\N	0
333	delivery	921 HWY 3A		NELSON	BC	CA	V1L6J5		\N	39	\N	0
334	delivery	2065 HAAGLUND ROAD		CHRISTINA LAKE	BC	CA	V0H1E3		\N	39	\N	0
335	mailing	603B CARNARVON ST		NEW WESTMINSTER	BC	CA	V3M 1E5		40	40	\N	0
336	delivery	603B CARNARVON ST		NEW WESTMINSTER	BC	CA	V3M 1E5		40	40	\N	0
337	delivery	301-7040 BALMORAL ST		BURNABY	BC	CA	V5E1J5		\N	40	\N	0
338	delivery	160-7121 14TH AVE		BURNABY	BC	CA	V3N1Z3		\N	40	\N	0
339	delivery	801-706 QUEENS AVE		NEW WESTMINSTER	BC	CA	V3M1L5		\N	40	\N	0
340	delivery	2568 QUEENS AVE		WEST VANCOUVER	BC	CA	V7V2Y8		\N	40	\N	0
341	delivery	7931 16TH AVE		BURNABY	BC	CA	V3N1R4		\N	40	\N	0
342	delivery	1859 NAPIER ST		VANCOUVER	BC	CA	V5L2N4		\N	40	\N	0
343	delivery	7250 16TH AVE		BURNABY	BC	CA	V3N1N5		\N	40	\N	0
344	mailing	303 - 1080 HOWE STREET		VANCOUVER	BC	CA	V6Z 2T1		41	41	\N	0
345	delivery	303 - 1080 HOWE STREET		VANCOUVER	BC	CA	V6Z 2T1		41	41	\N	0
346	delivery	25 CARLSON ST		KITIMAT	BC	CA	V8C1A9		\N	41	\N	0
347	delivery	4445 LAZELLE AVE		TERRACE	BC	CA	V8G1R9		\N	41	\N	0
348	delivery	5333 MOUNTAIN VISTA DR		TERRACE	BC	CA	V8G4X4		\N	41	\N	0
349	delivery	2710 MOLITOR AVENUE		TERRACE	BC	CA	V8G3A4		\N	41	\N	0
350	delivery	3903 CORY DR		TERRACE	BC	CA	V8G0J4		\N	41	\N	0
351	delivery	5020 WALSH AVENUE		TERRACE	BC	CA	V8G4H2		\N	41	\N	0
352	delivery	4508 JOHNS RD		TERRACE	BC	CA	V8G0B3		\N	41	\N	0
353	delivery	2811 SKEENA ST		TERRACE	BC	CA	V8G3K3		\N	41	\N	0
361	mailing	13188 DOOLE ROAD		LADYSMITH	BC	CA			43	43	\N	0
362	delivery	13188 DOOLE ROAD		LADYSMITH	BC	CA			43	43	\N	0
363	delivery	85 ROBARTS ST		NANAIO	BC	CA	V9R2S6		\N	43	\N	0
364	delivery	13188 DOOLE ROAD		LADYSMITH	BC	CA	V9G1G6		\N	43	\N	0
365	delivery	46 ROBARTS STREET		NANAIMO	BC	CA	V9R2S4		\N	43	\N	0
366	delivery	46 ROBARTS STREET		NANAIMO	BC	CA	V9R2S4		\N	43	\N	0
367	mailing	3291 RENITA RIDGE ROAD		DUNCAN	BC	CA	V9L 5J6		44	44	\N	0
368	delivery	3291 RENITA RIDGE ROAD		DUNCAN	BC	CA	V9L 5J6		44	44	\N	0
369	delivery	1229 ROCKCREST PL		VICTORIA	BC	CA	V9A4W5		\N	44	\N	0
370	delivery	240 MCKINSTRY RD		DUNCAN	BC	CA	V9L3L2		\N	44	\N	0
371	delivery	5905 INDIAN ROAD		DUNCAN	BC	CA	V9L5L9		\N	44	\N	0
372	delivery	1721 COWICHAN BAY ROAD		DUNCAN	BC	CA	V0R1N0		\N	44	\N	0
373	delivery	3291 RENITA RIDGE RD		DUNCAN	BC	CA	V9L5J6		\N	44	\N	0
374	delivery	1040 DUFFERIN CRES		NANAIMO	BC	CA	V9S2B6		\N	44	\N	0
375	mailing	P.O. BOX 415		GOLDEN	BC	CA	V0A 1H0		45	45	\N	0
376	delivery	421 - 9TH AVENUE NORTH, SUITE 208		GOLDEN	BC	CA	V0A 1H0		45	45	\N	0
377	delivery	515 TRANS CANADA HIGHWAY		GOLDEN	BC	CA	V0A1H1		\N	45	\N	0
378	delivery	1510 CEDAR STREET		GOLDEN	BC	CA	V0A1H6		\N	45	\N	0
379	delivery	1390 PINE DRIVE		GOLDEN	BC	CA	V0A1H1		\N	45	\N	0
380	delivery	1515 CEDAR STREET		GOLDEN	BC	CA	V0A1H6		\N	45	\N	0
381	mailing	1375 ELKVIEW TRAIL		CASTLEGAR	BC	CA	V1N 4S2		46	46	\N	0
382	delivery	1375 ELKVIEW TRAIL		CASTLEGAR	BC	CA	V1N 4S2		46	46	\N	0
383	delivery	1351 ELKVIEW TRAIL		CASTLEGAR	BC	CA	V1N4S2		\N	46	\N	0
384	delivery	1723 MOUNTAIN RIDGE ROAD		CASTLEGER	BC	CA	V1N4S2		\N	46	\N	0
385	delivery	1375 ELVIEW TRAIL		CASTLEGER	BC	CA	V1N4S2		\N	46	\N	0
386	delivery	1311 ELKVIEW TRAIL		CASTLEGAR	BC	CA	V1N4S2		\N	46	\N	0
387	mailing	6 - 4711 ELIZABETH STREET		PORT ALBERNI	BC	CA	V9Y 6M1		47	47	\N	0
388	delivery	6 - 4711 ELIZABETH STREET		PORT ALBERNI	BC	CA	V9Y 6M1		47	47	\N	0
389	delivery	8354 DICKSON DRIVE		PORT ALBERNI	BC	CA	V9Y9B5		\N	47	\N	0
390	delivery	3015 7TH AVENUE		PORT ALBERNI	BC	CA	V9Y2J2		\N	47	\N	0
391	delivery	5559 WOODLAND CRESENCET WEST		PORT ALBERNI	BC	CA	V9Y8E6		\N	47	\N	0
392	delivery	3955 16TH AVENUE		PORT ALBERNI	BC	CA	V9Y5L3		\N	47	\N	0
393	delivery	5510 WOODLAND CRESCENT EAST		PORT ALBERNI	BC	CA	V9Y8E6		\N	47	\N	0
394	delivery	4087 MARPOLE STREET		PORT ALBERNI	BC	CA	V9Y9B5		\N	47	\N	0
395	delivery	2132 MOTION DRIVE		PORT ALBERNI	BC	CA	V9Y1B3		\N	47	\N	0
396	delivery	3169 2ND AVENUE		PORT ALBERNI	BC	CA	V9Y4C4		\N	47	\N	0
397	delivery	4988 HELEN STREET		PORT ALBERNI	BC	CA	V9Y7N6		\N	47	\N	0
398	mailing	1391 COMMERCIAL DR.		VANCOUVER	BC	CA	V5L 3X5		48	48	\N	0
399	delivery	1391 COMMERCIAL DR.		VANCOUVER	BC	CA	V5L 3X5		48	48	\N	0
400	delivery	3272 W. KING EDWARD AVENUE		VANCOUVER	BC	CA	V6L1V7		\N	48	\N	0
401	delivery	3521 MARSHALL STREET		VANCOUVER	BC	CA	V5N4S2		\N	48	\N	0
402	delivery	3666 YALE STREET		VANCOUVER	BC	CA	V5K1C8		\N	48	\N	0
403	delivery	NO.107 - 3477 COMMERCIAL STREET		VANCOUVER	BC	CA	V5N4E8		\N	48	\N	0
404	delivery	1745 E. 3RD AVENUE		VANCOUVER	BC	CA	V5N1H3		\N	48	\N	0
405	delivery	NO. 516 - 103 POWELL STREET		VANCOUVER	BC	CA	V6A1G2		\N	48	\N	0
406	mailing	2435 EASTGATE PL		VICTORIA	BC	CA	V8Z 6R7		49	49	\N	0
407	delivery	2435 EASTGATE PL		VICTORIA	BC	CA	V8Z 6R7		49	49	\N	0
408	delivery	2435 EASTGATE PLACE		VICTORIA	BC	CA	V8Z6R7		\N	49	\N	0
409	delivery	808 BEXHILL PL		VICTORIA	BC	CA	V9C3V5		\N	49	\N	0
410	delivery	2894 MURRAY DR		VICTORIA	BC	CA	V9A2S7		\N	49	\N	0
411	delivery	33 - 118 ALDERSMITH PLACE		VICTORIA	BC	CA	V9A7M9		\N	49	\N	0
412	delivery	3215 LINWOOD AVE		VICTORIA	BC	CA	V8X1E5		\N	49	\N	0
413	mailing	549 11TH AVENUE		CASTLEGAR	BC	CA	V1N 1J6		50	50	\N	0
414	delivery	549 11TH AVENUE		CASTLEGAR	BC	CA	V1N 1J6		50	50	\N	0
415	delivery	168 CRESCENT STREET		CASTLEGAR	BC	CA	V1N1B1		\N	50	\N	0
416	delivery	279-3385 UPPER LEVELS RD		ROBSON	BC	CA	V0G1X0		\N	50	\N	0
417	delivery	1037 RASPBERRY ROAD		CASTLEGAR	BC	CA	V1N4T7		\N	50	\N	0
418	delivery	27-3969 BROADWATER RD		CASTLEGAR	BC	CA	V1N4V5		\N	50	\N	0
419	delivery	3814-5TH AVE		CASTLEGAR	BC	CA	V1N4Y5		\N	50	\N	0
420	delivery	1061 BRIDGEVIEW CRESCENT		CASTLEGAR	BC	CA	V1N4L1		\N	50	\N	0
421	delivery	3708-5TH AVENUE		CASTLEGAR	BC	CA	V1N4Y3		\N	50	\N	0
422	delivery	208, 825 MERRY CREEK ROAD		CASTLEGAR	BC	CA	V1N2P1		\N	50	\N	0
423	mailing	3045 UNIT A JACKSON ST		VICTORIA	BC	CA	V8T 3Z7		51	51	\N	0
425	delivery	38-1120 SUMMIT AVE.		VICTORIA	BC	CA	V8T2P6		\N	51	\N	0
426	delivery	11-3045 JACKSON ST.		VICTORIA	BC	CA	V8T3Z7		\N	51	\N	0
427	delivery	27 - 3045 JACKSON ST		VICTORIA	BC	CA	V8T3Z7		\N	51	\N	0
428	delivery	12-1120 SUMMIT AVE.		VICTORIA	BC	CA	V8T2P6		\N	51	\N	0
429	delivery	29-3045 JACKSON ST		VICTORIA	BC	CA	V8T3Z7		\N	51	\N	0
430	delivery	32-1120 SUMMIT AVE.		VICTORIA	BC	CA	V8T2P6		\N	51	\N	0
431	delivery	10-1120 SUMMIT AVE.		VICTORIA	BC	CA	V8T2P6		\N	51	\N	0
432	mailing	502 - 373 BURNSIDE RD. E.		VICTORIA	BC	CA	V9A 1A7		52	52	\N	0
433	delivery	502 - 373 BURNSIDE RD. E.		VICTORIA	BC	CA	V9A 1A7		52	52	\N	0
434	delivery	3-3136 WASHINGTON AVE		VICTORIA	BC	CA	V9A1P6		\N	52	\N	0
435	delivery	101-373 BURNSIDE RD, EAST		VICTORIA	BC	CA	V9A1A7		\N	52	\N	0
436	delivery	1-3142 WASHINGTON AVE		VICTORIA	BC	CA	V9A1P6		\N	52	\N	0
437	delivery	202 - 373 BURNSIDE ROAD EAST		VICTORIA	BC	CA	V9A1A7		\N	52	\N	0
438	delivery	303-373 BURNSIDE RD, EAST		VICTORIA	BC	CA	V9A1A7		\N	52	\N	0
439	delivery	301-373 BURNSIDE RD, EAST		VICTORIA	BC	CA	V9A1A7		\N	52	\N	0
440	delivery	106-373 BURNSIDE ROAD E		VICTORIA	BC	CA	V9A1A7		\N	52	\N	0
441	delivery	103-373 BURNSIDE RD. EAST		VICTORIA	BC	CA	V9A1A7		\N	52	\N	0
442	mailing	25 - 7365 CEDAR ST.		MISSION	BC	CA	V2V 5S7		53	53	\N	0
443	delivery	25 - 7365 CEDAR ST.		MISSION	BC	CA	V2V 5S7		53	53	\N	0
444	delivery	58-7365 CEDAR ST		MISSION	BC	CA	V2V5S7		\N	53	\N	0
445	delivery	44-7365 CEDAR STREET		MISSION	BC	CA	V2V5S7		\N	53	\N	0
446	delivery	33 - 7365 CEDAR ST		MISSION	BC	CA	V2V5S7		\N	53	\N	0
447	delivery	31 - 7365 CEDAR ST		MISSION	BC	CA	V2V5S7		\N	53	\N	0
448	delivery	53-7365 CEDAR ST		MISSION	BC	CA	V2V5S7		\N	53	\N	0
449	delivery	#33 - 7365 CEDAR ST.		MISSION	BC	CA	V2V5S7		\N	53	\N	0
450	delivery	65-7365 CEDAR ST		MISSION	BC	CA	V2V5S7		\N	53	\N	0
451	delivery	87 7365 CEDAR STREET		MISSION	BC	CA	V2V5S7		\N	53	\N	0
452	delivery	1-7365 CEDAR STREET		MISSION	BC	CA	V2V5S7		\N	53	\N	0
453	mailing	777 BAKER STREET		NELSON	BC	CA	V1L 4H4		54	54	\N	0
454	delivery	777 BAKER STREET		NELSON	BC	CA	V1L 4H4		54	54	\N	0
455	delivery	710 FELLER RD		NELSON	BC	CA	V1L4B7		\N	54	\N	0
456	delivery	3642 MOUNTAINVIEW RD		BONNINGTON	BC	CA	V0G2G3		\N	54	\N	0
457	delivery	233 D AVENUE		KASLO	BC	CA	V0G1M0		\N	54	\N	0
458	delivery	6724 HARROP-PROCTOR ROAD		NELSON	BC	CA	V1L6R2		\N	54	\N	0
459	delivery	206 DELBRUCK ST		NELSON	BC	CA	V1L5L1		\N	54	\N	0
460	delivery	4-916 EDGEWOOD AVE		NELSON	BC	CA	V1L4C9		\N	54	\N	0
461	delivery	203-622 FRONT STREET		NELSON	BC	CA	V1L4B7		\N	54	\N	0
462	delivery	4761 BEASLEY ROAD		SOUTH SLOCAN	BC	CA	V0G2G2		\N	54	\N	0
463	mailing	BOX 45		VANCOUVER	BC	CA	V6E 1V9		55	55	\N	0
464	delivery	784 THURLOW STREET		VANCOUVER	BC	CA	V6E 1V9		55	55	\N	0
465	delivery	28-784 THURLOW ST		VANCOUVER	BC	CA	V6E1V9		\N	55	\N	0
466	delivery	14 - 787 THURLOW STREET		VANCOUVER	BC	CA	V6E1V9		\N	55	\N	0
467	delivery	2 - 784 THURLOW STREET		VANCOUVER	BC	CA	V6E1V9		\N	55	\N	0
468	delivery	29 - 784 THURLOW STREET		VANCOUVER	BC	CA	V6E1V9		\N	55	\N	0
469	delivery	40 - 784 THURLOW STREET		VANCOUVER	BC	CA	V6E1V9		\N	55	\N	0
470	delivery	41 - 784 THURLOW STREET		VANCOUVER	BC	CA	V6E1V9		\N	55	\N	0
471	delivery	27 - 784 THURLOW STREET		VANCOUVER	BC	CA	V6E1V9		\N	55	\N	0
472	delivery	25 - 784 THURLOW STREET		VACOUVER	BC	CA	V6E1V9		\N	55	\N	0
473	mailing	7122-138TH STREET		SURREY	BC	CA	V3W 7V7		56	56	\N	0
474	delivery	7122-138TH STREET		SURREY	BC	CA	V3W 7V7		56	56	\N	0
475	delivery	209-7102 138TH STREET		SURREY	BC	CA	V3W7V7		\N	56	\N	0
476	delivery	70-7158 138TH ST		SURREY	BC	CA	V3W7V7		\N	56	\N	0
477	delivery	204 - 7102 138TH ST		SURREY	BC	CA	V3W7V8		\N	56	\N	0
478	delivery	105, 7102 - 138 STREET		SURREY	BC	CA	V3W7V8		\N	56	\N	0
479	delivery	53 - 7150 - 138TH STREET		SURREY	BC	CA	V3W7V8		\N	56	\N	0
480	delivery	208-7102 138TH STREET		SURREY	BC	CA	V3W7V6		\N	56	\N	0
481	delivery	54-7150 138TH STREET		SURREY	BC	CA	V3W7V7		\N	56	\N	0
482	delivery	33 - 7134 - 138TH STREET		SURREY	BC	CA	V3W7V7		\N	56	\N	0
483	delivery	205-7102-138TH ST		SURREY	BC	CA	V3W7V8		\N	56	\N	0
484	mailing	#106-4221 MAYBERRY STREET		BURNABY	BC	CA	V5H 4E8		57	57	\N	0
485	delivery	#106-4221 MAYBERRY STREET		BURNABY	BC	CA	V5H 4E8		57	57	\N	0
486	delivery	#1601 - 4221 MAYBERRY STREET		BURNABY	BC	CA	V5H4E8		\N	57	\N	0
487	delivery	1003 - 4221 MAYBERRY STREET		BURNABY	BC	CA	V5H4E8		\N	57	\N	0
488	delivery	#0201 - 4221 MAYBERRY STREET		BURNABY	BC	CA	V5H4E8		\N	57	\N	0
489	delivery	#1506-4221 MAYBERRY STREET		BURNABY	BC	CA	V5H4E8		\N	57	\N	0
490	delivery	1905 - 4221 MAYBERRY STREET		BURNABY	BC	CA	V5H4E8		\N	57	\N	0
491	delivery	1505-4221 MAYBERRY STREET		BURNABYBC	BC	CA	V5H4E8		\N	57	\N	0
492	delivery	1504-4221 MAYBERRY STREET		BURNABY	BC	CA	V5H4E8		\N	57	\N	0
493	mailing	81 - 1415 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H 3W1		58	58	\N	0
494	delivery	81 - 1415 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H 3W1		58	58	\N	0
495	delivery	56-1415 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H3W1		\N	58	\N	0
496	delivery	12-1415 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H3W1		\N	58	\N	0
497	delivery	5-1465 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H3W1		\N	58	\N	0
498	delivery	1-1415 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H3W1		\N	58	\N	0
499	delivery	7-1465 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H3W1		\N	58	\N	0
500	delivery	10 1415 LAMEY'S MILL RD		VANCOUVER	BC	CA	V6H3W1		\N	58	\N	0
501	delivery	3-1415 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H3W1		\N	58	\N	0
502	delivery	38-1415 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H3W1		\N	58	\N	0
503	mailing	1707 - 130TH ST.		SURREY	BC	CA	V4A 4A2		59	59	\N	0
504	delivery	1707 - 130TH ST.		SURREY	BC	CA	V4A 4A2		59	59	\N	0
505	delivery	111-1701 130TH STREET		SURREY	BC	CA	V4A4A2		\N	59	\N	0
506	delivery	103-1739 130TH STREET		SURREY	BC	CA	V4A4A2		\N	59	\N	0
507	delivery	110-1701 130TH STREET		SURREY	BC	CA	V4A4A2		\N	59	\N	0
508	delivery	106-1747 130TH STREET		SURREY	BC	CA	V4A4A2		\N	59	\N	0
509	delivery	106-1715 130TH STREET		SURREY	BC	CA	V4A4A2		\N	59	\N	0
510	delivery	103-1703 130TH STREET		SURREY	BC	CA	V4A4A2		\N	59	\N	0
511	delivery	102-1717 130TH STREET		SURREY	BC	CA	V4A4A2		\N	59	\N	0
512	delivery	108-1739 130TH STREET		SURREY	BC	CA	V4A4A2		\N	59	\N	0
513	delivery	106-1739 130TH STREET		SURREY	BC	CA	V4A4A2		\N	59	\N	0
514	mailing	8303 - 92 AVE		FORT ST JOHN	BC	CA	V1J 6C7		60	60	\N	0
515	delivery	8303 - 92 AVE		FORT ST JOHN	BC	CA	V1J 6C7		60	60	\N	0
516	delivery	67-8303 92ND AVENUE		FORT ST. JOHN	BC	CA	V1J6C7		\N	60	\N	0
517	delivery	57-8303 92ND AVENUE		FORT ST. JOHN	BC	CA	V1J6C7		\N	60	\N	0
518	delivery	#30 8303-92ND AVE		FORT ST. JOHN	BC	CA	V1J6C7		\N	60	\N	0
519	delivery	#50 8303-92ND AVE		FORT ST.JOHN	BC	CA	V1J6C7		\N	60	\N	0
520	delivery	#15 8303-92ND AVE		FORT ST. JOHN	BC	CA	V1J6C7		\N	60	\N	0
521	delivery	24-8303 92ND AVENUE		FORT ST. JOHN	BC	CA	V1J6C7		\N	60	\N	0
522	mailing	C/O BAYWEST PROPERT MANAGEMENT SERVICES	13468 77TH AVENUE	SURREY	BC	CA	V3W 6Y3		61	61	\N	0
523	delivery	C/O BAYWEST PROPERT MANAGEMENT SERVICES	13468 77TH AVENUE	SURREY	BC	CA	V3W 6Y3		61	61	\N	0
524	delivery	119-13820-72 AVE		SURREY	BC	CA	V3W7V9		\N	61	\N	0
525	delivery	305-13820-72 AVE		SURREY	BC	CA	V3W7V9		\N	61	\N	0
526	delivery	110 - 13820 72 AVE		SURREY	BC	CA	V3W7V9		\N	61	\N	0
527	delivery	209 - 13820 72 AVE		SURREY	BC	CA	V3W7V9		\N	61	\N	0
528	delivery	211-13820-72 AVE		SURREY	BC	CA	V3W7V9		\N	61	\N	0
529	delivery	117 - 13820 72 AVE		SURREY	BC	CA	V3W7V9		\N	61	\N	0
530	delivery	214-13820-72 AVE		SURREY	BC	CA	V3W7V9		\N	61	\N	0
531	delivery	202 - 13820 72 AVE		SURREY	BC	CA	V3W7V9		\N	61	\N	0
532	mailing	220 - 1651 COMMERCIAL DR		VANCOUVER	BC	CA	V5L 3Y3		62	62	\N	0
533	delivery	220 - 1651 COMMERCIAL DR		VANCOUVER	BC	CA	V5L 3Y3		62	62	\N	0
534	delivery	4 - 12 WEST 10TH AVENUE		VANCOUVER	BC	CA	V5Y1R6		\N	62	\N	0
535	delivery	18 - 12 WEST 10TH AVENUE		VANCOUVER	BC	CA	V5Y1R6		\N	62	\N	0
536	delivery	27 - 12 WEST 10TH AVENUE		VANCOUVER	BC	CA	V5Y1R6		\N	62	\N	0
537	delivery	1 - 12 WEST 10TH AVE		VANCOUVER	BC	CA	V5Y1R6		\N	62	\N	0
538	delivery	20 - 12 WEST 10TH AVENUE		VANCOUVER	BC	CA	V5Y1R6		\N	62	\N	0
539	mailing	400 - 2378 CRESCENT WAY		ABBOTSFORD	BC	CA	V2S 3M2		63	63	\N	0
540	delivery	33497 BEVAN AVENUE		ABBOTSFORD	BC	CA	V2S 6H5		63	63	\N	0
541	delivery	#207-2378 CRESCENT WAY		ABBOTSFORD	BC	CA	V2S3M2		\N	63	\N	0
542	delivery	#20-33497 BEVAN AVENUE		ABBOTSFORD	BC	CA	V2S6H5		\N	63	\N	0
543	delivery	#301-2378 CRESCENT WAY		ABBOTSFORD	BC	CA	V2S3M2		\N	63	\N	0
544	delivery	#9-33493 BEVAN AVENUE		ABBOTSFORD	BC	CA	V2S6H5		\N	63	\N	0
545	delivery	#33-33474 CANNON AVENUE		ABBOTSFORD	BC	CA	V2S6H4		\N	63	\N	0
546	mailing	1651 COMMERCIAL DRIVE UNIT 220		VANCOUVER	BC	CA	V5L 3Y3		64	64	\N	0
547	delivery	1651 COMMERCIAL DRIVE UNIT 220		VANCOUVER	BC	CA	V5L 3Y3		64	64	\N	0
548	delivery	401-3637 CAMBIE STREET		VANCOUVER	BC	CA	V5Z2X3		\N	64	\N	0
549	delivery	208-3637 CAMBIE STREET		VANCOUVER	BC	CA	V5Z2X3		\N	64	\N	0
550	delivery	307-3637 CAMBIE ST		VANCOUVER	BC	CA	V5Z2X3		\N	64	\N	0
551	delivery	305 - 3637 CAMBIE STREET		VANCOUVER	BC	CA	V5Z2X3		\N	64	\N	0
552	delivery	306-3637 CAMBIE ST		VANCOUVER	BC	CA	V5Z2X3		\N	64	\N	0
553	delivery	205-3637 CAMBIE STREET		VANCOUVER	BC	CA	V5Z2X3		\N	64	\N	0
554	delivery	204 - 3637 CAMBIE STREET		VANCOUVER	BC	CA	V5Z2X3		\N	64	\N	0
555	delivery	409-3637 CAMBIE ST		VANCOUVER	BC	CA	V5Z2X3		\N	64	\N	0
556	mailing	C/O LOUISE BERKETA	55-22308 124 AVENUE	MAPLE RIDGE	BC	CA	V2X 0R6		65	65	\N	0
557	delivery	C/O LOUISE BERKETA	55-22308 124 AVENUE	MAPLE RIDGE	BC	CA	V2X 0R6		65	65	\N	0
558	delivery	3-2083 SHAUGNESSY ST		PORT COQUITLAM	BC	CA	V3C3C4		\N	65	\N	0
559	delivery	11-2083 SHAUGHNESSY ST		PORT COQUITLAM	BC	CA	V3C3C4		\N	65	\N	0
560	delivery	20-2083 SHAUGHNESSY STREET		PORT COQUITLAM	BC	CA	V3C3C4		\N	65	\N	0
561	delivery	21 2083 SHAUGHNESSY ST		PORT COQUITLAM	BC	CA	V3C3C4		\N	65	\N	0
562	delivery	7-2083 SHAUGHNESSY STREET		PORT COQUITLAM	BC	CA	V3C3C4		\N	65	\N	0
563	delivery	10-2083 SHAUGHNESSY STREET		PORT COQUITLAM	BC	CA	V3C3C4		\N	65	\N	0
564	delivery	9-2083 SHAUGHNESSY ST		PORT COQUITLAM	BC	CA	V3C3C4		\N	65	\N	0
565	mailing	1-1692 SILVERWOOD CRESCENT		CASTLEGAR	BC	CA	V1N 2M1		66	66	\N	0
566	delivery	1-1692 SILVERWOOD CRESCENT		CASTLEGAR	BC	CA	V1N 2M1		66	66	\N	0
567	delivery	6 - 1682 SILVERWOOD CRES.		CASTLEGAR	BC	CA	V1N2M1		\N	66	\N	0
568	delivery	5 1684 SILVERWOOD CRESCENT		CASTLEGAR	BC	CA	V1N2M1		\N	66	\N	0
569	delivery	5 - 1686 SILVERWOOD CRES.		CASTLEGAR	BC	CA	V1N2M1		\N	66	\N	0
570	delivery	6 1674 SILVERWOOD CRESC.		CASTLEGAR	BC	CA	V1N2M1		\N	66	\N	0
571	delivery	1-1686 SILVERWOOD CRESCENT		CASTLEGAR	BC	CA	V1N2M1		\N	66	\N	0
572	delivery	2-1676 SILVERWOOD CRESCENT		CASTELGAR	BC	CA	V1N2M1		\N	66	\N	0
573	mailing	103 - 13435 104 AVENUE		SURREY	BC	CA	V3T 5K6		67	67	\N	0
574	delivery	103 - 13435 104 AVENUE		SURREY	BC	CA	V3T 5K6		67	67	\N	0
575	delivery	#1005 - 13435 104TH AVE		SURREY	BC	CA	V3T5K6		\N	67	\N	0
576	delivery	701-13435 104TH AVE		SURREY	BC	CA	V3T5K6		\N	67	\N	0
577	delivery	#904 13435 104 AVE		SURREY	BC	CA	V3T5K6		\N	67	\N	0
578	delivery	#1201 - 13435 104TH AVE		SURREY	BC	CA	V3T5K6		\N	67	\N	0
579	delivery	203-13435 104TH AVE		SURREY	BC	CA	V3T5K6		\N	67	\N	0
580	delivery	#506 - 13435 104TH AVE		SURREY	BC	CA	V3T5K6		\N	67	\N	0
581	delivery	#206 13435 104TH AVE		SURREY	BC	CA	V3T5K6		\N	67	\N	0
582	mailing	PO BOX 580		PARKSVILLE	BC	CA	V9P 2G6		68	68	\N	0
583	delivery	118 MCMILLAN STREET		PARKSVILLE	BC	CA	V9P 2G6		68	68	\N	0
584	delivery	B - 394 CRAIG STREET		PARKSVILLE	BC	CA	V9P1L4		\N	68	\N	0
585	delivery	UNIT I 394 CRAIG ST.		PARKSVILLE	BC	CA	V9P1L4		\N	68	\N	0
586	delivery	UNIT K 394 CRAIG ST.		PARKSVILLE	BC	CA	V9P1L4		\N	68	\N	0
587	delivery	H - 394 CRAIG STREET		PARKSVILLE	BC	CA	V9P1L4		\N	68	\N	0
588	mailing	2017 WEST 5TH AVENUE		VANCOUVER	BC	CA	V6J 1P8		69	69	\N	0
589	delivery	2017 WEST 5TH AVENUE		VANCOUVER	BC	CA	V6J 1P8		69	69	\N	0
590	delivery	202-2286 W 5TH AVE		VANCOUVER	BC	CA	V6K1S3		\N	69	\N	0
591	delivery	301 - 2286 WEST 5TH AVE		VANCOUVER	BC	CA	V6K1S3		\N	69	\N	0
592	delivery	301-2017 W 5TH AVE		VANCOUVER	BC	CA	V6J1P8		\N	69	\N	0
593	delivery	201 - 2017 WEST 5TH AVE		VANCOUVER	BC	CA	V6J1P8		\N	69	\N	0
594	delivery	302 - 2286 WEST 5TH AVE		VANCOUVER	BC	CA	V6K1S3		\N	69	\N	0
595	mailing	2616 WEST BROADWAY		VANCOUVER	BC	CA	V6K 2G3		70	70	\N	0
596	delivery	2616 WEST BROADWAY		VANCOUVER	BC	CA	V6K 2G3		70	70	\N	0
597	delivery	404 2616 WEST BROADWAY		VANCOUVER	BC	CA	V6K2G3		\N	70	\N	0
598	delivery	206-2616 W. BROADWAY		VANCOUVER	BC	CA	V6K2G3		\N	70	\N	0
599	delivery	303-2616 W. BROADWAY		VANCOUVER	BC	CA	V6K2G3		\N	70	\N	0
600	delivery	302-2616 W. BROADWAY		VANCOUVER	BC	CA	V6K2G3		\N	70	\N	0
601	delivery	307 2616 WEST BROADWAY		VANCOUVER	BC	CA	V6K2G3		\N	70	\N	0
602	delivery	208-2616 W. BROADWAY		VANCOUVER	BC	CA	V6K2G3		\N	70	\N	0
603	mailing	COMMUNITY HALL	620 JUDAH STREET	VICTORIA	BC	CA	V8Z 2K2		71	71	\N	0
604	delivery	COMMUNITY HALL	620 JUDAH STREET	VICTORIA	BC	CA	V8Z 2K2		71	71	\N	0
605	delivery	40-620 JUDAH ST		VICTORIA	BC	CA	V8Z2K2		\N	71	\N	0
606	delivery	16-620 JUDAH ST		VICTORIA	BC	CA	V8Z2K2		\N	71	\N	0
607	delivery	10-620 JUDAH ST		VICTORIA	BC	CA	V8Z2K2		\N	71	\N	0
608	delivery	32-620 JUDAH ST		VICTORIA	BC	CA	V8Z2K2		\N	71	\N	0
609	delivery	6-620 JUDAH ST		VICTORIA	BC	CA	V8Z2K2		\N	71	\N	0
610	delivery	33-620 JUDAH ST		VICTORIA	BC	CA	V8Z2K2		\N	71	\N	0
611	delivery	14-620 JUDAH ST		VICTORIA	BC	CA	V8Z2K2		\N	71	\N	0
612	mailing	B14-2820 HARRIET ROAD		VICTORIA	BC	CA	V9A 1T1		72	72	\N	0
613	delivery	B14-2820 HARRIET ROAD		VICTORIA	BC	CA	V9A 1T1		72	72	\N	0
614	delivery	A1 - 2820 HARRIET RD.		VICTORIA	BC	CA	V9A1T1		\N	72	\N	0
615	delivery	A13 - 2820 HARRIET RD		VICTORIA	BC	CA	V9A1T1		\N	72	\N	0
616	delivery	B1 - 2820 HARRIET RD.		VICTORIA	BC	CA	V9A1T1		\N	72	\N	0
617	delivery	A8 - 2820 HARRIET RD		VICTORIA	BC	CA	V9A1T1		\N	72	\N	0
618	delivery	A5 - 2820 HARRIET RD.		VICTORIA	BC	CA	V9A1T1		\N	72	\N	0
619	mailing	8631 BENNETT ROAD		RICHMOND	BC	CA	V6Y 1N6		73	73	\N	0
620	delivery	8631 BENNETT ROAD		RICHMOND	BC	CA	V6Y 1N6		73	73	\N	0
621	delivery	#48 - 8631 BENNETT ROAD		RICHMOND	BC	CA	V6Y3K9		\N	73	\N	0
622	delivery	2 - 8631 BENNETT RD		RICHMOND	BC	CA	V6Y3K4		\N	73	\N	0
623	delivery	#18 - 8631 BENNETT ROAD		RICHMOND	BC	CA	V6Y3K9		\N	73	\N	0
624	delivery	11 8631 BENNETT ROAD		RICHMOND	BC	CA	V6Y1N6		\N	73	\N	0
625	delivery	24 8631 BENNETT ROAD		RICHMOND	BC	CA	V6Y1N6		\N	73	\N	0
626	delivery	#46 8631 BENNETT ROAD		RICHMOND	BC	CA	V6Y3K6		\N	73	\N	0
627	delivery	16-8631 BENNETT ROAD		RICHMOND	BC	CA	V6Y3K5		\N	73	\N	0
628	delivery	59-8631 BENNETT ROAD		RICHMOND	BC	CA	V6Y3K6		\N	73	\N	0
629	mailing	1515 WEST 1ST AVE.		VANCOUVER	BC	CA	V6J 1E8		74	74	\N	0
630	delivery	1515 WEST 1ST AVE.		VANCOUVER	BC	CA	V6J 1E8		74	74	\N	0
631	delivery	#201- 1515 WEST 1ST AVENUE		VANCOUVER	BC	CA	V6J1E8		\N	74	\N	0
632	delivery	303 - 1515 WEST 1ST AVENUE		VANCOUVER	BC	CA	V6J1E8		\N	74	\N	0
633	delivery	105-1515 W. 1ST AVE		VANCOUVER	BC	CA	V6J1E8		\N	74	\N	0
634	delivery	205 - 1515 WEST 1ST AVENUE		VANCOUVER	BC	CA	V6J1E8		\N	74	\N	0
635	delivery	101 - 1515 WEST 1ST AVENUE		VANCOUVER	BC	CA	V6J1E8		\N	74	\N	0
636	mailing	16 - 10075 FIFTH STREET		SIDNEY	BC	CA	V8L 2X8		75	75	\N	0
637	delivery	16 - 10075 FIFTH STREET		SIDNEY	BC	CA	V8L 2X8		75	75	\N	0
638	delivery	UNIT #4 - 10075 FIFTH STREET		SIDNEY	BC	CA	V8L2X8		\N	75	\N	0
639	delivery	9-10075 FIFTH STREET		SIDNEY	BC	CA	V8L2X8		\N	75	\N	0
640	delivery	13-10075 FIFTH STREET		SIDNEY	BC	CA	V8L2X8		\N	75	\N	0
641	delivery	3-10075 FIFTH STREET		SIDNEY	BC	CA	V8L2X8		\N	75	\N	0
642	mailing	4750 BRENTON PAGE ROAD		LADYSMITH	BC	CA	V9G 1L7		76	76	\N	0
643	delivery	4750 BRENTON PAGE ROAD		LADYSMITH	BC	CA	V9G 1L7		76	76	\N	0
644	delivery	4750 BRENTON PAGE RD		LADYSMITH	BC	CA	V0R2E0		\N	76	\N	0
645	delivery	4744 BRENTON PAGE RD		LADYSMITH	BC	CA	V0R2E0		\N	76	\N	0
646	delivery	C/O 505- 1195 WEST BROADWAY		VANCOUVER	BC	CA	V6H3X5		\N	76	\N	0
647	delivery	4746 BRENTON PAGE RD		LADYSMITH	BC	CA	V9G1L7		\N	76	\N	0
648	delivery	C/O 505- 1195 WEST BROADWAY		VANCOUVER	BC	CA	V6H3X5		\N	76	\N	0
649	mailing	BAYWEST MANAGEMENT CORPORATION	13468 77TH AVENUE	SURREY	BC	CA	V3W 6Y3		77	77	\N	0
650	delivery	BAYWEST MANAGEMENT CORPORATION	13468 77TH AVENUE	SURREY	BC	CA	V3W 6Y3		77	77	\N	0
651	delivery	410-5250 RUPERT ST		VANCOUVER	BC	CA	V5R2J9		\N	77	\N	0
652	delivery	#307-5250 RUPERT ST.		VANCOUVER	BC	CA	V5R2J9		\N	77	\N	0
653	delivery	#204-5250 RUPERT ST.		VANCOUVER	BC	CA	V5R2J9		\N	77	\N	0
654	delivery	#412-5250 RUPERT ST.		VANCOUVER	BC	CA	V5R2J9		\N	77	\N	0
655	delivery	308-5250 RUPERT ST		VANCOUVER	BC	CA	V5R2J9		\N	77	\N	0
656	delivery	301 - 5250 RUPERT STREET		VANCOUVER	BC	CA	V5R2J9		\N	77	\N	0
657	delivery	306 - 5250 RUPERT ST		VANCOUVER	BC	CA	V5R2J9		\N	77	\N	0
658	mailing	1550 WOODLAND DRIVE		VANCOUVER	BC	CA	V5L 5A5		78	78	\N	0
659	delivery	1550 WOODLAND DRIVE		VANCOUVER	BC	CA	V5L 5A5		78	78	\N	0
660	delivery	202 - 1550 WOODLAND DR		VANCOUVER	BC	CA	V5L5A5		\N	78	\N	0
661	delivery	1503 GRAVELEY ST		VANCOUVER	BC	CA	V5L3A5		\N	78	\N	0
662	delivery	1517 GRAVELEY ST		VANCOUVER	BC	CA	V5L3A5		\N	78	\N	0
663	delivery	308 1550 WOODLAND DRIVE		VANCOUVER	BC	CA	V5L5A5		\N	78	\N	0
664	mailing	4160 BOND STREET		BURNABY	BC	CA	V5H 1G2		79	79	\N	0
665	delivery	4160 BOND STREET		BURNABY	BC	CA	V5H 1G2		79	79	\N	0
666	delivery	4-4160 BOND ST		BURNABY	BC	CA	V5H1G2		\N	79	\N	0
667	delivery	16-4160 BOND STREET		BURNABY	BC	CA	V5H1G2		\N	79	\N	0
668	delivery	25-4160 BOND ST		BURNABY	BC	CA	V5H1G2		\N	79	\N	0
669	delivery	2-4160 BOND ST		BURNABY	BC	CA	V5H1G2		\N	79	\N	0
670	delivery	21-4160 BOND ST		BURNABY	BC	CA	V5H1G2		\N	79	\N	0
671	delivery	17-4160 BOND STREET		BURNABY	BC	CA	V5H1G2		\N	79	\N	0
672	mailing	41-10771 GILBERT RD		RICHMOND	BC	CA	V7E 6E6		80	80	\N	0
673	delivery	41-10771 GILBERT RD		RICHMOND	BC	CA	V7E 6E6		80	80	\N	0
674	delivery	29-10771 GILBERT RD		RICHMOND	BC	CA	V7E6E6		\N	80	\N	0
675	delivery	38-10771 GILBERT RD		RICHMOND	BC	CA	V7E6E6		\N	80	\N	0
676	delivery	31 - 10771 GILBERT RD		RICHMOND	BC	CA	V7E6E6		\N	80	\N	0
677	delivery	28-10771 GILBERT RD		RICHMOND	BC	CA	V7E6E6		\N	80	\N	0
678	delivery	16- 10771 GILBERT RD		RICHMOND	BC	CA	V7E6E6		\N	80	\N	0
679	delivery	15-10771 GILNERT RD		RICHMOND	BC	CA	V7E6E6		\N	80	\N	0
680	delivery	2 - 10771 GILBERT RD		RICHMOND	BC	CA	V7E6E6		\N	80	\N	0
681	mailing	45 - 7235 - 18TH AVENUE		BURNABY	BC	CA	V3N 1H4		81	81	\N	0
682	delivery	45 - 7235 - 18TH AVENUE		BURNABY	BC	CA	V3N 1H4		81	81	\N	0
683	delivery	30 - 7235 18 AVENUE		BURNABY	BC	CA	V3N1H4		\N	81	\N	0
684	delivery	15 - 7235 18 AVENUE		BURNABY	BC	CA	V3N1H4		\N	81	\N	0
685	delivery	39 - 7235 18 AVENUE		BURNABY	BC	CA	V3N1H4		\N	81	\N	0
686	delivery	7 - 7235 18TH AVENUE		BURNABY	BC	CA	V3N1H4		\N	81	\N	0
687	delivery	22 - 7235 18TH AVENUE		BURNABY	BC	CA	V3N1H4		\N	81	\N	0
688	delivery	23 - 7235 18TH AVENUE		BURNABY	BC	CA	V3N1H4		\N	81	\N	0
689	mailing	C/O AM MANAGEMENT SERVICES LTD.	766 HILLSIDE AVE	VICTORIA	BC	CA	V8T 1Z6		82	82	\N	0
690	delivery	C/O AM MANAGEMENT SERVICES LTD.	766 HILLSIDE AVE	VICTORIA	BC	CA	V8T 1Z6		82	82	\N	0
691	delivery	#13 - 236 ISLAND HIGHWAY		VICTORIA	BC	CA	V9B1G2		\N	82	\N	0
692	delivery	#16 - 236 ISLAND HIGHWAY		VICTORIA	BC	CA	V9B1G2		\N	82	\N	0
693	delivery	#10 - 236 ISLAND HIGHWAY		VICTORIA	BC	CA	V9B1G2		\N	82	\N	0
694	delivery	#1 - 236 ISLAND HIGHWAY		VICTORIA	BC	CA	V9B1G2		\N	82	\N	0
695	delivery	#6 - 236 ISLAND HIGHWAY		VICTORIA	BC	CA	V9B1G2		\N	82	\N	0
696	mailing	220 - 1651 COMMERCIAL DRIVE		VANCOUVER	BC	CA	V5L 3Y3		83	83	\N	0
697	delivery	220 - 1651 COMMERCIAL DRIVE		VANCOUVER	BC	CA	V5L 3Y3		83	83	\N	0
698	delivery	4-8191 GENERAL CURRIE ROAD		RICHMOND	BC	CA	V6Y1L9		\N	83	\N	0
699	delivery	#12 - 8191 GENERAL CURRIE ROAD		RICHMOND	BC	CA	V6Y1L9		\N	83	\N	0
700	delivery	#22 - 8191 GENERAL CURRIE ROAD		RICHMOND	BC	CA	V6Y1L9		\N	83	\N	0
701	delivery	#23 - 8191 GENERAL CURRIE ROAD		RICHMOND	BC	CA	V6Y1L9		\N	83	\N	0
702	delivery	#8 - 8191 GENERAL CURRIE ROAD		RICHMOND	BC	CA	V6Y1L9		\N	83	\N	0
703	delivery	#11 - 8191 GENERAL CURRIE ROAD		RICHMOND	BC	CA	V6Y1L9		\N	83	\N	0
704	mailing	55 - 4080 GARRY STREET		RICHMOND	BC	CA	V7E 6J9		84	84	\N	0
705	delivery	55 - 4080 GARRY STREET		RICHMOND	BC	CA	V7E 6J9		84	84	\N	0
706	delivery	16-4080 GARRY STREET		RICHMOND	BC	CA	V7E6J9		\N	84	\N	0
707	delivery	2-4080 GARRY ST		RICHMOND	BC	CA	V7E6J9		\N	84	\N	0
708	delivery	54-4080 GARRY ST		RICHMOND	BC	CA	V7E6J9		\N	84	\N	0
709	delivery	13 - 4080 GARRY STREET		RICHMOND	BC	CA	V7E6J9		\N	84	\N	0
710	delivery	27-4080 GARRY STREET		RICHMOND	BC	CA	V7E6J9		\N	84	\N	0
711	delivery	31-4080 GARRY ST		RICHMOND	BC	CA	V7E6J9		\N	84	\N	0
712	delivery	5-4080 GARRY STREET		RICHMOND	BC	CA	V7E6J9		\N	84	\N	0
713	delivery	15-4080 GARRY ST		RICHMOND	BC	CA	V7E6J9		\N	84	\N	0
714	delivery	50-4080 GARRY ST		RICHMOND	BC	CA	V7E6J9		\N	84	\N	0
715	mailing	251 CRAIG STREET		DUNCAN	BC	CA	V9L 1W2		85	85	\N	0
716	delivery	251 CRAIG STREET		DUNCAN	BC	CA	V9L 1W2		85	85	\N	0
717	delivery	1835 DEBORAH DRIVE		DUNCAN	BC	CA	V9L5A9		\N	85	\N	0
718	delivery	251 CRAIG STREET		DUNCAN	BC	CA	V9L1W2		\N	85	\N	0
719	delivery	3159 GLANA PLACE		DUNCAN	BC	CA	V9L5H5		\N	85	\N	0
720	delivery	355 DOGWOOD PLACE		DUNCAN	BC	CA	V9L1H5		\N	85	\N	0
721	delivery	355 LAKE PARK RD		LAKE COWICHAN	BC	CA	V0R2G0		\N	85	\N	0
722	mailing	105 - 120 VERNON AVENUE		KAMLOOPS	BC	CA	V2B 1L6		86	86	\N	0
723	delivery	105 - 120 VERNON AVENUE		KAMLOOPS	BC	CA	V2B 1L6		86	86	\N	0
724	delivery	312 - 120 VERNON AVE		KAMLOOPS	BC	CA	V2B1L6		\N	86	\N	0
725	delivery	401 - 120 VERNON AVE		KAMLOOPS	BC	CA	V2B1L6		\N	86	\N	0
726	delivery	103-120 VERNON AVE		KAMLOOPS	BC	CA	V2B1L6		\N	86	\N	0
727	delivery	311 - 120 VERNON AVE		KAMLOOPS	BC	CA	V2B1L6		\N	86	\N	0
728	delivery	407-120 VERNON AVE		KAMLOOPS	BC	CA	V2B1L6		\N	86	\N	0
729	delivery	306-120 VERNON AVE		KAMLOOPS	BC	CA	V2B1L6		\N	86	\N	0
730	mailing	377 BAKER STREET		NELSON	BC	CA	V1L 4H6		87	87	\N	0
731	delivery	377 BAKER STREET		NELSON	BC	CA	V1L 4H6		87	87	\N	0
732	delivery	3711 BONNINGTON RD		BONNINGTON	BC	CA	V0G2G3		\N	87	\N	0
733	delivery	712 ELWYN ST		NELSON	BC	CA	V1L3S1		\N	87	\N	0
734	delivery	1308 CEDAR ST SUIT C		NELSON	BC	CA	V1L2E8		\N	87	\N	0
735	delivery	3231 VINDUSKY RD		NELSON	BC	CA	V1L6X7		\N	87	\N	0
736	delivery	3727 MCKENZIE RD		KRESTOVA	BC	CA	V0G1H2		\N	87	\N	0
737	mailing	125 HALL STREET		NELSON	BC	CA	V1L 7B4		88	88	\N	0
738	delivery	125 HALL STREET		NELSON	BC	CA	V1L 7B4		88	88	\N	0
739	delivery	302 BEASLEY ST		NELSON	BC	CA	V1L5M4		\N	88	\N	0
740	delivery	58-2210 COLUMBIA AVENUE		CASTLEGAR	BC	CA	V1N2X1		\N	88	\N	0
741	delivery	511 SAYWARD AVE		SALMO	BC	CA	V0G1Z0		\N	88	\N	0
742	delivery	8880 OLSON ROAD		KASLO	BC	CA	V0G1M0		\N	88	\N	0
743	delivery	1057 WILDROSE RD		CASTLEGAR	BC	CA	V1N4T7		\N	88	\N	0
744	delivery	206-710 VERNON STREET		NELSON	BC	CA	V1L4G2		\N	88	\N	0
745	delivery	921 HWY 3A		NELSON	BC	CA	V1L6J5		\N	88	\N	0
746	delivery	2065 HAAGLUND ROAD		CHRISTINA LAKE	BC	CA	V0H1E3		\N	88	\N	0
747	mailing	603B CARNARVON ST		NEW WESTMINSTER	BC	CA	V3M 1E5		89	89	\N	0
748	delivery	603B CARNARVON ST		NEW WESTMINSTER	BC	CA	V3M 1E5		89	89	\N	0
749	delivery	301-7040 BALMORAL ST		BURNABY	BC	CA	V5E1J5		\N	89	\N	0
750	delivery	160-7121 14TH AVE		BURNABY	BC	CA	V3N1Z3		\N	89	\N	0
751	delivery	801-706 QUEENS AVE		NEW WESTMINSTER	BC	CA	V3M1L5		\N	89	\N	0
752	delivery	2568 QUEENS AVE		WEST VANCOUVER	BC	CA	V7V2Y8		\N	89	\N	0
753	delivery	7931 16TH AVE		BURNABY	BC	CA	V3N1R4		\N	89	\N	0
754	delivery	1859 NAPIER ST		VANCOUVER	BC	CA	V5L2N4		\N	89	\N	0
755	delivery	7250 16TH AVE		BURNABY	BC	CA	V3N1N5		\N	89	\N	0
756	mailing	303 - 1080 HOWE STREET		VANCOUVER	BC	CA	V6Z 2T1		90	90	\N	0
757	delivery	303 - 1080 HOWE STREET		VANCOUVER	BC	CA	V6Z 2T1		90	90	\N	0
758	delivery	25 CARLSON ST		KITIMAT	BC	CA	V8C1A9		\N	90	\N	0
759	delivery	4445 LAZELLE AVE		TERRACE	BC	CA	V8G1R9		\N	90	\N	0
760	delivery	5333 MOUNTAIN VISTA DR		TERRACE	BC	CA	V8G4X4		\N	90	\N	0
761	delivery	2710 MOLITOR AVENUE		TERRACE	BC	CA	V8G3A4		\N	90	\N	0
762	delivery	3903 CORY DR		TERRACE	BC	CA	V8G0J4		\N	90	\N	0
763	delivery	5020 WALSH AVENUE		TERRACE	BC	CA	V8G4H2		\N	90	\N	0
764	delivery	4508 JOHNS RD		TERRACE	BC	CA	V8G0B3		\N	90	\N	0
765	delivery	2811 SKEENA ST		TERRACE	BC	CA	V8G3K3		\N	90	\N	0
766	mailing	2435 EASTGATE PL		VICTORIA	BC	CA	V8Z 6R7		91	91	\N	0
767	delivery	2435 EASTGATE PL		VICTORIA	BC	CA	V8Z 6R7		91	91	\N	0
768	delivery	2435 EASTGATE PLACE		VICTORIA	BC	CA	V8Z6R7		\N	91	\N	0
769	delivery	808 BEXHILL PL		VICTORIA	BC	CA	V9C3V5		\N	91	\N	0
770	delivery	2894 MURRAY DR		VICTORIA	BC	CA	V9A2S7		\N	91	\N	0
771	delivery	33 - 118 ALDERSMITH PLACE		VICTORIA	BC	CA	V9A7M9		\N	91	\N	0
772	delivery	3215 LINWOOD AVE		VICTORIA	BC	CA	V8X1E5		\N	91	\N	0
773	mailing	13188 DOOLE ROAD		LADYSMITH	BC	CA			92	92	\N	0
774	delivery	13188 DOOLE ROAD		LADYSMITH	BC	CA			92	92	\N	0
775	delivery	85 ROBARTS ST		NANAIO	BC	CA	V9R2S6		\N	92	\N	0
776	delivery	13188 DOOLE ROAD		LADYSMITH	BC	CA	V9G1G6		\N	92	\N	0
777	delivery	46 ROBARTS STREET		NANAIMO	BC	CA	V9R2S4		\N	92	\N	0
778	delivery	46 ROBARTS STREET		NANAIMO	BC	CA	V9R2S4		\N	92	\N	0
779	mailing	3291 RENITA RIDGE ROAD		DUNCAN	BC	CA	V9L 5J6		93	93	\N	0
780	delivery	3291 RENITA RIDGE ROAD		DUNCAN	BC	CA	V9L 5J6		93	93	\N	0
781	delivery	1229 ROCKCREST PL		VICTORIA	BC	CA	V9A4W5		\N	93	\N	0
782	delivery	240 MCKINSTRY RD		DUNCAN	BC	CA	V9L3L2		\N	93	\N	0
783	delivery	5905 INDIAN ROAD		DUNCAN	BC	CA	V9L5L9		\N	93	\N	0
784	delivery	1721 COWICHAN BAY ROAD		DUNCAN	BC	CA	V0R1N0		\N	93	\N	0
785	delivery	3291 RENITA RIDGE RD		DUNCAN	BC	CA	V9L5J6		\N	93	\N	0
786	delivery	1040 DUFFERIN CRES		NANAIMO	BC	CA	V9S2B6		\N	93	\N	0
787	mailing	P.O. BOX 415		GOLDEN	BC	CA	V0A 1H0		94	94	\N	0
788	delivery	421 - 9TH AVENUE NORTH, SUITE 208		GOLDEN	BC	CA	V0A 1H0		94	94	\N	0
789	delivery	515 TRANS CANADA HIGHWAY		GOLDEN	BC	CA	V0A1H1		\N	94	\N	0
790	delivery	1510 CEDAR STREET		GOLDEN	BC	CA	V0A1H6		\N	94	\N	0
791	delivery	1390 PINE DRIVE		GOLDEN	BC	CA	V0A1H1		\N	94	\N	0
792	delivery	1515 CEDAR STREET		GOLDEN	BC	CA	V0A1H6		\N	94	\N	0
793	mailing	1375 ELKVIEW TRAIL		CASTLEGAR	BC	CA	V1N 4S2		95	95	\N	0
794	delivery	1375 ELKVIEW TRAIL		CASTLEGAR	BC	CA	V1N 4S2		95	95	\N	0
795	delivery	1351 ELKVIEW TRAIL		CASTLEGAR	BC	CA	V1N4S2		\N	95	\N	0
796	delivery	1723 MOUNTAIN RIDGE ROAD		CASTLEGER	BC	CA	V1N4S2		\N	95	\N	0
797	delivery	1375 ELVIEW TRAIL		CASTLEGER	BC	CA	V1N4S2		\N	95	\N	0
798	delivery	1311 ELKVIEW TRAIL		CASTLEGAR	BC	CA	V1N4S2		\N	95	\N	0
799	mailing	6 - 4711 ELIZABETH STREET		PORT ALBERNI	BC	CA	V9Y 6M1		96	96	\N	0
800	delivery	6 - 4711 ELIZABETH STREET		PORT ALBERNI	BC	CA	V9Y 6M1		96	96	\N	0
801	delivery	8354 DICKSON DRIVE		PORT ALBERNI	BC	CA	V9Y9B5		\N	96	\N	0
802	delivery	3015 7TH AVENUE		PORT ALBERNI	BC	CA	V9Y2J2		\N	96	\N	0
803	delivery	5559 WOODLAND CRESENCET WEST		PORT ALBERNI	BC	CA	V9Y8E6		\N	96	\N	0
804	delivery	3955 16TH AVENUE		PORT ALBERNI	BC	CA	V9Y5L3		\N	96	\N	0
805	delivery	5510 WOODLAND CRESCENT EAST		PORT ALBERNI	BC	CA	V9Y8E6		\N	96	\N	0
806	delivery	4087 MARPOLE STREET		PORT ALBERNI	BC	CA	V9Y9B5		\N	96	\N	0
807	delivery	2132 MOTION DRIVE		PORT ALBERNI	BC	CA	V9Y1B3		\N	96	\N	0
808	delivery	3169 2ND AVENUE		PORT ALBERNI	BC	CA	V9Y4C4		\N	96	\N	0
809	delivery	4988 HELEN STREET		PORT ALBERNI	BC	CA	V9Y7N6		\N	96	\N	0
810	mailing	1391 COMMERCIAL DR.		VANCOUVER	BC	CA	V5L 3X5		97	97	\N	0
811	delivery	1391 COMMERCIAL DR.		VANCOUVER	BC	CA	V5L 3X5		97	97	\N	0
812	delivery	3272 W. KING EDWARD AVENUE		VANCOUVER	BC	CA	V6L1V7		\N	97	\N	0
813	delivery	3521 MARSHALL STREET		VANCOUVER	BC	CA	V5N4S2		\N	97	\N	0
814	delivery	3666 YALE STREET		VANCOUVER	BC	CA	V5K1C8		\N	97	\N	0
815	delivery	NO.107 - 3477 COMMERCIAL STREET		VANCOUVER	BC	CA	V5N4E8		\N	97	\N	0
816	delivery	1745 E. 3RD AVENUE		VANCOUVER	BC	CA	V5N1H3		\N	97	\N	0
817	delivery	NO. 516 - 103 POWELL STREET		VANCOUVER	BC	CA	V6A1G2		\N	97	\N	0
424	delivery	123		VICTORIA	BC	CA	V8T 3Z7		51	100	\N	1
424	delivery	3045 UNIT A JACKSON ST		VICTORIA	BC	CA	V8T 3Z7		51	51	100	0
818	delivery	123 Test Street		Victoria	BC	CA	V8V4K9		\N	101	\N	0
829	mailing	549 11TH AVENUE		CASTLEGAR	BC	CA	V1N 1J6		99	103	\N	0
830	delivery	549 11TH AVENUE		CASTLEGAR	BC	CA	V1N 1J6		99	103	\N	0
831	delivery	168 CRESCENT STREET		CASTLEGAR	BC	CA	V1N1B1		\N	103	\N	0
832	delivery	279-3385 UPPER LEVELS RD		ROBSON	BC	CA	V0G1X0		\N	103	\N	0
833	delivery	1037 RASPBERRY ROAD		CASTLEGAR	BC	CA	V1N4T7		\N	103	\N	0
834	delivery	27-3969 BROADWATER RD		CASTLEGAR	BC	CA	V1N4V5		\N	103	\N	0
835	delivery	3814-5TH AVE		CASTLEGAR	BC	CA	V1N4Y5		\N	103	\N	0
836	delivery	1061 BRIDGEVIEW CRESCENT		CASTLEGAR	BC	CA	V1N4L1		\N	103	\N	0
837	delivery	3708-5TH AVENUE		CASTLEGAR	BC	CA	V1N4Y3		\N	103	\N	0
838	delivery	208, 825 MERRY CREEK ROAD		CASTLEGAR	BC	CA	V1N2P1		\N	103	\N	0
839	mailing	3045 UNIT A JACKSON ST		VICTORIA	BC	CA	V8T 3Z7		100	104	\N	0
840	delivery	3045 UNIT A JACKSON ST		VICTORIA	BC	CA	V8T 3Z7		100	104	\N	0
841	delivery	38-1120 SUMMIT AVE.		VICTORIA	BC	CA	V8T2P6		\N	104	\N	0
842	delivery	11-3045 JACKSON ST.		VICTORIA	BC	CA	V8T3Z7		\N	104	\N	0
843	delivery	27 - 3045 JACKSON ST		VICTORIA	BC	CA	V8T3Z7		\N	104	\N	0
844	delivery	12-1120 SUMMIT AVE.		VICTORIA	BC	CA	V8T2P6		\N	104	\N	0
845	delivery	29-3045 JACKSON ST		VICTORIA	BC	CA	V8T3Z7		\N	104	\N	0
846	delivery	32-1120 SUMMIT AVE.		VICTORIA	BC	CA	V8T2P6		\N	104	\N	0
847	delivery	10-1120 SUMMIT AVE.		VICTORIA	BC	CA	V8T2P6		\N	104	\N	0
848	mailing	502 - 373 BURNSIDE RD. E.		VICTORIA	BC	CA	V9A 1A7		101	105	\N	0
849	delivery	502 - 373 BURNSIDE RD. E.		VICTORIA	BC	CA	V9A 1A7		101	105	\N	0
850	delivery	3-3136 WASHINGTON AVE		VICTORIA	BC	CA	V9A1P6		\N	105	\N	0
851	delivery	101-373 BURNSIDE RD, EAST		VICTORIA	BC	CA	V9A1A7		\N	105	\N	0
852	delivery	1-3142 WASHINGTON AVE		VICTORIA	BC	CA	V9A1P6		\N	105	\N	0
853	delivery	202 - 373 BURNSIDE ROAD EAST		VICTORIA	BC	CA	V9A1A7		\N	105	\N	0
854	delivery	303-373 BURNSIDE RD, EAST		VICTORIA	BC	CA	V9A1A7		\N	105	\N	0
855	delivery	301-373 BURNSIDE RD, EAST		VICTORIA	BC	CA	V9A1A7		\N	105	\N	0
856	delivery	106-373 BURNSIDE ROAD E		VICTORIA	BC	CA	V9A1A7		\N	105	\N	0
857	delivery	103-373 BURNSIDE RD. EAST		VICTORIA	BC	CA	V9A1A7		\N	105	\N	0
858	mailing	25 - 7365 CEDAR ST.		MISSION	BC	CA	V2V 5S7		102	106	\N	0
859	delivery	25 - 7365 CEDAR ST.		MISSION	BC	CA	V2V 5S7		102	106	\N	0
860	delivery	58-7365 CEDAR ST		MISSION	BC	CA	V2V5S7		\N	106	\N	0
861	delivery	44-7365 CEDAR STREET		MISSION	BC	CA	V2V5S7		\N	106	\N	0
862	delivery	33 - 7365 CEDAR ST		MISSION	BC	CA	V2V5S7		\N	106	\N	0
863	delivery	31 - 7365 CEDAR ST		MISSION	BC	CA	V2V5S7		\N	106	\N	0
864	delivery	53-7365 CEDAR ST		MISSION	BC	CA	V2V5S7		\N	106	\N	0
865	delivery	#33 - 7365 CEDAR ST.		MISSION	BC	CA	V2V5S7		\N	106	\N	0
866	delivery	65-7365 CEDAR ST		MISSION	BC	CA	V2V5S7		\N	106	\N	0
867	delivery	87 7365 CEDAR STREET		MISSION	BC	CA	V2V5S7		\N	106	\N	0
868	delivery	1-7365 CEDAR STREET		MISSION	BC	CA	V2V5S7		\N	106	\N	0
869	mailing	777 BAKER STREET		NELSON	BC	CA	V1L 4H4		103	107	\N	0
870	delivery	777 BAKER STREET		NELSON	BC	CA	V1L 4H4		103	107	\N	0
871	delivery	710 FELLER RD		NELSON	BC	CA	V1L4B7		\N	107	\N	0
872	delivery	3642 MOUNTAINVIEW RD		BONNINGTON	BC	CA	V0G2G3		\N	107	\N	0
873	delivery	233 D AVENUE		KASLO	BC	CA	V0G1M0		\N	107	\N	0
874	delivery	6724 HARROP-PROCTOR ROAD		NELSON	BC	CA	V1L6R2		\N	107	\N	0
875	delivery	206 DELBRUCK ST		NELSON	BC	CA	V1L5L1		\N	107	\N	0
876	delivery	4-916 EDGEWOOD AVE		NELSON	BC	CA	V1L4C9		\N	107	\N	0
877	delivery	203-622 FRONT STREET		NELSON	BC	CA	V1L4B7		\N	107	\N	0
878	delivery	4761 BEASLEY ROAD		SOUTH SLOCAN	BC	CA	V0G2G2		\N	107	\N	0
879	mailing	BOX 45		VANCOUVER	BC	CA	V6E 1V9		104	108	\N	0
880	delivery	784 THURLOW STREET		VANCOUVER	BC	CA	V6E 1V9		104	108	\N	0
881	delivery	28-784 THURLOW ST		VANCOUVER	BC	CA	V6E1V9		\N	108	\N	0
882	delivery	14 - 787 THURLOW STREET		VANCOUVER	BC	CA	V6E1V9		\N	108	\N	0
883	delivery	2 - 784 THURLOW STREET		VANCOUVER	BC	CA	V6E1V9		\N	108	\N	0
884	delivery	29 - 784 THURLOW STREET		VANCOUVER	BC	CA	V6E1V9		\N	108	\N	0
885	delivery	40 - 784 THURLOW STREET		VANCOUVER	BC	CA	V6E1V9		\N	108	\N	0
886	delivery	41 - 784 THURLOW STREET		VANCOUVER	BC	CA	V6E1V9		\N	108	\N	0
887	delivery	27 - 784 THURLOW STREET		VANCOUVER	BC	CA	V6E1V9		\N	108	\N	0
888	delivery	25 - 784 THURLOW STREET		VACOUVER	BC	CA	V6E1V9		\N	108	\N	0
889	mailing	7122-138TH STREET		SURREY	BC	CA	V3W 7V7		105	109	\N	0
890	delivery	7122-138TH STREET		SURREY	BC	CA	V3W 7V7		105	109	\N	0
891	delivery	209-7102 138TH STREET		SURREY	BC	CA	V3W7V7		\N	109	\N	0
892	delivery	70-7158 138TH ST		SURREY	BC	CA	V3W7V7		\N	109	\N	0
893	delivery	204 - 7102 138TH ST		SURREY	BC	CA	V3W7V8		\N	109	\N	0
894	delivery	105, 7102 - 138 STREET		SURREY	BC	CA	V3W7V8		\N	109	\N	0
895	delivery	53 - 7150 - 138TH STREET		SURREY	BC	CA	V3W7V8		\N	109	\N	0
896	delivery	208-7102 138TH STREET		SURREY	BC	CA	V3W7V6		\N	109	\N	0
897	delivery	54-7150 138TH STREET		SURREY	BC	CA	V3W7V7		\N	109	\N	0
898	delivery	33 - 7134 - 138TH STREET		SURREY	BC	CA	V3W7V7		\N	109	\N	0
899	delivery	205-7102-138TH ST		SURREY	BC	CA	V3W7V8		\N	109	\N	0
900	mailing	#106-4221 MAYBERRY STREET		BURNABY	BC	CA	V5H 4E8		106	110	\N	0
901	delivery	#106-4221 MAYBERRY STREET		BURNABY	BC	CA	V5H 4E8		106	110	\N	0
902	delivery	#1601 - 4221 MAYBERRY STREET		BURNABY	BC	CA	V5H4E8		\N	110	\N	0
903	delivery	1003 - 4221 MAYBERRY STREET		BURNABY	BC	CA	V5H4E8		\N	110	\N	0
904	delivery	#0201 - 4221 MAYBERRY STREET		BURNABY	BC	CA	V5H4E8		\N	110	\N	0
905	delivery	#1506-4221 MAYBERRY STREET		BURNABY	BC	CA	V5H4E8		\N	110	\N	0
906	delivery	1905 - 4221 MAYBERRY STREET		BURNABY	BC	CA	V5H4E8		\N	110	\N	0
907	delivery	1505-4221 MAYBERRY STREET		BURNABYBC	BC	CA	V5H4E8		\N	110	\N	0
908	delivery	1504-4221 MAYBERRY STREET		BURNABY	BC	CA	V5H4E8		\N	110	\N	0
909	mailing	81 - 1415 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H 3W1		107	111	\N	0
910	delivery	81 - 1415 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H 3W1		107	111	\N	0
911	delivery	56-1415 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H3W1		\N	111	\N	0
912	delivery	12-1415 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H3W1		\N	111	\N	0
913	delivery	5-1465 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H3W1		\N	111	\N	0
914	delivery	1-1415 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H3W1		\N	111	\N	0
915	delivery	7-1465 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H3W1		\N	111	\N	0
916	delivery	10 1415 LAMEY'S MILL RD		VANCOUVER	BC	CA	V6H3W1		\N	111	\N	0
917	delivery	3-1415 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H3W1		\N	111	\N	0
918	delivery	38-1415 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H3W1		\N	111	\N	0
919	mailing	1707 - 130TH ST.		SURREY	BC	CA	V4A 4A2		108	112	\N	0
920	delivery	1707 - 130TH ST.		SURREY	BC	CA	V4A 4A2		108	112	\N	0
921	delivery	111-1701 130TH STREET		SURREY	BC	CA	V4A4A2		\N	112	\N	0
922	delivery	103-1739 130TH STREET		SURREY	BC	CA	V4A4A2		\N	112	\N	0
923	delivery	110-1701 130TH STREET		SURREY	BC	CA	V4A4A2		\N	112	\N	0
924	delivery	106-1747 130TH STREET		SURREY	BC	CA	V4A4A2		\N	112	\N	0
925	delivery	106-1715 130TH STREET		SURREY	BC	CA	V4A4A2		\N	112	\N	0
926	delivery	103-1703 130TH STREET		SURREY	BC	CA	V4A4A2		\N	112	\N	0
927	delivery	102-1717 130TH STREET		SURREY	BC	CA	V4A4A2		\N	112	\N	0
928	delivery	108-1739 130TH STREET		SURREY	BC	CA	V4A4A2		\N	112	\N	0
929	delivery	106-1739 130TH STREET		SURREY	BC	CA	V4A4A2		\N	112	\N	0
930	mailing	8303 - 92 AVE		FORT ST JOHN	BC	CA	V1J 6C7		109	113	\N	0
931	delivery	8303 - 92 AVE		FORT ST JOHN	BC	CA	V1J 6C7		109	113	\N	0
932	delivery	67-8303 92ND AVENUE		FORT ST. JOHN	BC	CA	V1J6C7		\N	113	\N	0
933	delivery	57-8303 92ND AVENUE		FORT ST. JOHN	BC	CA	V1J6C7		\N	113	\N	0
934	delivery	#30 8303-92ND AVE		FORT ST. JOHN	BC	CA	V1J6C7		\N	113	\N	0
935	delivery	#50 8303-92ND AVE		FORT ST.JOHN	BC	CA	V1J6C7		\N	113	\N	0
936	delivery	#15 8303-92ND AVE		FORT ST. JOHN	BC	CA	V1J6C7		\N	113	\N	0
937	delivery	24-8303 92ND AVENUE		FORT ST. JOHN	BC	CA	V1J6C7		\N	113	\N	0
938	mailing	C/O BAYWEST PROPERT MANAGEMENT SERVICES	13468 77TH AVENUE	SURREY	BC	CA	V3W 6Y3		110	114	\N	0
939	delivery	C/O BAYWEST PROPERT MANAGEMENT SERVICES	13468 77TH AVENUE	SURREY	BC	CA	V3W 6Y3		110	114	\N	0
940	delivery	119-13820-72 AVE		SURREY	BC	CA	V3W7V9		\N	114	\N	0
941	delivery	305-13820-72 AVE		SURREY	BC	CA	V3W7V9		\N	114	\N	0
942	delivery	110 - 13820 72 AVE		SURREY	BC	CA	V3W7V9		\N	114	\N	0
943	delivery	209 - 13820 72 AVE		SURREY	BC	CA	V3W7V9		\N	114	\N	0
944	delivery	211-13820-72 AVE		SURREY	BC	CA	V3W7V9		\N	114	\N	0
945	delivery	117 - 13820 72 AVE		SURREY	BC	CA	V3W7V9		\N	114	\N	0
946	delivery	214-13820-72 AVE		SURREY	BC	CA	V3W7V9		\N	114	\N	0
947	delivery	202 - 13820 72 AVE		SURREY	BC	CA	V3W7V9		\N	114	\N	0
948	mailing	220 - 1651 COMMERCIAL DR		VANCOUVER	BC	CA	V5L 3Y3		111	115	\N	0
949	delivery	220 - 1651 COMMERCIAL DR		VANCOUVER	BC	CA	V5L 3Y3		111	115	\N	0
950	delivery	4 - 12 WEST 10TH AVENUE		VANCOUVER	BC	CA	V5Y1R6		\N	115	\N	0
951	delivery	18 - 12 WEST 10TH AVENUE		VANCOUVER	BC	CA	V5Y1R6		\N	115	\N	0
952	delivery	27 - 12 WEST 10TH AVENUE		VANCOUVER	BC	CA	V5Y1R6		\N	115	\N	0
953	delivery	1 - 12 WEST 10TH AVE		VANCOUVER	BC	CA	V5Y1R6		\N	115	\N	0
954	delivery	20 - 12 WEST 10TH AVENUE		VANCOUVER	BC	CA	V5Y1R6		\N	115	\N	0
955	mailing	400 - 2378 CRESCENT WAY		ABBOTSFORD	BC	CA	V2S 3M2		112	116	\N	0
956	delivery	33497 BEVAN AVENUE		ABBOTSFORD	BC	CA	V2S 6H5		112	116	\N	0
957	delivery	#207-2378 CRESCENT WAY		ABBOTSFORD	BC	CA	V2S3M2		\N	116	\N	0
958	delivery	#20-33497 BEVAN AVENUE		ABBOTSFORD	BC	CA	V2S6H5		\N	116	\N	0
959	delivery	#301-2378 CRESCENT WAY		ABBOTSFORD	BC	CA	V2S3M2		\N	116	\N	0
960	delivery	#9-33493 BEVAN AVENUE		ABBOTSFORD	BC	CA	V2S6H5		\N	116	\N	0
961	delivery	#33-33474 CANNON AVENUE		ABBOTSFORD	BC	CA	V2S6H4		\N	116	\N	0
962	mailing	1651 COMMERCIAL DRIVE UNIT 220		VANCOUVER	BC	CA	V5L 3Y3		113	117	\N	0
963	delivery	1651 COMMERCIAL DRIVE UNIT 220		VANCOUVER	BC	CA	V5L 3Y3		113	117	\N	0
964	delivery	401-3637 CAMBIE STREET		VANCOUVER	BC	CA	V5Z2X3		\N	117	\N	0
965	delivery	208-3637 CAMBIE STREET		VANCOUVER	BC	CA	V5Z2X3		\N	117	\N	0
966	delivery	307-3637 CAMBIE ST		VANCOUVER	BC	CA	V5Z2X3		\N	117	\N	0
967	delivery	305 - 3637 CAMBIE STREET		VANCOUVER	BC	CA	V5Z2X3		\N	117	\N	0
968	delivery	306-3637 CAMBIE ST		VANCOUVER	BC	CA	V5Z2X3		\N	117	\N	0
969	delivery	205-3637 CAMBIE STREET		VANCOUVER	BC	CA	V5Z2X3		\N	117	\N	0
970	delivery	204 - 3637 CAMBIE STREET		VANCOUVER	BC	CA	V5Z2X3		\N	117	\N	0
971	delivery	409-3637 CAMBIE ST		VANCOUVER	BC	CA	V5Z2X3		\N	117	\N	0
972	mailing	C/O LOUISE BERKETA	55-22308 124 AVENUE	MAPLE RIDGE	BC	CA	V2X 0R6		114	118	\N	0
973	delivery	C/O LOUISE BERKETA	55-22308 124 AVENUE	MAPLE RIDGE	BC	CA	V2X 0R6		114	118	\N	0
974	delivery	3-2083 SHAUGNESSY ST		PORT COQUITLAM	BC	CA	V3C3C4		\N	118	\N	0
975	delivery	11-2083 SHAUGHNESSY ST		PORT COQUITLAM	BC	CA	V3C3C4		\N	118	\N	0
976	delivery	20-2083 SHAUGHNESSY STREET		PORT COQUITLAM	BC	CA	V3C3C4		\N	118	\N	0
977	delivery	21 2083 SHAUGHNESSY ST		PORT COQUITLAM	BC	CA	V3C3C4		\N	118	\N	0
978	delivery	7-2083 SHAUGHNESSY STREET		PORT COQUITLAM	BC	CA	V3C3C4		\N	118	\N	0
979	delivery	10-2083 SHAUGHNESSY STREET		PORT COQUITLAM	BC	CA	V3C3C4		\N	118	\N	0
980	delivery	9-2083 SHAUGHNESSY ST		PORT COQUITLAM	BC	CA	V3C3C4		\N	118	\N	0
981	mailing	1-1692 SILVERWOOD CRESCENT		CASTLEGAR	BC	CA	V1N 2M1		115	119	\N	0
982	delivery	1-1692 SILVERWOOD CRESCENT		CASTLEGAR	BC	CA	V1N 2M1		115	119	\N	0
983	delivery	6 - 1682 SILVERWOOD CRES.		CASTLEGAR	BC	CA	V1N2M1		\N	119	\N	0
984	delivery	5 1684 SILVERWOOD CRESCENT		CASTLEGAR	BC	CA	V1N2M1		\N	119	\N	0
985	delivery	5 - 1686 SILVERWOOD CRES.		CASTLEGAR	BC	CA	V1N2M1		\N	119	\N	0
986	delivery	6 1674 SILVERWOOD CRESC.		CASTLEGAR	BC	CA	V1N2M1		\N	119	\N	0
987	delivery	1-1686 SILVERWOOD CRESCENT		CASTLEGAR	BC	CA	V1N2M1		\N	119	\N	0
988	delivery	2-1676 SILVERWOOD CRESCENT		CASTELGAR	BC	CA	V1N2M1		\N	119	\N	0
989	mailing	103 - 13435 104 AVENUE		SURREY	BC	CA	V3T 5K6		116	120	\N	0
990	delivery	103 - 13435 104 AVENUE		SURREY	BC	CA	V3T 5K6		116	120	\N	0
991	delivery	#1005 - 13435 104TH AVE		SURREY	BC	CA	V3T5K6		\N	120	\N	0
992	delivery	701-13435 104TH AVE		SURREY	BC	CA	V3T5K6		\N	120	\N	0
993	delivery	#904 13435 104 AVE		SURREY	BC	CA	V3T5K6		\N	120	\N	0
994	delivery	#1201 - 13435 104TH AVE		SURREY	BC	CA	V3T5K6		\N	120	\N	0
995	delivery	203-13435 104TH AVE		SURREY	BC	CA	V3T5K6		\N	120	\N	0
996	delivery	#506 - 13435 104TH AVE		SURREY	BC	CA	V3T5K6		\N	120	\N	0
997	delivery	#206 13435 104TH AVE		SURREY	BC	CA	V3T5K6		\N	120	\N	0
998	mailing	PO BOX 580		PARKSVILLE	BC	CA	V9P 2G6		117	121	\N	0
999	delivery	118 MCMILLAN STREET		PARKSVILLE	BC	CA	V9P 2G6		117	121	\N	0
1000	delivery	B - 394 CRAIG STREET		PARKSVILLE	BC	CA	V9P1L4		\N	121	\N	0
1001	delivery	UNIT I 394 CRAIG ST.		PARKSVILLE	BC	CA	V9P1L4		\N	121	\N	0
1002	delivery	UNIT K 394 CRAIG ST.		PARKSVILLE	BC	CA	V9P1L4		\N	121	\N	0
1003	delivery	H - 394 CRAIG STREET		PARKSVILLE	BC	CA	V9P1L4		\N	121	\N	0
1004	mailing	2017 WEST 5TH AVENUE		VANCOUVER	BC	CA	V6J 1P8		118	122	\N	0
1005	delivery	2017 WEST 5TH AVENUE		VANCOUVER	BC	CA	V6J 1P8		118	122	\N	0
1006	delivery	202-2286 W 5TH AVE		VANCOUVER	BC	CA	V6K1S3		\N	122	\N	0
1007	delivery	301 - 2286 WEST 5TH AVE		VANCOUVER	BC	CA	V6K1S3		\N	122	\N	0
1008	delivery	301-2017 W 5TH AVE		VANCOUVER	BC	CA	V6J1P8		\N	122	\N	0
1009	delivery	201 - 2017 WEST 5TH AVE		VANCOUVER	BC	CA	V6J1P8		\N	122	\N	0
1010	delivery	302 - 2286 WEST 5TH AVE		VANCOUVER	BC	CA	V6K1S3		\N	122	\N	0
1011	mailing	2616 WEST BROADWAY		VANCOUVER	BC	CA	V6K 2G3		119	123	\N	0
1012	delivery	2616 WEST BROADWAY		VANCOUVER	BC	CA	V6K 2G3		119	123	\N	0
1013	delivery	404 2616 WEST BROADWAY		VANCOUVER	BC	CA	V6K2G3		\N	123	\N	0
1014	delivery	206-2616 W. BROADWAY		VANCOUVER	BC	CA	V6K2G3		\N	123	\N	0
1015	delivery	303-2616 W. BROADWAY		VANCOUVER	BC	CA	V6K2G3		\N	123	\N	0
1016	delivery	302-2616 W. BROADWAY		VANCOUVER	BC	CA	V6K2G3		\N	123	\N	0
1017	delivery	307 2616 WEST BROADWAY		VANCOUVER	BC	CA	V6K2G3		\N	123	\N	0
1018	delivery	208-2616 W. BROADWAY		VANCOUVER	BC	CA	V6K2G3		\N	123	\N	0
1019	mailing	COMMUNITY HALL	620 JUDAH STREET	VICTORIA	BC	CA	V8Z 2K2		120	124	\N	0
1020	delivery	COMMUNITY HALL	620 JUDAH STREET	VICTORIA	BC	CA	V8Z 2K2		120	124	\N	0
1021	delivery	40-620 JUDAH ST		VICTORIA	BC	CA	V8Z2K2		\N	124	\N	0
1022	delivery	16-620 JUDAH ST		VICTORIA	BC	CA	V8Z2K2		\N	124	\N	0
1023	delivery	10-620 JUDAH ST		VICTORIA	BC	CA	V8Z2K2		\N	124	\N	0
1024	delivery	32-620 JUDAH ST		VICTORIA	BC	CA	V8Z2K2		\N	124	\N	0
1025	delivery	6-620 JUDAH ST		VICTORIA	BC	CA	V8Z2K2		\N	124	\N	0
1026	delivery	33-620 JUDAH ST		VICTORIA	BC	CA	V8Z2K2		\N	124	\N	0
1027	delivery	14-620 JUDAH ST		VICTORIA	BC	CA	V8Z2K2		\N	124	\N	0
1028	mailing	B14-2820 HARRIET ROAD		VICTORIA	BC	CA	V9A 1T1		121	125	\N	0
1029	delivery	B14-2820 HARRIET ROAD		VICTORIA	BC	CA	V9A 1T1		121	125	\N	0
1030	delivery	A1 - 2820 HARRIET RD.		VICTORIA	BC	CA	V9A1T1		\N	125	\N	0
1031	delivery	A13 - 2820 HARRIET RD		VICTORIA	BC	CA	V9A1T1		\N	125	\N	0
1032	delivery	B1 - 2820 HARRIET RD.		VICTORIA	BC	CA	V9A1T1		\N	125	\N	0
1033	delivery	A8 - 2820 HARRIET RD		VICTORIA	BC	CA	V9A1T1		\N	125	\N	0
1034	delivery	A5 - 2820 HARRIET RD.		VICTORIA	BC	CA	V9A1T1		\N	125	\N	0
1035	mailing	8631 BENNETT ROAD		RICHMOND	BC	CA	V6Y 1N6		122	126	\N	0
1036	delivery	8631 BENNETT ROAD		RICHMOND	BC	CA	V6Y 1N6		122	126	\N	0
1037	delivery	#48 - 8631 BENNETT ROAD		RICHMOND	BC	CA	V6Y3K9		\N	126	\N	0
1038	delivery	2 - 8631 BENNETT RD		RICHMOND	BC	CA	V6Y3K4		\N	126	\N	0
1039	delivery	#18 - 8631 BENNETT ROAD		RICHMOND	BC	CA	V6Y3K9		\N	126	\N	0
1040	delivery	11 8631 BENNETT ROAD		RICHMOND	BC	CA	V6Y1N6		\N	126	\N	0
1041	delivery	24 8631 BENNETT ROAD		RICHMOND	BC	CA	V6Y1N6		\N	126	\N	0
1042	delivery	#46 8631 BENNETT ROAD		RICHMOND	BC	CA	V6Y3K6		\N	126	\N	0
1043	delivery	16-8631 BENNETT ROAD		RICHMOND	BC	CA	V6Y3K5		\N	126	\N	0
1044	delivery	59-8631 BENNETT ROAD		RICHMOND	BC	CA	V6Y3K6		\N	126	\N	0
1045	mailing	1515 WEST 1ST AVE.		VANCOUVER	BC	CA	V6J 1E8		123	127	\N	0
1046	delivery	1515 WEST 1ST AVE.		VANCOUVER	BC	CA	V6J 1E8		123	127	\N	0
1047	delivery	#201- 1515 WEST 1ST AVENUE		VANCOUVER	BC	CA	V6J1E8		\N	127	\N	0
1048	delivery	303 - 1515 WEST 1ST AVENUE		VANCOUVER	BC	CA	V6J1E8		\N	127	\N	0
1049	delivery	105-1515 W. 1ST AVE		VANCOUVER	BC	CA	V6J1E8		\N	127	\N	0
1050	delivery	205 - 1515 WEST 1ST AVENUE		VANCOUVER	BC	CA	V6J1E8		\N	127	\N	0
1051	delivery	101 - 1515 WEST 1ST AVENUE		VANCOUVER	BC	CA	V6J1E8		\N	127	\N	0
1052	mailing	16 - 10075 FIFTH STREET		SIDNEY	BC	CA	V8L 2X8		124	128	\N	0
1053	delivery	16 - 10075 FIFTH STREET		SIDNEY	BC	CA	V8L 2X8		124	128	\N	0
1054	delivery	UNIT #4 - 10075 FIFTH STREET		SIDNEY	BC	CA	V8L2X8		\N	128	\N	0
1055	delivery	9-10075 FIFTH STREET		SIDNEY	BC	CA	V8L2X8		\N	128	\N	0
1056	delivery	13-10075 FIFTH STREET		SIDNEY	BC	CA	V8L2X8		\N	128	\N	0
1057	delivery	3-10075 FIFTH STREET		SIDNEY	BC	CA	V8L2X8		\N	128	\N	0
1058	mailing	4750 BRENTON PAGE ROAD		LADYSMITH	BC	CA	V9G 1L7		125	129	\N	0
1059	delivery	4750 BRENTON PAGE ROAD		LADYSMITH	BC	CA	V9G 1L7		125	129	\N	0
1060	delivery	4750 BRENTON PAGE RD		LADYSMITH	BC	CA	V0R2E0		\N	129	\N	0
1061	delivery	4744 BRENTON PAGE RD		LADYSMITH	BC	CA	V0R2E0		\N	129	\N	0
1062	delivery	C/O 505- 1195 WEST BROADWAY		VANCOUVER	BC	CA	V6H3X5		\N	129	\N	0
1063	delivery	4746 BRENTON PAGE RD		LADYSMITH	BC	CA	V9G1L7		\N	129	\N	0
1064	delivery	C/O 505- 1195 WEST BROADWAY		VANCOUVER	BC	CA	V6H3X5		\N	129	\N	0
1065	mailing	BAYWEST MANAGEMENT CORPORATION	13468 77TH AVENUE	SURREY	BC	CA	V3W 6Y3		126	130	\N	0
1066	delivery	BAYWEST MANAGEMENT CORPORATION	13468 77TH AVENUE	SURREY	BC	CA	V3W 6Y3		126	130	\N	0
1067	delivery	410-5250 RUPERT ST		VANCOUVER	BC	CA	V5R2J9		\N	130	\N	0
1068	delivery	#307-5250 RUPERT ST.		VANCOUVER	BC	CA	V5R2J9		\N	130	\N	0
1069	delivery	#204-5250 RUPERT ST.		VANCOUVER	BC	CA	V5R2J9		\N	130	\N	0
1070	delivery	#412-5250 RUPERT ST.		VANCOUVER	BC	CA	V5R2J9		\N	130	\N	0
1071	delivery	308-5250 RUPERT ST		VANCOUVER	BC	CA	V5R2J9		\N	130	\N	0
1072	delivery	301 - 5250 RUPERT STREET		VANCOUVER	BC	CA	V5R2J9		\N	130	\N	0
1073	delivery	306 - 5250 RUPERT ST		VANCOUVER	BC	CA	V5R2J9		\N	130	\N	0
1074	mailing	1550 WOODLAND DRIVE		VANCOUVER	BC	CA	V5L 5A5		127	131	\N	0
1075	delivery	1550 WOODLAND DRIVE		VANCOUVER	BC	CA	V5L 5A5		127	131	\N	0
1076	delivery	202 - 1550 WOODLAND DR		VANCOUVER	BC	CA	V5L5A5		\N	131	\N	0
1077	delivery	1503 GRAVELEY ST		VANCOUVER	BC	CA	V5L3A5		\N	131	\N	0
1078	delivery	1517 GRAVELEY ST		VANCOUVER	BC	CA	V5L3A5		\N	131	\N	0
1079	delivery	308 1550 WOODLAND DRIVE		VANCOUVER	BC	CA	V5L5A5		\N	131	\N	0
1080	mailing	4160 BOND STREET		BURNABY	BC	CA	V5H 1G2		128	132	\N	0
1081	delivery	4160 BOND STREET		BURNABY	BC	CA	V5H 1G2		128	132	\N	0
1082	delivery	4-4160 BOND ST		BURNABY	BC	CA	V5H1G2		\N	132	\N	0
1083	delivery	16-4160 BOND STREET		BURNABY	BC	CA	V5H1G2		\N	132	\N	0
1084	delivery	25-4160 BOND ST		BURNABY	BC	CA	V5H1G2		\N	132	\N	0
1085	delivery	2-4160 BOND ST		BURNABY	BC	CA	V5H1G2		\N	132	\N	0
1086	delivery	21-4160 BOND ST		BURNABY	BC	CA	V5H1G2		\N	132	\N	0
1087	delivery	17-4160 BOND STREET		BURNABY	BC	CA	V5H1G2		\N	132	\N	0
1088	mailing	41-10771 GILBERT RD		RICHMOND	BC	CA	V7E 6E6		129	133	\N	0
1089	delivery	41-10771 GILBERT RD		RICHMOND	BC	CA	V7E 6E6		129	133	\N	0
1090	delivery	29-10771 GILBERT RD		RICHMOND	BC	CA	V7E6E6		\N	133	\N	0
1091	delivery	38-10771 GILBERT RD		RICHMOND	BC	CA	V7E6E6		\N	133	\N	0
1092	delivery	31 - 10771 GILBERT RD		RICHMOND	BC	CA	V7E6E6		\N	133	\N	0
1093	delivery	28-10771 GILBERT RD		RICHMOND	BC	CA	V7E6E6		\N	133	\N	0
1094	delivery	16- 10771 GILBERT RD		RICHMOND	BC	CA	V7E6E6		\N	133	\N	0
1095	delivery	15-10771 GILNERT RD		RICHMOND	BC	CA	V7E6E6		\N	133	\N	0
1096	delivery	2 - 10771 GILBERT RD		RICHMOND	BC	CA	V7E6E6		\N	133	\N	0
1097	mailing	45 - 7235 - 18TH AVENUE		BURNABY	BC	CA	V3N 1H4		130	134	\N	0
1098	delivery	45 - 7235 - 18TH AVENUE		BURNABY	BC	CA	V3N 1H4		130	134	\N	0
1099	delivery	30 - 7235 18 AVENUE		BURNABY	BC	CA	V3N1H4		\N	134	\N	0
1100	delivery	15 - 7235 18 AVENUE		BURNABY	BC	CA	V3N1H4		\N	134	\N	0
1101	delivery	39 - 7235 18 AVENUE		BURNABY	BC	CA	V3N1H4		\N	134	\N	0
1102	delivery	7 - 7235 18TH AVENUE		BURNABY	BC	CA	V3N1H4		\N	134	\N	0
1103	delivery	22 - 7235 18TH AVENUE		BURNABY	BC	CA	V3N1H4		\N	134	\N	0
1104	delivery	23 - 7235 18TH AVENUE		BURNABY	BC	CA	V3N1H4		\N	134	\N	0
1105	mailing	C/O AM MANAGEMENT SERVICES LTD.	766 HILLSIDE AVE	VICTORIA	BC	CA	V8T 1Z6		131	135	\N	0
1106	delivery	C/O AM MANAGEMENT SERVICES LTD.	766 HILLSIDE AVE	VICTORIA	BC	CA	V8T 1Z6		131	135	\N	0
1107	delivery	#13 - 236 ISLAND HIGHWAY		VICTORIA	BC	CA	V9B1G2		\N	135	\N	0
1108	delivery	#16 - 236 ISLAND HIGHWAY		VICTORIA	BC	CA	V9B1G2		\N	135	\N	0
1109	delivery	#10 - 236 ISLAND HIGHWAY		VICTORIA	BC	CA	V9B1G2		\N	135	\N	0
1110	delivery	#1 - 236 ISLAND HIGHWAY		VICTORIA	BC	CA	V9B1G2		\N	135	\N	0
1111	delivery	#6 - 236 ISLAND HIGHWAY		VICTORIA	BC	CA	V9B1G2		\N	135	\N	0
1112	mailing	220 - 1651 COMMERCIAL DRIVE		VANCOUVER	BC	CA	V5L 3Y3		132	136	\N	0
1113	delivery	220 - 1651 COMMERCIAL DRIVE		VANCOUVER	BC	CA	V5L 3Y3		132	136	\N	0
1114	delivery	4-8191 GENERAL CURRIE ROAD		RICHMOND	BC	CA	V6Y1L9		\N	136	\N	0
1115	delivery	#12 - 8191 GENERAL CURRIE ROAD		RICHMOND	BC	CA	V6Y1L9		\N	136	\N	0
1116	delivery	#22 - 8191 GENERAL CURRIE ROAD		RICHMOND	BC	CA	V6Y1L9		\N	136	\N	0
1117	delivery	#23 - 8191 GENERAL CURRIE ROAD		RICHMOND	BC	CA	V6Y1L9		\N	136	\N	0
1118	delivery	#8 - 8191 GENERAL CURRIE ROAD		RICHMOND	BC	CA	V6Y1L9		\N	136	\N	0
1119	delivery	#11 - 8191 GENERAL CURRIE ROAD		RICHMOND	BC	CA	V6Y1L9		\N	136	\N	0
1120	mailing	55 - 4080 GARRY STREET		RICHMOND	BC	CA	V7E 6J9		133	137	\N	0
1121	delivery	55 - 4080 GARRY STREET		RICHMOND	BC	CA	V7E 6J9		133	137	\N	0
1122	delivery	16-4080 GARRY STREET		RICHMOND	BC	CA	V7E6J9		\N	137	\N	0
1123	delivery	2-4080 GARRY ST		RICHMOND	BC	CA	V7E6J9		\N	137	\N	0
1124	delivery	54-4080 GARRY ST		RICHMOND	BC	CA	V7E6J9		\N	137	\N	0
1125	delivery	13 - 4080 GARRY STREET		RICHMOND	BC	CA	V7E6J9		\N	137	\N	0
1126	delivery	27-4080 GARRY STREET		RICHMOND	BC	CA	V7E6J9		\N	137	\N	0
1127	delivery	31-4080 GARRY ST		RICHMOND	BC	CA	V7E6J9		\N	137	\N	0
1128	delivery	5-4080 GARRY STREET		RICHMOND	BC	CA	V7E6J9		\N	137	\N	0
1129	delivery	15-4080 GARRY ST		RICHMOND	BC	CA	V7E6J9		\N	137	\N	0
1130	delivery	50-4080 GARRY ST		RICHMOND	BC	CA	V7E6J9		\N	137	\N	0
1131	mailing	251 CRAIG STREET		DUNCAN	BC	CA	V9L 1W2		134	138	\N	0
1132	delivery	251 CRAIG STREET		DUNCAN	BC	CA	V9L 1W2		134	138	\N	0
1133	delivery	1835 DEBORAH DRIVE		DUNCAN	BC	CA	V9L5A9		\N	138	\N	0
1134	delivery	251 CRAIG STREET		DUNCAN	BC	CA	V9L1W2		\N	138	\N	0
1135	delivery	3159 GLANA PLACE		DUNCAN	BC	CA	V9L5H5		\N	138	\N	0
1136	delivery	355 DOGWOOD PLACE		DUNCAN	BC	CA	V9L1H5		\N	138	\N	0
1137	delivery	355 LAKE PARK RD		LAKE COWICHAN	BC	CA	V0R2G0		\N	138	\N	0
1138	mailing	105 - 120 VERNON AVENUE		KAMLOOPS	BC	CA	V2B 1L6		135	139	\N	0
1139	delivery	105 - 120 VERNON AVENUE		KAMLOOPS	BC	CA	V2B 1L6		135	139	\N	0
1140	delivery	312 - 120 VERNON AVE		KAMLOOPS	BC	CA	V2B1L6		\N	139	\N	0
1141	delivery	401 - 120 VERNON AVE		KAMLOOPS	BC	CA	V2B1L6		\N	139	\N	0
1142	delivery	103-120 VERNON AVE		KAMLOOPS	BC	CA	V2B1L6		\N	139	\N	0
1143	delivery	311 - 120 VERNON AVE		KAMLOOPS	BC	CA	V2B1L6		\N	139	\N	0
1144	delivery	407-120 VERNON AVE		KAMLOOPS	BC	CA	V2B1L6		\N	139	\N	0
1145	delivery	306-120 VERNON AVE		KAMLOOPS	BC	CA	V2B1L6		\N	139	\N	0
1146	mailing	377 BAKER STREET		NELSON	BC	CA	V1L 4H6		136	140	\N	0
1147	delivery	377 BAKER STREET		NELSON	BC	CA	V1L 4H6		136	140	\N	0
1148	delivery	3711 BONNINGTON RD		BONNINGTON	BC	CA	V0G2G3		\N	140	\N	0
1149	delivery	712 ELWYN ST		NELSON	BC	CA	V1L3S1		\N	140	\N	0
1150	delivery	1308 CEDAR ST SUIT C		NELSON	BC	CA	V1L2E8		\N	140	\N	0
1151	delivery	3231 VINDUSKY RD		NELSON	BC	CA	V1L6X7		\N	140	\N	0
1152	delivery	3727 MCKENZIE RD		KRESTOVA	BC	CA	V0G1H2		\N	140	\N	0
1153	mailing	125 HALL STREET		NELSON	BC	CA	V1L 7B4		137	141	\N	0
1154	delivery	125 HALL STREET		NELSON	BC	CA	V1L 7B4		137	141	\N	0
1155	delivery	302 BEASLEY ST		NELSON	BC	CA	V1L5M4		\N	141	\N	0
1156	delivery	58-2210 COLUMBIA AVENUE		CASTLEGAR	BC	CA	V1N2X1		\N	141	\N	0
1157	delivery	511 SAYWARD AVE		SALMO	BC	CA	V0G1Z0		\N	141	\N	0
1158	delivery	8880 OLSON ROAD		KASLO	BC	CA	V0G1M0		\N	141	\N	0
1159	delivery	1057 WILDROSE RD		CASTLEGAR	BC	CA	V1N4T7		\N	141	\N	0
1160	delivery	206-710 VERNON STREET		NELSON	BC	CA	V1L4G2		\N	141	\N	0
1161	delivery	921 HWY 3A		NELSON	BC	CA	V1L6J5		\N	141	\N	0
1162	delivery	2065 HAAGLUND ROAD		CHRISTINA LAKE	BC	CA	V0H1E3		\N	141	\N	0
1163	mailing	603B CARNARVON ST		NEW WESTMINSTER	BC	CA	V3M 1E5		138	142	\N	0
1164	delivery	603B CARNARVON ST		NEW WESTMINSTER	BC	CA	V3M 1E5		138	142	\N	0
1165	delivery	301-7040 BALMORAL ST		BURNABY	BC	CA	V5E1J5		\N	142	\N	0
1166	delivery	160-7121 14TH AVE		BURNABY	BC	CA	V3N1Z3		\N	142	\N	0
1167	delivery	801-706 QUEENS AVE		NEW WESTMINSTER	BC	CA	V3M1L5		\N	142	\N	0
1168	delivery	2568 QUEENS AVE		WEST VANCOUVER	BC	CA	V7V2Y8		\N	142	\N	0
1169	delivery	7931 16TH AVE		BURNABY	BC	CA	V3N1R4		\N	142	\N	0
1170	delivery	1859 NAPIER ST		VANCOUVER	BC	CA	V5L2N4		\N	142	\N	0
1171	delivery	7250 16TH AVE		BURNABY	BC	CA	V3N1N5		\N	142	\N	0
1172	mailing	303 - 1080 HOWE STREET		VANCOUVER	BC	CA	V6Z 2T1		139	143	\N	0
1173	delivery	303 - 1080 HOWE STREET		VANCOUVER	BC	CA	V6Z 2T1		139	143	\N	0
1174	delivery	25 CARLSON ST		KITIMAT	BC	CA	V8C1A9		\N	143	\N	0
1175	delivery	4445 LAZELLE AVE		TERRACE	BC	CA	V8G1R9		\N	143	\N	0
1176	delivery	5333 MOUNTAIN VISTA DR		TERRACE	BC	CA	V8G4X4		\N	143	\N	0
1177	delivery	2710 MOLITOR AVENUE		TERRACE	BC	CA	V8G3A4		\N	143	\N	0
1178	delivery	3903 CORY DR		TERRACE	BC	CA	V8G0J4		\N	143	\N	0
1179	delivery	5020 WALSH AVENUE		TERRACE	BC	CA	V8G4H2		\N	143	\N	0
1180	delivery	4508 JOHNS RD		TERRACE	BC	CA	V8G0B3		\N	143	\N	0
1181	delivery	2811 SKEENA ST		TERRACE	BC	CA	V8G3K3		\N	143	\N	0
1182	mailing	2435 EASTGATE PL		VICTORIA	BC	CA	V8Z 6R7		140	144	\N	0
1183	delivery	2435 EASTGATE PL		VICTORIA	BC	CA	V8Z 6R7		140	144	\N	0
1184	delivery	2435 EASTGATE PLACE		VICTORIA	BC	CA	V8Z6R7		\N	144	\N	0
1185	delivery	808 BEXHILL PL		VICTORIA	BC	CA	V9C3V5		\N	144	\N	0
1186	delivery	2894 MURRAY DR		VICTORIA	BC	CA	V9A2S7		\N	144	\N	0
1187	delivery	33 - 118 ALDERSMITH PLACE		VICTORIA	BC	CA	V9A7M9		\N	144	\N	0
1188	delivery	3215 LINWOOD AVE		VICTORIA	BC	CA	V8X1E5		\N	144	\N	0
1189	mailing	13188 DOOLE ROAD		LADYSMITH	BC	CA			141	145	\N	0
1190	delivery	13188 DOOLE ROAD		LADYSMITH	BC	CA			141	145	\N	0
1191	delivery	85 ROBARTS ST		NANAIO	BC	CA	V9R2S6		\N	145	\N	0
1192	delivery	13188 DOOLE ROAD		LADYSMITH	BC	CA	V9G1G6		\N	145	\N	0
1193	delivery	46 ROBARTS STREET		NANAIMO	BC	CA	V9R2S4		\N	145	\N	0
1194	delivery	46 ROBARTS STREET		NANAIMO	BC	CA	V9R2S4		\N	145	\N	0
1195	mailing	3291 RENITA RIDGE ROAD		DUNCAN	BC	CA	V9L 5J6		142	146	\N	0
1196	delivery	3291 RENITA RIDGE ROAD		DUNCAN	BC	CA	V9L 5J6		142	146	\N	0
1197	delivery	1229 ROCKCREST PL		VICTORIA	BC	CA	V9A4W5		\N	146	\N	0
1198	delivery	240 MCKINSTRY RD		DUNCAN	BC	CA	V9L3L2		\N	146	\N	0
1199	delivery	5905 INDIAN ROAD		DUNCAN	BC	CA	V9L5L9		\N	146	\N	0
1200	delivery	1721 COWICHAN BAY ROAD		DUNCAN	BC	CA	V0R1N0		\N	146	\N	0
1201	delivery	3291 RENITA RIDGE RD		DUNCAN	BC	CA	V9L5J6		\N	146	\N	0
1202	delivery	1040 DUFFERIN CRES		NANAIMO	BC	CA	V9S2B6		\N	146	\N	0
1203	mailing	P.O. BOX 415		GOLDEN	BC	CA	V0A 1H0		143	147	\N	0
1204	delivery	421 - 9TH AVENUE NORTH, SUITE 208		GOLDEN	BC	CA	V0A 1H0		143	147	\N	0
1205	delivery	515 TRANS CANADA HIGHWAY		GOLDEN	BC	CA	V0A1H1		\N	147	\N	0
1206	delivery	1510 CEDAR STREET		GOLDEN	BC	CA	V0A1H6		\N	147	\N	0
1207	delivery	1390 PINE DRIVE		GOLDEN	BC	CA	V0A1H1		\N	147	\N	0
1208	delivery	1515 CEDAR STREET		GOLDEN	BC	CA	V0A1H6		\N	147	\N	0
1209	mailing	1375 ELKVIEW TRAIL		CASTLEGAR	BC	CA	V1N 4S2		144	148	\N	0
1210	delivery	1375 ELKVIEW TRAIL		CASTLEGAR	BC	CA	V1N 4S2		144	148	\N	0
1211	delivery	1351 ELKVIEW TRAIL		CASTLEGAR	BC	CA	V1N4S2		\N	148	\N	0
1212	delivery	1723 MOUNTAIN RIDGE ROAD		CASTLEGER	BC	CA	V1N4S2		\N	148	\N	0
1213	delivery	1375 ELVIEW TRAIL		CASTLEGER	BC	CA	V1N4S2		\N	148	\N	0
1214	delivery	1311 ELKVIEW TRAIL		CASTLEGAR	BC	CA	V1N4S2		\N	148	\N	0
1215	mailing	6 - 4711 ELIZABETH STREET		PORT ALBERNI	BC	CA	V9Y 6M1		145	149	\N	0
1216	delivery	6 - 4711 ELIZABETH STREET		PORT ALBERNI	BC	CA	V9Y 6M1		145	149	\N	0
1217	delivery	8354 DICKSON DRIVE		PORT ALBERNI	BC	CA	V9Y9B5		\N	149	\N	0
1218	delivery	3015 7TH AVENUE		PORT ALBERNI	BC	CA	V9Y2J2		\N	149	\N	0
1219	delivery	5559 WOODLAND CRESENCET WEST		PORT ALBERNI	BC	CA	V9Y8E6		\N	149	\N	0
1220	delivery	3955 16TH AVENUE		PORT ALBERNI	BC	CA	V9Y5L3		\N	149	\N	0
1221	delivery	5510 WOODLAND CRESCENT EAST		PORT ALBERNI	BC	CA	V9Y8E6		\N	149	\N	0
1222	delivery	4087 MARPOLE STREET		PORT ALBERNI	BC	CA	V9Y9B5		\N	149	\N	0
1223	delivery	2132 MOTION DRIVE		PORT ALBERNI	BC	CA	V9Y1B3		\N	149	\N	0
1224	delivery	3169 2ND AVENUE		PORT ALBERNI	BC	CA	V9Y4C4		\N	149	\N	0
1225	delivery	4988 HELEN STREET		PORT ALBERNI	BC	CA	V9Y7N6		\N	149	\N	0
1226	mailing	1391 COMMERCIAL DR.		VANCOUVER	BC	CA	V5L 3X5		146	150	\N	0
1227	delivery	1391 COMMERCIAL DR.		VANCOUVER	BC	CA	V5L 3X5		146	150	\N	0
1228	delivery	3272 W. KING EDWARD AVENUE		VANCOUVER	BC	CA	V6L1V7		\N	150	\N	0
1229	delivery	3521 MARSHALL STREET		VANCOUVER	BC	CA	V5N4S2		\N	150	\N	0
1230	delivery	3666 YALE STREET		VANCOUVER	BC	CA	V5K1C8		\N	150	\N	0
1231	delivery	NO.107 - 3477 COMMERCIAL STREET		VANCOUVER	BC	CA	V5N4E8		\N	150	\N	0
1232	delivery	1745 E. 3RD AVENUE		VANCOUVER	BC	CA	V5N1H3		\N	150	\N	0
1233	delivery	NO. 516 - 103 POWELL STREET		VANCOUVER	BC	CA	V6A1G2		\N	150	\N	0
1234	mailing	1483 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H 3Y7		147	151	\N	0
1235	delivery	1483 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H 3Y7		147	151	\N	0
1236	delivery	701-1483 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H3Y7		\N	151	\N	0
1237	delivery	#812-1483 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H3Y7		\N	151	\N	0
1238	delivery	309 - 1483 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H3Y7		\N	151	\N	0
1239	delivery	602 - 1483 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H3Y7		\N	151	\N	0
1240	delivery	414-1483 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H3Y7		\N	151	\N	0
1241	delivery	#105 - 1483 LAMEYS MILL ROAD		VANCOUVER	BC	CA	V6H3Y7		\N	151	\N	0
1242	delivery	709-1483 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H3Y7		\N	151	\N	0
1243	delivery	508-1483 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H3Y7		\N	151	\N	0
1244	delivery	415-1483 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H3Y7		\N	151	\N	0
1245	delivery	#201-1483 LAMEY'S MILL ROAD		VANCOUVER	BC	CA	V6H3Y7		\N	151	\N	0
1246	mailing	386 GINGER DRIVE		NEW WESTMINSTER	BC	CA	V3L 5L4		148	152	\N	0
1247	delivery	386 GINGER DRIVE		NEW WESTMINSTER	BC	CA	V3L 5L4		148	152	\N	0
1248	delivery	13-370 GINGER DR.		NEW WESTMINSTER	BC	CA	V3L5L4		\N	152	\N	0
1249	delivery	19-390 GINGER DRIVE		NEW WESTMINSTER	BC	CA	V3L5L4		\N	152	\N	0
1250	delivery	1-390 GINGER DRIVE		NEW WESTMINSTER	BC	CA	V3L5L4		\N	152	\N	0
1251	delivery	13-380 GINGER DR		NEW WESTMINSTER	BC	CA	V3L5L4		\N	152	\N	0
1252	delivery	11-390 GINGER DRIVE		NEW WESTMINSTER	BC	CA	V3L5L4		\N	152	\N	0
1253	delivery	6-370 GINGER DR		NEW WESTMINSTER	BC	CA	V3L5L4		\N	152	\N	0
1254	delivery	8-390 GINGER DRIVE		NEW WESTMINSTER	BC	CA	V3L5L4		\N	152	\N	0
1255	mailing	32 - 12211 CAMBIE ROAD		RICHMOND	BC	CA	V6V 2H8		149	153	\N	0
1256	delivery	32 - 12211 CAMBIE ROAD		RICHMOND	BC	CA	V6V 2H8		149	153	\N	0
1257	delivery	19- 12211 CAMBIE RD		RICHMOND	BC	CA	V6V2H8		\N	153	\N	0
1258	delivery	34- 12211 CAMBIE RD		RICHMOND	BC	CA	V6V2H8		\N	153	\N	0
1259	delivery	31-12211 CAMBIE ROAD		RICHMOND	BC	CA	V6V2H8		\N	153	\N	0
1260	delivery	3 - 12211 CAMBIE RD		RICHMOND	BC	CA	V6V2H8		\N	153	\N	0
1261	delivery	12-12211 CAMBIE RD		RICHMOND	BC	CA	V6V2H8		\N	153	\N	0
1262	delivery	#1-12211 CAMBIE ROAD		RICHMOND	BC	CA	V6V2H8		\N	153	\N	0
1263	delivery	#50-12211 CAMBIE ROAD		RICHMOND	BC	CA	V6V2H8		\N	153	\N	0
1264	delivery	#29-12211 CAMBIE ROAD		RICHMOND	BC	CA	V6V2H8		\N	153	\N	0
\.


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: userG5G
--

COPY public.alembic_version (version_num) FROM stdin;
5ad3243edc3e
\.


--
-- Data for Name: businesses; Type: TABLE DATA; Schema: public; Owner: userG5G
--

COPY public.businesses (id, last_modified, last_ledger_id, last_remote_ledger_id, last_ar_date, legal_name, founding_date, dissolution_date, identifier, tax_id, fiscal_year_end_date, submitter_userid, last_agm_date, last_ledger_timestamp) FROM stdin;
99	2019-08-21 03:12:41.911411+00	\N	0	2018-09-20 00:00:00+00	THE CASTLEGAR CO-OPERATIVE TRANSPORTATION SOCIETY	1938-10-06 00:00:00+00	\N	CP0000393	\N	2019-08-21 03:12:41.911411+00	\N	2018-09-20 00:00:00+00	2018-12-12 00:00:00+00
100	2019-08-21 03:12:47.799419+00	\N	0	2018-09-18 00:00:00+00	WILDERNESS PARK CO-OPERATIVE HOUSING ASSOCIATION	1974-06-20 00:00:00+00	\N	CP0000976	\N	2019-08-21 03:12:47.799419+00	\N	2018-09-18 00:00:00+00	2019-02-21 00:00:00+00
101	2019-08-21 03:12:53.334397+00	\N	0	2018-09-20 00:00:00+00	WASHINGTON CO-OPERATIVE HOUSING ASSOCIATION	1974-06-12 00:00:00+00	\N	CP0000977	\N	2019-08-21 03:12:53.334397+00	\N	2018-09-20 00:00:00+00	2019-07-18 00:00:00+00
102	2019-08-21 03:12:59.24139+00	\N	0	2018-09-26 00:00:00+00	MISSION COOPERATIVE HOUSING ASSOCIATION	1975-04-10 00:00:00+00	\N	CP0001024	\N	2019-08-21 03:12:59.24139+00	\N	2018-09-26 00:00:00+00	2019-01-04 00:00:00+00
103	2019-08-21 03:13:05.812939+00	\N	0	2018-09-12 00:00:00+00	KOOTENAY COUNTRY STORE COOPERATIVE	1975-06-24 00:00:00+00	\N	CP0001041	\N	2019-08-21 03:13:05.812939+00	\N	2018-09-12 00:00:00+00	2019-05-02 00:00:00+00
104	2019-08-21 03:13:12.761318+00	\N	0	2018-09-26 00:00:00+00	MANHATTAN CO-OPERATIVE HOUSING ASSOCIATION	1979-02-26 00:00:00+00	\N	CP0001164	\N	2019-08-21 03:13:12.761318+00	\N	2018-09-26 00:00:00+00	2018-12-11 00:00:00+00
105	2019-08-21 03:13:18.41643+00	\N	0	2018-09-25 00:00:00+00	VALLEY VILLAGE HOUSING CO-OPERATIVE	1979-05-10 00:00:00+00	\N	CP0001173	\N	2019-08-21 03:13:18.41643+00	\N	2018-09-25 00:00:00+00	2018-10-23 00:00:00+00
106	2019-08-21 03:13:24.443447+00	\N	0	2018-09-11 00:00:00+00	POST 83 CO-OPERATIVE HOUSING ASSOCIATION	1979-09-24 00:00:00+00	\N	CP0001184	\N	2019-08-21 03:13:24.443447+00	\N	2018-09-11 00:00:00+00	2019-06-06 00:00:00+00
107	2019-08-21 03:13:29.886035+00	\N	0	2018-09-27 00:00:00+00	TWIN RAINBOWS HOUSING CO-OPERATIVE	1979-10-17 00:00:00+00	\N	CP0001186	\N	2019-08-21 03:13:29.886035+00	\N	2018-09-27 00:00:00+00	2019-07-24 00:00:00+00
108	2019-08-21 03:13:35.8801+00	\N	0	2018-09-25 00:00:00+00	COMMON GROUND HOUSING CO-OPERATIVE	1980-02-18 00:00:00+00	\N	CP0001202	\N	2019-08-21 03:13:35.8801+00	\N	2018-09-25 00:00:00+00	2018-11-02 00:00:00+00
109	2019-08-21 03:13:42.021858+00	\N	0	2018-09-28 00:00:00+00	HUNTINGTON PLACE HOUSING CO-OPERATIVE	1980-03-13 00:00:00+00	\N	CP0001205	\N	2019-08-21 03:13:42.021858+00	\N	2018-09-28 00:00:00+00	2019-04-16 00:00:00+00
110	2019-08-21 03:13:47.622878+00	\N	0	2018-09-25 00:00:00+00	HAWTHORNE HOUSING CO-OPERATIVE	1980-11-27 00:00:00+00	\N	CP0001229	\N	2019-08-21 03:13:47.622878+00	\N	2018-09-25 00:00:00+00	2018-10-22 00:00:00+00
111	2019-08-21 03:13:53.065852+00	\N	0	2018-09-25 00:00:00+00	VIEW COURT HOUSING CO-OPERATIVE	1981-05-21 00:00:00+00	\N	CP0001252	\N	2019-08-21 03:13:53.065852+00	\N	2018-09-25 00:00:00+00	2018-11-08 00:00:00+00
112	2019-08-21 03:13:58.024883+00	\N	0	2018-09-25 00:00:00+00	BAKERVIEW HOUSING CO-OPERATIVE	1981-06-05 00:00:00+00	\N	CP0001254	\N	2019-08-21 03:13:58.024883+00	\N	2018-09-25 00:00:00+00	2019-06-24 00:00:00+00
113	2019-08-21 03:14:03.099879+00	\N	0	2018-09-23 00:00:00+00	EIGHT OAKS HOUSING CO-OPERATIVE	1981-07-09 00:00:00+00	\N	CP0001257	\N	2019-08-21 03:14:03.099879+00	\N	2018-09-23 00:00:00+00	2019-07-23 00:00:00+00
114	2019-08-21 03:14:09.314596+00	\N	0	2018-09-05 00:00:00+00	SHAUGHNESSY HOUSING CO OPERATIVE	1982-01-27 00:00:00+00	\N	CP0001299	\N	2019-08-21 03:14:09.314596+00	\N	2018-09-05 00:00:00+00	2019-01-17 00:00:00+00
115	2019-08-21 03:14:14.988691+00	\N	0	2018-09-24 00:00:00+00	WOODLAND PARK HOUSING CO-OPERATIVE	1982-02-25 00:00:00+00	\N	CP0001306	\N	2019-08-21 03:14:14.988691+00	\N	2018-09-24 00:00:00+00	2018-11-28 00:00:00+00
116	2019-08-21 03:14:19.888788+00	\N	0	2018-09-17 00:00:00+00	MAYFLOWER CO-OPERATIVE HOUSING ASSOCIATION	1982-05-14 00:00:00+00	\N	CP0001327	\N	2019-08-21 03:14:19.888788+00	\N	2018-09-17 00:00:00+00	2018-10-05 00:00:00+00
117	2019-08-21 03:14:25.437619+00	\N	0	2018-08-11 00:00:00+00	MERIDIAN GARDENS COOPERATIVE ASSOCIATION	1982-06-08 00:00:00+00	\N	CP0001333	\N	2019-08-21 03:14:25.437619+00	\N	2018-08-11 00:00:00+00	2018-08-29 00:00:00+00
118	2019-08-21 03:14:32.022741+00	\N	0	2018-08-28 00:00:00+00	JUNIPER CO-OPERATIVE COMMUNITY HOUSING ASSOCIATION	1982-11-12 00:00:00+00	\N	CP0001356	\N	2019-08-21 03:14:32.022741+00	\N	2018-08-28 00:00:00+00	2019-03-22 00:00:00+00
119	2019-08-21 03:14:36.635775+00	\N	0	2018-09-11 00:00:00+00	KITSILANO TERRACE HOUSING CO-OPERATIVE	1982-12-07 00:00:00+00	\N	CP0001364	\N	2019-08-21 03:14:36.635775+00	\N	2018-09-11 00:00:00+00	2018-10-02 00:00:00+00
120	2019-08-21 03:14:43.912581+00	\N	0	2018-09-26 00:00:00+00	LAVENDER HOUSING COOPERATIVE	1983-06-06 00:00:00+00	\N	CP0001389	\N	2019-08-21 03:14:43.912581+00	\N	2018-09-26 00:00:00+00	2019-08-06 00:00:00+00
121	2019-08-21 03:14:48.787123+00	\N	0	2018-09-26 00:00:00+00	WATERSIDE HOUSING COOPERATIVE	1983-09-27 00:00:00+00	\N	CP0001405	\N	2019-08-21 03:14:48.787123+00	\N	2018-09-26 00:00:00+00	2018-10-25 00:00:00+00
122	2019-08-21 03:14:53.977898+00	\N	0	2018-09-12 00:00:00+00	BENRYK MEWS HOUSING CO-OPERATIVE	1984-04-26 00:00:00+00	\N	CP0001430	\N	2019-08-21 03:14:53.977898+00	\N	2018-09-12 00:00:00+00	2018-10-02 00:00:00+00
123	2019-08-21 03:14:59.685995+00	\N	0	2018-08-30 00:00:00+00	HARBOUR COVE HOUSING CO-OPERATIVE	1984-08-24 00:00:00+00	\N	CP0001448	\N	2019-08-21 03:14:59.685995+00	\N	2018-08-30 00:00:00+00	2018-09-17 00:00:00+00
124	2019-08-21 03:15:04.046957+00	\N	0	2018-08-21 00:00:00+00	FRIENDSHIP HOUSING COOPERATIVE	1984-11-22 00:00:00+00	\N	CP0001463	\N	2019-08-21 03:15:04.046957+00	\N	2018-08-21 00:00:00+00	2019-02-07 00:00:00+00
125	2019-08-21 03:15:08.268941+00	\N	0	2018-09-12 00:00:00+00	MANANA PARK WATER CO-OPERATIVE	1985-01-22 00:00:00+00	\N	CP0001468	\N	2019-08-21 03:15:08.268941+00	\N	2018-09-12 00:00:00+00	2018-11-13 00:00:00+00
126	2019-08-21 03:15:14.462933+00	\N	0	2018-09-27 00:00:00+00	ALBERNI FAMILY HOUSING CO-OPERATIVE	1985-04-23 00:00:00+00	\N	CP0001483	\N	2019-08-21 03:15:14.462933+00	\N	2018-09-27 00:00:00+00	2018-10-22 00:00:00+00
127	2019-08-21 03:15:19.666933+00	\N	0	2018-09-25 00:00:00+00	SITKA HOUSING CO-OPERATIVE (1985)	1985-08-26 00:00:00+00	\N	CP0001496	\N	2019-08-21 03:15:19.666933+00	\N	2018-09-25 00:00:00+00	2018-10-12 00:00:00+00
128	2019-08-21 03:15:24.266093+00	\N	0	2018-09-27 00:00:00+00	CENTENNIAL PARK HOUSING CO-OPERATIVE	1986-01-21 00:00:00+00	\N	CP0001505	\N	2019-08-21 03:15:24.266093+00	\N	2018-09-27 00:00:00+00	2018-11-07 00:00:00+00
129	2019-08-21 03:15:29.778758+00	\N	0	2018-09-24 00:00:00+00	MAYA HOUSING CO-OPERATIVE	1986-06-30 00:00:00+00	\N	CP0001523	\N	2019-08-21 03:15:29.778938+00	\N	2018-09-24 00:00:00+00	2019-05-06 00:00:00+00
130	2019-08-21 03:15:36.739327+00	\N	0	2018-09-12 00:00:00+00	CHANCES HOUSING CO-OPERATIVE	1987-01-23 00:00:00+00	\N	CP0001547	\N	2019-08-21 03:15:36.739327+00	\N	2018-09-12 00:00:00+00	2019-07-29 00:00:00+00
131	2019-08-21 03:15:41.449921+00	\N	0	2018-09-27 00:00:00+00	FOUR MILE HEIGHTS HOUSING COOPERATIVE	1987-07-17 00:00:00+00	\N	CP0001556	\N	2019-08-21 03:15:41.449921+00	\N	2018-09-27 00:00:00+00	2018-12-03 00:00:00+00
132	2019-08-21 03:15:45.764918+00	\N	0	2018-09-24 00:00:00+00	SUNDUNE HOUSING CO-OPERATIVE	1988-04-21 00:00:00+00	\N	CP0001570	\N	2019-08-21 03:15:45.764918+00	\N	2018-09-24 00:00:00+00	2018-12-06 00:00:00+00
133	2019-08-21 03:15:50.894933+00	\N	0	2018-09-26 00:00:00+00	RIVER'S END HOUSING CO-OPERATIVE	1988-05-24 00:00:00+00	\N	CP0001576	\N	2019-08-21 03:15:50.894933+00	\N	2018-09-26 00:00:00+00	2018-12-20 00:00:00+00
134	2019-08-21 03:15:56.819122+00	\N	0	2018-09-23 00:00:00+00	IMAGINE THAT ARTISANS' DESIGNS CO-OPERATIVE ASSOCIATION	1994-11-30 00:00:00+00	\N	CP0001700	\N	2019-08-21 03:15:56.819122+00	\N	2018-09-23 00:00:00+00	2018-10-10 00:00:00+00
135	2019-08-21 03:16:01.54712+00	\N	0	2018-08-10 00:00:00+00	THE WILLOWS HOUSING COOPERATIVE ASSOCIATION	2000-07-13 00:00:00+00	\N	CP0001847	\N	2019-08-21 03:16:01.54712+00	\N	2018-08-10 00:00:00+00	2018-09-18 00:00:00+00
136	2019-08-21 03:16:06.473131+00	\N	0	2018-09-16 00:00:00+00	THE KOOTENAY BAKERY CAFE COOPERATIVE	2001-03-14 00:00:00+00	\N	CP0001867	\N	2019-08-21 03:16:06.473131+00	\N	2018-09-16 00:00:00+00	2018-11-01 00:00:00+00
137	2019-08-21 03:16:11.565545+00	\N	0	2018-09-26 00:00:00+00	KOOTENAY BOUNDARY COMMUNITY SERVICES CO-OPERATIVE	2003-04-11 00:00:00+00	\N	CP0001940	\N	2019-08-21 03:16:11.565545+00	\N	2018-09-26 00:00:00+00	2018-12-13 00:00:00+00
138	2019-08-21 03:16:17.306547+00	\N	0	2018-08-11 00:00:00+00	UMBRELLA MULTICULTURAL HEALTH COOPERATIVE	2010-01-08 00:00:00+00	\N	CP0002081	\N	2019-08-21 03:16:17.307109+00	\N	2018-08-11 00:00:00+00	2018-09-21 00:00:00+00
139	2019-08-21 03:16:22.679546+00	\N	0	2018-09-26 00:00:00+00	MY RECREATIONAL MOUNTAIN CO-OPERATIVE	2011-08-25 00:00:00+00	\N	CP0002120	\N	2019-08-21 03:16:22.679655+00	\N	2018-09-26 00:00:00+00	2019-05-15 00:00:00+00
140	2019-08-21 03:16:27.72344+00	\N	0	2018-09-30 00:00:00+00	DADS AUTO DELIVERIES CO-OP	2012-06-01 00:00:00+00	\N	CP0002141	\N	2019-08-21 03:16:27.72344+00	\N	2018-09-30 00:00:00+00	2018-10-22 00:00:00+00
141	2019-08-21 03:16:32.157068+00	\N	0	2018-08-15 00:00:00+00	FARMSHIP GROWERS COOPERATIVE	2013-03-26 00:00:00+00	\N	CP0002174	\N	2019-08-21 03:16:32.157068+00	\N	2018-08-15 00:00:00+00	2019-02-26 00:00:00+00
142	2019-08-21 03:16:36.748572+00	\N	0	2018-09-29 00:00:00+00	INCLUSIVE LEADERSHIP CO-OPERATIVE	2013-04-22 00:00:00+00	\N	CP0002177	\N	2019-08-21 03:16:36.748572+00	\N	2018-09-29 00:00:00+00	2018-10-15 00:00:00+00
143	2019-08-21 03:16:41.459472+00	\N	0	2018-08-22 00:00:00+00	GOLDEN COMMUNITY SOCIAL SERVICES COOP	2016-04-25 00:00:00+00	\N	CP0002251	\N	2019-08-21 03:16:41.459472+00	\N	2018-08-22 00:00:00+00	2018-12-03 00:00:00+00
144	2019-08-21 03:16:45.554483+00	\N	0	2018-09-25 00:00:00+00	MOUNTAIN RIDGE ROAD USERS COOPERATIVE ASSOCIATION	2016-06-28 00:00:00+00	\N	CP0002256	\N	2019-08-21 03:16:45.554483+00	\N	2018-09-25 00:00:00+00	2019-01-10 00:00:00+00
145	2019-08-21 03:16:49.980768+00	\N	0	2018-09-12 00:00:00+00	ALBERNI VALLEY SENIORS SERVICES SECTOR COOPERATIVE	2018-06-13 00:00:00+00	\N	CP0002302	\N	2019-08-21 03:16:49.980768+00	\N	2018-09-12 00:00:00+00	2019-05-07 00:00:00+00
146	2019-08-21 03:16:56.236764+00	\N	0	2013-09-27 00:00:00+00	PEOPLE'S CO-OPERATIVE BOOKSTORE ASSOCIATION	1945-07-17 00:00:00+00	\N	CP0000545	\N	2019-08-21 03:16:56.236764+00	\N	2013-09-27 00:00:00+00	2018-06-06 00:00:00+00
147	2019-08-21 16:16:09.209741+00	\N	0	2018-09-30 00:00:00+00	CREEKVIEW HOUSING CO-OPERATIVE	1983-05-09 00:00:00+00	\N	CP0001383	\N	2019-08-21 16:16:09.209741+00	\N	2018-09-30 00:00:00+00	2018-12-04 00:00:00+00
148	2019-08-21 16:16:16.048741+00	\N	0	2018-09-19 00:00:00+00	QUEENS PARK HOUSING CO-OPERATIVE	1985-03-21 00:00:00+00	\N	CP0001479	\N	2019-08-21 16:16:16.049567+00	\N	2018-09-19 00:00:00+00	2018-11-08 00:00:00+00
149	2019-08-21 16:16:21.558729+00	\N	0	2018-09-24 00:00:00+00	ROBERT OWEN HOUSING CO-OPERATIVE	1986-10-23 00:00:00+00	\N	CP0001536	\N	2019-08-21 16:16:21.558729+00	\N	2018-09-24 00:00:00+00	2019-07-23 00:00:00+00
\.


--
-- Data for Name: businesses_version; Type: TABLE DATA; Schema: public; Owner: userG5G
--

COPY public.businesses_version (id, last_modified, last_ledger_id, last_remote_ledger_id, last_ar_date, legal_name, founding_date, dissolution_date, identifier, tax_id, fiscal_year_end_date, submitter_userid, transaction_id, end_transaction_id, operation_type, last_agm_date, last_ledger_timestamp) FROM stdin;
1	2019-08-20 17:24:19.312731+00	\N	0	2018-09-20 00:00:00+00	THE CASTLEGAR CO-OPERATIVE TRANSPORTATION SOCIETY	1938-10-06 00:00:00+00	\N	CP0000393	\N	2019-08-20 17:24:19.312731+00	\N	1	\N	0	2018-09-20 00:00:00+00	2018-12-12 00:00:00+00
2	2019-08-20 17:24:24.230891+00	\N	0	2018-09-18 00:00:00+00	WILDERNESS PARK CO-OPERATIVE HOUSING ASSOCIATION	1974-06-20 00:00:00+00	\N	CP0000976	\N	2019-08-20 17:24:24.230891+00	\N	2	\N	0	2018-09-18 00:00:00+00	2019-02-21 00:00:00+00
3	2019-08-20 17:24:28.972453+00	\N	0	2018-09-20 00:00:00+00	WASHINGTON CO-OPERATIVE HOUSING ASSOCIATION	1974-06-12 00:00:00+00	\N	CP0000977	\N	2019-08-20 17:24:28.972453+00	\N	3	\N	0	2018-09-20 00:00:00+00	2019-07-18 00:00:00+00
4	2019-08-20 17:24:34.167086+00	\N	0	2018-09-26 00:00:00+00	MISSION COOPERATIVE HOUSING ASSOCIATION	1975-04-10 00:00:00+00	\N	CP0001024	\N	2019-08-20 17:24:34.167086+00	\N	4	\N	0	2018-09-26 00:00:00+00	2019-01-04 00:00:00+00
5	2019-08-20 17:24:39.284222+00	\N	0	2018-09-12 00:00:00+00	KOOTENAY COUNTRY STORE COOPERATIVE	1975-06-24 00:00:00+00	\N	CP0001041	\N	2019-08-20 17:24:39.284222+00	\N	5	\N	0	2018-09-12 00:00:00+00	2019-05-02 00:00:00+00
6	2019-08-20 17:24:44.262448+00	\N	0	2018-09-26 00:00:00+00	MANHATTAN CO-OPERATIVE HOUSING ASSOCIATION	1979-02-26 00:00:00+00	\N	CP0001164	\N	2019-08-20 17:24:44.262448+00	\N	6	\N	0	2018-09-26 00:00:00+00	2018-12-11 00:00:00+00
7	2019-08-20 17:24:49.146675+00	\N	0	2018-09-25 00:00:00+00	VALLEY VILLAGE HOUSING CO-OPERATIVE	1979-05-10 00:00:00+00	\N	CP0001173	\N	2019-08-20 17:24:49.146675+00	\N	7	\N	0	2018-09-25 00:00:00+00	2018-10-23 00:00:00+00
8	2019-08-20 17:24:56.003626+00	\N	0	2018-09-11 00:00:00+00	POST 83 CO-OPERATIVE HOUSING ASSOCIATION	1979-09-24 00:00:00+00	\N	CP0001184	\N	2019-08-20 17:24:56.004625+00	\N	8	\N	0	2018-09-11 00:00:00+00	2019-06-06 00:00:00+00
9	2019-08-20 17:25:02.767065+00	\N	0	2018-09-27 00:00:00+00	TWIN RAINBOWS HOUSING CO-OPERATIVE	1979-10-17 00:00:00+00	\N	CP0001186	\N	2019-08-20 17:25:02.767065+00	\N	9	\N	0	2018-09-27 00:00:00+00	2019-07-24 00:00:00+00
10	2019-08-20 17:25:10.866194+00	\N	0	2018-09-25 00:00:00+00	COMMON GROUND HOUSING CO-OPERATIVE	1980-02-18 00:00:00+00	\N	CP0001202	\N	2019-08-20 17:25:10.866194+00	\N	10	\N	0	2018-09-25 00:00:00+00	2018-11-02 00:00:00+00
11	2019-08-20 17:25:16.13939+00	\N	0	2018-09-28 00:00:00+00	HUNTINGTON PLACE HOUSING CO-OPERATIVE	1980-03-13 00:00:00+00	\N	CP0001205	\N	2019-08-20 17:25:16.13939+00	\N	11	\N	0	2018-09-28 00:00:00+00	2019-04-16 00:00:00+00
12	2019-08-20 17:25:25.117028+00	\N	0	2018-09-25 00:00:00+00	HAWTHORNE HOUSING CO-OPERATIVE	1980-11-27 00:00:00+00	\N	CP0001229	\N	2019-08-20 17:25:25.117028+00	\N	12	\N	0	2018-09-25 00:00:00+00	2018-10-22 00:00:00+00
13	2019-08-20 17:25:30.148888+00	\N	0	2018-09-25 00:00:00+00	VIEW COURT HOUSING CO-OPERATIVE	1981-05-21 00:00:00+00	\N	CP0001252	\N	2019-08-20 17:25:30.148888+00	\N	13	\N	0	2018-09-25 00:00:00+00	2018-11-08 00:00:00+00
14	2019-08-20 17:25:34.089724+00	\N	0	2018-09-25 00:00:00+00	BAKERVIEW HOUSING CO-OPERATIVE	1981-06-05 00:00:00+00	\N	CP0001254	\N	2019-08-20 17:25:34.089724+00	\N	14	\N	0	2018-09-25 00:00:00+00	2019-06-24 00:00:00+00
15	2019-08-20 17:25:38.893178+00	\N	0	2018-09-23 00:00:00+00	EIGHT OAKS HOUSING CO-OPERATIVE	1981-07-09 00:00:00+00	\N	CP0001257	\N	2019-08-20 17:25:38.893178+00	\N	15	\N	0	2018-09-23 00:00:00+00	2019-07-23 00:00:00+00
16	2019-08-20 17:25:46.016398+00	\N	0	2018-09-05 00:00:00+00	SHAUGHNESSY HOUSING CO OPERATIVE	1982-01-27 00:00:00+00	\N	CP0001299	\N	2019-08-20 17:25:46.016398+00	\N	16	\N	0	2018-09-05 00:00:00+00	2019-01-17 00:00:00+00
17	2019-08-20 17:25:50.831048+00	\N	0	2018-09-24 00:00:00+00	WOODLAND PARK HOUSING CO-OPERATIVE	1982-02-25 00:00:00+00	\N	CP0001306	\N	2019-08-20 17:25:50.831048+00	\N	17	\N	0	2018-09-24 00:00:00+00	2018-11-28 00:00:00+00
18	2019-08-20 17:25:55.720632+00	\N	0	2018-09-17 00:00:00+00	MAYFLOWER CO-OPERATIVE HOUSING ASSOCIATION	1982-05-14 00:00:00+00	\N	CP0001327	\N	2019-08-20 17:25:55.720632+00	\N	18	\N	0	2018-09-17 00:00:00+00	2018-10-05 00:00:00+00
19	2019-08-20 17:25:59.57352+00	\N	0	2018-08-11 00:00:00+00	MERIDIAN GARDENS COOPERATIVE ASSOCIATION	1982-06-08 00:00:00+00	\N	CP0001333	\N	2019-08-20 17:25:59.57352+00	\N	19	\N	0	2018-08-11 00:00:00+00	2018-08-29 00:00:00+00
20	2019-08-20 17:26:03.585414+00	\N	0	2018-08-28 00:00:00+00	JUNIPER CO-OPERATIVE COMMUNITY HOUSING ASSOCIATION	1982-11-12 00:00:00+00	\N	CP0001356	\N	2019-08-20 17:26:03.585414+00	\N	20	\N	0	2018-08-28 00:00:00+00	2019-03-22 00:00:00+00
21	2019-08-20 17:26:08.209883+00	\N	0	2018-09-11 00:00:00+00	KITSILANO TERRACE HOUSING CO-OPERATIVE	1982-12-07 00:00:00+00	\N	CP0001364	\N	2019-08-20 17:26:08.209883+00	\N	21	\N	0	2018-09-11 00:00:00+00	2018-10-02 00:00:00+00
22	2019-08-20 17:26:18.619924+00	\N	0	2018-09-26 00:00:00+00	LAVENDER HOUSING COOPERATIVE	1983-06-06 00:00:00+00	\N	CP0001389	\N	2019-08-20 17:26:18.619924+00	\N	22	\N	0	2018-09-26 00:00:00+00	2019-08-06 00:00:00+00
23	2019-08-20 17:26:23.850288+00	\N	0	2018-09-26 00:00:00+00	WATERSIDE HOUSING COOPERATIVE	1983-09-27 00:00:00+00	\N	CP0001405	\N	2019-08-20 17:26:23.850288+00	\N	23	\N	0	2018-09-26 00:00:00+00	2018-10-25 00:00:00+00
24	2019-08-20 17:26:28.992844+00	\N	0	2018-09-12 00:00:00+00	BENRYK MEWS HOUSING CO-OPERATIVE	1984-04-26 00:00:00+00	\N	CP0001430	\N	2019-08-20 17:26:28.992844+00	\N	24	\N	0	2018-09-12 00:00:00+00	2018-10-02 00:00:00+00
25	2019-08-20 17:26:34.683691+00	\N	0	2018-08-30 00:00:00+00	HARBOUR COVE HOUSING CO-OPERATIVE	1984-08-24 00:00:00+00	\N	CP0001448	\N	2019-08-20 17:26:34.683691+00	\N	25	\N	0	2018-08-30 00:00:00+00	2018-09-17 00:00:00+00
26	2019-08-20 17:26:38.758537+00	\N	0	2018-08-21 00:00:00+00	FRIENDSHIP HOUSING COOPERATIVE	1984-11-22 00:00:00+00	\N	CP0001463	\N	2019-08-20 17:26:38.758537+00	\N	26	\N	0	2018-08-21 00:00:00+00	2019-02-07 00:00:00+00
27	2019-08-20 17:26:43.266805+00	\N	0	2018-09-12 00:00:00+00	MANANA PARK WATER CO-OPERATIVE	1985-01-22 00:00:00+00	\N	CP0001468	\N	2019-08-20 17:26:43.266805+00	\N	27	\N	0	2018-09-12 00:00:00+00	2018-11-13 00:00:00+00
28	2019-08-20 17:26:55.943804+00	\N	0	2018-09-27 00:00:00+00	ALBERNI FAMILY HOUSING CO-OPERATIVE	1985-04-23 00:00:00+00	\N	CP0001483	\N	2019-08-20 17:26:55.943804+00	\N	28	\N	0	2018-09-27 00:00:00+00	2018-10-22 00:00:00+00
29	2019-08-20 17:27:05.201747+00	\N	0	2018-09-25 00:00:00+00	SITKA HOUSING CO-OPERATIVE (1985)	1985-08-26 00:00:00+00	\N	CP0001496	\N	2019-08-20 17:27:05.201747+00	\N	29	\N	0	2018-09-25 00:00:00+00	2018-10-12 00:00:00+00
30	2019-08-20 17:27:13.666423+00	\N	0	2018-09-27 00:00:00+00	CENTENNIAL PARK HOUSING CO-OPERATIVE	1986-01-21 00:00:00+00	\N	CP0001505	\N	2019-08-20 17:27:13.666423+00	\N	30	\N	0	2018-09-27 00:00:00+00	2018-11-07 00:00:00+00
31	2019-08-20 17:27:27.101809+00	\N	0	2018-09-24 00:00:00+00	MAYA HOUSING CO-OPERATIVE	1986-06-30 00:00:00+00	\N	CP0001523	\N	2019-08-20 17:27:27.101809+00	\N	31	\N	0	2018-09-24 00:00:00+00	2019-05-06 00:00:00+00
32	2019-08-20 17:27:41.779678+00	\N	0	2018-09-12 00:00:00+00	CHANCES HOUSING CO-OPERATIVE	1987-01-23 00:00:00+00	\N	CP0001547	\N	2019-08-20 17:27:41.779678+00	\N	32	\N	0	2018-09-12 00:00:00+00	2019-07-29 00:00:00+00
33	2019-08-20 17:27:52.032556+00	\N	0	2018-09-27 00:00:00+00	FOUR MILE HEIGHTS HOUSING COOPERATIVE	1987-07-17 00:00:00+00	\N	CP0001556	\N	2019-08-20 17:27:52.032556+00	\N	33	\N	0	2018-09-27 00:00:00+00	2018-12-03 00:00:00+00
34	2019-08-20 17:28:03.60411+00	\N	0	2018-09-24 00:00:00+00	SUNDUNE HOUSING CO-OPERATIVE	1988-04-21 00:00:00+00	\N	CP0001570	\N	2019-08-20 17:28:03.60411+00	\N	34	\N	0	2018-09-24 00:00:00+00	2018-12-06 00:00:00+00
35	2019-08-20 17:28:15.137497+00	\N	0	2018-09-26 00:00:00+00	RIVER'S END HOUSING CO-OPERATIVE	1988-05-24 00:00:00+00	\N	CP0001576	\N	2019-08-20 17:28:15.137497+00	\N	35	\N	0	2018-09-26 00:00:00+00	2018-12-20 00:00:00+00
36	2019-08-20 17:28:26.813111+00	\N	0	2018-09-23 00:00:00+00	IMAGINE THAT ARTISANS' DESIGNS CO-OPERATIVE ASSOCIATION	1994-11-30 00:00:00+00	\N	CP0001700	\N	2019-08-20 17:28:26.813111+00	\N	36	\N	0	2018-09-23 00:00:00+00	2018-10-10 00:00:00+00
37	2019-08-20 17:28:34.271535+00	\N	0	2018-08-10 00:00:00+00	THE WILLOWS HOUSING COOPERATIVE ASSOCIATION	2000-07-13 00:00:00+00	\N	CP0001847	\N	2019-08-20 17:28:34.271535+00	\N	37	\N	0	2018-08-10 00:00:00+00	2018-09-18 00:00:00+00
38	2019-08-20 17:28:38.647602+00	\N	0	2018-09-16 00:00:00+00	THE KOOTENAY BAKERY CAFE COOPERATIVE	2001-03-14 00:00:00+00	\N	CP0001867	\N	2019-08-20 17:28:38.647602+00	\N	38	\N	0	2018-09-16 00:00:00+00	2018-11-01 00:00:00+00
39	2019-08-20 17:28:42.813533+00	\N	0	2018-09-26 00:00:00+00	KOOTENAY BOUNDARY COMMUNITY SERVICES CO-OPERATIVE	2003-04-11 00:00:00+00	\N	CP0001940	\N	2019-08-20 17:28:42.813533+00	\N	39	\N	0	2018-09-26 00:00:00+00	2018-12-13 00:00:00+00
40	2019-08-20 17:28:47.283779+00	\N	0	2018-08-11 00:00:00+00	UMBRELLA MULTICULTURAL HEALTH COOPERATIVE	2010-01-08 00:00:00+00	\N	CP0002081	\N	2019-08-20 17:28:47.283779+00	\N	40	\N	0	2018-08-11 00:00:00+00	2018-09-21 00:00:00+00
41	2019-08-20 17:28:51.811474+00	\N	0	2018-09-26 00:00:00+00	MY RECREATIONAL MOUNTAIN CO-OPERATIVE	2011-08-25 00:00:00+00	\N	CP0002120	\N	2019-08-20 17:28:51.811474+00	\N	41	\N	0	2018-09-26 00:00:00+00	2019-05-15 00:00:00+00
43	2019-08-20 17:35:58.167109+00	\N	0	2018-08-15 00:00:00+00	FARMSHIP GROWERS COOPERATIVE	2013-03-26 00:00:00+00	\N	CP0002174	\N	2019-08-20 17:35:58.167109+00	\N	43	\N	0	2018-08-15 00:00:00+00	2019-02-26 00:00:00+00
44	2019-08-20 17:36:05.660668+00	\N	0	2018-09-29 00:00:00+00	INCLUSIVE LEADERSHIP CO-OPERATIVE	2013-04-22 00:00:00+00	\N	CP0002177	\N	2019-08-20 17:36:05.660668+00	\N	44	\N	0	2018-09-29 00:00:00+00	2018-10-15 00:00:00+00
45	2019-08-20 17:36:09.933727+00	\N	0	2018-08-22 00:00:00+00	GOLDEN COMMUNITY SOCIAL SERVICES COOP	2016-04-25 00:00:00+00	\N	CP0002251	\N	2019-08-20 17:36:09.933727+00	\N	45	\N	0	2018-08-22 00:00:00+00	2018-12-03 00:00:00+00
46	2019-08-20 17:36:13.503214+00	\N	0	2018-09-25 00:00:00+00	MOUNTAIN RIDGE ROAD USERS COOPERATIVE ASSOCIATION	2016-06-28 00:00:00+00	\N	CP0002256	\N	2019-08-20 17:36:13.503214+00	\N	46	\N	0	2018-09-25 00:00:00+00	2019-01-10 00:00:00+00
47	2019-08-20 17:36:17.56019+00	\N	0	2018-09-12 00:00:00+00	ALBERNI VALLEY SENIORS SERVICES SECTOR COOPERATIVE	2018-06-13 00:00:00+00	\N	CP0002302	\N	2019-08-20 17:36:17.56019+00	\N	47	\N	0	2018-09-12 00:00:00+00	2019-05-07 00:00:00+00
48	2019-08-20 17:36:22.882371+00	\N	0	2013-09-27 00:00:00+00	PEOPLE'S CO-OPERATIVE BOOKSTORE ASSOCIATION	1945-07-17 00:00:00+00	\N	CP0000545	\N	2019-08-20 17:36:22.882371+00	\N	48	\N	0	2013-09-27 00:00:00+00	2018-06-06 00:00:00+00
49	2019-08-20 17:36:43.264138+00	\N	0	2018-09-30 00:00:00+00	DADS AUTO DELIVERIES CO-OP	2012-06-01 00:00:00+00	\N	CP0002141	\N	2019-08-20 17:36:43.264138+00	\N	49	\N	0	2018-09-30 00:00:00+00	2018-10-22 00:00:00+00
50	2019-08-20 21:38:23.089383+00	\N	0	2018-09-20 00:00:00+00	THE CASTLEGAR CO-OPERATIVE TRANSPORTATION SOCIETY	1938-10-06 00:00:00+00	\N	CP0000393	\N	2019-08-20 21:38:23.089383+00	\N	50	\N	0	2018-09-20 00:00:00+00	2018-12-12 00:00:00+00
52	2019-08-20 21:38:32.311284+00	\N	0	2018-09-20 00:00:00+00	WASHINGTON CO-OPERATIVE HOUSING ASSOCIATION	1974-06-12 00:00:00+00	\N	CP0000977	\N	2019-08-20 21:38:32.311284+00	\N	52	\N	0	2018-09-20 00:00:00+00	2019-07-18 00:00:00+00
53	2019-08-20 21:38:37.108348+00	\N	0	2018-09-26 00:00:00+00	MISSION COOPERATIVE HOUSING ASSOCIATION	1975-04-10 00:00:00+00	\N	CP0001024	\N	2019-08-20 21:38:37.108348+00	\N	53	\N	0	2018-09-26 00:00:00+00	2019-01-04 00:00:00+00
54	2019-08-20 21:38:42.085495+00	\N	0	2018-09-12 00:00:00+00	KOOTENAY COUNTRY STORE COOPERATIVE	1975-06-24 00:00:00+00	\N	CP0001041	\N	2019-08-20 21:38:42.085495+00	\N	54	\N	0	2018-09-12 00:00:00+00	2019-05-02 00:00:00+00
55	2019-08-20 21:38:47.224082+00	\N	0	2018-09-26 00:00:00+00	MANHATTAN CO-OPERATIVE HOUSING ASSOCIATION	1979-02-26 00:00:00+00	\N	CP0001164	\N	2019-08-20 21:38:47.224082+00	\N	55	\N	0	2018-09-26 00:00:00+00	2018-12-11 00:00:00+00
56	2019-08-20 21:38:52.188113+00	\N	0	2018-09-25 00:00:00+00	VALLEY VILLAGE HOUSING CO-OPERATIVE	1979-05-10 00:00:00+00	\N	CP0001173	\N	2019-08-20 21:38:52.188113+00	\N	56	\N	0	2018-09-25 00:00:00+00	2018-10-23 00:00:00+00
57	2019-08-20 21:38:56.988696+00	\N	0	2018-09-11 00:00:00+00	POST 83 CO-OPERATIVE HOUSING ASSOCIATION	1979-09-24 00:00:00+00	\N	CP0001184	\N	2019-08-20 21:38:56.988696+00	\N	57	\N	0	2018-09-11 00:00:00+00	2019-06-06 00:00:00+00
58	2019-08-20 21:39:01.361128+00	\N	0	2018-09-27 00:00:00+00	TWIN RAINBOWS HOUSING CO-OPERATIVE	1979-10-17 00:00:00+00	\N	CP0001186	\N	2019-08-20 21:39:01.361128+00	\N	58	\N	0	2018-09-27 00:00:00+00	2019-07-24 00:00:00+00
59	2019-08-20 21:39:06.482256+00	\N	0	2018-09-25 00:00:00+00	COMMON GROUND HOUSING CO-OPERATIVE	1980-02-18 00:00:00+00	\N	CP0001202	\N	2019-08-20 21:39:06.482256+00	\N	59	\N	0	2018-09-25 00:00:00+00	2018-11-02 00:00:00+00
60	2019-08-20 21:39:11.160913+00	\N	0	2018-09-28 00:00:00+00	HUNTINGTON PLACE HOUSING CO-OPERATIVE	1980-03-13 00:00:00+00	\N	CP0001205	\N	2019-08-20 21:39:11.160913+00	\N	60	\N	0	2018-09-28 00:00:00+00	2019-04-16 00:00:00+00
61	2019-08-20 21:39:15.325463+00	\N	0	2018-09-25 00:00:00+00	HAWTHORNE HOUSING CO-OPERATIVE	1980-11-27 00:00:00+00	\N	CP0001229	\N	2019-08-20 21:39:15.325463+00	\N	61	\N	0	2018-09-25 00:00:00+00	2018-10-22 00:00:00+00
62	2019-08-20 21:39:19.80762+00	\N	0	2018-09-25 00:00:00+00	VIEW COURT HOUSING CO-OPERATIVE	1981-05-21 00:00:00+00	\N	CP0001252	\N	2019-08-20 21:39:19.80762+00	\N	62	\N	0	2018-09-25 00:00:00+00	2018-11-08 00:00:00+00
63	2019-08-20 21:39:23.389168+00	\N	0	2018-09-25 00:00:00+00	BAKERVIEW HOUSING CO-OPERATIVE	1981-06-05 00:00:00+00	\N	CP0001254	\N	2019-08-20 21:39:23.389168+00	\N	63	\N	0	2018-09-25 00:00:00+00	2019-06-24 00:00:00+00
64	2019-08-20 21:39:27.280782+00	\N	0	2018-09-23 00:00:00+00	EIGHT OAKS HOUSING CO-OPERATIVE	1981-07-09 00:00:00+00	\N	CP0001257	\N	2019-08-20 21:39:27.280782+00	\N	64	\N	0	2018-09-23 00:00:00+00	2019-07-23 00:00:00+00
65	2019-08-20 21:39:31.84428+00	\N	0	2018-09-05 00:00:00+00	SHAUGHNESSY HOUSING CO OPERATIVE	1982-01-27 00:00:00+00	\N	CP0001299	\N	2019-08-20 21:39:31.84428+00	\N	65	\N	0	2018-09-05 00:00:00+00	2019-01-17 00:00:00+00
66	2019-08-20 21:39:36.106544+00	\N	0	2018-09-24 00:00:00+00	WOODLAND PARK HOUSING CO-OPERATIVE	1982-02-25 00:00:00+00	\N	CP0001306	\N	2019-08-20 21:39:36.106544+00	\N	66	\N	0	2018-09-24 00:00:00+00	2018-11-28 00:00:00+00
67	2019-08-20 21:39:40.286975+00	\N	0	2018-09-17 00:00:00+00	MAYFLOWER CO-OPERATIVE HOUSING ASSOCIATION	1982-05-14 00:00:00+00	\N	CP0001327	\N	2019-08-20 21:39:40.286975+00	\N	67	\N	0	2018-09-17 00:00:00+00	2018-10-05 00:00:00+00
68	2019-08-20 21:39:44.227922+00	\N	0	2018-08-11 00:00:00+00	MERIDIAN GARDENS COOPERATIVE ASSOCIATION	1982-06-08 00:00:00+00	\N	CP0001333	\N	2019-08-20 21:39:44.227922+00	\N	68	\N	0	2018-08-11 00:00:00+00	2018-08-29 00:00:00+00
69	2019-08-20 21:39:47.368669+00	\N	0	2018-08-28 00:00:00+00	JUNIPER CO-OPERATIVE COMMUNITY HOUSING ASSOCIATION	1982-11-12 00:00:00+00	\N	CP0001356	\N	2019-08-20 21:39:47.368669+00	\N	69	\N	0	2018-08-28 00:00:00+00	2019-03-22 00:00:00+00
70	2019-08-20 21:39:50.917948+00	\N	0	2018-09-11 00:00:00+00	KITSILANO TERRACE HOUSING CO-OPERATIVE	1982-12-07 00:00:00+00	\N	CP0001364	\N	2019-08-20 21:39:50.917948+00	\N	70	\N	0	2018-09-11 00:00:00+00	2018-10-02 00:00:00+00
71	2019-08-20 21:39:55.957421+00	\N	0	2018-09-26 00:00:00+00	LAVENDER HOUSING COOPERATIVE	1983-06-06 00:00:00+00	\N	CP0001389	\N	2019-08-20 21:39:55.957421+00	\N	71	\N	0	2018-09-26 00:00:00+00	2019-08-06 00:00:00+00
72	2019-08-20 21:39:59.866252+00	\N	0	2018-09-26 00:00:00+00	WATERSIDE HOUSING COOPERATIVE	1983-09-27 00:00:00+00	\N	CP0001405	\N	2019-08-20 21:39:59.866252+00	\N	72	\N	0	2018-09-26 00:00:00+00	2018-10-25 00:00:00+00
73	2019-08-20 21:40:03.772755+00	\N	0	2018-09-12 00:00:00+00	BENRYK MEWS HOUSING CO-OPERATIVE	1984-04-26 00:00:00+00	\N	CP0001430	\N	2019-08-20 21:40:03.773756+00	\N	73	\N	0	2018-09-12 00:00:00+00	2018-10-02 00:00:00+00
74	2019-08-20 21:40:08.146339+00	\N	0	2018-08-30 00:00:00+00	HARBOUR COVE HOUSING CO-OPERATIVE	1984-08-24 00:00:00+00	\N	CP0001448	\N	2019-08-20 21:40:08.146339+00	\N	74	\N	0	2018-08-30 00:00:00+00	2018-09-17 00:00:00+00
75	2019-08-20 21:40:11.570635+00	\N	0	2018-08-21 00:00:00+00	FRIENDSHIP HOUSING COOPERATIVE	1984-11-22 00:00:00+00	\N	CP0001463	\N	2019-08-20 21:40:11.570635+00	\N	75	\N	0	2018-08-21 00:00:00+00	2019-02-07 00:00:00+00
76	2019-08-20 21:40:14.725445+00	\N	0	2018-09-12 00:00:00+00	MANANA PARK WATER CO-OPERATIVE	1985-01-22 00:00:00+00	\N	CP0001468	\N	2019-08-20 21:40:14.725445+00	\N	76	\N	0	2018-09-12 00:00:00+00	2018-11-13 00:00:00+00
77	2019-08-20 21:40:19.53441+00	\N	0	2018-09-27 00:00:00+00	ALBERNI FAMILY HOUSING CO-OPERATIVE	1985-04-23 00:00:00+00	\N	CP0001483	\N	2019-08-20 21:40:19.53441+00	\N	77	\N	0	2018-09-27 00:00:00+00	2018-10-22 00:00:00+00
78	2019-08-20 21:40:23.394471+00	\N	0	2018-09-25 00:00:00+00	SITKA HOUSING CO-OPERATIVE (1985)	1985-08-26 00:00:00+00	\N	CP0001496	\N	2019-08-20 21:40:23.394471+00	\N	78	\N	0	2018-09-25 00:00:00+00	2018-10-12 00:00:00+00
79	2019-08-20 21:40:26.668178+00	\N	0	2018-09-27 00:00:00+00	CENTENNIAL PARK HOUSING CO-OPERATIVE	1986-01-21 00:00:00+00	\N	CP0001505	\N	2019-08-20 21:40:26.668178+00	\N	79	\N	0	2018-09-27 00:00:00+00	2018-11-07 00:00:00+00
80	2019-08-20 21:40:30.541612+00	\N	0	2018-09-24 00:00:00+00	MAYA HOUSING CO-OPERATIVE	1986-06-30 00:00:00+00	\N	CP0001523	\N	2019-08-20 21:40:30.541612+00	\N	80	\N	0	2018-09-24 00:00:00+00	2019-05-06 00:00:00+00
81	2019-08-20 21:40:35.831783+00	\N	0	2018-09-12 00:00:00+00	CHANCES HOUSING CO-OPERATIVE	1987-01-23 00:00:00+00	\N	CP0001547	\N	2019-08-20 21:40:35.831783+00	\N	81	\N	0	2018-09-12 00:00:00+00	2019-07-29 00:00:00+00
82	2019-08-20 21:40:39.44775+00	\N	0	2018-09-27 00:00:00+00	FOUR MILE HEIGHTS HOUSING COOPERATIVE	1987-07-17 00:00:00+00	\N	CP0001556	\N	2019-08-20 21:40:39.44775+00	\N	82	\N	0	2018-09-27 00:00:00+00	2018-12-03 00:00:00+00
83	2019-08-20 21:40:42.97841+00	\N	0	2018-09-24 00:00:00+00	SUNDUNE HOUSING CO-OPERATIVE	1988-04-21 00:00:00+00	\N	CP0001570	\N	2019-08-20 21:40:42.97841+00	\N	83	\N	0	2018-09-24 00:00:00+00	2018-12-06 00:00:00+00
84	2019-08-20 21:40:47.111543+00	\N	0	2018-09-26 00:00:00+00	RIVER'S END HOUSING CO-OPERATIVE	1988-05-24 00:00:00+00	\N	CP0001576	\N	2019-08-20 21:40:47.111543+00	\N	84	\N	0	2018-09-26 00:00:00+00	2018-12-20 00:00:00+00
85	2019-08-20 21:40:51.831058+00	\N	0	2018-09-23 00:00:00+00	IMAGINE THAT ARTISANS' DESIGNS CO-OPERATIVE ASSOCIATION	1994-11-30 00:00:00+00	\N	CP0001700	\N	2019-08-20 21:40:51.831058+00	\N	85	\N	0	2018-09-23 00:00:00+00	2018-10-10 00:00:00+00
86	2019-08-20 21:40:55.944399+00	\N	0	2018-08-10 00:00:00+00	THE WILLOWS HOUSING COOPERATIVE ASSOCIATION	2000-07-13 00:00:00+00	\N	CP0001847	\N	2019-08-20 21:40:55.944399+00	\N	86	\N	0	2018-08-10 00:00:00+00	2018-09-18 00:00:00+00
87	2019-08-20 21:41:00.040266+00	\N	0	2018-09-16 00:00:00+00	THE KOOTENAY BAKERY CAFE COOPERATIVE	2001-03-14 00:00:00+00	\N	CP0001867	\N	2019-08-20 21:41:00.040266+00	\N	87	\N	0	2018-09-16 00:00:00+00	2018-11-01 00:00:00+00
88	2019-08-20 21:41:03.935347+00	\N	0	2018-09-26 00:00:00+00	KOOTENAY BOUNDARY COMMUNITY SERVICES CO-OPERATIVE	2003-04-11 00:00:00+00	\N	CP0001940	\N	2019-08-20 21:41:03.935347+00	\N	88	\N	0	2018-09-26 00:00:00+00	2018-12-13 00:00:00+00
89	2019-08-20 21:41:08.853667+00	\N	0	2018-08-11 00:00:00+00	UMBRELLA MULTICULTURAL HEALTH COOPERATIVE	2010-01-08 00:00:00+00	\N	CP0002081	\N	2019-08-20 21:41:08.853667+00	\N	89	\N	0	2018-08-11 00:00:00+00	2018-09-21 00:00:00+00
90	2019-08-20 21:41:13.621312+00	\N	0	2018-09-26 00:00:00+00	MY RECREATIONAL MOUNTAIN CO-OPERATIVE	2011-08-25 00:00:00+00	\N	CP0002120	\N	2019-08-20 21:41:13.621312+00	\N	90	\N	0	2018-09-26 00:00:00+00	2019-05-15 00:00:00+00
91	2019-08-20 21:41:18.273608+00	\N	0	2018-09-30 00:00:00+00	DADS AUTO DELIVERIES CO-OP	2012-06-01 00:00:00+00	\N	CP0002141	\N	2019-08-20 21:41:18.273608+00	\N	91	\N	0	2018-09-30 00:00:00+00	2018-10-22 00:00:00+00
92	2019-08-20 21:41:21.855241+00	\N	0	2018-08-15 00:00:00+00	FARMSHIP GROWERS COOPERATIVE	2013-03-26 00:00:00+00	\N	CP0002174	\N	2019-08-20 21:41:21.855241+00	\N	92	\N	0	2018-08-15 00:00:00+00	2019-02-26 00:00:00+00
93	2019-08-20 21:41:25.222065+00	\N	0	2018-09-29 00:00:00+00	INCLUSIVE LEADERSHIP CO-OPERATIVE	2013-04-22 00:00:00+00	\N	CP0002177	\N	2019-08-20 21:41:25.222065+00	\N	93	\N	0	2018-09-29 00:00:00+00	2018-10-15 00:00:00+00
94	2019-08-20 21:41:29.136923+00	\N	0	2018-08-22 00:00:00+00	GOLDEN COMMUNITY SOCIAL SERVICES COOP	2016-04-25 00:00:00+00	\N	CP0002251	\N	2019-08-20 21:41:29.136923+00	\N	94	\N	0	2018-08-22 00:00:00+00	2018-12-03 00:00:00+00
95	2019-08-20 21:41:32.321258+00	\N	0	2018-09-25 00:00:00+00	MOUNTAIN RIDGE ROAD USERS COOPERATIVE ASSOCIATION	2016-06-28 00:00:00+00	\N	CP0002256	\N	2019-08-20 21:41:32.321258+00	\N	95	\N	0	2018-09-25 00:00:00+00	2019-01-10 00:00:00+00
96	2019-08-20 21:41:36.084443+00	\N	0	2018-09-12 00:00:00+00	ALBERNI VALLEY SENIORS SERVICES SECTOR COOPERATIVE	2018-06-13 00:00:00+00	\N	CP0002302	\N	2019-08-20 21:41:36.084443+00	\N	96	\N	0	2018-09-12 00:00:00+00	2019-05-07 00:00:00+00
97	2019-08-20 21:41:40.619565+00	\N	0	2013-09-27 00:00:00+00	PEOPLE'S CO-OPERATIVE BOOKSTORE ASSOCIATION	1945-07-17 00:00:00+00	\N	CP0000545	\N	2019-08-20 21:41:40.619565+00	\N	97	\N	0	2013-09-27 00:00:00+00	2018-06-06 00:00:00+00
51	2019-08-20 21:38:27.70428+00	\N	0	2019-08-20 22:34:25.98386+00	WILDERNESS PARK CO-OPERATIVE HOUSING ASSOCIATION	1974-06-20 00:00:00+00	\N	CP0000976	\N	2019-08-20 21:38:27.70428+00	\N	101	\N	1	2019-08-20 00:00:00+00	2019-02-21 00:00:00+00
51	2019-08-20 21:38:27.70428+00	\N	0	2018-09-18 00:00:00+00	WILDERNESS PARK CO-OPERATIVE HOUSING ASSOCIATION	1974-06-20 00:00:00+00	\N	CP0000976	\N	2019-08-20 21:38:27.70428+00	\N	51	101	0	2018-09-18 00:00:00+00	2019-02-21 00:00:00+00
99	2019-08-21 03:12:41.911411+00	\N	0	2018-09-20 00:00:00+00	THE CASTLEGAR CO-OPERATIVE TRANSPORTATION SOCIETY	1938-10-06 00:00:00+00	\N	CP0000393	\N	2019-08-21 03:12:41.911411+00	\N	103	\N	0	2018-09-20 00:00:00+00	2018-12-12 00:00:00+00
100	2019-08-21 03:12:47.799419+00	\N	0	2018-09-18 00:00:00+00	WILDERNESS PARK CO-OPERATIVE HOUSING ASSOCIATION	1974-06-20 00:00:00+00	\N	CP0000976	\N	2019-08-21 03:12:47.799419+00	\N	104	\N	0	2018-09-18 00:00:00+00	2019-02-21 00:00:00+00
101	2019-08-21 03:12:53.334397+00	\N	0	2018-09-20 00:00:00+00	WASHINGTON CO-OPERATIVE HOUSING ASSOCIATION	1974-06-12 00:00:00+00	\N	CP0000977	\N	2019-08-21 03:12:53.334397+00	\N	105	\N	0	2018-09-20 00:00:00+00	2019-07-18 00:00:00+00
102	2019-08-21 03:12:59.24139+00	\N	0	2018-09-26 00:00:00+00	MISSION COOPERATIVE HOUSING ASSOCIATION	1975-04-10 00:00:00+00	\N	CP0001024	\N	2019-08-21 03:12:59.24139+00	\N	106	\N	0	2018-09-26 00:00:00+00	2019-01-04 00:00:00+00
103	2019-08-21 03:13:05.812939+00	\N	0	2018-09-12 00:00:00+00	KOOTENAY COUNTRY STORE COOPERATIVE	1975-06-24 00:00:00+00	\N	CP0001041	\N	2019-08-21 03:13:05.812939+00	\N	107	\N	0	2018-09-12 00:00:00+00	2019-05-02 00:00:00+00
104	2019-08-21 03:13:12.761318+00	\N	0	2018-09-26 00:00:00+00	MANHATTAN CO-OPERATIVE HOUSING ASSOCIATION	1979-02-26 00:00:00+00	\N	CP0001164	\N	2019-08-21 03:13:12.761318+00	\N	108	\N	0	2018-09-26 00:00:00+00	2018-12-11 00:00:00+00
105	2019-08-21 03:13:18.41643+00	\N	0	2018-09-25 00:00:00+00	VALLEY VILLAGE HOUSING CO-OPERATIVE	1979-05-10 00:00:00+00	\N	CP0001173	\N	2019-08-21 03:13:18.41643+00	\N	109	\N	0	2018-09-25 00:00:00+00	2018-10-23 00:00:00+00
106	2019-08-21 03:13:24.443447+00	\N	0	2018-09-11 00:00:00+00	POST 83 CO-OPERATIVE HOUSING ASSOCIATION	1979-09-24 00:00:00+00	\N	CP0001184	\N	2019-08-21 03:13:24.443447+00	\N	110	\N	0	2018-09-11 00:00:00+00	2019-06-06 00:00:00+00
107	2019-08-21 03:13:29.886035+00	\N	0	2018-09-27 00:00:00+00	TWIN RAINBOWS HOUSING CO-OPERATIVE	1979-10-17 00:00:00+00	\N	CP0001186	\N	2019-08-21 03:13:29.886035+00	\N	111	\N	0	2018-09-27 00:00:00+00	2019-07-24 00:00:00+00
108	2019-08-21 03:13:35.8801+00	\N	0	2018-09-25 00:00:00+00	COMMON GROUND HOUSING CO-OPERATIVE	1980-02-18 00:00:00+00	\N	CP0001202	\N	2019-08-21 03:13:35.8801+00	\N	112	\N	0	2018-09-25 00:00:00+00	2018-11-02 00:00:00+00
109	2019-08-21 03:13:42.021858+00	\N	0	2018-09-28 00:00:00+00	HUNTINGTON PLACE HOUSING CO-OPERATIVE	1980-03-13 00:00:00+00	\N	CP0001205	\N	2019-08-21 03:13:42.021858+00	\N	113	\N	0	2018-09-28 00:00:00+00	2019-04-16 00:00:00+00
110	2019-08-21 03:13:47.622878+00	\N	0	2018-09-25 00:00:00+00	HAWTHORNE HOUSING CO-OPERATIVE	1980-11-27 00:00:00+00	\N	CP0001229	\N	2019-08-21 03:13:47.622878+00	\N	114	\N	0	2018-09-25 00:00:00+00	2018-10-22 00:00:00+00
111	2019-08-21 03:13:53.065852+00	\N	0	2018-09-25 00:00:00+00	VIEW COURT HOUSING CO-OPERATIVE	1981-05-21 00:00:00+00	\N	CP0001252	\N	2019-08-21 03:13:53.065852+00	\N	115	\N	0	2018-09-25 00:00:00+00	2018-11-08 00:00:00+00
112	2019-08-21 03:13:58.024883+00	\N	0	2018-09-25 00:00:00+00	BAKERVIEW HOUSING CO-OPERATIVE	1981-06-05 00:00:00+00	\N	CP0001254	\N	2019-08-21 03:13:58.024883+00	\N	116	\N	0	2018-09-25 00:00:00+00	2019-06-24 00:00:00+00
113	2019-08-21 03:14:03.099879+00	\N	0	2018-09-23 00:00:00+00	EIGHT OAKS HOUSING CO-OPERATIVE	1981-07-09 00:00:00+00	\N	CP0001257	\N	2019-08-21 03:14:03.099879+00	\N	117	\N	0	2018-09-23 00:00:00+00	2019-07-23 00:00:00+00
114	2019-08-21 03:14:09.314596+00	\N	0	2018-09-05 00:00:00+00	SHAUGHNESSY HOUSING CO OPERATIVE	1982-01-27 00:00:00+00	\N	CP0001299	\N	2019-08-21 03:14:09.314596+00	\N	118	\N	0	2018-09-05 00:00:00+00	2019-01-17 00:00:00+00
115	2019-08-21 03:14:14.988691+00	\N	0	2018-09-24 00:00:00+00	WOODLAND PARK HOUSING CO-OPERATIVE	1982-02-25 00:00:00+00	\N	CP0001306	\N	2019-08-21 03:14:14.988691+00	\N	119	\N	0	2018-09-24 00:00:00+00	2018-11-28 00:00:00+00
116	2019-08-21 03:14:19.888788+00	\N	0	2018-09-17 00:00:00+00	MAYFLOWER CO-OPERATIVE HOUSING ASSOCIATION	1982-05-14 00:00:00+00	\N	CP0001327	\N	2019-08-21 03:14:19.888788+00	\N	120	\N	0	2018-09-17 00:00:00+00	2018-10-05 00:00:00+00
117	2019-08-21 03:14:25.437619+00	\N	0	2018-08-11 00:00:00+00	MERIDIAN GARDENS COOPERATIVE ASSOCIATION	1982-06-08 00:00:00+00	\N	CP0001333	\N	2019-08-21 03:14:25.437619+00	\N	121	\N	0	2018-08-11 00:00:00+00	2018-08-29 00:00:00+00
118	2019-08-21 03:14:32.022741+00	\N	0	2018-08-28 00:00:00+00	JUNIPER CO-OPERATIVE COMMUNITY HOUSING ASSOCIATION	1982-11-12 00:00:00+00	\N	CP0001356	\N	2019-08-21 03:14:32.022741+00	\N	122	\N	0	2018-08-28 00:00:00+00	2019-03-22 00:00:00+00
119	2019-08-21 03:14:36.635775+00	\N	0	2018-09-11 00:00:00+00	KITSILANO TERRACE HOUSING CO-OPERATIVE	1982-12-07 00:00:00+00	\N	CP0001364	\N	2019-08-21 03:14:36.635775+00	\N	123	\N	0	2018-09-11 00:00:00+00	2018-10-02 00:00:00+00
120	2019-08-21 03:14:43.912581+00	\N	0	2018-09-26 00:00:00+00	LAVENDER HOUSING COOPERATIVE	1983-06-06 00:00:00+00	\N	CP0001389	\N	2019-08-21 03:14:43.912581+00	\N	124	\N	0	2018-09-26 00:00:00+00	2019-08-06 00:00:00+00
121	2019-08-21 03:14:48.787123+00	\N	0	2018-09-26 00:00:00+00	WATERSIDE HOUSING COOPERATIVE	1983-09-27 00:00:00+00	\N	CP0001405	\N	2019-08-21 03:14:48.787123+00	\N	125	\N	0	2018-09-26 00:00:00+00	2018-10-25 00:00:00+00
122	2019-08-21 03:14:53.977898+00	\N	0	2018-09-12 00:00:00+00	BENRYK MEWS HOUSING CO-OPERATIVE	1984-04-26 00:00:00+00	\N	CP0001430	\N	2019-08-21 03:14:53.977898+00	\N	126	\N	0	2018-09-12 00:00:00+00	2018-10-02 00:00:00+00
123	2019-08-21 03:14:59.685995+00	\N	0	2018-08-30 00:00:00+00	HARBOUR COVE HOUSING CO-OPERATIVE	1984-08-24 00:00:00+00	\N	CP0001448	\N	2019-08-21 03:14:59.685995+00	\N	127	\N	0	2018-08-30 00:00:00+00	2018-09-17 00:00:00+00
124	2019-08-21 03:15:04.046957+00	\N	0	2018-08-21 00:00:00+00	FRIENDSHIP HOUSING COOPERATIVE	1984-11-22 00:00:00+00	\N	CP0001463	\N	2019-08-21 03:15:04.046957+00	\N	128	\N	0	2018-08-21 00:00:00+00	2019-02-07 00:00:00+00
125	2019-08-21 03:15:08.268941+00	\N	0	2018-09-12 00:00:00+00	MANANA PARK WATER CO-OPERATIVE	1985-01-22 00:00:00+00	\N	CP0001468	\N	2019-08-21 03:15:08.268941+00	\N	129	\N	0	2018-09-12 00:00:00+00	2018-11-13 00:00:00+00
126	2019-08-21 03:15:14.462933+00	\N	0	2018-09-27 00:00:00+00	ALBERNI FAMILY HOUSING CO-OPERATIVE	1985-04-23 00:00:00+00	\N	CP0001483	\N	2019-08-21 03:15:14.462933+00	\N	130	\N	0	2018-09-27 00:00:00+00	2018-10-22 00:00:00+00
127	2019-08-21 03:15:19.666933+00	\N	0	2018-09-25 00:00:00+00	SITKA HOUSING CO-OPERATIVE (1985)	1985-08-26 00:00:00+00	\N	CP0001496	\N	2019-08-21 03:15:19.666933+00	\N	131	\N	0	2018-09-25 00:00:00+00	2018-10-12 00:00:00+00
128	2019-08-21 03:15:24.266093+00	\N	0	2018-09-27 00:00:00+00	CENTENNIAL PARK HOUSING CO-OPERATIVE	1986-01-21 00:00:00+00	\N	CP0001505	\N	2019-08-21 03:15:24.266093+00	\N	132	\N	0	2018-09-27 00:00:00+00	2018-11-07 00:00:00+00
129	2019-08-21 03:15:29.778758+00	\N	0	2018-09-24 00:00:00+00	MAYA HOUSING CO-OPERATIVE	1986-06-30 00:00:00+00	\N	CP0001523	\N	2019-08-21 03:15:29.778938+00	\N	133	\N	0	2018-09-24 00:00:00+00	2019-05-06 00:00:00+00
130	2019-08-21 03:15:36.739327+00	\N	0	2018-09-12 00:00:00+00	CHANCES HOUSING CO-OPERATIVE	1987-01-23 00:00:00+00	\N	CP0001547	\N	2019-08-21 03:15:36.739327+00	\N	134	\N	0	2018-09-12 00:00:00+00	2019-07-29 00:00:00+00
131	2019-08-21 03:15:41.449921+00	\N	0	2018-09-27 00:00:00+00	FOUR MILE HEIGHTS HOUSING COOPERATIVE	1987-07-17 00:00:00+00	\N	CP0001556	\N	2019-08-21 03:15:41.449921+00	\N	135	\N	0	2018-09-27 00:00:00+00	2018-12-03 00:00:00+00
132	2019-08-21 03:15:45.764918+00	\N	0	2018-09-24 00:00:00+00	SUNDUNE HOUSING CO-OPERATIVE	1988-04-21 00:00:00+00	\N	CP0001570	\N	2019-08-21 03:15:45.764918+00	\N	136	\N	0	2018-09-24 00:00:00+00	2018-12-06 00:00:00+00
133	2019-08-21 03:15:50.894933+00	\N	0	2018-09-26 00:00:00+00	RIVER'S END HOUSING CO-OPERATIVE	1988-05-24 00:00:00+00	\N	CP0001576	\N	2019-08-21 03:15:50.894933+00	\N	137	\N	0	2018-09-26 00:00:00+00	2018-12-20 00:00:00+00
134	2019-08-21 03:15:56.819122+00	\N	0	2018-09-23 00:00:00+00	IMAGINE THAT ARTISANS' DESIGNS CO-OPERATIVE ASSOCIATION	1994-11-30 00:00:00+00	\N	CP0001700	\N	2019-08-21 03:15:56.819122+00	\N	138	\N	0	2018-09-23 00:00:00+00	2018-10-10 00:00:00+00
135	2019-08-21 03:16:01.54712+00	\N	0	2018-08-10 00:00:00+00	THE WILLOWS HOUSING COOPERATIVE ASSOCIATION	2000-07-13 00:00:00+00	\N	CP0001847	\N	2019-08-21 03:16:01.54712+00	\N	139	\N	0	2018-08-10 00:00:00+00	2018-09-18 00:00:00+00
136	2019-08-21 03:16:06.473131+00	\N	0	2018-09-16 00:00:00+00	THE KOOTENAY BAKERY CAFE COOPERATIVE	2001-03-14 00:00:00+00	\N	CP0001867	\N	2019-08-21 03:16:06.473131+00	\N	140	\N	0	2018-09-16 00:00:00+00	2018-11-01 00:00:00+00
137	2019-08-21 03:16:11.565545+00	\N	0	2018-09-26 00:00:00+00	KOOTENAY BOUNDARY COMMUNITY SERVICES CO-OPERATIVE	2003-04-11 00:00:00+00	\N	CP0001940	\N	2019-08-21 03:16:11.565545+00	\N	141	\N	0	2018-09-26 00:00:00+00	2018-12-13 00:00:00+00
138	2019-08-21 03:16:17.306547+00	\N	0	2018-08-11 00:00:00+00	UMBRELLA MULTICULTURAL HEALTH COOPERATIVE	2010-01-08 00:00:00+00	\N	CP0002081	\N	2019-08-21 03:16:17.307109+00	\N	142	\N	0	2018-08-11 00:00:00+00	2018-09-21 00:00:00+00
139	2019-08-21 03:16:22.679546+00	\N	0	2018-09-26 00:00:00+00	MY RECREATIONAL MOUNTAIN CO-OPERATIVE	2011-08-25 00:00:00+00	\N	CP0002120	\N	2019-08-21 03:16:22.679655+00	\N	143	\N	0	2018-09-26 00:00:00+00	2019-05-15 00:00:00+00
140	2019-08-21 03:16:27.72344+00	\N	0	2018-09-30 00:00:00+00	DADS AUTO DELIVERIES CO-OP	2012-06-01 00:00:00+00	\N	CP0002141	\N	2019-08-21 03:16:27.72344+00	\N	144	\N	0	2018-09-30 00:00:00+00	2018-10-22 00:00:00+00
141	2019-08-21 03:16:32.157068+00	\N	0	2018-08-15 00:00:00+00	FARMSHIP GROWERS COOPERATIVE	2013-03-26 00:00:00+00	\N	CP0002174	\N	2019-08-21 03:16:32.157068+00	\N	145	\N	0	2018-08-15 00:00:00+00	2019-02-26 00:00:00+00
142	2019-08-21 03:16:36.748572+00	\N	0	2018-09-29 00:00:00+00	INCLUSIVE LEADERSHIP CO-OPERATIVE	2013-04-22 00:00:00+00	\N	CP0002177	\N	2019-08-21 03:16:36.748572+00	\N	146	\N	0	2018-09-29 00:00:00+00	2018-10-15 00:00:00+00
143	2019-08-21 03:16:41.459472+00	\N	0	2018-08-22 00:00:00+00	GOLDEN COMMUNITY SOCIAL SERVICES COOP	2016-04-25 00:00:00+00	\N	CP0002251	\N	2019-08-21 03:16:41.459472+00	\N	147	\N	0	2018-08-22 00:00:00+00	2018-12-03 00:00:00+00
144	2019-08-21 03:16:45.554483+00	\N	0	2018-09-25 00:00:00+00	MOUNTAIN RIDGE ROAD USERS COOPERATIVE ASSOCIATION	2016-06-28 00:00:00+00	\N	CP0002256	\N	2019-08-21 03:16:45.554483+00	\N	148	\N	0	2018-09-25 00:00:00+00	2019-01-10 00:00:00+00
145	2019-08-21 03:16:49.980768+00	\N	0	2018-09-12 00:00:00+00	ALBERNI VALLEY SENIORS SERVICES SECTOR COOPERATIVE	2018-06-13 00:00:00+00	\N	CP0002302	\N	2019-08-21 03:16:49.980768+00	\N	149	\N	0	2018-09-12 00:00:00+00	2019-05-07 00:00:00+00
146	2019-08-21 03:16:56.236764+00	\N	0	2013-09-27 00:00:00+00	PEOPLE'S CO-OPERATIVE BOOKSTORE ASSOCIATION	1945-07-17 00:00:00+00	\N	CP0000545	\N	2019-08-21 03:16:56.236764+00	\N	150	\N	0	2013-09-27 00:00:00+00	2018-06-06 00:00:00+00
147	2019-08-21 16:16:09.209741+00	\N	0	2018-09-30 00:00:00+00	CREEKVIEW HOUSING CO-OPERATIVE	1983-05-09 00:00:00+00	\N	CP0001383	\N	2019-08-21 16:16:09.209741+00	\N	151	\N	0	2018-09-30 00:00:00+00	2018-12-04 00:00:00+00
148	2019-08-21 16:16:16.048741+00	\N	0	2018-09-19 00:00:00+00	QUEENS PARK HOUSING CO-OPERATIVE	1985-03-21 00:00:00+00	\N	CP0001479	\N	2019-08-21 16:16:16.049567+00	\N	152	\N	0	2018-09-19 00:00:00+00	2018-11-08 00:00:00+00
149	2019-08-21 16:16:21.558729+00	\N	0	2018-09-24 00:00:00+00	ROBERT OWEN HOUSING CO-OPERATIVE	1986-10-23 00:00:00+00	\N	CP0001536	\N	2019-08-21 16:16:21.558729+00	\N	153	\N	0	2018-09-24 00:00:00+00	2019-07-23 00:00:00+00
\.


--
-- Data for Name: colin_last_update; Type: TABLE DATA; Schema: public; Owner: userG5G
--

COPY public.colin_last_update (id, last_update, last_event_id) FROM stdin;
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: userG5G
--

COPY public.comments (id, comment, "timestamp", business_id, staff_id) FROM stdin;
\.


--
-- Data for Name: directors; Type: TABLE DATA; Schema: public; Owner: userG5G
--

COPY public.directors (id, first_name, middle_initial, last_name, title, appointment_date, cessation_date, business_id, address_id) FROM stdin;
630	KIRK		DUFF		2016-10-07 00:00:00+00	\N	99	831
631	ADRIAN		JELLY		2016-10-07 00:00:00+00	\N	99	832
632	ROBERT		JOLLY		2018-12-12 00:00:00+00	\N	99	833
633	FRANK		KACSINKO		2017-10-23 00:00:00+00	\N	99	834
634	RAE		MACKLON		2014-12-02 00:00:00+00	\N	99	835
635	JOSEPH		MAKORTOFF		2017-10-23 00:00:00+00	\N	99	836
636	KIRA		MOFFAT		2017-10-23 00:00:00+00	\N	99	837
637	RAYMOND		PICHETTE		2014-12-02 00:00:00+00	\N	99	838
638	JENNIFER		AIKMAN		2019-02-21 00:00:00+00	\N	100	841
639	SHARON		BROUGH		2019-02-21 00:00:00+00	\N	100	842
640	DEBRA		DOUGLAS		2018-12-03 00:00:00+00	\N	100	843
641	BARB		DOYLE		2019-02-21 00:00:00+00	\N	100	844
642	ROSS		FOWLIE		2018-12-03 00:00:00+00	\N	100	845
643	ALLISON		LESLIE		2019-02-21 00:00:00+00	\N	100	846
644	CONNIE		MCCONNELL		2019-02-21 00:00:00+00	\N	100	847
645	JANET		SEE		2016-10-12 00:00:00+00	\N	101	850
646	LARRY		WOLFE		2018-10-23 00:00:00+00	\N	101	851
647	BRENT W.		WOODS		2014-05-09 00:00:00+00	\N	101	852
648	KEVAN		ARNELD		2017-11-14 00:00:00+00	\N	101	853
649	MARIAH		BURTON		2018-10-23 00:00:00+00	\N	101	854
650	KATHY		HOWLAND		2018-10-23 00:00:00+00	\N	101	855
651	LORNA		LYONS		2016-10-12 00:00:00+00	\N	101	856
652	KIRAN		BAGHA		2019-03-14 00:00:00+00	\N	101	857
653	MARY		ATKINSON		2016-09-09 00:00:00+00	\N	102	860
654	DAN		BUNNETT		2011-11-02 00:00:00+00	\N	102	861
655	GERRY		EDWARDS		2017-08-02 00:00:00+00	\N	102	862
656	CHARLOTTE		MEEKER		2012-12-10 00:00:00+00	\N	102	863
657	DENNIS		MONDS		2011-11-02 00:00:00+00	\N	102	864
658	BOB		PRIZEMAN		2013-09-20 00:00:00+00	\N	102	865
659	LISA		VON BENZON		2016-09-09 00:00:00+00	\N	102	866
660	LARRY		WIENS		2010-08-17 00:00:00+00	\N	102	867
661	LES		WILLEY		2018-10-22 00:00:00+00	\N	102	868
662	MAGGIE		JONES		2017-10-12 00:00:00+00	\N	103	871
663	MAUREEN N.		KELSEY		2016-10-26 00:00:00+00	\N	103	872
664	JOHN E.		KINGSMILL		2016-10-26 00:00:00+00	\N	103	873
665	INA		POCKRASS		2017-10-12 00:00:00+00	\N	103	874
666	ABRA		BRYNNE		2015-11-17 00:00:00+00	\N	103	875
667	ALEXANDRA		FORSYTHE		2017-10-12 00:00:00+00	\N	103	876
668	SHANNON		HAMMOND		2017-10-12 00:00:00+00	\N	103	877
669	SARAH		CONNOLLY		2019-04-11 00:00:00+00	\N	103	878
670	LAUREN		ELDRIDGE		2017-05-30 00:00:00+00	\N	104	881
671	DIANA		JEFFRIES		2018-12-11 00:00:00+00	\N	104	882
672	SIMON		KAULBACK		2018-12-11 00:00:00+00	\N	104	883
673	JAMES		MAXWELL		2018-12-11 00:00:00+00	\N	104	884
674	GARNET		MCPHEE		2018-12-11 00:00:00+00	\N	104	885
675	PHIL		MONDOR		2018-12-11 00:00:00+00	\N	104	886
676	MICHELLE		PERUGINI		2018-12-11 00:00:00+00	\N	104	887
677	DAVID		PLEWES		2018-12-11 00:00:00+00	\N	104	888
678	MARTHA		BLACK		2013-12-17 00:00:00+00	\N	105	891
679	KEN		CAMPBELL		2016-10-18 00:00:00+00	\N	105	892
680	DENNIS		ETHERIDGE		2015-10-23 00:00:00+00	\N	105	893
681	RICHARD		HYATT		2012-11-23 00:00:00+00	\N	105	894
682	LESLIE		PHELPS		2016-10-18 00:00:00+00	\N	105	895
683	RUDY		PRIES		2016-10-18 00:00:00+00	\N	105	896
684	CRYSTAL		ROBINSON		2018-10-22 00:00:00+00	\N	105	897
685	DOROTHY		TURNBULL		2007-10-18 00:00:00+00	\N	105	898
686	ROSEANNE		WADE		2012-11-23 00:00:00+00	\N	105	899
687	SUSAN		FERNANDEZ		2018-10-05 00:00:00+00	\N	106	902
688	CHRISTOPHER		KOPAR		2017-10-12 00:00:00+00	\N	106	903
689	RACHEL		LINDQUIST		2018-10-05 00:00:00+00	\N	106	904
690	YAKOV		PRIVES		2017-06-14 00:00:00+00	\N	106	905
691	RUTH		VODDEN		2017-10-12 00:00:00+00	\N	106	906
692	MARK		VOLKMANN		2019-06-06 00:00:00+00	\N	106	907
693	NATALIA		GRENKOVA		2019-06-06 00:00:00+00	\N	106	908
694	DIERDRE		BRADSHAW		2017-10-23 00:00:00+00	\N	107	911
695	JEN		CANDELA		2017-10-23 00:00:00+00	\N	107	912
696	DIANA		KOLLAR		2018-11-02 00:00:00+00	\N	107	913
697	YVES		MA		2017-10-23 00:00:00+00	\N	107	914
698	DANIEL		MCLEOD		2018-11-02 00:00:00+00	\N	107	915
699	JEFFREY		SHOUB		2017-05-04 00:00:00+00	\N	107	916
700	SABETTE		THOMPSON		2017-10-23 00:00:00+00	\N	107	917
701	AGNIESZKA		WEGLEWSKA		2017-10-23 00:00:00+00	\N	107	918
702	ANTHONY		ALLEN		2018-11-02 00:00:00+00	\N	108	921
703	EAMMON		BOURKE		2017-11-29 00:00:00+00	\N	108	922
704	LESLIE		FRASER		2018-11-02 00:00:00+00	\N	108	923
705	LORI		JONES		2017-11-29 00:00:00+00	\N	108	924
706	INGA		SKODA		2018-11-02 00:00:00+00	\N	108	925
707	ANDRES		VEGA		2018-11-02 00:00:00+00	\N	108	926
708	JOHN		MACKINTOSH		2017-11-29 00:00:00+00	\N	108	927
709	PETER		ROHDE		2018-11-02 00:00:00+00	\N	108	928
710	RIA		SIREGAR-LOOSEMOORE		2018-11-02 00:00:00+00	\N	108	929
711	JODIE		PAUL		2017-10-31 00:00:00+00	\N	109	932
712	DAVID		STEWART		2017-10-31 00:00:00+00	\N	109	933
713	THERESA		WHITE		2018-11-02 00:00:00+00	\N	109	934
714	COLLIN		BUDD		2017-06-19 00:00:00+00	\N	109	935
715	CASSANDRA		BURKHOLDER		2018-11-02 00:00:00+00	\N	109	936
716	AARON		MCNEILL		2017-10-31 00:00:00+00	\N	109	937
717	JASON		BAKKER		2018-10-22 00:00:00+00	\N	110	940
718	LORETTA		HRYNYK		2018-10-22 00:00:00+00	\N	110	941
719	MIKE		LEWIS		2018-10-03 00:00:00+00	\N	110	942
720	ELAINE		PAISLEY		2018-10-03 00:00:00+00	\N	110	943
721	GEORGIA		SPILIOTOPOULOS		2018-10-22 00:00:00+00	\N	110	944
722	VALERIE		UNRUH		2018-10-03 00:00:00+00	\N	110	945
723	AMANDA		WATKINS		2018-10-22 00:00:00+00	\N	110	946
724	VALERIE		WILLANS		2018-10-03 00:00:00+00	\N	110	947
725	NICKY		CAIRNCROSS		2018-11-08 00:00:00+00	\N	111	950
726	HELEN		JONES		2018-11-08 00:00:00+00	\N	111	951
727	SUSAN		LARKIN		2018-11-08 00:00:00+00	\N	111	952
728	CHARISSE		LYNCH-WELCH		2016-11-08 00:00:00+00	\N	111	953
729	SUSAN P.		NATION		2017-10-31 00:00:00+00	\N	111	954
730	DEBBIE		LAY		2018-12-20 00:00:00+00	\N	112	957
731	AARON		LONG		2018-12-20 00:00:00+00	\N	112	958
732	SAMANTHA		SMITH		2018-12-20 00:00:00+00	\N	112	959
733	BOYD		VICKERSON		2017-07-05 00:00:00+00	\N	112	960
734	NATHAN		VOS		2018-12-20 00:00:00+00	\N	112	961
735	SHILOH		BOUVETTE		2019-02-13 00:00:00+00	\N	113	964
736	DAN		BUDGELL		2019-02-13 00:00:00+00	\N	113	965
737	MICHAEL		LEYNE		2017-11-09 00:00:00+00	\N	113	966
738	SALLY		RUDOLF		2018-08-01 00:00:00+00	\N	113	967
739	LORI		SEAY		2017-11-09 00:00:00+00	\N	113	968
740	JULIE		TYE		2019-02-13 00:00:00+00	\N	113	969
741	AINE		YOUNG		2018-08-01 00:00:00+00	\N	113	970
742	MICHAEL		ROHALLY		2019-07-23 00:00:00+00	\N	113	971
743	ROBERT		TODOSICHUK		2019-01-17 00:00:00+00	\N	114	974
744	BETTINA		COTSONI		2019-01-17 00:00:00+00	\N	114	975
745	ILONA		FIZEL		2018-06-27 00:00:00+00	\N	114	976
746	JAMIE		MCINTYRE		2016-08-24 00:00:00+00	\N	114	977
747	LISA		OJAROODI		2018-06-27 00:00:00+00	\N	114	978
748	NICOLE		OWEN		2018-06-27 00:00:00+00	\N	114	979
749	SHANE		SCHOONEN		2019-01-17 00:00:00+00	\N	114	980
750	COLLEN		BUCHANAN		2017-08-17 00:00:00+00	\N	115	983
751	LINDA		NEPHIN		2017-08-17 00:00:00+00	\N	115	984
752	NIKI		PERRIN		2017-08-17 00:00:00+00	\N	115	985
753	DORIS		RAIWET		2017-08-17 00:00:00+00	\N	115	986
754	LENOX		REID		2018-11-07 00:00:00+00	\N	115	987
755	ORAL		WYNTER		2018-11-07 00:00:00+00	\N	115	988
756	SHEILA		BROWN		2018-10-05 00:00:00+00	\N	116	991
757	JODI		BURGESS		2015-01-06 00:00:00+00	\N	116	992
758	DAVID		CARDWELL		2013-12-17 00:00:00+00	\N	116	993
759	DEBBIE		COLLRIN		2018-10-05 00:00:00+00	\N	116	994
760	MERILYN		KAISER		2015-01-06 00:00:00+00	\N	116	995
761	ROSEMARIE		MAXIM		2018-10-05 00:00:00+00	\N	116	996
762	JANET		TAYLOR		2012-12-27 00:00:00+00	\N	116	997
763	INA		BOTHMA		2018-08-29 00:00:00+00	\N	117	1000
764	WENDY		HAMPTON		2017-10-23 00:00:00+00	\N	117	1001
765	ANN		MOORE		2017-10-23 00:00:00+00	\N	117	1002
766	E. MARY		SURTEL		2018-08-29 00:00:00+00	\N	117	1003
767	LAWRENCE		BOXALL		2016-09-29 00:00:00+00	\N	118	1006
768	JODY-ANN		EDMAN		2018-10-02 00:00:00+00	\N	118	1007
769	SANDRA		GREENE		2016-09-29 00:00:00+00	\N	118	1008
770	ADAM		MCLEOD		2018-10-02 00:00:00+00	\N	118	1009
771	MARINA		PRINCZ		2018-10-02 00:00:00+00	\N	118	1010
772	BRADUT		DIMA		2016-11-03 00:00:00+00	\N	119	1013
773	NANCY		FRENCH		2017-11-29 00:00:00+00	\N	119	1014
774	GAIL		JOHNSON		2018-10-02 00:00:00+00	\N	119	1015
775	ANDREW		MCCRACKEN		2018-10-02 00:00:00+00	\N	119	1016
776	ESTEBAN		MUGICA-JIMENO		2017-11-29 00:00:00+00	\N	119	1017
777	SHANE		TAYLOR		2018-10-02 00:00:00+00	\N	119	1018
778	KALEN		MORROW		2015-10-14 00:00:00+00	\N	120	1021
779	AMANDA		SANDBERG		2018-10-18 00:00:00+00	\N	120	1022
780	MELINDA		WARREN		2018-10-18 00:00:00+00	\N	120	1023
781	SHAUNA		BARTER		2013-10-24 00:00:00+00	\N	120	1024
782	SEAN		DALEY		2017-11-20 00:00:00+00	\N	120	1025
783	DEBORAH		MCDONALD		2017-11-20 00:00:00+00	\N	120	1026
784	PETER		MOONAN		2018-10-18 00:00:00+00	\N	120	1027
785	SARAH		COWEN		2018-10-19 00:00:00+00	\N	121	1030
786	CAINE		MILLS		2018-10-25 00:00:00+00	\N	121	1031
787	MARY		MORGAN-PICK		2018-10-19 00:00:00+00	\N	121	1032
788	SARA		QUIST		2018-10-25 00:00:00+00	\N	121	1033
789	RYAN		REDDING		2018-10-19 00:00:00+00	\N	121	1034
790	PHILLIP		ALMENDRALA		2018-10-02 00:00:00+00	\N	122	1037
791	OLEG		ANDREICHIKOV		2016-10-06 00:00:00+00	\N	122	1038
792	MARIA		BROCAL		2018-10-02 00:00:00+00	\N	122	1039
793	MICHELE		CLOETE		2009-10-23 00:00:00+00	\N	122	1040
794	NORAH		JOHNSTON		2009-10-23 00:00:00+00	\N	122	1041
795	NAZ		KARIM		2015-11-06 00:00:00+00	\N	122	1042
796	VANCE		LUCENTE		2017-10-16 00:00:00+00	\N	122	1043
797	MONICA		NUCA		2017-10-16 00:00:00+00	\N	122	1044
798	SEAN		MACKENROT		2013-11-05 00:00:00+00	\N	123	1047
799	TALIB		RAY		2017-10-11 00:00:00+00	\N	123	1048
800	SHAUN		D'SOUZA		2017-11-22 00:00:00+00	\N	123	1049
801	TODD		ROMER		2017-10-11 00:00:00+00	\N	123	1050
802	DRAGANA		VASIC		2017-10-11 00:00:00+00	\N	123	1051
803	EMILY		BLAND		2018-09-12 00:00:00+00	\N	124	1054
804	LYN		CUSTAN		2017-09-26 00:00:00+00	\N	124	1055
805	VANESSA		JESELON		2017-09-26 00:00:00+00	\N	124	1056
806	BERNARD		WILSON		2017-09-26 00:00:00+00	\N	124	1057
807	MAURICE		COGSWELL		2004-09-23 00:00:00+00	\N	125	1060
808	WILLIAM		COGSWELL		2004-09-23 00:00:00+00	\N	125	1061
809	JOHN		DOUGLAS		2015-03-05 00:00:00+00	\N	125	1062
810	LANCE		HILLBRECHT		2004-09-23 00:00:00+00	\N	125	1063
811	DANIEL		MALONEY		2015-03-05 00:00:00+00	\N	125	1064
812	STEPHAN		CLARKE		2017-07-21 00:00:00+00	\N	126	1067
813	CRISI		CORBI		2018-10-22 00:00:00+00	\N	126	1068
814	KEVIN		GOOCH		2018-10-22 00:00:00+00	\N	126	1069
815	LAWRENCE		GORDON		2018-10-22 00:00:00+00	\N	126	1070
816	PREMILA		NANDAN		2017-07-21 00:00:00+00	\N	126	1071
817	PAT		SHUCHUK		2011-03-10 00:00:00+00	\N	126	1072
818	CLARA		UGARELLI		2012-12-10 00:00:00+00	\N	126	1073
819	SHERI		BERGMAN		2017-10-30 00:00:00+00	\N	127	1076
820	JANIE		CAWLEY		2016-10-26 00:00:00+00	\N	127	1077
821	TRACY		KOLWICH		2016-10-26 00:00:00+00	\N	127	1078
822	BOZENA		ZDANIUK		2018-10-12 00:00:00+00	\N	127	1079
823	JOHN		MERCIER		2016-09-16 00:00:00+00	\N	128	1082
824	OLGA		PLEKHANOVA		2016-11-23 00:00:00+00	\N	128	1083
825	OXANA		REYMERS		2017-12-11 00:00:00+00	\N	128	1084
826	RAY		TAYLOR		2016-09-16 00:00:00+00	\N	128	1085
827	ZARRINA		VOINOVA		2017-12-11 00:00:00+00	\N	128	1086
828	TOMASZ		ZEMOJTEL		2016-11-23 00:00:00+00	\N	128	1087
829	ANNEMARIE		CLOWERS		2015-11-20 00:00:00+00	\N	129	1090
830	JACLYN		CRUZ		2015-11-20 00:00:00+00	\N	129	1091
831	PATRICIA		DOCHERTY		2015-03-30 00:00:00+00	\N	129	1092
832	SHARON		HILDEBRANDT		2014-02-26 00:00:00+00	\N	129	1093
833	ANGELA		OMELCENCO		2016-10-27 00:00:00+00	\N	129	1094
834	JANE		ROBERTS		2015-03-20 00:00:00+00	\N	129	1095
835	ALICE		YEUNG		2016-10-27 00:00:00+00	\N	129	1096
836	ANNETTE		ANDERSON		2018-10-30 00:00:00+00	\N	130	1099
837	AFROZA		AWAL		2017-10-31 00:00:00+00	\N	130	1100
838	TROY		HAMILTON		2017-10-31 00:00:00+00	\N	130	1101
839	LAKSHMI		MCCALL		2018-10-30 00:00:00+00	\N	130	1102
840	MARIAN		MICHALSKI		2018-10-30 00:00:00+00	\N	130	1103
841	KAI		SJOHOLM		2018-10-30 00:00:00+00	\N	130	1104
842	BRIAN		MACDONALD		2018-12-03 00:00:00+00	\N	131	1107
843	CORRINE		PRESCOTT		2018-12-03 00:00:00+00	\N	131	1108
844	GETASEW		WOLDEMARIAM		2018-12-03 00:00:00+00	\N	131	1109
845	ZENNA		ZARELLI		2018-12-03 00:00:00+00	\N	131	1110
846	CARRIE		LEBLANC		2018-12-03 00:00:00+00	\N	131	1111
847	BEATRIZ		GONZALEZ-BARRIOS		2017-10-11 00:00:00+00	\N	132	1114
848	PABLO		PASCUALE		2018-12-06 00:00:00+00	\N	132	1115
849	TATIANA		SITAR		2018-12-06 00:00:00+00	\N	132	1116
850	ANNA		SMIRNOFF		2018-12-06 00:00:00+00	\N	132	1117
851	ANNA		TIMOFEEVA		2018-12-06 00:00:00+00	\N	132	1118
852	OLGA		VAFINA		2018-12-06 00:00:00+00	\N	132	1119
853	RICHARD		ALLEN		2018-12-20 00:00:00+00	\N	133	1122
854	SUSY		ASTETE		2016-07-18 00:00:00+00	\N	133	1123
855	HEATHER		BLISS		2017-10-23 00:00:00+00	\N	133	1124
856	HELMUT		DAIMINGER		2017-10-02 00:00:00+00	\N	133	1125
857	TAJ		IRWIN		2018-12-20 00:00:00+00	\N	133	1126
858	CARMELLE		LAMB		2018-12-20 00:00:00+00	\N	133	1127
859	CHRISTINE		MCWILLIAMS		2018-12-20 00:00:00+00	\N	133	1128
860	KIMBERLEY		O'MALLEY		2017-10-23 00:00:00+00	\N	133	1129
861	OLIVIA		VERBIAN		2016-10-18 00:00:00+00	\N	133	1130
862	SANDRA		GREENAWAY		2014-11-17 00:00:00+00	\N	134	1133
863	FREDERICK		KENNEDY		2017-10-11 00:00:00+00	\N	134	1134
864	JOYCE		LEROUX		2018-10-10 00:00:00+00	\N	134	1135
865	VERONICA		SCOTT		2018-10-10 00:00:00+00	\N	134	1136
866	KATHRYN		DANIEL		2015-10-22 00:00:00+00	\N	134	1137
867	KEITH		BRYSON		2018-09-19 00:00:00+00	\N	135	1140
868	NANCY		LACHAPELLE		2018-09-19 00:00:00+00	\N	135	1141
869	NANCY		PAYNE		2014-11-17 00:00:00+00	\N	135	1142
870	JESSE		THOMAS		2018-09-19 00:00:00+00	\N	135	1143
871	JOHN		WELLS		2008-01-09 00:00:00+00	\N	135	1144
872	MARIE		FILIATRAULT		2014-11-17 00:00:00+00	\N	135	1145
873	DEBORAH		DESILETS		2016-10-26 00:00:00+00	\N	136	1148
874	ROBYN S.		HIGGINS		2017-10-18 00:00:00+00	\N	136	1149
875	NATASHA		MCAVOY		2018-10-31 00:00:00+00	\N	136	1150
876	STEFAAN		SYNNESAEL		2018-10-31 00:00:00+00	\N	136	1151
877	JULIA R.		WALKER		2017-06-19 00:00:00+00	\N	136	1152
878	PHYLLIS A.		NASH		2010-12-24 00:00:00+00	\N	137	1155
879	MARGARET		NICKLE		2017-10-25 00:00:00+00	\N	137	1156
880	JOCELYN		STUART		2018-12-13 00:00:00+00	\N	137	1157
881	CAROLE		SUMMER		2017-10-25 00:00:00+00	\N	137	1158
882	JIM		FISHER		2018-12-13 00:00:00+00	\N	137	1159
883	LENA		HORSWILL		2017-10-25 00:00:00+00	\N	137	1160
884	CATHY		LEUGNER		2018-12-13 00:00:00+00	\N	137	1161
885	RON		LIDDLE		2017-10-25 00:00:00+00	\N	137	1162
886	ZARGHOONA		ABDUL WAKIL		2016-09-09 00:00:00+00	\N	138	1165
887	ZARIF		AKBARIAN		2017-09-21 00:00:00+00	\N	138	1166
888	EDITH M		CULLER MATA		2015-09-16 00:00:00+00	\N	138	1167
889	PARTRICIA		DABIRI		2017-09-21 00:00:00+00	\N	138	1168
890	RASHMI		RAHEJA		2017-09-21 00:00:00+00	\N	138	1169
891	CHAYA		RANSEN		2016-09-09 00:00:00+00	\N	138	1170
892	MIGUEL		TRUJILLO		2015-09-16 00:00:00+00	\N	138	1171
893	MEAGAN J.		GROSSMAN		2017-10-16 00:00:00+00	\N	139	1174
894	SARAH A.		ZIMMERMAN		2017-10-16 00:00:00+00	\N	139	1175
895	PETER S.		HARLING		2017-10-16 00:00:00+00	\N	139	1176
896	KATARZYNA M.		KISTOWSKA		2016-11-23 00:00:00+00	\N	139	1177
897	STEPHEN		SALEM		2017-10-16 00:00:00+00	\N	139	1178
898	JAMES D		SEIB		2016-11-23 00:00:00+00	\N	139	1179
899	DAVID		GORDON		2019-05-15 00:00:00+00	\N	139	1180
900	EVAN		VAN DYK		2019-05-15 00:00:00+00	\N	139	1181
901	GORDON		DYCKE		2013-09-20 00:00:00+00	\N	140	1184
902	CHARLES		EAMER		2016-09-28 00:00:00+00	\N	140	1185
903	MIKE		HECKL		2016-09-28 00:00:00+00	\N	140	1186
904	GORDON J.		STENGEL		2013-03-27 00:00:00+00	\N	140	1187
905	KENNETH		WRIGHT		2018-10-22 00:00:00+00	\N	140	1188
906	CHRISTOPHER		BROWN		2015-01-07 00:00:00+00	\N	141	1191
907	ISABELLE J		MORRIS		2013-03-26 00:00:00+00	\N	141	1192
908	CRAIG H		EVANS		2013-03-26 00:00:00+00	\N	141	1193
909	JENNIFER J		CODY		2015-01-07 00:00:00+00	\N	141	1194
910	LINDSAY		BEAL		2016-09-07 00:00:00+00	\N	142	1197
911	CATHY		GILBERT		2016-09-07 00:00:00+00	\N	142	1198
912	NOLA		LANDUCCI		2018-10-15 00:00:00+00	\N	142	1199
913	DONNA		SASSAMAN		2018-10-15 00:00:00+00	\N	142	1200
914	JOHN W.		SCULL		2014-05-27 00:00:00+00	\N	142	1201
915	KIM		CITTON		2014-05-27 00:00:00+00	\N	142	1202
916	ALYCIA		WEIR		2018-12-03 00:00:00+00	\N	143	1205
917	HELENA A.M.		OOSTHOEK		2016-04-25 00:00:00+00	\N	143	1206
918	CONNIE E.		BARLOW		2016-04-25 00:00:00+00	\N	143	1207
919	JILL		HOLLAND		2018-12-03 00:00:00+00	\N	143	1208
920	NADINE		PODMOROFF		2016-06-28 00:00:00+00	\N	144	1211
921	SEAN		HOODICOFF		2019-01-10 00:00:00+00	\N	144	1212
922	LORI		HANSON		2019-01-10 00:00:00+00	\N	144	1213
923	VANESSA		BENWOOD		2017-10-16 00:00:00+00	\N	144	1214
924	LYNN		TURNER		2018-06-13 00:00:00+00	\N	145	1217
925	BARB		STEVENSON		2018-06-13 00:00:00+00	\N	145	1218
926	DOROTHY		PATTERSON		2018-06-13 00:00:00+00	\N	145	1219
927	PAT		KERMEEN		2018-06-13 00:00:00+00	\N	145	1220
928	WES		HEWITT		2018-06-13 00:00:00+00	\N	145	1221
929	CATHY		GISLASON		2018-06-13 00:00:00+00	\N	145	1222
930	JOHN		DOUGLAS		2018-06-13 00:00:00+00	\N	145	1223
931	TERRY		DEAKIN		2019-05-03 00:00:00+00	\N	145	1224
932	ELLEN		LACHARITY		2019-05-03 00:00:00+00	\N	145	1225
933	LARRY		CONN		2018-06-06 00:00:00+00	\N	146	1228
934	JAY		HAMBURGER		2018-06-06 00:00:00+00	\N	146	1229
935	LUKAS		HYRMAN		2018-06-06 00:00:00+00	\N	146	1230
936	ROLF		MAURER		2018-06-06 00:00:00+00	\N	146	1231
937	COLLEEN		SMITH		2018-06-06 00:00:00+00	\N	146	1232
938	MICHAEL		YOUNG		2018-06-06 00:00:00+00	\N	146	1233
939	SIMON		HUSSEY		2017-10-30 00:00:00+00	\N	147	1236
940	CHRIS		MCGREGOR		2016-12-30 00:00:00+00	\N	147	1237
941	DENNIS		NIELSEN		2017-10-30 00:00:00+00	\N	147	1238
942	KEVIN		PEERS		2017-10-30 00:00:00+00	\N	147	1239
943	CLARA		SALAMANCA		2017-10-30 00:00:00+00	\N	147	1240
944	SHAWN		SORENSON		2018-12-04 00:00:00+00	\N	147	1241
945	STEFAN		VOLGELFAENGER		2017-10-30 00:00:00+00	\N	147	1242
946	FRANCES		ANDERSON		2017-10-30 00:00:00+00	\N	147	1243
947	JASON		DEVINE		2017-10-30 00:00:00+00	\N	147	1244
948	RYAN		GLUCKMAN		2016-12-30 00:00:00+00	\N	147	1245
949	CHRISTINE		GUTIERREZ		2016-11-09 00:00:00+00	\N	148	1248
950	STEPHEN		HOLMES		2017-11-01 00:00:00+00	\N	148	1249
951	ADAM		JUREWICZ		2018-11-08 00:00:00+00	\N	148	1250
952	JULIE		ROUSELL		2015-10-21 00:00:00+00	\N	148	1251
953	CHRISTIE		ADAMUS		2018-11-08 00:00:00+00	\N	148	1252
954	ARLENE		COLLETT		2015-10-21 00:00:00+00	\N	148	1253
955	DAN		GARFIELD		2018-11-08 00:00:00+00	\N	148	1254
956	JACQUELINE		ALLEN		2017-10-17 00:00:00+00	\N	149	1257
957	WAYNE		PIERPONT		2017-10-17 00:00:00+00	\N	149	1258
958	NICOLAE		BOARIU		2017-03-31 00:00:00+00	\N	149	1259
959	IENAS		JAMAL		2015-12-03 00:00:00+00	\N	149	1260
960	DONNA		LAWRENCE		2014-12-08 00:00:00+00	\N	149	1261
961	LIUBOV		ZAIKOVA		2019-04-04 00:00:00+00	\N	149	1262
962	GALYNA		MADORSKY		2019-04-04 00:00:00+00	\N	149	1263
963	ALISON		AZZANO		2019-04-04 00:00:00+00	\N	149	1264
\.


--
-- Data for Name: directors_version; Type: TABLE DATA; Schema: public; Owner: userG5G
--

COPY public.directors_version (id, first_name, middle_initial, last_name, title, appointment_date, cessation_date, business_id, address_id, transaction_id, end_transaction_id, operation_type) FROM stdin;
1	KIRK		DUFF		2016-10-07 00:00:00+00	\N	1	3	1	\N	0
2	ADRIAN		JELLY		2016-10-07 00:00:00+00	\N	1	4	1	\N	0
3	ROBERT		JOLLY		2018-12-12 00:00:00+00	\N	1	5	1	\N	0
4	FRANK		KACSINKO		2017-10-23 00:00:00+00	\N	1	6	1	\N	0
5	RAE		MACKLON		2014-12-02 00:00:00+00	\N	1	7	1	\N	0
6	JOSEPH		MAKORTOFF		2017-10-23 00:00:00+00	\N	1	8	1	\N	0
7	KIRA		MOFFAT		2017-10-23 00:00:00+00	\N	1	9	1	\N	0
8	RAYMOND		PICHETTE		2014-12-02 00:00:00+00	\N	1	10	1	\N	0
9	JENNIFER		AIKMAN		2019-02-21 00:00:00+00	\N	2	13	2	\N	0
10	SHARON		BROUGH		2019-02-21 00:00:00+00	\N	2	14	2	\N	0
11	DEBRA		DOUGLAS		2018-12-03 00:00:00+00	\N	2	15	2	\N	0
12	BARB		DOYLE		2019-02-21 00:00:00+00	\N	2	16	2	\N	0
13	ROSS		FOWLIE		2018-12-03 00:00:00+00	\N	2	17	2	\N	0
14	ALLISON		LESLIE		2019-02-21 00:00:00+00	\N	2	18	2	\N	0
15	CONNIE		MCCONNELL		2019-02-21 00:00:00+00	\N	2	19	2	\N	0
16	JANET		SEE		2016-10-12 00:00:00+00	\N	3	22	3	\N	0
17	LARRY		WOLFE		2018-10-23 00:00:00+00	\N	3	23	3	\N	0
18	BRENT W.		WOODS		2014-05-09 00:00:00+00	\N	3	24	3	\N	0
19	KEVAN		ARNELD		2017-11-14 00:00:00+00	\N	3	25	3	\N	0
20	MARIAH		BURTON		2018-10-23 00:00:00+00	\N	3	26	3	\N	0
21	KATHY		HOWLAND		2018-10-23 00:00:00+00	\N	3	27	3	\N	0
22	LORNA		LYONS		2016-10-12 00:00:00+00	\N	3	28	3	\N	0
23	KIRAN		BAGHA		2019-03-14 00:00:00+00	\N	3	29	3	\N	0
24	MARY		ATKINSON		2016-09-09 00:00:00+00	\N	4	32	4	\N	0
25	DAN		BUNNETT		2011-11-02 00:00:00+00	\N	4	33	4	\N	0
26	GERRY		EDWARDS		2017-08-02 00:00:00+00	\N	4	34	4	\N	0
27	CHARLOTTE		MEEKER		2012-12-10 00:00:00+00	\N	4	35	4	\N	0
28	DENNIS		MONDS		2011-11-02 00:00:00+00	\N	4	36	4	\N	0
29	BOB		PRIZEMAN		2013-09-20 00:00:00+00	\N	4	37	4	\N	0
30	LISA		VON BENZON		2016-09-09 00:00:00+00	\N	4	38	4	\N	0
31	LARRY		WIENS		2010-08-17 00:00:00+00	\N	4	39	4	\N	0
32	LES		WILLEY		2018-10-22 00:00:00+00	\N	4	40	4	\N	0
33	MAGGIE		JONES		2017-10-12 00:00:00+00	\N	5	43	5	\N	0
34	MAUREEN N.		KELSEY		2016-10-26 00:00:00+00	\N	5	44	5	\N	0
35	JOHN E.		KINGSMILL		2016-10-26 00:00:00+00	\N	5	45	5	\N	0
36	INA		POCKRASS		2017-10-12 00:00:00+00	\N	5	46	5	\N	0
37	ABRA		BRYNNE		2015-11-17 00:00:00+00	\N	5	47	5	\N	0
38	ALEXANDRA		FORSYTHE		2017-10-12 00:00:00+00	\N	5	48	5	\N	0
39	SHANNON		HAMMOND		2017-10-12 00:00:00+00	\N	5	49	5	\N	0
40	SARAH		CONNOLLY		2019-04-11 00:00:00+00	\N	5	50	5	\N	0
41	LAUREN		ELDRIDGE		2017-05-30 00:00:00+00	\N	6	53	6	\N	0
42	DIANA		JEFFRIES		2018-12-11 00:00:00+00	\N	6	54	6	\N	0
43	SIMON		KAULBACK		2018-12-11 00:00:00+00	\N	6	55	6	\N	0
44	JAMES		MAXWELL		2018-12-11 00:00:00+00	\N	6	56	6	\N	0
45	GARNET		MCPHEE		2018-12-11 00:00:00+00	\N	6	57	6	\N	0
46	PHIL		MONDOR		2018-12-11 00:00:00+00	\N	6	58	6	\N	0
47	MICHELLE		PERUGINI		2018-12-11 00:00:00+00	\N	6	59	6	\N	0
48	DAVID		PLEWES		2018-12-11 00:00:00+00	\N	6	60	6	\N	0
49	MARTHA		BLACK		2013-12-17 00:00:00+00	\N	7	63	7	\N	0
50	KEN		CAMPBELL		2016-10-18 00:00:00+00	\N	7	64	7	\N	0
51	DENNIS		ETHERIDGE		2015-10-23 00:00:00+00	\N	7	65	7	\N	0
52	RICHARD		HYATT		2012-11-23 00:00:00+00	\N	7	66	7	\N	0
53	LESLIE		PHELPS		2016-10-18 00:00:00+00	\N	7	67	7	\N	0
54	RUDY		PRIES		2016-10-18 00:00:00+00	\N	7	68	7	\N	0
55	CRYSTAL		ROBINSON		2018-10-22 00:00:00+00	\N	7	69	7	\N	0
56	DOROTHY		TURNBULL		2007-10-18 00:00:00+00	\N	7	70	7	\N	0
57	ROSEANNE		WADE		2012-11-23 00:00:00+00	\N	7	71	7	\N	0
58	SUSAN		FERNANDEZ		2018-10-05 00:00:00+00	\N	8	74	8	\N	0
59	CHRISTOPHER		KOPAR		2017-10-12 00:00:00+00	\N	8	75	8	\N	0
60	RACHEL		LINDQUIST		2018-10-05 00:00:00+00	\N	8	76	8	\N	0
61	YAKOV		PRIVES		2017-06-14 00:00:00+00	\N	8	77	8	\N	0
62	RUTH		VODDEN		2017-10-12 00:00:00+00	\N	8	78	8	\N	0
63	MARK		VOLKMANN		2019-06-06 00:00:00+00	\N	8	79	8	\N	0
64	NATALIA		GRENKOVA		2019-06-06 00:00:00+00	\N	8	80	8	\N	0
65	DIERDRE		BRADSHAW		2017-10-23 00:00:00+00	\N	9	83	9	\N	0
66	JEN		CANDELA		2017-10-23 00:00:00+00	\N	9	84	9	\N	0
67	DIANA		KOLLAR		2018-11-02 00:00:00+00	\N	9	85	9	\N	0
68	YVES		MA		2017-10-23 00:00:00+00	\N	9	86	9	\N	0
69	DANIEL		MCLEOD		2018-11-02 00:00:00+00	\N	9	87	9	\N	0
70	JEFFREY		SHOUB		2017-05-04 00:00:00+00	\N	9	88	9	\N	0
71	SABETTE		THOMPSON		2017-10-23 00:00:00+00	\N	9	89	9	\N	0
72	AGNIESZKA		WEGLEWSKA		2017-10-23 00:00:00+00	\N	9	90	9	\N	0
73	ANTHONY		ALLEN		2018-11-02 00:00:00+00	\N	10	93	10	\N	0
74	EAMMON		BOURKE		2017-11-29 00:00:00+00	\N	10	94	10	\N	0
75	LESLIE		FRASER		2018-11-02 00:00:00+00	\N	10	95	10	\N	0
76	LORI		JONES		2017-11-29 00:00:00+00	\N	10	96	10	\N	0
77	INGA		SKODA		2018-11-02 00:00:00+00	\N	10	97	10	\N	0
78	ANDRES		VEGA		2018-11-02 00:00:00+00	\N	10	98	10	\N	0
79	JOHN		MACKINTOSH		2017-11-29 00:00:00+00	\N	10	99	10	\N	0
80	PETER		ROHDE		2018-11-02 00:00:00+00	\N	10	100	10	\N	0
81	RIA		SIREGAR-LOOSEMOORE		2018-11-02 00:00:00+00	\N	10	101	10	\N	0
82	JODIE		PAUL		2017-10-31 00:00:00+00	\N	11	104	11	\N	0
83	DAVID		STEWART		2017-10-31 00:00:00+00	\N	11	105	11	\N	0
84	THERESA		WHITE		2018-11-02 00:00:00+00	\N	11	106	11	\N	0
85	COLLIN		BUDD		2017-06-19 00:00:00+00	\N	11	107	11	\N	0
86	CASSANDRA		BURKHOLDER		2018-11-02 00:00:00+00	\N	11	108	11	\N	0
87	AARON		MCNEILL		2017-10-31 00:00:00+00	\N	11	109	11	\N	0
88	JASON		BAKKER		2018-10-22 00:00:00+00	\N	12	112	12	\N	0
89	LORETTA		HRYNYK		2018-10-22 00:00:00+00	\N	12	113	12	\N	0
90	MIKE		LEWIS		2018-10-03 00:00:00+00	\N	12	114	12	\N	0
91	ELAINE		PAISLEY		2018-10-03 00:00:00+00	\N	12	115	12	\N	0
92	GEORGIA		SPILIOTOPOULOS		2018-10-22 00:00:00+00	\N	12	116	12	\N	0
93	VALERIE		UNRUH		2018-10-03 00:00:00+00	\N	12	117	12	\N	0
94	AMANDA		WATKINS		2018-10-22 00:00:00+00	\N	12	118	12	\N	0
95	VALERIE		WILLANS		2018-10-03 00:00:00+00	\N	12	119	12	\N	0
96	NICKY		CAIRNCROSS		2018-11-08 00:00:00+00	\N	13	122	13	\N	0
97	HELEN		JONES		2018-11-08 00:00:00+00	\N	13	123	13	\N	0
98	SUSAN		LARKIN		2018-11-08 00:00:00+00	\N	13	124	13	\N	0
99	CHARISSE		LYNCH-WELCH		2016-11-08 00:00:00+00	\N	13	125	13	\N	0
100	SUSAN P.		NATION		2017-10-31 00:00:00+00	\N	13	126	13	\N	0
101	DEBBIE		LAY		2018-12-20 00:00:00+00	\N	14	129	14	\N	0
102	AARON		LONG		2018-12-20 00:00:00+00	\N	14	130	14	\N	0
103	SAMANTHA		SMITH		2018-12-20 00:00:00+00	\N	14	131	14	\N	0
104	BOYD		VICKERSON		2017-07-05 00:00:00+00	\N	14	132	14	\N	0
105	NATHAN		VOS		2018-12-20 00:00:00+00	\N	14	133	14	\N	0
106	SHILOH		BOUVETTE		2019-02-13 00:00:00+00	\N	15	136	15	\N	0
107	DAN		BUDGELL		2019-02-13 00:00:00+00	\N	15	137	15	\N	0
108	MICHAEL		LEYNE		2017-11-09 00:00:00+00	\N	15	138	15	\N	0
109	SALLY		RUDOLF		2018-08-01 00:00:00+00	\N	15	139	15	\N	0
110	LORI		SEAY		2017-11-09 00:00:00+00	\N	15	140	15	\N	0
111	JULIE		TYE		2019-02-13 00:00:00+00	\N	15	141	15	\N	0
112	AINE		YOUNG		2018-08-01 00:00:00+00	\N	15	142	15	\N	0
113	MICHAEL		ROHALLY		2019-07-23 00:00:00+00	\N	15	143	15	\N	0
114	ROBERT		TODOSICHUK		2019-01-17 00:00:00+00	\N	16	146	16	\N	0
115	BETTINA		COTSONI		2019-01-17 00:00:00+00	\N	16	147	16	\N	0
116	ILONA		FIZEL		2018-06-27 00:00:00+00	\N	16	148	16	\N	0
117	JAMIE		MCINTYRE		2016-08-24 00:00:00+00	\N	16	149	16	\N	0
118	LISA		OJAROODI		2018-06-27 00:00:00+00	\N	16	150	16	\N	0
119	NICOLE		OWEN		2018-06-27 00:00:00+00	\N	16	151	16	\N	0
120	SHANE		SCHOONEN		2019-01-17 00:00:00+00	\N	16	152	16	\N	0
121	COLLEN		BUCHANAN		2017-08-17 00:00:00+00	\N	17	155	17	\N	0
122	LINDA		NEPHIN		2017-08-17 00:00:00+00	\N	17	156	17	\N	0
123	NIKI		PERRIN		2017-08-17 00:00:00+00	\N	17	157	17	\N	0
124	DORIS		RAIWET		2017-08-17 00:00:00+00	\N	17	158	17	\N	0
125	LENOX		REID		2018-11-07 00:00:00+00	\N	17	159	17	\N	0
126	ORAL		WYNTER		2018-11-07 00:00:00+00	\N	17	160	17	\N	0
127	SHEILA		BROWN		2018-10-05 00:00:00+00	\N	18	163	18	\N	0
128	JODI		BURGESS		2015-01-06 00:00:00+00	\N	18	164	18	\N	0
129	DAVID		CARDWELL		2013-12-17 00:00:00+00	\N	18	165	18	\N	0
130	DEBBIE		COLLRIN		2018-10-05 00:00:00+00	\N	18	166	18	\N	0
131	MERILYN		KAISER		2015-01-06 00:00:00+00	\N	18	167	18	\N	0
132	ROSEMARIE		MAXIM		2018-10-05 00:00:00+00	\N	18	168	18	\N	0
133	JANET		TAYLOR		2012-12-27 00:00:00+00	\N	18	169	18	\N	0
134	INA		BOTHMA		2018-08-29 00:00:00+00	\N	19	172	19	\N	0
135	WENDY		HAMPTON		2017-10-23 00:00:00+00	\N	19	173	19	\N	0
136	ANN		MOORE		2017-10-23 00:00:00+00	\N	19	174	19	\N	0
137	E. MARY		SURTEL		2018-08-29 00:00:00+00	\N	19	175	19	\N	0
138	LAWRENCE		BOXALL		2016-09-29 00:00:00+00	\N	20	178	20	\N	0
139	JODY-ANN		EDMAN		2018-10-02 00:00:00+00	\N	20	179	20	\N	0
140	SANDRA		GREENE		2016-09-29 00:00:00+00	\N	20	180	20	\N	0
141	ADAM		MCLEOD		2018-10-02 00:00:00+00	\N	20	181	20	\N	0
142	MARINA		PRINCZ		2018-10-02 00:00:00+00	\N	20	182	20	\N	0
143	BRADUT		DIMA		2016-11-03 00:00:00+00	\N	21	185	21	\N	0
144	NANCY		FRENCH		2017-11-29 00:00:00+00	\N	21	186	21	\N	0
145	GAIL		JOHNSON		2018-10-02 00:00:00+00	\N	21	187	21	\N	0
146	ANDREW		MCCRACKEN		2018-10-02 00:00:00+00	\N	21	188	21	\N	0
147	ESTEBAN		MUGICA-JIMENO		2017-11-29 00:00:00+00	\N	21	189	21	\N	0
148	SHANE		TAYLOR		2018-10-02 00:00:00+00	\N	21	190	21	\N	0
149	KALEN		MORROW		2015-10-14 00:00:00+00	\N	22	193	22	\N	0
150	AMANDA		SANDBERG		2018-10-18 00:00:00+00	\N	22	194	22	\N	0
151	MELINDA		WARREN		2018-10-18 00:00:00+00	\N	22	195	22	\N	0
152	SHAUNA		BARTER		2013-10-24 00:00:00+00	\N	22	196	22	\N	0
153	SEAN		DALEY		2017-11-20 00:00:00+00	\N	22	197	22	\N	0
154	DEBORAH		MCDONALD		2017-11-20 00:00:00+00	\N	22	198	22	\N	0
155	PETER		MOONAN		2018-10-18 00:00:00+00	\N	22	199	22	\N	0
156	SARAH		COWEN		2018-10-19 00:00:00+00	\N	23	202	23	\N	0
157	CAINE		MILLS		2018-10-25 00:00:00+00	\N	23	203	23	\N	0
158	MARY		MORGAN-PICK		2018-10-19 00:00:00+00	\N	23	204	23	\N	0
159	SARA		QUIST		2018-10-25 00:00:00+00	\N	23	205	23	\N	0
160	RYAN		REDDING		2018-10-19 00:00:00+00	\N	23	206	23	\N	0
161	PHILLIP		ALMENDRALA		2018-10-02 00:00:00+00	\N	24	209	24	\N	0
162	OLEG		ANDREICHIKOV		2016-10-06 00:00:00+00	\N	24	210	24	\N	0
163	MARIA		BROCAL		2018-10-02 00:00:00+00	\N	24	211	24	\N	0
164	MICHELE		CLOETE		2009-10-23 00:00:00+00	\N	24	212	24	\N	0
165	NORAH		JOHNSTON		2009-10-23 00:00:00+00	\N	24	213	24	\N	0
166	NAZ		KARIM		2015-11-06 00:00:00+00	\N	24	214	24	\N	0
167	VANCE		LUCENTE		2017-10-16 00:00:00+00	\N	24	215	24	\N	0
168	MONICA		NUCA		2017-10-16 00:00:00+00	\N	24	216	24	\N	0
169	SEAN		MACKENROT		2013-11-05 00:00:00+00	\N	25	219	25	\N	0
170	TALIB		RAY		2017-10-11 00:00:00+00	\N	25	220	25	\N	0
171	SHAUN		D'SOUZA		2017-11-22 00:00:00+00	\N	25	221	25	\N	0
172	TODD		ROMER		2017-10-11 00:00:00+00	\N	25	222	25	\N	0
173	DRAGANA		VASIC		2017-10-11 00:00:00+00	\N	25	223	25	\N	0
174	EMILY		BLAND		2018-09-12 00:00:00+00	\N	26	226	26	\N	0
175	LYN		CUSTAN		2017-09-26 00:00:00+00	\N	26	227	26	\N	0
176	VANESSA		JESELON		2017-09-26 00:00:00+00	\N	26	228	26	\N	0
177	BERNARD		WILSON		2017-09-26 00:00:00+00	\N	26	229	26	\N	0
178	MAURICE		COGSWELL		2004-09-23 00:00:00+00	\N	27	232	27	\N	0
179	WILLIAM		COGSWELL		2004-09-23 00:00:00+00	\N	27	233	27	\N	0
180	JOHN		DOUGLAS		2015-03-05 00:00:00+00	\N	27	234	27	\N	0
181	LANCE		HILLBRECHT		2004-09-23 00:00:00+00	\N	27	235	27	\N	0
182	DANIEL		MALONEY		2015-03-05 00:00:00+00	\N	27	236	27	\N	0
183	STEPHAN		CLARKE		2017-07-21 00:00:00+00	\N	28	239	28	\N	0
184	CRISI		CORBI		2018-10-22 00:00:00+00	\N	28	240	28	\N	0
185	KEVIN		GOOCH		2018-10-22 00:00:00+00	\N	28	241	28	\N	0
186	LAWRENCE		GORDON		2018-10-22 00:00:00+00	\N	28	242	28	\N	0
187	PREMILA		NANDAN		2017-07-21 00:00:00+00	\N	28	243	28	\N	0
188	PAT		SHUCHUK		2011-03-10 00:00:00+00	\N	28	244	28	\N	0
189	CLARA		UGARELLI		2012-12-10 00:00:00+00	\N	28	245	28	\N	0
190	SHERI		BERGMAN		2017-10-30 00:00:00+00	\N	29	248	29	\N	0
191	JANIE		CAWLEY		2016-10-26 00:00:00+00	\N	29	249	29	\N	0
192	TRACY		KOLWICH		2016-10-26 00:00:00+00	\N	29	250	29	\N	0
193	BOZENA		ZDANIUK		2018-10-12 00:00:00+00	\N	29	251	29	\N	0
194	JOHN		MERCIER		2016-09-16 00:00:00+00	\N	30	254	30	\N	0
195	OLGA		PLEKHANOVA		2016-11-23 00:00:00+00	\N	30	255	30	\N	0
196	OXANA		REYMERS		2017-12-11 00:00:00+00	\N	30	256	30	\N	0
197	RAY		TAYLOR		2016-09-16 00:00:00+00	\N	30	257	30	\N	0
198	ZARRINA		VOINOVA		2017-12-11 00:00:00+00	\N	30	258	30	\N	0
199	TOMASZ		ZEMOJTEL		2016-11-23 00:00:00+00	\N	30	259	30	\N	0
200	ANNEMARIE		CLOWERS		2015-11-20 00:00:00+00	\N	31	262	31	\N	0
201	JACLYN		CRUZ		2015-11-20 00:00:00+00	\N	31	263	31	\N	0
202	PATRICIA		DOCHERTY		2015-03-30 00:00:00+00	\N	31	264	31	\N	0
203	SHARON		HILDEBRANDT		2014-02-26 00:00:00+00	\N	31	265	31	\N	0
204	ANGELA		OMELCENCO		2016-10-27 00:00:00+00	\N	31	266	31	\N	0
205	JANE		ROBERTS		2015-03-20 00:00:00+00	\N	31	267	31	\N	0
206	ALICE		YEUNG		2016-10-27 00:00:00+00	\N	31	268	31	\N	0
207	ANNETTE		ANDERSON		2018-10-30 00:00:00+00	\N	32	271	32	\N	0
208	AFROZA		AWAL		2017-10-31 00:00:00+00	\N	32	272	32	\N	0
209	TROY		HAMILTON		2017-10-31 00:00:00+00	\N	32	273	32	\N	0
210	LAKSHMI		MCCALL		2018-10-30 00:00:00+00	\N	32	274	32	\N	0
211	MARIAN		MICHALSKI		2018-10-30 00:00:00+00	\N	32	275	32	\N	0
212	KAI		SJOHOLM		2018-10-30 00:00:00+00	\N	32	276	32	\N	0
213	BRIAN		MACDONALD		2018-12-03 00:00:00+00	\N	33	279	33	\N	0
214	CORRINE		PRESCOTT		2018-12-03 00:00:00+00	\N	33	280	33	\N	0
215	GETASEW		WOLDEMARIAM		2018-12-03 00:00:00+00	\N	33	281	33	\N	0
216	ZENNA		ZARELLI		2018-12-03 00:00:00+00	\N	33	282	33	\N	0
217	CARRIE		LEBLANC		2018-12-03 00:00:00+00	\N	33	283	33	\N	0
218	BEATRIZ		GONZALEZ-BARRIOS		2017-10-11 00:00:00+00	\N	34	286	34	\N	0
219	PABLO		PASCUALE		2018-12-06 00:00:00+00	\N	34	287	34	\N	0
220	TATIANA		SITAR		2018-12-06 00:00:00+00	\N	34	288	34	\N	0
221	ANNA		SMIRNOFF		2018-12-06 00:00:00+00	\N	34	289	34	\N	0
222	ANNA		TIMOFEEVA		2018-12-06 00:00:00+00	\N	34	290	34	\N	0
223	OLGA		VAFINA		2018-12-06 00:00:00+00	\N	34	291	34	\N	0
224	RICHARD		ALLEN		2018-12-20 00:00:00+00	\N	35	294	35	\N	0
225	SUSY		ASTETE		2016-07-18 00:00:00+00	\N	35	295	35	\N	0
226	HEATHER		BLISS		2017-10-23 00:00:00+00	\N	35	296	35	\N	0
227	HELMUT		DAIMINGER		2017-10-02 00:00:00+00	\N	35	297	35	\N	0
228	TAJ		IRWIN		2018-12-20 00:00:00+00	\N	35	298	35	\N	0
229	CARMELLE		LAMB		2018-12-20 00:00:00+00	\N	35	299	35	\N	0
230	CHRISTINE		MCWILLIAMS		2018-12-20 00:00:00+00	\N	35	300	35	\N	0
231	KIMBERLEY		O'MALLEY		2017-10-23 00:00:00+00	\N	35	301	35	\N	0
232	OLIVIA		VERBIAN		2016-10-18 00:00:00+00	\N	35	302	35	\N	0
233	SANDRA		GREENAWAY		2014-11-17 00:00:00+00	\N	36	305	36	\N	0
234	FREDERICK		KENNEDY		2017-10-11 00:00:00+00	\N	36	306	36	\N	0
235	JOYCE		LEROUX		2018-10-10 00:00:00+00	\N	36	307	36	\N	0
236	VERONICA		SCOTT		2018-10-10 00:00:00+00	\N	36	308	36	\N	0
237	KATHRYN		DANIEL		2015-10-22 00:00:00+00	\N	36	309	36	\N	0
238	KEITH		BRYSON		2018-09-19 00:00:00+00	\N	37	312	37	\N	0
239	NANCY		LACHAPELLE		2018-09-19 00:00:00+00	\N	37	313	37	\N	0
240	NANCY		PAYNE		2014-11-17 00:00:00+00	\N	37	314	37	\N	0
241	JESSE		THOMAS		2018-09-19 00:00:00+00	\N	37	315	37	\N	0
242	JOHN		WELLS		2008-01-09 00:00:00+00	\N	37	316	37	\N	0
243	MARIE		FILIATRAULT		2014-11-17 00:00:00+00	\N	37	317	37	\N	0
244	DEBORAH		DESILETS		2016-10-26 00:00:00+00	\N	38	320	38	\N	0
245	ROBYN S.		HIGGINS		2017-10-18 00:00:00+00	\N	38	321	38	\N	0
246	NATASHA		MCAVOY		2018-10-31 00:00:00+00	\N	38	322	38	\N	0
247	STEFAAN		SYNNESAEL		2018-10-31 00:00:00+00	\N	38	323	38	\N	0
248	JULIA R.		WALKER		2017-06-19 00:00:00+00	\N	38	324	38	\N	0
249	PHYLLIS A.		NASH		2010-12-24 00:00:00+00	\N	39	327	39	\N	0
250	MARGARET		NICKLE		2017-10-25 00:00:00+00	\N	39	328	39	\N	0
251	JOCELYN		STUART		2018-12-13 00:00:00+00	\N	39	329	39	\N	0
252	CAROLE		SUMMER		2017-10-25 00:00:00+00	\N	39	330	39	\N	0
253	JIM		FISHER		2018-12-13 00:00:00+00	\N	39	331	39	\N	0
254	LENA		HORSWILL		2017-10-25 00:00:00+00	\N	39	332	39	\N	0
255	CATHY		LEUGNER		2018-12-13 00:00:00+00	\N	39	333	39	\N	0
256	RON		LIDDLE		2017-10-25 00:00:00+00	\N	39	334	39	\N	0
257	ZARGHOONA		ABDUL WAKIL		2016-09-09 00:00:00+00	\N	40	337	40	\N	0
258	ZARIF		AKBARIAN		2017-09-21 00:00:00+00	\N	40	338	40	\N	0
259	EDITH M		CULLER MATA		2015-09-16 00:00:00+00	\N	40	339	40	\N	0
260	PARTRICIA		DABIRI		2017-09-21 00:00:00+00	\N	40	340	40	\N	0
261	RASHMI		RAHEJA		2017-09-21 00:00:00+00	\N	40	341	40	\N	0
262	CHAYA		RANSEN		2016-09-09 00:00:00+00	\N	40	342	40	\N	0
263	MIGUEL		TRUJILLO		2015-09-16 00:00:00+00	\N	40	343	40	\N	0
264	MEAGAN J.		GROSSMAN		2017-10-16 00:00:00+00	\N	41	346	41	\N	0
265	SARAH A.		ZIMMERMAN		2017-10-16 00:00:00+00	\N	41	347	41	\N	0
266	PETER S.		HARLING		2017-10-16 00:00:00+00	\N	41	348	41	\N	0
267	KATARZYNA M.		KISTOWSKA		2016-11-23 00:00:00+00	\N	41	349	41	\N	0
268	STEPHEN		SALEM		2017-10-16 00:00:00+00	\N	41	350	41	\N	0
269	JAMES D		SEIB		2016-11-23 00:00:00+00	\N	41	351	41	\N	0
270	DAVID		GORDON		2019-05-15 00:00:00+00	\N	41	352	41	\N	0
271	EVAN		VAN DYK		2019-05-15 00:00:00+00	\N	41	353	41	\N	0
274	CHRISTOPHER		BROWN		2015-01-07 00:00:00+00	\N	43	363	43	\N	0
275	ISABELLE J		MORRIS		2013-03-26 00:00:00+00	\N	43	364	43	\N	0
276	CRAIG H		EVANS		2013-03-26 00:00:00+00	\N	43	365	43	\N	0
277	JENNIFER J		CODY		2015-01-07 00:00:00+00	\N	43	366	43	\N	0
278	LINDSAY		BEAL		2016-09-07 00:00:00+00	\N	44	369	44	\N	0
279	CATHY		GILBERT		2016-09-07 00:00:00+00	\N	44	370	44	\N	0
280	NOLA		LANDUCCI		2018-10-15 00:00:00+00	\N	44	371	44	\N	0
281	DONNA		SASSAMAN		2018-10-15 00:00:00+00	\N	44	372	44	\N	0
282	JOHN W.		SCULL		2014-05-27 00:00:00+00	\N	44	373	44	\N	0
283	KIM		CITTON		2014-05-27 00:00:00+00	\N	44	374	44	\N	0
284	ALYCIA		WEIR		2018-12-03 00:00:00+00	\N	45	377	45	\N	0
285	HELENA A.M.		OOSTHOEK		2016-04-25 00:00:00+00	\N	45	378	45	\N	0
286	CONNIE E.		BARLOW		2016-04-25 00:00:00+00	\N	45	379	45	\N	0
287	JILL		HOLLAND		2018-12-03 00:00:00+00	\N	45	380	45	\N	0
288	NADINE		PODMOROFF		2016-06-28 00:00:00+00	\N	46	383	46	\N	0
289	SEAN		HOODICOFF		2019-01-10 00:00:00+00	\N	46	384	46	\N	0
290	LORI		HANSON		2019-01-10 00:00:00+00	\N	46	385	46	\N	0
291	VANESSA		BENWOOD		2017-10-16 00:00:00+00	\N	46	386	46	\N	0
292	LYNN		TURNER		2018-06-13 00:00:00+00	\N	47	389	47	\N	0
293	BARB		STEVENSON		2018-06-13 00:00:00+00	\N	47	390	47	\N	0
294	DOROTHY		PATTERSON		2018-06-13 00:00:00+00	\N	47	391	47	\N	0
295	PAT		KERMEEN		2018-06-13 00:00:00+00	\N	47	392	47	\N	0
296	WES		HEWITT		2018-06-13 00:00:00+00	\N	47	393	47	\N	0
297	CATHY		GISLASON		2018-06-13 00:00:00+00	\N	47	394	47	\N	0
298	JOHN		DOUGLAS		2018-06-13 00:00:00+00	\N	47	395	47	\N	0
299	TERRY		DEAKIN		2019-05-03 00:00:00+00	\N	47	396	47	\N	0
300	ELLEN		LACHARITY		2019-05-03 00:00:00+00	\N	47	397	47	\N	0
301	LARRY		CONN		2018-06-06 00:00:00+00	\N	48	400	48	\N	0
302	JAY		HAMBURGER		2018-06-06 00:00:00+00	\N	48	401	48	\N	0
303	LUKAS		HYRMAN		2018-06-06 00:00:00+00	\N	48	402	48	\N	0
304	ROLF		MAURER		2018-06-06 00:00:00+00	\N	48	403	48	\N	0
305	COLLEEN		SMITH		2018-06-06 00:00:00+00	\N	48	404	48	\N	0
306	MICHAEL		YOUNG		2018-06-06 00:00:00+00	\N	48	405	48	\N	0
307	GORDON		DYCKE		2013-09-20 00:00:00+00	\N	49	408	49	\N	0
308	CHARLES		EAMER		2016-09-28 00:00:00+00	\N	49	409	49	\N	0
309	MIKE		HECKL		2016-09-28 00:00:00+00	\N	49	410	49	\N	0
310	GORDON J.		STENGEL		2013-03-27 00:00:00+00	\N	49	411	49	\N	0
311	KENNETH		WRIGHT		2018-10-22 00:00:00+00	\N	49	412	49	\N	0
312	KIRK		DUFF		2016-10-07 00:00:00+00	\N	50	415	50	\N	0
313	ADRIAN		JELLY		2016-10-07 00:00:00+00	\N	50	416	50	\N	0
314	ROBERT		JOLLY		2018-12-12 00:00:00+00	\N	50	417	50	\N	0
315	FRANK		KACSINKO		2017-10-23 00:00:00+00	\N	50	418	50	\N	0
316	RAE		MACKLON		2014-12-02 00:00:00+00	\N	50	419	50	\N	0
317	JOSEPH		MAKORTOFF		2017-10-23 00:00:00+00	\N	50	420	50	\N	0
318	KIRA		MOFFAT		2017-10-23 00:00:00+00	\N	50	421	50	\N	0
319	RAYMOND		PICHETTE		2014-12-02 00:00:00+00	\N	50	422	50	\N	0
320	JENNIFER		AIKMAN		2019-02-21 00:00:00+00	\N	51	425	51	\N	0
321	SHARON		BROUGH		2019-02-21 00:00:00+00	\N	51	426	51	\N	0
322	DEBRA		DOUGLAS		2018-12-03 00:00:00+00	\N	51	427	51	\N	0
323	BARB		DOYLE		2019-02-21 00:00:00+00	\N	51	428	51	\N	0
324	ROSS		FOWLIE		2018-12-03 00:00:00+00	\N	51	429	51	\N	0
325	ALLISON		LESLIE		2019-02-21 00:00:00+00	\N	51	430	51	\N	0
326	CONNIE		MCCONNELL		2019-02-21 00:00:00+00	\N	51	431	51	\N	0
327	JANET		SEE		2016-10-12 00:00:00+00	\N	52	434	52	\N	0
328	LARRY		WOLFE		2018-10-23 00:00:00+00	\N	52	435	52	\N	0
329	BRENT W.		WOODS		2014-05-09 00:00:00+00	\N	52	436	52	\N	0
330	KEVAN		ARNELD		2017-11-14 00:00:00+00	\N	52	437	52	\N	0
331	MARIAH		BURTON		2018-10-23 00:00:00+00	\N	52	438	52	\N	0
332	KATHY		HOWLAND		2018-10-23 00:00:00+00	\N	52	439	52	\N	0
333	LORNA		LYONS		2016-10-12 00:00:00+00	\N	52	440	52	\N	0
334	KIRAN		BAGHA		2019-03-14 00:00:00+00	\N	52	441	52	\N	0
335	MARY		ATKINSON		2016-09-09 00:00:00+00	\N	53	444	53	\N	0
336	DAN		BUNNETT		2011-11-02 00:00:00+00	\N	53	445	53	\N	0
337	GERRY		EDWARDS		2017-08-02 00:00:00+00	\N	53	446	53	\N	0
338	CHARLOTTE		MEEKER		2012-12-10 00:00:00+00	\N	53	447	53	\N	0
339	DENNIS		MONDS		2011-11-02 00:00:00+00	\N	53	448	53	\N	0
340	BOB		PRIZEMAN		2013-09-20 00:00:00+00	\N	53	449	53	\N	0
341	LISA		VON BENZON		2016-09-09 00:00:00+00	\N	53	450	53	\N	0
342	LARRY		WIENS		2010-08-17 00:00:00+00	\N	53	451	53	\N	0
343	LES		WILLEY		2018-10-22 00:00:00+00	\N	53	452	53	\N	0
344	MAGGIE		JONES		2017-10-12 00:00:00+00	\N	54	455	54	\N	0
345	MAUREEN N.		KELSEY		2016-10-26 00:00:00+00	\N	54	456	54	\N	0
346	JOHN E.		KINGSMILL		2016-10-26 00:00:00+00	\N	54	457	54	\N	0
347	INA		POCKRASS		2017-10-12 00:00:00+00	\N	54	458	54	\N	0
348	ABRA		BRYNNE		2015-11-17 00:00:00+00	\N	54	459	54	\N	0
349	ALEXANDRA		FORSYTHE		2017-10-12 00:00:00+00	\N	54	460	54	\N	0
350	SHANNON		HAMMOND		2017-10-12 00:00:00+00	\N	54	461	54	\N	0
351	SARAH		CONNOLLY		2019-04-11 00:00:00+00	\N	54	462	54	\N	0
352	LAUREN		ELDRIDGE		2017-05-30 00:00:00+00	\N	55	465	55	\N	0
353	DIANA		JEFFRIES		2018-12-11 00:00:00+00	\N	55	466	55	\N	0
354	SIMON		KAULBACK		2018-12-11 00:00:00+00	\N	55	467	55	\N	0
355	JAMES		MAXWELL		2018-12-11 00:00:00+00	\N	55	468	55	\N	0
356	GARNET		MCPHEE		2018-12-11 00:00:00+00	\N	55	469	55	\N	0
357	PHIL		MONDOR		2018-12-11 00:00:00+00	\N	55	470	55	\N	0
358	MICHELLE		PERUGINI		2018-12-11 00:00:00+00	\N	55	471	55	\N	0
359	DAVID		PLEWES		2018-12-11 00:00:00+00	\N	55	472	55	\N	0
360	MARTHA		BLACK		2013-12-17 00:00:00+00	\N	56	475	56	\N	0
361	KEN		CAMPBELL		2016-10-18 00:00:00+00	\N	56	476	56	\N	0
362	DENNIS		ETHERIDGE		2015-10-23 00:00:00+00	\N	56	477	56	\N	0
363	RICHARD		HYATT		2012-11-23 00:00:00+00	\N	56	478	56	\N	0
364	LESLIE		PHELPS		2016-10-18 00:00:00+00	\N	56	479	56	\N	0
365	RUDY		PRIES		2016-10-18 00:00:00+00	\N	56	480	56	\N	0
366	CRYSTAL		ROBINSON		2018-10-22 00:00:00+00	\N	56	481	56	\N	0
367	DOROTHY		TURNBULL		2007-10-18 00:00:00+00	\N	56	482	56	\N	0
368	ROSEANNE		WADE		2012-11-23 00:00:00+00	\N	56	483	56	\N	0
369	SUSAN		FERNANDEZ		2018-10-05 00:00:00+00	\N	57	486	57	\N	0
370	CHRISTOPHER		KOPAR		2017-10-12 00:00:00+00	\N	57	487	57	\N	0
371	RACHEL		LINDQUIST		2018-10-05 00:00:00+00	\N	57	488	57	\N	0
372	YAKOV		PRIVES		2017-06-14 00:00:00+00	\N	57	489	57	\N	0
373	RUTH		VODDEN		2017-10-12 00:00:00+00	\N	57	490	57	\N	0
374	MARK		VOLKMANN		2019-06-06 00:00:00+00	\N	57	491	57	\N	0
375	NATALIA		GRENKOVA		2019-06-06 00:00:00+00	\N	57	492	57	\N	0
376	DIERDRE		BRADSHAW		2017-10-23 00:00:00+00	\N	58	495	58	\N	0
377	JEN		CANDELA		2017-10-23 00:00:00+00	\N	58	496	58	\N	0
378	DIANA		KOLLAR		2018-11-02 00:00:00+00	\N	58	497	58	\N	0
379	YVES		MA		2017-10-23 00:00:00+00	\N	58	498	58	\N	0
380	DANIEL		MCLEOD		2018-11-02 00:00:00+00	\N	58	499	58	\N	0
381	JEFFREY		SHOUB		2017-05-04 00:00:00+00	\N	58	500	58	\N	0
382	SABETTE		THOMPSON		2017-10-23 00:00:00+00	\N	58	501	58	\N	0
383	AGNIESZKA		WEGLEWSKA		2017-10-23 00:00:00+00	\N	58	502	58	\N	0
384	ANTHONY		ALLEN		2018-11-02 00:00:00+00	\N	59	505	59	\N	0
385	EAMMON		BOURKE		2017-11-29 00:00:00+00	\N	59	506	59	\N	0
386	LESLIE		FRASER		2018-11-02 00:00:00+00	\N	59	507	59	\N	0
387	LORI		JONES		2017-11-29 00:00:00+00	\N	59	508	59	\N	0
388	INGA		SKODA		2018-11-02 00:00:00+00	\N	59	509	59	\N	0
389	ANDRES		VEGA		2018-11-02 00:00:00+00	\N	59	510	59	\N	0
390	JOHN		MACKINTOSH		2017-11-29 00:00:00+00	\N	59	511	59	\N	0
391	PETER		ROHDE		2018-11-02 00:00:00+00	\N	59	512	59	\N	0
392	RIA		SIREGAR-LOOSEMOORE		2018-11-02 00:00:00+00	\N	59	513	59	\N	0
393	JODIE		PAUL		2017-10-31 00:00:00+00	\N	60	516	60	\N	0
394	DAVID		STEWART		2017-10-31 00:00:00+00	\N	60	517	60	\N	0
395	THERESA		WHITE		2018-11-02 00:00:00+00	\N	60	518	60	\N	0
396	COLLIN		BUDD		2017-06-19 00:00:00+00	\N	60	519	60	\N	0
397	CASSANDRA		BURKHOLDER		2018-11-02 00:00:00+00	\N	60	520	60	\N	0
398	AARON		MCNEILL		2017-10-31 00:00:00+00	\N	60	521	60	\N	0
399	JASON		BAKKER		2018-10-22 00:00:00+00	\N	61	524	61	\N	0
400	LORETTA		HRYNYK		2018-10-22 00:00:00+00	\N	61	525	61	\N	0
401	MIKE		LEWIS		2018-10-03 00:00:00+00	\N	61	526	61	\N	0
402	ELAINE		PAISLEY		2018-10-03 00:00:00+00	\N	61	527	61	\N	0
403	GEORGIA		SPILIOTOPOULOS		2018-10-22 00:00:00+00	\N	61	528	61	\N	0
404	VALERIE		UNRUH		2018-10-03 00:00:00+00	\N	61	529	61	\N	0
405	AMANDA		WATKINS		2018-10-22 00:00:00+00	\N	61	530	61	\N	0
406	VALERIE		WILLANS		2018-10-03 00:00:00+00	\N	61	531	61	\N	0
407	NICKY		CAIRNCROSS		2018-11-08 00:00:00+00	\N	62	534	62	\N	0
408	HELEN		JONES		2018-11-08 00:00:00+00	\N	62	535	62	\N	0
409	SUSAN		LARKIN		2018-11-08 00:00:00+00	\N	62	536	62	\N	0
410	CHARISSE		LYNCH-WELCH		2016-11-08 00:00:00+00	\N	62	537	62	\N	0
411	SUSAN P.		NATION		2017-10-31 00:00:00+00	\N	62	538	62	\N	0
412	DEBBIE		LAY		2018-12-20 00:00:00+00	\N	63	541	63	\N	0
413	AARON		LONG		2018-12-20 00:00:00+00	\N	63	542	63	\N	0
414	SAMANTHA		SMITH		2018-12-20 00:00:00+00	\N	63	543	63	\N	0
415	BOYD		VICKERSON		2017-07-05 00:00:00+00	\N	63	544	63	\N	0
416	NATHAN		VOS		2018-12-20 00:00:00+00	\N	63	545	63	\N	0
417	SHILOH		BOUVETTE		2019-02-13 00:00:00+00	\N	64	548	64	\N	0
418	DAN		BUDGELL		2019-02-13 00:00:00+00	\N	64	549	64	\N	0
419	MICHAEL		LEYNE		2017-11-09 00:00:00+00	\N	64	550	64	\N	0
420	SALLY		RUDOLF		2018-08-01 00:00:00+00	\N	64	551	64	\N	0
421	LORI		SEAY		2017-11-09 00:00:00+00	\N	64	552	64	\N	0
422	JULIE		TYE		2019-02-13 00:00:00+00	\N	64	553	64	\N	0
423	AINE		YOUNG		2018-08-01 00:00:00+00	\N	64	554	64	\N	0
424	MICHAEL		ROHALLY		2019-07-23 00:00:00+00	\N	64	555	64	\N	0
425	ROBERT		TODOSICHUK		2019-01-17 00:00:00+00	\N	65	558	65	\N	0
426	BETTINA		COTSONI		2019-01-17 00:00:00+00	\N	65	559	65	\N	0
427	ILONA		FIZEL		2018-06-27 00:00:00+00	\N	65	560	65	\N	0
428	JAMIE		MCINTYRE		2016-08-24 00:00:00+00	\N	65	561	65	\N	0
429	LISA		OJAROODI		2018-06-27 00:00:00+00	\N	65	562	65	\N	0
430	NICOLE		OWEN		2018-06-27 00:00:00+00	\N	65	563	65	\N	0
431	SHANE		SCHOONEN		2019-01-17 00:00:00+00	\N	65	564	65	\N	0
432	COLLEN		BUCHANAN		2017-08-17 00:00:00+00	\N	66	567	66	\N	0
433	LINDA		NEPHIN		2017-08-17 00:00:00+00	\N	66	568	66	\N	0
434	NIKI		PERRIN		2017-08-17 00:00:00+00	\N	66	569	66	\N	0
435	DORIS		RAIWET		2017-08-17 00:00:00+00	\N	66	570	66	\N	0
436	LENOX		REID		2018-11-07 00:00:00+00	\N	66	571	66	\N	0
437	ORAL		WYNTER		2018-11-07 00:00:00+00	\N	66	572	66	\N	0
438	SHEILA		BROWN		2018-10-05 00:00:00+00	\N	67	575	67	\N	0
439	JODI		BURGESS		2015-01-06 00:00:00+00	\N	67	576	67	\N	0
440	DAVID		CARDWELL		2013-12-17 00:00:00+00	\N	67	577	67	\N	0
441	DEBBIE		COLLRIN		2018-10-05 00:00:00+00	\N	67	578	67	\N	0
442	MERILYN		KAISER		2015-01-06 00:00:00+00	\N	67	579	67	\N	0
443	ROSEMARIE		MAXIM		2018-10-05 00:00:00+00	\N	67	580	67	\N	0
444	JANET		TAYLOR		2012-12-27 00:00:00+00	\N	67	581	67	\N	0
445	INA		BOTHMA		2018-08-29 00:00:00+00	\N	68	584	68	\N	0
446	WENDY		HAMPTON		2017-10-23 00:00:00+00	\N	68	585	68	\N	0
447	ANN		MOORE		2017-10-23 00:00:00+00	\N	68	586	68	\N	0
448	E. MARY		SURTEL		2018-08-29 00:00:00+00	\N	68	587	68	\N	0
449	LAWRENCE		BOXALL		2016-09-29 00:00:00+00	\N	69	590	69	\N	0
450	JODY-ANN		EDMAN		2018-10-02 00:00:00+00	\N	69	591	69	\N	0
451	SANDRA		GREENE		2016-09-29 00:00:00+00	\N	69	592	69	\N	0
452	ADAM		MCLEOD		2018-10-02 00:00:00+00	\N	69	593	69	\N	0
453	MARINA		PRINCZ		2018-10-02 00:00:00+00	\N	69	594	69	\N	0
454	BRADUT		DIMA		2016-11-03 00:00:00+00	\N	70	597	70	\N	0
455	NANCY		FRENCH		2017-11-29 00:00:00+00	\N	70	598	70	\N	0
456	GAIL		JOHNSON		2018-10-02 00:00:00+00	\N	70	599	70	\N	0
457	ANDREW		MCCRACKEN		2018-10-02 00:00:00+00	\N	70	600	70	\N	0
458	ESTEBAN		MUGICA-JIMENO		2017-11-29 00:00:00+00	\N	70	601	70	\N	0
459	SHANE		TAYLOR		2018-10-02 00:00:00+00	\N	70	602	70	\N	0
460	KALEN		MORROW		2015-10-14 00:00:00+00	\N	71	605	71	\N	0
461	AMANDA		SANDBERG		2018-10-18 00:00:00+00	\N	71	606	71	\N	0
462	MELINDA		WARREN		2018-10-18 00:00:00+00	\N	71	607	71	\N	0
463	SHAUNA		BARTER		2013-10-24 00:00:00+00	\N	71	608	71	\N	0
464	SEAN		DALEY		2017-11-20 00:00:00+00	\N	71	609	71	\N	0
465	DEBORAH		MCDONALD		2017-11-20 00:00:00+00	\N	71	610	71	\N	0
466	PETER		MOONAN		2018-10-18 00:00:00+00	\N	71	611	71	\N	0
467	SARAH		COWEN		2018-10-19 00:00:00+00	\N	72	614	72	\N	0
468	CAINE		MILLS		2018-10-25 00:00:00+00	\N	72	615	72	\N	0
469	MARY		MORGAN-PICK		2018-10-19 00:00:00+00	\N	72	616	72	\N	0
470	SARA		QUIST		2018-10-25 00:00:00+00	\N	72	617	72	\N	0
471	RYAN		REDDING		2018-10-19 00:00:00+00	\N	72	618	72	\N	0
472	PHILLIP		ALMENDRALA		2018-10-02 00:00:00+00	\N	73	621	73	\N	0
473	OLEG		ANDREICHIKOV		2016-10-06 00:00:00+00	\N	73	622	73	\N	0
474	MARIA		BROCAL		2018-10-02 00:00:00+00	\N	73	623	73	\N	0
475	MICHELE		CLOETE		2009-10-23 00:00:00+00	\N	73	624	73	\N	0
476	NORAH		JOHNSTON		2009-10-23 00:00:00+00	\N	73	625	73	\N	0
477	NAZ		KARIM		2015-11-06 00:00:00+00	\N	73	626	73	\N	0
478	VANCE		LUCENTE		2017-10-16 00:00:00+00	\N	73	627	73	\N	0
479	MONICA		NUCA		2017-10-16 00:00:00+00	\N	73	628	73	\N	0
480	SEAN		MACKENROT		2013-11-05 00:00:00+00	\N	74	631	74	\N	0
481	TALIB		RAY		2017-10-11 00:00:00+00	\N	74	632	74	\N	0
482	SHAUN		D'SOUZA		2017-11-22 00:00:00+00	\N	74	633	74	\N	0
483	TODD		ROMER		2017-10-11 00:00:00+00	\N	74	634	74	\N	0
484	DRAGANA		VASIC		2017-10-11 00:00:00+00	\N	74	635	74	\N	0
485	EMILY		BLAND		2018-09-12 00:00:00+00	\N	75	638	75	\N	0
486	LYN		CUSTAN		2017-09-26 00:00:00+00	\N	75	639	75	\N	0
487	VANESSA		JESELON		2017-09-26 00:00:00+00	\N	75	640	75	\N	0
488	BERNARD		WILSON		2017-09-26 00:00:00+00	\N	75	641	75	\N	0
489	MAURICE		COGSWELL		2004-09-23 00:00:00+00	\N	76	644	76	\N	0
490	WILLIAM		COGSWELL		2004-09-23 00:00:00+00	\N	76	645	76	\N	0
491	JOHN		DOUGLAS		2015-03-05 00:00:00+00	\N	76	646	76	\N	0
492	LANCE		HILLBRECHT		2004-09-23 00:00:00+00	\N	76	647	76	\N	0
493	DANIEL		MALONEY		2015-03-05 00:00:00+00	\N	76	648	76	\N	0
494	STEPHAN		CLARKE		2017-07-21 00:00:00+00	\N	77	651	77	\N	0
495	CRISI		CORBI		2018-10-22 00:00:00+00	\N	77	652	77	\N	0
496	KEVIN		GOOCH		2018-10-22 00:00:00+00	\N	77	653	77	\N	0
497	LAWRENCE		GORDON		2018-10-22 00:00:00+00	\N	77	654	77	\N	0
498	PREMILA		NANDAN		2017-07-21 00:00:00+00	\N	77	655	77	\N	0
499	PAT		SHUCHUK		2011-03-10 00:00:00+00	\N	77	656	77	\N	0
500	CLARA		UGARELLI		2012-12-10 00:00:00+00	\N	77	657	77	\N	0
501	SHERI		BERGMAN		2017-10-30 00:00:00+00	\N	78	660	78	\N	0
502	JANIE		CAWLEY		2016-10-26 00:00:00+00	\N	78	661	78	\N	0
503	TRACY		KOLWICH		2016-10-26 00:00:00+00	\N	78	662	78	\N	0
504	BOZENA		ZDANIUK		2018-10-12 00:00:00+00	\N	78	663	78	\N	0
505	JOHN		MERCIER		2016-09-16 00:00:00+00	\N	79	666	79	\N	0
506	OLGA		PLEKHANOVA		2016-11-23 00:00:00+00	\N	79	667	79	\N	0
507	OXANA		REYMERS		2017-12-11 00:00:00+00	\N	79	668	79	\N	0
508	RAY		TAYLOR		2016-09-16 00:00:00+00	\N	79	669	79	\N	0
509	ZARRINA		VOINOVA		2017-12-11 00:00:00+00	\N	79	670	79	\N	0
510	TOMASZ		ZEMOJTEL		2016-11-23 00:00:00+00	\N	79	671	79	\N	0
511	ANNEMARIE		CLOWERS		2015-11-20 00:00:00+00	\N	80	674	80	\N	0
512	JACLYN		CRUZ		2015-11-20 00:00:00+00	\N	80	675	80	\N	0
513	PATRICIA		DOCHERTY		2015-03-30 00:00:00+00	\N	80	676	80	\N	0
514	SHARON		HILDEBRANDT		2014-02-26 00:00:00+00	\N	80	677	80	\N	0
515	ANGELA		OMELCENCO		2016-10-27 00:00:00+00	\N	80	678	80	\N	0
516	JANE		ROBERTS		2015-03-20 00:00:00+00	\N	80	679	80	\N	0
517	ALICE		YEUNG		2016-10-27 00:00:00+00	\N	80	680	80	\N	0
518	ANNETTE		ANDERSON		2018-10-30 00:00:00+00	\N	81	683	81	\N	0
519	AFROZA		AWAL		2017-10-31 00:00:00+00	\N	81	684	81	\N	0
520	TROY		HAMILTON		2017-10-31 00:00:00+00	\N	81	685	81	\N	0
521	LAKSHMI		MCCALL		2018-10-30 00:00:00+00	\N	81	686	81	\N	0
522	MARIAN		MICHALSKI		2018-10-30 00:00:00+00	\N	81	687	81	\N	0
523	KAI		SJOHOLM		2018-10-30 00:00:00+00	\N	81	688	81	\N	0
524	BRIAN		MACDONALD		2018-12-03 00:00:00+00	\N	82	691	82	\N	0
525	CORRINE		PRESCOTT		2018-12-03 00:00:00+00	\N	82	692	82	\N	0
526	GETASEW		WOLDEMARIAM		2018-12-03 00:00:00+00	\N	82	693	82	\N	0
527	ZENNA		ZARELLI		2018-12-03 00:00:00+00	\N	82	694	82	\N	0
528	CARRIE		LEBLANC		2018-12-03 00:00:00+00	\N	82	695	82	\N	0
529	BEATRIZ		GONZALEZ-BARRIOS		2017-10-11 00:00:00+00	\N	83	698	83	\N	0
530	PABLO		PASCUALE		2018-12-06 00:00:00+00	\N	83	699	83	\N	0
531	TATIANA		SITAR		2018-12-06 00:00:00+00	\N	83	700	83	\N	0
532	ANNA		SMIRNOFF		2018-12-06 00:00:00+00	\N	83	701	83	\N	0
533	ANNA		TIMOFEEVA		2018-12-06 00:00:00+00	\N	83	702	83	\N	0
534	OLGA		VAFINA		2018-12-06 00:00:00+00	\N	83	703	83	\N	0
535	RICHARD		ALLEN		2018-12-20 00:00:00+00	\N	84	706	84	\N	0
536	SUSY		ASTETE		2016-07-18 00:00:00+00	\N	84	707	84	\N	0
537	HEATHER		BLISS		2017-10-23 00:00:00+00	\N	84	708	84	\N	0
538	HELMUT		DAIMINGER		2017-10-02 00:00:00+00	\N	84	709	84	\N	0
539	TAJ		IRWIN		2018-12-20 00:00:00+00	\N	84	710	84	\N	0
540	CARMELLE		LAMB		2018-12-20 00:00:00+00	\N	84	711	84	\N	0
541	CHRISTINE		MCWILLIAMS		2018-12-20 00:00:00+00	\N	84	712	84	\N	0
542	KIMBERLEY		O'MALLEY		2017-10-23 00:00:00+00	\N	84	713	84	\N	0
543	OLIVIA		VERBIAN		2016-10-18 00:00:00+00	\N	84	714	84	\N	0
544	SANDRA		GREENAWAY		2014-11-17 00:00:00+00	\N	85	717	85	\N	0
545	FREDERICK		KENNEDY		2017-10-11 00:00:00+00	\N	85	718	85	\N	0
546	JOYCE		LEROUX		2018-10-10 00:00:00+00	\N	85	719	85	\N	0
547	VERONICA		SCOTT		2018-10-10 00:00:00+00	\N	85	720	85	\N	0
548	KATHRYN		DANIEL		2015-10-22 00:00:00+00	\N	85	721	85	\N	0
549	KEITH		BRYSON		2018-09-19 00:00:00+00	\N	86	724	86	\N	0
550	NANCY		LACHAPELLE		2018-09-19 00:00:00+00	\N	86	725	86	\N	0
551	NANCY		PAYNE		2014-11-17 00:00:00+00	\N	86	726	86	\N	0
552	JESSE		THOMAS		2018-09-19 00:00:00+00	\N	86	727	86	\N	0
553	JOHN		WELLS		2008-01-09 00:00:00+00	\N	86	728	86	\N	0
554	MARIE		FILIATRAULT		2014-11-17 00:00:00+00	\N	86	729	86	\N	0
555	DEBORAH		DESILETS		2016-10-26 00:00:00+00	\N	87	732	87	\N	0
556	ROBYN S.		HIGGINS		2017-10-18 00:00:00+00	\N	87	733	87	\N	0
557	NATASHA		MCAVOY		2018-10-31 00:00:00+00	\N	87	734	87	\N	0
558	STEFAAN		SYNNESAEL		2018-10-31 00:00:00+00	\N	87	735	87	\N	0
559	JULIA R.		WALKER		2017-06-19 00:00:00+00	\N	87	736	87	\N	0
560	PHYLLIS A.		NASH		2010-12-24 00:00:00+00	\N	88	739	88	\N	0
561	MARGARET		NICKLE		2017-10-25 00:00:00+00	\N	88	740	88	\N	0
562	JOCELYN		STUART		2018-12-13 00:00:00+00	\N	88	741	88	\N	0
563	CAROLE		SUMMER		2017-10-25 00:00:00+00	\N	88	742	88	\N	0
564	JIM		FISHER		2018-12-13 00:00:00+00	\N	88	743	88	\N	0
565	LENA		HORSWILL		2017-10-25 00:00:00+00	\N	88	744	88	\N	0
566	CATHY		LEUGNER		2018-12-13 00:00:00+00	\N	88	745	88	\N	0
567	RON		LIDDLE		2017-10-25 00:00:00+00	\N	88	746	88	\N	0
568	ZARGHOONA		ABDUL WAKIL		2016-09-09 00:00:00+00	\N	89	749	89	\N	0
569	ZARIF		AKBARIAN		2017-09-21 00:00:00+00	\N	89	750	89	\N	0
570	EDITH M		CULLER MATA		2015-09-16 00:00:00+00	\N	89	751	89	\N	0
571	PARTRICIA		DABIRI		2017-09-21 00:00:00+00	\N	89	752	89	\N	0
572	RASHMI		RAHEJA		2017-09-21 00:00:00+00	\N	89	753	89	\N	0
573	CHAYA		RANSEN		2016-09-09 00:00:00+00	\N	89	754	89	\N	0
574	MIGUEL		TRUJILLO		2015-09-16 00:00:00+00	\N	89	755	89	\N	0
575	MEAGAN J.		GROSSMAN		2017-10-16 00:00:00+00	\N	90	758	90	\N	0
576	SARAH A.		ZIMMERMAN		2017-10-16 00:00:00+00	\N	90	759	90	\N	0
577	PETER S.		HARLING		2017-10-16 00:00:00+00	\N	90	760	90	\N	0
578	KATARZYNA M.		KISTOWSKA		2016-11-23 00:00:00+00	\N	90	761	90	\N	0
579	STEPHEN		SALEM		2017-10-16 00:00:00+00	\N	90	762	90	\N	0
580	JAMES D		SEIB		2016-11-23 00:00:00+00	\N	90	763	90	\N	0
581	DAVID		GORDON		2019-05-15 00:00:00+00	\N	90	764	90	\N	0
582	EVAN		VAN DYK		2019-05-15 00:00:00+00	\N	90	765	90	\N	0
583	GORDON		DYCKE		2013-09-20 00:00:00+00	\N	91	768	91	\N	0
584	CHARLES		EAMER		2016-09-28 00:00:00+00	\N	91	769	91	\N	0
585	MIKE		HECKL		2016-09-28 00:00:00+00	\N	91	770	91	\N	0
586	GORDON J.		STENGEL		2013-03-27 00:00:00+00	\N	91	771	91	\N	0
587	KENNETH		WRIGHT		2018-10-22 00:00:00+00	\N	91	772	91	\N	0
588	CHRISTOPHER		BROWN		2015-01-07 00:00:00+00	\N	92	775	92	\N	0
589	ISABELLE J		MORRIS		2013-03-26 00:00:00+00	\N	92	776	92	\N	0
590	CRAIG H		EVANS		2013-03-26 00:00:00+00	\N	92	777	92	\N	0
591	JENNIFER J		CODY		2015-01-07 00:00:00+00	\N	92	778	92	\N	0
592	LINDSAY		BEAL		2016-09-07 00:00:00+00	\N	93	781	93	\N	0
593	CATHY		GILBERT		2016-09-07 00:00:00+00	\N	93	782	93	\N	0
594	NOLA		LANDUCCI		2018-10-15 00:00:00+00	\N	93	783	93	\N	0
595	DONNA		SASSAMAN		2018-10-15 00:00:00+00	\N	93	784	93	\N	0
596	JOHN W.		SCULL		2014-05-27 00:00:00+00	\N	93	785	93	\N	0
597	KIM		CITTON		2014-05-27 00:00:00+00	\N	93	786	93	\N	0
598	ALYCIA		WEIR		2018-12-03 00:00:00+00	\N	94	789	94	\N	0
599	HELENA A.M.		OOSTHOEK		2016-04-25 00:00:00+00	\N	94	790	94	\N	0
600	CONNIE E.		BARLOW		2016-04-25 00:00:00+00	\N	94	791	94	\N	0
601	JILL		HOLLAND		2018-12-03 00:00:00+00	\N	94	792	94	\N	0
602	NADINE		PODMOROFF		2016-06-28 00:00:00+00	\N	95	795	95	\N	0
603	SEAN		HOODICOFF		2019-01-10 00:00:00+00	\N	95	796	95	\N	0
604	LORI		HANSON		2019-01-10 00:00:00+00	\N	95	797	95	\N	0
605	VANESSA		BENWOOD		2017-10-16 00:00:00+00	\N	95	798	95	\N	0
606	LYNN		TURNER		2018-06-13 00:00:00+00	\N	96	801	96	\N	0
607	BARB		STEVENSON		2018-06-13 00:00:00+00	\N	96	802	96	\N	0
608	DOROTHY		PATTERSON		2018-06-13 00:00:00+00	\N	96	803	96	\N	0
609	PAT		KERMEEN		2018-06-13 00:00:00+00	\N	96	804	96	\N	0
610	WES		HEWITT		2018-06-13 00:00:00+00	\N	96	805	96	\N	0
611	CATHY		GISLASON		2018-06-13 00:00:00+00	\N	96	806	96	\N	0
612	JOHN		DOUGLAS		2018-06-13 00:00:00+00	\N	96	807	96	\N	0
613	TERRY		DEAKIN		2019-05-03 00:00:00+00	\N	96	808	96	\N	0
614	ELLEN		LACHARITY		2019-05-03 00:00:00+00	\N	96	809	96	\N	0
615	LARRY		CONN		2018-06-06 00:00:00+00	\N	97	812	97	\N	0
616	JAY		HAMBURGER		2018-06-06 00:00:00+00	\N	97	813	97	\N	0
617	LUKAS		HYRMAN		2018-06-06 00:00:00+00	\N	97	814	97	\N	0
618	ROLF		MAURER		2018-06-06 00:00:00+00	\N	97	815	97	\N	0
619	COLLEEN		SMITH		2018-06-06 00:00:00+00	\N	97	816	97	\N	0
620	MICHAEL		YOUNG		2018-06-06 00:00:00+00	\N	97	817	97	\N	0
621	JOHN		SMITH		2019-08-20 00:00:00+00	\N	51	818	101	\N	0
630	KIRK		DUFF		2016-10-07 00:00:00+00	\N	99	831	103	\N	0
631	ADRIAN		JELLY		2016-10-07 00:00:00+00	\N	99	832	103	\N	0
632	ROBERT		JOLLY		2018-12-12 00:00:00+00	\N	99	833	103	\N	0
633	FRANK		KACSINKO		2017-10-23 00:00:00+00	\N	99	834	103	\N	0
634	RAE		MACKLON		2014-12-02 00:00:00+00	\N	99	835	103	\N	0
635	JOSEPH		MAKORTOFF		2017-10-23 00:00:00+00	\N	99	836	103	\N	0
636	KIRA		MOFFAT		2017-10-23 00:00:00+00	\N	99	837	103	\N	0
637	RAYMOND		PICHETTE		2014-12-02 00:00:00+00	\N	99	838	103	\N	0
638	JENNIFER		AIKMAN		2019-02-21 00:00:00+00	\N	100	841	104	\N	0
639	SHARON		BROUGH		2019-02-21 00:00:00+00	\N	100	842	104	\N	0
640	DEBRA		DOUGLAS		2018-12-03 00:00:00+00	\N	100	843	104	\N	0
641	BARB		DOYLE		2019-02-21 00:00:00+00	\N	100	844	104	\N	0
642	ROSS		FOWLIE		2018-12-03 00:00:00+00	\N	100	845	104	\N	0
643	ALLISON		LESLIE		2019-02-21 00:00:00+00	\N	100	846	104	\N	0
644	CONNIE		MCCONNELL		2019-02-21 00:00:00+00	\N	100	847	104	\N	0
645	JANET		SEE		2016-10-12 00:00:00+00	\N	101	850	105	\N	0
646	LARRY		WOLFE		2018-10-23 00:00:00+00	\N	101	851	105	\N	0
647	BRENT W.		WOODS		2014-05-09 00:00:00+00	\N	101	852	105	\N	0
648	KEVAN		ARNELD		2017-11-14 00:00:00+00	\N	101	853	105	\N	0
649	MARIAH		BURTON		2018-10-23 00:00:00+00	\N	101	854	105	\N	0
650	KATHY		HOWLAND		2018-10-23 00:00:00+00	\N	101	855	105	\N	0
651	LORNA		LYONS		2016-10-12 00:00:00+00	\N	101	856	105	\N	0
652	KIRAN		BAGHA		2019-03-14 00:00:00+00	\N	101	857	105	\N	0
653	MARY		ATKINSON		2016-09-09 00:00:00+00	\N	102	860	106	\N	0
654	DAN		BUNNETT		2011-11-02 00:00:00+00	\N	102	861	106	\N	0
655	GERRY		EDWARDS		2017-08-02 00:00:00+00	\N	102	862	106	\N	0
656	CHARLOTTE		MEEKER		2012-12-10 00:00:00+00	\N	102	863	106	\N	0
657	DENNIS		MONDS		2011-11-02 00:00:00+00	\N	102	864	106	\N	0
658	BOB		PRIZEMAN		2013-09-20 00:00:00+00	\N	102	865	106	\N	0
659	LISA		VON BENZON		2016-09-09 00:00:00+00	\N	102	866	106	\N	0
660	LARRY		WIENS		2010-08-17 00:00:00+00	\N	102	867	106	\N	0
661	LES		WILLEY		2018-10-22 00:00:00+00	\N	102	868	106	\N	0
662	MAGGIE		JONES		2017-10-12 00:00:00+00	\N	103	871	107	\N	0
663	MAUREEN N.		KELSEY		2016-10-26 00:00:00+00	\N	103	872	107	\N	0
664	JOHN E.		KINGSMILL		2016-10-26 00:00:00+00	\N	103	873	107	\N	0
665	INA		POCKRASS		2017-10-12 00:00:00+00	\N	103	874	107	\N	0
666	ABRA		BRYNNE		2015-11-17 00:00:00+00	\N	103	875	107	\N	0
667	ALEXANDRA		FORSYTHE		2017-10-12 00:00:00+00	\N	103	876	107	\N	0
668	SHANNON		HAMMOND		2017-10-12 00:00:00+00	\N	103	877	107	\N	0
669	SARAH		CONNOLLY		2019-04-11 00:00:00+00	\N	103	878	107	\N	0
670	LAUREN		ELDRIDGE		2017-05-30 00:00:00+00	\N	104	881	108	\N	0
671	DIANA		JEFFRIES		2018-12-11 00:00:00+00	\N	104	882	108	\N	0
672	SIMON		KAULBACK		2018-12-11 00:00:00+00	\N	104	883	108	\N	0
673	JAMES		MAXWELL		2018-12-11 00:00:00+00	\N	104	884	108	\N	0
674	GARNET		MCPHEE		2018-12-11 00:00:00+00	\N	104	885	108	\N	0
675	PHIL		MONDOR		2018-12-11 00:00:00+00	\N	104	886	108	\N	0
676	MICHELLE		PERUGINI		2018-12-11 00:00:00+00	\N	104	887	108	\N	0
677	DAVID		PLEWES		2018-12-11 00:00:00+00	\N	104	888	108	\N	0
678	MARTHA		BLACK		2013-12-17 00:00:00+00	\N	105	891	109	\N	0
679	KEN		CAMPBELL		2016-10-18 00:00:00+00	\N	105	892	109	\N	0
680	DENNIS		ETHERIDGE		2015-10-23 00:00:00+00	\N	105	893	109	\N	0
681	RICHARD		HYATT		2012-11-23 00:00:00+00	\N	105	894	109	\N	0
682	LESLIE		PHELPS		2016-10-18 00:00:00+00	\N	105	895	109	\N	0
683	RUDY		PRIES		2016-10-18 00:00:00+00	\N	105	896	109	\N	0
684	CRYSTAL		ROBINSON		2018-10-22 00:00:00+00	\N	105	897	109	\N	0
685	DOROTHY		TURNBULL		2007-10-18 00:00:00+00	\N	105	898	109	\N	0
686	ROSEANNE		WADE		2012-11-23 00:00:00+00	\N	105	899	109	\N	0
687	SUSAN		FERNANDEZ		2018-10-05 00:00:00+00	\N	106	902	110	\N	0
688	CHRISTOPHER		KOPAR		2017-10-12 00:00:00+00	\N	106	903	110	\N	0
689	RACHEL		LINDQUIST		2018-10-05 00:00:00+00	\N	106	904	110	\N	0
690	YAKOV		PRIVES		2017-06-14 00:00:00+00	\N	106	905	110	\N	0
691	RUTH		VODDEN		2017-10-12 00:00:00+00	\N	106	906	110	\N	0
692	MARK		VOLKMANN		2019-06-06 00:00:00+00	\N	106	907	110	\N	0
693	NATALIA		GRENKOVA		2019-06-06 00:00:00+00	\N	106	908	110	\N	0
694	DIERDRE		BRADSHAW		2017-10-23 00:00:00+00	\N	107	911	111	\N	0
695	JEN		CANDELA		2017-10-23 00:00:00+00	\N	107	912	111	\N	0
696	DIANA		KOLLAR		2018-11-02 00:00:00+00	\N	107	913	111	\N	0
697	YVES		MA		2017-10-23 00:00:00+00	\N	107	914	111	\N	0
698	DANIEL		MCLEOD		2018-11-02 00:00:00+00	\N	107	915	111	\N	0
699	JEFFREY		SHOUB		2017-05-04 00:00:00+00	\N	107	916	111	\N	0
700	SABETTE		THOMPSON		2017-10-23 00:00:00+00	\N	107	917	111	\N	0
701	AGNIESZKA		WEGLEWSKA		2017-10-23 00:00:00+00	\N	107	918	111	\N	0
702	ANTHONY		ALLEN		2018-11-02 00:00:00+00	\N	108	921	112	\N	0
703	EAMMON		BOURKE		2017-11-29 00:00:00+00	\N	108	922	112	\N	0
704	LESLIE		FRASER		2018-11-02 00:00:00+00	\N	108	923	112	\N	0
705	LORI		JONES		2017-11-29 00:00:00+00	\N	108	924	112	\N	0
706	INGA		SKODA		2018-11-02 00:00:00+00	\N	108	925	112	\N	0
707	ANDRES		VEGA		2018-11-02 00:00:00+00	\N	108	926	112	\N	0
708	JOHN		MACKINTOSH		2017-11-29 00:00:00+00	\N	108	927	112	\N	0
709	PETER		ROHDE		2018-11-02 00:00:00+00	\N	108	928	112	\N	0
710	RIA		SIREGAR-LOOSEMOORE		2018-11-02 00:00:00+00	\N	108	929	112	\N	0
711	JODIE		PAUL		2017-10-31 00:00:00+00	\N	109	932	113	\N	0
712	DAVID		STEWART		2017-10-31 00:00:00+00	\N	109	933	113	\N	0
713	THERESA		WHITE		2018-11-02 00:00:00+00	\N	109	934	113	\N	0
714	COLLIN		BUDD		2017-06-19 00:00:00+00	\N	109	935	113	\N	0
715	CASSANDRA		BURKHOLDER		2018-11-02 00:00:00+00	\N	109	936	113	\N	0
716	AARON		MCNEILL		2017-10-31 00:00:00+00	\N	109	937	113	\N	0
717	JASON		BAKKER		2018-10-22 00:00:00+00	\N	110	940	114	\N	0
718	LORETTA		HRYNYK		2018-10-22 00:00:00+00	\N	110	941	114	\N	0
719	MIKE		LEWIS		2018-10-03 00:00:00+00	\N	110	942	114	\N	0
720	ELAINE		PAISLEY		2018-10-03 00:00:00+00	\N	110	943	114	\N	0
721	GEORGIA		SPILIOTOPOULOS		2018-10-22 00:00:00+00	\N	110	944	114	\N	0
722	VALERIE		UNRUH		2018-10-03 00:00:00+00	\N	110	945	114	\N	0
723	AMANDA		WATKINS		2018-10-22 00:00:00+00	\N	110	946	114	\N	0
724	VALERIE		WILLANS		2018-10-03 00:00:00+00	\N	110	947	114	\N	0
725	NICKY		CAIRNCROSS		2018-11-08 00:00:00+00	\N	111	950	115	\N	0
726	HELEN		JONES		2018-11-08 00:00:00+00	\N	111	951	115	\N	0
727	SUSAN		LARKIN		2018-11-08 00:00:00+00	\N	111	952	115	\N	0
728	CHARISSE		LYNCH-WELCH		2016-11-08 00:00:00+00	\N	111	953	115	\N	0
729	SUSAN P.		NATION		2017-10-31 00:00:00+00	\N	111	954	115	\N	0
730	DEBBIE		LAY		2018-12-20 00:00:00+00	\N	112	957	116	\N	0
731	AARON		LONG		2018-12-20 00:00:00+00	\N	112	958	116	\N	0
732	SAMANTHA		SMITH		2018-12-20 00:00:00+00	\N	112	959	116	\N	0
733	BOYD		VICKERSON		2017-07-05 00:00:00+00	\N	112	960	116	\N	0
734	NATHAN		VOS		2018-12-20 00:00:00+00	\N	112	961	116	\N	0
735	SHILOH		BOUVETTE		2019-02-13 00:00:00+00	\N	113	964	117	\N	0
736	DAN		BUDGELL		2019-02-13 00:00:00+00	\N	113	965	117	\N	0
737	MICHAEL		LEYNE		2017-11-09 00:00:00+00	\N	113	966	117	\N	0
738	SALLY		RUDOLF		2018-08-01 00:00:00+00	\N	113	967	117	\N	0
739	LORI		SEAY		2017-11-09 00:00:00+00	\N	113	968	117	\N	0
740	JULIE		TYE		2019-02-13 00:00:00+00	\N	113	969	117	\N	0
741	AINE		YOUNG		2018-08-01 00:00:00+00	\N	113	970	117	\N	0
742	MICHAEL		ROHALLY		2019-07-23 00:00:00+00	\N	113	971	117	\N	0
743	ROBERT		TODOSICHUK		2019-01-17 00:00:00+00	\N	114	974	118	\N	0
744	BETTINA		COTSONI		2019-01-17 00:00:00+00	\N	114	975	118	\N	0
745	ILONA		FIZEL		2018-06-27 00:00:00+00	\N	114	976	118	\N	0
746	JAMIE		MCINTYRE		2016-08-24 00:00:00+00	\N	114	977	118	\N	0
747	LISA		OJAROODI		2018-06-27 00:00:00+00	\N	114	978	118	\N	0
748	NICOLE		OWEN		2018-06-27 00:00:00+00	\N	114	979	118	\N	0
749	SHANE		SCHOONEN		2019-01-17 00:00:00+00	\N	114	980	118	\N	0
750	COLLEN		BUCHANAN		2017-08-17 00:00:00+00	\N	115	983	119	\N	0
751	LINDA		NEPHIN		2017-08-17 00:00:00+00	\N	115	984	119	\N	0
752	NIKI		PERRIN		2017-08-17 00:00:00+00	\N	115	985	119	\N	0
753	DORIS		RAIWET		2017-08-17 00:00:00+00	\N	115	986	119	\N	0
754	LENOX		REID		2018-11-07 00:00:00+00	\N	115	987	119	\N	0
755	ORAL		WYNTER		2018-11-07 00:00:00+00	\N	115	988	119	\N	0
756	SHEILA		BROWN		2018-10-05 00:00:00+00	\N	116	991	120	\N	0
757	JODI		BURGESS		2015-01-06 00:00:00+00	\N	116	992	120	\N	0
758	DAVID		CARDWELL		2013-12-17 00:00:00+00	\N	116	993	120	\N	0
759	DEBBIE		COLLRIN		2018-10-05 00:00:00+00	\N	116	994	120	\N	0
760	MERILYN		KAISER		2015-01-06 00:00:00+00	\N	116	995	120	\N	0
761	ROSEMARIE		MAXIM		2018-10-05 00:00:00+00	\N	116	996	120	\N	0
762	JANET		TAYLOR		2012-12-27 00:00:00+00	\N	116	997	120	\N	0
763	INA		BOTHMA		2018-08-29 00:00:00+00	\N	117	1000	121	\N	0
764	WENDY		HAMPTON		2017-10-23 00:00:00+00	\N	117	1001	121	\N	0
765	ANN		MOORE		2017-10-23 00:00:00+00	\N	117	1002	121	\N	0
766	E. MARY		SURTEL		2018-08-29 00:00:00+00	\N	117	1003	121	\N	0
767	LAWRENCE		BOXALL		2016-09-29 00:00:00+00	\N	118	1006	122	\N	0
768	JODY-ANN		EDMAN		2018-10-02 00:00:00+00	\N	118	1007	122	\N	0
769	SANDRA		GREENE		2016-09-29 00:00:00+00	\N	118	1008	122	\N	0
770	ADAM		MCLEOD		2018-10-02 00:00:00+00	\N	118	1009	122	\N	0
771	MARINA		PRINCZ		2018-10-02 00:00:00+00	\N	118	1010	122	\N	0
772	BRADUT		DIMA		2016-11-03 00:00:00+00	\N	119	1013	123	\N	0
773	NANCY		FRENCH		2017-11-29 00:00:00+00	\N	119	1014	123	\N	0
774	GAIL		JOHNSON		2018-10-02 00:00:00+00	\N	119	1015	123	\N	0
775	ANDREW		MCCRACKEN		2018-10-02 00:00:00+00	\N	119	1016	123	\N	0
776	ESTEBAN		MUGICA-JIMENO		2017-11-29 00:00:00+00	\N	119	1017	123	\N	0
777	SHANE		TAYLOR		2018-10-02 00:00:00+00	\N	119	1018	123	\N	0
778	KALEN		MORROW		2015-10-14 00:00:00+00	\N	120	1021	124	\N	0
779	AMANDA		SANDBERG		2018-10-18 00:00:00+00	\N	120	1022	124	\N	0
780	MELINDA		WARREN		2018-10-18 00:00:00+00	\N	120	1023	124	\N	0
781	SHAUNA		BARTER		2013-10-24 00:00:00+00	\N	120	1024	124	\N	0
782	SEAN		DALEY		2017-11-20 00:00:00+00	\N	120	1025	124	\N	0
783	DEBORAH		MCDONALD		2017-11-20 00:00:00+00	\N	120	1026	124	\N	0
784	PETER		MOONAN		2018-10-18 00:00:00+00	\N	120	1027	124	\N	0
785	SARAH		COWEN		2018-10-19 00:00:00+00	\N	121	1030	125	\N	0
786	CAINE		MILLS		2018-10-25 00:00:00+00	\N	121	1031	125	\N	0
787	MARY		MORGAN-PICK		2018-10-19 00:00:00+00	\N	121	1032	125	\N	0
788	SARA		QUIST		2018-10-25 00:00:00+00	\N	121	1033	125	\N	0
789	RYAN		REDDING		2018-10-19 00:00:00+00	\N	121	1034	125	\N	0
790	PHILLIP		ALMENDRALA		2018-10-02 00:00:00+00	\N	122	1037	126	\N	0
791	OLEG		ANDREICHIKOV		2016-10-06 00:00:00+00	\N	122	1038	126	\N	0
792	MARIA		BROCAL		2018-10-02 00:00:00+00	\N	122	1039	126	\N	0
793	MICHELE		CLOETE		2009-10-23 00:00:00+00	\N	122	1040	126	\N	0
794	NORAH		JOHNSTON		2009-10-23 00:00:00+00	\N	122	1041	126	\N	0
795	NAZ		KARIM		2015-11-06 00:00:00+00	\N	122	1042	126	\N	0
796	VANCE		LUCENTE		2017-10-16 00:00:00+00	\N	122	1043	126	\N	0
797	MONICA		NUCA		2017-10-16 00:00:00+00	\N	122	1044	126	\N	0
798	SEAN		MACKENROT		2013-11-05 00:00:00+00	\N	123	1047	127	\N	0
799	TALIB		RAY		2017-10-11 00:00:00+00	\N	123	1048	127	\N	0
800	SHAUN		D'SOUZA		2017-11-22 00:00:00+00	\N	123	1049	127	\N	0
801	TODD		ROMER		2017-10-11 00:00:00+00	\N	123	1050	127	\N	0
802	DRAGANA		VASIC		2017-10-11 00:00:00+00	\N	123	1051	127	\N	0
803	EMILY		BLAND		2018-09-12 00:00:00+00	\N	124	1054	128	\N	0
804	LYN		CUSTAN		2017-09-26 00:00:00+00	\N	124	1055	128	\N	0
805	VANESSA		JESELON		2017-09-26 00:00:00+00	\N	124	1056	128	\N	0
806	BERNARD		WILSON		2017-09-26 00:00:00+00	\N	124	1057	128	\N	0
807	MAURICE		COGSWELL		2004-09-23 00:00:00+00	\N	125	1060	129	\N	0
808	WILLIAM		COGSWELL		2004-09-23 00:00:00+00	\N	125	1061	129	\N	0
809	JOHN		DOUGLAS		2015-03-05 00:00:00+00	\N	125	1062	129	\N	0
810	LANCE		HILLBRECHT		2004-09-23 00:00:00+00	\N	125	1063	129	\N	0
811	DANIEL		MALONEY		2015-03-05 00:00:00+00	\N	125	1064	129	\N	0
812	STEPHAN		CLARKE		2017-07-21 00:00:00+00	\N	126	1067	130	\N	0
813	CRISI		CORBI		2018-10-22 00:00:00+00	\N	126	1068	130	\N	0
814	KEVIN		GOOCH		2018-10-22 00:00:00+00	\N	126	1069	130	\N	0
815	LAWRENCE		GORDON		2018-10-22 00:00:00+00	\N	126	1070	130	\N	0
816	PREMILA		NANDAN		2017-07-21 00:00:00+00	\N	126	1071	130	\N	0
817	PAT		SHUCHUK		2011-03-10 00:00:00+00	\N	126	1072	130	\N	0
818	CLARA		UGARELLI		2012-12-10 00:00:00+00	\N	126	1073	130	\N	0
819	SHERI		BERGMAN		2017-10-30 00:00:00+00	\N	127	1076	131	\N	0
820	JANIE		CAWLEY		2016-10-26 00:00:00+00	\N	127	1077	131	\N	0
821	TRACY		KOLWICH		2016-10-26 00:00:00+00	\N	127	1078	131	\N	0
822	BOZENA		ZDANIUK		2018-10-12 00:00:00+00	\N	127	1079	131	\N	0
823	JOHN		MERCIER		2016-09-16 00:00:00+00	\N	128	1082	132	\N	0
824	OLGA		PLEKHANOVA		2016-11-23 00:00:00+00	\N	128	1083	132	\N	0
825	OXANA		REYMERS		2017-12-11 00:00:00+00	\N	128	1084	132	\N	0
826	RAY		TAYLOR		2016-09-16 00:00:00+00	\N	128	1085	132	\N	0
827	ZARRINA		VOINOVA		2017-12-11 00:00:00+00	\N	128	1086	132	\N	0
828	TOMASZ		ZEMOJTEL		2016-11-23 00:00:00+00	\N	128	1087	132	\N	0
829	ANNEMARIE		CLOWERS		2015-11-20 00:00:00+00	\N	129	1090	133	\N	0
830	JACLYN		CRUZ		2015-11-20 00:00:00+00	\N	129	1091	133	\N	0
831	PATRICIA		DOCHERTY		2015-03-30 00:00:00+00	\N	129	1092	133	\N	0
832	SHARON		HILDEBRANDT		2014-02-26 00:00:00+00	\N	129	1093	133	\N	0
833	ANGELA		OMELCENCO		2016-10-27 00:00:00+00	\N	129	1094	133	\N	0
834	JANE		ROBERTS		2015-03-20 00:00:00+00	\N	129	1095	133	\N	0
835	ALICE		YEUNG		2016-10-27 00:00:00+00	\N	129	1096	133	\N	0
836	ANNETTE		ANDERSON		2018-10-30 00:00:00+00	\N	130	1099	134	\N	0
837	AFROZA		AWAL		2017-10-31 00:00:00+00	\N	130	1100	134	\N	0
838	TROY		HAMILTON		2017-10-31 00:00:00+00	\N	130	1101	134	\N	0
839	LAKSHMI		MCCALL		2018-10-30 00:00:00+00	\N	130	1102	134	\N	0
840	MARIAN		MICHALSKI		2018-10-30 00:00:00+00	\N	130	1103	134	\N	0
841	KAI		SJOHOLM		2018-10-30 00:00:00+00	\N	130	1104	134	\N	0
842	BRIAN		MACDONALD		2018-12-03 00:00:00+00	\N	131	1107	135	\N	0
843	CORRINE		PRESCOTT		2018-12-03 00:00:00+00	\N	131	1108	135	\N	0
844	GETASEW		WOLDEMARIAM		2018-12-03 00:00:00+00	\N	131	1109	135	\N	0
845	ZENNA		ZARELLI		2018-12-03 00:00:00+00	\N	131	1110	135	\N	0
846	CARRIE		LEBLANC		2018-12-03 00:00:00+00	\N	131	1111	135	\N	0
847	BEATRIZ		GONZALEZ-BARRIOS		2017-10-11 00:00:00+00	\N	132	1114	136	\N	0
848	PABLO		PASCUALE		2018-12-06 00:00:00+00	\N	132	1115	136	\N	0
849	TATIANA		SITAR		2018-12-06 00:00:00+00	\N	132	1116	136	\N	0
850	ANNA		SMIRNOFF		2018-12-06 00:00:00+00	\N	132	1117	136	\N	0
851	ANNA		TIMOFEEVA		2018-12-06 00:00:00+00	\N	132	1118	136	\N	0
852	OLGA		VAFINA		2018-12-06 00:00:00+00	\N	132	1119	136	\N	0
853	RICHARD		ALLEN		2018-12-20 00:00:00+00	\N	133	1122	137	\N	0
854	SUSY		ASTETE		2016-07-18 00:00:00+00	\N	133	1123	137	\N	0
855	HEATHER		BLISS		2017-10-23 00:00:00+00	\N	133	1124	137	\N	0
856	HELMUT		DAIMINGER		2017-10-02 00:00:00+00	\N	133	1125	137	\N	0
857	TAJ		IRWIN		2018-12-20 00:00:00+00	\N	133	1126	137	\N	0
858	CARMELLE		LAMB		2018-12-20 00:00:00+00	\N	133	1127	137	\N	0
859	CHRISTINE		MCWILLIAMS		2018-12-20 00:00:00+00	\N	133	1128	137	\N	0
860	KIMBERLEY		O'MALLEY		2017-10-23 00:00:00+00	\N	133	1129	137	\N	0
861	OLIVIA		VERBIAN		2016-10-18 00:00:00+00	\N	133	1130	137	\N	0
862	SANDRA		GREENAWAY		2014-11-17 00:00:00+00	\N	134	1133	138	\N	0
863	FREDERICK		KENNEDY		2017-10-11 00:00:00+00	\N	134	1134	138	\N	0
864	JOYCE		LEROUX		2018-10-10 00:00:00+00	\N	134	1135	138	\N	0
865	VERONICA		SCOTT		2018-10-10 00:00:00+00	\N	134	1136	138	\N	0
866	KATHRYN		DANIEL		2015-10-22 00:00:00+00	\N	134	1137	138	\N	0
867	KEITH		BRYSON		2018-09-19 00:00:00+00	\N	135	1140	139	\N	0
868	NANCY		LACHAPELLE		2018-09-19 00:00:00+00	\N	135	1141	139	\N	0
869	NANCY		PAYNE		2014-11-17 00:00:00+00	\N	135	1142	139	\N	0
870	JESSE		THOMAS		2018-09-19 00:00:00+00	\N	135	1143	139	\N	0
871	JOHN		WELLS		2008-01-09 00:00:00+00	\N	135	1144	139	\N	0
872	MARIE		FILIATRAULT		2014-11-17 00:00:00+00	\N	135	1145	139	\N	0
873	DEBORAH		DESILETS		2016-10-26 00:00:00+00	\N	136	1148	140	\N	0
874	ROBYN S.		HIGGINS		2017-10-18 00:00:00+00	\N	136	1149	140	\N	0
875	NATASHA		MCAVOY		2018-10-31 00:00:00+00	\N	136	1150	140	\N	0
876	STEFAAN		SYNNESAEL		2018-10-31 00:00:00+00	\N	136	1151	140	\N	0
877	JULIA R.		WALKER		2017-06-19 00:00:00+00	\N	136	1152	140	\N	0
878	PHYLLIS A.		NASH		2010-12-24 00:00:00+00	\N	137	1155	141	\N	0
879	MARGARET		NICKLE		2017-10-25 00:00:00+00	\N	137	1156	141	\N	0
880	JOCELYN		STUART		2018-12-13 00:00:00+00	\N	137	1157	141	\N	0
881	CAROLE		SUMMER		2017-10-25 00:00:00+00	\N	137	1158	141	\N	0
882	JIM		FISHER		2018-12-13 00:00:00+00	\N	137	1159	141	\N	0
883	LENA		HORSWILL		2017-10-25 00:00:00+00	\N	137	1160	141	\N	0
884	CATHY		LEUGNER		2018-12-13 00:00:00+00	\N	137	1161	141	\N	0
885	RON		LIDDLE		2017-10-25 00:00:00+00	\N	137	1162	141	\N	0
886	ZARGHOONA		ABDUL WAKIL		2016-09-09 00:00:00+00	\N	138	1165	142	\N	0
887	ZARIF		AKBARIAN		2017-09-21 00:00:00+00	\N	138	1166	142	\N	0
888	EDITH M		CULLER MATA		2015-09-16 00:00:00+00	\N	138	1167	142	\N	0
889	PARTRICIA		DABIRI		2017-09-21 00:00:00+00	\N	138	1168	142	\N	0
890	RASHMI		RAHEJA		2017-09-21 00:00:00+00	\N	138	1169	142	\N	0
891	CHAYA		RANSEN		2016-09-09 00:00:00+00	\N	138	1170	142	\N	0
892	MIGUEL		TRUJILLO		2015-09-16 00:00:00+00	\N	138	1171	142	\N	0
893	MEAGAN J.		GROSSMAN		2017-10-16 00:00:00+00	\N	139	1174	143	\N	0
894	SARAH A.		ZIMMERMAN		2017-10-16 00:00:00+00	\N	139	1175	143	\N	0
895	PETER S.		HARLING		2017-10-16 00:00:00+00	\N	139	1176	143	\N	0
896	KATARZYNA M.		KISTOWSKA		2016-11-23 00:00:00+00	\N	139	1177	143	\N	0
897	STEPHEN		SALEM		2017-10-16 00:00:00+00	\N	139	1178	143	\N	0
898	JAMES D		SEIB		2016-11-23 00:00:00+00	\N	139	1179	143	\N	0
899	DAVID		GORDON		2019-05-15 00:00:00+00	\N	139	1180	143	\N	0
900	EVAN		VAN DYK		2019-05-15 00:00:00+00	\N	139	1181	143	\N	0
901	GORDON		DYCKE		2013-09-20 00:00:00+00	\N	140	1184	144	\N	0
902	CHARLES		EAMER		2016-09-28 00:00:00+00	\N	140	1185	144	\N	0
903	MIKE		HECKL		2016-09-28 00:00:00+00	\N	140	1186	144	\N	0
904	GORDON J.		STENGEL		2013-03-27 00:00:00+00	\N	140	1187	144	\N	0
905	KENNETH		WRIGHT		2018-10-22 00:00:00+00	\N	140	1188	144	\N	0
906	CHRISTOPHER		BROWN		2015-01-07 00:00:00+00	\N	141	1191	145	\N	0
907	ISABELLE J		MORRIS		2013-03-26 00:00:00+00	\N	141	1192	145	\N	0
908	CRAIG H		EVANS		2013-03-26 00:00:00+00	\N	141	1193	145	\N	0
909	JENNIFER J		CODY		2015-01-07 00:00:00+00	\N	141	1194	145	\N	0
910	LINDSAY		BEAL		2016-09-07 00:00:00+00	\N	142	1197	146	\N	0
911	CATHY		GILBERT		2016-09-07 00:00:00+00	\N	142	1198	146	\N	0
912	NOLA		LANDUCCI		2018-10-15 00:00:00+00	\N	142	1199	146	\N	0
913	DONNA		SASSAMAN		2018-10-15 00:00:00+00	\N	142	1200	146	\N	0
914	JOHN W.		SCULL		2014-05-27 00:00:00+00	\N	142	1201	146	\N	0
915	KIM		CITTON		2014-05-27 00:00:00+00	\N	142	1202	146	\N	0
916	ALYCIA		WEIR		2018-12-03 00:00:00+00	\N	143	1205	147	\N	0
917	HELENA A.M.		OOSTHOEK		2016-04-25 00:00:00+00	\N	143	1206	147	\N	0
918	CONNIE E.		BARLOW		2016-04-25 00:00:00+00	\N	143	1207	147	\N	0
919	JILL		HOLLAND		2018-12-03 00:00:00+00	\N	143	1208	147	\N	0
920	NADINE		PODMOROFF		2016-06-28 00:00:00+00	\N	144	1211	148	\N	0
921	SEAN		HOODICOFF		2019-01-10 00:00:00+00	\N	144	1212	148	\N	0
922	LORI		HANSON		2019-01-10 00:00:00+00	\N	144	1213	148	\N	0
923	VANESSA		BENWOOD		2017-10-16 00:00:00+00	\N	144	1214	148	\N	0
924	LYNN		TURNER		2018-06-13 00:00:00+00	\N	145	1217	149	\N	0
925	BARB		STEVENSON		2018-06-13 00:00:00+00	\N	145	1218	149	\N	0
926	DOROTHY		PATTERSON		2018-06-13 00:00:00+00	\N	145	1219	149	\N	0
927	PAT		KERMEEN		2018-06-13 00:00:00+00	\N	145	1220	149	\N	0
928	WES		HEWITT		2018-06-13 00:00:00+00	\N	145	1221	149	\N	0
929	CATHY		GISLASON		2018-06-13 00:00:00+00	\N	145	1222	149	\N	0
930	JOHN		DOUGLAS		2018-06-13 00:00:00+00	\N	145	1223	149	\N	0
931	TERRY		DEAKIN		2019-05-03 00:00:00+00	\N	145	1224	149	\N	0
932	ELLEN		LACHARITY		2019-05-03 00:00:00+00	\N	145	1225	149	\N	0
933	LARRY		CONN		2018-06-06 00:00:00+00	\N	146	1228	150	\N	0
934	JAY		HAMBURGER		2018-06-06 00:00:00+00	\N	146	1229	150	\N	0
935	LUKAS		HYRMAN		2018-06-06 00:00:00+00	\N	146	1230	150	\N	0
936	ROLF		MAURER		2018-06-06 00:00:00+00	\N	146	1231	150	\N	0
937	COLLEEN		SMITH		2018-06-06 00:00:00+00	\N	146	1232	150	\N	0
938	MICHAEL		YOUNG		2018-06-06 00:00:00+00	\N	146	1233	150	\N	0
939	SIMON		HUSSEY		2017-10-30 00:00:00+00	\N	147	1236	151	\N	0
940	CHRIS		MCGREGOR		2016-12-30 00:00:00+00	\N	147	1237	151	\N	0
941	DENNIS		NIELSEN		2017-10-30 00:00:00+00	\N	147	1238	151	\N	0
942	KEVIN		PEERS		2017-10-30 00:00:00+00	\N	147	1239	151	\N	0
943	CLARA		SALAMANCA		2017-10-30 00:00:00+00	\N	147	1240	151	\N	0
944	SHAWN		SORENSON		2018-12-04 00:00:00+00	\N	147	1241	151	\N	0
945	STEFAN		VOLGELFAENGER		2017-10-30 00:00:00+00	\N	147	1242	151	\N	0
946	FRANCES		ANDERSON		2017-10-30 00:00:00+00	\N	147	1243	151	\N	0
947	JASON		DEVINE		2017-10-30 00:00:00+00	\N	147	1244	151	\N	0
948	RYAN		GLUCKMAN		2016-12-30 00:00:00+00	\N	147	1245	151	\N	0
949	CHRISTINE		GUTIERREZ		2016-11-09 00:00:00+00	\N	148	1248	152	\N	0
950	STEPHEN		HOLMES		2017-11-01 00:00:00+00	\N	148	1249	152	\N	0
951	ADAM		JUREWICZ		2018-11-08 00:00:00+00	\N	148	1250	152	\N	0
952	JULIE		ROUSELL		2015-10-21 00:00:00+00	\N	148	1251	152	\N	0
953	CHRISTIE		ADAMUS		2018-11-08 00:00:00+00	\N	148	1252	152	\N	0
954	ARLENE		COLLETT		2015-10-21 00:00:00+00	\N	148	1253	152	\N	0
955	DAN		GARFIELD		2018-11-08 00:00:00+00	\N	148	1254	152	\N	0
956	JACQUELINE		ALLEN		2017-10-17 00:00:00+00	\N	149	1257	153	\N	0
957	WAYNE		PIERPONT		2017-10-17 00:00:00+00	\N	149	1258	153	\N	0
958	NICOLAE		BOARIU		2017-03-31 00:00:00+00	\N	149	1259	153	\N	0
959	IENAS		JAMAL		2015-12-03 00:00:00+00	\N	149	1260	153	\N	0
960	DONNA		LAWRENCE		2014-12-08 00:00:00+00	\N	149	1261	153	\N	0
961	LIUBOV		ZAIKOVA		2019-04-04 00:00:00+00	\N	149	1262	153	\N	0
962	GALYNA		MADORSKY		2019-04-04 00:00:00+00	\N	149	1263	153	\N	0
963	ALISON		AZZANO		2019-04-04 00:00:00+00	\N	149	1264	153	\N	0
\.


--
-- Data for Name: filings; Type: TABLE DATA; Schema: public; Owner: userG5G
--
COPY public.filings (id, filing_date, filing_type, filing_json, payment_id, transaction_id, business_id, submitter_id, colin_event_id, status, payment_completion_date) FROM stdin;
102	2019-08-21 03:12:41.997395+00	lear_epoch	{"filing": {"header": {"name": "lear_epoch"}}}	\N	103	\N	\N	\N	DRAFT	\N
103	2019-08-21 03:12:48.306417+00	lear_epoch	{"filing": {"header": {"name": "lear_epoch"}}}	\N	104	\N	\N	\N	DRAFT	\N
104	2019-08-21 03:12:53.93539+00	lear_epoch	{"filing": {"header": {"name": "lear_epoch"}}}	\N	105	\N	\N	\N	DRAFT	\N
105	2019-08-21 03:12:59.291391+00	lear_epoch	{"filing": {"header": {"name": "lear_epoch"}}}	\N	106	\N	\N	\N	DRAFT	\N
106	2019-08-21 03:13:05.864382+00	lear_epoch	{"filing": {"header": {"name": "lear_epoch"}}}	\N	107	\N	\N	\N	DRAFT	\N
107	2019-08-21 03:13:13.34061+00	lear_epoch	{"filing": {"header": {"name": "lear_epoch"}}}	\N	108	\N	\N	\N	DRAFT	\N
108	2019-08-21 03:13:18.470432+00	lear_epoch	{"filing": {"header": {"name": "lear_epoch"}}}	\N	109	\N	\N	\N	DRAFT	\N
109	2019-08-21 03:13:24.496419+00	lear_epoch	{"filing": {"header": {"name": "lear_epoch"}}}	\N	110	\N	\N	\N	DRAFT	\N
110	2019-08-21 03:13:30.456055+00	lear_epoch	{"filing": {"header": {"name": "lear_epoch"}}}	\N	111	\N	\N	\N	DRAFT	\N
111	2019-08-21 03:13:36.56987+00	lear_epoch	{"filing": {"header": {"name": "lear_epoch"}}}	\N	112	\N	\N	\N	DRAFT	\N
112	2019-08-21 03:13:42.074936+00	lear_epoch	{"filing": {"header": {"name": "lear_epoch"}}}	\N	113	\N	\N	\N	DRAFT	\N
113	2019-08-21 03:13:47.680866+00	lear_epoch	{"filing": {"header": {"name": "lear_epoch"}}}	\N	114	\N	\N	\N	DRAFT	\N
114	2019-08-21 03:13:53.48086+00	lear_epoch	{"filing": {"header": {"name": "lear_epoch"}}}	\N	115	\N	\N	\N	DRAFT	\N
115	2019-08-21 03:13:58.507975+00	lear_epoch	{"filing": {"header": {"name": "lear_epoch"}}}	\N	116	\N	\N	\N	DRAFT	\N
116	2019-08-21 03:14:03.692422+00	lear_epoch	{"filing": {"header": {"name": "lear_epoch"}}}	\N	117	\N	\N	\N	DRAFT	\N
117	2019-08-21 03:14:09.38259+00	lear_epoch	{"filing": {"header": {"name": "lear_epoch"}}}	\N	118	\N	\N	\N	DRAFT	\N
118	2019-08-21 03:14:15.039579+00	lear_epoch	{"filing": {"header": {"name": "lear_epoch"}}}	\N	119	\N	\N	\N	DRAFT	\N
119	2019-08-21 03:14:20.520595+00	lear_epoch	{"filing": {"header": {"name": "lear_epoch"}}}	\N	120	\N	\N	\N	DRAFT	\N
120	2019-08-21 03:14:26.064581+00	lear_epoch	{"filing": {"header": {"name": "lear_epoch"}}}	\N	121	\N	\N	\N	DRAFT	\N
121	2019-08-21 03:14:32.081598+00	lear_epoch	{"filing": {"header": {"name": "lear_epoch"}}}	\N	122	\N	\N	\N	DRAFT	\N
122	2019-08-21 03:14:37.124582+00	lear_epoch	{"filing": {"header": {"name": "lear_epoch"}}}	\N	123	\N	\N	\N	DRAFT	\N
123	2019-08-21 03:14:44.419866+00	lear_epoch	{"filing": {"header": {"name": "lear_epoch"}}}	\N	124	\N	\N	\N	DRAFT	\N
124	2019-08-21 03:14:48.838072+00	lear_epoch	{"filing": {"header": {"name": "lear_epoch"}}}	\N	125	\N	\N	\N	DRAFT	\N
125	2019-08-21 03:14:54.506224+00	lear_epoch	{"filing": {"header": {"name": "lear_epoch"}}}	\N	126	\N	\N	\N	DRAFT	\N
126	2019-08-21 03:15:00.12193+00	lear_epoch	{"filing": {"header": {"name": "lear_epoch"}}}	\N	127	\N	\N	\N	DRAFT	\N
127	2019-08-21 03:15:04.442929+00	lear_epoch	{"filing": {"header": {"name": "lear_epoch"}}}	\N	128	\N	\N	\N	DRAFT	\N
128	2019-08-21 03:15:08.670139+00	lear_epoch	{"filing": {"header": {"name": "lear_epoch"}}}	\N	129	\N	\N	\N	DRAFT	\N
129	2019-08-21 03:15:15.022945+00	lear_epoch	{"filing": {"header": {"name": "lear_epoch"}}}	\N	130	\N	\N	\N	DRAFT	\N
130	2019-08-21 03:15:20.201575+00	lear_epoch	{"filing": {"header": {"name": "lear_epoch"}}}	\N	131	\N	\N	\N	DRAFT	\N
131	2019-08-21 03:15:24.314919+00	lear_epoch	{"filing": {"header": {"name": "lear_epoch"}}}	\N	132	\N	\N	\N	DRAFT	\N
132	2019-08-21 03:15:29.86092+00	lear_epoch	{"filing": {"header": {"name": "lear_epoch"}}}	\N	133	\N	\N	\N	DRAFT	\N
133	2019-08-21 03:15:37.200924+00	lear_epoch	{"filing": {"header": {"name": "lear_epoch"}}}	\N	134	\N	\N	\N	DRAFT	\N
134	2019-08-21 03:15:41.858926+00	lear_epoch	{"filing": {"header": {"name": "lear_epoch"}}}	\N	135	\N	\N	\N	DRAFT	\N
135	2019-08-21 03:15:45.816919+00	lear_epoch	{"filing": {"header": {"name": "lear_epoch"}}}	\N	136	\N	\N	\N	DRAFT	\N
136	2019-08-21 03:15:51.516918+00	lear_epoch	{"filing": {"header": {"name": "lear_epoch"}}}	\N	137	\N	\N	\N	DRAFT	\N
137	2019-08-21 03:15:56.872954+00	lear_epoch	{"filing": {"header": {"name": "lear_epoch"}}}	\N	138	\N	\N	\N	DRAFT	\N
138	2019-08-21 03:16:01.604947+00	lear_epoch	{"filing": {"header": {"name": "lear_epoch"}}}	\N	139	\N	\N	\N	DRAFT	\N
139	2019-08-21 03:16:06.900954+00	lear_epoch	{"filing": {"header": {"name": "lear_epoch"}}}	\N	140	\N	\N	\N	DRAFT	\N
140	2019-08-21 03:16:11.621642+00	lear_epoch	{"filing": {"header": {"name": "lear_epoch"}}}	\N	141	\N	\N	\N	DRAFT	\N
141	2019-08-21 03:16:17.374546+00	lear_epoch	{"filing": {"header": {"name": "lear_epoch"}}}	\N	142	\N	\N	\N	DRAFT	\N
142	2019-08-21 03:16:23.217534+00	lear_epoch	{"filing": {"header": {"name": "lear_epoch"}}}	\N	143	\N	\N	\N	DRAFT	\N
143	2019-08-21 03:16:28.120665+00	lear_epoch	{"filing": {"header": {"name": "lear_epoch"}}}	\N	144	\N	\N	\N	DRAFT	\N
144	2019-08-21 03:16:32.550259+00	lear_epoch	{"filing": {"header": {"name": "lear_epoch"}}}	\N	145	\N	\N	\N	DRAFT	\N
145	2019-08-21 03:16:37.177473+00	lear_epoch	{"filing": {"header": {"name": "lear_epoch"}}}	\N	146	\N	\N	\N	DRAFT	\N
146	2019-08-21 03:16:41.513469+00	lear_epoch	{"filing": {"header": {"name": "lear_epoch"}}}	\N	147	\N	\N	\N	DRAFT	\N
147	2019-08-21 03:16:45.901478+00	lear_epoch	{"filing": {"header": {"name": "lear_epoch"}}}	\N	148	\N	\N	\N	DRAFT	\N
148	2019-08-21 03:16:50.640484+00	lear_epoch	{"filing": {"header": {"name": "lear_epoch"}}}	\N	149	\N	\N	\N	DRAFT	\N
149	2019-08-21 03:16:56.305472+00	lear_epoch	{"filing": {"header": {"name": "lear_epoch"}}}	\N	150	\N	\N	\N	DRAFT	\N
150	2019-08-21 16:16:09.288756+00	lear_epoch	{"filing": {"header": {"name": "lear_epoch"}}}	\N	151	\N	\N	\N	DRAFT	\N
151	2019-08-21 16:16:16.538741+00	lear_epoch	{"filing": {"header": {"name": "lear_epoch"}}}	\N	152	\N	\N	\N	DRAFT	\N
152	2019-08-21 16:16:22.054738+00	lear_epoch	{"filing": {"header": {"name": "lear_epoch"}}}	\N	153	\N	\N	\N	DRAFT	\N
\.

--
-- Data for Name: transaction; Type: TABLE DATA; Schema: public; Owner: userG5G
--
COPY public.transaction (issued_at, id, remote_addr) FROM stdin;
2019-08-20 17:24:19.232727	1	\N
2019-08-20 17:24:24.150925	2	\N
2019-08-20 17:24:28.805395	3	\N
2019-08-20 17:24:34.07458	4	\N
2019-08-20 17:24:39.195228	5	\N
2019-08-20 17:24:43.972386	6	\N
2019-08-20 17:24:49.062643	7	\N
2019-08-20 17:24:55.718613	8	\N
2019-08-20 17:25:02.6771	9	\N
2019-08-20 17:25:10.100198	10	\N
2019-08-20 17:25:16.025354	11	\N
2019-08-20 17:25:25.031002	12	\N
2019-08-20 17:25:30.050843	13	\N
2019-08-20 17:25:33.90521	14	\N
2019-08-20 17:25:38.803175	15	\N
2019-08-20 17:25:45.944402	16	\N
2019-08-20 17:25:50.742088	17	\N
2019-08-20 17:25:55.658657	18	\N
2019-08-20 17:25:59.403467	19	\N
2019-08-20 17:26:03.503416	20	\N
2019-08-20 17:26:08.120884	21	\N
2019-08-20 17:26:18.491843	22	\N
2019-08-20 17:26:23.740724	23	\N
2019-08-20 17:26:28.897805	24	\N
2019-08-20 17:26:34.554738	25	\N
2019-08-20 17:26:38.644501	26	\N
2019-08-20 17:26:43.093047	27	\N
2019-08-20 17:26:55.619777	28	\N
2019-08-20 17:27:04.749704	29	\N
2019-08-20 17:27:13.469428	30	\N
2019-08-20 17:27:26.771798	31	\N
2019-08-20 17:27:41.523144	32	\N
2019-08-20 17:27:51.693587	33	\N
2019-08-20 17:28:03.345112	34	\N
2019-08-20 17:28:14.781455	35	\N
2019-08-20 17:28:26.717134	36	\N
2019-08-20 17:28:33.594558	37	\N
2019-08-20 17:28:38.557566	38	\N
2019-08-20 17:28:42.746529	39	\N
2019-08-20 17:28:47.191784	40	\N
2019-08-20 17:28:51.727509	41	\N
2019-08-20 17:35:57.964081	43	\N
2019-08-20 17:36:05.566671	44	\N
2019-08-20 17:36:09.62673	45	\N
2019-08-20 17:36:13.429178	46	\N
2019-08-20 17:36:17.460159	47	\N
2019-08-20 17:36:22.799389	48	\N
2019-08-20 17:36:43.186134	49	\N
2019-08-20 21:38:23.008363	50	\N
2019-08-20 21:38:27.60629	51	\N
2019-08-20 21:38:32.214791	52	\N
2019-08-20 21:38:37.026317	53	\N
2019-08-20 21:38:42.006456	54	\N
2019-08-20 21:38:46.997059	55	\N
2019-08-20 21:38:52.090081	56	\N
2019-08-20 21:38:56.901695	57	\N
2019-08-20 21:39:01.285091	58	\N
2019-08-20 21:39:06.390226	59	\N
2019-08-20 21:39:11.07792	60	\N
2019-08-20 21:39:15.247467	61	\N
2019-08-20 21:39:19.692586	62	\N
2019-08-20 21:39:23.239194	63	\N
2019-08-20 21:39:27.194751	64	\N
2019-08-20 21:39:31.766318	65	\N
2019-08-20 21:39:36.021554	66	\N
2019-08-20 21:39:40.206981	67	\N
2019-08-20 21:39:44.064882	68	\N
2019-08-20 21:39:47.289685	69	\N
2019-08-20 21:39:50.828756	70	\N
2019-08-20 21:39:55.873727	71	\N
2019-08-20 21:39:59.747202	72	\N
2019-08-20 21:40:03.67475	73	\N
2019-08-20 21:40:08.05931	74	\N
2019-08-20 21:40:11.477664	75	\N
2019-08-20 21:40:14.648442	76	\N
2019-08-20 21:40:19.432371	77	\N
2019-08-20 21:40:23.316507	78	\N
2019-08-20 21:40:26.582174	79	\N
2019-08-20 21:40:30.457643	80	\N
2019-08-20 21:40:35.747739	81	\N
2019-08-20 21:40:39.365781	82	\N
2019-08-20 21:40:42.897419	83	\N
2019-08-20 21:40:47.024545	84	\N
2019-08-20 21:40:51.71243	85	\N
2019-08-20 21:40:55.866785	86	\N
2019-08-20 21:40:59.962263	87	\N
2019-08-20 21:41:03.831312	88	\N
2019-08-20 21:41:08.769685	89	\N
2019-08-20 21:41:13.462351	90	\N
2019-08-20 21:41:18.190574	91	\N
2019-08-20 21:41:21.772232	92	\N
2019-08-20 21:41:25.143238	93	\N
2019-08-20 21:41:28.935904	94	\N
2019-08-20 21:41:32.237263	95	\N
2019-08-20 21:41:35.983477	96	\N
2019-08-20 21:41:40.535528	97	\N
2019-08-20 22:09:33.359711	98	\N
2019-08-20 22:30:06.620336	99	\N
2019-08-20 22:30:53.011089	100	\N
2019-08-20 22:35:18.09712	101	\N
2019-08-21 03:12:41.759237	103	\N
2019-08-21 03:12:47.664416	104	\N
2019-08-21 03:12:53.189386	105	\N
2019-08-21 03:12:59.129391	106	\N
2019-08-21 03:13:05.687396	107	\N
2019-08-21 03:13:11.828028	108	\N
2019-08-21 03:13:18.28467	109	\N
2019-08-21 03:13:24.322766	110	\N
2019-08-21 03:13:29.783087	111	\N
2019-08-21 03:13:35.718047	112	\N
2019-08-21 03:13:41.895007	113	\N
2019-08-21 03:13:47.469867	114	\N
2019-08-21 03:13:52.956851	115	\N
2019-08-21 03:13:57.499864	116	\N
2019-08-21 03:14:02.966854	117	\N
2019-08-21 03:14:09.17759	118	\N
2019-08-21 03:14:14.868739	119	\N
2019-08-21 03:14:19.732623	120	\N
2019-08-21 03:14:25.014579	121	\N
2019-08-21 03:14:31.875588	122	\N
2019-08-21 03:14:36.499579	123	\N
2019-08-21 03:14:43.790591	124	\N
2019-08-21 03:14:48.598847	125	\N
2019-08-21 03:14:53.825891	126	\N
2019-08-21 03:14:59.560168	127	\N
2019-08-21 03:15:03.933181	128	\N
2019-08-21 03:15:08.159938	129	\N
2019-08-21 03:15:14.307935	130	\N
2019-08-21 03:15:19.526132	131	\N
2019-08-21 03:15:24.135127	132	\N
2019-08-21 03:15:29.618939	133	\N
2019-08-21 03:15:36.627932	134	\N
2019-08-21 03:15:41.333007	135	\N
2019-08-21 03:15:45.667141	136	\N
2019-08-21 03:15:50.758934	137	\N
2019-08-21 03:15:56.700945	138	\N
2019-08-21 03:16:01.410071	139	\N
2019-08-21 03:16:06.330959	140	\N
2019-08-21 03:16:11.442542	141	\N
2019-08-21 03:16:17.177544	142	\N
2019-08-21 03:16:22.539553	143	\N
2019-08-21 03:16:27.619787	144	\N
2019-08-21 03:16:32.020055	145	\N
2019-08-21 03:16:36.633469	146	\N
2019-08-21 03:16:41.142481	147	\N
2019-08-21 03:16:45.437595	148	\N
2019-08-21 03:16:49.816473	149	\N
2019-08-21 03:16:56.102474	150	\N
2019-08-21 16:16:09.04874	151	\N
2019-08-21 16:16:15.926743	152	\N
2019-08-21 16:16:21.423977	153	\N
\.

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: userG5G
--

COPY public.users (id, username, firstname, lastname, email, sub, iss, creation_date) FROM stdin;
1	cp0000393	\N	\N	\N	4b23cde9-7904-490b-a931-19b0fd4503b8	https://sso.pathfinder.gov.bc.ca/auth/realms/fcf0kpqr	2019-08-20 22:09:33.364106+00
2	cp0000976	\N	\N	\N	ec547860-06d5-4bea-819b-ec0e319f23de	https://sso.pathfinder.gov.bc.ca/auth/realms/fcf0kpqr	2019-08-20 22:30:06.624495+00
\.


--
-- Data for Name: users_version; Type: TABLE DATA; Schema: public; Owner: userG5G
--

COPY public.users_version (id, username, firstname, lastname, email, sub, iss, creation_date, transaction_id, end_transaction_id, operation_type) FROM stdin;
1	cp0000393	\N	\N	\N	4b23cde9-7904-490b-a931-19b0fd4503b8	https://sso.pathfinder.gov.bc.ca/auth/realms/fcf0kpqr	2019-08-20 22:09:33.364106+00	98	\N	0
2	cp0000976	\N	\N	\N	ec547860-06d5-4bea-819b-ec0e319f23de	https://sso.pathfinder.gov.bc.ca/auth/realms/fcf0kpqr	2019-08-20 22:30:06.624495+00	99	\N	0
\.


--
-- Name: addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userG5G
--

SELECT pg_catalog.setval('public.addresses_id_seq', 1264, true);


--
-- Name: businesses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userG5G
--

SELECT pg_catalog.setval('public.businesses_id_seq', 149, true);


--
-- Name: colin_last_update_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userG5G
--

SELECT pg_catalog.setval('public.colin_last_update_id_seq', 1, false);


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userG5G
--

SELECT pg_catalog.setval('public.comments_id_seq', 1, false);


--
-- Name: directors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userG5G
--

SELECT pg_catalog.setval('public.directors_id_seq', 963, true);


--
-- Name: filings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userG5G
--

SELECT pg_catalog.setval('public.filings_id_seq', 152, true);


--
-- Name: transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userG5G
--

SELECT pg_catalog.setval('public.transaction_id_seq', 153, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userG5G
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: userG5G
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: addresses_version addresses_version_pkey; Type: CONSTRAINT; Schema: public; Owner: userG5G
--

ALTER TABLE ONLY public.addresses_version
    ADD CONSTRAINT addresses_version_pkey PRIMARY KEY (id, transaction_id);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: userG5G
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: businesses businesses_pkey; Type: CONSTRAINT; Schema: public; Owner: userG5G
--

ALTER TABLE ONLY public.businesses
    ADD CONSTRAINT businesses_pkey PRIMARY KEY (id);


--
-- Name: businesses_version businesses_version_pkey; Type: CONSTRAINT; Schema: public; Owner: userG5G
--

ALTER TABLE ONLY public.businesses_version
    ADD CONSTRAINT businesses_version_pkey PRIMARY KEY (id, transaction_id);


--
-- Name: colin_last_update colin_last_update_last_event_id_key; Type: CONSTRAINT; Schema: public; Owner: userG5G
--

ALTER TABLE ONLY public.colin_last_update
    ADD CONSTRAINT colin_last_update_last_event_id_key UNIQUE (last_event_id);


--
-- Name: colin_last_update colin_last_update_pkey; Type: CONSTRAINT; Schema: public; Owner: userG5G
--

ALTER TABLE ONLY public.colin_last_update
    ADD CONSTRAINT colin_last_update_pkey PRIMARY KEY (id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: userG5G
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: directors directors_pkey; Type: CONSTRAINT; Schema: public; Owner: userG5G
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_pkey PRIMARY KEY (id);


--
-- Name: directors_version directors_version_pkey; Type: CONSTRAINT; Schema: public; Owner: userG5G
--

ALTER TABLE ONLY public.directors_version
    ADD CONSTRAINT directors_version_pkey PRIMARY KEY (id, transaction_id);


--
-- Name: filings filings_pkey; Type: CONSTRAINT; Schema: public; Owner: userG5G
--

ALTER TABLE ONLY public.filings
    ADD CONSTRAINT filings_pkey PRIMARY KEY (id);


--
-- Name: transaction transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: userG5G
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: userG5G
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_sub_key; Type: CONSTRAINT; Schema: public; Owner: userG5G
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_sub_key UNIQUE (sub);


--
-- Name: users_version users_version_pkey; Type: CONSTRAINT; Schema: public; Owner: userG5G
--

ALTER TABLE ONLY public.users_version
    ADD CONSTRAINT users_version_pkey PRIMARY KEY (id, transaction_id);


--
-- Name: ix_addresses_address_type; Type: INDEX; Schema: public; Owner: userG5G
--

CREATE INDEX ix_addresses_address_type ON public.addresses USING btree (address_type);


--
-- Name: ix_addresses_business_id; Type: INDEX; Schema: public; Owner: userG5G
--

CREATE INDEX ix_addresses_business_id ON public.addresses USING btree (business_id);


--
-- Name: ix_addresses_street; Type: INDEX; Schema: public; Owner: userG5G
--

CREATE INDEX ix_addresses_street ON public.addresses USING btree (street);


--
-- Name: ix_addresses_version_address_type; Type: INDEX; Schema: public; Owner: userG5G
--

CREATE INDEX ix_addresses_version_address_type ON public.addresses_version USING btree (address_type);


--
-- Name: ix_addresses_version_business_id; Type: INDEX; Schema: public; Owner: userG5G
--

CREATE INDEX ix_addresses_version_business_id ON public.addresses_version USING btree (business_id);


--
-- Name: ix_addresses_version_end_transaction_id; Type: INDEX; Schema: public; Owner: userG5G
--

CREATE INDEX ix_addresses_version_end_transaction_id ON public.addresses_version USING btree (end_transaction_id);


--
-- Name: ix_addresses_version_operation_type; Type: INDEX; Schema: public; Owner: userG5G
--

CREATE INDEX ix_addresses_version_operation_type ON public.addresses_version USING btree (operation_type);


--
-- Name: ix_addresses_version_street; Type: INDEX; Schema: public; Owner: userG5G
--

CREATE INDEX ix_addresses_version_street ON public.addresses_version USING btree (street);


--
-- Name: ix_addresses_version_transaction_id; Type: INDEX; Schema: public; Owner: userG5G
--

CREATE INDEX ix_addresses_version_transaction_id ON public.addresses_version USING btree (transaction_id);


--
-- Name: ix_businesses_identifier; Type: INDEX; Schema: public; Owner: userG5G
--

CREATE INDEX ix_businesses_identifier ON public.businesses USING btree (identifier);


--
-- Name: ix_businesses_legal_name; Type: INDEX; Schema: public; Owner: userG5G
--

CREATE INDEX ix_businesses_legal_name ON public.businesses USING btree (legal_name);


--
-- Name: ix_businesses_tax_id; Type: INDEX; Schema: public; Owner: userG5G
--

CREATE INDEX ix_businesses_tax_id ON public.businesses USING btree (tax_id);


--
-- Name: ix_businesses_version_end_transaction_id; Type: INDEX; Schema: public; Owner: userG5G
--

CREATE INDEX ix_businesses_version_end_transaction_id ON public.businesses_version USING btree (end_transaction_id);


--
-- Name: ix_businesses_version_identifier; Type: INDEX; Schema: public; Owner: userG5G
--

CREATE INDEX ix_businesses_version_identifier ON public.businesses_version USING btree (identifier);


--
-- Name: ix_businesses_version_legal_name; Type: INDEX; Schema: public; Owner: userG5G
--

CREATE INDEX ix_businesses_version_legal_name ON public.businesses_version USING btree (legal_name);


--
-- Name: ix_businesses_version_operation_type; Type: INDEX; Schema: public; Owner: userG5G
--

CREATE INDEX ix_businesses_version_operation_type ON public.businesses_version USING btree (operation_type);


--
-- Name: ix_businesses_version_tax_id; Type: INDEX; Schema: public; Owner: userG5G
--

CREATE INDEX ix_businesses_version_tax_id ON public.businesses_version USING btree (tax_id);


--
-- Name: ix_businesses_version_transaction_id; Type: INDEX; Schema: public; Owner: userG5G
--

CREATE INDEX ix_businesses_version_transaction_id ON public.businesses_version USING btree (transaction_id);


--
-- Name: ix_comments_business_id; Type: INDEX; Schema: public; Owner: userG5G
--

CREATE INDEX ix_comments_business_id ON public.comments USING btree (business_id);


--
-- Name: ix_comments_staff_id; Type: INDEX; Schema: public; Owner: userG5G
--

CREATE INDEX ix_comments_staff_id ON public.comments USING btree (staff_id);


--
-- Name: ix_directors_business_id; Type: INDEX; Schema: public; Owner: userG5G
--

CREATE INDEX ix_directors_business_id ON public.directors USING btree (business_id);


--
-- Name: ix_directors_first_name; Type: INDEX; Schema: public; Owner: userG5G
--

CREATE INDEX ix_directors_first_name ON public.directors USING btree (first_name);


--
-- Name: ix_directors_middle_initial; Type: INDEX; Schema: public; Owner: userG5G
--

CREATE INDEX ix_directors_middle_initial ON public.directors USING btree (middle_initial);


--
-- Name: ix_directors_version_business_id; Type: INDEX; Schema: public; Owner: userG5G
--

CREATE INDEX ix_directors_version_business_id ON public.directors_version USING btree (business_id);


--
-- Name: ix_directors_version_end_transaction_id; Type: INDEX; Schema: public; Owner: userG5G
--

CREATE INDEX ix_directors_version_end_transaction_id ON public.directors_version USING btree (end_transaction_id);


--
-- Name: ix_directors_version_first_name; Type: INDEX; Schema: public; Owner: userG5G
--

CREATE INDEX ix_directors_version_first_name ON public.directors_version USING btree (first_name);


--
-- Name: ix_directors_version_middle_initial; Type: INDEX; Schema: public; Owner: userG5G
--

CREATE INDEX ix_directors_version_middle_initial ON public.directors_version USING btree (middle_initial);


--
-- Name: ix_directors_version_operation_type; Type: INDEX; Schema: public; Owner: userG5G
--

CREATE INDEX ix_directors_version_operation_type ON public.directors_version USING btree (operation_type);


--
-- Name: ix_directors_version_transaction_id; Type: INDEX; Schema: public; Owner: userG5G
--

CREATE INDEX ix_directors_version_transaction_id ON public.directors_version USING btree (transaction_id);


--
-- Name: ix_users_username; Type: INDEX; Schema: public; Owner: userG5G
--

CREATE INDEX ix_users_username ON public.users USING btree (username);


--
-- Name: ix_users_version_end_transaction_id; Type: INDEX; Schema: public; Owner: userG5G
--

CREATE INDEX ix_users_version_end_transaction_id ON public.users_version USING btree (end_transaction_id);


--
-- Name: ix_users_version_operation_type; Type: INDEX; Schema: public; Owner: userG5G
--

CREATE INDEX ix_users_version_operation_type ON public.users_version USING btree (operation_type);


--
-- Name: ix_users_version_transaction_id; Type: INDEX; Schema: public; Owner: userG5G
--

CREATE INDEX ix_users_version_transaction_id ON public.users_version USING btree (transaction_id);


--
-- Name: ix_users_version_username; Type: INDEX; Schema: public; Owner: userG5G
--

CREATE INDEX ix_users_version_username ON public.users_version USING btree (username);


--
-- Name: addresses addresses_business_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: userG5G
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_business_id_fkey FOREIGN KEY (business_id) REFERENCES public.businesses(id);


--
-- Name: businesses businesses_submitter_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: userG5G
--

ALTER TABLE ONLY public.businesses
    ADD CONSTRAINT businesses_submitter_userid_fkey FOREIGN KEY (submitter_userid) REFERENCES public.users(id);


--
-- Name: comments comments_business_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: userG5G
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_business_id_fkey FOREIGN KEY (business_id) REFERENCES public.businesses(id);


--
-- Name: comments comments_staff_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: userG5G
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_staff_id_fkey FOREIGN KEY (staff_id) REFERENCES public.users(id);


--
-- Name: directors directors_address_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: userG5G
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_address_id_fkey FOREIGN KEY (address_id) REFERENCES public.addresses(id);


--
-- Name: directors directors_business_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: userG5G
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_business_id_fkey FOREIGN KEY (business_id) REFERENCES public.businesses(id);


--
-- Name: filings filings_business_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: userG5G
--

ALTER TABLE ONLY public.filings
    ADD CONSTRAINT filings_business_id_fkey FOREIGN KEY (business_id) REFERENCES public.businesses(id);


--
-- Name: filings filings_submitter_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: userG5G
--

ALTER TABLE ONLY public.filings
    ADD CONSTRAINT filings_submitter_id_fkey FOREIGN KEY (submitter_id) REFERENCES public.users(id);


--
-- Name: filings filings_transaction_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: userG5G
--

ALTER TABLE ONLY public.filings
    ADD CONSTRAINT filings_transaction_id_fkey FOREIGN KEY (transaction_id) REFERENCES public.transaction(id);


--
-- PostgreSQL database dump complete
--

update public.businesses set legal_type = 'BC' where id in (select id from public.businesses order by founding_date asc limit 25);
update public.businesses set legal_type = 'CP' where id in (select id from public.businesses order by founding_date desc limit 25);
update public.businesses set founding_date = now() - interval '366 days';
update public.businesses_version set legal_type=public.businesses.legal_type from public.businesses  where public.businesses_version.id = public.businesses.id;

