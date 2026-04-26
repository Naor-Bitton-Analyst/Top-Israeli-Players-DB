--יצירת בסיס נתונים עבור שחקני כדורגל ישראלים מובילים
create database NaorfootBall30
go
use NaorfootBall30
go

--יצירת טבלת קבוצות עם פרטים על הקבוצה ,נווארצר לעברית ,פריימרי קי לקבוצות
CREATE TABLE Teams (
		Team_ID	INT PRIMARY KEY IDENTITY (1,1),
		Team_Name NVARCHAR(50) NOT NULL,
		City NVARCHAR(30) NOT NULL,
		Stadium NVARCHAR(50)
		)
--יצירת טבלת שחקנים עם שם מלא ותפקיד ,מקושרת לקבוצות,דייט לתאריך לידה
CREATE TABLE Players (
		Player_ID INT PRIMARY KEY IDENTITY (1,1),
		First_Name NVARCHAR (30) NOT NULL,
		Last_Name NVARCHAR (30) NOT NULL,
		Birth_Date date,
		Position NVARCHAR(20),
		Team_ID INT,
		ALTER TABLE Players ADD CONSTRAINT FK_Players_Teams
		FOREIGN KEY (Team_ID) REFERENCES Teams(Team_ID)
		)
--יצירת טבלת עונות ,בקטגוריה השניה פורמט של טקסט עבור שנים
CREATE TABLE Seasons (
		Season_ID INT PRIMARY KEY IDENTITY(1,1),
		Season_Name NVARCHAR(20) NOT NULL
		)
--טבלת סטטיסטיקה,קישור לטבלת שחקנים ולטבלת עונות
--כוללת זכיה בגביע וכמות משחקים שהשחקן שיחק
--הגדרת דיפולט כדי שאם אין נתונים ירשם 0

CREATE TABLE Player_Stats (
		Stat_ID INT PRIMARY KEY IDENTITY(1,1),
		Player_ID INT,
		Season_ID INT,
		Games_Played INT DEFAULT (0),
		Goals INT DEFAULT (0),
		Assists INT DEFAULT (0),
		Yellow_Cards INT DEFAULT (0),
		Red_Cards INT DEFAULT (0),
		WonCup BIT DEFAULT (0),
		CupName NVARCHAR(50) NULL,
		ALTER TABLE Player_Stats ADD CONSTRAINT FK_Stats_Seasons
		FOREIGN KEY (Season_ID) REFERENCES Seasons(Season_ID)
		FOREIGN KEY (Player_ID) REFERENCES Players(Player_ID),
		
		)
--הוספת תז לקבוצה לטבלת הסטטיסטיקה
        ALTER TABLE Player_Stats
        add Team_ID INT
		ALTER TABLE Player_Stats ADD CONSTRAINT FK_Stats_Teams
		FOREIGN KEY (Team_ID) REFERENCES Teams(Team_ID)

--הזנת נתונים לטבלת הקבוצות
INSERT INTO Teams 
			(Team_Name,City,Stadium) VALUES
            (N'הפועל באר שבע',N'באר שבע',N'טרנר'),
			(N'בני יהודה',N'תל אביב',N'אצטדיון שכונת התקווה'),
			(N'הפועל תל אביב',N'תל אביב',N'בלומפילד'),
			(N'באיירן מינכן',N'מינכן',N'אליאנץ ארנה'),
			(N'סלטיק',N'גלאזגו',N'סלטיק פארק'),
			(N'וולספברגר',N'וולפסברג',N'לבנטל ארנה'),
			(N'מכבי פתח תקווה',N'פתח תקווה',N'המושבה'),
			(N'מכבי נתניה',N'נתניה',N'אצטדיון מרים'),
			(N'מכבי חיפה',N'חיפה',N'סמי עופר'),
			(N'מכבי תל אביב',N'תל אביב',N'בלומפילד'),
			(N'בית"ר ירושלים',N'ירושלים',N'טדי'),
			(N'פיורנטינה',N'פירנצה',N'ארטמיו פירנצה'),
			(N'אייאקס',N'אמסטרדם',N'יוהאן קרויף ארנה'),
			(N'גנט',N'גנט',N'גלאמקו ארנה'),
			(N'פילדלפיה יוניון',N'פילדפיה',N'סובארו פארק'),
			(N'שארלוט',N'שארלוט',N'בנק אוף אמריקה'),
			(N'המבורג',N'המבורג',N'פולק ספארק'),
			(N'שחטאר דונייצק',N'דובנאס',N'דובנאס ארנה'),
			(N'פרנצווארוש',N'בודפשט',N'גרופאמה ארנה'),
            (N'רדבול זרלצבורג',N'זלצבורג',N'רדבול ארנה')

