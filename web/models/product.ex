defmodule Arteesan.Product do
  use Arteesan.Web, :model

  schema "products" do
    field :title, :string
    field :price, :float
    field :description, :string
    field :likes, :integer
    field :views, :integer
    field :avaliable, :boolean, default: false
    belongs_to :user, Arteesan.User

    timestamps
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :price, :description, :likes, :views, :avaliable])
    |> validate_required([:title, :price, :description, :likes, :views, :avaliable])
  end
end
