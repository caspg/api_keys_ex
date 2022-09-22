defmodule ApiKeysEx.Keys.Key do
  use Ecto.Schema
  import Ecto.Changeset

  schema "keys" do
    field :counter, :integer
    field :value, :string

    timestamps()
  end

  @doc false
  def changeset(key, attrs) do
    key
    |> cast(attrs, [:value, :counter])
    |> validate_required([:value])
  end
end
