-- Написать скрипт, добавляющий в созданную БД vk 2-3 новые таблицы (с перечнем полей, указанием индексов и внешних ключей) (CREATE TABLE)

USE vk;

-- таблица фотоальбомов
DROP TABLE IF EXISTS photo_albums;
CREATE TABLE photo_albums (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
	name VARCHAR(100),
    user_id BIGINT UNSIGNED NOT NULL,
    
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- таблица фотографий
DROP TABLE IF EXISTS photos;
CREATE TABLE photos (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
	album_id BIGINT UNSIGNED,
	
	FOREIGN KEY (album_id) REFERENCES photo_albums(id)
);




