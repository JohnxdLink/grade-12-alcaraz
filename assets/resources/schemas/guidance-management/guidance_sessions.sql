CREATE TABLE guidance_sessions (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    case_record_id BIGINT UNSIGNED NOT NULL,
    staff_id BIGINT UNSIGNED NOT NULL,
    session_date DATE NOT NULL,
    session_time TIME NOT NULL,
    session_type VARCHAR(64) NOT NULL,
    concern TEXT NULL,
    discussion_summary TEXT NULL,
    intervention TEXT NULL,
    recommendation TEXT NULL,
    follow_up_date DATE NULL,
    status VARCHAR(32) NOT NULL DEFAULT 'completed',
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (id),

    CONSTRAINT fk_guidance_sessions_case
        FOREIGN KEY (case_record_id)
        REFERENCES case_records(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_guidance_sessions_staff
        FOREIGN KEY (staff_id)
        REFERENCES staffs(id)
        ON DELETE RESTRICT
);