--הזנת נתונים לטבלת השחקנים
INSERT INTO Players
			(First_Name,Last_Name,Birth_Date,Position,Team_ID)VALUES
			(N'מנור',N'סולומון','1999-07-24',N'קשר','16'),
			(N'אוסקר',N'גלוך','2004-04-01',N'קשר','17'),
			(N'עומרי',N'גנדלמן','2000-05-16',N'קשר','18'),
			(N'תאי',N'בריבו','1998-01-15',N'חלוץ','19'),
			(N'עידן',N'טוקלומטי','2004-11-15',N'חלוץ','20'),
			(N'ליאל',N'עבדה','2001-10-03',N'חלוץ','20'),
			(N'דניאל',N'פרץ','2000-07-10',N'שוער','21'),
			(N'סתיו',N'למקין','2003-04-02','בלם','22'),
			(N'מוחמד',N'אבו פאני','1998-04-27','קשר','23'),
			(N'דולב',N'חזיזה','1995-07-05','קשר','13'),
			(N'איתן',N'אזולאי','2002-01-12','קשר','13'),
			(N'שון',N'גולדברג','1995-06-13','בלם','13'),
			(N'שגיב',N'יחזקאל','1995-03-30','מגן','14'),
			(N'אלעד',N'מדמון','2004-02-10','חלוץ','14'),
			(N'עידו',N'שחר','2001-08-20','קשר','14'),
			(N'רז',N'שלמה','1999-08-13','בלם','14'),
			(N'ירדן',N'שועה','1999-06-16','חלוץ','15'),
			(N'עדי',N'יונה','2004-04-17','קשר','15'),
			(N'עומר',N'אצילי','1993-07-27','קשר','15'),
			(N'ירין',N'לוי','2005-08-01','קשר','15')

--הזנת נתונים לטבלת העונות , אידנטיטי כדי להזיו מספרים ידנית
SET IDENTITY_INSERT SEASONS ON
INSERT INTO Seasons
			(Season_ID,Season_Name)values
			           (1,N'2015/2016'),
					   (2,N'2016/2017'),
					   (3,N'2017/2018'),
					   (4,N'2018/2019'),
					   (5,N'2019/2020'),
					   (6,N'2020/2021'),
					   (7,N'2021/2022'),
					   (8,N'2022/2023'),
					   (9,N'2023/2024'),
					   (10,N'2024/2025')

--הזנת נתונים לטבלת סטטיסטיקה ,
--.זהיתי באמצע הדרך שחסרות העמודות של הכרטיסים הצהובים והאדומים .החלטתי לתקן את האינסרט ולהמשיך 
--ואחר כך להכניס את הנתונים החסרים ב UPDATE
--וגם זהיתי בסוף הכנסת הנתונים שחסר תז קבוצה לכל שחקן ,הוספתי למעלה על ידי ALTER TABLE.
INSERT INTO Player_Stats
           (Player_ID,
		    Season_ID,
		    Games_Played,
		    Goals,
		    Assists,
		    WonCup,
		    CupName)VALUES

(13,1,28,8,12,0,NULL),(13,2,30,12,9,0,NULL),(13,3,22,6,14,0,NULL),(13,4,16,5,10,0,NULL),(13,5,28,16,12,0,NULL),
(13,6,35,18,21,1,N'גביע הטוטו'),(13,7,24,10,13,0,NULL),(13,8,12,6,5,0,NULL),(13,9,15,7,9,0,NULL),(13,10,20,8,6,0,NULL),

