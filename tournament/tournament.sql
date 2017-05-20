-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

--drop table matches;
--drop table players;

create table players (id serial primary key, name text);

create table matches (id serial primary key, 
	winner_id integer references players(id), 
	loser_id integer references players(id));

CREATE VIEW results AS SELECT players.id, players.name,       
	(SELECT Count(matches.winner_id) FROM matches WHERE matches.winner_id = players.id) AS wins,       
	(SELECT Count(matches.id) FROM matches WHERE matches.loser_id = players.id 
		OR matches.winner_id = players.id) AS matches FROM players