CREATE DATABASE RAEDAM;
USE RAEDAM;

CREATE TABLE PETUGASPARKIR ( 
	idPetugas MEDIUMINT PRIMARY KEY,
    namaPetugas VARCHAR(15) NOT NULL,
    noHpPetugas VARCHAR(15) NOT NULL,
    usernamePetugas VARCHAR(15) NOT NULL,
    passwordPetugas VARCHAR(15) NOT NULL
);

CREATE TABLE PENGATURANPARKIR(
	idPengaturan MEDIUMINT PRIMARY KEY,
    tarifParkirMobilPerJam MEDIUMINT NOT NULL,
    tarifParkirMotorPerJam MEDIUMINT NOT NULL,
    tarifParkirMobilPerHari MEDIUMINT NOT NULL,
    tarifParkirMotorPerHari MEDIUMINT,
    kuotaParkirMotor MEDIUMINT NOT NULL,
    kuotaParkirMobil MEDIUMINT NOT NULL,
    waktuAtur DATETIME NOT NULL
);

CREATE TABLE PARKIRPERJAM(
	idParkirPerJam MEDIUMINT PRIMARY KEY,
    waktuMasuk DATETIME NOT NULL,
    waktuKeluar DATETIME
);

CREATE TABLE PARKIRINAP(
	idParkirInap MEDIUMINT PRIMARY KEY,
    tanggalMasuk DATE NOT NULL,
    tanggalKeluar DATE 
);

CREATE TABLE PARKIR (
    idParkir MEDIUMINT PRIMARY KEY,
    idPengaturan MEDIUMINT NOT NULL,
    nomorKendaraan VARCHAR(12) NOT NULL,
    jenisKendaraan VARCHAR(5) NOT NULL,
    tipeParkir VARCHAR(7) NOT NULL,
    statusParkir VARCHAR(7) NOT NULL,
    idParkirPerJam MEDIUMINT,
    idParkirInap MEDIUMINT,
    CONSTRAINT FOREIGN KEY (idPengaturan) REFERENCES PENGATURANPARKIR(idPengaturan),
    CONSTRAINT FOREIGN KEY (idParkirPerJam) REFERENCES PARKIRPERJAM(idParkirPerJam),
    CONSTRAINT FOREIGN KEY (idParkirInap) REFERENCES PARKIRINAP(idParkirInap)
);

CREATE TABLE PEMBAYARAN (
	idPembayaran MEDIUMINT PRIMARY KEY,
    idParkir MEDIUMINT NOT NULL,
    waktuPembayaran DATETIME NOT NULL,
    totalBayar MEDIUMINT NOT NULL,
    idPetugas MEDIUMINT,
    CONSTRAINT FOREIGN KEY (idParkir) REFERENCES PARKIR(idParkir),
    CONSTRAINT FOREIGN KEY (idPetugas) REFERENCES PETUGASPARKIR(idPetugas)
);

INSERT INTO PETUGASPARKIR (idPetugas, namaPetugas, noHpPetugas, usernamePetugas, passwordPetugas) VALUES ('1', 'Junanda', '081240006090', 'Junanda', '1123');
INSERT INTO PETUGASPARKIR (idPetugas, namaPetugas, noHpPetugas, usernamePetugas, passwordPetugas) VALUES ('2', 'Kemal', '081340006090', 'Kemal', '2323');
INSERT INTO PETUGASPARKIR (idPetugas, namaPetugas, noHpPetugas, usernamePetugas, passwordPetugas) VALUES ('3', 'Wahyu', '085240006090', 'Wahyu', '0070');
INSERT INTO PETUGASPARKIR (idPetugas, namaPetugas, noHpPetugas, usernamePetugas, passwordPetugas) VALUES ('4', 'Lintang', '085340006090', 'Lintang', '6969');
INSERT INTO PETUGASPARKIR (idPetugas, namaPetugas, noHpPetugas, usernamePetugas, passwordPetugas) VALUES ('5', 'Alif', '082240006090', 'Alif', '1001');

