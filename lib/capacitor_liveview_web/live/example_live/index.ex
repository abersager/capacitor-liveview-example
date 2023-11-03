defmodule CapacitorLiveviewWeb.ExampleLive.Index do
  use CapacitorLiveviewWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{}, _, socket) do
    {:noreply, socket
      |> assign(:page_title, page_title(socket.assigns.live_action))
      |> assign(:date, nil)}
  end

  @impl true
  def handle_event("request_date_picker", _params, socket) do
    {:noreply, push_event(socket, "js-exec", %{
      result_event: "result_date_picker",
      command: ~s"
        window.Capacitor.Plugins.DatetimePicker.present({
            cancelButtonText: 'Cancel',
            doneButtonText: 'Ok',
            mode: 'datetime',
            value: new Date('1995-12-24T02:23:00').toISOString(),
            theme: 'light',
            locale: 'de',
          })"}
    )}
  end

  def handle_event("result_date_picker", %{ "value" => value }, socket) do
    {:ok, date, _utc_offset} = DateTime.from_iso8601(value)
    {:noreply, socket |> assign(:date, Calendar.strftime(date, "%y-%m-%d %I:%M:%S %p"))}
  end

  defp page_title(:index), do: "Example index"
end
