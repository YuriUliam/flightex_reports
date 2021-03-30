# Flightex Reports - Challenge!

## Proposal
The proposal for this project is to complete a challenge and pursuant to the knowledge of previous studies.<br>
This project is a continuation of a challenge, differentiated by the generation of reports!

### NOTE
Before you execute any of this commands, you should execute this:
```elixir
iex> Flightex.start_agents()
```

### Flightex.create_user/1
Creates a user, used to make bookings.

```elixir
iex> user_params = %{name: "Aldo", email: "aldo@banana.com", cpf: "12345678911"}
iex> Flightex.create_user(user_params)
...> {:ok, "insert-a-random-generated-uuid-here"}
```

### Flightex.create_booking/1
Same of `build/1`, but waits for a list and builds them in parallel.

#### Success
```elixir
iex> booking_params = %{date: "2021-03-24 22:00:00.000", origin_city: "Sao Paulo", destiny_city: "Guarulhos"}
iex> Flightex.create_booking(user_id, booking_params)
...> {:ok, "insert-a-random-generated-uuid-here"}
```

#### Error
```elixir
iex> Flightex.create_booking("invalid-user-id", booking_params)
...> {:error, "User Not Found"}
```

### Flightex.get_booking/1
Creates a user, used to make bookings.

```elixir
iex> Flightex.get_booking(booking_id)
...> {:ok, "insert-a-random-generated-uuid-here"}
```

## Tests

This project has tests, just enter the command below at your terminal, in the same folder in this project.
```sh
.../flightex> mix test
```