INSERT INTO PENGATURANPARKIR (idPengaturan, tarifParkirMobilPerJam, tarifParkirMotorPerJam, tarifParkirMotorPerHari, 
tarifParkirMobilPerHari, kuotaParkirMobil, kuotaParkirMotor, waktuAtur) VALUES ('1', 5000, 3000, 15000, 25000, 50, 80, '2023-10-01 07:00:00');
INSERT INTO PENGATURANPARKIR (idPengaturan, tarifParkirMobilPerJam, tarifParkirMotorPerJam, tarifParkirMotorPerHari, 
tarifParkirMobilPerHari, kuotaParkirMobil, kuotaParkirMotor, waktuAtur) VALUES ('2', '5000', '2000', 17500, 27000, 50, 80, '2023-11-01 07:00:00');
INSERT INTO PENGATURANPARKIR (idPengaturan, tarifParkirMobilPerJam, tarifParkirMotorPerJam, tarifParkirMotorPerHari, 
tarifParkirMobilPerHari, kuotaParkirMobil, kuotaParkirMotor, waktuAtur) VALUES ('3', '4000', '2000', 12500, 22500, 50, 80, '2023-12-01 07:00:00');

INSERT INTO PARKIRPERJAM (idParkirPerJam, waktuMasuk) VALUES (1, '2023-11-01 06:00:00');
INSERT INTO PARKIRPERJAM (idParkirPerJam, waktuMasuk) VALUES (2, '2023-11-01 07:00:00');
INSERT INTO PARKIRPERJAM (idParkirPerJam, waktuMasuk) VALUES (3, '2023-11-01 08:00:00');
INSERT INTO PARKIRPERJAM (idParkirPerJam, waktuMasuk) VALUES (4, '2023-11-02 05:00:00');
INSERT INTO PARKIRPERJAM (idParkirPerJam, waktuMasuk) VALUES (5, '2023-11-05 06:00:00');

INSERT INTO PARKIRINAP (idParkirInap, tanggalMasuk) VALUES (1, '2023-11-01');
INSERT INTO PARKIRINAP (idParkirInap, tanggalMasuk) VALUES (2, '2023-11-02');
INSERT INTO PARKIRINAP (idParkirInap, tanggalMasuk) VALUES (3, '2023-11-03');
INSERT INTO PARKIRINAP (idParkirInap, tanggalMasuk) VALUES (4, '2023-11-04');
INSERT INTO PARKIRINAP (idParkirInap, tanggalMasuk) VALUES (5, '2023-11-05');

INSERT INTO parkir (idParkir, nomorKendaraan, jenisKendaraan, tipeParkir, statusParkir, idPengaturan, idParkirPerJam) 
VALUES  (1, 'A 563 VC', 'Mobil', 'PerJam', 'PARKIR', 1, 1);
INSERT INTO parkir (idParkir, nomorKendaraan, jenisKendaraan, tipeParkir, statusParkir, idPengaturan, idParkirPerJam) 
VALUES (2, 'AG 1 VA', 'Motor', 'PerJam', 'PARKIR', 2, 2);
INSERT INTO parkir (idParkir, nomorKendaraan, jenisKendaraan, tipeParkir, statusParkir, idPengaturan, idParkirPerJam) 
VALUES (3, 'Y 6665 KI', 'Mobil', 'PerJam', 'PARKIR', 3, 3);
INSERT INTO parkir (idParkir, nomorKendaraan, jenisKendaraan, tipeParkir, statusParkir, idPengaturan, idParkirPerJam) 
VALUES (4, 'Z 6665 KI', 'Mobil', 'PerJam', 'PARKIR', 3, 4);
INSERT INTO parkir (idParkir, nomorKendaraan, jenisKendaraan, tipeParkir, statusParkir, idPengaturan, idParkirPerJam) 
VALUES (5, 'D 6665 KI', 'Mobil', 'PerJam', 'PARKIR', 3, 5);
INSERT INTO parkir (idParkir, nomorKendaraan, jenisKendaraan, tipeParkir, statusParkir, idPengaturan, idParkirInap) 
VALUES (6, 'G 3432 YS', 'Motor', 'Inap', 'PARKIR', 3, 1);
INSERT INTO parkir (idParkir, nomorKendaraan, jenisKendaraan, tipeParkir, statusParkir, idPengaturan, idParkirInap) 
VALUES (7, 'H 2132 YS', 'Motor', 'Inap', 'PARKIR', 3, 2);
INSERT INTO parkir (idParkir, nomorKendaraan, jenisKendaraan, tipeParkir, statusParkir, idPengaturan, idParkirInap) 
VALUES (8, 'I 5132 YS', 'Motor', 'Inap', 'PARKIR', 3, 3);
INSERT INTO parkir (idParkir, nomorKendaraan, jenisKendaraan, tipeParkir, statusParkir, idPengaturan, idParkirInap) 
VALUES (9, 'J 1232 YS', 'Motor', 'Inap', 'PARKIR', 3, 4);
INSERT INTO parkir (idParkir, nomorKendaraan, jenisKendaraan, tipeParkir, statusParkir, idPengaturan, idParkirInap) 
VALUES (10, 'K 4432 YS', 'Motor', 'Inap', 'PARKIR', 3, 5);

