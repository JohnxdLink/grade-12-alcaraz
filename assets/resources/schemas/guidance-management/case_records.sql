CREATE TABLE case_records (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    student_id BIGINT UNSIGNED NOT NULL,
    concern_id BIGINT UNSIGNED NOT NULL,
    opened_by BIGINT UNSIGNED NOT NULL,
    opened_date DATE NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT NULL,
    priority VARCHAR(32) NOT NULL DEFAULT 'normal',
    status VARCHAR(32) NOT NULL DEFAULT 'open',
    closed_date DATE NULL,
    closing_remarks TEXT NULL,
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (id),

    CONSTRAINT fk_case_records_student FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
    CONSTRAINT fk_case_records_concern FOREIGN KEY (concern_id) REFERENCES guidance_concerns(id) ON DELETE RESTRICT,
    CONSTRAINT fk_case_records_opened_by FOREIGN KEY (opened_by) REFERENCES staffs(id) ON DELETE RESTRICT
);