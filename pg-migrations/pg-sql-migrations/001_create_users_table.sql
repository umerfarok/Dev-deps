DO $$
BEGIN
    IF NOT EXISTS (
        SELECT schema_name 
        FROM information_schema.schemata 
        WHERE schema_name = 'maxstore'
    ) THEN
        EXECUTE 'CREATE SCHEMA maxstore';
    END IF;

    IF NOT EXISTS (
        SELECT FROM pg_tables
        WHERE schemaname = 'maxstore'
        AND tablename = 'seller_access_requests'
    ) THEN
        CREATE TABLE maxstore.seller_access_requests (
            user_id VARCHAR(255),
            user_name VARCHAR(255),
            user_email VARCHAR(255),
            company_name VARCHAR(255),
            cnic VARCHAR(255),
            request_date DATE,
            status VARCHAR(255)
        );
    END IF;
END $$;