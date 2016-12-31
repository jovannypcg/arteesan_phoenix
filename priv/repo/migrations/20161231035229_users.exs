defmodule Arteesan.Repo.Migrations.Users do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :first_name,  :string
      add :email,       :string
      add :password,    :string
      add :role,        :string, default: "CUSTOMER"
      add :active,      :boolean, default: true

      timestamps()
    end
  end
end
