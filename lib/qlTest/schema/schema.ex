defmodule QlTest.Schema do
  use Absinthe.Schema

  import_types QlTest.Post.Schema.Types
  import_types QlTest.User.Schema.Types

  query do
    @desc "Get all blog posts"
    field :posts, list_of(:post) do
      resolve &QlTest.PostResolver.all/2
    end

    @desc "Get a post by ID"
    field :post, type: :post do
      arg :id, non_null(:id)
      resolve &QlTest.PostResolver.find/2
    end

    @desc "Get all users"
    field :users, list_of(:user) do
      resolve &QlTest.UserResolver.all/2
    end

    @desc "Get a user of the blog"
    field :user, type: :user do
      arg :id, non_null(:id)
      resolve &QlTest.UserResolver.find/2
    end
  end

  input_object :update_post_params do
    field :title, non_null(:string)
    field :body, non_null(:string)
  end

  mutation do
    @desc "Create a post"
    field :create, type: :post do
      arg :title, non_null(:string)
      arg :body, non_null(:string)
      resolve &QlTest.PostResolver.create/2
    end

    @desc "Update a post"
    field :update, type: :post do
      arg :id, non_null(:string)
      arg :post, :update_post_params
      resolve &QlTest.PostResolver.update/2
    end

    @desc "Delete a Post"
    field :delete, type: :post do
      arg :id, non_null(:string)
      resolve &QlTest.PostResolver.delete/2
    end
  end


  @doc """
  {
    users{
      id
      name
      email
    }
  }

  {
    user(id:"59513b1906d226254a908362"){
      name
      email
      id
    }
  }

  {
  posts{
  title
  body
  id
  }
}

{
  post(id:"59514b96de395d1deaa3608c"){
    title
    body
    id
  }
}

mutation UpdatePost {
update(id: "59514b96de395d1deaa3608c", post: {title: "My Updated Post Title", body: "Updated Body"}) {
      id,
      title,
      body
    }
  }

mutation DeletePost {
    delete(id: "59514b96de395d1deaa3608c") {
      id
      }
    }

mutation CreatePost {
  create(title: "My Post Title", body: "Awesome Post") {
    id
    title
    body
  }
}

"""
end
