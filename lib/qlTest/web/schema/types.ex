defmodule QlTest.Schema.Types do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: QlTest.Repo

# The GraphQL specification requires that type names be unique, TitleCased words. Absinthe does this automatically for us, extrapolating from our type identifier (in this case :post gives us "Post"). If really needed, we could provide a custom type name as a :name option to the object macro.

  object :post do
    field :id, :id
    field :title, :string
    field :body, :string
  end


end
