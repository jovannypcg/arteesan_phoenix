defmodule Arteesan.User do
  use Arteesan.Web, :model

  schema "users" do
    field :first_name,  :string
    field :email,       :string
    field :password,    :string
    field :role,        :string
    field :active,      :boolean

    timestamps
  end

  def changeset(data, params \\ %{}) do
    data
    |> cast(params, [:first_name, :email, :password, :role, :active])
    |> validate_required([:first_name, :email, :password])
    |> validate_format(:email, ~r/(\w+)@([\w.]+)/)
    |> unique_constraint(:email)
  end

  def login_changeset(data, params \\ %{}) do
    data
    |> cast(params, [:email, :password])
    |> validate_required([:email, :password])
    |> validate_format(:email, ~r/(\w+)@([\w.]+)/)
  end
end
