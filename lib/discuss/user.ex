defmodule Discuss.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user" do
    field :username, :string #login in user
    field :email, :string
    field :provider, :string
    field :token, :string

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :provider, :token])
    |> validate_required([:eamil, :provider, :token])
  end
end
