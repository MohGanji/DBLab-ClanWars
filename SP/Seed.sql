use ClanWars;

DELETE FROM Role
INSERT INTO Role (id, name) VALUES ('Leader', N'مدیر');
INSERT INTO Role (id, name) VALUES ('Coleader', N'معاون');
INSERT INTO Role (id, name) VALUES ('Member', N'کاربر عادی');

DELETE FROM Job
INSERT INTO Job (id, name) VALUES ('Miner', N'معدنچی');
INSERT INTO Job (id, name) VALUES ('Sawyer', N'جوب جمع کن');
INSERT INTO Job (id, name) VALUES ('Farmer', N'کشاورز');
INSERT INTO Job (id, name) VALUES ('Trainer', N'مربی');

DELETE FROM Building
INSERT INTO Building (id, name) VALUES ('Barrack', N'سرباز خانه');
INSERT INTO Building (id, name) VALUES ('Farm', N'مزرعه');
