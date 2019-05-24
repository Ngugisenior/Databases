SELECT
    t2.hid,
    h.name,
    t2.score
FROM
    (SELECT
        SUM(t1.maxscore) AS score,
        t1.hid as hid
    FROM
        (SELECT
            MAX(score) AS maxscore,
            challenge_id AS cid,
            hacker_id AS hid
        FROM
            submissions
        GROUP BY
            hacker_id,
            challenge_id) t1
    GROUP BY
        hid) t2
JOIN
    hackers h
ON h.hacker_id = t2.hid
HAVING t2.score > 0
ORDER BY
    t2.score DESC,
    t2.hid ASC;
