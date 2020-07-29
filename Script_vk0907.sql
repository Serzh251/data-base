DROP DATABASE IF EXISTS vk0907;
CREATE DATABASE vk0907 CHARACTER SET utf8 COLLATE utf8_general_ci;
USE vk0907;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	email VARCHAR(120) UNIQUE,
    phone VARCHAR(15), 
    pass VARCHAR(200)
);
insert into users (id, email, phone, pass) values (1, 'shaste0@about.me', '(133) 8872071', 'py92hb');
insert into users (id, email, phone, pass) values (2, 'fcorradino1@howstuffworks.com', '(597) 6636421', 'GbUi76Pxmhw');
insert into users (id, email, phone, pass) values (3, 'ederby2@networksolutions.com', '(420) 9216582', 'YUs2ZHypB6FH');
insert into users (id, email, phone, pass) values (4, 'mandrea3@ameblo.jp', '(492) 1025685', '3AEZYI');
insert into users (id, email, phone, pass) values (5, 'mcarren4@ocn.ne.jp', '(534) 7990308', 'QlpuFLY');
insert into users (id, email, phone, pass) values (6, 'fwhichelow5@slideshare.net', '(927) 3508700', 'dewCYi4MRzL');
insert into users (id, email, phone, pass) values (7, 'cmoxstead6@ask.com', '(740) 1599633', 'MUgEUQbH8S');
insert into users (id, email, phone, pass) values (8, 'acauderlie7@dion.ne.jp', '(212) 7296227', 'a29PQVU8P3s');
insert into users (id, email, phone, pass) values (9, 'dcattemull8@seattletimes.com', '(113) 6555097', 'YGi6owX');
insert into users (id, email, phone, pass) values (10, 'wburdekin9@about.com', '(550) 6142895', 'LcZOXUk0fL');

update users set email = 'shaste0@mail.ru' where id = 1;

DROP TABLE IF EXISTS profiles;
CREATE TABLE profiles (
	id SERIAL PRIMARY key,
	user_id BIGINT UNSIGNED NOT NULL,
    gender CHAR(1),
    name VARCHAR(100),
    surname VARCHAR(100),
    birthday DATE,
	photo_id BIGINT UNSIGNED NULL,
    created_at DATETIME DEFAULT NOW(),
    hometown VARCHAR(100),
    -- bio TEXT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);
insert into profiles (user_id, gender, name, surname, birthday, photo_id, hometown) values (1, 'M', 'Natale', 'Pomroy', '1996-05-01', 55656, 'Shanban');
insert into profiles (user_id, gender, name, surname, birthday, photo_id, hometown) values (2, 'F', 'Vivien', 'Faulder', '1996-05-01', 45456, 'Winton');
insert into profiles (user_id, gender, name, surname, birthday, photo_id, hometown) values (3, 'F', 'Talia', 'Pilsworth', '1988-06-14', 45325732, 'Louredo');
insert into profiles (user_id, gender, name, surname, birthday, photo_id, hometown) values (4, 'F', 'Julianna', 'Tollet', '1996-01-05', 45752, 'Bonabéri');
insert into profiles (user_id, gender, name, surname, birthday, photo_id, hometown) values (5, 'F', 'Luci', 'Willeman', '1989-09-06', 6789789, 'Fort Worth');
insert into profiles (user_id, gender, name, surname, birthday, photo_id, hometown) values (6, 'M', 'Tabor', 'Lage', '1996-07-30', 787678, '‘Anjarah');
insert into profiles (user_id, gender, name, surname, birthday, photo_id, hometown) values (7, 'M', 'Ferrel', 'Sentinella', '1990-01-10', 893453, 'Lyublino');
insert into profiles (user_id, gender, name, surname, birthday, photo_id, hometown) values (8, 'F', 'Karyn', 'Elland', '1988-02-19', 98778786, 'Suisan');
insert into profiles (user_id, gender, name, surname, birthday, photo_id, hometown) values (9, 'F', 'Dianna', 'Yantsurev', '1991-06-24', 4678, 'Kalkal Barat');
insert into profiles (user_id, gender, name, surname, birthday, photo_id, hometown) values (10, 'F', 'Nelly', 'Savery', '1995-02-14', 124878, 'Morrinhos');

