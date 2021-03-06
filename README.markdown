# Blahg API

Installation
------------

First [install MongoDB](http://docs.mongodb.org/manual/tutorial/install-mongodb-on-os-x/)

```bash
brew update
brew install mongodb
ln -sfv /usr/local/opt/mongodb/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist
sudo mkdir -p /data/db 
# Start a database server running in a different tab in your terminal
mongod
# Check if installation was successful in a separate tab
# If an interactive mongo shell opens, then it is
mongo
exit
```

Next, clone the app and run it locally:

```bash
git clone git@github.com:Ada-Developers-Academy/blahg-api.git
cd blahg-api
bundle
rake db:seed
rails server
```

Deploy
------

```bash
heroku create <name-of-app>
heroku addons:add mongolab:sandbox
```

Usage
-----

##### `GET /posts`
<small><b>Returns an array of Posts</b></small>

```json
[
  {
    "content": "Lorem Ipsum",
    "date": "2015-01-07T00:00:00.000Z",
    "id": "54ad8bba6f69fd0002000001",
    "tag_ids": [],
    "title": "Test"
  }
]
```
---------
##### `GET /posts/:id`
<small><b>Returns a Post with associated Tags</b></small>

```json
{
  "id": "54ac150d7115a44ac9000001",
  "tags": [
    {
      "id": "54ad73232781456703000001",
      "name": "yum"
    }
  ]
}
```

------

##### `POST /posts`
<small><b>Creates a Post</b></small>
Accepted values:

|Key|Type|
|:--|:--:|
|post[title]|String|
|post[content]|String|
|post[date]|Time|

-------

##### `DELETE /posts/:id`
<small><b>Deletes a Post</b></small>
--------
##### `POST /posts/:post_id/tags`

<small><b>Find or creates a tag while adding it to a Post</b></small>

|Key|Type|
|:--|:---:|
|tag[name]|String|

-------
##### `DELETE /posts/:post_id/tags/:id`
<small><b>Removes a Tag from a Post</b></small>
-------
##### `GET /tags`
<small><b>Returns all Tags</b></small>

```json
[
  {
    "id": "54ad8d8d6f69fd0002000003",
    "name": "Yum"
  }
]
```
##### `GET /tags/:id`
<small><b>Returns a Tag</b></small>

```json

{
  "id": "54ad8d8d6f69fd0002000003",
  "name": "Yum"
}

```
------
##### `POST /tags`

<small><b>Creates a Tag</b></small>

------
##### `DELETE /tags/:id`
<small><b>Deletes a Tag</b></small>
