defmodule Gather.Chat.Conversation do
  use Ecto.Schema
  import Ecto.Changeset

  schema "conversations" do
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(conversation, attrs) do
    conversation
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
