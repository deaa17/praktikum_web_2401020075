-- DDL: Buat Database dan Tabel
CREATE DATABASE IF NOT EXISTS praktikum_web_2401020075
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE praktikum_web_2401020075;

CREATE TABLE program_studi (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nama_prodi VARCHAR(100) NOT NULL UNIQUE
) ENGINE=InnoDB;

CREATE TABLE mahasiswa (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nim CHAR(10) NOT NULL UNIQUE,
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    usia TINYINT UNSIGNED NOT NULL,
    program_studi_id BIGINT UNSIGNED NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_mahasiswa_program_studi
        FOREIGN KEY (program_studi_id)
        REFERENCES program_studi(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT chk_usia
        CHECK (usia BETWEEN 17 AND 60)
) ENGINE=InnoDB;

-- DML: Isi dan Olah Data
INSERT INTO program_studi (nama_prodi) VALUES
    ('Teknik Informatika'),
    ('Animasi');

INSERT INTO mahasiswa (nim, nama, email, usia, program_studi_id) VALUES
    ('2401020075', 'Dhiya Zarifa', 'dea@example.com', 20, 1),
    ('2401020076', 'Nisrina', 'nisrina@example.com', 20, 1),
    ('2401020080', 'Budi Santoso', 'budi@example.com', 19, 2),
    ('2401020099', 'Data Sementara', 'sementara@example.com', 18, 2);

UPDATE mahasiswa
SET email = 'dea.update@example.com'
WHERE nim = '2401020075';

DELETE FROM mahasiswa
WHERE nim = '2401020099';

SELECT m.nim, m.nama, m.email, m.usia, p.nama_prodi
FROM mahasiswa AS m
JOIN program_studi AS p ON p.id = m.program_studi_id
ORDER BY m.nim;