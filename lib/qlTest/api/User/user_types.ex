defmodule QlTest.User.Schema.Types do
  use Absinthe.Schema.Notation

# The GraphQL specification requires that type names be unique, TitleCased words. Absinthe does this automatically for us, extrapolating from our type identifier (in this case :post gives us "Post"). If really needed, we could provide a custom type name as a :name option to the object macro.
@desc "A user of the blog"
  object :user do
    field :id, :id
    field :name, :string
    field :email, :string
  end
end
