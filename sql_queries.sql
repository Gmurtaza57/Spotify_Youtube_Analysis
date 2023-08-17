-- 1️⃣ Most viewed YouTube track.
SELECT Track, Views
FROM cleaned_dataset
WHERE VIEWS = (
    SELECT MAX(VIEWS)
    FROM cleaned_dataset
)
LIMIT 1;

-- 2️⃣ Most streamed Spotify track.
SELECT Track, Stream
FROM cleaned_dataset
WHERE Stream = (
    SELECT MAX(Stream)
    FROM cleaned_dataset
)
LIMIT 1;

-- 3️⃣ Top 5 songs with the highest EnergyLiveness ratio.
SELECT Track, EnergyLiveness
FROM cleaned_dataset
ORDER BY Energy/Liveness DESC
LIMIT 5;

-- 4️⃣ Platform analysis for Black Eyed Peas' tracks.
SELECT
    COUNT(Track) AS TrackCount,
    most_playedon
FROM
    cleaned_dataset
WHERE
    Artist = 'Black Eyed Peas'
GROUP BY
    most_playedon;

-- 5️⃣ Most liked Gorillaz song on YouTube with Energy and Tempo data.
SELECT Track, MAX(Likes), Energy, Tempo
FROM cleaned_dataset
WHERE Artist="Gorillaz"
LIMIT 1;

-- 6️⃣ Prominence of album types on Spotify.
SELECT
    Album_type,
    COUNT(Album_type) AS AlbumCount
FROM
    cleaned_dataset
GROUP BY
    Album_type;

-- 7️⃣ Selection of top 5 songs for Spotify's announcement.
SELECT
    Track,
    (Views + Stream) AS TotalViews
FROM
    cleaned_dataset
ORDER BY
    TotalViews DESC
LIMIT 5;
