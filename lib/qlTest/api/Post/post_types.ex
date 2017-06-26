defmodule QlTest.Post.Schema.Types do
  use Absinthe.Schema.Notation

@desc "A blog post"
  object :post do
    field :id, :id
    field :title, :string
    field :body, :string
  end


end