(14,1,0,0,0,0,NULL),(14,2,0,0,0,0,NULL),(14,3,0,0,0,0,NULL),(14,4,0,0,0,0,NULL),(14,5,16,5,2,1,N'אליפות המדינה'),
(14,6,20,9,6,1,N'אליפות המדינה'),(14,7,28,10,12,0,NULL),(14,8,30,16,21,1,N'אליפות אוסטריה'),(14,9,21,6,13,0,NULL),(14,10,26,12,10,0,NULL),

(15,1,0,0,0,0,NULL),(15,2,0,0,0,0,NULL),(15,3,0,0,0,0,NULL),(15,4,26,8,15,0,NULL),(15,5,29,15,12,0,NULL),(15,6,19,5,9,0,NULL),
(15,7,25,12,6,0,NULL),(15,8,28,13,18,1,N'גביע הטוטו'),(15,9,24,6,14,0,NULL),(15,10,26,10,12,0,NULL),
			
(16,1,0,0,0,0,NULL),(16,2,0,0,0,0,NULL),(16,3,23,11,3,0,NULL),(16,4,25,9,4,0,NULL),(16,5,28,12,5,0,NULL),(16,6,33,22,8,0,NULL),
(16,7,31,10,6,0,NULL),(16,8,16,12,5,0,NULL),(16,9,26,18,8,0,NULL),(16,10,20,14,4,0,NULL),
			
(17,1,0,0,0,0,NULL),(17,2,0,0,0,0,NULL),(17,3,0,0,0,0,NULL),(17,4,0,0,0,0,NULL),(17,5,0,0,0,0,NULL),(17,6,30,8,3,0,NULL),
(17,7,28,9,6,0,NULL),(17,8,7,3,2,0,NULL),(17,9,24,12,6,1,N'גביע המדינה'),(17,10,28,11,6,0,NULL),
			
(18,1,0,0,0,0,NULL),(18,2,0,0,0,0,NULL),(18,3,25,8,12,0,NULL),(18,4,20,9,10,0,NULL),(18,5,18,10,6,0,NULL),(18,6,23,7,9,0,NULL),
(18,7,31,12,16,1,N'אליפות סקוטלנד'),(18,8,26,9,14,1,N'אליפות סקוטלנד,הגביע הסקוטי'),(18,9,30,6,8,0,NULL),(18,10,29,8,10,0,NULL),
			
(19,1,0,0,0,0,NULL),(19,2,0,0,0,0,NULL),(19,3,0,0,0,0,NULL),(19,4,13,0,1,0,NULL),(19,5,20,0,0,0,NULL),(19,6,25,0,0,1,N'גביע המדינה,גביע הטוטו'),
(19,7,13,0,0,0,NULL),(19,8,21,0,0,0,NULL),(19,9,16,0,1,0,NULL),(19,10,25,0,0,1,N'אליפות גרמניה'),
			
(20,1,0,0,0,0,NULL),(20,2,0,0,0,0,NULL),(20,3,0,0,0,0,NULL),(20,4,0,0,0,0,NULL),(20,5,25,1,3,0,NULL),(20,6,20,0,2,0,NULL),
(20,7,4,0,0,0,NULL),(20,8,21,0,3,0,NULL),(20,9,23,1,1,0,NULL),(20,10,19,0,4,1,N'אליפות המדינה'),
			
(21,1,0,0,0,0,NULL),(21,2,13,5,7,0,NULL),(21,3,18,6,2,0,NULL),(21,4,25,3,12,0,NULL),(21,5,21,9,8,0,NULL),(21,6,31,10,14,1,N'אליפות המדינה'),
(21,7,26,9,6,1,N'אליפות המדינה'),(21,8,28,6,13,1,N'אליפות המדינה'),(21,9,16,2,6,0,NULL),(21,10,19,3,8,0,NULL),
			
