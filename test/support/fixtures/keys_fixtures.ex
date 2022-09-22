defmodule ApiKeysEx.KeysFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ApiKeysEx.Keys` context.
  """

  @doc """
  Generate a key.
  """
  def key_fixture(attrs \\ %{}) do
    {:ok, key} =
      attrs
      |> Enum.into(%{
        counter: 42,
        value: "some value"
      })
      |> ApiKeysEx.Keys.create_key()

    key
  end
end
