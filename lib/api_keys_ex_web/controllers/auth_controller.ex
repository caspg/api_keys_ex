defmodule ApiKeysExWeb.AuthController do
  use ApiKeysExWeb, :controller

  def show(conn, _params) do
    api_key =
      Plug.Conn.get_req_header(conn, "x-original-uri")
      |> List.first()
      |> parse_uri()
      |> get_api_key()

    with {:ok, api_key_value} <- api_key,
         {:ok, key} <- get_key_record(api_key_value) do
      update_counter(key)
      send_resp(conn, :no_content, "")
    else
      nil -> send_resp(conn, :unauthorized, "")
    end
  end

  def parse_uri(nil), do: nil
  def parse_uri(uri), do: URI.new!(uri)

  defp get_api_key(nil), do: nil
  defp get_api_key(%URI{query: nil}), do: nil

  defp get_api_key(%URI{query: query}) do
    api_key =
      query
      |> URI.decode_query()
      |> Map.get("key")

    {:ok, api_key}
  end

  def get_key_record(api_key_value) do
    case ApiKeysEx.Keys.get_by_value(api_key_value) do
      nil -> nil
      key -> {:ok, key}
    end
  end

  def update_counter(%{id: key_id}) do
    ApiKeysEx.Keys.increment_counter(key_id)
  end
end
