# Gather

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Taller

Install js packages with `cd assets && npm install && cd ..`

Create database with `mix ecto.create`

Install auth with https://github.com/aaronrenner/phx_gen_auth following instructions.

Then execute generator `mix phx.gen.auth Accounts User users`

Run migration (in terminal or browser) to apply database changes.

Run server `mix phx.server` to see/create users.

Check live view resource generator with `mix help phx.gen.live`.

Generate conversations with `mix phx.gen.live Chat Conversation conversations title:string` and browse `url:4000/conversations`

Add `<li><%= link "Conversations", to: Routes.conversation_index_path(@conn, :index) %></li>` to lib/gather_web/templates/layout/root.html.leex nav links section

Create messages with `mix phx.gen.context Chat Message messages user_id:references:users conversation_id:references:conversations content:text`

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
