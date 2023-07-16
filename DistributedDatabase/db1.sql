DROP DATABASE IF EXISTS DbMain;

DROP DATABASE IF EXISTS Location CASCADE;
CREATE TABLE Location(
		loc_id				int(100)NOT NULL,
		countryName			varchar(255)NOT NULL,
		city 				VARCHAR(255)NOT NULL,
		stat 				VARCHAR(255)NOT NULL,
		zip_code			int(100) NOT NULL,
		PRIMARY key(loc_id)
);


DROP DATABASE IF EXISTS Catigory CASCADE;
CREATE  TABLE catigory(
		cat_id				int(100) not null,
		maingroup			varchar(255) not null,
		subgroup			varchar(255) null,
		catname				VARCHAR(255) NULL,
		PRIMARY key(catID)
);
		
		
DROP DATABASE IF EXISTS DATE CASCADE;
CREATE TABLE Date(
		date_id 		int(100) NOT NULL,
		YEAR			VARCHAR(100) NOT NULL,
		month 			VARCHAR(100) NOT NULL,
		DAY				VARCHAR(100) NOT NULL,
		time 			VARCHAR(100) NOT NULL,
		PRIMARY key(date_id)
);
--   *****************************************************

-- job and challenge post requiments
-- can have more than one requirme
DROP DATABASE IF EXISTS Media CASCADE;
CREATE TABLE Media(
		medID				int(100) not null,
		medtype				VARCHAR(100) not null,
		medname				VARCHAR(100) not null,
		med					text not NULL,
		PRIMARY KEY(med_id)
		);
		
-- First table managing user account
-- also filed during registration
-- login  and logout for all users
DROP DATABASE IF EXISTS User CASCADE
CREATE TABLE User(
		user_id    			int(100) not null, -- auto increment
		username			VARCHAR(100) not null,
		password 			VARCHAR(100) not null,
		email			    VARCHAR(100) not null, 	-- client, codexjobwine, organisation and admin -- defined types
		date_id 			int(100) NOT NULL,   -- account created date 
		loc_id 				int(100) NULL,  -- user location 
		med_id 				int(100) NULL,
		FOREIGN KEY(date_id) REFERENCES Date(date_id),
		FOREIGN KEY(loc_id) REFERENCES Location(loc_id),
		FOREIGN KEY(med_id) REFERENCES Media(med_id),
		PRIMARY key(user_id)
);


DROP DATABASE IF EXISTS NUser CASCADE
CREATE TABLE NUser(
		Nu_id 				int(100) NOT NULL,
		user_id 			int(100) NOT NULL,
		FOREIGN KEY(user_id) REFERENCES User(user_id),
		PRIMARY key(Nu_id)
);


DROP DATABASE IF EXISTS TECH_Auth CASCADE
CREATE TABLE TECH_Auth(
		Auth_id 				int(100) NOT NULL,
		user_id 			int(100) NOT NULL,
		FOREIGN KEY(user_id) REFERENCES User(user_id),
		PRIMARY key(Nu_id)
);
-- lksrfslkdfkdnfk ---kdkfdoonfjjandkjbkbdkjf
create table main.user_med(
		med_id   int not null,
		user_id  int not null,
		med_name varchar(255),
		FOREIGN KEY(med_id) REFERENCES main.media(med_id),
		FOREIGN KEY(user_id) REFERENCES main.user(user_id),
		PRIMARY key(user_id, med_id)
);

create table main.tech(
	tech_id  serial not null,
	Auth_id  int not null,
	tech_name VARCHAR(255) not null,
	cat_id int not null,
	date_id int not null,
	med_id int not null,
	loc_id int not null,
	descp text,
	creat_date  varchar(255) not null,
	objective   text not null,
	cretor 		VARCHAR(255) not null,
	FOREIGN KEY(med_id) REFERENCES main.media(med_id),
	FOREIGN KEY(Auth_id) REFERENCES main.TECH_Auth(Auth_id),
	FOREIGN KEY(cat_id) REFERENCES main.Catigoury(cat_id),
	FOREIGN KEY(date_id) REFERENCES main.Date(date_id),
	FOREIGN KEY(loc_id) REFERENCES main.Location(loc_id),
	PRIMARY key(tech_id)
	
);


create table main.tech_cat(
	tech_id  int not null,
	cat_id   int not null,
	tech_name varchar(255) not null,
	FOREIGN KEY(tech_id) REFERENCES main.tech(tech_id),
	FOREIGN KEY(cat_id) REFERENCES main.Catigoury(cat_id),
	primary key(tech_id, cat_id)
	);
	


create table main.tech_med(
		med_id   int not null,
		tech_id  int not null,
		med_name varchar(255),
		FOREIGN KEY(med_id) REFERENCES main.media(med_id),
		FOREIGN KEY(tech_id) REFERENCES main.tech(tech_id),
		PRIMARY key(tech_id, med_id)
);

create table main.comment(
	com_id  serial not null,
	email 	varchar(255) not null,
	date_id int not null,
	tech_id int not null,
	FOREIGN KEY(tech_id) REFERENCES main.tech(tech_id),
	FOREIGN KEY(date_id) REFERENCES main.Date(date_id),
	PRIMARY key(com_id)
	
);

create table main.NComment(
	Ncom_id  serial not null,
	com_id		int not null,
	Nu_id int not null,
	dession  varchar(255) null,
	FOREIGN KEY(com_id) REFERENCES main.comment(com_id),
	FOREIGN KEY(Nu_id) REFERENCES main.NUser(Nu_id),
	primary key(Ncom_id)
);


create table main.view_users(
	vu_id  serial not null,
	tech_id int not null,
	date_id int not null,
	FOREIGN KEY(tech_id) REFERENCES main.tech(tech_id),
	FOREIGN KEY(date_id) REFERENCES main.Date(date_id),
	PRIMARY key(vu_id)
);

create table main.rating(
	rat_id serial not null,
	date_id int not null,
	rating int not null,
	FOREIGN KEY(date_id) REFERENCES main.Date(date_id),
	PRIMARY KEY(rat_id)
);
create table main.Orating(
	or_id  serial not null,
	rat_id  int not null,
	tech_id  int not null,
	Rat_souces  varchar(255), 
	FOREIGN KEY(tech_id) REFERENCES main.tech(tech_id),
	FOREIGN KEY(rat_id) REFERENCES main.rating(rat_id),
	PRIMARY KEY(Or_id)
	
);

create table main.Date_type(
	date_id   int not null,
	dty_id     serial not null,
	type_name  VARCHAR(255),
	FOREIGN KEY(date_id) REFERENCES main.Date(date_id),
	PRIMARY KEY(dty_id)
	
); 











insert into main.catigoury (maingroup, subgroup, catname) values ('Fire Sprinkler System', 'Marlite Panels (FED)', 'Painting & Vinyl Wall Covering');
insert into main.catigoury (maingroup, subgroup, catname) values ('Curb & Gutter', 'Termite Control', 'Granite Surfaces');
insert into main.catigoury (maingroup, subgroup, catname) values ('Wall Protection', 'RF Shielding', 'Landscaping & Irrigation');
insert into main.catigoury (maingroup, subgroup, catname) values ('Drilled Shafts', 'Prefabricated Aluminum Metal Canopies', 'HVAC');
insert into main.catigoury (maingroup, subgroup, catname) values ('Roofing (Metal)', 'Prefabricated Aluminum Metal Canopies', 'Waterproofing & Caulking');
insert into main.catigoury (maingroup, subgroup, catname) values ('EIFS', 'Electrical and Fire Alarm', 'Hard Tile & Stone');
insert into main.catigoury (maingroup, subgroup, catname) values ('Painting & Vinyl Wall Covering', 'Electrical and Fire Alarm', 'Glass & Glazing');
insert into main.catigoury (maingroup, subgroup, catname) values ('Electrical', 'Rebar & Wire Mesh Install', 'Soft Flooring and Base');
insert into main.catigoury (maingroup, subgroup, catname) values ('Site Furnishings', 'Structural and Misc Steel (Fabrication)', 'Fire Sprinkler System');
insert into main.catigoury (maingroup, subgroup, catname) values ('Drywall & Acoustical (FED)', 'Retaining Wall and Brick Pavers', 'Asphalt Paving');
insert into main.catigoury (maingroup, subgroup, catname) values ('Marlite Panels (FED)', 'HVAC', 'Structural and Misc Steel (Fabrication)');
insert into main.catigoury (maingroup, subgroup, catname) values ('Exterior Signage', 'Drywall & Acoustical (MOB)', 'Overhead Doors');
insert into main.catigoury (maingroup, subgroup, catname) values ('Masonry', 'Roofing (Asphalt)', 'Fire Sprinkler System');
insert into main.catigoury (maingroup, subgroup, catname) values ('Epoxy Flooring', 'Ornamental Railings', 'Prefabricated Aluminum Metal Canopies');
insert into main.catigoury (maingroup, subgroup, catname) values ('Sitework & Site Utilities', 'Elevator', 'Curb & Gutter');
insert into main.catigoury (maingroup, subgroup, catname) values ('Glass & Glazing', 'Rebar & Wire Mesh Install', 'Ornamental Railings');
insert into main.catigoury (maingroup, subgroup, catname) values ('Framing (Steel)', 'Ornamental Railings', 'Plumbing & Medical Gas');
insert into main.catigoury (maingroup, subgroup, catname) values ('Electrical', 'Structural & Misc Steel Erection', 'RF Shielding');
insert into main.catigoury (maingroup, subgroup, catname) values ('Curb & Gutter', 'Electrical and Fire Alarm', 'Exterior Signage');
insert into main.catigoury (maingroup, subgroup, catname) values ('Drywall & Acoustical (MOB)', 'EIFS', 'Landscaping & Irrigation');

insert into main.catigoury (maingroup, subgroup, catname) values ('Painting & Vinyl Wall Covering', 'Drywall & Acoustical (MOB)', 'Rebar & Wire Mesh Install');
insert into main.catigoury (maingroup, subgroup, catname) values ('Granite Surfaces', 'Fire Protection', 'Masonry & Precast');
insert into main.catigoury (maingroup, subgroup, catname) values ('Termite Control', 'Overhead Doors', 'Drilled Shafts');
insert into main.catigoury (maingroup, subgroup, catname) values ('Site Furnishings', 'Framing (Wood)', 'Structural and Misc Steel (Fabrication)');
insert into main.catigoury (maingroup, subgroup, catname) values ('Painting & Vinyl Wall Covering', 'Marlite Panels (FED)', 'Site Furnishings');




insert into main.date (year, month, day, time) values (2009, 'Rabbit', '7/18/2022', '8:30 AM');
insert into main.date (year, month, day, time) values (1992, 'Trans Sport', '7/2/2022', '10:06 AM');
insert into main.date (year, month, day, time) values (1987, 'Excel', '10/12/2022', '2:07 PM');
insert into main.date (year, month, day, time) values (2004, 'Allroad', '7/22/2022', '8:53 AM');
insert into main.date (year, month, day, time) values (1996, 'F150', '2/19/2023', '4:42 PM');
insert into main.date (year, month, day, time) values (1993, 'riolet', '6/26/2022', '1:32 PM');
insert into main.date (year, month, day, time) values (1986, 'Grand Marquis', '11/13/2022', '5:03 AM');
insert into main.date (year, month, day, time) values (1991, '944', '9/9/2022', '9:26 PM');
insert into main.date (year, month, day, time) values (2012, 'LS Hybrid', '3/11/2023', '4:48 PM');
insert into main.date (year, month, day, time) values (1997, 'G-Series 2500', '6/18/2022', '3:42 PM');
insert into main.date (year, month, day, time) values (2005, 'Aztek', '7/11/2022', '7:52 AM');
insert into main.date (year, month, day, time) values (2004, 'Colorado', '7/26/2022', '1:25 PM');
insert into main.date (year, month, day, time) values (2009, 'E350', '6/2/2022', '6:10 PM');
insert into main.date (year, month, day, time) values (2010, 'Outback', '1/31/2023', '10:08 PM');
insert into main.date (year, month, day, time) values (1995, 'M3', '12/28/2022', '2:41 PM');
insert into main.date (year, month, day, time) values (1984, 'GLC', '10/24/2022', '6:25 AM');
insert into main.date (year, month, day, time) values (2010, 'Cube', '7/21/2022', '11:36 PM');
insert into main.date (year, month, day, time) values (2005, 'Taurus', '12/29/2022', '6:06 AM');
insert into main.date (year, month, day, time) values (1998, 'Savana 2500', '8/2/2022', '6:17 PM');
insert into main.date (year, month, day, time) values (1994, 'Grand Voyager', '10/23/2022', '12:13 AM');

insert into main.date (year, month, day, time) values (1995, 'Trans Sport', '9/24/2022', '10:52 AM');
insert into main.date (year, month, day, time) values (2006, 'Pajero', '7/10/2022', '7:17 AM');
insert into main.date (year, month, day, time) values (2008, 'M5', '1/12/2023', '8:44 AM');
insert into main.date (year, month, day, time) values (2004, 'C8 Spyder Wide Body', '5/15/2023', '1:12 PM');
insert into main.date (year, month, day, time) values (2000, 'Viper', '9/28/2022', '1:42 AM');




