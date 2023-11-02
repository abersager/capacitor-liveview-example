defmodule CapacitorLiveview do
  @moduledoc """
  CapacitorLiveview keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  def nodejs_add(numbers) do
    NodeJS.call({"../../../src/js/bridge", :add}, numbers)
  end

  def nodejs_get_photo() do
    NodeJS.call({"../../../src/js/bridge", :getPhoto})
  end
end
