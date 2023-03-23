USE vk;

-- 1. Создайте представление с произвольным SELECT-запросом из прошлых уроков [CREATE VIEW]
CREATE VIEW v_count_user_communities AS
	SELECT count(*), communities.name
	FROM users_communities 
	JOIN communities ON users_communities.community_id = communities.id
	GROUP BY communities.id;
	
-- 2. Выведите данные, используя написанное представление [SELECT]
SELECT *
FROM v_count_user_communities;

-- 3. Удалите представление [DROP VIEW]
DROP VIEW v_count_user_communities;

-- 4.* Сколько новостей (записей в таблице media) у каждого пользователя? 
-- Вывести поля: news_count (количество новостей), user_id (номер пользователя), user_email (email пользователя). 
-- Попробовать решить с помощью CTE или с помощью обычного JOIN.
SELECT COUNT(*), user_id, email
FROM media as m
JOIN users as u on u.id = m.user_id 
GROUP BY user_id;
