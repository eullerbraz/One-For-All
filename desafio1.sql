DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE plans(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(15) NOT NULL,
    price DOUBLE NOT NULL
);

CREATE TABLE users(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    plan_id INT NOT NULL,

    CONSTRAINT FOREIGN KEY (plan_id) REFERENCES SpotifyClone.plans(id)
);

CREATE TABLE artists(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE albums(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    artist_id INT NOT NULL,

    CONSTRAINT FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artists(id)
);

CREATE TABLE songs(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    album_id INT NOT NULL,

    CONSTRAINT FOREIGN KEY (album_id) REFERENCES SpotifyClone.albums(id)
);

CREATE TABLE users_artists(
    user_id INT NOT NULL,
    artist_id INT NOT NULL,

    PRIMARY KEY (user_id, artist_id),
    CONSTRAINT FOREIGN KEY (user_id) REFERENCES SpotifyClone.users(id),
    CONSTRAINT FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artists(id)
);

CREATE TABLE users_songs(
    user_id INT NOT NULL,
    song_id INT NOT NULL,

    PRIMARY KEY (user_id, song_id),
    CONSTRAINT FOREIGN KEY (user_id) REFERENCES SpotifyClone.users(id),
    CONSTRAINT FOREIGN KEY (song_id) REFERENCES SpotifyClone.songs(id)
);

INSERT INTO SpotifyClone.plans (name, price)
VALUES
    ('gratuito', 0),
    ('universitário', 5.99),
    ('familiar', 7.99);

INSERT INTO SpotifyClone.users (name, age, plan_id)
VALUES
    ('Thati', 23, 1),
    ('Cintia', 35, 3),
    ('Bill', 20, 2),
    ('Roger', 45, 1);

INSERT INTO SpotifyClone.artists (name)
VALUES
    ('Walter Phoenix'),
    ('Peter Strong'),
    ('Lance Day'),
    ('Freedie Shannon');

INSERT INTO SpotifyClone.albums (name, artist_id)
VALUES
    ('Envious', 1),
    ('Exuberant', 1),
    ('Hallowed Steam', 2),
    ('Incandescent', 3),
    ('Temporary Culture', 4);

INSERT INTO SpotifyClone.songs (name, album_id)
VALUES
    ('Soul For Us', 1),
    ('Reflections Of Magic', 1),
    ('Dance With Her Own', 1),
    ('Troubles Of My Inner Fire', 2),
    ('Time', 2),
    ('Magic Circus', 3),
    ('Honey, So Do I', 3),
    ('Sweetie, Let\'s Go Wild', 3),
    ('She Knows', 3),
    ('Fantasy For Me', 4),
    ('Celebration Of More', 4),
    ('Rock His Everything', 4),
    ('Home Forever', 4),
    ('Diamond Power', 4),
    ('Honey, Let\'s Be Silly', 4),
    ('Thang Of Thunder', 5),
    ('Words Of Her Life', 5),
    ('Without My Streets', 5);
    
INSERT INTO SpotifyClone.users_artists (user_id, artist_id)
VALUES
    (1, 1),
    (1, 4),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (3, 1),
    (4, 4);
    
INSERT INTO SpotifyClone.users_songs (user_id, song_id)
VALUES
    (1, 1),
    (1, 6),
    (1, 14),
    (1, 16),
    (2, 13),
    (2, 17),
    (2, 2),
    (2, 15),
    (3, 4),
    (3, 16),
    (3, 6),
    (4, 3),
    (4, 18),
    (4, 11);
