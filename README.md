# Project Dependencies

This project uses Docker Compose to manage its dependencies. The following services are defined in the `docker-compose.yml` file:

## MongoDB

A MongoDB database is used for data storage. The MongoDB container is named `mongo` and uses the latest MongoDB image. It is configured with a memory limit of 2GB. The data is stored in a volume mapped to `./storage/mongo` on the host.

## TimescaleDB

TimescaleDB is used for time-series data. The TimescaleDB container is named `timescale` and uses the latest TimescaleDB image with PostgreSQL 12. It is configured with a memory limit of 16GB. The data is stored in a volume mapped to `./storage/timescale` on the host.

## Keycloak

Keycloak is used for identity and access management. The Keycloak container is named `keycloak` and uses the `quay.io/keycloak/keycloak:22.0.3` image. It is configured to start in development mode with debug logging enabled. The Keycloak server is accessible on port 8080.

All services are part of the `maxstore` network.

## Environment Variables

The following environment variables need to be set:

- `MONGO_INITDB_ROOT_USERNAME`: The username for the MongoDB root user.
- `MONGO_INITDB_ROOT_PASSWORD`: The password for the MongoDB root user.
- `PG_PASSWORD`: The password for the PostgreSQL user.
- `PG_DB`: The name of the PostgreSQL database.
- `PG_USER`: The username for the PostgreSQL user.

## Health Checks

Health checks are configured for the MongoDB and TimescaleDB services. The MongoDB service is checked by running the `db.adminCommand('ping')` command, and the TimescaleDB service is checked by running the `pg_isready -U postgres` command.

## Logging

Both the MongoDB and TimescaleDB services are configured to use the `json-file` logging driver, with a maximum of 5 log files and a maximum size of 100MB per file.