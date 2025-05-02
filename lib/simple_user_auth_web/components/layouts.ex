defmodule SimpleUserAuthWeb.Layouts do
  @moduledoc """
  This module holds different layouts used by your application.

  See the `layouts` directory for all templates available.
  The "root" layout is a skeleton rendered as part of the
  application router. The "app" layout is set as the default
  layout on both `use SimpleUserAuthWeb, :controller` and
  `use SimpleUserAuthWeb, :live_view`.
  """
  use SimpleUserAuthWeb, :html

  embed_templates "layouts/*"

  def landing_header(assigns) do
    assigns = assign_new(assigns, :current_user, fn -> nil end)

    ~H"""
    <header class="bg-white shadow-md">
    <ul class="py-4 relative z-10 flex items-center gap-4 px-4 sm:px-6 lg:px-8 justify-end">
      <%= if @current_user do %>
        <li class="text-[0.8125rem] leading-6 text-zinc-900">
          {@current_user.email}
        </li>
        <li>
          <.link
            href={~p"/users/settings"}
            class="text-[0.8125rem] leading-6 text-zinc-900 font-semibold hover:text-zinc-700"
          >
            Settings
          </.link>
        </li>
        <li>
          <.link
            href={~p"/users/log_out"}
            method="delete"
            class="text-[0.8125rem] leading-6 text-zinc-900 font-semibold hover:text-zinc-700"
          >
            Log out
          </.link>
        </li>
      <% else %>
        <li>
          <.link
            href={~p"/users/register"}
            class="text-[0.8125rem] leading-6 text-zinc-900 font-semibold hover:text-zinc-700"
          >
            Register
          </.link>
        </li>
        <li>
          <.link
            href={~p"/users/log_in"}
            class="text-[0.8125rem] leading-6 text-zinc-900 font-semibold hover:text-zinc-700"
          >
            Log in
          </.link>
        </li>
      <% end %>
    </ul>
    </header>
    """
  end

  def footer(assigns) do
    ~H"""
    <footer class="absolute bottom-0 w-full bg-white shadow-inner mt-auto py-4">
      <div class="max-w-7xl mx-auto px-4 text-sm text-gray-500 text-center">
        © 2025 MyApp. All rights reserved.
      </div>
    </footer>
    """
  end

end
