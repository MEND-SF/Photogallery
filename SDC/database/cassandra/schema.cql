DROP KEYSPACE IF EXISTS photogallery;

CREATE KEYSPACE photogallery WITH replication = 
  {'class' : 'SimpleStrategy', 'replication_factor': '2'};

USE photogallery;

CREATE TABLE listings (
  listing_id bigint,
  title text,
  hostname text,
  address text,
  city text,
  state text,
  PRIMARY KEY (listing_id, hostname)
);

CREATE TABLE photos (
  photo_id bigint,
  listing_id int,
  description text,
  url text,
  resolution text,
  PRIMARY KEY (listing_id, photo_id)
);

CREATE TABLE users (
  user_id bigint,
  first_name text,
  last_name text,
  username text,
  PRIMARY KEY (user_id, username)
);

CREATE TABLE liked_photos (
  photo_id bigint,
  user_id bigint,
  PRIMARY KEY (photo_id, user_id)
);
