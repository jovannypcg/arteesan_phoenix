defmodule Arteesan.Repo.Migrations.CreateProduct do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :title,       :string
      add :price,       :float
      add :description, :string
      add :likes,       :integer
      add :views,       :integer
      add :avaliable,   :boolean, default: true
      add :user_id, references(:users, on_delete: :nothing)

      timestamps
    end

    create index(:products, [:user_id])

  end
end
