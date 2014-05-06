# Wagon RACE API

## What this API Does

You can :

- Create a new game session
- Start a new game within a session
- Set the result of a new game and store it

## API Reference

- Create a new game session
GET `/game/session/new` # => Creates a new game session
Returns the ID of the session :
Example :
```javascript
{
  status: 200,
  session_id: 1
}
```

- Create a new game in a Session
POST `/game/session/:session_id/new`

The data provided should be :
```javascript
{
  players: [
    { name: "Johnny" },
    { name: "Boris" }
  ]
}
```

It returns an Hash of informations containing the id of the game and the users.
Example :
```javascript
{
  status: 200,
  session_id: 1,
  game: {
    id: 50,
    status: 'started',
    elapsed_time: 0,
    players: [
      { id: 1, name: "Johnny" },
      { id: 2, name: "Boris" }
    ]
  }
}
```

- Send the result of a game
POST `/game/1/results`
You must POST with the following data :
```javascript
{
  winner: 2,
  elapsed_time: '28'
}
```

It returns an Hash of informations about the Game :

```javascript
{
  status: 200,
  session_id: 1,
  game: {
    id: 50,
    status: 'started',
    winner: 2
    elapsed_time: 28,
    players: [
      { id: 1, name: "Johnny" },
      { id: 2, name: "Boris" }
    ]
  }
}
```
