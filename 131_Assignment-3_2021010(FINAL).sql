drop database if exists online_retail_store;

create database online_retail_store;
use online_retail_store;

create table admin(
	Aid VARCHAR(50) not null unique,
	AFirstname VARCHAR(50) not null,
	ALastname VARCHAR(50),
	Aemail VARCHAR(50) not null unique,
	Apwd VARCHAR(50) not null,
	Aphone bigint not null unique,
    PRIMARY KEY(Aid),
    check(Aphone>1000000000 && Aphone<9999999999),
    check(char_length(Apwd)>=6)

);

-- drop table User;
create table User  (
	Uid int not null unique auto_increment,
	
    Ufirstname VARCHAR(50) not null,
	ULastname VARCHAR(50),
	Uemail VARCHAR(50) not null unique,
	Upwd VARCHAR(50) not null,
	Uaddr VARCHAR(50) not null,
	Uphone bigint not null unique,
	Udob DATE not null,
    PRIMARY KEY(Uid),
    check(Uphone>1000000000 && Uphone<9999999999),
    check(char_length(Upwd)>=6)

) engine=InnoDB;

-- drop table Product;


create table Product(
	Prid int not null unique auto_increment, 
    Prname varchar(70) not null,
    Prprice int not null,
    Prcategory varchar(50) not null,
    Prstatus varchar(50) ,
	Prunits int not null default 1,
    
    PRIMARY KEY(Prid)    
) engine=InnoDB;

-- drop table Deliveryperson;
create table Deliveryperson (
	Did int not null unique auto_increment,
	DFirstname VARCHAR(50) not null,
	DLastname VARCHAR(50),
	Demail VARCHAR(50) not null unique,
	Dpwd VARCHAR(50) not null,
	Daddr VARCHAR(50) not null,
	Dphone bigint not null unique,
    Dsalary int not null default 10000,
    Daadhar bigint not null unique,
	Ddob DATE not null,
    PRIMARY KEY(Did),
    check(Dphone>7800000000 && Dphone<9999999999),
    check(char_length(Dpwd)>=6),
    check(Daadhar>100000000000 & Daadhar<999999999999)
)engine=InnoDB;


-- drop table Oder;
create table Oder (
	Oid int not null unique, 
    Uid int not null unique,
	Deliverydate date not null,
    Did int not null ,
    PRIMARY KEY(Oid),
    foreign key(Uid) references User(Uid),
	foreign key(Did) references Deliveryperson(Did)
	 
);


-- drop table Payment;
create table Payment (
	Pid varchar(50) not null unique ,
    Uidd int not null unique auto_increment,
    
	Pmethods varchar(60) not null,
    Pdate date not null,
    PaymentStatus varchar(40) not null,
    Pamount int not null default 0,
    PRIMARY KEY(Pid),
    foreign key(Uidd) references User(Uid)

) engine=InnoDB;



create table Cart(
	Cid int not null , 
	Uid int not null,
	
 
    foreign key(Uid) references User(Uid),
    PRIMARY KEY(Cid)    
) engine=InnoDB;


create table PrUnit(
	PUid int not null,
	Prid int not null,
    unit int not null,
    Cid int not null,
    PRIMARY KEY(PUid),
    foreign key(Cid) references Cart(Cid)
    
)engine=InnoDB;



-- // new prunits should be set to equal to total units
-- //set pamount of payment=unit of prunit *(join prunit and product) prprice







insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('20-4204672', 'Jeremie', 'Claye', 'jclaye0@shareasale.com', 'SeslDV', 8293416205);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('79-9541447', 'Uriel', 'Hinrichsen', 'uhinrichsen1@rakuten.co.jp', 'Zb7jaTcFcg', 8519877654);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('74-5368306', 'Carmelle', 'Mendoza', 'cmendoza2@altervista.org', '0JAXuEvTjT', 9224418472);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('04-6159745', 'Angelo', 'Whordley', 'awhordley3@wordpress.com', 'sg6cz7WtdqQx', 8260365522);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('97-1814405', 'Terrel', 'Gelder', 'tgelder4@uiuc.edu', 'dNhjTjGez', 9198726262);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('75-1541179', 'Nicola', 'Davids', 'ndavids5@ezinearticles.com', 'C4jbjORW1TU5', 8975371447);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('57-7239890', 'Jesselyn', 'Fantham', 'jfantham6@blogtalkradio.com', 'DHSBpVV', 8018500916);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('26-2819691', 'Sheena', 'Mearns', 'smearns7@google.fr', '0RO6a8', 9448903484);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('42-4156790', 'Lilian', 'Mingotti', 'lmingotti8@epa.gov', '6z5qUSa', 9191287688);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('42-4847473', 'Britta', 'Revening', 'brevening9@soundcloud.com', 'Q7vrUX1FS', 8433090121);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('32-0490101', 'Netta', 'Povall', 'npovalla@ucoz.ru', 'IfoVOtd', 8984542751);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('57-1601267', 'Sergei', 'Bainbridge', 'sbainbridgeb@google.pl', 'jh4YqlIrn0F2', 9690986010);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('96-9752702', 'Jacquie', 'Gabbot', 'jgabbotc@weibo.com', 'kQla4En39Zy', 9954059218);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('75-1162480', 'Kayley', 'Tamblyn', 'ktamblynd@slideshare.net', 'LK3UIRjo', 8085427571);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('99-3703856', 'Bar', 'Tunniclisse', 'btunniclissee@comcast.net', 'K6HX7LDY46t', 8885691709);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('94-6425265', 'Kati', 'Pembridge', 'kpembridgef@xing.com', 'CcDP2IWd6g', 8787250331);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('83-4124891', 'Wilbur', 'Sharple', 'wsharpleg@upenn.edu', 'WURLAXh3', 8334596382);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('27-6767538', 'Clare', 'Bricknell', 'cbricknellh@salon.com', 'J2wZAoU9', 8430582498);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('88-6745831', 'Geri', 'Lamps', 'glampsi@tumblr.com', 'cMkb6nYp3QqL', 8752113874);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('53-8311062', 'Amelie', 'Domange', 'adomangej@macromedia.com', 'lPXm5rU', 9700875551);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('40-6000773', 'Nathaniel', 'Kamenar', 'nkamenark@pen.io', 'NGiRx2uJ', 8946055438);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('79-5785052', 'Elianore', 'Carillo', 'ecarillol@va.gov', 'HDZappb', 8811201811);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('90-1356326', 'Colas', 'Points', 'cpointsm@over-blog.com', 'VqBA5mhqO', 8621024226);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('48-8860746', 'Darci', 'Lockery', 'dlockeryn@dell.com', 'h2MXR563TyDK', 9947901709);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('36-1454817', 'Enrichetta', 'Lambertson', 'elambertsono@goo.ne.jp', 'hyWn5s6RiE', 8725777827);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('62-7474816', 'Kurt', 'Blasing', 'kblasingp@1688.com', 'JDAbZYYMU7', 8702159181);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('50-0401104', 'Paulette', 'Getch', 'pgetchq@epa.gov', 'lm43NIIC', 9533044844);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('71-3456152', 'Titus', 'Capnerhurst', 'tcapnerhurstr@elegantthemes.com', '5IIksD', 8060531878);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('10-7314600', 'Nora', 'Standell', 'nstandells@examiner.com', 'fISrvmYoPrGl', 8684805231);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('90-2563093', 'Alfreda', 'Filov', 'afilovt@sun.com', 'vZ72x7', 9340561320);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('47-7143561', 'Emelen', 'Renison', 'erenisonu@ask.com', 'ZubQ2d97v', 9759077692);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('68-6505277', 'Johnette', 'Bebb', 'jbebbv@cpanel.net', 'Xr9rbWND', 8036589655);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('29-0523720', 'Jewelle', 'Cullon', 'jcullonw@google.ru', 'CwtdydB', 8468478764);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('52-8518766', 'Dewey', 'Andriulis', 'dandriulisx@wikia.com', 'Zq1XSK', 8923388318);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('30-0489532', 'Bryna', 'Pieroni', 'bpieroniy@techcrunch.com', 'JQ2xY8v', 9163913755);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('95-3168817', 'Anthe', 'Jikovsky', 'ajikovskyz@earthlink.net', 'xMh3OMy', 8406256710);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('34-7624827', 'Tybalt', 'Really', 'treally10@soundcloud.com', 'zvJU3mFIOFX6', 8438946232);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('50-7738999', 'Daveta', 'Jonson', 'djonson11@ning.com', 'USie0gyJA00l', 9511560831);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('11-8976038', 'Glennie', 'Crowder', 'gcrowder12@sciencedirect.com', '0UrsncMtTS', 8389943716);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('14-7997293', 'Monah', 'Bryde', 'mbryde13@hatena.ne.jp', '4cPrZxxyTK', 9436152677);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('24-7731717', 'Karyn', 'Morcombe', 'kmorcombe14@slashdot.org', 'anVUsqkk6g', 9652317097);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('11-2897836', 'Hunt', 'Hrinchishin', 'hhrinchishin15@sbwire.com', 'MX34rlkwbqL', 9183899285);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('44-9981787', 'Ainslie', 'Gosnoll', 'agosnoll16@eepurl.com', 'RpGhn4EAZP', 9399663164);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('10-6869132', 'Jefferey', 'Dufour', 'jdufour17@intel.com', 'zrKCf4J', 9989766764);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('81-3312573', 'Yuri', 'Craddy', 'ycraddy18@scientificamerican.com', '1OeGC2xa', 8570802690);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('36-6109221', 'Clevey', 'Hawsby', 'chawsby19@macromedia.com', 'nJMlQEXR', 8381460943);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('83-5147640', 'Arnie', 'Conre', 'aconre1a@meetup.com', 'WjYbdUETe', 9548292288);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('41-6703059', 'Tandy', 'Caudrey', 'tcaudrey1b@timesonline.co.uk', 'mof9zSt1d9', 9559940918);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('78-1103914', 'Emilie', 'Caramuscia', 'ecaramuscia1c@wisc.edu', 'J0iSShVbUFu', 8580011552);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('73-3434934', 'Spike', 'Habbal', 'shabbal1d@adobe.com', '00jmowlGb7', 9904764906);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('85-0646851', 'Jeno', 'Mutimer', 'jmutimer1e@telegraph.co.uk', 'HOk53i', 8764194720);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('01-6398724', 'Anthea', 'Cornbell', 'acornbell1f@wikipedia.org', 'QPzK4qc', 9329803468);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('86-1131059', 'Alphonso', 'Keerl', 'akeerl1g@wsj.com', 'ASkR5fE', 8288035518);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('25-3814326', 'Olly', 'Hakonsen', 'ohakonsen1h@topsy.com', 't3cHOiFW', 9354774404);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('04-3605195', 'Gardie', 'Klos', 'gklos1i@yahoo.co.jp', '8LKssxd', 9620029635);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('45-5954550', 'Rosco', 'Buss', 'rbuss1j@flavors.me', 'qQntf00L', 8821487813);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('72-2823965', 'John', 'Castagnet', 'jcastagnet1k@yelp.com', '4RNk24P', 9921687184);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('23-7297268', 'Shellie', 'Wickham', 'swickham1l@cmu.edu', '97mAgPH', 9392361414);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('36-2319970', 'Dodi', 'Digwood', 'ddigwood1m@cnet.com', 'bAi2Wj', 8148404487);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('11-2377904', 'Reeba', 'Yacobsohn', 'ryacobsohn1n@nature.com', 'C777Uz2s', 8589441180);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('98-1246293', 'Goldina', 'Reveley', 'greveley1o@bandcamp.com', 'qE6VdULis2f', 8738814706);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('08-0049258', 'Melessa', 'Barabisch', 'mbarabisch1p@time.com', 'LzJBiLb', 9015746895);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('38-4605223', 'Stevie', 'Gimson', 'sgimson1q@miibeian.gov.cn', '4k4dDJIk', 8951172210);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('61-7690680', 'Henri', 'Penwright', 'hpenwright1r@domainmarket.com', 'vXxhXMt', 9126622283);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('34-0614419', 'Jania', 'Raff', 'jraff1s@china.com.cn', '6cTTDHNLzm', 9956362221);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('61-5113400', 'Katerina', 'Kits', 'kkits1t@google.cn', 'l8mthNlR', 8689135294);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('00-8022402', 'Silvio', 'Clapton', 'sclapton1u@msu.edu', '3YNqZPm', 8581389186);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('10-6823179', 'Sharia', 'Yuryev', 'syuryev1v@plala.or.jp', 'g3N8rZK', 8045997105);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('53-8123241', 'Dusty', 'Iltchev', 'diltchev1w@springer.com', 'gNznbeJtc', 8823587319);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('67-1723194', 'Shawna', 'Guiso', 'sguiso1x@nbcnews.com', '0CMKAU', 9263155427);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('80-7010416', 'Maurie', 'Marrill', 'mmarrill1y@imgur.com', '4t7QdKOVNEti', 9818996211);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('08-4028635', 'Saundra', 'Wilflinger', 'swilflinger1z@ycombinator.com', '3FG9lmRu0hO', 9304272335);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('34-8659644', 'Kimbell', 'Rozet', 'krozet20@meetup.com', 'HAkXJ1sHoOS', 9464514161);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('90-4510715', 'Tomlin', 'Bretherton', 'tbretherton21@boston.com', 'rkV08Kpmjfh', 9384893590);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('83-1464917', 'Karel', 'Bonehill', 'kbonehill22@bizjournals.com', 'ep4dYPfjmaxW', 8363915379);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('61-1988251', 'Brion', 'Gleadhall', 'bgleadhall23@ycombinator.com', '2fTM0ST', 8713724536);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('59-0187257', 'Nickolas', 'Brownsworth', 'nbrownsworth24@ow.ly', 'zuryW9ymlFa', 8578738115);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('56-4970955', 'Letta', 'Caldairou', 'lcaldairou25@mayoclinic.com', 'SseMSH0pmp8', 9230650526);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('70-5537551', 'Meryl', 'Saltsberger', 'msaltsberger26@opera.com', 'bWf0CDg', 8479296926);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('47-7321387', 'Teodor', 'Clayworth', 'tclayworth27@twitpic.com', '2NlWHObOg', 8260860154);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('21-0163475', 'Gwenny', 'Sherreard', 'gsherreard28@blog.com', 'oTXyG6i', 8929451275);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('45-1891784', 'Alvina', 'Cheesman', 'acheesman29@disqus.com', 'kKOyKb', 9067749370);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('38-4588306', 'Regen', 'Loy', 'rloy2a@cbc.ca', 'LsyX8F', 9214481947);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('19-4444469', 'Bernarr', 'Passler', 'bpassler2b@wsj.com', '1ei06d', 9802765553);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('35-2422502', 'Sascha', 'Germaine', 'sgermaine2c@blog.com', 'yQry1YgtVS', 9968733287);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('04-9718586', 'Vassily', 'Sayward', 'vsayward2d@cam.ac.uk', 'rubml4WKh', 8444372635);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('87-1122290', 'Tiebout', 'Tapin', 'ttapin2e@fastcompany.com', 'pfCoVA2sRy', 9626022070);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('58-8354169', 'Fan', 'Taunton.', 'ftaunton2f@wp.com', 'qZZEWbJz', 9730167474);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('33-2944376', 'Jamaal', 'Preene', 'jpreene2g@illinois.edu', 'T41dkv', 8383077371);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('52-1952712', 'Callie', 'Dauney', 'cdauney2h@earthlink.net', '1wPDkvL8', 9719358755);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('74-4936777', 'Isiahi', 'Carty', 'icarty2i@wufoo.com', 'vf4ZYDh', 9034922610);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('53-3007865', 'Murielle', 'Antley', 'mantley2j@angelfire.com', 'UwYBm0C', 8470346949);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('46-1131231', 'Thayne', 'De Atta', 'tdeatta2k@i2i.jp', 'mRQy3ajwfDVL', 8172796288);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('34-5600795', 'Conney', 'Dorey', 'cdorey2l@trellian.com', 'gayz8hF', 8343852414);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('12-2404797', 'Muffin', 'Parcall', 'mparcall2m@mozilla.com', 'Q60k4gNt', 8619585203);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('31-9474418', 'Giffard', 'Tantrum', 'gtantrum2n@sohu.com', 'SAUtiI5s', 9419406920);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('74-7800970', 'Cosette', 'Wildish', 'cwildish2o@nature.com', '0ZhXaW', 8590792314);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('90-9642568', 'Berne', 'Bony', 'bbony2p@businesswire.com', 'pooA5Suiul', 9754274545);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('94-9104072', 'Royal', 'Innocent', 'rinnocent2q@ebay.co.uk', 'gSKoCO7ZrY', 8127225450);
insert into Admin (Aid, AFirstname, ALastname, Aemail, Apwd, Aphone) values ('15-8472258', 'Stillman', 'Pembery', 'spembery2r@go.com', 'WGsdJZ5j0hk', 9484799997);

select * from Admin;

insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Nollie', 'Wloch', 'nwloch0@foxnews.com', 'U422zUFG3', 'Suite 33', 8216480204, '1988-02-16');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Timothee', 'Dargavel', 'tdargavel1@opensource.org', 'Q13GCI6Q0T', '2nd Floor', 8397232097, '2003-06-29');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Aksel', 'Bretherton', 'abretherton2@squidoo.com', 'ws6lEH6SvL', '20th Floor', 9732863403, '1994-07-31');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Richy', 'Sirrell', 'rsirrell3@omniture.com', '7RYc6EuC4', 'Room 844', 9954378572, '1988-05-11');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Mindy', 'Hulburd', 'mhulburd4@walmart.com', 'zbmqo4xnJCF', 'PO Box 9431', 9694490107, '1991-04-03');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Ewan', 'Sowman', 'esowman5@stanford.edu', 'HLe0WSAsuflc', 'Apt 1892', 9713158639, '2002-10-13');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Davon', 'Edmundson', 'dedmundson6@tuttocitta.it', 'ZllYymXWh9', 'Room 1410', 9789386836, '1977-10-28');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Raimund', 'Malimoe', 'rmalimoe7@w3.org', 'FUvMSN9CO', 'PO Box 51621', 9571830226, '1981-08-23');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Annabell', 'Strephan', 'astrephan8@hatena.ne.jp', '0q1U4Am5M', 'Apt 454', 9063729781, '1993-11-22');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Gustave', 'Spencook', 'gspencook9@cnbc.com', 'JfpuIkyQZ', 'Room 1873', 9839621439, '1995-07-22');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Germayne', 'Hampton', 'ghamptona@cornell.edu', 'Lh6e922k', 'Room 709', 9133206678, '1977-04-07');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Cleve', 'Kroon', 'ckroonb@uol.com.br', 'eO6V5yUEKuLe', '16th Floor', 8938333137, '1996-06-21');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Jonie', 'Dunthorn', 'jdunthornc@cnet.com', 'vqwJMcf', 'Room 1918', 9953082005, '2003-07-05');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Nerty', 'Alner', 'nalnerd@sakura.ne.jp', 'WShV5f9', 'PO Box 73664', 8947746311, '1977-12-07');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Robinetta', 'Pim', 'rpime@issuu.com', 'c4L17OrU', 'Room 254', 9052618573, '1999-11-12');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Siward', 'Conneely', 'sconneelyf@squidoo.com', 'W0jYa0RX1e', '14th Floor', 9420234539, '1999-12-26');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Quinlan', 'Rioch', 'qriochg@etsy.com', 'LA8gW19bfxP', 'Apt 1229', 9986217305, '1995-08-10');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Othella', 'Zanettini', 'ozanettinih@edublogs.org', 'Ea1OOLDAQp', '13th Floor', 8698780745, '1985-01-29');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Cissy', 'Labusquiere', 'clabusquierei@abc.net.au', 'YhpVoVtxJ', 'PO Box 45161', 9865432222, '1993-01-07');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Thorpe', 'Grosier', 'tgrosierj@sourceforge.net', 'P4lhACyPPe7', '2nd Floor', 9122189929, '1988-03-07');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Parnell', 'Pendlenton', 'ppendlentonk@ustream.tv', '2YPuLVS6WX', 'PO Box 49903', 9567312710, '2000-04-22');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Eachelle', 'Bauldrey', 'ebauldreyl@mac.com', 'x7kqwJpIY', 'PO Box 93075', 9168271929, '1981-05-23');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Jarred', 'Scapelhorn', 'jscapelhornm@weebly.com', '0ICG430mI6hF', 'Suite 3', 9188099526, '1975-06-10');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Sukey', 'Bedbury', 'sbedburyn@independent.co.uk', 'YAoFB8NAnbDk', 'Suite 31', 8628028036, '1993-09-13');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Pacorro', 'Szapiro', 'pszapiroo@ameblo.jp', 'Ojo7PVa', 'Room 203', 9250499014, '1995-09-19');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Melba', 'Foan', 'mfoanp@gmpg.org', 'YaGxwyeFvUyt', 'Room 1769', 9926531493, '1982-09-16');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Javier', 'Holbury', 'jholburyq@yahoo.com', 'RE3vwP', 'Room 182', 8570180582, '1988-01-15');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Gisela', 'Cusiter', 'gcusiterr@google.com.au', 'lflVnwJAVAFT', 'Apt 1470', 9723770598, '1983-04-25');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Nessi', 'Turfus', 'nturfuss@tuttocitta.it', 'oz04Xj6', '20th Floor', 8200883092, '1981-12-09');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Consuela', 'Raffon', 'craffont@drupal.org', 'zHenM4zXX', 'PO Box 79476', 9648945586, '1984-06-08');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Rusty', 'Trenoweth', 'rtrenowethu@cpanel.net', 'V647Ies1l', 'Suite 51', 9406622649, '1989-04-26');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Afton', 'Murch', 'amurchv@discuz.net', 'TCcBF5outQ', 'Apt 1252', 8959734495, '1987-09-14');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Bronnie', 'Grigoryev', 'bgrigoryevw@fema.gov', 'uwwUTYnRE', '2nd Floor', 8464285821, '1987-03-24');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Boothe', 'Triplet', 'btripletx@fc2.com', 'pFQC6e', '17th Floor', 8550527341, '2003-04-21');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Mano', 'McPartlin', 'mmcpartliny@cnet.com', 'pKevapf', 'Room 1681', 8539553383, '1993-07-01');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Ajay', 'Jedrzej', 'ajedrzejz@shutterfly.com', 'iwle7ldj', '7th Floor', 8061722379, '1979-11-05');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Itch', 'Heinreich', 'iheinreich10@toplist.cz', 'vD4jUx0D', 'Suite 16', 8395943358, '1993-05-16');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Katey', 'Applewhite', 'kapplewhite11@smh.com.au', 'N8WQSMh40n', 'Apt 1442', 9992823964, '1989-02-18');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Eada', 'Basketfield', 'ebasketfield12@nsw.gov.au', '1gRUMF', 'Room 1947', 8443653133, '1998-04-17');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Valentine', 'Benedikt', 'vbenedikt13@constantcontact.com', '1msTKCvT', 'Suite 28', 8423407960, '1996-05-31');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Una', 'Addey', 'uaddey14@storify.com', 'HbmfpHnzA', 'PO Box 81270', 9029809186, '1983-04-22');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Helen-elizabeth', 'Grindley', 'hgrindley15@google.com.hk', 'XTcsik0BbWUe', 'PO Box 53310', 8681199088, '1993-03-10');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Jedediah', 'Le Jean', 'jlejean16@google.com.hk', '8viIBgiejk', 'Suite 28', 9263512749, '1976-01-23');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Salomi', 'Cremer', 'scremer17@netlog.com', 'f4ovMGOZlFDa', 'PO Box 56485', 8655963488, '2003-12-28');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Edsel', 'Nayer', 'enayer18@ihg.com', 'Afp2GL1', '5th Floor', 9174749488, '1994-08-25');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Hildagard', 'Monelli', 'hmonelli19@nature.com', 'Rlc0WR2bl', 'PO Box 44845', 8035676756, '2004-03-20');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Iggy', 'Van Salzberger', 'ivansalzberger1a@state.gov', 'bWuiv9ljWm', 'Room 874', 9519168754, '1978-05-18');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Willem', 'Gannan', 'wgannan1b@nyu.edu', 'eKtmAttKhSqH', 'Apt 1473', 9961443863, '1998-08-25');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Ignazio', 'Jiruca', 'ijiruca1c@gizmodo.com', 'ExCA08ioqQQ', 'Room 201', 9608699813, '2000-09-04');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Pieter', 'Edgar', 'pedgar1d@msu.edu', 'TW4LIUOx', '15th Floor', 8176220496, '1983-07-02');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Elane', 'Horley', 'ehorley1e@bloomberg.com', '2bodfIl17E', 'Suite 89', 8185488393, '1990-06-26');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Christie', 'Losty', 'closty1f@posterous.com', '9pxR7FTPxZ41', 'Suite 22', 8973698741, '1980-01-30');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Mario', 'Death', 'mdeath1g@amazon.de', 'hvfX7p8Rd5', 'Apt 844', 8937472978, '1978-01-17');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Kristyn', 'Bruun', 'kbruun1h@51.la', 'bakFt1GQdy', 'PO Box 86763', 9992882462, '1981-09-20');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Jessamyn', 'Kernes', 'jkernes1i@addthis.com', 'flzz2OjdeK3V', 'PO Box 37037', 8013254376, '1998-07-14');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Iolande', 'Binner', 'ibinner1j@geocities.jp', 'VdmjBwzOVxJA', 'Room 986', 8661265713, '2002-08-18');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Vlad', 'Churchin', 'vchurchin1k@earthlink.net', 'UQIcLd', '13th Floor', 9856494484, '2001-02-16');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Georgette', 'Mattes', 'gmattes1l@angelfire.com', 'w91fxJRq1', 'PO Box 69918', 9050425705, '1996-09-23');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Cherish', 'Ghelarducci', 'cghelarducci1m@surveymonkey.com', 'Sy4GF6', '4th Floor', 9529462800, '1989-12-20');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Feliks', 'Tennant', 'ftennant1n@msu.edu', 'yR8sNHk7V', 'Apt 1698', 8866584742, '1992-10-30');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Demetris', 'Walasik', 'dwalasik1o@t.co', 'QbCw9rQ7tE', 'Apt 209', 8289520680, '1985-02-22');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Neil', 'Willmott', 'nwillmott1p@tuttocitta.it', '9Pg7bmdEa9', 'PO Box 50306', 8486564141, '1975-04-04');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Vanni', 'Kuhnel', 'vkuhnel1q@ucoz.com', 'CQThSiDbosPo', 'Apt 458', 8176307448, '1996-01-22');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Sharline', 'Herculeson', 'sherculeson1r@google.es', '6zoJpWDhdqp8', 'PO Box 41749', 8149845405, '1996-12-22');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Randy', 'Canto', 'rcanto1s@nsw.gov.au', '8hLtsKEP', 'Room 213', 9225460700, '1984-09-28');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Ermentrude', 'Botham', 'ebotham1t@cisco.com', '4iW7vxnf', 'Apt 19', 8107377149, '1990-11-17');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Jareb', 'Milam', 'jmilam1u@ibm.com', '9IqV16y4u', 'Apt 957', 9830315311, '2001-09-15');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Keene', 'Ablott', 'kablott1v@ameblo.jp', 'DUEGcwH', 'Suite 94', 8908872743, '1990-05-28');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Yanaton', 'Cuff', 'ycuff1w@independent.co.uk', '4unD7C', 'Room 1105', 8374412838, '1981-09-15');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Dorothea', 'Deards', 'ddeards1x@house.gov', 'TLOSGktLWZxY', 'Room 1707', 8151538467, '1985-02-06');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Marlee', 'Gariff', 'mgariff1y@blogs.com', 'r8LFmN9', 'PO Box 37392', 9168863334, '1975-10-03');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Felizio', 'Speariett', 'fspeariett1z@studiopress.com', 'oQa3YAy', 'Apt 1866', 8792381251, '1995-02-19');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Fanchette', 'Churchlow', 'fchurchlow20@deviantart.com', 'zkoyK19Q', 'PO Box 11145', 8262605562, '1991-10-18');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Ailis', 'Follet', 'afollet21@bravesites.com', 'NoraJQ0RMbdX', 'Suite 25', 8347857086, '1990-12-05');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Kory', 'Guilford', 'kguilford22@cornell.edu', 'wNiITV', '18th Floor', 8933137435, '1982-08-20');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Fidelio', 'Oxtiby', 'foxtiby23@google.com.br', '8qQgIpZNzc', 'Suite 39', 9502900958, '2003-12-31');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Georg', 'Fricker', 'gfricker24@dell.com', 'sDsWvuLF', 'Suite 95', 9531225342, '1987-07-05');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Hamilton', 'Brigham', 'hbrigham25@about.me', '9Hi5iTC', 'Room 1391', 8897665127, '2000-07-27');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Lura', 'Aggott', 'laggott26@forbes.com', 'Yi8Q9QVgB', 'Apt 569', 8281708267, '1989-11-12');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Jolee', 'Vasilchikov', 'jvasilchikov27@alibaba.com', '02KDBvh', 'Suite 83', 8536250315, '1976-09-18');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Kennie', 'Rubens', 'krubens28@pinterest.com', 'bco6KJKotvm5', 'PO Box 5263', 8205868669, '2003-07-19');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Abramo', 'Boothby', 'aboothby29@bandcamp.com', 'pUTqKn0uxbbx', 'Room 806', 8239560043, '1995-12-04');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Lezlie', 'Steenson', 'lsteenson2a@rakuten.co.jp', 'E0EzXXa', 'PO Box 34927', 9117938689, '1987-04-19');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Louie', 'Baccup', 'lbaccup2b@nhs.uk', 'nyorqkRZ2', 'PO Box 49893', 8282577399, '1986-04-06');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Nannette', 'Seakings', 'nseakings2c@gov.uk', 'FNGgE1odeX', '15th Floor', 9949565276, '1995-09-30');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Jess', 'Fiske', 'jfiske2d@unicef.org', 'X1ID3kIuv', 'Apt 856', 8349287572, '1995-09-16');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Kev', 'Kensitt', 'kkensitt2e@netvibes.com', 'k3CDo5HS', 'Apt 1880', 9533238949, '2000-10-13');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Amalle', 'Plom', 'aplom2f@miibeian.gov.cn', 'xSN92vO', 'Room 1322', 9288117065, '2002-11-28');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Samson', 'Cromb', 'scromb2g@ca.gov', 'G95KFq', 'PO Box 71178', 9801758448, '1983-04-06');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Nicko', 'Germon', 'ngermon2h@dropbox.com', 'KPzKZIc17H', 'Room 1250', 8379434697, '1986-03-07');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Thebault', 'Fallis', 'tfallis2i@ucsd.edu', 'zfcY6sSg2MT', 'Apt 271', 8915325465, '1989-03-06');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Julina', 'Stoop', 'jstoop2j@deviantart.com', '7mjzfn', 'Suite 29', 8533721947, '1997-01-09');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Heriberto', 'Pues', 'hpues2k@goodreads.com', '7r09cbH', 'Suite 75', 8743195841, '1996-03-16');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Taite', 'Hanscome', 'thanscome2l@sciencedaily.com', 'LSrttI', 'Room 1232', 9572838532, '2002-09-15');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Deloria', 'Veregan', 'dveregan2m@scientificamerican.com', 'AmXgn5RgV', 'PO Box 2385', 9716366357, '2001-04-06');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Cyndia', 'Hauxby', 'chauxby2n@4shared.com', '0cxe8qOTaYcG', 'PO Box 53884', 8610319575, '1983-03-13');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Marcus', 'Cuvley', 'mcuvley2o@wikia.com', 'DwusvG0ktP', 'Suite 97', 8691482729, '1984-03-10');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Aland', 'Griffey', 'agriffey2p@statcounter.com', 'esgb1p', 'Apt 71', 8222681140, '1976-07-15');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Alexine', 'Antognelli', 'aantognelli2q@washingtonpost.com', 'PqaQpL643', 'Apt 173', 9002219327, '1986-12-21');
insert into User (  Ufirstname, ULastname, Uemail, Upwd, Uaddr, Uphone, Udob) values ( 'Dacy', 'Cornelissen', 'dcornelissen2r@noaa.gov', 'mGluLy', 'Room 532', 8593216413, '1996-01-29');
select * from User;

insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Pepsi - 600ml', 745, 'Grocery', 'Available', 10);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Flour - All Purpose', 998, 'Grocery', 'Available', 25);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Beer - Blue Light', 829, 'Grocery', 'Available', 11);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Paper - Brown Paper Mini Cups', 303, 'Grocery', 'High Demand', 18);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Water - Perrier', 432, 'Grocery', 'Available', 29);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Petite Baguette', 708, 'Grocery', 'Available', 19);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Salmon Steak - Cohoe 6 Oz', 441, 'Grocery', 'Available', 18);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Sauce - White, Mix', 251, 'Grocery', 'High Demand', 27);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Bok Choy - Baby', 339, 'Grocery', 'Available', 28);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Veal - Nuckle', 608, 'Grocery', 'Available', 10);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Pumpkin', 413, 'Grocery', 'Available', 24);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Beef - Texas Style Burger', 532, 'Grocery', 'High Demand', 30);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Veal - Insides Provini', 324, 'Grocery', 'Available', 18);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Pepper - White, Whole', 858, 'Grocery', 'Available', 15);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Soup - Verve - Chipotle Chicken', 394, 'Grocery', 'Available', 12);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Wine - Saint Emilion Calvet', 392, 'Grocery', 'High Demand', 10);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Dc Hikiage Hira Huba', 950, 'Grocery', 'Available', 12);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Jameson Irish Whiskey', 809, 'Grocery', 'Available', 17);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Seedlings - Buckwheat, Organic', 505, 'Grocery', 'Available', 14);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Chocolate - Dark Callets', 419, 'Grocery', 'Available', 19);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Flower - Dish Garden', 738, 'Grocery', 'Available', 29);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Ham - Smoked, Bone - In', 771, 'Grocery', 'Available', 21);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Salt - Table', 695, 'Grocery', 'Available', 35);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Mcgillicuddy Vanilla Schnap', 444, 'Grocery', 'High Demand', 27);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Muffin - Zero Transfat', 599, 'Grocery', 'Available', 20);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Cheese - Blue', 769, 'Grocery', 'Available', 35);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Bread - Olive', 327, 'Grocery', 'Available', 21);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Juice - Clamato, 341 Ml', 265, 'Grocery', 'Available', 10);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Capers - Pickled', 674, 'Grocery', 'Available', 12);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Carbonated Water - Lemon Lime', 887, 'Grocery', 'Available', 25);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Bread Fig And Almond', 862, 'Grocery', 'High Demand', 25);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Bread - Crumbs, Bulk', 800, 'Grocery', 'Available', 18);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Tea - Herbal - 6 Asst', 693, 'Grocery', 'Available', 11);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Bamboo Shoots - Sliced', 817, 'Grocery', 'Available', 29);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Chestnuts - Whole,canned', 750, 'Grocery', 'Available', 16);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Bread - Petit Baguette', 256, 'Grocery', 'Available', 13);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Pastry - Apple Muffins - Mini', 992, 'Grocery', 'High Demand', 12);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Wine - Sawmill Creek Autumn', 421, 'Grocery', 'Available', 13);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Mussels - Frozen', 454, 'Grocery', 'Available', 32);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Napkin White - Starched', 779, 'Grocery', 'Available', 31);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Q', 3551320, 'Car', 'High Demand', 6);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('TL', 1952243, 'Car', 'Available', 8);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('DeVille', 509060, 'Car', 'Available', 6);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('X5', 4219661, 'Car', 'Available', 7);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Taurus X', 1949676, 'Car', 'Available', 3);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Allroad', 3858756, 'Car', 'Available', 4);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Impala', 2342688, 'Car', 'Available', 5);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('500SEL', 4038226, 'Car', 'Available', 5);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Town Car', 816872, 'Car', 'Available', 2);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Prowler', 2066335, 'Car', 'High Demand', 10);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('SLS AMG', 4203165, 'Car', 'Available', 4);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Escort', 1533687, 'Car', 'Available', 3);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Corvette', 1589853, 'Car', 'Available', 2);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Rapide', 2061443, 'Car', 'High Demand', 8);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Yukon XL 1500', 4460991, 'Car', 'Available', 10);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Tacoma', 851499, 'Car', 'Available', 7);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('530', 1770775, 'Car', 'Available', 4);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('8 Series', 2091697, 'Car', 'Available', 8);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('GS', 1433129, 'Car', 'Available', 10);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('300', 4654876, 'Car', 'Available', 7);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Ridgeline', 3702967, 'Car', 'Available', 4);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('S4', 1564661, 'Car', 'Available', 2);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Camry', 2576303, 'Car', 'Available', 7);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('929', 2887167, 'Car', 'Available', 7);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Sable', 553385, 'Car', 'Available', 3);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('M5', 2334629, 'Car', 'Available', 10);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Premier', 2645944, 'Car', 'Available', 3);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Suburban 1500', 4712705, 'Car', 'High Demand', 8);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Sonata', 3767602, 'Car', 'Available', 10);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Laser', 657837, 'Car', 'Available', 2);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Sonoma', 2815785, 'Car', 'Available', 8);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Altima', 1059522, 'Car', 'Available', 3);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('H3T', 3112095, 'Car', 'Available', 3);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('1500', 2905037, 'Car', 'Available', 5);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('RL', 2480651, 'Car', 'Available', 2);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Mark VIII', 1078228, 'Car', 'High Demand', 3);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Grand Vitara', 845035, 'Car', 'Available', 8);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Suburban 1500', 4152794, 'Car', 'High Demand', 4);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('S80', 3931045, 'Car', 'High Demand', 8);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('C-Class', 4070964, 'Car', 'High Demand', 9);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Dragon Ball Z)', 833, 'Novel', 'Available', 83);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Ferngully: The Last Rainforest', 2336, 'Novel', 'High Demand', 82);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Getting Any? (Minnâ-yatteruka!)', 4033, 'Novel', 'High Demand', 66);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('One Nation Under God ', 4911, 'Novel', 'Available', 70);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Planes, Trains & Automobiles', 4521, 'Novel', 'Available', 89);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Document of the Dead', 3935, 'Novel', 'Available', 75);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Saw VI', 1778, 'Novel', 'Available', 44);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Bullet for a Badman (Renegade Posse)', 2734, 'Novel', 'Available', 66);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Futurama: The Beast with a Billion Backs', 3384, 'Novel', 'Available', 73);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Two: The Story of Roman & Nyro', 2632, 'Novel', 'High Demand', 45);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Klansman, The', 3791, 'Novel', 'Available', 30);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Abominable', 4499, 'Novel', 'Available', 37);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Vidal Sassoon: The Movie', 4659, 'Novel', 'Available', 62);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Bronx Tale, A', 2072, 'Novel', 'Available', 93);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Home', 305, 'Novel', 'Available', 79);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Caught Inside', 1709, 'Novel', 'Available', 57);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Zorro, the Gay Blade', 2670, 'Novel', 'Available', 92);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Romeo Is Bleeding', 1396, 'Novel', 'Available', 97);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Your Highness', 3872, 'Novel', 'Available', 40);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Ride Lonesome', 2075, 'Novel', 'Available', 41);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Four Brothers', 2452, 'Novel', 'High Demand', 45);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Onibi: The Fire Within', 2434, 'Novel', 'Available', 86);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Fallen, The', 2733, 'Novel', 'Available', 62);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('300', 286, 'Novel', 'Available', 52);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Star Trek: Nemesis', 4653, 'Novel', 'Available', 68);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Giliap', 246, 'Novel', 'Available', 98);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Dracula Untold', 1127, 'Novel', 'Available', 77);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Grey Gardens', 1720, 'Novel', 'Available', 88);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Feast III: The Happy Finish', 898, 'Novel', 'Available', 55);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Sokkotanssi', 640, 'Novel', 'Available', 64);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('American Psycho', 3468, 'Novel', 'Available', 89);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Stigmata', 1324, 'Novel', 'Available', 78);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('One 2 Ka 4', 4759, 'Novel', 'Available', 53);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('The Diary of a Teenage Girl', 1392, 'Novel', 'Available', 54);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Last Metro, The (Dernier métro, Le)', 649, 'Novel', 'Available', 70);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Chameleon, The ', 1713, 'Novel', 'Available', 33);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Bride Wore Black, The (La mariée était en noir)', 2099, 'Novel', 'Available', 60);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Safety Not Guaranteed', 2483, 'Novel', 'Available', 49);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Dog Pound', 4512, 'Novel', 'Available', 39);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Vuonna 85', 2961, 'Novel', 'Available', 62);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Psophocarpus', 763, 'Plants', 'Available', 30);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Lowland Rotala', 156, 'Plants', 'Available', 63);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Cecidonia Lichen', 390, 'Plants', 'Available', 63);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Mudmats', 703, 'Plants', 'Available', 77);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Koch''s Entosthodon Moss', 921, 'Plants', 'Available', 72);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Antilles Clearweed', 944, 'Plants', 'Available', 75);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Twocolor Sedge', 876, 'Plants', 'Available', 70);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Mono Hot Springs Evening Primrose', 759, 'Plants', 'Available', 41);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Schaffner''s Spikerush', 702, 'Plants', 'Available', 98);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Sierra Hare Sedge', 766, 'Plants', 'Available', 38);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Bristly Scaleseed', 996, 'Plants', 'Available', 37);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Harper''s Beaksedge', 127, 'Plants', 'Available', 68);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Cottonrose', 214, 'Plants', 'High Demand', 54);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Western Azalea', 979, 'Plants', 'Available', 75);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Rio Grande Lovegrass', 501, 'Plants', 'Available', 51);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Field Pussytoes', 500, 'Plants', 'Available', 41);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Drooping Sedge', 554, 'Plants', 'Available', 36);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Indian Anoda', 594, 'Plants', 'Available', 84);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Dwarf Umbrella Tree', 304, 'Plants', 'Available', 39);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Annual Clary', 268, 'Plants', 'Available', 77);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Markhamia', 700, 'Plants', 'Available', 99);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Hairy Horsebrush', 891, 'Plants', 'Available', 79);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Bristly Matilija Poppy', 375, 'Plants', 'Available', 57);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Chaparral Pea', 864, 'Plants', 'Available', 80);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Dimpled Troutlily', 712, 'Plants', 'Available', 88);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Yellowflower Locoweed', 739, 'Plants', 'High Demand', 79);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Lassen Sandverbena', 699, 'Plants', 'Available', 95);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Marang', 143, 'Plants', 'Available', 52);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Stirtonia Lichen', 687, 'Plants', 'Available', 49);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Oregon Violet', 599, 'Plants', 'High Demand', 84);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Sticky Cinquefoil', 905, 'Plants', 'High Demand', 99);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Rigid Stripeseed', 933, 'Plants', 'Available', 48);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Michigan Monkeyflower', 738, 'Plants', 'Available', 66);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Walnut Spleenwort', 853, 'Plants', 'High Demand', 85);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Yellow Spinecape', 970, 'Plants', 'Available', 100);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Andreaea Moss', 980, 'Plants', 'Available', 93);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Fewflower Blazing Star', 279, 'Plants', 'Available', 77);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Branching Phacelia', 876, 'Plants', 'High Demand', 47);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Drumheads', 485, 'Plants', 'Available', 58);
insert into Product (Prname, Prprice, Prcategory, Prstatus, Prunits) values ('Neverdie', 687, 'Plants', 'High Demand', 47);


select * from Product;



insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Noni', 'Carnell', 'ncarnell0@yandex.ru', 'dNo1gZj4v6w', '82023 Pennsylvania Center', 9853102743, 10513, 984300870458, '1979-09-12');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Danni', 'Pashen', 'dpashen1@ow.ly', 'FOQkcDAt', '3 Lighthouse Bay Street', 8798898298, 10833, 656628504474, '1987-03-28');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Bili', 'Ricciardiello', 'bricciardiello2@dailymail.co.uk', '4oPZWufOsc', '3704 Butternut Terrace', 8385381084, 14170, 197295081215, '1993-12-13');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Bartolomeo', 'Dumbleton', 'bdumbleton3@hao123.com', 'yYy64K', '1 Annamark Terrace', 7933303733, 14550, 356484679479, '1991-09-27');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Fabio', 'Duplan', 'fduplan4@deliciousdays.com', 'Stsfv2Z', '98338 Melby Trail', 8308452504, 14385, 259689817147, '1982-12-23');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Eula', 'Davidman', 'edavidman5@freewebs.com', 'KYCTanhSStZt', '22 Fordem Alley', 9561913533, 13836, 474144493377, '1990-11-10');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Carmita', 'Zoren', 'czoren6@slideshare.net', 'eo7YvaxENx', '2 Delaware Park', 9080705945, 12396, 380781762668, '1979-10-20');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Leonardo', 'Withrop', 'lwithrop7@xing.com', 'tVhRThZ', '9 Buhler Center', 9920250797, 12072, 654096611059, '2001-07-24');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Yuma', 'Pudney', 'ypudney8@networkadvertising.org', 'Sz8ynFAomnYk', '72 Pleasure Drive', 9107038360, 12027, 155839353289, '1983-02-23');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Benedetto', 'Ashment', 'bashment9@hao123.com', '6JNrvSZvVa4', '80941 Mariners Cove Hill', 8593355381, 13071, 274784030089, '1981-06-10');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Tiena', 'Mulvin', 'tmulvina@mac.com', '0mUNZaRHl0S', '792 Annamark Place', 9137100673, 10725, 692581897573, '1978-08-17');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Colette', 'Fransseni', 'cfranssenib@ebay.co.uk', 'bqTN92WvJ', '8358 Oneill Junction', 9729149309, 12143, 610308838809, '1981-03-28');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Sol', 'Paulet', 'spauletc@nasa.gov', 'vt8mEMPit', '4959 Moland Hill', 7988733830, 11163, 131776702751, '1996-05-25');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Imelda', 'Vuittet', 'ivuittetd@ask.com', '2mMBDOZW', '0 Scofield Court', 8540623625, 14335, 150504695990, '1978-07-12');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Jaymee', 'Sudy', 'jsudye@linkedin.com', 'Wz9OcPWr', '414 Arrowood Alley', 7968662800, 10665, 259688630312, '1988-11-14');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Reagen', 'Romer', 'rromerf@baidu.com', 'gWqwAkIsTn0', '2129 Kennedy Avenue', 8308025035, 12442, 105334243074, '1982-08-25');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Melva', 'Willgrass', 'mwillgrassg@reuters.com', 'NPhtn7wE', '735 Warbler Pass', 9758662803, 10934, 325350286302, '1982-11-23');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Colleen', 'Stickler', 'csticklerh@simplemachines.org', 'wvntDIX5d', '14 Gulseth Crossing', 9527621810, 10463, 966468788049, '1999-05-07');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Baldwin', 'Yosevitz', 'byosevitzi@hexun.com', 'l7OEvfRcCmk', '40 Crest Line Lane', 8748471866, 11490, 411232610780, '1988-08-12');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Prince', 'Rawlings', 'prawlingsj@amazonaws.com', 'p5O8nXzld6hh', '9309 Hoepker Crossing', 9857622695, 12726, 263968415046, '2004-10-30');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Lawton', 'Forstall', 'lforstallk@businessinsider.com', 'SZJewFFZQm', '920 Elgar Avenue', 9202857566, 13147, 397154044309, '1999-08-26');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Hallsy', 'Baty', 'hbatyl@accuweather.com', 'rr8wdWW4', '29 Bayside Plaza', 9511971554, 14643, 609905637301, '2001-02-12');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Imogene', 'Mutch', 'imutchm@ucsd.edu', 'ufIzqi', '715 Oak Valley Avenue', 8168512826, 11912, 558374683511, '1986-03-12');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Chadwick', 'Heilds', 'cheildsn@shutterfly.com', '3GAiA35J', '68680 Rowland Terrace', 9901451215, 14741, 394955780044, '2002-12-04');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Aimee', 'Presidey', 'apresideyo@behance.net', 'GqmWAcefq1ft', '73288 Talmadge Way', 9329205669, 13816, 484514655676, '1994-04-24');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Adolpho', 'Gummow', 'agummowp@dell.com', 'ToPap8', '40037 Thierer Way', 8503136578, 12123, 385146858204, '1997-08-28');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Kenneth', 'Stannah', 'kstannahq@smh.com.au', 'lH1H8QC8lfU', '07 Pawling Pass', 9089378385, 13336, 958593184394, '1984-11-25');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Charmian', 'Elliot', 'celliotr@mozilla.com', 'SOdUFrCAk', '3734 Loftsgordon Parkway', 7833316939, 13200, 975521837919, '1992-10-02');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Karoline', 'Schaumann', 'kschaumanns@fc2.com', '00Nd8SiY', '639 Welch Pass', 8426440012, 14110, 654790569174, '1988-04-13');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Lucie', 'Mattingson', 'lmattingsont@spiegel.de', '5Ujyt0e', '9 Glacier Hill Circle', 9398122336, 13045, 735327221715, '2002-02-25');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Yelena', 'Scogin', 'yscoginu@jalbum.net', 'IhVWSMaQNBED', '444 Stephen Center', 9262998562, 14889, 749816622217, '1987-11-25');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Dalton', 'Haythorn', 'dhaythornv@1und1.de', 'Pu2FQJlkBfq8', '02 Spohn Court', 9813907238, 10406, 856370862265, '1983-03-11');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Engracia', 'Faragher', 'efaragherw@dell.com', 'KF3PcQGnU', '162 Veith Trail', 9115733297, 14460, 108767499605, '2001-08-25');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Doe', 'Levermore', 'dlevermorex@myspace.com', 'gYzWzkY', '7 Leroy Pass', 8749782870, 10386, 986813534487, '1986-04-06');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Witty', 'Loyd', 'wloydy@delicious.com', '6ILhcL7fw3J', '160 Dryden Pass', 8986469783, 12271, 751573356631, '2002-07-08');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Nathaniel', 'Dunnion', 'ndunnionz@twitpic.com', '9fjuTvy', '38246 Northport Avenue', 7936810751, 11541, 482010721487, '1990-12-06');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Ivan', 'Hughesdon', 'ihughesdon10@t-online.de', 'A2U8NJ', '174 Kedzie Road', 9791356287, 13730, 270901278742, '2001-08-28');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Sascha', 'Nosworthy', 'snosworthy11@surveymonkey.com', 'uyTyTNqH', '59 Arizona Pass', 8069469226, 11845, 548479098672, '1975-04-03');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Ronnie', 'Peert', 'rpeert12@mit.edu', 'obtO3iM', '8464 Susan Park', 8210106836, 14810, 745047342022, '1984-12-31');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Melonie', 'Hauxley', 'mhauxley13@auda.org.au', 'WhU41TRz', '5820 Pleasure Avenue', 9102169877, 14371, 511423520267, '1980-09-17');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Dode', 'Rickards', 'drickards14@irs.gov', 'iRywIU', '94 Fieldstone Street', 8192682573, 14301, 342493189777, '1977-05-22');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Ellissa', 'Bastone', 'ebastone15@si.edu', '8l6OCUWRbS', '97800 Dahle Way', 8188993166, 10130, 214574236157, '1978-08-29');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Maiga', 'Liebermann', 'mliebermann16@msu.edu', '3Hy97gR', '37013 Helena Pass', 9374043116, 14927, 199760060352, '2000-04-26');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Nelli', 'Purtell', 'npurtell17@alibaba.com', 'crbOe8yA2', '980 Harbort Avenue', 9450123653, 13128, 305318312381, '1977-06-08');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Welch', 'Canti', 'wcanti18@drupal.org', '3qoRnraa', '69454 Ilene Parkway', 9990694778, 12345, 519090187389, '1980-06-25');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Wilfrid', 'McBrearty', 'wmcbrearty19@cocolog-nifty.com', '9euCzQnhPvy', '58 Old Shore Circle', 8966355437, 10968, 761195850938, '1986-08-13');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Andeee', 'Lugg', 'alugg1a@upenn.edu', 'fMIoC2eE3', '8824 Esch Lane', 7833083505, 13012, 754625625831, '1975-03-04');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Sebastian', 'Rowswell', 'srowswell1b@digg.com', '8LwzlN2fn', '2 Eastwood Alley', 9677951368, 10015, 315838104403, '1992-07-12');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Alano', 'Kenshole', 'akenshole1c@reference.com', '17OibIqwiU', '0 Doe Crossing Circle', 8732001352, 11246, 536903506776, '1990-04-29');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Germana', 'Critchley', 'gcritchley1d@over-blog.com', 'pVVOIlZM', '68876 Declaration Trail', 8437658252, 10292, 711261702429, '1995-03-30');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Asa', 'Shergill', 'ashergill1e@ihg.com', 'RG6Gd2', '8958 Hoepker Crossing', 8576904287, 13167, 623905482602, '1994-01-21');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Newton', 'Dashkovich', 'ndashkovich1f@eepurl.com', 'Up0jlm5g', '9232 Northview Parkway', 8646356662, 12014, 986034938000, '1982-06-16');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Burlie', 'Glede', 'bglede1g@sun.com', 'KM31gXE7', '50265 Center Place', 9701118160, 14576, 528800198100, '2000-07-26');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Arri', 'Faldo', 'afaldo1h@cmu.edu', 'HYnUyPGvgiPi', '7688 Marquette Road', 9344219452, 10629, 194168083230, '1982-07-26');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Nonie', 'Baud', 'nbaud1i@ehow.com', 'q3zKOafyz9Ih', '51963 Towne Hill', 9225777898, 10047, 920803940931, '1978-06-30');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Calli', 'Hawtry', 'chawtry1j@spotify.com', 'LiulQNxq', '627 Monument Plaza', 8307923952, 12740, 550215198715, '1991-03-14');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Melody', 'Antowski', 'mantowski1k@paypal.com', 'NeZa5oZvSlM', '411 Porter Center', 9441644297, 10135, 993261406752, '1983-11-16');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Glynn', 'Anthony', 'ganthony1l@twitter.com', 'YftuRKUg4gQ8', '30777 Jenna Pass', 8670241341, 11626, 986882989700, '2001-12-17');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Elia', 'Dradey', 'edradey1m@mozilla.com', 'tJhbkB1NKIx', '08952 Grayhawk Center', 9744039884, 11731, 471391543909, '1992-12-18');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Dorey', 'Woodfine', 'dwoodfine1n@acquirethisname.com', 'QhlDS5ZAEd', '81 Lake View Drive', 9530330437, 13950, 510316808096, '1978-08-09');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Layla', 'Callicott', 'lcallicott1o@edublogs.org', 'XtYyYm2e', '46 Center Park', 9237913797, 14588, 923672730378, '1982-12-23');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Caprice', 'Meneely', 'cmeneely1p@lycos.com', 'oXRsvcU', '2259 Hagan Circle', 8497573209, 12020, 448868296625, '1995-04-05');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Rosalind', 'Odhams', 'rodhams1q@nasa.gov', 'c6fLZKT', '7148 Harbort Center', 8607053589, 13938, 952552220018, '1976-10-02');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Rachele', 'Balazot', 'rbalazot1r@stanford.edu', 't304tTFSDp4', '549 Jay Hill', 8592360364, 14094, 675517949286, '1991-10-27');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Marcel', 'Letson', 'mletson1s@noaa.gov', 'fAyu8M', '81436 Oneill Alley', 9391903959, 14754, 671957440068, '2000-11-20');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Valma', 'Honeywood', 'vhoneywood1t@wordpress.org', 'Ipdn30vVf', '77162 Morningstar Junction', 9946079769, 11327, 229012186319, '1988-11-28');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Hanni', 'Larder', 'hlarder1u@ning.com', 'Uvlgzo4', '11824 Farmco Pass', 8016699269, 13642, 914061482714, '1990-01-01');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Harry', 'Beernaert', 'hbeernaert1v@spotify.com', 'B0cn84', '07809 Crowley Crossing', 8382597694, 10858, 828519593001, '2003-07-29');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Davy', 'Merrikin', 'dmerrikin1w@trellian.com', 'G0DDFcsASqvm', '6 Barnett Center', 8049956209, 14443, 635957717545, '1998-07-11');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Carlo', 'Pigne', 'cpigne1x@xrea.com', 'QLFNxNIuLZhE', '695 Warrior Trail', 9970395027, 11328, 847373421675, '2001-02-19');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Cleve', 'Teasey', 'cteasey1y@theguardian.com', 'Q4wbYcvO', '9142 Bunker Hill Pass', 8894531898, 14030, 447276352854, '1999-08-31');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Aluino', 'Dilley', 'adilley1z@vinaora.com', 'BfnfHYbn8Zz', '89 Moland Terrace', 7868544286, 12387, 107353512734, '2001-06-16');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Cullan', 'Petrushkevich', 'cpetrushkevich20@mapy.cz', 'PpAy3AUaj2', '31570 Village Crossing', 9008833578, 12619, 363851611753, '1998-08-12');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Marcy', 'Jeandel', 'mjeandel21@salon.com', 'Iy2IIcqJb1', '13 Farragut Terrace', 8405885781, 10958, 496092373619, '2000-11-22');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Abel', 'Sutter', 'asutter22@noaa.gov', '4BYVO416qAb', '816 Dixon Road', 8807444430, 13403, 927600455165, '1991-03-21');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Ardelis', 'McGeffen', 'amcgeffen23@seesaa.net', 'axg4hI', '95 Coleman Plaza', 8613675884, 11365, 381960835295, '1982-05-08');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Nathanial', 'Blagburn', 'nblagburn24@admin.ch', 'QvGyuZ9FsXbs', '6 Rigney Terrace', 8528284889, 13394, 292040464582, '1983-01-29');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Hasheem', 'Southworth', 'hsouthworth25@discuz.net', 'slys92', '53273 Graceland Crossing', 9245510149, 14374, 766703481805, '2001-08-07');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Wilhelmine', 'Thwaites', 'wthwaites26@arizona.edu', 'UuDttc0zAQZ8', '0177 Bobwhite Trail', 8467967279, 14028, 708218646884, '2003-04-06');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Kalli', 'Bolstridge', 'kbolstridge27@prlog.org', 'cuElZX15', '43 Burning Wood Circle', 9145193203, 10946, 820119420339, '1981-05-30');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Marmaduke', 'Dibden', 'mdibden28@delicious.com', 'jDwHS3DilN5s', '887 Autumn Leaf Circle', 7852665755, 13418, 906286718019, '1989-02-22');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Donia', 'Harsent', 'dharsent29@google.com.br', 'WE9fnQbNXGy', '468 Stuart Pass', 9703787092, 14294, 157507494737, '2000-05-24');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Sherye', 'Dawson', 'sdawson2a@msn.com', 'arA5LfWA3', '60 Ronald Regan Point', 8598550624, 11016, 235088093521, '2000-09-02');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Reinald', 'Sheaf', 'rsheaf2b@illinois.edu', 'nqns9OTfAz', '7589 Jenifer Avenue', 8618383935, 10552, 500496783824, '2001-02-22');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Ursa', 'Stanistreet', 'ustanistreet2c@jugem.jp', 'QTwPlPpfk', '5 Melody Plaza', 8101445995, 10121, 551051038717, '1984-08-11');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Alica', 'Riggulsford', 'ariggulsford2d@yandex.ru', 'GgT7YlPKn', '1 Union Parkway', 9209754194, 11908, 471485044613, '1985-01-06');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Geoffry', 'Stoppe', 'gstoppe2e@howstuffworks.com', '4ta5VnlEQs', '1 Karstens Lane', 9505008279, 14313, 599216384671, '2003-01-01');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Merrilee', 'Kubes', 'mkubes2f@histats.com', 'EdXXF1', '2575 Briar Crest Park', 8474312766, 14409, 411774222655, '1990-03-16');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Averyl', 'Hutcheson', 'ahutcheson2g@sun.com', 'JO3bi2ajOQN', '43495 Atwood Terrace', 9311327910, 11425, 254901425820, '1983-08-26');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Dusty', 'Simoncelli', 'dsimoncelli2h@gizmodo.com', 'SC6AwAgeO', '39944 Graceland Circle', 9606444196, 12815, 142365558967, '1994-11-20');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Uta', 'Lashley', 'ulashley2i@guardian.co.uk', 'ndSYQF', '748 Longview Court', 9688577671, 12603, 346367724819, '1983-09-24');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Evaleen', 'Spanton', 'espanton2j@wordpress.org', 'AzCrxIzkHw', '7 Loftsgordon Plaza', 8205444240, 13566, 675596981698, '1984-11-11');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Putnam', 'O''Hederscoll', 'pohederscoll2k@prnewswire.com', 'H4W0A7tA', '8631 Corry Pass', 9949975614, 13498, 761301414665, '1985-09-12');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Christin', 'Spat', 'cspat2l@senate.gov', 'TxnC7h4Wy', '7880 Sloan Crossing', 9157811272, 13502, 389104044467, '1983-07-29');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Crin', 'Tenby', 'ctenby2m@histats.com', 'rmEa33HY7d98', '775 American Street', 9141641022, 10481, 912729657722, '1982-05-31');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Ermentrude', 'Litchmore', 'elitchmore2n@state.gov', '62Vel07u', '618 Sunnyside Park', 9597174613, 11602, 362527583026, '1978-01-05');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Cheri', 'Kmietsch', 'ckmietsch2o@google.co.uk', 'z3R2ad4Lm', '51937 David Hill', 8145399659, 13933, 754038957630, '1990-11-10');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Sonni', 'Southwick', 'ssouthwick2p@paypal.com', 'vHjzpQM', '4 Sundown Trail', 9587006806, 11554, 407931214572, '1988-09-02');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Rycca', 'Van der Krui', 'rvanderkrui2q@engadget.com', 'yBpDaltaCcop', '11 Packers Parkway', 9773172972, 12542, 557480522318, '2004-03-21');
insert into Deliveryperson ( DFirstname, DLastname, Demail, Dpwd, Daddr, Dphone, Dsalary, Daadhar, Ddob) values ( 'Tristam', 'Marczyk', 'tmarczyk2r@bbc.co.uk', '0pETWwV59', '058 Bay Road', 9225881349, 10126, 471171963382, '1988-06-22');

select * from Deliveryperson;


insert into Oder (Oid, Uid, Deliverydate, Did) values (1, 100, '2022-05-17', 1);
insert into Oder (Oid, Uid, Deliverydate, Did) values (2, 99, '2022-11-30', 2);
insert into Oder (Oid, Uid, Deliverydate, Did) values (3, 98, '2022-08-21', 3);
insert into Oder (Oid, Uid, Deliverydate, Did) values (4, 97, '2022-04-03', 4);
insert into Oder (Oid, Uid, Deliverydate, Did) values (5, 96, '2022-12-03', 5);
insert into Oder (Oid, Uid, Deliverydate, Did) values (6, 95, '2022-12-06', 6);
insert into Oder (Oid, Uid, Deliverydate, Did) values (7, 94, '2023-01-23', 7);
insert into Oder (Oid, Uid, Deliverydate, Did) values (8, 93, '2023-01-29', 8);
insert into Oder (Oid, Uid, Deliverydate, Did) values (9, 92, '2022-08-03', 9);
insert into Oder (Oid, Uid, Deliverydate, Did) values (10, 91, '2022-10-16', 10);
insert into Oder (Oid, Uid, Deliverydate, Did) values (11, 90, '2022-08-24', 11);
insert into Oder (Oid, Uid, Deliverydate, Did) values (12, 89, '2022-05-02', 12);
insert into Oder (Oid, Uid, Deliverydate, Did) values (13, 88, '2022-09-13', 13);
insert into Oder (Oid, Uid, Deliverydate, Did) values (14, 87, '2022-07-14', 14);
insert into Oder (Oid, Uid, Deliverydate, Did) values (15, 86, '2022-07-31', 15);
insert into Oder (Oid, Uid, Deliverydate, Did) values (16, 85, '2023-03-07', 16);
insert into Oder (Oid, Uid, Deliverydate, Did) values (17, 84, '2022-12-23', 17);
insert into Oder (Oid, Uid, Deliverydate, Did) values (18, 83, '2023-03-11', 18);
insert into Oder (Oid, Uid, Deliverydate, Did) values (19, 82, '2023-03-18', 19);
insert into Oder (Oid, Uid, Deliverydate, Did) values (20, 81, '2022-10-16', 20);
insert into Oder (Oid, Uid, Deliverydate, Did) values (21, 80, '2022-12-10', 21);
insert into Oder (Oid, Uid, Deliverydate, Did) values (22, 79, '2022-06-22', 22);
insert into Oder (Oid, Uid, Deliverydate, Did) values (23, 78, '2022-12-07', 23);
insert into Oder (Oid, Uid, Deliverydate, Did) values (24, 77, '2023-03-11', 24);
insert into Oder (Oid, Uid, Deliverydate, Did) values (25, 76, '2022-08-30', 25);
insert into Oder (Oid, Uid, Deliverydate, Did) values (26, 75, '2022-06-14', 26);
insert into Oder (Oid, Uid, Deliverydate, Did) values (27, 74, '2022-07-04', 27);
insert into Oder (Oid, Uid, Deliverydate, Did) values (28, 73, '2022-11-26', 28);
insert into Oder (Oid, Uid, Deliverydate, Did) values (29, 72, '2022-07-12', 29);
insert into Oder (Oid, Uid, Deliverydate, Did) values (30, 71, '2023-01-28', 30);
insert into Oder (Oid, Uid, Deliverydate, Did) values (31, 70, '2023-01-11', 31);
insert into Oder (Oid, Uid, Deliverydate, Did) values (32, 69, '2022-06-19', 32);
insert into Oder (Oid, Uid, Deliverydate, Did) values (33, 68, '2022-04-25', 33);
insert into Oder (Oid, Uid, Deliverydate, Did) values (34, 67, '2023-03-07', 34);
insert into Oder (Oid, Uid, Deliverydate, Did) values (35, 66, '2022-03-24', 35);
insert into Oder (Oid, Uid, Deliverydate, Did) values (36, 65, '2023-01-22', 36);
insert into Oder (Oid, Uid, Deliverydate, Did) values (37, 64, '2022-06-04', 37);
insert into Oder (Oid, Uid, Deliverydate, Did) values (38, 63, '2022-06-30', 38);
insert into Oder (Oid, Uid, Deliverydate, Did) values (39, 62, '2023-02-07', 39);
insert into Oder (Oid, Uid, Deliverydate, Did) values (40, 61, '2022-12-30', 40);
insert into Oder (Oid, Uid, Deliverydate, Did) values (41, 60, '2022-11-08', 41);
insert into Oder (Oid, Uid, Deliverydate, Did) values (42, 59, '2022-12-10', 42);
insert into Oder (Oid, Uid, Deliverydate, Did) values (43, 58, '2023-01-11', 43);
insert into Oder (Oid, Uid, Deliverydate, Did) values (44, 57, '2022-08-21', 44);
insert into Oder (Oid, Uid, Deliverydate, Did) values (45, 56, '2022-08-04', 45);
insert into Oder (Oid, Uid, Deliverydate, Did) values (46, 55, '2022-12-06', 46);
insert into Oder (Oid, Uid, Deliverydate, Did) values (47, 54, '2022-10-25', 47);
insert into Oder (Oid, Uid, Deliverydate, Did) values (48, 53, '2022-10-05', 48);
insert into Oder (Oid, Uid, Deliverydate, Did) values (49, 52, '2022-08-06', 49);
insert into Oder (Oid, Uid, Deliverydate, Did) values (50, 51, '2022-03-21', 50);
insert into Oder (Oid, Uid, Deliverydate, Did) values (51, 50, '2022-11-02', 51);
insert into Oder (Oid, Uid, Deliverydate, Did) values (52, 49, '2023-02-13', 52);
insert into Oder (Oid, Uid, Deliverydate, Did) values (53, 48, '2022-10-16', 53);
insert into Oder (Oid, Uid, Deliverydate, Did) values (54, 47, '2022-11-25', 54);
insert into Oder (Oid, Uid, Deliverydate, Did) values (55, 46, '2022-12-20', 55);
insert into Oder (Oid, Uid, Deliverydate, Did) values (56, 45, '2023-01-09', 56);
insert into Oder (Oid, Uid, Deliverydate, Did) values (57, 44, '2022-04-30', 57);
insert into Oder (Oid, Uid, Deliverydate, Did) values (58, 43, '2023-02-18', 58);
insert into Oder (Oid, Uid, Deliverydate, Did) values (59, 42, '2022-08-18', 59);
insert into Oder (Oid, Uid, Deliverydate, Did) values (60, 41, '2022-11-04', 60);
insert into Oder (Oid, Uid, Deliverydate, Did) values (61, 40, '2022-03-27', 61);
insert into Oder (Oid, Uid, Deliverydate, Did) values (62, 39, '2022-03-29', 62);
insert into Oder (Oid, Uid, Deliverydate, Did) values (63, 38, '2023-03-02', 63);
insert into Oder (Oid, Uid, Deliverydate, Did) values (64, 37, '2022-07-19', 64);
insert into Oder (Oid, Uid, Deliverydate, Did) values (65, 36, '2022-12-05', 65);
insert into Oder (Oid, Uid, Deliverydate, Did) values (66, 35, '2022-08-05', 66);
insert into Oder (Oid, Uid, Deliverydate, Did) values (67, 34, '2023-02-12', 67);
insert into Oder (Oid, Uid, Deliverydate, Did) values (68, 33, '2022-07-17', 68);
insert into Oder (Oid, Uid, Deliverydate, Did) values (69, 32, '2022-07-18', 69);
insert into Oder (Oid, Uid, Deliverydate, Did) values (70, 31, '2023-02-24', 70);
insert into Oder (Oid, Uid, Deliverydate, Did) values (71, 30, '2022-05-06', 71);
insert into Oder (Oid, Uid, Deliverydate, Did) values (72, 29, '2022-09-15', 72);
insert into Oder (Oid, Uid, Deliverydate, Did) values (73, 28, '2022-04-20', 73);
insert into Oder (Oid, Uid, Deliverydate, Did) values (74, 27, '2022-04-09', 74);
insert into Oder (Oid, Uid, Deliverydate, Did) values (75, 26, '2023-01-21', 75);
insert into Oder (Oid, Uid, Deliverydate, Did) values (76, 25, '2022-10-30', 76);
insert into Oder (Oid, Uid, Deliverydate, Did) values (77, 24, '2022-12-13', 77);
insert into Oder (Oid, Uid, Deliverydate, Did) values (78, 23, '2022-09-21', 78);
insert into Oder (Oid, Uid, Deliverydate, Did) values (79, 22, '2022-05-19', 79);
insert into Oder (Oid, Uid, Deliverydate, Did) values (80, 21, '2022-09-19', 80);
insert into Oder (Oid, Uid, Deliverydate, Did) values (81, 20, '2022-08-19', 81);
insert into Oder (Oid, Uid, Deliverydate, Did) values (82, 19, '2022-11-28', 82);
insert into Oder (Oid, Uid, Deliverydate, Did) values (83, 18, '2022-10-09', 83);
insert into Oder (Oid, Uid, Deliverydate, Did) values (84, 17, '2022-10-18', 84);
insert into Oder (Oid, Uid, Deliverydate, Did) values (85, 16, '2022-06-12', 85);
insert into Oder (Oid, Uid, Deliverydate, Did) values (86, 15, '2022-03-23', 86);
insert into Oder (Oid, Uid, Deliverydate, Did) values (87, 14, '2022-10-05', 87);
insert into Oder (Oid, Uid, Deliverydate, Did) values (88, 13, '2023-01-16', 88);
insert into Oder (Oid, Uid, Deliverydate, Did) values (89, 12, '2022-03-31', 89);
insert into Oder (Oid, Uid, Deliverydate, Did) values (90, 11, '2022-09-04', 90);
insert into Oder (Oid, Uid, Deliverydate, Did) values (91, 10, '2022-04-26', 91);
insert into Oder (Oid, Uid, Deliverydate, Did) values (92, 9, '2023-01-20', 92);
insert into Oder (Oid, Uid, Deliverydate, Did) values (93, 8, '2022-11-27', 93);
insert into Oder (Oid, Uid, Deliverydate, Did) values (94, 7, '2022-05-01', 94);
insert into Oder (Oid, Uid, Deliverydate, Did) values (95, 6, '2022-05-28', 95);
insert into Oder (Oid, Uid, Deliverydate, Did) values (96, 5, '2022-09-01', 96);
insert into Oder (Oid, Uid, Deliverydate, Did) values (97, 4, '2022-10-25', 97);
insert into Oder (Oid, Uid, Deliverydate, Did) values (98, 3, '2022-04-13', 98);
insert into Oder (Oid, Uid, Deliverydate, Did) values (99, 2, '2022-11-19', 99);
insert into Oder (Oid, Uid, Deliverydate, Did) values (100, 1, '2023-01-31', 100);

