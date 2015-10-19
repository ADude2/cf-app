--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: unaccent; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;


--
-- Name: EXTENSION unaccent; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: friendly_id_slugs; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE friendly_id_slugs (
    id integer NOT NULL,
    slug character varying NOT NULL,
    sluggable_id integer NOT NULL,
    sluggable_type character varying(50),
    scope character varying,
    created_at timestamp without time zone
);


--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE friendly_id_slugs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE friendly_id_slugs_id_seq OWNED BY friendly_id_slugs.id;


--
-- Name: gym_listings; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE gym_listings (
    id integer NOT NULL,
    name character varying,
    website character varying,
    address character varying,
    city character varying,
    state character varying,
    zip character varying,
    country character varying,
    lat double precision,
    long double precision,
    unique_id integer,
    raw_json text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: gym_listings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE gym_listings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: gym_listings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE gym_listings_id_seq OWNED BY gym_listings.id;


--
-- Name: gyms; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE gyms (
    id integer NOT NULL,
    name character varying,
    website character varying,
    address character varying,
    city character varying,
    state character varying,
    zip character varying,
    country character varying,
    lat double precision,
    long double precision,
    unique_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    slug character varying,
    tsv tsvector,
    average_rating double precision
);


--
-- Name: gyms_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE gyms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: gyms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE gyms_id_seq OWNED BY gyms.id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE reviews (
    id integer NOT NULL,
    user_id integer,
    gym_id integer,
    content text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    score double precision DEFAULT 0.0,
    coaching double precision DEFAULT 0.0,
    equipment double precision DEFAULT 0.0,
    pricing double precision DEFAULT 0.0,
    location double precision DEFAULT 0.0
);


--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE reviews_id_seq OWNED BY reviews.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    user_name character varying,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    role character varying,
    slug character varying
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY friendly_id_slugs ALTER COLUMN id SET DEFAULT nextval('friendly_id_slugs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY gym_listings ALTER COLUMN id SET DEFAULT nextval('gym_listings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY gyms ALTER COLUMN id SET DEFAULT nextval('gyms_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY reviews ALTER COLUMN id SET DEFAULT nextval('reviews_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: friendly_id_slugs_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY friendly_id_slugs
    ADD CONSTRAINT friendly_id_slugs_pkey PRIMARY KEY (id);


--
-- Name: gym_listings_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY gym_listings
    ADD CONSTRAINT gym_listings_pkey PRIMARY KEY (id);


--
-- Name: gyms_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY gyms
    ADD CONSTRAINT gyms_pkey PRIMARY KEY (id);


--
-- Name: reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type ON friendly_id_slugs USING btree (slug, sluggable_type);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope ON friendly_id_slugs USING btree (slug, sluggable_type, scope);


--
-- Name: index_friendly_id_slugs_on_sluggable_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_id ON friendly_id_slugs USING btree (sluggable_id);


--
-- Name: index_friendly_id_slugs_on_sluggable_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_type ON friendly_id_slugs USING btree (sluggable_type);


--
-- Name: index_gyms_on_average_rating; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_gyms_on_average_rating ON gyms USING btree (average_rating);


--
-- Name: index_gyms_on_city; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_gyms_on_city ON gyms USING btree (city);


--
-- Name: index_gyms_on_country; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_gyms_on_country ON gyms USING btree (country);


--
-- Name: index_gyms_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_gyms_on_name ON gyms USING btree (name);


--
-- Name: index_gyms_on_slug; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_gyms_on_slug ON gyms USING btree (slug);


--
-- Name: index_gyms_on_state; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_gyms_on_state ON gyms USING btree (state);


--
-- Name: index_gyms_on_tsv; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_gyms_on_tsv ON gyms USING gin (tsv);


--
-- Name: index_gyms_on_unique_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_gyms_on_unique_id ON gyms USING btree (unique_id);


--
-- Name: index_reviews_on_gym_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_reviews_on_gym_id ON reviews USING btree (gym_id);


--
-- Name: index_reviews_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_reviews_on_user_id ON reviews USING btree (user_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: index_users_on_slug; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_on_slug ON users USING btree (slug);


--
-- Name: index_users_on_user_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_user_name ON users USING btree (user_name);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: tsvectorupdate; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER tsvectorupdate BEFORE INSERT OR UPDATE ON gyms FOR EACH ROW EXECUTE PROCEDURE tsvector_update_trigger('tsv', 'pg_catalog.english', 'name', 'city', 'state', 'country');


--
-- Name: fk_rails_6c9548e8b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY reviews
    ADD CONSTRAINT fk_rails_6c9548e8b1 FOREIGN KEY (gym_id) REFERENCES gyms(id);


--
-- Name: fk_rails_74a66bd6c5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY reviews
    ADD CONSTRAINT fk_rails_74a66bd6c5 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20150809151413');

INSERT INTO schema_migrations (version) VALUES ('20150813233925');

INSERT INTO schema_migrations (version) VALUES ('20150814001008');

INSERT INTO schema_migrations (version) VALUES ('20150827210646');

INSERT INTO schema_migrations (version) VALUES ('20150908221633');

INSERT INTO schema_migrations (version) VALUES ('20150909183049');

INSERT INTO schema_migrations (version) VALUES ('20150912194037');

INSERT INTO schema_migrations (version) VALUES ('20150912194500');

INSERT INTO schema_migrations (version) VALUES ('20150919152704');

INSERT INTO schema_migrations (version) VALUES ('20150919232551');

INSERT INTO schema_migrations (version) VALUES ('20150920231323');

INSERT INTO schema_migrations (version) VALUES ('20151003174724');

INSERT INTO schema_migrations (version) VALUES ('20151019223030');

