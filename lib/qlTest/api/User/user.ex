defmodule QlTest.User do
  use Ecto.Schema

  @primary_key {:_id, :string, autogenerate: false}
  schema "users" do
    field :name, :string
    field :email, :string
  end

end