(22,1,11,4,2,0,NULL),(22,2,23,3,9,1,N'גביע המדינה'),(22,3,20,6,10,0,NULL),(22,4,16,5,12,1,N'גביע המדינה'),(22,5,31,2,8,0,NULL),
(22,6,25,7,14,1,N'אליפות המדינה'),(22,7,21,5,8,1,N'אליפות המדינה'),(22,8,20,9,11,1,N'אליפות המדינה'),(22,9,28,16,10,0,NULL),
(22,10,26,12,16,0,NULL),

(23,1,0,0,0,0,NULL),(23,2,0,0,0,0,NULL),(23,3,0,0,0,0,NULL),(23,4,0,0,0,0,NULL),(23,5,25,1,3,0,NULL),(23,6,26,0,5,0,NULL),
(23,7,20,3,8,0,NULL),(23,8,19,2,6,0,NULL),(23,9,31,5,12,0,NULL),(23,10,26,7,10,0,NULL),
			
(24,1,1,0,1,0,NULL),(24,2,0,0,0,0,NULL),(24,3,3,0,0,0,NULL),(24,4,4,0,2,1,N'אליפות המדינה'),(24,5,6,0,1,1,N'גביע המדינה'),
(24,6,12,0,3,0,NULL),(24,7,20,3,6,1,N'אליפות המדינה'),(24,8,28,2,5,1,N'אליפות המדינה'),(24,9,22,0,2,0,NULL),(24,10,18,0,3,0,NULL),
			
(25,1,20,3,2,0,NULL),(25,2,21,4,6,0,NULL),(25,3,2,0,0,0,NULL),(25,4,5,0,1,0,NULL),(25,5,15,0,2,0,NULL),(25,6,11,2,1,0,NULL),
(25,7,20,8,3,1,N'גביע המדינה'),(25,8,10,3,8,0,NULL),(25,9,13,6,2,0,NULL),(25,10,31,7,4,1,N'אליפות המדינה');

--תיקון ה INSERT
--הוספת כרטיסים צהובים ואדומים
INSERT INTO Player_Stats 
           (Player_ID,
		    Season_ID,
			Games_Played,
			Goals,
			Assists,
			Yellow_Cards,
			Red_Cards,
			WonCup,
			CupName)VALUES

(26,1,0,0,0,0,0,0,NULL),(26,2,0,0,0,0,0,0,NULL),(26,3,0,0,0,0,0,0,NULL),(26,4,0,0,0,0,0,0,NULL),(26,5,0,0,0,0,0,0,NULL),
(26,6,15,2,3,1,0,0,NULL),(26,7,12,4,4,0,1,0,NULL),(26,8,33,12,6,2,0,0,NULL),(26,9,30,11,4,5,0,0,NULL),
(26,10,28,5,6,7,1,1,N'אליפות המדינה,גביע הטוטו'),

(27,1,0,0,0,0,0,0,NULL),(27,2,0,0,0,0,0,0,NULL),(27,3,15,8,2,4,0,0,NULL),(27,4,20,12,1,2,0,0,NULL),(27,5,28,14,3,2,1,0,NULL),
(27,6,32,9,5,4,0,0,NULL),(27,7,15,4,1,0,0,0,NULL),(27,8,25,6,1,2,1,0,NULL),(27,9,28,12,4,2,0,1,N'אליפות המדינה'),
(27,10,18,6,8,1,0,1,N'אליפות המדינה'),

(28,1,18,1,2,2,1,0,NULL),(28,2,22,2,1,5,0,0,NULL),(28,3,25,0,1,3,1,0,NULL),(28,4,29,2,3,5,0,0,NULL),(28,5,31,0,3,4,0,0,NULL),
(28,6,28,2,1,6,1,0,NULL),(28,7,24,0,0,3,0,0,NULL),(28,8,32,3,5,2,0,1,N'גביע הטוטו'),(28,9,29,1,0,5,0,1,N'אליפות המדינה'),
(28,10,23,0,2,4,1,1,N'אליפות המדינה'),

