-- PostgreSQL SQL Dump
-- Converted from MySQL

-- Database: hms

-- Table structure for table "doctors"

CREATE TABLE "doctors" (
  "did" SERIAL PRIMARY KEY,
  "email" VARCHAR(50) NOT NULL,
  "doctorname" VARCHAR(50) NOT NULL,
  "dept" VARCHAR(100) NOT NULL
);

-- Dumping data for table "doctors"

INSERT INTO "doctors" ("did", "email", "doctorname", "dept") VALUES
(1, 'anees@gmail.com', 'anees', 'Cardiologists'),
(2, 'amrutha@gmail.com', 'amrutha bhatta', 'Dermatologists'),
(3, 'aadithyaa@gmail.com', 'aadithyaa', 'Anesthesiologists'),
(4, 'anees@gmail', 'anees', 'Endocrinologists'),
(5, 'aneeqah@gmail.com', 'aneekha', 'corona');

-- Table structure for table "patients"

CREATE TABLE "patients" (
  "pid" SERIAL PRIMARY KEY,
  "email" VARCHAR(50) NOT NULL,
  "name" VARCHAR(50) NOT NULL,
  "gender" VARCHAR(50) NOT NULL,
  "slot" VARCHAR(50) NOT NULL,
  "disease" VARCHAR(50) NOT NULL,
  "time" TIME NOT NULL,
  "date" DATE NOT NULL,
  "dept" VARCHAR(50) NOT NULL,
  "number" VARCHAR(12) NOT NULL,
  "number2" VARCHAR(12)
);

-- Dumping data for table "patients"

INSERT INTO "patients" ("pid", "email", "name", "gender", "slot", "disease", "time", "date", "dept", "number","number2") VALUES
(2, 'anees1@gmail.com', 'anees1 rehman khan', 'Male1', 'evening1', 'cold1', '21:20:00', '2020-02-02', 'ortho11predict', '9874561110','9383828281'),
(5, 'patient@gmail.com', 'patien', 'Male', 'morning', 'fevr', '18:06:00', '2020-11-18', 'Cardiologists', '9874563210','9383828281'),
(7, 'patient@gmail.com', 'anees', 'Male', 'evening', 'cold', '22:18:00', '2020-11-05', 'Dermatologists', '9874563210','9383828281'),
(8, 'patient@gmail.com', 'anees', 'Male', 'evening', 'cold', '22:18:00', '2020-11-05', 'Dermatologists', '9874563210','9383828281'),
(9, 'aneesurrehman423@gmail.com', 'anees', 'Male', 'morning', 'cold', '17:27:00', '2020-11-26', 'Anesthesiologists', '9874563210','9383828281'),
(10, 'anees@gmail.com', 'anees', 'Male', 'evening', 'fever', '16:25:00', '2020-12-09', 'Cardiologists', '9874589654','9383828281'),
(15, 'khushi@gmail.com', 'khushi', 'Female', 'morning', 'corona', '20:42:00', '2021-01-23', 'Anesthesiologists', '9874563210','9383828281'),
(16, 'khushi@gmail.com', 'khushi', 'Female', 'evening', 'fever', '15:46:00', '2021-01-31', 'Endocrinologists', '9874587496','9383828281'),
(17, 'aneeqah@gmail.com', 'aneeqah', 'Female', 'evening', 'fever', '15:48:00', '2021-01-23', 'Endocrinologists', '9874563210','9383828281');

-- Triggers for table "patients"
CREATE OR REPLACE FUNCTION patient_delete_trigger() RETURNS trigger AS $$
BEGIN
  INSERT INTO "trigr" VALUES (DEFAULT, OLD.pid, OLD.email, OLD.name, 'PATIENT DELETED', NOW());
  RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION patient_update_trigger() RETURNS trigger AS $$
BEGIN
  INSERT INTO "trigr" VALUES (DEFAULT, NEW.pid, NEW.email, NEW.name, 'PATIENT UPDATED', NOW());
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION patient_insert_trigger() RETURNS trigger AS $$
BEGIN
  INSERT INTO "trigr" VALUES (DEFAULT, NEW.pid, NEW.email, NEW.name, 'PATIENT INSERTED', NOW());
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER "PatientDelete" BEFORE DELETE ON "patients"
FOR EACH ROW EXECUTE FUNCTION patient_delete_trigger();

CREATE TRIGGER "PatientUpdate" AFTER UPDATE ON "patients"
FOR EACH ROW EXECUTE FUNCTION patient_update_trigger();

CREATE TRIGGER "patientinsertion" AFTER INSERT ON "patients"
FOR EACH ROW EXECUTE FUNCTION patient_insert_trigger();

-- Table structure for table "test"

CREATE TABLE "test" (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR(20) NOT NULL,
  "email" VARCHAR(20) NOT NULL
);

