defmodule QlTest.PostResolver do
  def all(_args, _info) do
    {:ok, QlTest.Repo.all(QlTest.Post)}
  end
end
