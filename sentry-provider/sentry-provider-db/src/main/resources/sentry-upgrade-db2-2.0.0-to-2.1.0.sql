-- create index for foreign key AUTHZ_OBJ_ID
CREATE INDEX AUTHZ_PATH_FK_IDX ON AUTHZ_PATH (AUTHZ_OBJ_ID);

-- Table SENTRY_USER_DB_PRIVILEGE_MAP for join relationship
CREATE TABLE SENTRY_USER_DB_PRIVILEGE_MAP
(
    USER_ID BIGINT NOT NULL,
    DB_PRIVILEGE_ID BIGINT NOT NULL,
    GRANTOR_PRINCIPAL VARCHAR(128)
);

-- Constraints for table SENTRY_USER_DB_PRIVILEGE_MAP
ALTER TABLE SENTRY_USER_DB_PRIVILEGE_MAP ADD CONSTRAINT SENTRY_USER_DB_PRIVILEGE_MAP_PK PRIMARY KEY (USER_ID,DB_PRIVILEGE_ID);

CREATE INDEX SENTRY_USER_DB_PRIVILEGE_MAP_N50 ON SENTRY_USER_DB_PRIVILEGE_MAP (USER_ID);

CREATE INDEX SENTRY_USER_DB_PRIVILEGE_MAP_N49 ON SENTRY_USER_DB_PRIVILEGE_MAP (DB_PRIVILEGE_ID);

ALTER TABLE SENTRY_USER_DB_PRIVILEGE_MAP ADD CONSTRAINT SENTRY_USER_DB_PRIVILEGE_MAP_FK2 FOREIGN KEY (DB_PRIVILEGE_ID) REFERENCES SENTRY_DB_PRIVILEGE (DB_PRIVILEGE_ID) ;

ALTER TABLE SENTRY_USER_DB_PRIVILEGE_MAP ADD CONSTRAINT SENTRY_USER_DB_PRIVILEGE_MAP_FK1 FOREIGN KEY (USER_ID) REFERENCES SENTRY_USER (USER_ID) ;

-- Version update
UPDATE SENTRY_VERSION SET SCHEMA_VERSION='2.1.0', VERSION_COMMENT='Sentry release version 2.1.0' WHERE VER_ID=1;

