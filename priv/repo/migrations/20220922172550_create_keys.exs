defmodule ApiKeysEx.Repo.Migrations.CreateKeys do
  use Ecto.Migration

  def change do
    create table(:keys) do
      add(:value, :string, null: false)
      add(:counter, :bigint, null: false, default: 0)

      timestamps()
    end

    # create index(:keys, :value, unique: true)
  end
end
