defmodule Arteesan.Repo.Migrations.Users do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :first_name,  :string
      add :last_name,   :string
      add :birthdate,   :naive_datetime
      add :picture,     :string, default: ""
      add :email,       :string
      add :password,    :string
      add :status,      :string, default: "ACTIVE"
      add :role,        :string, default: "CUSTOMER"

      timestamps()
    end
  end
end
