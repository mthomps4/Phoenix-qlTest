defmodule QlTest.Schema do
  use Absinthe.Schema

  import_types QlTest.Schema.Types

  query do
    @desc "Get all blog posts"
    field :posts, list_of(:post) do
      resolve &QlTest.PostResolver.all/2
    end

    @desc "Get a user of the blog"
    field :user, type: :user do
      arg :id, non_null(:id)
      resolve &QlTest.UserResolver.find/2
    end
  end

end
