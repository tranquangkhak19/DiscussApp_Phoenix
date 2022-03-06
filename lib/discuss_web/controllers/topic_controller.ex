defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller
  alias Discuss.Topic

  def new(conn, params) do
    # struct = %Discuss.Topic{}
    # params = %{}
    # changeset = Discuss.Topic.changeset(struct, params)
    changeset = Topic.changeset(%Topic{}, %{})

    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"topic" => topic}) do
    #IO.inspect(params)
    #%{"topic" => topic} = params
  end
end
