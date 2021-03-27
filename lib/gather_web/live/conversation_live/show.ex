defmodule GatherWeb.ConversationLive.Show do
  use GatherWeb, :live_view

  alias Gather.Chat

  @impl true
  def mount(_params, %{"user_token" => user_token}, socket) do
    {:ok, assign_new(socket, :current_user, fn ->
      Gather.Accounts.get_user_by_session_token(user_token)
    end)}
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
  
  @impl true
  def handle_event("send_message", %{"message" => message_params}, socket) do
    user = socket.assigns.current_user
    conversation = socket.assigns.conversation

    case Gather.Chat.create_message(user, conversation, message_params) do
      {:ok, new_message} ->
        updated_messages = socket.assigns.messages ++ [new_message]
        {:noreply, assign(socket, :messages, updated_messages)}
        
      {:error, error} ->
        IO.inspect(error)
        {:noreply, socket}
    end
  end

  defp page_title(:show), do: "Show Conversation"
  defp page_title(:edit), do: "Edit Conversation"
end
