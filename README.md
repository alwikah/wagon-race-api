# Wagon RACE API

## What this API Does

You can :

- Create a new session for your games to take places
- Start a new game within a session
- Set the result of a game and store it
- Get the results of a game
- Get a list of the games for a session

## API Reference

### Create a new game session
GET `/session/create`

Returns a JSON Object (~ Hash) containing the `id` of the session.

**Example**:

```javascript
{  
  "id": 2,
  "created_at": "2014-07-23T13:50:25.993Z",
  "updated_at": "2014-07-23T13:50:25.993Z"
}
```

### Create a new Game in a Session
POST `/session/:id/game/create`

**Example**:
`POST /session/2/game/create`

The data provided should be:
```javascript
{
  "players": [
    { "name": "Johnny" },
    { "name": "Boris" }
  ]
}
```

It returns an Hash of informations containing the id of the game and the users:

**Example**:

```javascript
{  
   "session_id": 2,
   "game": {  
      "id": 1,
      "winner": null,
      "status": "started",
      "elapsed_time": null,
      "players": [  
         {  
            "id": 1,
            "name": "Johnny"
         },
         {  
            "id": 2,
            "name": "Boris"
         }
      ]
   }
}
```

### Send the result of a game
POST `/game/:id/finish`
Where `:id` is the id of the game.

**Example**:
POST `/game/1/finish`
You must POST with the following data:
```javascript
{
  "winner": 2,
  "elapsed_time": 28
}
```

It returns an Hash of informations about the Game:

**Example**:
```javascript
{  
   "session_id": 2,
   "game": {  
      "id": 1,
      "winner": 2,
      "status": "completed",
      "elapsed_time": 28,
      "players": [  
         {  
            "id": 1,
            "name": "Johnny"
         },
         {  
            "id": 2,
            "name": "Boris"
         }
      ]
   }
}
```

### Get the results of a game
GET `/game/:id/results`
Where `:id` is the id of the game.

**Example**:
GET `/game/1/results`


It returns an Hash of informations about the Game:

**Example**:
```javascript
{  
   "session_id": 2,
   "game": {  
      "id": 1,
      "winner": 2,
      "status": "completed",
      "elapsed_time": 28,
      "players": [  
         {  
            "id": 1,
            "name": "Johnny"
         },
         {  
            "id": 2,
            "name": "Boris"
         }
      ]
   }
}
```

### Get the list of the games for a session
GET `session/:id/games`
Where `:id` is the id of the session.

It returns an Hash with a list of the games ids.

**Example**:
```javascript
{  
  "session_id": 2,
  "games": {  
    "started": [4],
    "completed": [1, 2, 3]
    ]
  }
}
```
