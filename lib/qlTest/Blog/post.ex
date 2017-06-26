defmodule QlTest.Post do
  use Ecto.Schema

  schema "posts" do
    field :name, :string
    field :body, :string
  end

end
