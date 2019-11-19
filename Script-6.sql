-- Заполнить все таблицы БД vk данными (по 10-100 записей в каждой таблице)
use vk_3;

INSERT INTO `users` 
	(`id`, `firstname`, `lastname`, `email`, `phone`) 
select 
 	`id`, `firstname`, `lastname`, `email`, `phone`
from vk_2.users
;

INSERT INTO `communities` 
	(`id`, `name`) 
select 
 	`id`, `name`
from vk_2.communities
;

INSERT INTO `media_types` 
	(`id`, `name`) 
select 
 	`id`, `name`
from vk_2.media_types
;

INSERT INTO `media` 
	(`id`, `media_type_id`, `user_id`, `body`, `filename`, `size`, `created_at`, `updated_at`) 
select 
 	`id`, `media_type_id`, `user_id`, `body`, `filename`, `size`, `created_at`, `updated_at`
from vk_2.media
;

INSERT INTO `photo_albums` 
	(`id`, `name`, `user_id`) 
select 
 	`id`, `name`, `user_id`
from vk_2.photo_albums
;

INSERT INTO friend_requests (`initiator_user_id`, `target_user_id`, `status`) values
	('1', '2', 'requested'),
	('1', '3', 'requested'),
	('1', '4', 'requested'),
	('1', '5', 'requested'),
	('1', '6', 'requested'),
	('1', '7', 'requested'),
	('1', '8', 'requested'),
	('1', '9', 'requested'),
	('1', '10', 'requested'),
	('1', '11', 'requested')
;

update friend_requests
set
	status = 'approved',
	updated_at = now()
where initiator_user_id = 1 and target_user_id = 2;

update friend_requests
set 
	status = 'declined',
	updated_at = now()
where initiator_user_id = 1 and target_user_id = 4
 	and status = 'requested'
 ;
INSERT INTO profiles (users_id,gender,hometown,created_at) values
(1,'m','ttt','2019-11-19 12:54:03.0'),
(2,'f','Kansas','2019-11-19 12:54:03.0'),
(3,'m','Moscow','2019-11-19 12:54:03.0'),
(4,'f','Yekaterinburg','2019-11-19 12:54:03.0'),
(5,'f','sss','2019-11-19 12:54:03.0'),
(6,'m','qqq','2019-11-19 12:54:03.0'),
(7,'f','ttt','2019-11-19 12:54:03.0'),
(8,'m','New-York','2019-11-19 12:54:03.0'),
(9,'m','Kalinigrat','2019-11-19 12:54:03.0'),
(10,'m','ggg','2019-11-19 12:54:03.0');


-- Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке

SELECT distinct firstname
FROM users
order by firstname asc;

-- Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных (поле is_active = true). При необходимости предварительно добавить такое поле в таблицу profiles со значением по умолчанию = false (или 0)

update profiles
set
	is_active = 1
where
	birthday > '2001-01-01' and is_active = 0;


INSERT INTO messages values
('1','1','2','Voluptatem ut quaerat quia. Pariatur esse amet ratione qui quia. In necessitatibus reprehenderit et. Nam accusantium aut qui quae nesciunt non.','1995-08-28 22:44:29'),
('2','2','1','Sint dolores et debitis est ducimus. Aut et quia beatae minus. Ipsa rerum totam modi sunt sed. Voluptas atque eum et odio ea molestias ipsam architecto.',now()),
('3','3','1','Sed mollitia quo sequi nisi est tenetur at rerum. Sed quibusdam illo ea facilis nemo sequi. Et tempora repudiandae saepe quo.','2020-09-14 19:45:58'),
('4','1','3','Quod dicta omnis placeat id et officiis et. Beatae enim aut aliquid neque occaecati odit. Facere eum distinctio assumenda omnis est delectus magnam.','2019-12-25 16:56:25'),
('5','1','5','Voluptas omnis enim quia porro debitis facilis eaque ut. Id inventore non corrupti doloremque consequuntur. Molestiae molestiae deleniti exercitationem sunt qui ea accusamus deserunt.','1999-09-19 04:35:46')
;

truncate table messages;

--  Написать скрипт, удаляющий сообщения «из будущего» (дата позже сегодняшней)

delete from messages
where created_at > now();