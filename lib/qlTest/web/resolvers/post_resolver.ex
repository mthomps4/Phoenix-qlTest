defmodule QlTest.PostResolver do
  alias QlTest.{Post, Repo}

  def all(_args, _info) do
    {:ok, QlTest.Repo.all(Post)}
  end

  def find(%{id: id}, _info) do
    case QlTest.Repo.get(QlTest.Post, id) do
      nil  -> {:error, "Post id #{id} not found"}
      user -> {:ok, user}
    end
  end

  def create(args, _info) do
    %Post{}
    |> Post.changeset(args)
    |> Repo.insert
  end

  def update(%{id: id, post: post_params}, _info) do
    Repo.get!(Post, id)
    |> Post.changeset(post_params)
    |> Repo.update
  end

  def delete(%{id: id}, _info) do
    post = Repo.get!(Post, id)
    case Repo.delete post do
      {:ok, ok} -> IO.inspect(ok)
      {:error, changeset} -> IO.inspect(changeset)
    end
  end

end
