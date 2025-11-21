-- Load MYTABLE from OCI Object Storage using DBMS_CLOUD.COPY_DATA
-- Adjust namespace, bucket, and object prefix as needed.

BEGIN
  DBMS_CLOUD.COPY_DATA(
    table_name      => 'MYTABLE',
    credential_name => 'OCI_OS_CRED',
    file_uri_list   => 'https://objectstorage.<region>.oraclecloud.com/n/<namespace>/b/snowflake-exports/o/mytable/',
    format          => json_object(
                         'type' VALUE 'parquet',
                         'skipheaders' VALUE '0'
                       )
  );
END;
/
