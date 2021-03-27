defmodule Gather.Chat.Conversation do
  use Ecto.Schema
  import Ecto.Changeset

  schema "conversations" do
    field :title, :string
    has_many :messages, Gather.Chat.Message

    timestamps()
  end

  @doc false
  def changeset(conversation, attrs) do
    conversation
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
