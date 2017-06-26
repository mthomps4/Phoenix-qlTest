## IF POSSIBLE Import into Schema.ex and avoid Long A File
#
#
# defmodule QlTest.User.Schema do
#   use Absinthe.Schema
#
#   import_types QlTest.User.Schema.Types
#
#   query do
#
#     @desc "Get all users"
#     field :users, list_of(:user) do
#       resolve &QlTest.UserResolver.all/2
#     end
#
#     @desc "Get a user of the blog"
#     field :user, type: :user do
#       arg :id, non_null(:id)
#       resolve &QlTest.UserResolver.find/2
#     end
#   end
#
# end