DROP TABLE IF EXISTS messages;
CREATE TABLE messages (
	id SERIAL PRIMARY KEY,
	from_user_id BIGINT UNSIGNED NOT NULL,
    to_user_id BIGINT UNSIGNED NOT NULL,
    body TEXT,
    is_read BOOL,
    created_at DATETIME default NOW(),
    INDEX(from_user_id),
  	INDEX(to_user_id),
  	FOREIGN KEY (from_user_id) REFERENCES users(id),
  	FOREIGN KEY (to_user_id) REFERENCES users(id)
);
insert into messages (from_user_id, to_user_id, body, is_read) values (1, 3, 'Vectair Systems, Inc.', false);
insert into messages (from_user_id, to_user_id, body, is_read) values (8, 1, 'Stiefel Laboratories Inc', true);
insert into messages (from_user_id, to_user_id, body, is_read) values (10, 5, 'Mylan Pharmaceuticals Inc.', false);
insert into messages (from_user_id, to_user_id, body, is_read) values (4, 2, 'Apotheca Company', true);
insert into messages (from_user_id, to_user_id, body, is_read) values (4, 6, 'Allergy Laboratories, Inc.', false);
insert into messages (from_user_id, to_user_id, body, is_read) values (3, 5, 'Nelco Laboratories, Inc.', true);
insert into messages (from_user_id, to_user_id, body, is_read) values (1, 4, 'Roxane Laboratories, Inc', false);
insert into messages (from_user_id, to_user_id, body, is_read) values (9, 7, 'Bryant Ranch Prepack', false);
insert into messages (from_user_id, to_user_id, body, is_read) values (7, 5, 'Cardinal Health', true);
insert into messages (from_user_id, to_user_id, body, is_read) values (8, 1, 'Uriel Pharmacy Inc.', true);
insert into messages (from_user_id, to_user_id, body, is_read) values (9, 5, 'HyVee Inc', true);
insert into messages (from_user_id, to_user_id, body, is_read) values (2, 4, 'Preferred Pharmaceuticals, Inc.', true);
insert into messages (from_user_id, to_user_id, body, is_read) values (10, 8, 'LLC Federal Solutions', false);
insert into messages (from_user_id, to_user_id, body, is_read) values (6, 8, 'Topco Associates LLC', true);
insert into messages (from_user_id, to_user_id, body, is_read) values (10, 5, 'YBK Investment, INC', false);
insert into messages (from_user_id, to_user_id, body, is_read) values (3, 1, 'REMEDYREPACK INC.', true);
insert into messages (from_user_id, to_user_id, body, is_read) values (1, 8, 'Torrent Pharmaceuticals Limited', true);
insert into messages (from_user_id, to_user_id, body, is_read) values (2, 5, 'American Health Packaging', false);
insert into messages (from_user_id, to_user_id, body, is_read) values (4, 8, 'Aidarex Pharmaceuticals LLC', false);
insert into messages (from_user_id, to_user_id, body, is_read) values (7, 5, 'Antigen Laboratories, Inc.', false);


DROP TABLE IF EXISTS friend_requests;
CREATE TABLE friend_requests (
	initiator_user_id BIGINT UNSIGNED NOT NULL,
	target_user_id BIGINT UNSIGNED NOT NULL,
	satus ENUM('requested', 'approved', 'unfriended', 'declined') default 'requested',
	requested_at DATETIME DEFAULT NOW(),
	confirmed_at DATETIME,
	PRIMARY KEY(initiator_user_id, target_user_id),
	index(initiator_user_id),
	index(target_user_id),
	FOREIGN KEY (initiator_user_id) REFERENCES users(id),
  	FOREIGN KEY (target_user_id) REFERENCES users(id)
);
insert into friend_requests (initiator_user_id, target_user_id, satus) values (4, 5, 'requested');
insert into friend_requests (initiator_user_id, target_user_id, satus, confirmed_at) values (3, 1, 'approved', '2020-07-27 10:10:15');
insert into friend_requests (initiator_user_id, target_user_id, satus) values (8, 5, 'unfriended');
insert into friend_requests (initiator_user_id, target_user_id, satus, confirmed_at) values (4, 2, 'approved', '2020-07-28 20:10:15');
insert into friend_requests (initiator_user_id, target_user_id, satus) values (1, 4, 'declined');