insert into main.location (countryname, city, stat, zip_code) values ('Honduras', 'Valle de Ángeles', 'kumba', '8');
insert into main.location (countryname, city, stat, zip_code) values ('China', 'Taiping', 'kumba', '6');
insert into main.location (countryname, city, stat, zip_code) values ('Russia', 'Zimovniki', 'kumba', '376');
insert into main.location (countryname, city, stat, zip_code) values ('Indonesia', 'Siderejo', 'kumba', '5693');
insert into main.location (countryname, city, stat, zip_code) values ('Ireland', 'Boyle', 'kumba', '7249');
insert into main.location (countryname, city, stat, zip_code) values ('Russia', 'Reshetikha', 'kumba', '23');
insert into main.location (countryname, city, stat, zip_code) values ('Indonesia', 'Gunungkendeng', 'kumba', '80');
insert into main.location (countryname, city, stat, zip_code) values ('France', 'Bonneuil-sur-Marne', 'Île-de-France', '290');
insert into main.location (countryname, city, stat, zip_code) values ('Portugal', 'Boavista', 'Porto', '6392');
insert into main.location (countryname, city, stat, zip_code) values ('Trinidad and Tobago', 'Scarborough', 'kumba', '5832');
insert into main.location (countryname, city, stat, zip_code) values ('Sweden', 'Falun', 'Dalarna', '83');
insert into main.location (countryname, city, stat, zip_code) values ('Morocco', 'Gueltat Zemmour', 'kumba', '5180');
insert into main.location (countryname, city, stat, zip_code) values ('China', 'Tangzha', 'kumba', '616');
insert into main.location (countryname, city, stat, zip_code) values ('Portugal', 'Oliveirinha', 'Aveiro', '9');
insert into main.location (countryname, city, stat, zip_code) values ('Jamaica', 'Old Harbour Bay', 'kumba', '509');
insert into main.location (countryname, city, stat, zip_code) values ('Philippines', 'Javalera', 'kumba', '371');
insert into main.location (countryname, city, stat, zip_code) values ('Indonesia', 'Oefatu', 'kumba', '908');
insert into main.location (countryname, city, stat, zip_code) values ('Philippines', 'Pola', 'kumba', '498');
insert into main.location (countryname, city, stat, zip_code) values ('Indonesia', 'Seupakat', 'kumba', '505');
insert into main.location (countryname, city, stat, zip_code) values ('Indonesia', 'Sindangsari', 'kumba', '3873');

insert into main.location (countryname, city, stat, zip_code) values ('Japan', 'Ginowan', 'kumba', '98093');
insert into main.location (countryname, city, stat, zip_code) values ('China', 'Duanjia', 'kumba', '05858');
insert into main.location (countryname, city, stat, zip_code) values ('Brazil', 'Itajubá', 'kumba', '420');
insert into main.location (countryname, city, stat, zip_code) values ('United stats', 'Irving', 'Texas', '1996');
insert into main.location (countryname, city, stat, zip_code) values ('Russia', 'Staraya Russa', 'kumba', '72810');




