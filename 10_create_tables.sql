-- Connect as ADW_USER (or your target schema) before running

CREATE TABLE IF NOT EXISTS MYTABLE (
  ID            NUMBER,
  NAME          VARCHAR2(200),
  AMOUNT        NUMBER,
  LOAD_TS       TIMESTAMP DEFAULT SYSTIMESTAMP
);
