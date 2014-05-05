# Wagon RACE API

## What this API Does

You can :

- Create a new game session
- Set the result of a new game and store it
- Start a new game within a session
- Get a unique URL that hows them the results of a particular game.
  - This UURL must be given after each game.

## API Reference

- Create a new game session
get `/game/session/new` # => Creates a new game session
Returns the ID of the session :
Example :
```json
{
  status: 200,
  session_id: 1
}
```

- Create a new game in a Session
POST `/game/session/:session_id/new`

The data provided should be :
```JSON
{
  players: [
    { name: "Johnny" },
    { name: "Boris" }
  ]
}
```

It returns an Hash of information containing the id of the game and the users.
Example :
```json
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

- Set the result of a game
POST `/game/1/results`
```JSON
{
  winner: 2,
  elapsed_time: '28'
}
```

Returns a unique URL to see the results of a session
