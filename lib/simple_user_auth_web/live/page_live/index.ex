defmodule SimpleUserAuthWeb.PageLive do
  use SimpleUserAuthWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(_params, _url, socket) do
    {:noreply, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <main class="flex flex-col items-center justify-center py-24 px-4 min-h-[80vh] text-center">
      <h2 class="text-4xl font-bold text-gray-800 mb-4">Welcome to MyApp</h2>
      <p class="text-lg text-gray-600 mb-8">Your one-stop solution to get started quickly with Phoenix LiveView.</p>
      <.link href="/users/log_in" class="bg-blue-600 text-white px-6 py-3 rounded-lg hover:bg-blue-700 transition">Get Started</.link>
    </main>
    """
  end
end
