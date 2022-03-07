defmodule Discuss.AuthController do
  use DiscussWeb, :controller
  plug Ueberauth

  alias Discuss.User

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, params) do
    user_params = %{token: auth.credentials.token, email: auth.info.email, provider:"github"}
    changeset = User.changeset(%User{}, user_params)

    insert_or_update(changeset)
  end

  defp insert_or_update_user(changeset) do
    case Repo.get_by(User, email: changset.changes.email) do
      nil ->
        Repo.insert(changeset) #Inserted with succes -> return {:ok, struct}
      user ->
        {:ok, user} #same type with the above case
    end
  end
end
