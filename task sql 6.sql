Create database soundcloud_db ; 
Use soundcloud_db ; 

CREATE TABLE users (
    user_id INTEGER PRIMARY KEY,
    username VARCHAR(100),
    email VARCHAR(200),
    join_date DATE,
    country VARCHAR(200)
);

Select * from tracks ; 

CREATE TABLE playlists (
    playlist_id INTEGER PRIMARY KEY,
    user_id INTEGER,
    name VARCHAR(200),
    created_at DATE,
    num_tracks INT,
    FOREIGN KEY (user_id)
        REFERENCES users (user_id)
);

CREATE TABLE tracks (
    track_id INT PRIMARY KEY,
    user_id INT,
    title VARCHAR(100),
    genre VARCHAR(50),
    upload_date DATE,
    plays INT,
    duration_sec INT,
    FOREIGN KEY (user_id)
        REFERENCES users (user_id)
);
SELECT 
    title
FROM
    tracks
WHERE
    track_id IN (SELECT 
            track_id
        FROM
            tracks
                JOIN
            users ON users.user_id = tracks.user_id
        WHERE
            country = 'USA');
            

SELECT 
    playlists.playlist_id, playlists.user_id, tracks.title
FROM
    playlists
        JOIN
    users ON users.user_id = playlists.user_id
        JOIN
    tracks ON playlists.user_id = tracks.user_id
WHERE
    tracks.plays = (SELECT 
            MAX(plays)
        FROM
            tracks);
            
SELECT 
    tracks.title, tracks.duration_sec
FROM
    tracks
WHERE
    tracks.duration_sec > (SELECT 
            AVG(tracks.duration_sec)
        FROM
            tracks);
            
            
SELECT 
    playlists.playlist_id, playlists.name
FROM
    playlists
WHERE
    (SELECT 
            COUNT(num_tracks)
        FROM
            playlists);

 
 


