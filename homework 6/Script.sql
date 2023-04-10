
-- 1. Написать функцию, которая удаляет всю информацию об указанном пользователе из БД vk. 
-- Пользователь задается по id. Удалить нужно все сообщения, лайки, медиа записи, профиль и запись из таблицы users. 
-- Функция должна возвращать номер пользователя.
CREATE FUNCTION vk.func_delete_user(user_id_delete BIGINT UNSIGNED) 
RETURNS BIGINT MODIFIES SQL DATA
BEGIN

DELETE FROM friend_requests
WHERE initiator_user_id = user_id_delete or target_user_id = user_id_delete;

DELETE FROM likes
WHERE user_id = user_id_delete;

DELETE FROM media
WHERE user_id = user_id_delete;	

DELETE FROM messages
WHERE from_user_id = user_id_delete or to_user_id = user_id_delete;

DELETE FROM profiles
WHERE user_id = user_id_delete;

DELETE FROM users 
WHERE id = user_id_delete;

DELETE FROM users_communities 
WHERE user_id = user_id_delete;

RETURN user_id_delete;

END

-- 2. Предыдущую задачу решить с помощью процедуры и обернуть используемые команды в транзакцию внутри процедуры.
CREATE DEFINER=`root`@`localhost` PROCEDURE `vk`.`user_id_delete`(user_id_to_delete BIGINT UNSIGNED)
BEGIN

START TRANSACTION;

DELETE FROM friend_requests
WHERE initiator_user_id = user_id_delete or target_user_id = user_id_delete;

DELETE  FROM likes
WHERE user_id = user_id_delete;

DELETE FROM media
WHERE user_id = user_id_delete;

DELETE FROM messages
WHERE from_user_id = user_id_delete or to_user_id = user_id_delete;

DELETE FROM profiles
WHERE user_id = user_id_delete;

DELETE FROM users
WHERE id = user_id_delete;

DELETE FROM users_communities
WHERE user_id = user_id_delete;

COMMIT;

END

-- 3.* Написать триггер, который проверяет новое появляющееся сообщество. 
-- Длина названия сообщества (поле name) должна быть не менее 5 символов. 
-- Если требование не выполнено, то выбрасывать исключение с пояснением.
DROP TRIGGER IF EXISTS check_community_name;

DELIMITER $$

CREATE TRIGGER check_community_name
BEFORE INSERT ON communities
FOR EACH ROW
BEGIN
    IF (CHAR_LENGTH(NEW.name) < 5) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Error: Name length should be greater than or equal to 5';
    END IF;
END$$
DELIMITER ;

insert into communities (name) values ('qwer');