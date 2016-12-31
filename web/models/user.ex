defmodule Arteesan.User do
  use Arteesan.Web, :model

  schema "users" do
    field :first_name,  :string
    field :email,       :string
    field :password,    :string
    field :role,        :string
    field :active,      :boolean
  end
end
