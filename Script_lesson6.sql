use snet_v1;

-- ����� ����� ��������� ������������. 
-- �� ���� ������ ����� ������������ ������� ��������, ������� ������ ���� ������� � ����� �������������.
select initiator_profile_id, target_profile_id from friend_requests where status = 'approved' and initiator_profile_id = 1;
select * from profiles ;
select * from messages where to_profile_id =3 or to_profile_id = 10;

select *, (select name from profiles where id = 1) as friend from messages group by friend;


-- ���������� ����� ���������� ������, ������� �������� 10 ����� ������� �������������.

select id, timestampdiff(year, birthday, now()) as age from profiles order by age limit 10;

(select profile_id, count(*) total_likes from likes_posts where profile_id = id)



-- ���������� ��� ������ �������� ������ (�����) - ������� ��� �������?
select count(id) total_likes, (select gender from profiles where id = profile_id) as gender from likes_posts group by gender;

-- ����� 10 �������������, ������� ��������� ���������� ���������� � ������������� ���������� ����
select count(id) total_likes, profile_id, (select name from profiles where id = profile_id) as name 
from likes_posts group by profile_id order by total_likes limit 10;
