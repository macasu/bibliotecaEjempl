INSERT INTO `role`(`id`, `nombre`)
SELECT * FROM (SELECT 1,"ADMIN") AS tmp
WHERE NOT EXISTS (
    SELECT nombre FROM role WHERE nombre = "ADMIN"
) LIMIT 1;

INSERT INTO `role`(`id`, `nombre`)
SELECT * FROM (SELECT 2,"USER") AS tmp
WHERE NOT EXISTS (
    SELECT nombre FROM role WHERE nombre = "USER"
) LIMIT 1;