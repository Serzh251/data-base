use snet_v1;

-- Пусть задан некоторый пользователь. 
-- Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.
select initiator_profile_id, target_profile_id from friend_requests where status = 'approved' and initiator_profile_id = 1;
select * from profiles ;
select * from messages where to_profile_id =3 or to_profile_id = 10;

select *, (select name from profiles where id = 1) as friend from messages group by friend;


-- Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.

select id, timestampdiff(year, birthday, now()) as age from profiles order by age limit 10;

(select profile_id, count(*) total_likes from likes_posts where profile_id = id)



-- Определить кто больше поставил лайков (всего) - мужчины или женщины?
select count(id) total_likes, (select gender from profiles where id = profile_id) as gender from likes_posts group by gender;

-- Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети
select count(id) total_likes, profile_id, (select name from profiles where id = profile_id) as name 
from likes_posts group by profile_id order by total_likes limit 10;
