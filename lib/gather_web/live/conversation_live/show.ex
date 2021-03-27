defmodule GatherWeb.ConversationLive.Show do
  use GatherWeb, :live_view

  alias Gather.Chat

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    conversation = Chat.get_conversation!(id)

    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:conversation, conversation)
     |> assign(:messages, Chat.list_messages(conversation))}
  end

  defp page_title(:show), do: "Show Conversation"
  defp page_title(:edit), do: "Edit Conversation"
end
