DO $$
BEGIN
    IF NOT EXISTS (
        SELECT FROM pg_tables
        WHERE schemaname = 'public'
        AND tablename = 'seller_access_requests'
    ) THEN
        CREATE TABLE seller_access_requests (
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