-- Dumping data for table "test"

INSERT INTO "test" ("id", "name", "email") VALUES
(1, 'ANEES', 'ARK@GMAIL.COM'),
(2, 'test', 'test@gmail.com');

-- Table structure for table "trigr"

CREATE TABLE "trigr" (
  "tid" SERIAL PRIMARY KEY,
  FOREIGN KEY (pid) REFERENCES patients(pid),
  "email" VARCHAR(50) NOT NULL,
  "name" VARCHAR(50) NOT NULL,
  "action" VARCHAR(50) NOT NULL,
  "timestamp" TIMESTAMP NOT NULL
);

-- Dumping data for table "trigr"

INSERT INTO "trigr" ("tid", "pid", "email", "name", "action", "timestamp") VALUES
(1, 12, 'anees@gmail.com', 'ANEES', 'PATIENT INSERTED', '2020-12-02 16:35:10'),
(2, 11, 'anees@gmail.com', 'anees', 'PATIENT INSERTED', '2020-12-02 16:37:34'),
(3, 10, 'anees@gmail.com', 'anees', 'PATIENT UPDATED', '2020-12-02 16:38:27'),
(4, 11, 'anees@gmail.com', 'anees', 'PATIENT UPDATED', '2020-12-02 16:38:33'),
(5, 12, 'anees@gmail.com', 'ANEES', 'PATIENT DELETED', '2020-12-02 16:40:40'),
(6, 11, 'anees@gmail.com', 'anees', 'PATIENT DELETED', '2020-12-02 16:41:10'),
(7, 13, 'testing@gmail.com', 'testing', 'PATIENT INSERTED', '2020-12-02 16:50:21'),
(8, 13, 'testing@gmail.com', 'testing', 'PATIENT UPDATED', '2020-12-02 16:50:32'),
(9, 13, 'testing@gmail.com', 'testing', 'PATIENT DELETED', '2020-12-02 16:50:57'),
(10, 14, 'aneeqah@gmail.com', 'aneeqah', 'PATIENT INSERTED', '2021-01-22 15:18:09'),
(11, 14, 'aneeqah@gmail.com', 'aneeqah', 'PATIENT UPDATED', '2021-01-22 15:18:29'),
(12, 14, 'aneeqah@gmail.com', 'aneeqah', 'PATIENT DELETED', '2021-01-22 15:41:48'),
(13, 15, 'khushi@gmail.com', 'khushi', 'PATIENT INSERTED', '2021-01-22 15:43:02'),
(14, 15, 'khushi@gmail.com', 'khushi', 'PATIENT UPDATED', '2021-01-22 15:43:11'),
(15, 16, 'khushi@gmail.com', 'khushi', 'PATIENT INSERTED', '2021-01-22 15:43:37'),
(16, 16, 'khushi@gmail.com', 'khushi', 'PATIENT UPDATED', '2021-01-22 15:43:49'),
(17, 17, 'aneeqah@gmail.com', 'aneeqah', 'PATIENT INSERTED', '2021-01-22 15:44:41'),
(18, 17, 'aneeqah@gmail.com', 'aneeqah', 'PATIENT UPDATED', '2021-01-22 15:44:52'),
(19, 17, 'aneeqah@gmail.com', 'aneeqah', 'PATIENT UPDATED', '2021-01-22 15:44:59');

-- Table structure for table "user"

CREATE TABLE "user" (
  "id" SERIAL PRIMARY KEY,
  "username" VARCHAR(50) NOT NULL,
  "usertype" VARCHAR(50) NOT NULL,
  "email" VARCHAR(50) NOT NULL UNIQUE,
  "password" VARCHAR(1000) NOT NULL
);

-- Dumping data for table "user"

INSERT INTO "user" ("id", "username", "usertype", "email", "password") VALUES
(13, 'anees', 'Doctor', 'anees@gmail.com', 'pbkdf2:sha256:150000$xAKZCiJG$4c7a7e704708f86659d730565ff92e8327b01be5c49a6b1ef8afdf1c531fa5c3'),
(14, 'aneeqah', 'Patient', 'aneeqah@gmail.com', 'pbkdf2:sha256:150000$Yf51ilDC$028cff81a536ed9d477f9e45efcd9e53a9717d0ab5171d75334c397716d581b8'),
(15, 'khushi', 'Patient', 'khushi@gmail.com', 'pbkdf2:sha256:150000$BeSHeRKV$a8b27379ce9b2499d4caef21d9d387260b3e4ba9f7311168b6e180a00db91f22');


--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`did`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trigr`
--
ALTER TABLE `trigr`
  ADD PRIMARY KEY (`tid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `did` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `trigr`
--
ALTER TABLE `trigr`
  MODIFY `tid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
