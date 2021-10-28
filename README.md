# Docker compose for PMK

Copy the file .env.eample to .env with command and update evironment variable value if need
```sh
    $ cp .env.example .env
```

Copy all source code of project and paste it into the pmk folder.
Copy database dump file have extension sql and paste into pmk folder.

Run:
```sh
    $ docker-compose up -d
```

After docker compose run successfully. We need to config and import database of project.
```sh
    $ docker exec -it <msql_container_name> bash
    $ mysql -uroot -p<root_password> 
    
    mysql> USE pmk
    mysql> source /docker-entrypoint-initdb.d/<db_dump_name>.sql
```

Use  http://localhost to access `project side`
Use http://localhost:8080 to access `phpmyadmin` 