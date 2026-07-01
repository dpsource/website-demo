DROP DATABASE IF EXISTS real_madrid;
CREATE DATABASE real_madrid DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE real_madrid;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(64) NOT NULL,
    role VARCHAR(20) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE players (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    number INT NOT NULL,
    position VARCHAR(100) NOT NULL,
    image TEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE stats (
    id INT AUTO_INCREMENT PRIMARY KEY,
    player_id INT NOT NULL UNIQUE,
    matches INT NOT NULL DEFAULT 0,
    goals INT NOT NULL DEFAULT 0,
    assists INT NOT NULL DEFAULT 0,
    yellow_cards INT NOT NULL DEFAULT 0,
    red_cards INT NOT NULL DEFAULT 0,
    FOREIGN KEY (player_id) REFERENCES players(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE trophies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    count INT NOT NULL DEFAULT 0,
    image TEXT,
    seasons TEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ===== KORISNICI =====
INSERT INTO users(username,password,role) VALUES
('admin','240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9','admin'),
('user','e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446','user');

-- ===== IGRAČI =====
-- Golmani
INSERT INTO players(id,name,number,position,image) VALUES
(1,'Thibaut Courtois',1,'Golman','https://assets.realmadrid.com/is/image/realmadrid/2025%20COURTOIS_EQUIPO_CARITA_380x501%20%E2%80%93%201?$Desktop$&fit=wrap&wid=288&hei=384'),
(2,'Andriy Lunin',13,'Golman','https://assets.realmadrid.com/is/image/realmadrid/2025%20LUNIN_EQUIPO_CARITA_380x501?$Desktop$&fit=wrap&wid=288&hei=384');

-- Odbrana
INSERT INTO players(id,name,number,position,image) VALUES
(3,'Carvajal',2,'Desni bek','https://assets.realmadrid.com/is/image/realmadrid/2025%20CARVAJAL_EQUIPO_CARITA_380x501%20%E2%80%93%206?$Desktop$&fit=wrap&wid=288&hei=384'),
(4,'Éder Militão',3,'Stoper','https://assets.realmadrid.com/is/image/realmadrid/2025%20MILITAO_EQUIPO_CARITA_380x501%20%E2%80%93%2013?$Desktop$&fit=wrap&wid=288&hei=384'),
(5,'Alaba',4,'Lijevi bek','https://assets.realmadrid.com/is/image/realmadrid/2025%20ALABA_EQUIPO_CARITA_380x501%20%E2%80%93%201?$Desktop$&fit=wrap&wid=288&hei=384'),
(6,'Trent Alexander-Arnold',12,'Desni bek','https://assets.realmadrid.com/is/image/realmadrid/2025%20TRENT_EQUIPO_CARITA_380x501%20v2?$Desktop$&fit=wrap&wid=288&hei=384'),
(7,'Marco Asensio',7,'Krilni napadač','https://assets.realmadrid.com/is/image/realmadrid/2025%20ASENCIO_EQUIPO_CARITA_380x501%20%E2%80%93%203?$Desktop$&fit=wrap&wid=288&hei=384'),
(8,'Álvaro Carreras',27,'Stoper','https://assets.realmadrid.com/is/image/realmadrid/2025%20CARRERAS_EQUIPO_CARITA_380x501%20%E2%80%93%202?$Desktop$&fit=wrap&wid=288&hei=384'),
(9,'Fran García',20,'Lijevi bek','https://assets.realmadrid.com/is/image/realmadrid/2025%20FRAN_GARCIA_EQUIPO_CARITA_380x501%20%E2%80%93%201?$Desktop$&fit=wrap&wid=288&hei=384'),
(10,'Antonio Rüdiger',22,'Stoper','https://assets.realmadrid.com/is/image/realmadrid/2025%20RUDIGUER_EQUIPO_CARITA_380x501%20%E2%80%93%202?$Desktop$&fit=wrap&wid=288&hei=384'),
(11,'Ferland Mendy',23,'Lijevi bek','https://assets.realmadrid.com/is/image/realmadrid/2025%20MENDY_EQUIPO_CARITA_380x501%20%E2%80%93%201?$Desktop$&fit=wrap&wid=288&hei=384'),
(12,'Dean Huijsen',6,'Stoper','https://assets.realmadrid.com/is/image/realmadrid/2025%20HUIJSEN_EQUIPO_CARITA_380x501%20%E2%80%93%201?$Desktop$&fit=wrap&wid=288&hei=384');

-- Vezni
INSERT INTO players(id,name,number,position,image) VALUES
(13,'Jude Bellingham',5,'Središnji vezni','https://assets.realmadrid.com/is/image/realmadrid/2025%20BELLINGHAM_EQUIPO_CARITA_380x501%20%E2%80%93%201?$Desktop$&fit=wrap&wid=288&hei=384'),
(14,'Eduardo Camavinga',6,'Defenzivni vezni','https://assets.realmadrid.com/is/image/realmadrid/2025%20CAMAVINGA_EQUIPO_CARITA_380x501?$Desktop$&fit=wrap&wid=288&hei=384'),
(15,'Federico Valverde',8,'Središnji vezni','https://assets.realmadrid.com/is/image/realmadrid/2025%20VALVERDE_EQUIPO_CARITA_380x501?$Desktop$&fit=wrap&wid=288&hei=384'),
(16,'Aurélien Tchouaméni',14,'Defenzivni vezni','https://assets.realmadrid.com/is/image/realmadrid/2025%20TCHOUAMENI_EQUIPO_CARITA_380x501?$Desktop$&fit=wrap&wid=288&hei=384'),
(17,'Arda Güler',15,'Središnji vezni','https://assets.realmadrid.com/is/image/realmadrid/2025%20ARDA_EQUIPO_CARITA_380x501?$Desktop$&fit=wrap&wid=288&hei=384'),
(18,'Dani Ceballos',19,'Ofenzivni vezni','https://assets.realmadrid.com/is/image/realmadrid/2025%20CEBALLOS_EQUIPO_CARITA_380x501?$Desktop$&fit=wrap&wid=288&hei=384');

-- Napadači
INSERT INTO players(id,name,number,position,image) VALUES
(19,'Vinícius Jr.',7,'Krilni napadač','https://assets.realmadrid.com/is/image/realmadrid/2025%20VINI_EQUIPO_CARITA_380x501?$Desktop$&fit=wrap&wid=288&hei=384'),
(20,'Kylian Mbappé',9,'Centarfor','https://assets.realmadrid.com/is/image/realmadrid/2025%20MBAPPE_EQUIPO_CARITA_380x501?$Desktop$&fit=wrap&wid=288&hei=384'),
(21,'Rodrygo',11,'Krilni napadač','https://assets.realmadrid.com/is/image/realmadrid/2025%20RODRYGO_EQUIPO_CARITA_380x501?$Desktop$&fit=wrap&wid=288&hei=384'),
(22,'Gonzalo García',32,'Centarfor','https://assets.realmadrid.com/is/image/realmadrid/2025%20GONZALO_EQUIPO_CARITA_380x501?$Desktop$&fit=wrap&wid=288&hei=384'),
(23,'Brahim Díaz',21,'Krilni napadač','https://assets.realmadrid.com/is/image/realmadrid/2025%20BRAHIM_EQUIPO_CARITA_380x501?$Desktop$&fit=wrap&wid=288&hei=384'),
(24,'Franco Mastantuono',10,'Centarfor','https://assets.realmadrid.com/is/image/realmadrid/2025%20Mastantuono_EQUIPO_CARITA_380x501?$Desktop$&fit=wrap&wid=288&hei=384');

-- ===== STATISTIKE (sezona 2024/25) =====
INSERT INTO stats(player_id,matches,goals,assists,yellow_cards,red_cards) VALUES
-- Golmani
(1,24,0,0,1,0),
(2,10,0,0,0,0),
-- Odbrana
(3,14,1,3,4,0),
(4,12,1,0,3,0),
(5,10,0,2,1,0),
(6,22,2,5,3,0),
(7,15,4,2,2,0),
(8,18,1,2,3,0),
(9,20,0,3,4,0),
(10,21,1,0,5,0),
(11,16,0,1,2,0),
(12,14,0,1,2,0),
-- Vezni
(13,23,8,7,4,0),
(14,18,1,3,5,0),
(15,24,5,6,3,0),
(16,19,2,2,6,1),
(17,17,4,3,1,0),
(18,12,1,1,2,0),
-- Napadači
(19,25,12,9,6,0),
(20,26,18,5,2,0),
(21,24,9,8,1,0),
(22,10,3,1,0,0),
(23,19,6,4,1,0),
(24,8,2,2,0,0);

-- ===== TROFEJI =====
INSERT INTO trophies(id,name,count,image,seasons) VALUES
(1,'UEFA Champions League',15,'https://assets.realmadrid.com/is/image/realmadrid/champions?$Desktop$&fit=wrap',
 '1955/56,1956/57,1957/58,1958/59,1959/60,1965/66,1997/98,1999/00,2001/02,2013/14,2015/16,2016/17,2017/18,2021/22,2023/24'),
(2,'La Liga',36,'https://assets.realmadrid.com/is/image/realmadrid/Liga-1?$Desktop$&fit=wrap',
 '1931/32,1932/33,1953/54,1954/55,1956/57,1957/58,1960/61,1961/62,1962/63,1963/64,1964/65,1966/67,1967/68,1968/69,1971/72,1974/75,1975/76,1977/78,1978/79,1979/80,1985/86,1986/87,1987/88,1988/89,1989/90,1994/95,1996/97,2000/01,2002/03,2006/07,2007/08,2011/12,2016/17,2019/20,2021/22,2023/24'),
(3,'Copa del Rey',20,'https://assets.realmadrid.com/is/image/realmadrid/CopaRey?$Desktop$&fit=wrap',
 '1905,1906,1907,1908,1917,1934,1936,1946,1947,1962,1970,1974,1975,1980,1982,1989,1993,2011,2014,2023'),
(4,'FIFA Club World Cup',9,'https://assets.realmadrid.com/is/image/realmadrid/MundialClubes?$Desktop$&fit=wrap',
 '1960,1998,2002,2014,2016,2017,2018,2022,2024'),
(5,'European Super Cup',6,'https://assets.realmadrid.com/is/image/realmadrid/SupercopaEuropa?$Desktop$&fit=wrap',
 '2002,2014,2016,2017,2022,2024'),
(6,'Spanish Super Cup',13,'https://assets.realmadrid.com/is/image/realmadrid/SupercopaEspana?$Desktop$&fit=wrap',
 '1988,1989,1990,1993,1997,2001,2003,2008,2012,2017,2020,2022,2024'),
(7,'UEFA Cup (Intercities Fairs)',2,'https://assets.realmadrid.com/is/image/realmadrid/CopaUEFA?$Desktop$&fit=wrap',
 '1985,1986'),
(8,'Copa de la Liga',1,'https://assets.realmadrid.com/is/image/realmadrid/CopaLiga?$Desktop$&fit=wrap',
 '1985'),
(9,'Small World Cup',2,'https://assets.realmadrid.com/is/image/realmadrid/PequenaCopaMundo?$Desktop$&fit=wrap',
 '1952,1956'),
(10,'Latin Cup',2,'https://assets.realmadrid.com/is/image/realmadrid/CopaLatina?$Desktop$&fit=wrap',
 '1955,1957'),
(11,'Ibero-American Cup',1,'https://assets.realmadrid.com/is/image/realmadrid/CopaIberoamericana?$Desktop$&fit=wrap',
 '1994'),
(12,'Regional Championship',18,'https://assets.realmadrid.com/is/image/realmadrid/CampeonatosRegionales?$Desktop$&fit=wrap',
 '1902/03,1904/05,1905/06,1906/07,1907/08,1908/09,1909/10,1911/12,1912/13,1913/14,1914/15,1915/16,1916/17,1917/18,1919/20,1921/22,1922/23,1929/30'),
(13,'Mancomunados Trophy',1,'https://assets.realmadrid.com/is/image/realmadrid/TrofeoMancomunado?$Desktop$&fit=wrap',
 '1931'),
(14,'Best Club of the 20th Century',1,'https://assets.realmadrid.com/is/image/realmadrid/mejor-club-del-siglo-xx?$Desktop$&fit=wrap',
 '2000');