insert into main.media (medtype, medname, med) values ('audio/mpeg3', 'Lorem.mp3', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAI9SURBVDjLjZM7aFNRGMdTA+Jg8UFx0qGDi4PgoERE6qCIUJxEwcFOdhPEdhB0FVQsmRRbaM1mhdIhtUVBwzU2mPf71bzfuTEUb9repiVNrr8rNsQaJcOf795zz//xffccjaIoml3IsrwP9KnPlUrlWOe3f0GzR0Cr1mq1eqhcLk8Xi8X5fD5/ricB1bnD/Qnkl7lc7mEmk9lIpVKWeDx+o6vA79gqtGotlUoHIOcQuZnNZvWQX4HxaDSaDIfDbwKBwP69An2dgHyH2JtASCaTfoSGVlZWPodCoXuQjV6v1+d2u093nUGhUNAS20b/C7huETsM2RiJRCZIdtHn8y27XK5vDodjuasAkS+DFCk+pdNpN2QRZxmBEZxtfr//fiKRuG61WtcsFsuDvwQgzeO8GovF1MFZqRHaMHo8nh0wS/RxyF6VbDabi4IgDLTJEE6hnqDGcZQZ2A9amsJVJMlHu92+ZbPZRNYvITAKOWsymUbaAvT7mknXgcSmPANbJfYGKT7gXGRNUAUgrzmdzq/sG263gPFxXDI41yA2+ehiYGUGtslmiRROyOr7AjM5/8dvbL57q9teWvwiLr6vBYPBdZJ42NjEVaKW6LlGnWUGg10P0s7MtKE1N6c0nj5TKhN6kdg1XOv0vA5xivrfO6HZfvRYak1OKi29Xqnfuq3Enr9oEHOJI3yyp8skXxs2NO6OKq2xMaV+5aoiXhgSOJH9vZB/CUhnzuq+nxg0FI4MSLmDhw35/qO63cvVi8BP3IoJNAAt5FMAAAAASUVORK5CYII=');
insert into main.media (medtype, medname, med) values ('video/mpeg', 'Penatibus.mpeg', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJzSURBVBgZBcFdaJVlAADg532/75zN/XSstrM1YVBUpEmtycigG4sQu7FBl0VE5GUdooiuRj/3RRdddBNE94FgFkJqehPBQLLInEMHbXZmDvd7vr/z9Twhe8v+5rQFqQ6AiAiACAAoseqLfMXHaXPagseOdUwcIWkQU0IgBkIkBmJAQkBAXbH6W6f5w2mpVMfEEbKEyTkSdP/kziIxkkREEoRIXTMyRnuW9ulOCpIGcZBn5gHzFDtcP8fSGaptBOoagY3bDD5In6iPkLK7xu/fs3yZnXUawxx6hRNfMnUUECgKegVlTk4qIgZ217j6HTGQRsZmmHmN1jTPvsvi1yydIyvJM4qKHlFExOQcr37LC5/y6Ek2l/n5Q1Z+AWZPMTFDltErKUpyUn1ICGgMM36Q8YMcmufyZy7dLHT/uW47GzDQeFNr9g3HL7wuFhU9UhEBd69w9h3ah3linuFxl8ZO2SyGPD01Im0kuvdyG1uZi49/4FjvJ3KiiBipI3tdVs5z/iNuXXB7e8AjE0M2smBts1KGxIH2qG7rSfKKnFQfAknN0fdpjLBykcVvbLc+0Ww2lFmpX5OVtcE0UdYpZUVOCmLN+GGm5oC65OpZQ+2GvKgUFWW/BnVgd2eHsiYnAoG9dYpdYP0GWebA3jVbe5XRfamhwdR9Qw1rdwv1f9esbt2jJJWjLlHx43s0WqxcISs99cdXljZPuvHQi/o1Wzs9xb9/eX68a3WzqWi1hPptn3v5REd7jhJVQVFRVBQVeUVRUVZU3NrccmffoAcenvH3r2fKkB23vzlpwaSOPkr0kCNHDyVylMi5ef+o5edeKqu6n/4PaywNA5LOKLcAAAAASUVORK5CYII=');
insert into main.media (medtype, medname, med) values ('image/jpeg', 'Id.jpeg', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAFYSURBVDjLY/z//z8DJYCJgUJAsQEsuCQeHIgP/f/vX/H/f//9lFyWvCLJBff2xPD9+/27kV/O3xxIl5HsBaCmAj5Zb00+SUOGPz9/J19fF2BKtAG3NoVoATXl84oIMPz9tIlBXC9F4O/PX7WXl3iwEjQAaBPTn5+/KkW1ooUYfpxjOLVoKQOPwHeGPz9++QCxH0EDgDa5cQnrxfAKfmP49/M+A8P/fwx/v5xmUHQoZvzz82fzqUmWvDgNuLjQjQ1oS4uAnAHDv2+XgHq/MxgHqzP8+/WMgYPjFoO4boQm0HWFOA0A2p4qpOJtzMX7huH/n7cMDIzMDGfX3QIFKcO/H7cYRNXkgWp+Zx9q0tHCmg7+/PgJ9Ls/0MgHDEx8okCR/wxmSQFwe5g5lRmUXMvFbm1uagQKhGIa8PMXx7nZwd+BCQfo/H9I+D+cZgDR//9LILuAcehnJgBMs6gZ4tipDAAAAABJRU5ErkJggg==');
insert into main.media (medtype, medname, med) values ('video/mpeg', 'DignissimVestibulum.mp3', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJCSURBVBgZBcFBi1VlGADg5/3Od+/cYWjUTYlRS43Zi1BGuGlVizZB0EJaFf2JNpHgPt1kBf2EXFlEZFFCUJsIsWmhI07iqOPM3HvPPed7e57ITAAAcO3mw1wOg2Fo4PbOo6NoGfuL4d7du4tv+r29yz9dfXsemQkAAK78cD8/vHDKw4Mm0DKtxqZ2fP3bE7/f2vn2wb2d9yoAAMA4psdH6c7DVEpaDc3+fPDG6XXnzxy3MS1vXf/u4LMCAACQ6IJZZdqFaRdm0+K/J3NnTnDx3DEb07WPCwAAAEQw6ahB7cKsFtt74eb20tN5mtSi3r5+9o/Z5tZWRAFASp8KoSsFiNRastaJErquk6iR5ZWXzn85iQgSkghu3NdACE0XTGsRmVoLESGTasiF1q8tH1wx9h1lU8Rzfrz1souvv6gWShQt6YLSMGW9kpmqVZRsvbGfypYOt3/29O8/XTrO7hcEEoEOHWZoH/xCC1XkrA1z+9t3rPZ2tNXCibPvq1sf2dzoZBZAyqQU/vn8nOVwIFqJalXU9eedvHAJjUypOXrwlf4ZKWQWhBTq5mtgWja1HPpqlZnjQr97DQloDudFP7BcsRpGi34wX/aOv/BYxbuf/Lp7bGOyXi1ltoFAJhptZXNtxXQpxwXtUBv35fDU7NSb/sWNy6+ehKrPDCOZ5Ej2si1pC5lzOR7J8UAO+3J8hgYAavatDkePtGFCFrKTOaGtybZBrmT2RE8ZjIsFAKi5WP61ffWd0xIBAAAASMT3tLwN8D9pITwp1Smo1gAAAABJRU5ErkJggg==');
insert into main.media (medtype, medname, med) values ('application/vnd.ms-excel', 'Mus.xls', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAH6SURBVDjLY/j//z8DPlxYWFgAxA9ANDZ5BiIMeASlH5BswPz58+uampo2kuUCkGYgPg/EQvgsweZk5rlz5zYSoxnDAKBmprq6umONjY1vsmdeamvd9Pzc1N2vv/Zse/k0a/6jZWGT7hWGTLhrEdR7hwOrAfPmzWtob29/XlRc9qdjw8P76fMeTU2c9WBi5LQH7UB6ftS0B9MDe+7k+XfeCvRpu6Xr1XJTEMPP2TMvlkzZ8fhn9JSb+ujO9e+6ZebbcSvMu/Wmm2fzDSv3hmuGsHh+BAptkJ9Llj3e2LDu2SVcfvZqucHm0XhD163+mplLzVVtjHgGar7asO75bXSN+VMia/KmRHxK6/P/H9ni8MmjwqrNoeKKKkZKa1z37F7H5uefkTVn9Ac2NK5O/L/lytT/F57t+t+/O+t/eL/uf/NsqV4MJxYtfXxmwo4X/4F+NYaJxba7fN94ecL/jdcm/QeBnj2p//v3pAMNkPyOYUD8zAcbJ+189d+z5UYOTMyn2vD/titz/iODTZemggzADCTvlpuNE3e8/B/Ye2sJTMwyR/p7966k/+27EsCa23cm4HYBMGq82zc9/5+3+NEzx4orbCAxoMKW4B6N/727UsA2g2gQHyjeg2EAMGqEKlc9/VOx6vF/29JLgTBxoOIOIP4EcjaU7gCJAwAM9qYI32g+agAAAABJRU5ErkJggg==');
insert into main.media (medtype, medname, med) values ('text/plain', 'AOdio.txt', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAQAAAC1+jfqAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAB+SURBVCjPpVHbCYAwDLyIIzmEX07hCH64nAOIuo1Sq+CZ1ueXVsyRBJrc5aBCPEeEvwuxK9XtDn0Si/ZU9gUg2Z/dYEuiuxSI5mRtwyuEIR5KOpVZYRUjjMLVVkIVCk6YPPdg1/LNQ87xdtl4JauaQ7CHjAfXeK5FH+7h9bNWB/9J3PASf8kAAAAASUVORK5CYII=');
insert into main.media (medtype, medname, med) values ('video/mpeg', 'UltricesAliquet.mpeg', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJ7SURBVDjLpZNNbxJRFIb7A/wF/A5YunRDovEjalEXJm5M2Ji4aFoTI6kxjcVaCGOJYtq0NlBJ0AS0tcbWSkeQhhQopQwfAhYotAwIAwPDUI5zLh9SdedN3kzmznmfc86dc4cAYGhQZ2ZAJkkhSSlJ1ZWyuyf7M37QeEqSfOxNWW37uk+5fVF6Z3ePDQRD7KY3TL/eSFAj1qIaYzD2BKBrPm1xZjWBvTiTK5SB45sgHreJKjUBMvkiuLxBZnY1rsHYHqQHkKM5GP7O1Rsi4OKFFhS5JrCSqo0W2eN4ATY9fs60HEGInACwLywbM/fMR2UB9gt1yJUEomypAYk834esrruYO4s5bEeGAIWN/kFh2YNmldZ7wjw8uUX2cYUTB2Cwuin0IkDp2o7Q2DOWmjqqw6WHTgLIFBsQz/Fw7p6DAPBbuSbCYYmHuSUHjV4EqPw7uyweVv6nABfHP0vaIAbMfHbMLskBVx97yDtWIYjHsGheYtFLAL5AkAAKlSZcm/LDhQefCACBlx/RcP7+B7gy4SbVdKpowtz8qz5A+WUrRJe4BlR4EdKs1P8Tn9TCNiQPOwaEDU96IXZQI38mmi6BwWTut6Awr8WoVKYA7TYQA5Z5YzpAMqKw9OtP/RDJ1KDZasP6txBojO/7hyi7azlSrzk9DFvunDKaMDtmjGZrxIhPTBCTsuufLzC3jNHOb+wNkuFtQGP/6ORyxSoJLFVFUg2CcJgwczRdBJ3Jwo0aln8P0uAoa80ezYLVzrj9MUjlyuRMsOdQkoUVZwC0hllmRP/u71EevEy3XybV4y9WqKmZedrwzMhO6yl2QmeiR3U26iYV/vdl+p/r/AvMhAk86cw6LgAAAABJRU5ErkJggg==');
insert into main.media (medtype, medname, med) values ('video/mpeg', 'RhoncusAliquetPulvinar.mp3', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJ0SURBVDjLlZNbSBRRGMe/2XRWZ2/D7G4sSuYaKVurhMZaIRbm6iaGERSSbz0EPfTSQ4j0ZNRLQq8WPaQgPfQaIWmUJWwrSYolkW2ul7S0Rrbcy+zM7vQ/EovJ2uXAj/+c833nu5xzhtN1nXKN+h6Jc1Sqma/fhPHn574cpG2GYTuDt9quHbe0U0vRiZrqXvHZfwXoHqnTfaZWg8ceII90jPy7mo5W9Vjv5fLltrZwa6RJLzbVkstWQys/FiiakEng7TQ6N0iD7x4vhK+mSjb7522NmFb56PRqKF+OyYLbcQQlFtCT8H0aW5ygHUTiX1uYX75WL690C/PRScwyZDDoNCtPU1vlKB0ueGBpvXy76o8BTpUmu1x5CpGWT6Rn0CMrk6fIdIQcXJwaSjMXfjuDqampXk3T6gGpqsqDMq/Xy918eoaUtEJriSjF1QQdiHcmTjYcKhweHo6nUqk5RVEIumrARs3pdHoQzIOFKzzPc8Fg8GWj2EW1+qX209IN8lPn2d0OoXBoaOiuyWQSksnk9YqKCg+ClHGhUGgPx3EfYrFYMQLIYB9YgnEnywTc+I5Ai6CfoS6wZjQal2RZfmTw+Xzh9fX176jgExxaYBhHBr8gCJPQgNlsfg1thr6FPWCz2Zg2ut1u1sKLjXcwiIHJeRhYBeXQZWgJ9COrAMyyOWDrTpyTDCLovm3jFpDhzqYKJlkGq9X6imUURZFVFJAkaQLzJugbBGlGgCUwln2J/f39KgwWOJWy04WWQ2fAXvAezm6wCFzIvB9c7Ovrq8u+RGzIAwk4068ryoJNWdh149ApnU4/zPkv/Mvo6OjgmQ4MDKR+Apt6owU5Oz7IAAAAAElFTkSuQmCC');
insert into main.media (medtype, medname, med) values ('text/plain', 'ProinInterdumMauris.txt', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAQAAAC1+jfqAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAD0SURBVCjPfdExSwJxHMbx/yTc1NrUy+h1+AZ6GUJBaYdiKVwopjmYOASiINJgEVFwUFHo4BIiDtql/SPU5BDUQb8Nomh3J8/we4bP8MBPIOYpexdtPcvyyrO6ETxR5zGwAeiMeOfmxBE8MOKXKsWwA7hjSJceZbJhW1DC5BvJDy+kNRtwzYA2BgYSnUTEAgr0+aBJC0mbe85i/0AOkw4Gn8SH0Yo2CRGMrYEralyOq/SJzrRtBEJVvMoKyJCSyd3zZh2dUMZmZOotuYOIuAuYBKbqlgVcKPN7KhvccnRsAYv49/I0ODA9Lgfgcx1+7Vc8y8/+AURAMO9/VDEvAAAAAElFTkSuQmCC');
insert into main.media (medtype, medname, med) values ('application/powerpoint', 'IdMaurisVulputate.ppt', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAMBSURBVDjLTdFNaJt1AMfx7/OePGnypE27LbNrcbpZKagTqQ6ZjsmGOETxoKiXwURlgkz04sGDeFGYMhEv7ii7DAU9dXOgMCcOy8bYRLtRN03b2JekadO89Pm/eulqv/C7fi4/x1oLwJFvp8eAkzuLmb0daehIgzSGrjIrwCpQAzTQAOrA18APPusZpR59cFvP3nefHGBzbWGSjjBJY00PCgmrqebvWovxv9oHgeObga2F0AFgelkTOA6+A54PUeAyFLl4rkvgwZ7BLNuTXN+p36qfbgBjhQujh6KfWLpu8YXBaEOqDVZLIIdz3wkIt3BX4vH+6QqfvDrMr7eCAR+gfvWAN5obHS31lvGCATJSYaVCiy7dxiQrpRexth9PgAEc3eTSrQZXKitVF8Bqs2Mk/nNnkB3GtP/AcXMYrVhbvsl8zyus5J+hnUJbGrAw30z5/PxUUwtxxK9d3h9abV7L94144GG6c+CnNP45T630Fq3keZDgYfGti7GgA40S6u7v33l8yTda77HKvBHld2FVF7wySIk2Hn63QjJzEtQaxsmjyi9g7RAqTdFSaQDfKvNFpvRIf7c+iVGGML4XjE9p+wHi+nW0FDSrV2ne8yFuVERqTavdUUATwDVKn6nevnbquysxNtzNwtQ5VNpGri0jOjUW9DD1sXOIHS+RzcbUWykqFfNnP3jaArjlJy6dOPbjsc/GZw+S7Hod0hadhd9ZrFzm396jNO//GJUZBgux77LY6KJFWr1zv7/v+Ol+4KOxkSFmfn6bMOpjtlumNvIVYTZP4FiC0CH0oBDD1HQHJcT8BqCFeAo4vFoZZ3nLFBfSo9xQj5HO1hFqEaUNxlr6koQ3D21jrt5BC7H4PyDlw8/tfyD73uFeLM/yUHE3ANqC1BahAAtfnq0SB7Da6qClrG8Gbs/VVjgzkVDsyVIszFHMRSS5iHwcEoUuke/y8r6tRD4sLq2ipZzZAIxS31ycmBy8ODE5DJTW17u+JBMGQSYTUMhlKRZirt2Yvgn8cgf4D/BEgoyc1axMAAAAAElFTkSuQmCC');
insert into main.media (medtype, medname, med) values ('application/vnd.ms-powerpoint', 'Tempus.ppt', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAH5SURBVDjLpZK/a5NhEMe/748kRqypmqQQgz/oUPUPECpCoEVwyNStIA6COFR33boIjg6mg4uL0k0EO1RFISKImkHQxlbQRAsx0dgKJm/e53nunnOwViR5leJnuZs+973jHBHB/+D/ah7X2LXWloilyMw5YgtD3CDiBWN4Zno8bQcJHBFBucauZfsolZDCru0OfFcAAUISrLZDfPzSKxuiibOT+T6JCwDMtrQzYQvZHQ5Cw2h3GK0OI9AWBzJJZFOxgtJUGpTABQAiLu5OOviuGIEWkBUwC7pasNZj7N2ThNJUjBQY4pznAoEWsBWwxU+JFXSVRTzmQWvKRR5RG4KVGMgKrAVYflexAAugDCEygdbUCI2F7zobk7FZY76DIDQgrT9HCwwt1FsBhhIu4p4D3kiS8B0MJz28ftfGSPfl8MPLxbGBAqVpptbslJc+fEPMA7JDPrIpH3FX8LzaROdrE5O51jalgid3Lh4b6/sDALh6971riErGcFET58gwDPGndG9JT6ReHcwfPorGygu8rdxvGxMeP3XtzcofgigWZ0/EtQ7n0/sOTe0/Mo7V5WeoVu61z1yvZzZX+BsnZx9opYLpevXp7eXKIrL5UWit0n0r/Isb50bjRGreiyWmgs76lfM31y5tSQAAc6czHjONXLi13thygih+AEq4N6GqMsuhAAAAAElFTkSuQmCC');
insert into main.media (medtype, medname, med) values ('image/png', 'VestibulumRutrum.png', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAHdSURBVDjLjZNPaxNBGIdrLwURLznWgkcvIrQhRw9FGgy01IY0TVsQ0q6GFkT0kwjJId9AP4AHP4Q9FO2hJ7El2+yf7OzMbja7Sf0578QdNybFLjwszLu/Z2femZkDMEfI54FkRVL4Dw8l8zqXEawMBgM2HA6vR6MRZiHraDabH7KSrKBA4SAIEIahxvd9eJ6HbrerJKZpotVqaUkavkMC+iCKIsRxrN6EEAKMMViWpQT9fh/0k3a7PZZkBUPmqXAKCSjAOYdt21NLUj1JBYW7C6vi6BC8vKWKQXUXQcNA5Nh6KY7jqJl0Op1JwY/Hi7mLp/lT/uoA/OX2WLC3C9FoQBwfILKulIRmQv1wXfevwHmyuMPXS5Fv1MHrFSTmhSomnUvw/Spo3C+vg3/+pJZDPSGRFvilNV+8PUZvoziKvn+d3LZvJ/BelMDevIZXK2EQCiUhtMDM53bY5rOIGXtwjU3EVz/HM5Az8eplqPFKEfzLR91cOg8TPTgr3MudFx+d9owK7KMNVfQOtyQ1OO9qiHsWkiRRUHhKQLuwfH9+1XpfhVVfU0V3//k4zFwdzjIlSA/Sv8jTOZObBL9uugczuNaCP5K8bFBIhduE5bdC3d6MYIkkt7jOKXT1l34DkIu9e0agZjoAAAAASUVORK5CYII=');
insert into main.media (medtype, medname, med) values ('application/powerpoint', 'At.ppt', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAGGSURBVDjLpZM7a1VREIW/fXKTIhAfVSQIIY2PWkEELe0FiZVgWkvBVhCsrLUQ/AdpxCKIhelstRCiAcFExEbRhAu5j71nLYtzvSeHXF9kYLOb2d+etWYm2eYw0QFYefTmNrAIXALOgY1JyFRVokogCQU70x1/OH3yyHlk7lw7k7DNzYevn/g/48Hqhm3XFQCXAW6sXscIy4SEJCKCCBEKIgJJvLi1zvtPO4OxBOQTAMM8ZH7h2B81b25sA9Dr55kxwPYsQM6Zz9tfsY0MViC51m/j0Q3giNQA5A7A05W1f3ZfIfYDEsDyvZf0JWRYu3+Fj192Jz5eWjiKFQBUNaCmfetlLpyd53uvjJPnZmda51e4tAC1rm4/yDZ7g9L6MYfJ0R44qTSANKpgMMj0chD9/FcPXIb7PKChT5rs6al0EODSAFRkIAE8f7XVSuzuDSdXMOpnByCkLWDp7eOrB9z+rQT7RzOJoWfLd9dP2b6IdFwqYGEFVgEHlqg31wZ1oXoHkA67zj8BVEcprN9nEQAAAAAASUVORK5CYII=');
insert into main.media (medtype, medname, med) values ('video/mpeg', 'AtFeugiatNon.mpeg', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAKkSURBVDjLdZPfS5NRGMf9B/wL+keCbr3wStArL/RKEdQLCxGEGqLJgkQx0A31IsUmKRbohSxds2Ws0ja3ynLzR20sdb1be3/YptPt03OmSRN64fOel/f5Pt/znPOcUwFU/Ev9A/ctYUQICpqQESKCU8Wu6/9NrBQcQv5FIMbnuMG31Ck/rDMS6WNWgnFU7FJTWWZwmex2rUY4LxRJGPB83eTZR5N36VNyIioIKqY0SvvX5K+BQwX0PKXHEvW0T2fS/4uwXqAo/2TAKFzEL00cJQP5uCkUYuk8029TRFMXoqVADufLFLvHlCo4kpcl46miWFQGBZVbmn1Z1rf00WDCpzG2qvEpATtH8DZqyXJOSJ9AUgwMKSVzDqawfLEnDmUQCsd0pt78FIMkzldJFoMGc2u7SnComH+zhyVJTqeTr9oZ4R/nhGOGioeUQWor8VtmTjImyeNi8n7PUsED4cYlB+MTE3i9XoYejTC3npYqs0qTujJwepM4PEeMeA5Z3y83eDw5ic/nwzAMPB4P9+0PCcWsK4NQ6HsGh/ewlDz7QZeNLKLKVuW7XC78fj+WZbG1tUUmk2FhYYG7th7q7Uvhq0307+cIJyGehT1T0GFmZoaNjQ2y2SzxeJxIJEI0GkXXdZRxc3MzV23MS2uS0qPtDAQO4XUMpqafMCFrHx0dZXh4mIGBAex2O729vdy+fYeGhsZs2UHSpF1hDdYkeXmnyOKXM+bDOWaDWVwbFk8DJuuxfPlBun6UE2aRTalgZeecwcFB+vr6sNlsdHV10d7eTmtrK42NjdTW1uZqamr472UKfjfo7+/H7XZjmibb29sEAgE2NzfRNI2hoSGqq6vLr+b163zP1lPs7u6ms7OTjo4O2traaGlpoampibq6urOqqqrjPwDsCp2+T9HiAAAAAElFTkSuQmCC');
insert into main.media (medtype, medname, med) values ('video/mpeg', 'Vel.mpeg', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAIxSURBVDjLfZLPi1JRFMffPzGLNkW7Ni1aJUitI4IWLVpm0RTUohazqkVU0GhjGcGU1NA6dFQ0FX09QVHxVzr+eE9RRMw0NVslPcmn8517nulkOj44XO6953y+33Pf4SRJgiiKyOfzyOVyyGazyGQySKfTSKVSawC4VcEVCgWMx+OFaDabKiQej6+EcKRMBY1GQ1Wu1+szCJ0xF4hEIkdCOLJMyaRGB8lkMt3v96EoinpOwFgshmAwuBTCkeo0kRX/YZYbg8EAnb6CwLeJk1qthnA4jEAgsADhSHlqeTQagYp//B7j+d4+nn4BhMbkrlqtkgv4/f45CMd6lHu9npo0HA7RZsqGzD7eiMA7CdjaO4RUKhVyAY/HM4NwiUTiHOtR7na7alKhp6jKZgb4UALeF+ch5XKZXMDpdKoQlRKNRrWsR7nT6ahJxZ8K9OkxzNIhxJAB+K8TSKlUIhew2+1rs15CoZCW9Si32+0FyA4DPPpkx/23Otx6eRk6/QU8MW9gd3f3xNyLsv60giDIrVZrBnnGIA8cH/HYeh1ucRvZ7zxMn+/gquk0zt49Zlz4rzzPa30+n0yTSBCJQa4ZLsJZeAVn8TXNCozCOkzCbQIMlk6X1+vVut1umSaRIJcenoFX3MG/nyu/TYCjZ9zlcmnYS8s0YOfvncQWfwObvE4t3vTrVjuYhsPh0NhsNnnDtI4rxlN4wd9UlWml/dI3+D+sVqvGYrEcZ8l6Fr/I9t9VT/cHUXogzRNu46kAAAAASUVORK5CYII=');
insert into main.media (medtype, medname, med) values ('video/msvideo', 'Et.avi', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAACzSURBVDjL7dI9C0FxHMXx8zruG2SSUjKgXwklw2WxSB4yGC2iDFyDpwj1T1LK00jq+hduOt6AwU02w1k/deoLkvhm+APvAVRpoEpBxVEoaoX8SZDbG24AkcWTrZ3D+ubByPBCmEv5HCjfVXPrMNq/0WdpZuaaSI3U50DhomrrG/2WpqdzZWJiE7G2CyB3lPDgTHOmGR/bDHUPRLDk4kJ2ZSA9FSR7CtJQCOQF3rjxL/FHwAu8X+2ABKJChQAAAABJRU5ErkJggg==');
insert into main.media (medtype, medname, med) values ('application/x-troff-msvideo', 'PurusAliquet.avi', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJASURBVDjLhZLNa9NwGMe/WRKXpp19L6WrdVsZHgq9aBF2cFDRDi8WxJPssqMXDx4H+xuGFDz1YC+eBvUgnWDc0FqoL+CmHlylthurdWqG7bY0zUvtL5CSxYOBh+f5/fJ8P89LQg0GA9ifu68XMzOB8INJ/kL8WKGwf/y5WW817z/KrBXtuZQdMBRfuz5z+emcb4E97LvwtXsG3aMOfiiP1Y0Pwu3ineenIGN24nm//+GsN8U2dQ3bf4BnByJe0luIhsKM1+Fatecz9ovZs9NT7+QaPFoKG3sStOgOPrFPQP92YtoTif4XoOkyTmTgTUvHN5EBdxKFo7sEyr2Jnlr7Z1+jEarVqlCpVAa7P0U6pEg4kmqgxjgcfPdAP9xDnAPqu7/oQqEwyOfzwinAUDzvcDjSyWQSVzxZ7Oy/RSZE45JXw9w5BTeTW/jSfo+l1D1ks1kEAoF0LpdLj0ZQVXXF5/Oh3W4jPD6Ji+O3UNxeg6q9AsP28bHVwo2pRfBdHo1GA/F4HPV6fXkofUGVy+V5nuc3Y7EYOp0O+v3+yIZgkM9MURRomgbLspiYmIDT6YQgCAR2lVEUZSUYDGLojSSO4wwz/w/irbGu6+j1ekgkEqjVassMqSJJEkRRhCzLoyRN0wxvns07cmYYBm632+iQANKkMmnZTLAL7GfiXS4X6TpNRjBIxMyq1sp2iPnO1DGm0BTbIfZRzJ2Q2AAQkt/vH1WyJpjLI7F1ocQikcgIsF4qlRbMlqwjWWPrmJau1/8CtF7RM3ksOU0AAAAASUVORK5CYII=');
insert into main.media (medtype, medname, med) values ('application/msword', 'VenenatisTristique.doc', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAK2SURBVBgZBcFNiJRlAADg532/b2Z2Z9fdUdfWUlwNooJIFNryEEUSBAVCVy9eIrwJngqCwI4Jdg46VBIdukRQtBAdOliUHQ0qlbXE9afdmXVn5vt7v54ntG0Lznx1axWXHh/MnBhXybhKqpRM6jTENu6jwSYe4DN8nwOkun7+6P75E+df2gcAdsq0OC7T4ua0OVhWbBeNm/cf+vbvnVdxLgdIdb280A3g1lajE4I8kOX0OtGhXpTFqJNx7OCsxxbn9nz8y+2LEaCpqoW5nDqxXQbDiq2C4ZThlAcT7j5swDuX1504MueZpc6+HKCpqj27utFOwc60EWOQI8uIGZkgCySEZuTK9U1X14e3c4CmLJcXZzPDSW1ctGJsZZHYBFkk08oytJmNUeGjtb9GOJMD1GW5srzQMZy2any99qddPcZlbfd81+27EyEy38882u/aHE0Wfvj932EO0JTFyv7FnmsbjRCZjKdeWX3SqePzvrnyj/dOPw0APv3xnpTCzxFeu/DdrKbu9jpR2RC1xkXlv+0arP26AWBaMyq4t1UKIYlQF+W+XiAGErTEGGQtVZNcPHtcSq0mtTJJP0+KojDaKeXQlEU/n+vKI1kMmhTMdKJpUfngy5tioG6S1CQt2ralpd9J8hfPXV7ChdWnDrkzat3caMzNUKdW0dSy2EEraIQQtKnVtkldV8qyljdleRKv/3bths1J7mHRqprW9rjSCbmzb+xSpxKRljYkM3nXh1+sezDakTdVdfzUy8/Ovnv6BQDw5vs/yXQkE59cfdtS/5Aguje+5a3nLolmjItS3lTVjTv3hz5fu2YwP2uwMGMw15PnmcP7WZ7fdvLoqkH3AJGt6QGPzNX6XfIQhGOnLy3hHFawF3uxO/aPHH5iZU9n0BuYyRfUqRJSEtpGCmN/rF93d1T5H4CHTHMseNtCAAAAAElFTkSuQmCC');
insert into main.media (medtype, medname, med) values ('application/powerpoint', 'AmetEros.ppt', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAHnSURBVDjLpZM/a1RRFMTPfXv3L5sYIXYSxMbCWsTCOo1JGlPYWKeyshE7v4JNwCZfQRBBBBsLERsbv4K1hGz23TMz91i8t4muleQ0h1vM3B/MnBQRdpVJz78c3Y8wq5KJMlJGyOg0OAyrXbr9/tmnr38a5IjYFOtnUUawE+NvkZfVGw/XCTIhE5Ums/GL0WRklZckWCM5P1vuHBzvPuhJXvUGNEJpPB3d8sLXgoYEh6IGdGYAGc4Gjrw4XbbD0eA7Ch5fEMBpdCY4Ex2T2cb0TcQ4VSqRSiQToUSnTefTiailt37t4Hj3GxyWUWBwNMTY4Byb2Z2zX4uXVdoi61zSlqg5wZkv/UatsShLH1iynyjYz966oSMwFI4IWUS9LdWNKm0ImhEYwzV050xSeMHALBovsFzajgAFqRSfEDSx3hQ1AzShYwTnAI4BWh+SGnoLC4uKQusJcK9dtNuL0+XdzetzK63vEMwXwi7GhAITa+PFI8IqHJbfHn34aGZ2eLL3pMnNDxRYlYogEWzgSl0KNDgrnIHOgAQtr+LoSR5569ae+7YXJDhq/3ugIAAanQFnNTMQtLR+C4cnewHHOxQEHOGFtTOg4BBBsaMLUU/zejUvSMpllVf3QO+r3re1Sv8S/O80dsX5DaeOJ5G2UDDRAAAAAElFTkSuQmCC');
insert into main.media (medtype, medname, med) values ('video/avi', 'MattisOdioDonec.avi', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAEjSURBVDjLxVM7TsRADPVEK4oVSrGU1FyCjltwADrOQhOJe1DsMbbfYjsQ2g4h5cvM2MaeT1BIJNBSYMl69iTv+TOJYWb4ixWnEquqCpVX3x887bqxJSQAkgwRwEvsE97drM0wDLAooHZxXgBlsiAmJDl4ecPwTtd1ywJaXsmZqLFP5JBHPrRtuyyQ29Xq2nIU44mYWtM0ywJKOr7TOC9hjIOAOvwgcHu9Nr+5hYnAw/bI81EYvLTgBJ1lsA7BORIkeLy/MnVdTzu43JwFJPmwdFGjgNcRxH0BXsj757i8mQBzWhaqK4EDGZ1gyvV8+KD5LeRqPmCKQ/UYo3oSJ6L5DqwlOLz2ghiq6pzOxvZ1fuQvYra+73PrfJKXZcmK5t/+xmyf9PZAc1Cvzt0AAAAASUVORK5CYII=');

insert into main.media (medtype, medname, med) values ('image/pjpeg', 'MattisEgestasMetus.jpeg', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJHSURBVDjLlZPNi81hFMc/z7137p1mTCFvNZfGSzLIWNjZKRvFRoqNhRCSYm8xS3+AxRRZ2JAFJWJHSQqTQkbEzYwIM+6Yid/znJfH4prLXShOnb6r8/nWOd8Tcs78bz0/f+KMu50y05nK/wy+uHDylbutqS5extvGcxaWqtoGDA8PZ3dnrs2srQc2Zko41UXLmLdyDW5OfvsUkUgbYGbU63UAQggdmvMzFmzZCgTi7CQmkZwdEaX0JwDgTnGbTCaE0G4zw80omhPI92lcEtkNkdgJCCHwJX7mZvNaB0A14SaYJlwTrpHsTkoFlV1nt2c3x5YYo1/vM9A/gKpxdfwyu/v3teCayKq4JEwT5EB2R6WgYmrs2bYbcUNNUVfEhIfFYy69uci+1fuRX84mkawFSxd/4nVWUopUVIykwlQxRTJBTIDA4Pp1jBZPuNW4wUAPmCqWIn29X1k4f5Ku8g9mpKCkakRLVEs1auVuauVuyqHMo8ejNCe+sWPVTkQKXCMmkeZUmUZjETF1tc6ooly+fgUVw9So1/tRN6YnZji46QghBFKKuAouERNhMlbAHZFE6e7pB+He8MMw+GGI4xtOMf1+lsl3TQ4NHf19BSlaO1DB9BfMHdX0O0iqSgiBbJkjm491hClJbA1LxCURgpPzXwAHhg63necAIi3XngXLcRU0fof8ETMljIyM5LGxMcbHxzvy/6fuXdWgt6+PWncv1e4euqo1ZmabvHs5+jn8yzufO7hiiZmuNpNBM13rbvVSpbrXJE7/BMkHtU9jFIC/AAAAAElFTkSuQmCC');
insert into main.media (medtype, medname, med) values ('audio/x-mpeg-3', 'In.mp3', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAIqSURBVDjLjZPNi1JRGMan/ooWDbSKNq2sgZqh0UgqKVoOU7OooEWLgZi+JIaYGolaRAS60JXuxJWoIC6E0KAgAzGbCqpFmua393qv9+PoPJ33THPHcYy68HDPvee8v/e8zznvFIApEn8Octm4Zv6hQ1z7rbgRgE3X9S5jbDgYDDBJfB5er/flKGQUMEPBiqJAVVVLkiSh0+mgVqsJSLVahc/nsyDbwfsIQAs0TYNhGNDevIX29BnUxx50u13U63UB6Pf7oCR+v38LMg6gYCOdhnb1GgaeVajnL0CWZTQajT0lCU/GAea379AWFsHu3kJ/4TLUO/etUprNpthJpVL5C4Ax6I/WwVbvoe9+AMazMvrHzSMI7YT8aLVakwHs8xdoS1eguC7CeJUBa3fEwkKhgEwmI+pP8/Ly+fxkgP78BZj7NgYP3ZDn7FDXPGJhKpVCuVwW/tA7HA7vBawdPrJEmZl7hQc7IJ2YtwCxWEyUIgzmCgaDuwF157kDlVOnC+bKMmS7E8a79zA3PsEs/0Q8Hkc2m4VpmkLkB5URjUa3AMpZ1+uew/lVmnMw/cZ1qOtPrGOirKVSCclk0gKQQqGQOFYB6NnPKPKsfdNYvgnJdQnsV23XWRMkkUig3W6LMSkQCOyUIJ+ch3R8Fj+O2j6YHzc2J/VAsVgUEBpHIhHkcjkaDy0P/hh5jBuk0sQ4gO4AXSIa09b595Cv7YnuHQFME+Q/2nlb1PrTvwGo2K3gWVH3FgAAAABJRU5ErkJggg==');
insert into main.media (medtype, medname, med) values ('video/x-msvideo', 'AccumsanTellusNisi.avi', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAHMSURBVDjL3VK9S0JxFBWChvoHinap4UG6RIsihYMfiTboUFGhPVIbxAJFG5TEKM1U1CWENjEUigiyHBRnicrCwaIlXPqggldRnd6VkNqMti4cfvede875Xd57AgCCv0DwjwIkEkmn2Wxe8Pl8t8lkEm63+8pqtQ7w6OL7GnE0Iw1pfwSIxeJ2lUq1Eg6HUa/XUavVUCgU4PF4LlwuV7FarT4TVyqVQBrSkqcZIBKJRux2+32lUrk1GAx7SqXyzWQyIRKJwOl0gnriaJZKpa5IS57vG6x4vV4uGo2yGo2mQyqVPubzeZTLZRSLRWQyGRBHM9KQljzNAIZhZlmWvYvH4/M6nW5fJpO9yuVyaLXaBqgnjmakIS15mgF9fKnV6vNgMHiXTqdvstksEokEbDYbHA5How9t+mCLjX3MrGlg8Mreh+eYcDNAKBS28Sv2KxSKS6PR+GSxWDgeL3q9foLH0OzixItnawq7pzEcXecQOjBDH2IwYOkOtPStx/3D3PbJOrbPIqAKHJoQOmQpgGspQOUSYe90A99r5zhGAa39bYPWHm41Nw1/brJh9u9P/m4DXrg0GuhFMGds3EwnPbf8Dr5Clnk80Npf5zLxn1E7ljyteCJyAAAAAElFTkSuQmCC');
insert into main.media (medtype, medname, med) values ('image/pjpeg', 'VestibulumAnteIpsum.jpeg', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJ6SURBVDjLjZO7T1NhGMY7Mji6uJgYt8bElTjof6CDg4sMSqIxJsRGB5F4TwQSIg1QKC0KWmkZEEsKtEcSxF5ohV5pKSicXqX3aqGn957z+PUEGopiGJ583/A+v3znvPkJAAjWR0VNJG0kGhKahCFhXcN3YBFfx8Kry6ym4xIzce88/fbWGY2k5WRb77UTTbWuYA9gDGg7EVmSIOF4g5T7HZKuMcSW5djWDyL0uRf0dCc8inYYxTcw9fAiCMBYB3gVj1z7gLhNTjKCqHkYP79KENC9Bq3uxrrqORzy+9D3tPAAccspVx1gWg0KbaZFbGllWFM+xrKkFQudV0CeDfJsjN4+C2nracjunoPq5VXIBrowMK4V1gG1LGyWdbZwCalsBYUyh2KFQzpXxVqkAGswD3+qBDpZwow9iYE5v26/VwfUQnnznyhvjguQYabIIpKpYD1ahI8UTT92MUSFuP5Z/9TBTgOgFrVjp3nakaG/0VmEfpX58pwzjUEquNk362s+PP8XYD/KpYTBHmRg9Wch0QX1R80dCZhYipudYQY2Auib8RmODVCa4hfUK4ngaiiLNFNFdKeCWWscXZMbWy9Unv9/gsIQU09a4pwvUeA3Uapy2C2wCKXL0DqTePLexbWPOv79E8f0UWrencZ2poxciUWZlKssB4bcHeE83NsFuMgpo2iIpMuNa1TNu4XjhggWvb+R2K3wZdLlAZl8Fd9jRb5sD+Xx0RJBx5gdom6VsMEFDyWF0WyCeSOFcDKPnRxZYTQL5Rc/nn1w4oFsBaIhC3r6FRh5erPRhYMyHdeFw4C6zkRhmijM7CnMu0AUZonCDCnRJBqSus5/ABD6Ba5CkQS8AAAAAElFTkSuQmCC');
insert into main.media (medtype, medname, med) values ('application/excel', 'EgetEros.xls', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAKJSURBVDjLpZLfT1JhGMfduqu7/giv+wsk5mKGB53UBHHiDzjQkQjhmJyT6OiQBhommKJLaVrLZcPWpi3To0KspiSYv8AL160XOVy5uVrz23lPV0225rp49j77Ps/zed5937cIQNH/REFRyHBb3rXb6FhlT+58bJk5E0DIuC8Kaxwmd0cxkRtGW9L+9cw38Ky4jiZyEUQ2gnAtM4v/BPjWedxNt6Ez1Yr2FSe4D46T8WwEY9sDuLVAHza/bTqwztbnTa9r8wUBXmn4+e5jPMuNYCI7jPHsEKLbgxjdGsDw54cYXH+AR5keGGM6FAR0pFg8lYbJ1vspHu73DNgEDWfcLJ1WOJctEqAXhhfXCgMkp+FO2tG14pG3uuI0HMtNuLlYD0asg2XegP6MH/ZZC7TjFCrGyqAeuYJTJjpEC0Y2+mFfakCzaMSNhVqY52vQ+K4ajiUavZ98CKwK8K96oRpSngbY5kwIp3rADJngCwiIRqPgfW40TOphmzWhs7tD1roCXbju1aKkpOSCPCg5DclpcGIL7H4GoVAI+/v72NvbQzweh8ffjs4+D3ZyO7KWTCblHoqiemQAGR6UTGp94gDLuZDe3ISVp0FpKNA0jXA4DJ7n5by8vPyXXq9/QyAsyx7KAHrGiJBkUllLKYR7ggzQRilcLlVAFEWk02kkEgnEYjEoFIrvlZWV5wlAEIRjGdD4yoC+tW7QvQ1g7MwfgFY7p1Qqf6pUKlRVVclBcqKRGgFYrda8DKh7WY2aSS0q+q+iwqBBoC9wMjU1dTA9PY1IJAKnU/qdHCfnRCO1YDCY12g02b9eobi4+Jx0xUtqtfqL2Ww+stlsx1L80Ol0RilKpfwb0UiN9JDe3w8qq6SmnYkEAAAAAElFTkSuQmCC');




insert into main.date_type (date_id, type_name) values (1, 'Baidoa');
insert into main.date_type (date_id, type_name) values (2, 'Guaymas');
insert into main.date_type (date_id, type_name) values (3, 'Baler');
insert into main.date_type (date_id, type_name) values (4, 'Fort Benning(Columbus)');
insert into main.date_type (date_id, type_name) values (5, 'Wales');
insert into main.date_type (date_id, type_name) values (6, 'Oudomsay');
insert into main.date_type (date_id, type_name) values (7, 'Saidpur');
insert into main.date_type (date_id, type_name) values (8, 'Yanbu');
insert into main.date_type (date_id, type_name) values (9, 'Jaqué');
insert into main.date_type (date_id, type_name) values (10, 'Stuttgart');
insert into main.date_type (date_id, type_name) values (11, 'name');
insert into main.date_type (date_id, type_name) values (12, 'Néma');
insert into main.date_type (date_id, type_name) values (13, 'Rostov-on-Don');
insert into main.date_type (date_id, type_name) values (14, 'Porto Alegro');
insert into main.date_type (date_id, type_name) values (15, 'Gitega');
insert into main.date_type (date_id, type_name) values (16, 'Bakkafjörður');
insert into main.date_type (date_id, type_name) values (17, 'Birch Creek');
insert into main.date_type (date_id, type_name) values (18, 'Biskra');
insert into main.date_type (date_id, type_name) values (19, 'Wageningen');
insert into main.date_type (date_id, type_name) values (20, 'Daru');

insert into main.date_type (date_id, type_name) values (1, 'Usino');
insert into main.date_type (date_id, type_name) values (2, 'Kericho');
insert into main.date_type (date_id, type_name) values (3, 'Shreveport');
insert into main.date_type (date_id, type_name) values (4, 'Apatity');
insert into main.date_type (date_id, type_name) values (5, 'North Cat Cay');




insert into main.user (username, password, email, date_id, loc_id, med_id) values ('hiacovaccio0', 'fC4hrC', 'dtibols0@wordpress.com', 8, 7, 12);
insert into main.user (username, password, email, date_id, loc_id, med_id) values ('lswalough1', '4iaroWMT4N7', 'efuzzard1@springer.com', 6, 3, 4);
insert into main.user (username, password, email, date_id, loc_id, med_id) values ('cbibby2', 'm8r5u9Rh', 'lrohmer2@moonfruit.com', 15, 9, 13);
insert into main.user (username, password, email, date_id, loc_id, med_id) values ('dindgs3', 'RaYOE4', 'aspelling3@netvibes.com', 6, 5, 6);
insert into main.user (username, password, email, date_id, loc_id, med_id) values ('mgosnell4', '3T1QUp7ggHw', 'balu4@umich.edu', 11, 14, 20);
insert into main.user (username, password, email, date_id, loc_id, med_id) values ('tpowdrill5', '7prXiKE5', 'icrowley5@ucoz.com', 10, 16, 2);
insert into main.user (username, password, email, date_id, loc_id, med_id) values ('pcotilard6', 'NwdkfmfoBqq', 'hswaite6@bbb.org', 8, 12, 18);
insert into main.user (username, password, email, date_id, loc_id, med_id) values ('cgarvagh7', 'HW9bDx2uZN', 'sgoggins7@bluehost.com', 15, 5, 9);
insert into main.user (username, password, email, date_id, loc_id, med_id) values ('lstorms8', 'dzKfYq5sJCoi', 'gdymidowski8@netlog.com', 4, 14, 6);
insert into main.user (username, password, email, date_id, loc_id, med_id) values ('mtineman9', 'wzlRtpfVWRL', 'bruzic9@chron.com', 5, 19, 3);
insert into main.user (username, password, email, date_id, loc_id, med_id) values ('jaylesburya', 'eB9S1Bw8Qo', 'aennsa@tinypic.com', 2, 7, 12);
insert into main.user (username, password, email, date_id, loc_id, med_id) values ('corangeb', 'KJRPfXiVBWw', 'kmccullenb@scientificamerican.com', 20, 10, 5);
insert into main.user (username, password, email, date_id, loc_id, med_id) values ('dtomsuc', 'W6csrDhKxbZY', 'vgodsafec@1und1.de', 4, 13, 14);
insert into main.user (username, password, email, date_id, loc_id, med_id) values ('rmassingerd', 'B0XgqFxFI5Gg', 'cgrebertd@ibm.com', 11, 12, 3);
insert into main.user (username, password, email, date_id, loc_id, med_id) values ('aohartnette', 'zK4DwWFII', 'nlearye@ocn.ne.jp', 18, 18, 16);
insert into main.user (username, password, email, date_id, loc_id, med_id) values ('mbolerf', 'hsusYEkTmeVV', 'lpasekf@elpais.com', 17, 8, 9);
insert into main.user (username, password, email, date_id, loc_id, med_id) values ('dlorraineg', 'HyxH9e4Ly2fu', 'bjexg@cloudflare.com', 9, 6, 9);
insert into main.user (username, password, email, date_id, loc_id, med_id) values ('dasmush', 'kZAXqFUF2WWw', 'nsouthcombeh@typepad.com', 18, 7, 9);
insert into main.user (username, password, email, date_id, loc_id, med_id) values ('eghirardii', 'rUVB0QxS2r', 'wnaresi@ocn.ne.jp', 18, 20, 8);
insert into main.user (username, password, email, date_id, loc_id, med_id) values ('wdixj', 'HSntzkNEfDx', 'pattrilj@oracle.com', 8, 4, 13);

insert into main.user (username, password, email, date_id, loc_id, med_id) values ('eallebonek', 'jXftaD6qgn', 'rhaburnek@live.com', 16, 14, 7);
insert into main.user (username, password, email, date_id, loc_id, med_id) values ('lgoodfellowl', 'a6NOi0Se', 'sgrevattl@bizjournals.com', 9, 3, 13);
insert into main.user (username, password, email, date_id, loc_id, med_id) values ('jdepietrim', 'MFUBklJh', 'mtrevearm@list-manage.com', 9, 10, 3);
insert into main.user (username, password, email, date_id, loc_id, med_id) values ('lswyern', 'dSKMWn3B', 'eaccombn@bandcamp.com', 5, 3, 8);
insert into main.user (username, password, email, date_id, loc_id, med_id) values ('srigdeno', 'Qb1AdaK', 'mbrideauo@amazon.de', 15, 18, 6);




insert into main.nuser (user_id) values (16);
insert into main.nuser (user_id) values (22);
insert into main.nuser (user_id) values (14);
insert into main.nuser (user_id) values (7);
insert into main.nuser (user_id) values (15);
insert into main.nuser (user_id) values (10);
insert into main.nuser (user_id) values (14);
insert into main.nuser (user_id) values (22);
insert into main.nuser (user_id) values (10);
insert into main.nuser (user_id) values (8);
insert into main.nuser (user_id) values (10);
insert into main.nuser (user_id) values (10);
insert into main.nuser (user_id) values (19);
insert into main.nuser (user_id) values (11);
insert into main.nuser (user_id) values (15);
insert into main.nuser (user_id) values (7);
insert into main.nuser (user_id) values (14);
insert into main.nuser (user_id) values (11);
insert into main.nuser (user_id) values (17);
insert into main.nuser (user_id) values (6);

insert into main.nuser (user_id) values (21);
insert into main.nuser (user_id) values (7);
insert into main.nuser (user_id) values (12);
insert into main.nuser (user_id) values (9);
insert into main.nuser (user_id) values (19);




insert into main.tech_auth (user_id) values (19);
insert into main.tech_auth (user_id) values (17);
insert into main.tech_auth (user_id) values (7);
insert into main.tech_auth (user_id) values (21);
insert into main.tech_auth (user_id) values (8);
insert into main.tech_auth (user_id) values (5);
insert into main.tech_auth (user_id) values (14);
insert into main.tech_auth (user_id) values (12);
insert into main.tech_auth (user_id) values (17);
insert into main.tech_auth (user_id) values (15);
insert into main.tech_auth (user_id) values (16);
insert into main.tech_auth (user_id) values (10);
insert into main.tech_auth (user_id) values (16);
insert into main.tech_auth (user_id) values (11);
insert into main.tech_auth (user_id) values (8);
insert into main.tech_auth (user_id) values (20);
insert into main.tech_auth (user_id) values (16);
insert into main.tech_auth (user_id) values (4);
insert into main.tech_auth (user_id) values (12);
insert into main.tech_auth (user_id) values (8);

insert into main.tech_auth (user_id) values (17);
insert into main.tech_auth (user_id) values (9);
insert into main.tech_auth (user_id) values (12);
insert into main.tech_auth (user_id) values (8);
insert into main.tech_auth (user_id) values (17);




insert into main.notification (user_id, date_id, content) values (6, 10, 'Choloepus hoffmani');
insert into main.notification (user_id, date_id, content) values (22, 17, 'Prionace glauca');
insert into main.notification (user_id, date_id, content) values (8, 2, 'Lutra canadensis');
insert into main.notification (user_id, date_id, content) values (16, 1, 'Anser anser');
insert into main.notification (user_id, date_id, content) values (11, 1, 'Larus fuliginosus');
insert into main.notification (user_id, date_id, content) values (7, 14, 'Panthera leo');
insert into main.notification (user_id, date_id, content) values (7, 20, 'Francolinus coqui');
insert into main.notification (user_id, date_id, content) values (3, 11, 'Neophoca cinerea');
insert into main.notification (user_id, date_id, content) values (13, 6, 'Gekko gecko');
insert into main.notification (user_id, date_id, content) values (17, 5, 'Eubalaena australis');
insert into main.notification (user_id, date_id, content) values (13, 3, 'Chlidonias leucopterus');
insert into main.notification (user_id, date_id, content) values (15, 19, 'Lasiodora parahybana');
insert into main.notification (user_id, date_id, content) values (5, 12, 'Trichoglossus chlorolepidotus');
insert into main.notification (user_id, date_id, content) values (7, 9, 'Coluber constrictor');
insert into main.notification (user_id, date_id, content) values (9, 13, 'Connochaetus taurinus');
insert into main.notification (user_id, date_id, content) values (11, 8, 'Phalaropus lobatus');
insert into main.notification (user_id, date_id, content) values (10, 11, 'Paroaria gularis');
insert into main.notification (user_id, date_id, content) values (21, 20, 'Spheniscus mendiculus');
insert into main.notification (user_id, date_id, content) values (9, 13, 'Antidorcas marsupialis');
insert into main.notification (user_id, date_id, content) values (16, 3, 'Choloepus hoffmani');

insert into main.notification (user_id, date_id, content) values (12, 13, 'Crocodylus niloticus');
insert into main.notification (user_id, date_id, content) values (14, 15, 'Aegypius tracheliotus');
insert into main.notification (user_id, date_id, content) values (15, 2, 'Branta canadensis');
insert into main.notification (user_id, date_id, content) values (21, 16, 'Lamprotornis chalybaeus');
insert into main.notification (user_id, date_id, content) values (11, 4, 'Gazella granti');




insert into main.ncomment (com_id, nu_id, dession) values (20, 6, 'Edgeclub');
insert into main.ncomment (com_id, nu_id, dession) values (7, 18, 'Photojam');
insert into main.ncomment (com_id, nu_id, dession) values (13, 13, 'Linkbuzz');
insert into main.ncomment (com_id, nu_id, dession) values (13, 19, 'Meeveo');
insert into main.ncomment (com_id, nu_id, dession) values (5, 1, 'Eazzy');
insert into main.ncomment (com_id, nu_id, dession) values (9, 9, 'Dazzlesphere');
insert into main.ncomment (com_id, nu_id, dession) values (16, 16, 'Tanoodle');
insert into main.ncomment (com_id, nu_id, dession) values (8, 20, 'Dablist');
insert into main.ncomment (com_id, nu_id, dession) values (14, 17, 'Eare');
insert into main.ncomment (com_id, nu_id, dession) values (9, 16, 'Oozz');
insert into main.ncomment (com_id, nu_id, dession) values (17, 6, 'Yotz');
insert into main.ncomment (com_id, nu_id, dession) values (11, 8, 'Edgeblab');
insert into main.ncomment (com_id, nu_id, dession) values (7, 8, 'Dabjam');
insert into main.ncomment (com_id, nu_id, dession) values (4, 5, 'Linkbridge');
insert into main.ncomment (com_id, nu_id, dession) values (10, 1, 'Twitterworks');
insert into main.ncomment (com_id, nu_id, dession) values (8, 19, 'Quamba');
insert into main.ncomment (com_id, nu_id, dession) values (20, 12, 'Trilia');
insert into main.ncomment (com_id, nu_id, dession) values (2, 9, 'Feedbug');
insert into main.ncomment (com_id, nu_id, dession) values (3, 8, 'Zoomzone');
insert into main.ncomment (com_id, nu_id, dession) values (4, 20, 'Dynabox');

insert into main.ncomment (com_id, nu_id, dession) values (18, 16, 'Buzzdog');
insert into main.ncomment (com_id, nu_id, dession) values (17, 3, 'Browsedrive');
insert into main.ncomment (com_id, nu_id, dession) values (20, 20, 'Linklinks');
insert into main.ncomment (com_id, nu_id, dession) values (19, 17, 'Quaxo');
insert into main.ncomment (com_id, nu_id, dession) values (4, 4, 'Dabfeed');




insert into main.tech (auth_id, tech_name, cat_id, date_id, med_id, loc_id, descp, creat_date, objective, cretor) values (34, 'India Yankee Lima Victor Echo Zulu Hotel Delta Kilo Mike Alfa Romeo', 17, 13, 14, 4, 'Division of Hymen, External Approach', '9/6/2022', 'Information Systems Manager', 'Judith');
insert into main.tech (auth_id, tech_name, cat_id, date_id, med_id, loc_id, descp, creat_date, objective, cretor) values (28, 'Golf Tango Lima Zulu Charlie Alfa Victor Bravo X-ray Juliett Echo Papa Uniform Quebec Whiskey Foxtrot Sierra Romeo November India', 11, 4, 12, 5, 'Destruction of Left Thumb Phalanx, Open Approach', '4/3/2023', 'Chief Design Engineer', 'Travus');
insert into main.tech (auth_id, tech_name, cat_id, date_id, med_id, loc_id, descp, creat_date, objective, cretor) values (39, 'Foxtrot Hotel Victor X-ray Golf Quebec Romeo Bravo Uniform Tango Juliett Alfa Sierra Papa Echo India Zulu Whiskey', 2, 1, 14, 8, 'Insert Intralum Dev in R Int Jugular Vein, Open', '4/1/2023', 'Compensation Analyst', 'Steven');
insert into main.tech (auth_id, tech_name, cat_id, date_id, med_id, loc_id, descp, creat_date, objective, cretor) values (30, 'Oscar Zulu Yankee Victor Lima Alfa Hotel November Papa X-ray Echo Romeo India', 2, 15, 18, 8, 'Revision of Nonaut Sub in Epididymis/Sperm Cord, Endo', '12/19/2022', 'Administrative Officer', 'Fax');
insert into main.tech (auth_id, tech_name, cat_id, date_id, med_id, loc_id, descp, creat_date, objective, cretor) values (36, 'Mike Juliett Quebec India Whiskey Romeo Bravo Charlie Foxtrot Tango November Delta Golf Alfa Victor', 9, 6, 1, 15, 'Drainage of L Sublingual Gland with Drain Dev, Open Approach', '2/8/2023', 'Quality Control Specialist', 'Lucais');
insert into main.tech (auth_id, tech_name, cat_id, date_id, med_id, loc_id, descp, creat_date, objective, cretor) values (21, 'Mike Oscar Golf Whiskey Quebec Lima Echo Bravo Zulu Tango', 9, 13, 13, 18, 'Insertion of Spacer into Left Carpal Joint, Perc Approach', '6/16/2022', 'Registered Nurse', 'Tobe');
insert into main.tech (auth_id, tech_name, cat_id, date_id, med_id, loc_id, descp, creat_date, objective, cretor) values (24, 'Hotel Whiskey Oscar November Kilo X-ray Charlie Tango Delta Zulu Victor Mike Juliett Romeo Alfa Papa Sierra', 13, 17, 15, 12, 'Insertion of Int Fix into L Toe Phalanx Jt, Perc Approach', '1/25/2023', 'Research Nurse', 'Murdoch');
insert into main.tech (auth_id, tech_name, cat_id, date_id, med_id, loc_id, descp, creat_date, objective, cretor) values (30, 'Delta Tango Lima Alfa Juliett November India Whiskey Victor Foxtrot Echo Uniform Hotel Kilo Mike Oscar Golf Yankee Quebec', 19, 11, 2, 17, 'Restrict of L Int Mamm Art with Extralum Dev, Perc Approach', '6/20/2022', 'Food Chemist', 'Myrna');
insert into main.tech (auth_id, tech_name, cat_id, date_id, med_id, loc_id, descp, creat_date, objective, cretor) values (30, 'India Mike Yankee Juliett Hotel Bravo Echo Foxtrot Victor Romeo Alfa Kilo Uniform Quebec Papa Tango X-ray Zulu Charlie', 6, 12, 10, 3, 'Extirpation of Matter from R Parotid Gland, Open Approach', '5/17/2023', 'Editor', 'Alvin');
insert into main.tech (auth_id, tech_name, cat_id, date_id, med_id, loc_id, descp, creat_date, objective, cretor) values (31, 'Yankee Golf Echo Alfa Lima Uniform Victor Juliett X-ray Mike Hotel Oscar Romeo Foxtrot Charlie India November Whiskey Kilo Quebec', 8, 9, 12, 2, 'Insertion of Ext Fix into R Finger Phalanx Jt, Open Approach', '11/20/2022', 'Engineer I', 'Ceil');
insert into main.tech (auth_id, tech_name, cat_id, date_id, med_id, loc_id, descp, creat_date, objective, cretor) values (20, 'Kilo Hotel Papa Oscar Echo Romeo Victor Delta Charlie Golf Juliett Foxtrot Sierra Alfa Uniform Quebec Bravo X-ray India', 1, 18, 7, 4, 'Release Left Shoulder Muscle, Perc Endo Approach', '11/15/2022', 'Recruiting Manager', 'Rich');
insert into main.tech (auth_id, tech_name, cat_id, date_id, med_id, loc_id, descp, creat_date, objective, cretor) values (29, 'India Victor Papa Uniform Juliett November Charlie X-ray Yankee Sierra Oscar Quebec', 10, 11, 17, 20, 'Revision of Monitoring Device in Cranial Nrv, Open Approach', '12/27/2022', 'Data Coordinator', 'Josefina');
insert into main.tech (auth_id, tech_name, cat_id, date_id, med_id, loc_id, descp, creat_date, objective, cretor) values (33, 'Oscar Yankee Mike Juliett India Delta Zulu Papa Bravo Foxtrot Sierra Golf Echo Victor Quebec November', 17, 6, 1, 8, 'Restrict of R Subclav Vein with Intralum Dev, Perc Approach', '4/17/2023', 'Administrative Officer', 'Casey');
insert into main.tech (auth_id, tech_name, cat_id, date_id, med_id, loc_id, descp, creat_date, objective, cretor) values (28, 'Lima Charlie Tango November Victor Alfa Quebec Romeo Mike Whiskey Papa Golf Delta X-ray India Zulu Foxtrot Yankee Echo Juliett', 1, 3, 10, 15, 'Repair Bilateral Fallopian Tubes, Open Approach', '9/12/2022', 'Nuclear Power Engineer', 'Oberon');
insert into main.tech (auth_id, tech_name, cat_id, date_id, med_id, loc_id, descp, creat_date, objective, cretor) values (39, 'Uniform Mike Victor Tango Juliett Lima India Oscar Golf November Yankee', 7, 2, 13, 2, 'Destruction of Sciatic Nerve, Open Approach', '8/27/2022', 'Financial Analyst', 'Skip');
insert into main.tech (auth_id, tech_name, cat_id, date_id, med_id, loc_id, descp, creat_date, objective, cretor) values (32, 'Whiskey Quebec Echo Papa Alfa Delta Romeo Hotel Mike India Yankee Golf', 8, 2, 5, 17, 'Bypass 3 Cor Art from Cor Art with Autol Vn, Open Approach', '8/15/2022', 'Financial Advisor', 'Gina');
insert into main.tech (auth_id, tech_name, cat_id, date_id, med_id, loc_id, descp, creat_date, objective, cretor) values (31, 'Foxtrot Juliett Quebec Echo November Yankee Delta Lima Uniform Sierra Zulu Hotel Golf Romeo Victor Bravo Mike', 9, 10, 2, 21, 'Drainage of Lumbar Vertebral Joint, Perc Endo Approach', '12/26/2022', 'Product Engineer', 'Kristopher');
insert into main.tech (auth_id, tech_name, cat_id, date_id, med_id, loc_id, descp, creat_date, objective, cretor) values (24, 'Whiskey Papa Oscar Golf Juliett Bravo Kilo Lima Delta Quebec Charlie Romeo Sierra', 7, 9, 19, 19, 'Fragmentation in Bladder, Percutaneous Approach', '7/27/2022', 'Information Systems Manager', 'Syman');
insert into main.tech (auth_id, tech_name, cat_id, date_id, med_id, loc_id, descp, creat_date, objective, cretor) values (37, 'Golf X-ray Romeo Quebec Foxtrot November Oscar Yankee Sierra Delta Victor Juliett Zulu Echo Lima', 14, 13, 14, 20, 'Removal of Drainage Device from Upper Bone, Extern Approach', '2/9/2023', 'Physical Therapy Assistant', 'Kellen');
insert into main.tech (auth_id, tech_name, cat_id, date_id, med_id, loc_id, descp, creat_date, objective, cretor) values (27, 'Delta X-ray Juliett Victor Tango Quebec Oscar Romeo Kilo Lima Foxtrot Hotel India Sierra', 17, 10, 11, 5, 'Extraction of Left Thorax Bursa and Ligament, Perc Approach', '9/17/2022', 'Environmental Tech', 'Hardy');

insert into main.tech (auth_id, tech_name, cat_id, date_id, med_id, loc_id, descp, creat_date, objective, cretor) values (27, 'Alfa Kilo November Victor Foxtrot Echo Papa Juliett Lima Yankee Tango', 8, 7, 3, 9, 'Occlusion of R Brach Vein with Extralum Dev, Perc Approach', '7/14/2022', 'GIS Technical Architect', 'Henri');
insert into main.tech (auth_id, tech_name, cat_id, date_id, med_id, loc_id, descp, creat_date, objective, cretor) values (35, 'Lima Whiskey Tango Quebec Mike Juliett Uniform Romeo Yankee Oscar Foxtrot India Charlie Victor Hotel', 1, 4, 16, 8, 'Destruction of Coccyx, Percutaneous Endoscopic Approach', '1/23/2023', 'Compensation Analyst', 'Shamus');
insert into main.tech (auth_id, tech_name, cat_id, date_id, med_id, loc_id, descp, creat_date, objective, cretor) values (25, 'X-ray Juliett Uniform Tango Charlie Romeo Sierra Quebec Zulu Papa Hotel India Mike Golf Delta', 3, 4, 7, 21, 'Dilate R Ext Carotid, Bifurc, w 4 Drug-elut, Perc', '6/10/2022', 'Administrative Officer', 'Maynard');
insert into main.tech (auth_id, tech_name, cat_id, date_id, med_id, loc_id, descp, creat_date, objective, cretor) values (25, 'Foxtrot Victor Bravo Quebec Whiskey Juliett Yankee X-ray India Romeo Oscar Sierra Uniform Charlie Papa Hotel Mike Tango Lima', 3, 1, 2, 16, 'Bypass 1 Cor Art from Cor Art with Synth Sub, Open Approach', '8/20/2022', 'Accountant IV', 'Emilee');
insert into main.tech (auth_id, tech_name, cat_id, date_id, med_id, loc_id, descp, creat_date, objective, cretor) values (26, 'Bravo Charlie Victor Papa Echo Sierra Foxtrot Yankee Juliett X-ray Quebec', 11, 2, 17, 15, 'Supplement R Sacroiliac Jt with Autol Sub, Open Approach', '10/6/2022', 'Operator', 'Ikey');




insert into main.comment (email, date_id, tech_id, ncomment) values ('cmulcock0@seattletimes.com', 14, 7, 'In congue.');
insert into main.comment (email, date_id, tech_id, ncomment) values ('lalgy1@statcounter.com', 1, 13, 'Suspendisse potenti.');
insert into main.comment (email, date_id, tech_id, ncomment) values ('hflintiff2@imdb.com', 2, 18, 'Nulla mollis molestie lorem.');
insert into main.comment (email, date_id, tech_id, ncomment) values ('lhabron3@deviantart.com', 5, 8, 'Nam nulla.');
insert into main.comment (email, date_id, tech_id, ncomment) values ('jwindridge4@blogger.com', 19, 16, 'Aliquam quis turpis eget elit sodales scelerisque.');
insert into main.comment (email, date_id, tech_id, ncomment) values ('ikeneleyside5@fc2.com', 4, 20, 'Mauris sit amet eros.');
insert into main.comment (email, date_id, tech_id, ncomment) values ('aroo6@cloudflare.com', 17, 4, 'Integer tincidunt ante vel ipsum.');
insert into main.comment (email, date_id, tech_id, ncomment) values ('gpetrosian7@icio.us', 7, 13, 'Integer ac neque.');
insert into main.comment (email, date_id, tech_id, ncomment) values ('afaley8@163.com', 2, 14, 'Donec semper sapien a libero.');
insert into main.comment (email, date_id, tech_id, ncomment) values ('fbeaman9@youtu.be', 7, 22, 'Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.');
insert into main.comment (email, date_id, tech_id, ncomment) values ('pdarringtona@examiner.com', 17, 21, 'Cras non velit nec nisi vulputate nonummy.');
insert into main.comment (email, date_id, tech_id, ncomment) values ('dmaldenb@vistaprint.com', 9, 21, 'Duis aliquam convallis nunc.');
insert into main.comment (email, date_id, tech_id, ncomment) values ('gcatonc@cdbaby.com', 12, 17, 'Mauris lacinia sapien quis libero.');
insert into main.comment (email, date_id, tech_id, ncomment) values ('gclemesd@ftc.gov', 19, 16, 'Ut at dolor quis odio consequat varius.');
insert into main.comment (email, date_id, tech_id, ncomment) values ('sbantone@reference.com', 19, 12, 'Duis at velit eu est congue elementum.');
insert into main.comment (email, date_id, tech_id, ncomment) values ('dbrilonf@oakley.com', 7, 12, 'Nulla tempus.');
insert into main.comment (email, date_id, tech_id, ncomment) values ('hrougeg@nsw.gov.au', 1, 12, 'Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.');
insert into main.comment (email, date_id, tech_id, ncomment) values ('gkensonh@nationalgeographic.com', 16, 14, 'Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.');
insert into main.comment (email, date_id, tech_id, ncomment) values ('arishworthi@addthis.com', 16, 12, 'Nulla mollis molestie lorem.');
insert into main.comment (email, date_id, tech_id, ncomment) values ('spoupardj@mtv.com', 15, 22, 'Duis mattis egestas metus.');

insert into main.comment (email, date_id, tech_id, ncomment) values ('brosak@latimes.com', 15, 6, 'Mauris sit amet eros.');
insert into main.comment (email, date_id, tech_id, ncomment) values ('fbrownriggl@google.cn', 7, 5, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.');
insert into main.comment (email, date_id, tech_id, ncomment) values ('lfirpim@ftc.gov', 16, 19, 'Cras in purus eu magna vulputate luctus.');
insert into main.comment (email, date_id, tech_id, ncomment) values ('gkarpn@odnoklassniki.ru', 3, 7, 'In eleifend quam a odio.');
insert into main.comment (email, date_id, tech_id, ncomment) values ('bizhakyo@bigcartel.com', 12, 12, 'Integer a nibh.');




insert into main.tech_cat (tech_id, cat_id, tech_name) values (19, 4, 'Nicotine');
insert into main.tech_cat (tech_id, cat_id, tech_name) values (8, 1, 'Allergy Rescue');
insert into main.tech_cat (tech_id, cat_id, tech_name) values (16, 19, 'Fluoxetine');
insert into main.tech_cat (tech_id, cat_id, tech_name) values (16, 15, 'Phytolacca');
insert into main.tech_cat (tech_id, cat_id, tech_name) values (9, 2, 'Oxytocin');
insert into main.tech_cat (tech_id, cat_id, tech_name) values (4, 2, 'Maalox Antacid');
insert into main.tech_cat (tech_id, cat_id, tech_name) values (10, 4, 'Angelica Protective SPF 15');
insert into main.tech_cat (tech_id, cat_id, tech_name) values (6, 20, 'Fragmin');
insert into main.tech_cat (tech_id, cat_id, tech_name) values (13, 4, 'ERASE IT KIT');
insert into main.tech_cat (tech_id, cat_id, tech_name) values (19, 15, 'ATOPALM Hemorrhoidal Pain Relieving');
insert into main.tech_cat (tech_id, cat_id, tech_name) values (10, 4, 'Herbal UTAPLAS.TN');
insert into main.tech_cat (tech_id, cat_id, tech_name) values (16, 17, 'Leader');
insert into main.tech_cat (tech_id, cat_id, tech_name) values (9, 15, 'PROCHLORPERAZINE MALEATE');
insert into main.tech_cat (tech_id, cat_id, tech_name) values (7, 1, 'acetaminophen');
insert into main.tech_cat (tech_id, cat_id, tech_name) values (11, 11, 'HAND AND NATURE ANTI WRINKLE HAND');
insert into main.tech_cat (tech_id, cat_id, tech_name) values (17, 8, 'SUNMARK NICOTINE TRANSDERMAL SYSTEM');
insert into main.tech_cat (tech_id, cat_id, tech_name) values (20, 15, 'Pantoprazole Sodium');
insert into main.tech_cat (tech_id, cat_id, tech_name) values (21, 1, 'Doxercalciferol');
insert into main.tech_cat (tech_id, cat_id, tech_name) values (11, 20, 'Lotrel');
insert into main.tech_cat (tech_id, cat_id, tech_name) values (16, 7, 'Sinus Rescue');

insert into main.tech_cat (tech_id, cat_id, tech_name) values (20, 8, 'Levofloxacin');
insert into main.tech_cat (tech_id, cat_id, tech_name) values (19, 1, 'Amoxicillin and Clavulanate Potassium');
insert into main.tech_cat (tech_id, cat_id, tech_name) values (18, 13, 'MERREM');
insert into main.tech_cat (tech_id, cat_id, tech_name) values (18, 11, 'XEROSTOM');
insert into main.tech_cat (tech_id, cat_id, tech_name) values (20, 1, 'Childrens Wal-Dryl Allergy');




insert into main.tech_med (tech_id, med_id, med_name) values (5, 5, 'EtCommodoVulputate.avi');
insert into main.tech_med (tech_id, med_id, med_name) values (5, 12, 'Suspendisse.jpeg');
insert into main.tech_med (tech_id, med_id, med_name) values (16, 19, 'Lectus.mov');
insert into main.tech_med (tech_id, med_id, med_name) values (4, 10, 'Cubilia.ppt');
insert into main.tech_med (tech_id, med_id, med_name) values (6, 11, 'GravidaNisi.mp3');
insert into main.tech_med (tech_id, med_id, med_name) values (20, 18, 'DonecQuis.mp3');
insert into main.tech_med (tech_id, med_id, med_name) values (15, 17, 'Morbi.png');
insert into main.tech_med (tech_id, med_id, med_name) values (18, 4, 'MassaQuisAugue.jpeg');
insert into main.tech_med (tech_id, med_id, med_name) values (9, 6, 'EstDonec.gif');
insert into main.tech_med (tech_id, med_id, med_name) values (6, 7, 'SagittisNam.mp3');
insert into main.tech_med (tech_id, med_id, med_name) values (13, 6, 'PellentesqueViverra.mov');
insert into main.tech_med (tech_id, med_id, med_name) values (17, 13, 'RhoncusAliquam.ppt');
insert into main.tech_med (tech_id, med_id, med_name) values (16, 6, 'PellentesqueEget.jpeg');
insert into main.tech_med (tech_id, med_id, med_name) values (8, 4, 'RutrumAt.mp3');
insert into main.tech_med (tech_id, med_id, med_name) values (6, 9, 'DonecPosuereMetus.tiff');
insert into main.tech_med (tech_id, med_id, med_name) values (21, 2, 'MaurisLaciniaSapien.avi');
insert into main.tech_med (tech_id, med_id, med_name) values (18, 2, 'MorbiA.avi');
insert into main.tech_med (tech_id, med_id, med_name) values (5, 9, 'SollicitudinUtSuscipit.avi');
insert into main.tech_med (tech_id, med_id, med_name) values (19, 16, 'HacHabitasse.xls');
insert into main.tech_med (tech_id, med_id, med_name) values (14, 6, 'Enim.mp3');

insert into main.tech_med (tech_id, med_id, med_name) values (21, 1, 'PraesentBlanditNam.xls');
insert into main.tech_med (tech_id, med_id, med_name) values (13, 5, 'Orci.mp3');
insert into main.tech_med (tech_id, med_id, med_name) values (15, 1, 'VolutpatInCongue.avi');
insert into main.tech_med (tech_id, med_id, med_name) values (7, 18, 'Orci.avi');
insert into main.tech_med (tech_id, med_id, med_name) values (10, 4, 'Nam.tiff');




insert into main.view_users (tech_id, date_id) values (15, 14);
insert into main.view_users (tech_id, date_id) values (15, 5);
insert into main.view_users (tech_id, date_id) values (8, 3);
insert into main.view_users (tech_id, date_id) values (10, 15);
insert into main.view_users (tech_id, date_id) values (21, 10);
insert into main.view_users (tech_id, date_id) values (6, 9);
insert into main.view_users (tech_id, date_id) values (18, 4);
insert into main.view_users (tech_id, date_id) values (4, 5);
insert into main.view_users (tech_id, date_id) values (15, 16);
insert into main.view_users (tech_id, date_id) values (17, 6);
insert into main.view_users (tech_id, date_id) values (18, 14);
insert into main.view_users (tech_id, date_id) values (18, 20);
insert into main.view_users (tech_id, date_id) values (5, 16);
insert into main.view_users (tech_id, date_id) values (17, 13);
insert into main.view_users (tech_id, date_id) values (6, 11);
insert into main.view_users (tech_id, date_id) values (10, 10);
insert into main.view_users (tech_id, date_id) values (10, 20);
insert into main.view_users (tech_id, date_id) values (20, 20);
insert into main.view_users (tech_id, date_id) values (8, 2);
insert into main.view_users (tech_id, date_id) values (18, 10);

insert into main.view_users (tech_id, date_id) values (12, 17);
insert into main.view_users (tech_id, date_id) values (13, 12);
insert into main.view_users (tech_id, date_id) values (20, 3);
insert into main.view_users (tech_id, date_id) values (13, 13);
insert into main.view_users (tech_id, date_id) values (4, 19);




insert into main.rating (date_id, rating) values (14, 2);
insert into main.rating (date_id, rating) values (11, 1);
insert into main.rating (date_id, rating) values (19, 2);
insert into main.rating (date_id, rating) values (9, 3);
insert into main.rating (date_id, rating) values (18, 1);
insert into main.rating (date_id, rating) values (3, 4);
insert into main.rating (date_id, rating) values (7, 4);
insert into main.rating (date_id, rating) values (15, 5);
insert into main.rating (date_id, rating) values (8, 1);
insert into main.rating (date_id, rating) values (8, 4);
insert into main.rating (date_id, rating) values (5, 4);
insert into main.rating (date_id, rating) values (1, 5);
insert into main.rating (date_id, rating) values (16, 2);
insert into main.rating (date_id, rating) values (8, 1);
insert into main.rating (date_id, rating) values (3, 2);
insert into main.rating (date_id, rating) values (10, 3);
insert into main.rating (date_id, rating) values (18, 2);
insert into main.rating (date_id, rating) values (17, 5);
insert into main.rating (date_id, rating) values (7, 2);
insert into main.rating (date_id, rating) values (2, 1);

insert into main.rating (date_id, rating) values (20, 1);
insert into main.rating (date_id, rating) values (8, 1);
insert into main.rating (date_id, rating) values (9, 2);
insert into main.rating (date_id, rating) values (10, 1);
insert into main.rating (date_id, rating) values (13, 4);




insert into main.orating (rat_id, tech_id, rat_souces) values (9, 4, 'Sheet Metal');
insert into main.orating (rat_id, tech_id, rat_souces) values (20, 16, 'GPG');
insert into main.orating (rat_id, tech_id, rat_souces) values (14, 23, 'ProSystem fx Engagement');
insert into main.orating (rat_id, tech_id, rat_souces) values (5, 14, 'Hyperion Planning');
insert into main.orating (rat_id, tech_id, rat_souces) values (20, 21, 'Civil Litigation');
insert into main.orating (rat_id, tech_id, rat_souces) values (1, 9, 'User Acceptance Testing');
insert into main.orating (rat_id, tech_id, rat_souces) values (17, 9, 'Qooxdoo');
insert into main.orating (rat_id, tech_id, rat_souces) values (10, 6, 'CBOT');
insert into main.orating (rat_id, tech_id, rat_souces) values (7, 23, 'IEC 61508');
insert into main.orating (rat_id, tech_id, rat_souces) values (7, 18, 'CSCS');
insert into main.orating (rat_id, tech_id, rat_souces) values (13, 17, 'DDE');
insert into main.orating (rat_id, tech_id, rat_souces) values (17, 4, 'Venture Capital');
insert into main.orating (rat_id, tech_id, rat_souces) values (20, 21, 'Zend Framework');
insert into main.orating (rat_id, tech_id, rat_souces) values (7, 18, 'Hypnotherapy');
insert into main.orating (rat_id, tech_id, rat_souces) values (5, 4, 'Rule Of Law');
insert into main.orating (rat_id, tech_id, rat_souces) values (20, 13, 'SV');
insert into main.orating (rat_id, tech_id, rat_souces) values (5, 15, 'Strategic Planning');
insert into main.orating (rat_id, tech_id, rat_souces) values (17, 23, 'FFE');
insert into main.orating (rat_id, tech_id, rat_souces) values (20, 5, 'PDA');
insert into main.orating (rat_id, tech_id, rat_souces) values (15, 10, 'Start-up Consulting');

insert into main.orating (rat_id, tech_id, rat_souces) values (9, 14, 'TNS');
insert into main.orating (rat_id, tech_id, rat_souces) values (14, 11, 'DVD Studio Pro');
insert into main.orating (rat_id, tech_id, rat_souces) values (18, 14, 'Hoshin Kanri');
insert into main.orating (rat_id, tech_id, rat_souces) values (6, 10, 'ABAP');
insert into main.orating (rat_id, tech_id, rat_souces) values (3, 22, 'UK Bribery Act');




insert into main.user_loc (loc_id, user_id, sate) values (6, 5, 'Buea');
insert into main.user_loc (loc_id, user_id, sate) values (15, 15, 'Buea');
insert into main.user_loc (loc_id, user_id, sate) values (7, 21, 'Buea');
insert into main.user_loc (loc_id, user_id, sate) values (17, 16, 'Buea');
insert into main.user_loc (loc_id, user_id, sate) values (8, 21, 'Buea');
insert into main.user_loc (loc_id, user_id, sate) values (6, 19, 'Ilha de São Miguel');
insert into main.user_loc (loc_id, user_id, sate) values (5, 22, 'Buea');
insert into main.user_loc (loc_id, user_id, sate) values (21, 21, 'Buea');
insert into main.user_loc (loc_id, user_id, sate) values (19, 6, 'Buea');
insert into main.user_loc (loc_id, user_id, sate) values (3, 20, 'Buea');
insert into main.user_loc (loc_id, user_id, sate) values (21, 11, 'Buea');
insert into main.user_loc (loc_id, user_id, sate) values (16, 3, 'Buea');
insert into main.user_loc (loc_id, user_id, sate) values (2, 7, 'Buea');
insert into main.user_loc (loc_id, user_id, sate) values (11, 22, 'Buea');
insert into main.user_loc (loc_id, user_id, sate) values (21, 21, 'Buea');
insert into main.user_loc (loc_id, user_id, sate) values (17, 6, 'Buea');
insert into main.user_loc (loc_id, user_id, sate) values (19, 4, 'Buea');
insert into main.user_loc (loc_id, user_id, sate) values (14, 18, 'Buea');
insert into main.user_loc (loc_id, user_id, sate) values (15, 5, 'Lisboa');
insert into main.user_loc (loc_id, user_id, sate) values (3, 20, 'Buea');

insert into main.user_loc (loc_id, user_id, sate) values (7, 4, 'Buea');
insert into main.user_loc (loc_id, user_id, sate) values (10, 19, 'Västra Götaland');
insert into main.user_loc (loc_id, user_id, sate) values (4, 21, 'Västra Götaland');
insert into main.user_loc (loc_id, user_id, sate) values (6, 17, 'Buea');
insert into main.user_loc (loc_id, user_id, sate) values (3, 3, 'Buea');




insert into main.user_med (med_id, user_id, med_name) values (1, 13, 'PellentesqueUltricesPhasellus.avi');
insert into main.user_med (med_id, user_id, med_name) values (1, 14, 'SagittisDui.jpeg');
insert into main.user_med (med_id, user_id, med_name) values (16, 11, 'DonecDapibus.xls');
insert into main.user_med (med_id, user_id, med_name) values (13, 21, 'AtDolor.ppt');
insert into main.user_med (med_id, user_id, med_name) values (16, 8, 'Varius.ppt');
insert into main.user_med (med_id, user_id, med_name) values (8, 19, 'QuisJustoMaecenas.avi');
insert into main.user_med (med_id, user_id, med_name) values (8, 7, 'AmetNunc.gif');
insert into main.user_med (med_id, user_id, med_name) values (10, 9, 'MattisOdio.ppt');
insert into main.user_med (med_id, user_id, med_name) values (14, 10, 'Luctus.avi');
insert into main.user_med (med_id, user_id, med_name) values (18, 7, 'Rutrum.xls');
insert into main.user_med (med_id, user_id, med_name) values (15, 18, 'MaecenasPulvinaarLobortis.xls');
insert into main.user_med (med_id, user_id, med_name) values (20, 18, 'Venenatis.xls');
insert into main.user_med (med_id, user_id, med_name) values (1, 22, 'Luctus.pdf');
insert into main.user_med (med_id, user_id, med_name) values (10, 21, 'EgetEros.doc');
insert into main.user_med (med_id, user_id, med_name) values (19, 11, 'Bibendum.mp3');
insert into main.user_med (med_id, user_id, med_name) values (7, 5, 'LoremVitae.pdf');
insert into main.user_med (med_id, user_id, med_name) values (18, 3, 'LectusPellentesqueAt.doc');
insert into main.user_med (med_id, user_id, med_name) values (20, 15, 'SemSed.pdf');
insert into main.user_med (med_id, user_id, med_name) values (9, 14, 'ElementumNullamVarius.txt');
insert into main.user_med (med_id, user_id, med_name) values (1, 15, 'LectusPellentesqueAt.xls');

insert into main.user_med (med_id, user_id, med_name) values (19, 17, 'AcNequeDuis.mp3');
insert into main.user_med (med_id, user_id, med_name) values (13, 10, 'OrciNullamMolestie.ppt');
insert into main.user_med (med_id, user_id, med_name) values (7, 6, 'ConvallisTortorRisus.png');
insert into main.user_med (med_id, user_id, med_name) values (16, 11, 'IntegerPede.ppt');
insert into main.user_med (med_id, user_id, med_name) values (6, 3, 'NullaUltrices.mov');




Delete quries 


1   DELETE FROM main.user_med
	WHERE med_id = 7 and user_id = 6;
	
2.  DELETE FROM main.user_loc
	WHERE loc_id = 4 and user_id = 21;
	
3. DELETE FROM main.orating
	WHERE rat_id = 13;
	
4. DELETE FROM main.view_users
	WHERE tech_id = 13;
	
5. DELETE FROM main.orating
	WHERE rat_id = 12;
	
	
Update Queries 

1.  UPDATE main.date_type
	SET type_name = 'creation date'
	WHERE date_id = 1;
	
2.  UPDATE main.date_type
	SET type_name = 'view date'
	WHERE date_id = 2;
	
3.  UPDATE main.date_type
	SET type_name = 'rated date'
	WHERE date_id = 3;
	
	
	
	
	
	
	

	
4.  UPDATE main.date_type
	SET type_name = 'comment date'
	WHERE date_id = 4;
	
5.  UPDATE main.date_type
	SET type_name = 'app creation date'
	WHERE date_id = 5;
	
	
SELECT usernme, email, day 
FROM user 
JOIN date 
ON user.date_id = date.date_id;