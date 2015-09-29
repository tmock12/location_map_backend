defmodule LocationMapBackend.Notification do
  use LocationMapBackend.Web, :model

  schema "notifications" do
    field :message, :string
    field :latitude, :float
    field :longitude, :float

    timestamps
  end

  @required_fields ~w(message latitude longitude)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
