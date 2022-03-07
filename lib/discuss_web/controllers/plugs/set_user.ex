defmodule Discuss.Plugs.SetUser do
  import Plug.Conn
  import Phoenix.Controller
  alias Discuss.Repo
  alias Discuss.User
  alias Discuss.Router.Helpers

  def init(_params) do
  end

  #the second parameter of call() function is the return value of init() function
  def call(conn, _params) do
    user_id = get_session(conn, :user_id)

    cond do
      # user = second param
      user = user_id && Repo.get(User, user_id) ->
        # assign property is user for assigning data
        # that we want to carray along inside of our connection
        assign(conn, :user, user) #equal: conn.assigns.user => user struct
      true ->
        assign(conn, :user, nil)
      #return conn
    end
  end
end