(29,1,10,8,6,1,0,0,NULL),(29,2,18,12,10,2,1,0,NULL),(29,3,21,6,10,3,0,0,NULL),(29,4,20,11,8,2,1,1,N'גביע המדינה'),
(29,5,26,10,12,3,1,0,NULL),(29,6,26,20,16,3,1,0,NULL),(29,7,28,13,9,2,0,0,NULL),(29,8,31,18,15,2,1,0,N'גביע המדינה'),
(29,9,29,21,10,2,0,0,NULL),(29,10,25,16,18,3,1,0,NULL),

(30,1,0,0,0,0,0,0,NULL),(30,2,0,0,0,0,0,0,NULL),(30,3,0,0,0,0,0,0,NULL),(30,4,0,0,0,0,0,0,NULL),(30,5,0,0,0,0,0,0,NULL),
(30,6,12,2,5,1,0,0,NULL),(30,7,18,5,6,0,0,0,NULL),(30,8,27,2,10,2,0,1,N'גביע המדינה'),(30,9,31,8,14,1,0,0,NULL),
(30,10,33,10,11,1,0,0,NULL),

(31,1,22,8,2,2,0,0,NULL),(31,2,26,15,6,1,1,0,NULL),(31,3,33,21,10,3,0,1,N'גביע הטוטו'),(31,4,29,15,12,2,0,1,N'אליפות המדינה'),
(31,5,30,18,9,4,1,1,N'אליפות המדינה'),(31,6,26,12,8,2,1,1,N'אליפות המדינה'),(31,7,28,9,14,4,0,1,N'אליפות המדינה'),
(31,8,22,13,6,1,0,1,N'אליפות המדינה'),(31,9,26,19,15,2,0,1,N'אליפות המדינה'),(31,10,33,15,10,1,0,1,N'אליפות המדינה'),

(32,1,0,0,0,0,0,0,NULL),(32,2,0,0,0,0,0,0,NULL),(32,3,0,0,0,0,0,0,NULL),(32,4,0,0,0,0,0,0,NULL),(32,5,0,0,0,0,0,0,NULL),
(32,6,2,0,0,0,1,0,NULL),(32,7,10,1,2,2,0,0,NULL),(32,8,18,3,6,1,0,0,NULL),(32,9,20,6,10,3,1,0,NULL),(32,10,25,4,12,3,0,0,NULL);


--הוספת תז קבוצה לכל שחקן
--התאמת השחקנים לקבוצות בהן הם שיחקו לפי שנים
UPDATE Player_Stats
SET Team_ID = CASE
    WHEN Season_ID IN (1,2,3)THEN 14
	WHEN Season_ID IN (4,5,6,7,8) THEN 22
	WHEN Season_ID IN (9,10) THEN 16
	END
	WHERE Player_ID = 13

UPDATE Player_Stats
SET Team_ID = CASE
    WHEN Season_ID IN (5,6,7)THEN 14
	WHEN Season_ID IN (8) THEN 24
	WHEN Season_ID IN (9,10) THEN 17
	END
	WHERE Player_ID = 14

UPDATE Player_Stats
SET Team_ID = CASE
    WHEN Season_ID IN (4,5,6,7,8)THEN 25
	WHEN Season_ID IN (9,10) THEN 18
	END
	WHERE Player_ID = 15

UPDATE Player_Stats
 SET Team_ID = CASE
    WHEN Season_ID IN (3,4,5,6)THEN 26
	WHEN Season_ID IN (7,8) THEN 27
	WHEN Season_ID IN (9,10) THEN 19
	END 
	WHERE Player_ID = 16

UPDATE Player_Stats
 SET Team_ID = CASE
    WHEN Season_ID IN (6,7,8,9)THEN 26
	WHEN Season_ID IN (10) THEN 20
	END 
	WHERE Player_ID = 17

UPDATE Player_Stats
 SET Team_ID = CASE
    WHEN Season_ID IN (3,4,5)THEN 26
	WHEN Season_ID IN (6,7,8) THEN 28
    WHEN Season_ID IN (9,10) THEN 20
	END 
	WHERE Player_ID = 18

UPDATE Player_Stats
 SET Team_ID = CASE
    WHEN Season_ID IN (4,5,6,7)THEN 14
	WHEN Season_ID IN (8) THEN 21
    WHEN Season_ID IN (9,10) THEN 29
	END 
	WHERE Player_ID = 19