select * from Oder;

-- delimiter //
-- CREATE TRIGGER my
-- before insert ON Payment 
-- FOR EACH ROW

-- 	if New.PaymentStatus = "SUCCESSFUL" then set New.Pamount =0;	
-- 	end if; //







insert into Cart (Cid, Uid) values (1,  1);
insert into Cart (Cid, Uid) values (2,  2);
insert into Cart (Cid, Uid) values (3,  3);
insert into Cart (Cid, Uid) values (4,  4);
insert into Cart (Cid, Uid) values (5,  5);
insert into Cart (Cid, Uid) values (6,  6);
insert into Cart (Cid, Uid) values (7,  7);
insert into Cart (Cid, Uid) values (8,  8);
insert into Cart (Cid, Uid) values (9,  9);
insert into Cart (Cid, Uid) values (10,  10);
insert into Cart (Cid, Uid) values (11,  11);
insert into Cart (Cid, Uid) values (12,  12);
insert into Cart (Cid, Uid) values (13,  13);
insert into Cart (Cid, Uid) values (14,  14);
insert into Cart (Cid, Uid) values (15,  15);
insert into Cart (Cid, Uid) values (16,  16);
insert into Cart (Cid, Uid) values (17,  17);
insert into Cart (Cid, Uid) values (18,  18);
insert into Cart (Cid, Uid) values (19,  19);
insert into Cart (Cid, Uid) values (20,  20);
insert into Cart (Cid, Uid) values (21,  21);
insert into Cart (Cid, Uid) values (22,  22);
insert into Cart (Cid, Uid) values (23,  23);
insert into Cart (Cid, Uid) values (24,  24);
insert into Cart (Cid, Uid) values (25,  25);
insert into Cart (Cid, Uid) values (26,  26);
insert into Cart (Cid, Uid) values (27,  27);
insert into Cart (Cid, Uid) values (28,  28);
insert into Cart (Cid, Uid) values (29,  29);
insert into Cart (Cid, Uid) values (30,  30);
insert into Cart (Cid, Uid) values (31,  31);
insert into Cart (Cid, Uid) values (32,  32);
insert into Cart (Cid, Uid) values (33,  33);
insert into Cart (Cid, Uid) values (34,  34);
insert into Cart (Cid, Uid) values (35,  35);
insert into Cart (Cid, Uid) values (36,  36);
insert into Cart (Cid, Uid) values (37,  37);
insert into Cart (Cid, Uid) values (38,  38);
insert into Cart (Cid, Uid) values (39,  39);
insert into Cart (Cid, Uid) values (40,  40);
insert into Cart (Cid, Uid) values (41,  41);
insert into Cart (Cid, Uid) values (42,  42);
insert into Cart (Cid, Uid) values (43,  43);
insert into Cart (Cid, Uid) values (44,  44);
insert into Cart (Cid, Uid) values (45,  45);
insert into Cart (Cid, Uid) values (46,  46);
insert into Cart (Cid, Uid) values (47,  47);
insert into Cart (Cid, Uid) values (48,  48);
insert into Cart (Cid, Uid) values (49,  49);
insert into Cart (Cid, Uid) values (50,  50);
insert into Cart (Cid, Uid) values (51,  51);
insert into Cart (Cid, Uid) values (52,  52);
insert into Cart (Cid, Uid) values (53,  53);
insert into Cart (Cid, Uid) values (54,  54);
insert into Cart (Cid, Uid) values (55,  55);
insert into Cart (Cid, Uid) values (56,  56);
insert into Cart (Cid, Uid) values (57,  57);
insert into Cart (Cid, Uid) values (58,  58);
insert into Cart (Cid, Uid) values (59,  59);
insert into Cart (Cid, Uid) values (60,  60);
insert into Cart (Cid, Uid) values (61,  61);
insert into Cart (Cid, Uid) values (62,  62);
insert into Cart (Cid, Uid) values (63,  63);
insert into Cart (Cid, Uid) values (64,  64);
insert into Cart (Cid, Uid) values (65,  65);
insert into Cart (Cid, Uid) values (66,  66);
insert into Cart (Cid, Uid) values (67,  67);
insert into Cart (Cid, Uid) values (68,  68);
insert into Cart (Cid, Uid) values (69,  69);
insert into Cart (Cid, Uid) values (70,  70);
insert into Cart (Cid, Uid) values (71,  71);
insert into Cart (Cid, Uid) values (72,  72);
insert into Cart (Cid, Uid) values (73,  73);
insert into Cart (Cid, Uid) values (74,  74);
insert into Cart (Cid, Uid) values (75,  75);
insert into Cart (Cid, Uid) values (76,  76);
insert into Cart (Cid, Uid) values (77,  77);
insert into Cart (Cid, Uid) values (78,  78);
insert into Cart (Cid, Uid) values (79,  79);
insert into Cart (Cid, Uid) values (80,  80);
insert into Cart (Cid, Uid) values (81,  81);
insert into Cart (Cid, Uid) values (82,  82);
insert into Cart (Cid, Uid) values (83,  83);
insert into Cart (Cid, Uid) values (84,  84);
insert into Cart (Cid, Uid) values (85,  85);
insert into Cart (Cid, Uid) values (86,  86);
insert into Cart (Cid, Uid) values (87,  87);
insert into Cart (Cid, Uid) values (88,  88);
insert into Cart (Cid, Uid) values (89,  89);
insert into Cart (Cid, Uid) values (90,  90);
insert into Cart (Cid, Uid) values (91,  91);
insert into Cart (Cid, Uid) values (92,  92);
insert into Cart (Cid, Uid) values (93,  93);
insert into Cart (Cid, Uid) values (94,  94);
insert into Cart (Cid, Uid) values (95,  95);
insert into Cart (Cid, Uid) values (96,  96);
insert into Cart (Cid, Uid) values (97,  97);
insert into Cart (Cid, Uid) values (98,  98);
insert into Cart (Cid, Uid) values (99,  99);
insert into Cart (Cid, Uid) values (100, 100);


select * from Cart;


-- Trigger 1

DELIMITER //
CREATE TRIGGER update_Pamunt
before INSERT ON PrUnit
FOR EACH ROW
BEGIN
	DECLARE val,pr INT;
	SELECT Prprice INTO val FROM Product WHERE Prid = NEW.Prid;
    
	SELECT Pamount INTO pr FROM Payment WHERE Uidd = NEW.Cid;

    
    
	
	update Payment,Product,PrUnit set Payment.Pamount= pr + (val * New.unit) where  Payment.Uidd =New.Cid; 


	END //
DELIMITER ;

