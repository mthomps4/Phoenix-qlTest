defmodule QlTest.Post do
  use Ecto.Schema

  @primary_key {:_id, :binary_id, autogenerate: true}
  schema "posts" do
    field :name, :string
    field :body, :string
    field :author, :string
  end

end
