CREATE TABLE allergies
(
    id SERIAL PRIMARY KEY,
    allergic_to VARCHAR NOT NULL,
    reaction VARCHAR NOT NULL,
    notes VARCHAR NOT NULL
);

INSERT INTO allergies
    (allergic_to, reaction, notes)
VALUES
    ('Fish', 'Diarrhea', 'EFW'),
    ('Peanuts', 'Nausea', 'WELCOME'),
    ('Eggs', 'Sneezing', 'GYHH'),
    ('Corn', 'Rashes', 'GGUU'),
    ('Meat', 'Sneezing', 'TY'),
    ('Tree nuts', 'Swelling', 'HELLO THERE'),
    ('Milk', 'Sneezing', 'TEST');

CREATE TABLE vital_signs
(
    id SERIAL PRIMARY KEY,
    date VARCHAR NOT NULL,
    time VARCHAR NOT NULL,
    temperature FLOAT NOT NULL,
    weight FLOAT NOT NULL,
    height FLOAT NOT NULL,
    systolic_bp INTEGER NOT NULL,
    diastolic_bp INTEGER NOT NULL,
    heart_rate INTEGER NOT NULL,
    spo2 INTEGER NOT NULL,
    blood_sugar_level FLOAT NOT NULL,
    after_meal BOOLEAN NOT NULL,
    remark VARCHAR NOT NULL
);

INSERT INTO vital_signs
    (date, time, temperature, weight, height, systolic_bp, diastolic_bp, heart_rate, spo2, blood_sugar_level, after_meal, remark)
VALUES
    ('10/05/2024', '11:29 AM', 36.0, 55.0, 1.6, 90, 80, 92, 98, 72.0, FALSE, 'LOW BLOOD PRESSURE'),
    ('10/05/2024', '09:39 AM', 36.0, 55.0, 1.6, 90, 80, 98, 98, 55.0, FALSE, 'TESTING');