DROP TABLE IF EXISTS communities;
CREATE TABLE communities(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	INDEX(name)
);
insert into communities (name) values ('Transcof');
insert into communities (name) values ('Latlux');
insert into communities (name) values ('Bitwolf');
insert into communities (name) values ('Fixflex');
insert into communities (name) values ('Flowdesk');
insert into communities (name) values ('Overhold');
insert into communities (name) values ('Flexidy');
insert into communities (name) values ('Duobam');
insert into communities (name) values ('Voltsillam');
insert into communities (name) values ('Konklux');

DROP TABLE IF EXISTS users_communities;
CREATE TABLE users_communities(
	user_id BIGINT UNSIGNED NOT NULL,
	community_id BIGINT UNSIGNED NOT NULL,
	is_admin BOOL default FALSE,
	PRIMARY KEY (user_id, community_id), 
  	FOREIGN KEY (user_id) REFERENCES users(id),
  	FOREIGN KEY (community_id) REFERENCES communities(id)
);
insert into users_communities (user_id, community_id, is_admin) values (1, 9, TRUE);
insert into users_communities (user_id, community_id) values (7, 1);
insert into users_communities (user_id, community_id) values (6, 1);
insert into users_communities (user_id, community_id) values (10, 6);
insert into users_communities (user_id, community_id) values (7, 6);
insert into users_communities (user_id, community_id) values (1, 8);
insert into users_communities (user_id, community_id) values (8, 8);
insert into users_communities (user_id, community_id) values (3, 10);
insert into users_communities (user_id, community_id) values (9, 6);
insert into users_communities (user_id, community_id) values (4, 8);

