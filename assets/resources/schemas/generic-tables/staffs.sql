CREATE TABLE staffs (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    account_id BIGINT UNSIGNED NOT NULL,
    lastname VARCHAR(64) NOT NULL,
    firstname VARCHAR(64) NOT NULL,
    role VARCHAR(64) NOT NULL DEFAULT 'staff',
    is_adviser TINYINT(1) NOT NULL DEFAULT 0,
    contact_no VARCHAR(16) NOT NULL,
    email VARCHAR(32) NOT NULL UNIQUE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    PRIMARY KEY (id),
    
    UNIQUE KEY uq_staffs_account_id (account_id),
    
    CONSTRAINT fk_staffs_account FOREIGN KEY (account_id) REFERENCES accounts(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
