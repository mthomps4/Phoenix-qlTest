defmodule QlTest.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias QlTest.Post

  @primary_key {:_id, :id, autogenerate: true}
  schema "posts" do
    field :title, :string
    field :body, :string
  end

  def changeset(post, params \\ %{}) do
    post
    |> cast(params, [:title, :body])
    |> validate_required([:title, :body])
  end

end