DROP TABLE IF EXISTS posts;
CREATE TABLE posts(
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL,
	body text,
	attachments JSON,
	metadata JSON,
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY (user_id) REFERENCES users(id)	
);
insert into posts (user_id, body, attachments, metadata) values (7, 'In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', {"first_name" : "Sammy", "last_name" : "Shark"}, {"location" : "Ocean"});
insert into posts (user_id, body, attachments, metadata) values (4, 'Maecenas rhoncus aliquam lacus.', 'Sed accumsan felis.', 'Aliquam quis turpis eget elit sodales scelerisque.');
insert into posts (user_id, body, attachments, metadata) values (3, 'Suspendisse potenti.', 'Donec ut mauris eget massa tempor convallis.', 'Quisque ut erat.');
insert into posts (user_id, body, attachments, metadata) values (2, 'Fusce posuere felis sed lacus.', 'Nam nulla.', 'Cras pellentesque volutpat dui.');
insert into posts (user_id, body, attachments, metadata) values (1, 'Proin interdum mauris non ligula pellentesque ultrices.', 'Morbi porttitor lorem id ligula.', 'Cras non velit nec nisi vulputate nonummy.');
insert into posts (user_id, body, attachments, metadata) values (10, 'Nullam sit amet turpis elementum ligula vehicula consequat.', 'Curabitur in libero ut massa volutpat convallis.', 'Proin risus.');
insert into posts (user_id, body, attachments, metadata) values (9, 'Quisque id justo sit amet sapien dignissim vestibulum.', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla.');
insert into posts (user_id, body, attachments, metadata) values (4, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi.', 'Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.', 'Donec vitae nisi.');
insert into posts (user_id, body, attachments, metadata) values (2, 'Curabitur gravida nisi at nibh.', 'Nulla suscipit ligula in lacus.', 'Pellentesque ultrices mattis odio.');
insert into posts (user_id, body, attachments, metadata) values (9, 'Pellentesque viverra pede ac diam.', 'Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 'Curabitur at ipsum ac tellus semper interdum.');


DROP TABLE IF EXISTS comments;
CREATE TABLE comments(
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL,
	post_id BIGINT UNSIGNED NOT NULL,
	body text,
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (post_id) REFERENCES posts(id)
);
insert into comments (user_id, post_id, body) values (7, 2, 'Aenean lectus. Pellentesque eget nunc.');
insert into comments (user_id, post_id, body) values (9, 5, 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.');
insert into comments (user_id, post_id, body) values (10, 9, 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.');
insert into comments (user_id, post_id, body) values (3, 1, 'Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus.');
insert into comments (user_id, post_id, body) values (9, 4, 'Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim.');
insert into comments (user_id, post_id, body) values (6, 1, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.');
insert into comments (user_id, post_id, body) values (5, 6, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.');
insert into comments (user_id, post_id, body) values (6, 8, 'Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.');
insert into comments (user_id, post_id, body) values (9, 3, 'Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy.');
insert into comments (user_id, post_id, body) values (4, 3, 'Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam.');



DROP TABLE IF EXISTS photo;
CREATE TABLE photo(
	id SERIAL PRIMARY KEY,
	file VARCHAR(255),
	user_id BIGINT UNSIGNED NOT NULL,
	description text,
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY (user_id) REFERENCES users(id)
);
insert into photo (file, user_id, description) values ('eu.gif', 9, 'Morbi a ipsum.');
insert into photo (file, user_id, description) values ('fusce.tiff', 3, 'Suspendisse potenti.');
insert into photo (file, user_id, description) values ('volutpat sapien arcu.tiff', 10, 'Proin interdum mauris non ligula pellentesque ultrices.');
insert into photo (file, user_id, description) values ('porttitor.tiff', 3, 'Proin at turpis a pede posuere nonummy.');
insert into photo (file, user_id, description) values ('morbi porttitor.gif', 6, 'In hac habitasse platea dictumst.');
insert into photo (file, user_id, description) values ('nunc vestibulum.tiff', 6, 'Maecenas tincidunt lacus at velit.');
insert into photo (file, user_id, description) values ('nunc viverra.gif', 4, 'Fusce posuere felis sed lacus.');
insert into photo (file, user_id, description) values ('eu.tiff', 9, 'In est risus, auctor sed, tristique in, tempus sit amet, sem.');
insert into photo (file, user_id, description) values ('gravida.gif', 2, 'Integer non velit.');
insert into photo (file, user_id, description) values ('sed justo pellentesque.gif', 1, 'In hac habitasse platea dictumst.');


DROP TABLE IF EXISTS repost;
CREATE TABLE repost(
	id SERIAL PRIMARY KEY,
	post_id BIGINT UNSIGNED NOT NULL,
	reposted_to BIGINT UNSIGNED NOT NULL,
	reposted_from BIGINT UNSIGNED NOT NULL,
	reposted_at DATETIME DEFAULT NOW(),
	FOREIGN KEY (reposted_to) REFERENCES users(id),
	FOREIGN KEY (post_id) REFERENCES posts(id)
);
insert into repost (post_id, reposted_to, reposted_from) values (3, 1, 4);
insert into repost (post_id, reposted_to, reposted_from) values (7, 10, 1);
insert into repost (post_id, reposted_to, reposted_from) values (5, 1, 6);
insert into repost (post_id, reposted_to, reposted_from) values (1, 9, 1);
insert into repost (post_id, reposted_to, reposted_from) values (5, 5, 4);
insert into repost (post_id, reposted_to, reposted_from) values (10, 8, 5);
insert into repost (post_id, reposted_to, reposted_from) values (6, 4, 9);
insert into repost (post_id, reposted_to, reposted_from) values (10, 5, 2);
insert into repost (post_id, reposted_to, reposted_from) values (2, 4, 5);
insert into repost (post_id, reposted_to, reposted_from) values (3, 2, 9);


