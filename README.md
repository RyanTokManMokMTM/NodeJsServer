# Movie Booking demo

### Installation
1. Download Node.js Installer from this link
```
https://nodejs.org/en/download/
```
2. Clone the project
```
$ git clone https://github.com/RyanTokManMokMTM/NodeJsServer.git
```
3. Install mysql and run the sql into you database.
```
https://www.mysql.com/
```
4. Modify the .env file to your own setting 
```
SERVER_HOST = server_host
SERVER_PORT = server_port
DB_HOST = db_host
DB_PORT = db_port
DB_USER = db_user
DB_PASSWORD = db_pw
DB_DATABASE = db
```
5. Install the package you need for this project
```
npm install
```

6. run the server up to your local machine
```
npm run server
```

### There are something need to be fix...
* MySQL Desgin Problem, must be a atomic data for the moivie genre type....
    * Need another table/Schema to storing the genre type
    * Movie Schema need the foreign key(one to many relation ship). A movie can has many genres