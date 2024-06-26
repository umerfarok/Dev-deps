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
            phone_number VARCHAR(255),
            cnic VARCHAR(255),
            request_date VARCHAR(255),
            status VARCHAR(255),
            address VARCHAR(255),
            country VARCHAR(255),
            branch_code VARCHAR(255),
            bank_name VARCHAR(255),
            image_urls VARCHAR(255)[]
        );

        CREATE INDEX seller_access_requests_user_id_idx ON maxstore.seller_access_requests (user_id, user_email, status);
    END IF;
END $$;