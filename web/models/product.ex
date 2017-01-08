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
    |> upload_thumbnail
  end

  defp upload_thumbnail(changeset) do
    case get_change(changeset, :thumbnail) do
      nil -> changeset
      thumbnail_local_path ->
        thumbnail_local_path
        |> Cloudex.upload
        |> set_thumbnail_from_cloudex(changeset)
    end
  end

  defp set_thumbnail_from_cloudex([ok: %Cloudex.UploadedImage{url: url}], changeset) do
    changeset
    |> put_change(:thumbnail, url)
  end
end
