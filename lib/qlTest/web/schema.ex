defmodule QlTest.Schema do
  use Absinthe.Schema

  import_types QlTest.Schema.Types

  query do
    field :posts, list_of(:post) do
      resolve &QlTest.PostResolver.all/2
    end
  end

end
