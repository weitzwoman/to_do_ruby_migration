# _To Do List Application_

#### _A web application to save tasks within lists. Exercise to use Ruby, Sinatra and active record; week four of Epicodus Ruby, 12/12/2016_

#### By _**Tracie Weitzman and Michael Andrade**_

## Specifications

#### 1. Adds List items as Class object and Saves them to a Database
* _Name_

#### 2. Adds Tasks as Class object and Saves them to a Database
* _Task_

## Setup/Installation Requirements

_Works in any web browser. To run To Do List Application, in command line run:_

```
$ git clone https://github.com/weitzwoman/to_do_ruby_migration
$ cd to_do_list_ruby
$ postgres
$ bundle
$ ruby app.rb
```

```
In PSQL:
CREATE DATABASE to_do;
CREATE TABLE lists (id serial PRIMARY KEY, name varchar);
CREATE TABLE tasks (id serial PRIMARY KEY, description varchar);
```

_Navigate to `localhost:4567` in browser._

## Support and contact details

_Contact us on Github at [weitzwoman](https://github.com/weitzwoman) and [JPCodes](https://github.com/JPCodes)_

## Technologies Used

* _HTML_
* _CSS_
  * _Bootstrap_
* _Application: Ruby_
  * _Sinatra_
* _Testing: Rspec, Capybara_
* _Database: Postgres_


### License

To Do List App is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

To Do List App is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with the To Do List App. If not, see http://www.gnu.org/licenses/.

Copyright (c) 2016 **_Tracie Weitzman and Jim Padilla_**