UPDATE PARKIRPERJAM SET waktuKeluar = '2023-11-01 07:00:00' WHERE idParkirPerJam = 1;
UPDATE PARKIRPERJAM SET waktuKeluar = '2023-11-01 08:00:00' WHERE idParkirPerJam = 2;
UPDATE PARKIRPERJAM SET waktuKeluar = '2023-11-01 09:00:00' WHERE idParkirPerJam = 3;
UPDATE PARKIRPERJAM SET waktuKeluar = '2023-11-02 08:00:00' WHERE idParkirPerJam = 4;
UPDATE PARKIRPERJAM SET waktuKeluar = '2023-11-02 16:00:00' WHERE idParkirPerJam = 5;

UPDATE PARKIRINAP SET tanggalKeluar = '2023-11-03' WHERE idParkirInap = 1;
UPDATE PARKIRINAP SET tanggalKeluar = '2023-11-05' WHERE idParkirInap = 2;
UPDATE PARKIRINAP SET tanggalKeluar = '2023-11-07' WHERE idParkirInap = 3;
UPDATE PARKIRINAP SET tanggalKeluar = '2023-11-09' WHERE idParkirInap = 4;
UPDATE PARKIRINAP SET tanggalKeluar = '2023-11-11' WHERE idParkirInap = 5;

INSERT INTO PEMBAYARAN (idPembayaran, idParkir, waktuPembayaran, totalBayar, idPetugas) VALUES (1, 1, '2023-11-01 07:00:00', 5000, 1);
INSERT INTO PEMBAYARAN (idPembayaran, idParkir, waktuPembayaran, totalBayar, idPetugas) VALUES (2, 2, '2023-11-01 08:00:00', 2000, 3);
INSERT INTO PEMBAYARAN (idPembayaran, idParkir, waktuPembayaran, totalBayar, idPetugas) VALUES (3, 3, '2023-11-01 09:00:00', 4000, 2);
INSERT INTO PEMBAYARAN (idPembayaran, idParkir, waktuPembayaran, totalBayar, idPetugas) VALUES (4, 4, '2023-11-02 08:00:00', 12000, 4);
INSERT INTO PEMBAYARAN (idPembayaran, idParkir, waktuPembayaran, totalBayar, idPetugas) VALUES (5, 5, '2023-11-02 16:30:00', 40000, 2);
INSERT INTO PEMBAYARAN (idPembayaran, idParkir, waktuPembayaran, totalBayar, idPetugas) VALUES (6, 6, '2023-11-03 09:30:00', 37500, 5);
INSERT INTO PEMBAYARAN (idPembayaran, idParkir, waktuPembayaran, totalBayar, idPetugas) VALUES (7, 7, '2023-11-05 09:30:00', 37500, 5);
INSERT INTO PEMBAYARAN (idPembayaran, idParkir, waktuPembayaran, totalBayar, idPetugas) VALUES (8, 8, '2023-11-07 09:30:00', 50000, 4);
INSERT INTO PEMBAYARAN (idPembayaran, idParkir, waktuPembayaran, totalBayar, idPetugas) VALUES (9, 9, '2023-11-09 09:30:00', 62500, 1);
INSERT INTO PEMBAYARAN (idPembayaran, idParkir, waktuPembayaran, totalBayar, idPetugas) VALUES (10, 10, '2023-11-11 09:30:00', 75000, 3);