UPDATE Player_Stats
 SET Team_ID = CASE
    WHEN Season_ID IN (5,6,7)THEN 30
	WHEN Season_ID IN (8,9) THEN 22
    WHEN Season_ID IN (10) THEN 14
	END 
	WHERE Player_ID = 20
	
UPDATE Player_Stats
 SET Team_ID = CASE
    WHEN Season_ID IN (2,3,4,5,6,7,8)THEN 13
    WHEN Season_ID IN (9,10) THEN 23
	END 
	WHERE Player_ID = 21

UPDATE Player_Stats
 SET Team_ID = CASE
    WHEN Season_ID IN (1,2,3,4,5)THEN 31
    WHEN Season_ID IN (6,7,8,9,10) THEN 13
	END 
	WHERE Player_ID = 22

UPDATE Player_Stats
 SET Team_ID = CASE
    WHEN Season_ID IN (5,6)THEN 26
    WHEN Season_ID IN (7,8) THEN 25
	WHEN Season_ID IN (9,10) THEN 13
	END 
	WHERE Player_ID = 23

UPDATE Player_Stats
 SET Team_ID = CASE
    WHEN Season_ID IN (1,2,3,4)THEN 14
    WHEN Season_ID IN (5,6) THEN 30
	WHEN Season_ID IN (7,8,9,10) THEN 13
	END 
	WHERE Player_ID = 24

UPDATE Player_Stats
 SET Team_ID = CASE
    WHEN Season_ID IN (1,2,3)THEN 30
    WHEN Season_ID IN (4,5,6) THEN 32
	WHEN Season_ID IN (7,8,9,10) THEN 14
	END 
	WHERE Player_ID = 25

UPDATE Player_Stats
 SET Team_ID = CASE
	WHEN Season_ID IN (6,7,8)THEN 26
    WHEN Season_ID IN (9,10) THEN 14
	END 
	WHERE Player_ID = 26

UPDATE Player_Stats
 SET Team_ID = CASE
    WHEN Season_ID IN (3,4,5)THEN 14
    WHEN Season_ID IN (6,7,8) THEN 26
	WHEN Season_ID IN (9,10) THEN 14
	END 
	WHERE Player_ID = 27

UPDATE Player_Stats
 SET Team_ID = CASE
    WHEN Season_ID IN (1,2,3)THEN 30
    WHEN Season_ID IN (4,5,6) THEN 25
	WHEN Season_ID IN (7,8,9,10) THEN 14
	END 
	WHERE Player_ID = 28

UPDATE Player_Stats
 SET Team_ID = CASE
    WHEN Season_ID IN (1,2,3,4)THEN 31
    WHEN Season_ID IN (5,6) THEN 13
	WHEN Season_ID IN (7,8,9,10) THEN 15
	END 
	WHERE Player_ID = 29


UPDATE Player_Stats
 SET Team_ID = CASE
    WHEN Season_ID IN (6) THEN 26
	WHEN Season_ID IN (7,8,9,10) THEN 15
	END 
	WHERE Player_ID = 30

UPDATE Player_Stats
 SET Team_ID = CASE
    WHEN Season_ID IN (1,2,3) THEN 15
	WHEN Season_ID IN (4,5) THEN 14
	WHEN Season_ID IN (6,7) THEN 13
	WHEN Season_ID IN (8,9,10) THEN 15
	END 
	WHERE Player_ID = 31

UPDATE Player_Stats
 SET Team_ID = CASE
    WHEN Season_ID IN (6,7,8) THEN 13
	WHEN Season_ID IN (9,10) THEN 15
	END 
	WHERE Player_ID = 32
--***


--הגבלת כניסה לטבלת שחקנים לגיל 16 ומעלה
ALTER TABLE PLAYERS
  ADD CONSTRAINT CHK_PlayerAge
  CHECK (YEAR(Birth_Date) <=2010)

