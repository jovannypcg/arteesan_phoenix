defmodule Arteesan.User do
  use Arteesan.Web, :model

  schema "users" do
    field :first_name,  :string
    field :email,       :string
    field :password,    :string
    field :token,       :string
    field :provider,    :string
    field :role,        :string
    field :active,      :boolean

    timestamps
  end

  def signup_changeset(data, params \\ %{}) do
    password = Map.get params, "password"
    password = password || ""

    data
    |> cast(params, [:first_name, :email, :password, :role, :active])
    |> validate_required([:first_name, :email, :password])
    |> validate_format(:email, ~r/(\w+)@([\w.]+)/)
    |> validate_length(:password, min: 5)
    |> unique_constraint(:email)
    |> put_change(:password, hashed_password(password))
  end

  def github_changeset(data, params \\ %{}) do
    data
    |> cast(params, [:first_name, :token, :provider, :email, :role, :active])
  end

  def session_changeset(data, params \\ %{}) do
    password = Map.get data, "password"
    password = password || ""

    data
    |> cast(params, [:email, :password])
    |> validate_required([:email, :password])
    |> validate_length(:password, min: 5)
    |> validate_format(:email, ~r/(\w+)@([\w.]+)/)
    |> put_change(:password, hashed_password(password))
  end

  defp hashed_password(password) do
    safe_password = :crypto.hash(:sha256, password)
    |> Base.encode16
    |> String.downcase
  end
end
