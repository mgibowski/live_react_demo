defmodule LiveReactDemoWeb.ExampleLive do
  use LiveReactDemoWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    schedule_inc_counter()
    {:ok, assign(socket, :counter, 0)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <%= live_react_component("Components.Counters", [serverCounter: @counter], id: "my-component-1") %>
    </div>
    """
  end

  @impl true
  def handle_info(:inc_counter, socket) do
    schedule_inc_counter()
    {:noreply, assign(socket, :counter, socket.assigns.counter + 1)}
  end

  defp schedule_inc_counter() do
    Process.send_after(self(), :inc_counter, 500)
  end
end