--הזנת נתוני הכרטיסים הצהובים והאדומים לכל שחקן
UPDATE Player_Stats
 SET Yellow_Cards = CASE
    WHEN Season_ID IN (1,3,5) THEN 1
	WHEN Season_ID IN (2,7,8) THEN 2
    WHEN Season_ID IN (4,6) THEN 0
    WHEN Season_ID IN (9,10) THEN 1
	ELSE 0
	END, 
	Red_Cards = CASE
	WHEN Season_ID = 5 THEN 1
	ELSE 0
	END
	WHERE Player_ID = 13

UPDATE Player_Stats
 SET Yellow_Cards = CASE
    WHEN Season_ID IN (5,6,7) THEN 3
	WHEN Season_ID IN (8) THEN 2
    WHEN Season_ID IN (9,10) THEN 1
	ELSE 0
	END, 
	Red_Cards = CASE
	WHEN Season_ID = 9 THEN 1
	ELSE 0
	END
	WHERE Player_ID = 14

UPDATE Player_Stats
 SET Yellow_Cards = CASE
    WHEN Season_ID IN (4,6,9) THEN 2
	WHEN Season_ID IN (8) THEN 3
    WHEN Season_ID IN (5,7,10) THEN 1
	ELSE 0
	END, 
	Red_Cards = CASE
	WHEN Season_ID IN (5,9) THEN 1
	ELSE 0
	END
	WHERE Player_ID = 15			
			
UPDATE Player_Stats
 SET Yellow_Cards = CASE
    WHEN Season_ID IN (4,5,9) THEN 2
	WHEN Season_ID IN (3,8,10) THEN 3
    WHEN Season_ID IN (6,7) THEN 1
	ELSE 0
	END, 
	Red_Cards = CASE
	WHEN Season_ID IN (3,7) THEN 1
	ELSE 0
	END
	WHERE Player_ID = 16				
			
UPDATE Player_Stats
 SET Yellow_Cards = CASE
    WHEN Season_ID IN (7,9,10) THEN 2
    WHEN Season_ID IN (6,8) THEN 1
	ELSE 0
	END, 
	Red_Cards = CASE
	WHEN Season_ID = 8 THEN 1
	ELSE 0
	END
	WHERE Player_ID = 17			
			
UPDATE Player_Stats
 SET Yellow_Cards = CASE
    WHEN Season_ID IN (3,5,6,7) THEN 2
    WHEN Season_ID IN (4,8,10) THEN 1
	WHEN Season_ID = 9 THEN 4
	ELSE 0
	END, 
	Red_Cards = CASE
	WHEN Season_ID = 4 THEN 1
	ELSE 0
	END
	WHERE Player_ID = 18			
			
UPDATE Player_Stats
 SET Yellow_Cards = CASE
    WHEN Season_ID IN (5,6,7) THEN 2
    WHEN Season_ID IN (4,8) THEN 1
	ELSE 0
	END, 
	Red_Cards = CASE
	WHEN Season_ID = 9 THEN 1
	ELSE 0
	END
	WHERE Player_ID = 19	

UPDATE Player_Stats
 SET Yellow_Cards = CASE
    WHEN Season_ID IN (5,7,8) THEN 2
    WHEN Season_ID IN (6,9,10) THEN 3
	ELSE 0
	END, 
	Red_Cards = CASE
	WHEN Season_ID IN (5,9) THEN 1
	ELSE 0
	END
	WHERE Player_ID = 20	

UPDATE Player_Stats
 SET Yellow_Cards = CASE
    WHEN Season_ID IN (6,7,10) THEN 2
    WHEN Season_ID IN (5,9,3) THEN 3
    WHEN Season_ID IN (2,4,8) THEN 1
	ELSE 0
	END, 
	Red_Cards = CASE
	WHEN Season_ID IN (5,9) THEN 1
	ELSE 0
	END
	WHERE Player_ID = 21

UPDATE Player_Stats
 SET Yellow_Cards = CASE
    WHEN Season_ID IN (3,6,7,10) THEN 2
    WHEN Season_ID IN (5,9) THEN 3
    WHEN Season_ID IN (4,8) THEN 4
    WHEN Season_ID = 2 THEN 4
	ELSE 0
	END, 
	Red_Cards = CASE
	WHEN Season_ID = 7 THEN 1
	WHEN Season_ID = 5 THEN 2
	ELSE 0
	END
	WHERE Player_ID = 22

