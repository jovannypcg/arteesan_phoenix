defmodule Arteesan.AuthController do
  use Arteesan.Web, :controller
  plug Ueberauth

  def callback(conn, params) do
    IO.puts "================="
    IO.inspect conn.assigns
    IO.puts "================="
    IO.inspect params
  end
end