-- select * from Payment;
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (1, 'NET BANKING', '2022-09-15', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (2, 'NET BANKING', '2023-02-08', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (3, 'NET BANKING', '2022-08-15', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (4, 'NET BANKING', '2023-03-12', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (5, 'CREDIT CARD', '2022-07-26', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (6, 'COD', '2022-11-22', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (7, 'COD', '2022-11-15', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (8, 'DEBIT CARD', '2022-06-16', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (9, 'COD', '2023-01-23', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (10, 'CREDIT CARD', '2022-07-25', 'UNSUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (11, 'CREDIT CARD', '2022-05-07', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (12, 'NET BANKING', '2022-11-12', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (13, 'DEBIT CARD', '2022-05-27', 'UNSUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (14, 'COD', '2023-01-23', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (15, 'CREDIT CARD', '2022-10-18', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (16, 'DEBIT CARD', '2022-12-04', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (17, 'DEBIT CARD', '2023-03-03', 'UNSUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (18, 'CREDIT CARD', '2023-01-01', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (19, 'DEBIT CARD', '2022-09-05', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (20, 'CREDIT CARD', '2022-11-30', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (21, 'DEBIT CARD', '2022-11-17', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (22, 'CREDIT CARD', '2022-07-29', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (23, 'DEBIT CARD', '2022-07-11', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (24, 'NET BANKING', '2023-03-06', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (25, 'DEBIT CARD', '2023-01-19', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (26, 'NET BANKING', '2023-01-19', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (27, 'NET BANKING', '2022-06-17', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (28, 'DEBIT CARD', '2022-10-06', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (29, 'COD', '2022-06-01', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (30, 'CREDIT CARD', '2022-05-18', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (34, 'COD', '2022-05-13', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (35, 'DEBIT CARD', '2022-12-11', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (36, 'COD', '2023-02-01', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (37, 'COD', '2022-06-05', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (38, 'COD', '2022-04-20', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (39, 'COD', '2022-12-10', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (40, 'CREDIT CARD', '2022-12-27', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (41, 'CREDIT CARD', '2022-05-16', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (42, 'NET BANKING', '2023-03-10', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (43, 'COD', '2023-03-11', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (44, 'NET BANKING', '2023-01-26', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (45, 'DEBIT CARD', '2023-01-16', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (46, 'CREDIT CARD', '2022-10-25', 'UNSUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (47, 'CREDIT CARD', '2022-06-05', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (48, 'COD', '2023-02-01', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (49, 'COD', '2022-04-26', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (50, 'NET BANKING', '2022-05-11', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (51, 'CREDIT CARD', '2022-06-17', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (52, 'CREDIT CARD', '2022-09-24', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (53, 'NET BANKING', '2022-11-16', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (54, 'DEBIT CARD', '2022-10-23', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (55, 'NET BANKING', '2023-01-29', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (56, 'CREDIT CARD', '2022-08-20', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (57, 'CREDIT CARD', '2022-08-05', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (58, 'CREDIT CARD', '2022-03-31', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (59, 'DEBIT CARD', '2022-05-24', 'UNSUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (60, 'CREDIT CARD', '2022-03-22', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (61, 'CREDIT CARD', '2022-10-05', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (62, 'COD', '2023-03-17', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (63, 'DEBIT CARD', '2022-04-13', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (64, 'NET BANKING', '2022-03-24', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (65, 'COD', '2022-12-15', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (66, 'DEBIT CARD', '2023-02-04', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (67, 'CREDIT CARD', '2022-05-14', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (68, 'DEBIT CARD', '2023-02-10', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (69, 'COD', '2022-11-07', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (70, 'DEBIT CARD', '2022-06-23', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (71, 'DEBIT CARD', '2023-01-23', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (72, 'DEBIT CARD', '2022-11-25', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (73, 'COD', '2022-09-21', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (74, 'COD', '2023-01-08', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (75, 'DEBIT CARD', '2023-02-11', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (76, 'COD', '2022-08-03', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (77, 'COD', '2023-02-23', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (78, 'CREDIT CARD', '2022-04-04', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (79, 'COD', '2023-01-14', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (80, 'NET BANKING', '2022-08-28', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (81, 'NET BANKING', '2022-11-05', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (82, 'DEBIT CARD', '2022-10-13', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (83, 'NET BANKING', '2022-05-31', 'UNSUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (84, 'NET BANKING', '2022-09-01', 'UNSUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (85, 'CREDIT CARD', '2022-09-06', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (86, 'COD', '2023-02-17', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (87, 'DEBIT CARD', '2022-11-21', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (88, 'NET BANKING', '2022-04-21', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (89, 'CREDIT CARD', '2022-07-19', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (90, 'DEBIT CARD', '2022-12-26', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (91, 'COD', '2022-06-16', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (92, 'DEBIT CARD', '2022-06-19', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (93, 'COD', '2022-10-03', 'SUCCESSFUL');

insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (31, 'CREDIT CARD', '2022-12-06', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (32, 'DEBIT CARD', '2022-12-04', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (33, 'NET BANKING', '2022-07-23', 'UNSUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (94, 'NET BANKING', '2022-07-09', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (95, 'NET BANKING', '2023-02-26', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (96, 'CREDIT CARD', '2022-07-07', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (97, 'DEBIT CARD', '2023-01-06', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (98, 'CREDIT CARD', '2022-09-28', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (99, 'NET BANKING', '2022-08-31', 'SUCCESSFUL');
insert into Payment (Pid, Pmethods, Pdate, PaymentStatus) values (100, 'COD', '2022-04-21', 'UNSUCCESSFUL');


-- Trigger 2

DELIMITER //
CREATE TRIGGER statust
before INSERT ON PrUnit
FOR EACH ROW
BEGIN
	DECLARE val INT;
	SELECT Prunits INTO val FROM Product WHERE Prid = NEW.Prid;
    
	IF val - NEW.unit < 0 THEN
		SET NEW.unit = 0 ;

	else
	update Product,PrUnit set Product.Prunits=Product.Prunits- New.unit where  Product.Prid =New.Prid; 
    	END IF ;

    SELECT Prunits INTO val FROM Product WHERE Prid = NEW.Prid;
 
  if val=0 then 
		update Product,PrUnit set Product.Prstatus="Not Available" where  Product.Prid =New.Prid;    
	END IF ;
  
END //
DELIMITER ;
DELIMITER ;

insert into PrUnit (PUid, Prid, unit, Cid) values (1, 75, 4, 72);
insert into PrUnit (PUid, Prid, unit, Cid) values (2, 144, 3, 31);
insert into PrUnit (PUid, Prid, unit, Cid) values (3, 70, 1, 61);
insert into PrUnit (PUid, Prid, unit, Cid) values (4, 29, 3, 67);
insert into PrUnit (PUid, Prid, unit, Cid) values (5, 3, 5, 51);
insert into PrUnit (PUid, Prid, unit, Cid) values (6, 86, 5, 24);
insert into PrUnit (PUid, Prid, unit, Cid) values (7, 130, 3, 18);
insert into PrUnit (PUid, Prid, unit, Cid) values (8, 141, 5, 23);
insert into PrUnit (PUid, Prid, unit, Cid) values (9, 9, 1, 3);
insert into PrUnit (PUid, Prid, unit, Cid) values (10, 27, 3, 51);
insert into PrUnit (PUid, Prid, unit, Cid) values (11, 41, 5, 51);
insert into PrUnit (PUid, Prid, unit, Cid) values (12, 82, 2, 67);
insert into PrUnit (PUid, Prid, unit, Cid) values (13, 83, 1, 22);
insert into PrUnit (PUid, Prid, unit, Cid) values (14, 133, 2, 81);
insert into PrUnit (PUid, Prid, unit, Cid) values (15, 24, 5, 67);
insert into PrUnit (PUid, Prid, unit, Cid) values (16, 67, 1, 6);
insert into PrUnit (PUid, Prid, unit, Cid) values (17, 6, 3, 18);
insert into PrUnit (PUid, Prid, unit, Cid) values (18, 49, 2, 96);
insert into PrUnit (PUid, Prid, unit, Cid) values (19, 51, 5, 90);
insert into PrUnit (PUid, Prid, unit, Cid) values (20, 139, 2, 63);
insert into PrUnit (PUid, Prid, unit, Cid) values (21, 147, 1, 38);
insert into PrUnit (PUid, Prid, unit, Cid) values (22, 43, 2, 40);
insert into PrUnit (PUid, Prid, unit, Cid) values (23, 88, 5, 33);
insert into PrUnit (PUid, Prid, unit, Cid) values (24, 79, 4, 100);
insert into PrUnit (PUid, Prid, unit, Cid) values (25, 139, 3, 38);
insert into PrUnit (PUid, Prid, unit, Cid) values (26, 46, 3, 41);
insert into PrUnit (PUid, Prid, unit, Cid) values (27, 76, 1, 90);
insert into PrUnit (PUid, Prid, unit, Cid) values (28, 94, 5, 76);
insert into PrUnit (PUid, Prid, unit, Cid) values (29, 86, 2, 96);
insert into PrUnit (PUid, Prid, unit, Cid) values (30, 95, 1, 44);
insert into PrUnit (PUid, Prid, unit, Cid) values (31, 142, 4, 32);
insert into PrUnit (PUid, Prid, unit, Cid) values (32, 3, 3, 30);
insert into PrUnit (PUid, Prid, unit, Cid) values (33, 5, 4, 15);
insert into PrUnit (PUid, Prid, unit, Cid) values (34, 92, 4, 64);
insert into PrUnit (PUid, Prid, unit, Cid) values (35, 102, 3, 24);
insert into PrUnit (PUid, Prid, unit, Cid) values (36, 91, 4, 3);
insert into PrUnit (PUid, Prid, unit, Cid) values (37, 55, 5, 56);
insert into PrUnit (PUid, Prid, unit, Cid) values (38, 58, 5, 99);
insert into PrUnit (PUid, Prid, unit, Cid) values (39, 112, 5, 29);
insert into PrUnit (PUid, Prid, unit, Cid) values (40, 113, 3, 5);
insert into PrUnit (PUid, Prid, unit, Cid) values (41, 114, 5, 74);
insert into PrUnit (PUid, Prid, unit, Cid) values (42, 67, 3, 3);
insert into PrUnit (PUid, Prid, unit, Cid) values (43, 101, 5, 54);
insert into PrUnit (PUid, Prid, unit, Cid) values (44, 50, 4, 87);
insert into PrUnit (PUid, Prid, unit, Cid) values (45, 2, 3, 66);
insert into PrUnit (PUid, Prid, unit, Cid) values (46, 34, 3, 16);
insert into PrUnit (PUid, Prid, unit, Cid) values (47, 65, 5, 30);
insert into PrUnit (PUid, Prid, unit, Cid) values (48, 21, 3, 18);
insert into PrUnit (PUid, Prid, unit, Cid) values (49, 11, 1, 76);
insert into PrUnit (PUid, Prid, unit, Cid) values (50, 10, 1, 22);
insert into PrUnit (PUid, Prid, unit, Cid) values (51, 133, 4, 33);
insert into PrUnit (PUid, Prid, unit, Cid) values (52, 6, 1, 39);
insert into PrUnit (PUid, Prid, unit, Cid) values (53, 90, 5, 47);
insert into PrUnit (PUid, Prid, unit, Cid) values (54, 114, 1, 58);
insert into PrUnit (PUid, Prid, unit, Cid) values (55, 120, 4, 2);
insert into PrUnit (PUid, Prid, unit, Cid) values (56, 51, 1, 38);
insert into PrUnit (PUid, Prid, unit, Cid) values (57, 61, 5, 40);
insert into PrUnit (PUid, Prid, unit, Cid) values (58, 31, 5, 36);
insert into PrUnit (PUid, Prid, unit, Cid) values (59, 145, 1, 90);
insert into PrUnit (PUid, Prid, unit, Cid) values (60, 80, 1, 76);
insert into PrUnit (PUid, Prid, unit, Cid) values (61, 19, 5, 63);
insert into PrUnit (PUid, Prid, unit, Cid) values (62, 133, 4, 57);
insert into PrUnit (PUid, Prid, unit, Cid) values (63, 15, 5, 12);
insert into PrUnit (PUid, Prid, unit, Cid) values (64, 146, 2, 79);
insert into PrUnit (PUid, Prid, unit, Cid) values (65, 108, 4, 20);
insert into PrUnit (PUid, Prid, unit, Cid) values (66, 44, 1, 63);
insert into PrUnit (PUid, Prid, unit, Cid) values (67, 32, 1, 16);
insert into PrUnit (PUid, Prid, unit, Cid) values (68, 68, 4, 59);
insert into PrUnit (PUid, Prid, unit, Cid) values (69, 76, 5, 41);
insert into PrUnit (PUid, Prid, unit, Cid) values (70, 101, 4, 92);
insert into PrUnit (PUid, Prid, unit, Cid) values (71, 18, 1, 75);
insert into PrUnit (PUid, Prid, unit, Cid) values (72, 56, 4, 42);
insert into PrUnit (PUid, Prid, unit, Cid) values (73, 73, 3, 1);
insert into PrUnit (PUid, Prid, unit, Cid) values (74, 79, 5, 61);
insert into PrUnit (PUid, Prid, unit, Cid) values (75, 48, 5, 71);
insert into PrUnit (PUid, Prid, unit, Cid) values (76, 120, 4, 32);
insert into PrUnit (PUid, Prid, unit, Cid) values (77, 95, 3, 43);
insert into PrUnit (PUid, Prid, unit, Cid) values (78, 10, 3, 23);
insert into PrUnit (PUid, Prid, unit, Cid) values (79, 83, 4, 57);
insert into PrUnit (PUid, Prid, unit, Cid) values (80, 88, 2, 1);
insert into PrUnit (PUid, Prid, unit, Cid) values (81, 45, 1, 96);
insert into PrUnit (PUid, Prid, unit, Cid) values (82, 100, 2, 20);
insert into PrUnit (PUid, Prid, unit, Cid) values (83, 91, 5, 18);
insert into PrUnit (PUid, Prid, unit, Cid) values (84, 76, 5, 87);
insert into PrUnit (PUid, Prid, unit, Cid) values (85, 78, 4, 20);
insert into PrUnit (PUid, Prid, unit, Cid) values (86, 5, 1, 1);
insert into PrUnit (PUid, Prid, unit, Cid) values (87, 86, 3, 20);
insert into PrUnit (PUid, Prid, unit, Cid) values (88, 65, 3, 59);
insert into PrUnit (PUid, Prid, unit, Cid) values (89, 17, 1, 54);
insert into PrUnit (PUid, Prid, unit, Cid) values (90, 39, 2, 16);
insert into PrUnit (PUid, Prid, unit, Cid) values (91, 76, 4, 69);
insert into PrUnit (PUid, Prid, unit, Cid) values (92, 16, 2, 55);
insert into PrUnit (PUid, Prid, unit, Cid) values (93, 130, 4, 71);
insert into PrUnit (PUid, Prid, unit, Cid) values (94, 90, 2, 28);
insert into PrUnit (PUid, Prid, unit, Cid) values (95, 85, 1, 57);
insert into PrUnit (PUid, Prid, unit, Cid) values (96, 9, 2, 17);
insert into PrUnit (PUid, Prid, unit, Cid) values (97, 49, 4, 2);
insert into PrUnit (PUid, Prid, unit, Cid) values (98, 107, 3, 53);
insert into PrUnit (PUid, Prid, unit, Cid) values (99, 39, 5, 76);
insert into PrUnit (PUid, Prid, unit, Cid) values (100, 63, 1, 55);
insert into PrUnit (PUid, Prid, unit, Cid) values (101, 80, 2, 67);
insert into PrUnit (PUid, Prid, unit, Cid) values (102, 113, 4, 90);
insert into PrUnit (PUid, Prid, unit, Cid) values (103, 146, 1, 35);
insert into PrUnit (PUid, Prid, unit, Cid) values (104, 30, 1, 94);
insert into PrUnit (PUid, Prid, unit, Cid) values (105, 24, 3, 25);
insert into PrUnit (PUid, Prid, unit, Cid) values (106, 25, 1, 58);
insert into PrUnit (PUid, Prid, unit, Cid) values (107, 10, 5, 45);
insert into PrUnit (PUid, Prid, unit, Cid) values (108, 95, 4, 100);
insert into PrUnit (PUid, Prid, unit, Cid) values (109, 44, 5, 95);
insert into PrUnit (PUid, Prid, unit, Cid) values (110, 128, 5, 5);
insert into PrUnit (PUid, Prid, unit, Cid) values (111, 128, 2, 4);
insert into PrUnit (PUid, Prid, unit, Cid) values (112, 34, 1, 78);
insert into PrUnit (PUid, Prid, unit, Cid) values (113, 139, 1, 67);
insert into PrUnit (PUid, Prid, unit, Cid) values (114, 113, 3, 2);
insert into PrUnit (PUid, Prid, unit, Cid) values (115, 17, 5, 95);
insert into PrUnit (PUid, Prid, unit, Cid) values (116, 52, 4, 75);
insert into PrUnit (PUid, Prid, unit, Cid) values (117, 104, 3, 35);
insert into PrUnit (PUid, Prid, unit, Cid) values (118, 45, 5, 78);
insert into PrUnit (PUid, Prid, unit, Cid) values (119, 81, 2, 26);
insert into PrUnit (PUid, Prid, unit, Cid) values (120, 50, 3, 7);
insert into PrUnit (PUid, Prid, unit, Cid) values (121, 60, 4, 1);
insert into PrUnit (PUid, Prid, unit, Cid) values (122, 111, 2, 6);
insert into PrUnit (PUid, Prid, unit, Cid) values (123, 6, 5, 67);
insert into PrUnit (PUid, Prid, unit, Cid) values (124, 69, 4, 5);
insert into PrUnit (PUid, Prid, unit, Cid) values (125, 79, 3, 20);
insert into PrUnit (PUid, Prid, unit, Cid) values (126, 23, 4, 68);
insert into PrUnit (PUid, Prid, unit, Cid) values (127, 107, 3, 69);
insert into PrUnit (PUid, Prid, unit, Cid) values (128, 105, 5, 26);
insert into PrUnit (PUid, Prid, unit, Cid) values (129, 47, 4, 42);
insert into PrUnit (PUid, Prid, unit, Cid) values (130, 33, 3, 44);
insert into PrUnit (PUid, Prid, unit, Cid) values (131, 74, 5, 35);
insert into PrUnit (PUid, Prid, unit, Cid) values (132, 65, 1, 93);
insert into PrUnit (PUid, Prid, unit, Cid) values (133, 104, 1, 17);
insert into PrUnit (PUid, Prid, unit, Cid) values (134, 136, 2, 19);
insert into PrUnit (PUid, Prid, unit, Cid) values (135, 143, 4, 39);
insert into PrUnit (PUid, Prid, unit, Cid) values (136, 93, 2, 1);
insert into PrUnit (PUid, Prid, unit, Cid) values (137, 28, 1, 2);
insert into PrUnit (PUid, Prid, unit, Cid) values (138, 11, 5, 50);
insert into PrUnit (PUid, Prid, unit, Cid) values (139, 117, 3, 70);
insert into PrUnit (PUid, Prid, unit, Cid) values (140, 123, 5, 14);
insert into PrUnit (PUid, Prid, unit, Cid) values (141, 25, 1, 98);
insert into PrUnit (PUid, Prid, unit, Cid) values (142, 11, 3, 66);
insert into PrUnit (PUid, Prid, unit, Cid) values (143, 143, 5, 89);
insert into PrUnit (PUid, Prid, unit, Cid) values (144, 81, 3, 6);
insert into PrUnit (PUid, Prid, unit, Cid) values (145, 97, 4, 61);
insert into PrUnit (PUid, Prid, unit, Cid) values (146, 6, 2, 36);
insert into PrUnit (PUid, Prid, unit, Cid) values (147, 30, 5, 94);
insert into PrUnit (PUid, Prid, unit, Cid) values (148, 135, 2, 76);
insert into PrUnit (PUid, Prid, unit, Cid) values (149, 86, 4, 37);
insert into PrUnit (PUid, Prid, unit, Cid) values (150, 139, 2, 31);
insert into PrUnit (PUid, Prid, unit, Cid) values (151, 90, 5, 74);
insert into PrUnit (PUid, Prid, unit, Cid) values (152, 43, 2, 77);
insert into PrUnit (PUid, Prid, unit, Cid) values (153, 51, 3, 55);
insert into PrUnit (PUid, Prid, unit, Cid) values (154, 72, 4, 11);
insert into PrUnit (PUid, Prid, unit, Cid) values (155, 30, 4, 30);
insert into PrUnit (PUid, Prid, unit, Cid) values (156, 47, 5, 61);
insert into PrUnit (PUid, Prid, unit, Cid) values (157, 23, 4, 54);
insert into PrUnit (PUid, Prid, unit, Cid) values (158, 42, 5, 23);
insert into PrUnit (PUid, Prid, unit, Cid) values (159, 95, 3, 31);
insert into PrUnit (PUid, Prid, unit, Cid) values (160, 26, 5, 78);
insert into PrUnit (PUid, Prid, unit, Cid) values (161, 66, 4, 50);
insert into PrUnit (PUid, Prid, unit, Cid) values (162, 146, 5, 5);
insert into PrUnit (PUid, Prid, unit, Cid) values (163, 53, 4, 64);
insert into PrUnit (PUid, Prid, unit, Cid) values (164, 115, 5, 67);
insert into PrUnit (PUid, Prid, unit, Cid) values (165, 146, 2, 6);
insert into PrUnit (PUid, Prid, unit, Cid) values (166, 5, 3, 87);
insert into PrUnit (PUid, Prid, unit, Cid) values (167, 105, 3, 60);
insert into PrUnit (PUid, Prid, unit, Cid) values (168, 52, 4, 47);
insert into PrUnit (PUid, Prid, unit, Cid) values (169, 7, 3, 79);
insert into PrUnit (PUid, Prid, unit, Cid) values (170, 48, 1, 56);
insert into PrUnit (PUid, Prid, unit, Cid) values (171, 71, 2, 62);
insert into PrUnit (PUid, Prid, unit, Cid) values (172, 43, 3, 28);
insert into PrUnit (PUid, Prid, unit, Cid) values (173, 80, 5, 3);
insert into PrUnit (PUid, Prid, unit, Cid) values (174, 6, 2, 2);
insert into PrUnit (PUid, Prid, unit, Cid) values (175, 2, 2, 46);
insert into PrUnit (PUid, Prid, unit, Cid) values (176, 94, 5, 64);
insert into PrUnit (PUid, Prid, unit, Cid) values (177, 6, 4, 22);
insert into PrUnit (PUid, Prid, unit, Cid) values (178, 120, 5, 61);
insert into PrUnit (PUid, Prid, unit, Cid) values (179, 137, 2, 3);
insert into PrUnit (PUid, Prid, unit, Cid) values (180, 79, 3, 92);
insert into PrUnit (PUid, Prid, unit, Cid) values (181, 13, 5, 35);
insert into PrUnit (PUid, Prid, unit, Cid) values (182, 46, 2, 65);
insert into PrUnit (PUid, Prid, unit, Cid) values (183, 95, 2, 62);
insert into PrUnit (PUid, Prid, unit, Cid) values (184, 60, 1, 37);
insert into PrUnit (PUid, Prid, unit, Cid) values (185, 31, 4, 38);
insert into PrUnit (PUid, Prid, unit, Cid) values (186, 130, 5, 5);
insert into PrUnit (PUid, Prid, unit, Cid) values (187, 38, 3, 69);
insert into PrUnit (PUid, Prid, unit, Cid) values (188, 143, 2, 5);
insert into PrUnit (PUid, Prid, unit, Cid) values (189, 25, 4, 23);
insert into PrUnit (PUid, Prid, unit, Cid) values (190, 54, 5, 61);
insert into PrUnit (PUid, Prid, unit, Cid) values (191, 40, 5, 21);
insert into PrUnit (PUid, Prid, unit, Cid) values (192, 147, 5, 92);
insert into PrUnit (PUid, Prid, unit, Cid) values (193, 24, 3, 78);
insert into PrUnit (PUid, Prid, unit, Cid) values (194, 26, 4, 61);
insert into PrUnit (PUid, Prid, unit, Cid) values (195, 103, 2, 54);
insert into PrUnit (PUid, Prid, unit, Cid) values (196, 118, 4, 73);
insert into PrUnit (PUid, Prid, unit, Cid) values (197, 128, 2, 3);
insert into PrUnit (PUid, Prid, unit, Cid) values (198, 91, 2, 95);
insert into PrUnit (PUid, Prid, unit, Cid) values (199, 90, 2, 81);
insert into PrUnit (PUid, Prid, unit, Cid) values (200, 46, 4, 41);
insert into PrUnit (PUid, Prid, unit, Cid) values (201, 10, 1, 59);
insert into PrUnit (PUid, Prid, unit, Cid) values (202, 8, 3, 56);
insert into PrUnit (PUid, Prid, unit, Cid) values (203, 56, 4, 100);
insert into PrUnit (PUid, Prid, unit, Cid) values (204, 28, 4, 4);
insert into PrUnit (PUid, Prid, unit, Cid) values (205, 34, 5, 60);
insert into PrUnit (PUid, Prid, unit, Cid) values (206, 70, 4, 12);
insert into PrUnit (PUid, Prid, unit, Cid) values (207, 20, 2, 42);
insert into PrUnit (PUid, Prid, unit, Cid) values (208, 127, 1, 13);
insert into PrUnit (PUid, Prid, unit, Cid) values (209, 64, 2, 68);
insert into PrUnit (PUid, Prid, unit, Cid) values (210, 149, 1, 39);
insert into PrUnit (PUid, Prid, unit, Cid) values (211, 78, 4, 47);
insert into PrUnit (PUid, Prid, unit, Cid) values (212, 18, 5, 80);
insert into PrUnit (PUid, Prid, unit, Cid) values (213, 114, 2, 60);
insert into PrUnit (PUid, Prid, unit, Cid) values (214, 41, 4, 47);
insert into PrUnit (PUid, Prid, unit, Cid) values (215, 73, 5, 85);
insert into PrUnit (PUid, Prid, unit, Cid) values (216, 1, 3, 25);
insert into PrUnit (PUid, Prid, unit, Cid) values (217, 147, 2, 60);
insert into PrUnit (PUid, Prid, unit, Cid) values (218, 144, 3, 14);
insert into PrUnit (PUid, Prid, unit, Cid) values (219, 101, 3, 82);
insert into PrUnit (PUid, Prid, unit, Cid) values (220, 140, 2, 97);
insert into PrUnit (PUid, Prid, unit, Cid) values (221, 40, 5, 47);
insert into PrUnit (PUid, Prid, unit, Cid) values (222, 10, 5, 14);
insert into PrUnit (PUid, Prid, unit, Cid) values (223, 3, 2, 11);
insert into PrUnit (PUid, Prid, unit, Cid) values (224, 3, 5, 92);
insert into PrUnit (PUid, Prid, unit, Cid) values (225, 91, 3, 25);
insert into PrUnit (PUid, Prid, unit, Cid) values (226, 89, 3, 91);
insert into PrUnit (PUid, Prid, unit, Cid) values (227, 7, 1, 54);
insert into PrUnit (PUid, Prid, unit, Cid) values (228, 88, 4, 83);
insert into PrUnit (PUid, Prid, unit, Cid) values (229, 61, 4, 90);
insert into PrUnit (PUid, Prid, unit, Cid) values (230, 48, 4, 3);
insert into PrUnit (PUid, Prid, unit, Cid) values (231, 126, 1, 17);
insert into PrUnit (PUid, Prid, unit, Cid) values (232, 91, 4, 51);
insert into PrUnit (PUid, Prid, unit, Cid) values (233, 81, 3, 45);
insert into PrUnit (PUid, Prid, unit, Cid) values (234, 102, 4, 93);
insert into PrUnit (PUid, Prid, unit, Cid) values (235, 39, 5, 63);
insert into PrUnit (PUid, Prid, unit, Cid) values (236, 21, 3, 58);
insert into PrUnit (PUid, Prid, unit, Cid) values (237, 41, 4, 89);
insert into PrUnit (PUid, Prid, unit, Cid) values (238, 110, 1, 71);
insert into PrUnit (PUid, Prid, unit, Cid) values (239, 105, 5, 4);
insert into PrUnit (PUid, Prid, unit, Cid) values (240, 29, 3, 76);
insert into PrUnit (PUid, Prid, unit, Cid) values (241, 112, 2, 69);
insert into PrUnit (PUid, Prid, unit, Cid) values (242, 6, 1, 4);
insert into PrUnit (PUid, Prid, unit, Cid) values (243, 146, 4, 40);
insert into PrUnit (PUid, Prid, unit, Cid) values (244, 142, 4, 75);
insert into PrUnit (PUid, Prid, unit, Cid) values (245, 125, 5, 27);
insert into PrUnit (PUid, Prid, unit, Cid) values (246, 4, 3, 50);
insert into PrUnit (PUid, Prid, unit, Cid) values (247, 5, 2, 13);
insert into PrUnit (PUid, Prid, unit, Cid) values (248, 28, 1, 63);
insert into PrUnit (PUid, Prid, unit, Cid) values (249, 132, 4, 85);
insert into PrUnit (PUid, Prid, unit, Cid) values (250, 8, 4, 28);
insert into PrUnit (PUid, Prid, unit, Cid) values (251, 80, 3, 67);
insert into PrUnit (PUid, Prid, unit, Cid) values (252, 120, 1, 41);
insert into PrUnit (PUid, Prid, unit, Cid) values (253, 107, 3, 84);
insert into PrUnit (PUid, Prid, unit, Cid) values (254, 22, 5, 32);
insert into PrUnit (PUid, Prid, unit, Cid) values (255, 142, 4, 96);
insert into PrUnit (PUid, Prid, unit, Cid) values (256, 146, 2, 55);
insert into PrUnit (PUid, Prid, unit, Cid) values (257, 140, 3, 33);
insert into PrUnit (PUid, Prid, unit, Cid) values (258, 113, 5, 87);
insert into PrUnit (PUid, Prid, unit, Cid) values (259, 40, 2, 85);
insert into PrUnit (PUid, Prid, unit, Cid) values (260, 138, 2, 79);
insert into PrUnit (PUid, Prid, unit, Cid) values (261, 118, 5, 87);
insert into PrUnit (PUid, Prid, unit, Cid) values (262, 77, 4, 55);
insert into PrUnit (PUid, Prid, unit, Cid) values (263, 134, 5, 78);
insert into PrUnit (PUid, Prid, unit, Cid) values (264, 97, 4, 11);
insert into PrUnit (PUid, Prid, unit, Cid) values (265, 12, 1, 57);
insert into PrUnit (PUid, Prid, unit, Cid) values (266, 84, 3, 66);
insert into PrUnit (PUid, Prid, unit, Cid) values (267, 145, 2, 91);
insert into PrUnit (PUid, Prid, unit, Cid) values (268, 143, 2, 79);
insert into PrUnit (PUid, Prid, unit, Cid) values (269, 34, 3, 7);
insert into PrUnit (PUid, Prid, unit, Cid) values (270, 17, 5, 80);
insert into PrUnit (PUid, Prid, unit, Cid) values (271, 50, 5, 50);
insert into PrUnit (PUid, Prid, unit, Cid) values (272, 117, 4, 57);
insert into PrUnit (PUid, Prid, unit, Cid) values (273, 95, 4, 19);
insert into PrUnit (PUid, Prid, unit, Cid) values (274, 122, 1, 51);
insert into PrUnit (PUid, Prid, unit, Cid) values (275, 34, 5, 50);
insert into PrUnit (PUid, Prid, unit, Cid) values (276, 114, 2, 56);
insert into PrUnit (PUid, Prid, unit, Cid) values (277, 76, 4, 48);
insert into PrUnit (PUid, Prid, unit, Cid) values (278, 3, 2, 12);
insert into PrUnit (PUid, Prid, unit, Cid) values (279, 25, 1, 69);
insert into PrUnit (PUid, Prid, unit, Cid) values (280, 40, 5, 17);
insert into PrUnit (PUid, Prid, unit, Cid) values (281, 60, 4, 51);
insert into PrUnit (PUid, Prid, unit, Cid) values (282, 144, 1, 14);
insert into PrUnit (PUid, Prid, unit, Cid) values (283, 82, 5, 79);
insert into PrUnit (PUid, Prid, unit, Cid) values (284, 142, 3, 9);
insert into PrUnit (PUid, Prid, unit, Cid) values (285, 61, 1, 82);
insert into PrUnit (PUid, Prid, unit, Cid) values (286, 108, 2, 63);
insert into PrUnit (PUid, Prid, unit, Cid) values (287, 18, 4, 2);
insert into PrUnit (PUid, Prid, unit, Cid) values (288, 68, 3, 52);
insert into PrUnit (PUid, Prid, unit, Cid) values (289, 48, 5, 76);
insert into PrUnit (PUid, Prid, unit, Cid) values (290, 118, 3, 29);
insert into PrUnit (PUid, Prid, unit, Cid) values (291, 85, 5, 36);
insert into PrUnit (PUid, Prid, unit, Cid) values (292, 137, 3, 19);
insert into PrUnit (PUid, Prid, unit, Cid) values (293, 128, 1, 25);
insert into PrUnit (PUid, Prid, unit, Cid) values (294, 82, 5, 71);
insert into PrUnit (PUid, Prid, unit, Cid) values (295, 11, 5, 69);
insert into PrUnit (PUid, Prid, unit, Cid) values (296, 44, 1, 2);
insert into PrUnit (PUid, Prid, unit, Cid) values (297, 142, 1, 80);
insert into PrUnit (PUid, Prid, unit, Cid) values (298, 70, 4, 54);
insert into PrUnit (PUid, Prid, unit, Cid) values (299, 100, 3, 89);
insert into PrUnit (PUid, Prid, unit, Cid) values (300, 8, 3, 76);
insert into PrUnit (PUid, Prid, unit, Cid) values (301, 70, 2, 84);
insert into PrUnit (PUid, Prid, unit, Cid) values (302, 146, 5, 80);
insert into PrUnit (PUid, Prid, unit, Cid) values (303, 23, 4, 4);
insert into PrUnit (PUid, Prid, unit, Cid) values (304, 15, 2, 8);
insert into PrUnit (PUid, Prid, unit, Cid) values (305, 92, 2, 23);
insert into PrUnit (PUid, Prid, unit, Cid) values (306, 24, 4, 83);
insert into PrUnit (PUid, Prid, unit, Cid) values (307, 22, 3, 88);
insert into PrUnit (PUid, Prid, unit, Cid) values (308, 4, 2, 73);
insert into PrUnit (PUid, Prid, unit, Cid) values (309, 79, 2, 67);
insert into PrUnit (PUid, Prid, unit, Cid) values (310, 9, 1, 73);
insert into PrUnit (PUid, Prid, unit, Cid) values (311, 149, 3, 56);
insert into PrUnit (PUid, Prid, unit, Cid) values (312, 106, 1, 18);
insert into PrUnit (PUid, Prid, unit, Cid) values (313, 56, 1, 66);
insert into PrUnit (PUid, Prid, unit, Cid) values (314, 28, 3, 93);
insert into PrUnit (PUid, Prid, unit, Cid) values (315, 82, 1, 83);
insert into PrUnit (PUid, Prid, unit, Cid) values (316, 8, 1, 94);
insert into PrUnit (PUid, Prid, unit, Cid) values (317, 39, 5, 14);
insert into PrUnit (PUid, Prid, unit, Cid) values (318, 70, 3, 97);
insert into PrUnit (PUid, Prid, unit, Cid) values (319, 5, 3, 75);
insert into PrUnit (PUid, Prid, unit, Cid) values (320, 101, 4, 31);
insert into PrUnit (PUid, Prid, unit, Cid) values (321, 39, 3, 22);
insert into PrUnit (PUid, Prid, unit, Cid) values (322, 85, 3, 45);
insert into PrUnit (PUid, Prid, unit, Cid) values (323, 133, 3, 72);
insert into PrUnit (PUid, Prid, unit, Cid) values (324, 44, 4, 13);
insert into PrUnit (PUid, Prid, unit, Cid) values (325, 84, 5, 35);
insert into PrUnit (PUid, Prid, unit, Cid) values (326, 17, 3, 40);
insert into PrUnit (PUid, Prid, unit, Cid) values (327, 126, 4, 61);
insert into PrUnit (PUid, Prid, unit, Cid) values (328, 79, 4, 57);
insert into PrUnit (PUid, Prid, unit, Cid) values (329, 110, 3, 78);
insert into PrUnit (PUid, Prid, unit, Cid) values (330, 12, 5, 40);
insert into PrUnit (PUid, Prid, unit, Cid) values (331, 25, 4, 4);
insert into PrUnit (PUid, Prid, unit, Cid) values (332, 45, 4, 100);
insert into PrUnit (PUid, Prid, unit, Cid) values (333, 97, 3, 31);
insert into PrUnit (PUid, Prid, unit, Cid) values (334, 116, 4, 35);
insert into PrUnit (PUid, Prid, unit, Cid) values (335, 22, 2, 44);
insert into PrUnit (PUid, Prid, unit, Cid) values (336, 139, 4, 31);
insert into PrUnit (PUid, Prid, unit, Cid) values (337, 144, 5, 65);
insert into PrUnit (PUid, Prid, unit, Cid) values (338, 109, 4, 5);
insert into PrUnit (PUid, Prid, unit, Cid) values (339, 91, 1, 47);
insert into PrUnit (PUid, Prid, unit, Cid) values (340, 16, 2, 3);
insert into PrUnit (PUid, Prid, unit, Cid) values (341, 71, 4, 44);
insert into PrUnit (PUid, Prid, unit, Cid) values (342, 71, 2, 18);
insert into PrUnit (PUid, Prid, unit, Cid) values (343, 90, 5, 31);
insert into PrUnit (PUid, Prid, unit, Cid) values (344, 112, 2, 25);
insert into PrUnit (PUid, Prid, unit, Cid) values (345, 51, 2, 85);
insert into PrUnit (PUid, Prid, unit, Cid) values (346, 68, 2, 55);
insert into PrUnit (PUid, Prid, unit, Cid) values (347, 2, 1, 97);
insert into PrUnit (PUid, Prid, unit, Cid) values (348, 110, 4, 13);
insert into PrUnit (PUid, Prid, unit, Cid) values (349, 121, 4, 46);
insert into PrUnit (PUid, Prid, unit, Cid) values (350, 102, 1, 23);
insert into PrUnit (PUid, Prid, unit, Cid) values (351, 41, 4, 18);
insert into PrUnit (PUid, Prid, unit, Cid) values (352, 128, 1, 28);
insert into PrUnit (PUid, Prid, unit, Cid) values (353, 20, 4, 56);
insert into PrUnit (PUid, Prid, unit, Cid) values (354, 106, 1, 35);
insert into PrUnit (PUid, Prid, unit, Cid) values (355, 47, 2, 47);
insert into PrUnit (PUid, Prid, unit, Cid) values (356, 57, 5, 25);
insert into PrUnit (PUid, Prid, unit, Cid) values (357, 120, 5, 2);
insert into PrUnit (PUid, Prid, unit, Cid) values (358, 31, 1, 79);
insert into PrUnit (PUid, Prid, unit, Cid) values (359, 24, 2, 52);
insert into PrUnit (PUid, Prid, unit, Cid) values (360, 78, 4, 44);
insert into PrUnit (PUid, Prid, unit, Cid) values (361, 134, 1, 63);
insert into PrUnit (PUid, Prid, unit, Cid) values (362, 150, 2, 35);
insert into PrUnit (PUid, Prid, unit, Cid) values (363, 32, 1, 73);
insert into PrUnit (PUid, Prid, unit, Cid) values (364, 47, 4, 94);
insert into PrUnit (PUid, Prid, unit, Cid) values (365, 114, 2, 22);
insert into PrUnit (PUid, Prid, unit, Cid) values (366, 59, 5, 32);
insert into PrUnit (PUid, Prid, unit, Cid) values (367, 6, 1, 33);
insert into PrUnit (PUid, Prid, unit, Cid) values (368, 5, 4, 84);
insert into PrUnit (PUid, Prid, unit, Cid) values (369, 88, 5, 68);
insert into PrUnit (PUid, Prid, unit, Cid) values (370, 25, 1, 80);
insert into PrUnit (PUid, Prid, unit, Cid) values (371, 55, 2, 93);
insert into PrUnit (PUid, Prid, unit, Cid) values (372, 149, 5, 68);
insert into PrUnit (PUid, Prid, unit, Cid) values (373, 75, 2, 89);
insert into PrUnit (PUid, Prid, unit, Cid) values (374, 84, 3, 14);
insert into PrUnit (PUid, Prid, unit, Cid) values (375, 19, 3, 77);
insert into PrUnit (PUid, Prid, unit, Cid) values (376, 124, 5, 52);
insert into PrUnit (PUid, Prid, unit, Cid) values (377, 130, 4, 5);
insert into PrUnit (PUid, Prid, unit, Cid) values (378, 140, 1, 26);
insert into PrUnit (PUid, Prid, unit, Cid) values (379, 6, 1, 24);
insert into PrUnit (PUid, Prid, unit, Cid) values (380, 77, 5, 66);
insert into PrUnit (PUid, Prid, unit, Cid) values (381, 139, 1, 15);
insert into PrUnit (PUid, Prid, unit, Cid) values (382, 67, 2, 96);
insert into PrUnit (PUid, Prid, unit, Cid) values (383, 132, 5, 69);
insert into PrUnit (PUid, Prid, unit, Cid) values (384, 17, 3, 4);
insert into PrUnit (PUid, Prid, unit, Cid) values (385, 45, 1, 42);
insert into PrUnit (PUid, Prid, unit, Cid) values (386, 51, 4, 56);
insert into PrUnit (PUid, Prid, unit, Cid) values (387, 98, 2, 64);
insert into PrUnit (PUid, Prid, unit, Cid) values (388, 68, 5, 99);
insert into PrUnit (PUid, Prid, unit, Cid) values (389, 79, 1, 83);
insert into PrUnit (PUid, Prid, unit, Cid) values (390, 2, 5, 64);
insert into PrUnit (PUid, Prid, unit, Cid) values (391, 15, 3, 71);
insert into PrUnit (PUid, Prid, unit, Cid) values (392, 149, 1, 8);
insert into PrUnit (PUid, Prid, unit, Cid) values (393, 141, 4, 21);
insert into PrUnit (PUid, Prid, unit, Cid) values (394, 102, 2, 98);
insert into PrUnit (PUid, Prid, unit, Cid) values (395, 89, 4, 11);
insert into PrUnit (PUid, Prid, unit, Cid) values (396, 70, 4, 45);
insert into PrUnit (PUid, Prid, unit, Cid) values (397, 56, 2, 1);
insert into PrUnit (PUid, Prid, unit, Cid) values (398, 42, 1, 94);
insert into PrUnit (PUid, Prid, unit, Cid) values (399, 70, 1, 74);
insert into PrUnit (PUid, Prid, unit, Cid) values (400, 35, 3, 67);
insert into PrUnit (PUid, Prid, unit, Cid) values (401, 138, 2, 51);
insert into PrUnit (PUid, Prid, unit, Cid) values (402, 150, 3, 60);
insert into PrUnit (PUid, Prid, unit, Cid) values (403, 99, 2, 95);
insert into PrUnit (PUid, Prid, unit, Cid) values (404, 99, 2, 80);
insert into PrUnit (PUid, Prid, unit, Cid) values (405, 17, 1, 83);
insert into PrUnit (PUid, Prid, unit, Cid) values (406, 44, 1, 17);
insert into PrUnit (PUid, Prid, unit, Cid) values (407, 147, 5, 19);
insert into PrUnit (PUid, Prid, unit, Cid) values (408, 53, 3, 78);
insert into PrUnit (PUid, Prid, unit, Cid) values (409, 34, 5, 91);
insert into PrUnit (PUid, Prid, unit, Cid) values (410, 92, 1, 77);
insert into PrUnit (PUid, Prid, unit, Cid) values (411, 63, 4, 20);
insert into PrUnit (PUid, Prid, unit, Cid) values (412, 29, 2, 80);
insert into PrUnit (PUid, Prid, unit, Cid) values (413, 113, 5, 61);
insert into PrUnit (PUid, Prid, unit, Cid) values (414, 148, 1, 22);
insert into PrUnit (PUid, Prid, unit, Cid) values (415, 20, 2, 14);
insert into PrUnit (PUid, Prid, unit, Cid) values (416, 82, 4, 23);
insert into PrUnit (PUid, Prid, unit, Cid) values (417, 34, 2, 86);
insert into PrUnit (PUid, Prid, unit, Cid) values (418, 84, 3, 13);
insert into PrUnit (PUid, Prid, unit, Cid) values (419, 49, 3, 46);
insert into PrUnit (PUid, Prid, unit, Cid) values (420, 106, 5, 33);
insert into PrUnit (PUid, Prid, unit, Cid) values (421, 55, 5, 40);
insert into PrUnit (PUid, Prid, unit, Cid) values (422, 52, 2, 73);
insert into PrUnit (PUid, Prid, unit, Cid) values (423, 2, 4, 93);
insert into PrUnit (PUid, Prid, unit, Cid) values (424, 141, 2, 70);
insert into PrUnit (PUid, Prid, unit, Cid) values (425, 116, 5, 19);
insert into PrUnit (PUid, Prid, unit, Cid) values (426, 119, 3, 28);
insert into PrUnit (PUid, Prid, unit, Cid) values (427, 103, 4, 27);
insert into PrUnit (PUid, Prid, unit, Cid) values (428, 68, 4, 16);
insert into PrUnit (PUid, Prid, unit, Cid) values (429, 7, 4, 41);
insert into PrUnit (PUid, Prid, unit, Cid) values (430, 122, 3, 78);
insert into PrUnit (PUid, Prid, unit, Cid) values (431, 125, 1, 5);
insert into PrUnit (PUid, Prid, unit, Cid) values (432, 109, 3, 9);
insert into PrUnit (PUid, Prid, unit, Cid) values (433, 96, 3, 82);
insert into PrUnit (PUid, Prid, unit, Cid) values (434, 139, 4, 39);
insert into PrUnit (PUid, Prid, unit, Cid) values (435, 92, 3, 62);
insert into PrUnit (PUid, Prid, unit, Cid) values (436, 84, 4, 41);
insert into PrUnit (PUid, Prid, unit, Cid) values (437, 128, 2, 84);
insert into PrUnit (PUid, Prid, unit, Cid) values (438, 63, 4, 10);
insert into PrUnit (PUid, Prid, unit, Cid) values (439, 68, 3, 49);
insert into PrUnit (PUid, Prid, unit, Cid) values (440, 5, 1, 83);
insert into PrUnit (PUid, Prid, unit, Cid) values (441, 94, 5, 6);
insert into PrUnit (PUid, Prid, unit, Cid) values (442, 116, 4, 71);
insert into PrUnit (PUid, Prid, unit, Cid) values (443, 147, 1, 92);
insert into PrUnit (PUid, Prid, unit, Cid) values (444, 97, 4, 59);
insert into PrUnit (PUid, Prid, unit, Cid) values (445, 81, 4, 46);
insert into PrUnit (PUid, Prid, unit, Cid) values (446, 88, 1, 79);
insert into PrUnit (PUid, Prid, unit, Cid) values (447, 96, 4, 54);
insert into PrUnit (PUid, Prid, unit, Cid) values (448, 22, 3, 54);
insert into PrUnit (PUid, Prid, unit, Cid) values (449, 74, 3, 8);
insert into PrUnit (PUid, Prid, unit, Cid) values (450, 37, 2, 67);
insert into PrUnit (PUid, Prid, unit, Cid) values (451, 85, 4, 69);
insert into PrUnit (PUid, Prid, unit, Cid) values (452, 137, 1, 28);
insert into PrUnit (PUid, Prid, unit, Cid) values (453, 123, 3, 1);
insert into PrUnit (PUid, Prid, unit, Cid) values (454, 14, 2, 66);
insert into PrUnit (PUid, Prid, unit, Cid) values (455, 57, 5, 49);
insert into PrUnit (PUid, Prid, unit, Cid) values (456, 145, 2, 6);
insert into PrUnit (PUid, Prid, unit, Cid) values (457, 80, 2, 88);
insert into PrUnit (PUid, Prid, unit, Cid) values (458, 142, 2, 53);
insert into PrUnit (PUid, Prid, unit, Cid) values (459, 91, 4, 77);
insert into PrUnit (PUid, Prid, unit, Cid) values (460, 37, 4, 79);
insert into PrUnit (PUid, Prid, unit, Cid) values (461, 50, 5, 64);
insert into PrUnit (PUid, Prid, unit, Cid) values (462, 115, 2, 32);
insert into PrUnit (PUid, Prid, unit, Cid) values (463, 21, 5, 83);
insert into PrUnit (PUid, Prid, unit, Cid) values (464, 61, 4, 61);
insert into PrUnit (PUid, Prid, unit, Cid) values (465, 81, 3, 58);
insert into PrUnit (PUid, Prid, unit, Cid) values (466, 48, 3, 54);
insert into PrUnit (PUid, Prid, unit, Cid) values (467, 4, 1, 85);
insert into PrUnit (PUid, Prid, unit, Cid) values (468, 121, 2, 37);
insert into PrUnit (PUid, Prid, unit, Cid) values (469, 45, 4, 18);
insert into PrUnit (PUid, Prid, unit, Cid) values (470, 138, 3, 47);
insert into PrUnit (PUid, Prid, unit, Cid) values (471, 3, 1, 84);
insert into PrUnit (PUid, Prid, unit, Cid) values (472, 83, 3, 44);
insert into PrUnit (PUid, Prid, unit, Cid) values (473, 106, 2, 59);
insert into PrUnit (PUid, Prid, unit, Cid) values (474, 82, 4, 36);
insert into PrUnit (PUid, Prid, unit, Cid) values (475, 149, 5, 48);
insert into PrUnit (PUid, Prid, unit, Cid) values (476, 40, 2, 21);
insert into PrUnit (PUid, Prid, unit, Cid) values (477, 35, 3, 44);
insert into PrUnit (PUid, Prid, unit, Cid) values (478, 96, 3, 7);
insert into PrUnit (PUid, Prid, unit, Cid) values (479, 81, 3, 31);
insert into PrUnit (PUid, Prid, unit, Cid) values (480, 133, 5, 27);
insert into PrUnit (PUid, Prid, unit, Cid) values (481, 75, 3, 53);
insert into PrUnit (PUid, Prid, unit, Cid) values (482, 105, 3, 55);
insert into PrUnit (PUid, Prid, unit, Cid) values (483, 47, 5, 97);
insert into PrUnit (PUid, Prid, unit, Cid) values (484, 37, 2, 31);
insert into PrUnit (PUid, Prid, unit, Cid) values (485, 46, 1, 46);
insert into PrUnit (PUid, Prid, unit, Cid) values (486, 147, 3, 27);
insert into PrUnit (PUid, Prid, unit, Cid) values (487, 84, 4, 61);
insert into PrUnit (PUid, Prid, unit, Cid) values (488, 36, 1, 27);
insert into PrUnit (PUid, Prid, unit, Cid) values (489, 66, 3, 14);
insert into PrUnit (PUid, Prid, unit, Cid) values (490, 12, 5, 82);
insert into PrUnit (PUid, Prid, unit, Cid) values (491, 91, 4, 69);
insert into PrUnit (PUid, Prid, unit, Cid) values (492, 4, 4, 19);
insert into PrUnit (PUid, Prid, unit, Cid) values (493, 138, 2, 29);
insert into PrUnit (PUid, Prid, unit, Cid) values (494, 98, 5, 39);
insert into PrUnit (PUid, Prid, unit, Cid) values (495, 54, 4, 93);
insert into PrUnit (PUid, Prid, unit, Cid) values (496, 116, 4, 44);
insert into PrUnit (PUid, Prid, unit, Cid) values (497, 17, 2, 50);
insert into PrUnit (PUid, Prid, unit, Cid) values (498, 100, 2, 35);
insert into PrUnit (PUid, Prid, unit, Cid) values (499, 43, 1, 22);
insert into PrUnit (PUid, Prid, unit, Cid) values (500, 102, 4, 16);

select * from PrUnit;

 

-- OLAP 1

-- SELECT Prcategory,Prstatus, SUM(Prprice)
--  as SUM, GROUPING(Prcategory,Prstatus) 
--  FROM Product GROUP BY Prcategory ,Prstatus WITH ROLLUP;
--  
--  -- OLAP 2
--  
-- SELECT Prcategory, NULL, SUM(Prprice)
-- FROM Product
-- GROUP BY Prcategory
-- UNION ALL
-- SELECT NULL, Prstatus, SUM(Prprice)
-- FROM Product
-- GROUP BY Prstatus;

-- -- OLAP 3

-- SELECT Pmethods,PaymentStatus,SUM(Pamount)
-- as SUM , GROUPING(Pmethods,PaymentStatus)
-- FROM Payment GROUP BY Pmethods,PaymentStatus WITH ROLLUP;


-- -- OLAP 4


-- SELECT Pmethods, NULL, SUM(Pamount)
-- FROM Payment
-- GROUP BY Pmethods
-- UNION 
-- SELECT NULL, PaymentStatus, SUM(Pamount)
-- FROM Payment
-- GROUP BY PaymentStatus 
-- UNION
-- SELECT Pmethods, PaymentStatus, SUM(Pamount)
-- FROM Payment
-- GROUP BY Pmethods, PaymentStatus;


--  



-- delimiter // 


-- Transaction




-- CREATE TRIGGER update_cart
-- after insert ON Payment
-- FOR EACH ROW
--  
--  	if New.PaymentStatus = "SUCCESSFUL" then 
-- 	update Product,PrUnit set Product.Prunits=Product.Prunits-Prunit.unit where Product.Prid=Prunit.Prid and  PrUnit.Cid=new.Uidd;    
--     end if; //     
    



 

-- DELIMITER //
-- CREATE TRIGGER update_amount
-- before INSERT ON Payment
-- FOR EACH ROW
-- BEGIN
-- 	update Payment,Product,PrUnit set Pamount=Pamount + (PrUnit.unit * Product.Prprice ) where Product.Prid=Prunit.Prid and PrUnit.Cid=new.Uidd;
--     end //
--  delimiter ;

-- delimiter //
-- CREATE TRIGGER update_cart
-- before insert ON Payment
-- FOR EACH ROW
--   if NEW.PaymentStatus = 'SUCCESSFUL' then 
--     set NEW.Pamount = New.Pamount+(SELECT PrUnit.unit * Product.Prprice FROM Product, PrUnit WHERE PrUnit.Prid = Product.Prid AND PrUnit.Cid = NEW.Uidd);
--   end if;
-- //

-- Error Code: 1054. Unknown column 'Pamount' in 'field list'
-- Error Code: 1048. Column 'Pamount' cannot be null




    
    


select * from Product;
select * from Payment;

-- SELECT Prcategory,Prstatus, SUM(Prprice)
--  as SUM, GROUPING(Prcategory,Prstatus) 
--  FROM Product GROUP BY Prcategory ,Prstatus WITH ROLLUP;

--  SELECT Prcategory, NULL, SUM(Prprice)
-- FROM Product
-- GROUP BY Prcategory
-- UNION ALL
-- SELECT NULL, Prunits, SUM(Prprice)
-- FROM Product
-- GROUP BY Prunits


-- create index user_index on User(Uid,Uphone);
-- create index Admin_index on Admin(Aid);
-- create index Deliveryperson_index on Deliveryperson(Did,Dphone);
-- create index Payment_index on Payment(Pid);
-- -- create index Oder_index on Oder(Oprice);
-- create index Product_index on Product(Prid);


-- select * from Payment;
-- select * from Product where Prprice in(882,1393,1848);
-- select * from Product where Prdetails in('High Demand');
-- select * from User where Ufirstname like '%i%';
-- select * from Product order by Prprice ASC;
-- select * from Product order by Prprice DESC;
-- -- select Prdetails,count(Prdetails) from Product group by Prdetails; 
-- select Pmethods,count(Pmethods) from Payment group by Pmethods;
-- select Prdetails,Avg(Prprice) from Product group by Prdetails;
-- select Prdetails,Min(Prprice) from Product group by Prdetails;
-- select Uid,Ufirstname,Dfirstname from User as a Inner join Deliveryperson as d on a.Uid=d.Did where a.Uid<20;
-- select Uid,Ufirstname,Dfirstname from User as a left join Deliveryperson as d on a.Uid=d.Did where a.Uid<20;
-- select Prdetails from Product group by Prdetails; 
-- select * from product where Prdetails like  'Available' ;
-- select * from User where Ufirstname like '%a';
-- select * from User where Ufirstname like '_____';
-- select * from Product where Prprice between 100 and 1000;
-- select * from Deliveryperson where year(Ddob)=1991 ;
-- select Prdetails,count(Prdetails) from product where Prdetails='Available';
-- select curdate();
-- select now();
-- select * from product order by prprice desc limit 3,1;

-- select * from product as p1 where 4=( select count(distinct(prprice)) from product as p2 where p2.prprice>=p1.prprice);
-- select * from product as p1,product p2 where p1.prprice = p2.prprice and p1.prid!=p2.prid ;
-- select * from product where Prid <=(select count(prid)/2 from product);
-- select * from product;
-- select * from product where prid=(select max(prid) from product);
-- select * from product where prid=(select min(prid) from product);
-- select * from product where prid>(select max(prid) from product)-5;
-- select max(prprice) as mpr,prdetails from product group by prdetails;

-- select prname,prprice,prdetails from (select max(prprice) as mpr,prdetails from product group by prdetails) temp 
-- inner join product w on temp.prdetails= w.prdetails and temp.mpr = w.prprice;

-- select * from product where prprice>=(select prprice from product as w1 where 3=(select count(distinct(w2.prprice)) from product as w2 where w2.prprice>=w1.prprice)) order by prprice desc;
-- select * from product order by prprice desc limit 3;
-- select sum(Oprice*(1-Discount/100) *Ounits)
-- from Oder
-- where Odate between '2023-02-17' and '2023-03-17';



select * from Product;

-- select * from Prlog;
drop procedure if exists query1;

delimiter $$
create procedure query1(
	in quantity int
)
begin
	declare stock int;
	select Prunits into stock from Product where Prid = 1;
    
    start transaction;
    
    if quantity > stock then
		rollback;
	else 
		update Product set Prunits = Prunits - quantity where Prid = 1;
        select * from Product; 
        commit;
	end if;
end $$
delimiter ;

call query1(5);
select * from Product;


delimiter $$
create procedure query2(
	in status varchar(50)
)
begin
	start transaction;
    if status = "UNSUCCESSFUL" then
		rollback;
	else
		insert into Payment values(1604,91,"NET BANKING","2022-10-03","SUCCESSFUL",10000);
        select * from Payment;
        commit;
	end if;
end $$
delimiter ;

call query2("UNSUCCESSFUL");


delimiter $$

create procedure query3(
	in dob varchar(50),
    in id int
)
begin

	start transaction;
	
    if dob<"1983-01-01" then
		update Deliveryperson set Dsalary = Dsalary + 0.1*Dsalary where Did = id;
        select * from Deliveryperson;
        commit;
	else
		rollback;
	end if;
end $$
delimiter ;

call query3("1979-09-12",1);
select * from Deliveryperson;


delimiter $$
create procedure query4(
	in status varchar(50),
    in id int
)
begin
	start transaction;
	
    if status = "Not Available" then
		update Product set Prunits = Prunits + 5 where Prid = id;
        select * from Product;
        commit;
	else
		rollback;
	end if;
end $$
delimiter ;

call query4("Not Available",3);







