# Step 1: Create the replication master

    docker run -d -p 5432:5432 --name postgresql-master \
    -e POSTGRESQL_REPLICATION_MODE=master \
    -e POSTGRESQL_USERNAME=my_user \
    -e POSTGRESQL_PASSWORD=password123 \
    -e POSTGRESQL_DATABASE=my_database \
    -e POSTGRESQL_REPLICATION_USER=my_repl_user \
    -e POSTGRESQL_REPLICATION_PASSWORD=my_repl_password \
    bitnami/postgresql:latest

# Step 2: Create the replication slave1

    docker run -d -p 5433:5432 --name postgresql-slave1 \
      --link postgresql-master:master \
      -e POSTGRESQL_REPLICATION_MODE=slave \
      -e POSTGRESQL_USERNAME=my_user \
      -e POSTGRESQL_PASSWORD=password123 \
      -e POSTGRESQL_MASTER_HOST=master \
      -e POSTGRESQL_MASTER_PORT_NUMBER=5432 \
      -e POSTGRESQL_REPLICATION_USER=my_repl_user \
      -e POSTGRESQL_REPLICATION_PASSWORD=my_repl_password \
      bitnami/postgresql:latest


# Step 2: Create the replication slave2

    docker run -d -p 5434:5432 --name postgresql-slave2 \
      --link postgresql-master:master \
      -e POSTGRESQL_REPLICATION_MODE=slave \
      -e POSTGRESQL_USERNAME=my_user \
      -e POSTGRESQL_PASSWORD=password123 \
      -e POSTGRESQL_MASTER_HOST=master \
      -e POSTGRESQL_MASTER_PORT_NUMBER=5432 \
      -e POSTGRESQL_REPLICATION_USER=my_repl_user \
      -e POSTGRESQL_REPLICATION_PASSWORD=my_repl_password \
      bitnami/postgresql:latest
