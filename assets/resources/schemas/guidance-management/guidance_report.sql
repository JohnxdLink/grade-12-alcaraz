CREATE TABLE guidance_reports (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    staff_id BIGINT UNSIGNED NOT NULL,
    report_type VARCHAR(64) NOT NULL,
    report_title VARCHAR(255) NOT NULL,
    date_from DATE NOT NULL,
    date_to DATE NOT NULL,
    generated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (id),

    CONSTRAINT fk_guidance_reports_staff FOREIGN KEY (staff_id) REFERENCES staffs(id) ON DELETE RESTRICT
);