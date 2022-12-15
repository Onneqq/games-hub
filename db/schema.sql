CREATE DATABASE game_hub_db;
\c game_hub_db

CREATE TABLE games(
  id SERIAL PRIMARY KEY,
  name TEXT,
  image_url TEXT,
  game_description TEXT,
  genre TEXT,
  review_score INTEGER
);

INSERT INTO games(name, image_url, game_description, genre, review_score)
VALUES
('Halo 3', 'https://assets.reedpopcdn.com/digitalfoundry-2020-halo-3-master-chief-collection-tech-review-1594984762293.jpg/BROK/thumbnail/1600x900/format/jpg/quality/80/digitalfoundry-2020-halo-3-master-chief-collection-tech-review-1594984762293.jpg', 'Halo 3s story centers on the interstellar war between twenty-sixth century humanity, a collection of alien races known as the Covenant, and the alien parasite Flood. The player assumes the role of the Master Chief, a cybernetically enhanced supersoldier, as he battles the Covenant and the Flood.', 'FPS', 9),
('RuneScape', 'https://www.runescape.com/img/rsp777/social-share-fb.jpg?1', 'Old School RuneScape is an MMORPG with adventure elements. It features a persistent world in which players can interact with each other and the environment. The basic mechanics are largely the same as RuneScape on 10 August 2007.', 'MMORPG', 8),
('Call of Duty: Warzone 2', 'https://static.wikia.nocookie.net/callofduty/images/8/87/Warzone2_Artwork_CoDWarzone2.jpg/revision/latest?cb=20221115193041', 'Similar to its predecessor, in Warzone 2.0s primary game mode, Battle Royale, players compete in a continuously shrinking map to be the last player remaining. Players parachute onto a large game map, where they encounter other players.', 'FPS/Battle Royale', 6);

CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  username TEXT,
  email TEXT
);

ALTER TABLE users ADD COLUMN password_digest TEXT;

CREATE TABLE likes(
  id SERIAL PRIMARY KEY,
  user_id INTEGER,
  game_id INTEGER
);

ALTER TABLE likes
ADD CONSTRAINT unique_likes
UNIQUE(user_id, game_id);


-- Testing

-- lists games in order of number of likes
  SELECT
  game_id,
  COUNT(*) AS number_of_likes
  FROM likes
  GROUP BY game_id
  ORDER BY number_of_likes DESC;


CREATE TABLE reviews(
  id SERIAL PRIMARY KEY,
  user_id INTEGER,
  game_id INTEGER,
  review TEXT
);
