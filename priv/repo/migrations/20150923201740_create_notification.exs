defmodule LocationMapBackend.Repo.Migrations.CreateNotification do
  use Ecto.Migration

  def change do
    create table(:notifications) do
      add :message, :text
      add :latitude, :float
      add :longitude, :float

      timestamps
    end

  end
end