UPDATE Player_Stats
 SET Yellow_Cards = CASE
    WHEN Season_ID IN (5,8,10) THEN 2
    WHEN Season_ID IN (6,9) THEN 3
    WHEN Season_ID = 7 THEN 1
	ELSE 0
	END, 
	Red_Cards = CASE
	WHEN Season_ID = 9 THEN 1
	ELSE 0
	END
	WHERE Player_ID = 23			
			
UPDATE Player_Stats
 SET Yellow_Cards = CASE
    WHEN Season_ID IN (5,6,9) THEN 2
    WHEN Season_ID IN (3,8,10) THEN 1
    WHEN Season_ID = 7 THEN 3
	ELSE 0
	END, 
	Red_Cards = CASE
	WHEN Season_ID = 8 THEN 1
	ELSE 0
	END
	WHERE Player_ID = 24			
			
UPDATE Player_Stats
 SET Yellow_Cards = CASE
    WHEN Season_ID IN (1,3,6,9) THEN 2
    WHEN Season_ID IN (2,8,10) THEN 1
    WHEN Season_ID IN (5,7) THEN 3
	ELSE 0
	END, 
	Red_Cards = CASE
	WHEN Season_ID IN (1,5,10) THEN 1
	ELSE 0
	END
	WHERE Player_ID = 25
--****

--שאילתה למציאת חמשת השחקנים בעלי ממוצע הכיבושים הגבוה ביותר.
--שאילתה עם שימוש ב JOIN
--כדי לחבר בין 3 טבלאות שונות - שחקנים,קבוצות וסטטיסטיקה
SELECT TOP 5
      P.First_Name+' '+ P.Last_Name AS
	  [Player Name],
	  T.Team_Name AS [Team],
	  SUM(S.Goals)AS [Total Goals],
	  SUM(S.Games_Played) AS [Total Games],
	  CAST(SUM(S.Goals) * 1.0/
SUM (Games_Played) AS DECIMAL (10,2)) AS [Goals Per Game]
FROM Players P
JOIN Player_Stats S ON P.Player_ID = S.Player_ID
JOIN Teams T ON S.Team_ID = T.Team_ID
GROUP BY P.First_Name,P.Last_Name,T.Team_Name
      HAVING SUM (S.Goals)>=5
ORDER BY [Goals Per Game] DESC;
			

--שאילתה המציגה את השחקנים המובילים של הקבוצה שנבחרה לאורך כל העונות
SELECT 
  P.First_Name+' '+P.Last_Name AS [Player],
  SUM (S.Goals)AS [Total_Goals],
  T.Team_Name AS [Team]
FROM Players P
JOIN Player_Stats S ON P.Player_ID = S.Player_ID
JOIN Teams T ON S.Team_ID = T.Team_ID
WHERE T.Team_ID = 13
GROUP BY P.First_Name,P.Last_Name,T.Team_Name
ORDER BY [Total_Goals] DESC;


--שאילתה לזיהוי מגמת עליה אצל שחקנים מבחינת שערים
--מהעונה הראשונה לעומת העונה העשירית
SELECT
   P.First_Name +' '+ P.Last_Name AS [Player_Name],
   S1.Goals AS [Goals_Season_1],
   S10.Goals AS [Goals_Season_10],
   (S10.Goals - S1.Goals) AS
   [IMPROVEMENT]
 FROM Players P
 JOIN Player_Stats S1 ON P.Player_ID = S1.Player_ID AND S1.Season_ID = 1
 JOIN Player_Stats S10 ON P.Player_ID = S10.Player_ID AND S10.Season_ID = 10
 WHERE (S10.Goals - S1.Goals) > 0
 ORDER BY [IMPROVEMENT] DESC;



 SELECT TOP 5 *
 FROM Player_Stats








 SELECT *
 FROM Player_Stats