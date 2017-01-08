defmodule Arteesan.Product do
  use Arteesan.Web, :model

  schema "products" do
    field :title, :string
    field :price, :float
    field :description, :string
    field :likes, :integer
    field :views, :integer
    field :thumbnail, :string
    field :avaliable, :boolean
    belongs_to :user, Arteesan.User

    timestamps
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :price, :description, :thumbnail])
    |> validate_required([:title, :price, :description, :thumbnail])
  end
end
