defmodule Gather.Chat.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do
    field :content, :string
    belongs_to :user, Gather.Accounts.User
    belongs_to :conversation, Gather.Chat.Conversation

    timestamps()
  end
  
  # Gather.Chat.Message |> Repo.all() |> Repo.preload(:user)
  # message.user.email

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:content])
    |> validate_required([:content])
  end
end
