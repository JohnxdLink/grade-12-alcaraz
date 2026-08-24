CREATE TABLE students (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    school_year_id BIGINT UNSIGNED NOT NULL,
    staff_id BIGINT UNSIGNED NOT NULL,
    account_id BIGINT UNSIGNED NULL,
    lastname VARCHAR(64) NOT NULL,
    firstname VARCHAR(64) NOT NULL,
    middlename VARCHAR(64) NULL,
    section VARCHAR(64) NOT NULL,
    strand VARCHAR(64) NOT NULL,
    contact_no VARCHAR(16) NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (id),

    UNIQUE KEY uq_students_account_id (account_id),
    
    CONSTRAINT fk_students_school_year FOREIGN KEY (school_year_id) REFERENCES school_years(id),
    CONSTRAINT fk_students_staff FOREIGN KEY (staff_id) REFERENCES staffs(id),
    CONSTRAINT fk_students_account FOREIGN KEY (account_id) REFERENCES accounts(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;