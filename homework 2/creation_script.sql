/*
 * 2. Написать скрипт, добавляющий в созданную БД vk 2-3 новые таблицы (с перечнем полей, указанием индексов и внешних ключей) (CREATE TABLE)
 */ 

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

ALTER TABLE photos ADD COLUMN name VARCHAR(500);


/*
 * 3. Заполнить 2 таблицы БД vk данными (по 10 записей в каждой таблице) (INSERT)
 */ 

USE vk;

-- заполнение таблицы users
INSERT INTO `users` (`id`,`firstname`,`lastname`,`email`,`phone`) VALUES
('1','Ivan','Ivanov','ivan555@yandex.ru','36536'),
('2','Anna','Petrova','anna_petrova@mail.ru','67849'),
('3','Sergei','Sokolov','socol_56@gmail.com','37674'),
('4','Boris','Popov','boris_popov@yandex.ru','36790'),
('5','Olga','lebedeva','lyolik@gmail.com','93289');

-- заполнение таблицы photo_albums
INSERT INTO `photo_albums` (`id`,`name`,`user_id`) VALUES
('1','family','2'),
('2','motorcycles','3'),
('3','cars','3'),
('4','Birthday','2');

-- заполнение таблицы photos
INSERT INTO `photos` (`id`,`name`,`album_id`) VALUES ('1','family','1');
INSERT INTO `photos` (`id`,`album_id`) VALUES ('2','2');
INSERT INTO `photos` (`id`,`name`,`album_id`) VALUES ('3','Audi','3');
INSERT INTO `photos` (`id`,`name`,`album_id`) VALUES ('4','BMW','3');
INSERT INTO `photos` (`id`,`name`,`album_id`) VALUES ('5','Mercedes','3');
INSERT INTO `photos` (`id`,`album_id`) VALUES ('6','4');
INSERT INTO `photos` (`id`,`album_id`) VALUES ('7','4');


/*
 * 4. * Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных (поле is_active = true). 
 * При необходимости предварительно добавить такое поле в таблицу profiles со значением по умолчанию = false (или 0) (ALTER TABLE + UPDATE)
 */ 

USE vk;

ALTER TABLE profiles ADD COLUMN is_active BIT DEFAULT 0;

UPDATE profiles
SET is_active = 1
WHERE (birthday + INTERVAL 18 YEAR) > NOW();

-- проверка удаления
SELECT *
FROM profiles
WHERE is_active = 0;


/*
 * 5.* Написать скрипт, удаляющий сообщения «из будущего» (дата позже сегодняшней) (DELETE)
 */ 

USE vk;

DELETE FROM messages
WHERE created_at > NOW();

-- проверка удаления
SELECT *
FROM messages;



