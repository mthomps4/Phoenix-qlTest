defmodule QlTest.UserResolver do
  def find(%{id: id}, _info) do
    case QlTest.Repo.get(QlTest.User, id) do
      nil  -> {:error, "User id #{id} not found"}
      user -> {:ok, user}
    end
  end
end
