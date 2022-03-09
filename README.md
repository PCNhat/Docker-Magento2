# Docker compose for Magento project

This project is written by myself. First of all to practice my docker skills. The second is to share for everyone who needs to install Magento2 on a docker environment with more references.

The images used in the project include:

    - httpd:2.4.51
    - php:7.4.25-fpm
    - phpmyadmin:5.1.1
    - mysql:8.0.27
    - elasticsearch:7.14.2

### How to run this project?
1. Copy the file .env.example to .env with command and update evironment variable value if need
```sh
    $ cp .env.example .env
```

2. Run shell script and wait until it completes
```sh
    ./install.sh
```

### How to access Magento side and database?
Use http://localhost to access `project side`

Use http://localhost:8080 to access `phpmyadmin`

### How to run Magento CLI?
```sh
    $ docker exec -it <php_container_name> bash
    $ bin/magento <command>
```
Example:
```sh
    $ docker exec -it mgt_php bash
    $ bin/magento upgrade
```

I have put the `project` folder in the .gitignore file, if you use this project to develop your own project, please open the .gitignore file and delete it.

_Please contact me if you have any questions. Thank you!_