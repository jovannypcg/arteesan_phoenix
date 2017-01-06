defmodule Arteesan.Repo.Migrations.Users do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :first_name,  :string
      add :email,       :string
      add :password,    :string
      add :token,       :string
      add :provider,    :string
      add :role,        :string, default: "CUSTOMER"
      add :active,      :boolean, default: true

      timestamps
    end

    create unique_index(:users, [:email])
  end
end
