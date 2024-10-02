SELECT c.cid as cid1, c1.cid as cid2
FROM Course c
JOIN Course c1 on c.cid < c1.cid
WHERE not exists (SELECT preid
                 FROM  Prerequisites p
                 WHERE p.cid = c.cid
                 except
                 SELECT preid
                 FROM  Prerequisites p1
                 WHERE p1.cid = c1.cid
                 )
      and not exists (SELECT preid
                 FROM  Prerequisites p1
                 WHERE p1.cid = c1.cid
                 except
                 SELECT preid
                 FROM  Prerequisites p
                 WHERE p.cid = c.cid
                 )
ORDER BY c.cid, c1.cid;