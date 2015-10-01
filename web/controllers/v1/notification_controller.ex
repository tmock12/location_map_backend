defmodule LocationMapBackend.V1.NotificationController do
  use LocationMapBackend.Web, :controller
  import Ecto.Queryable

  alias LocationMapBackend.Notification

  plug :scrub_params, "notification" when action in [:create, :update]

  def create(conn, %{"notification" => notification_params}) do
    changeset = Notification.changeset(%Notification{}, notification_params)

    case Repo.insert(changeset) do
      {:ok, notification} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", notification_path(conn, :show, notification))
        |> render("show.json", notification: notification)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(LocationMapBackend.ChangesetView, "error.json", changeset: changeset)
    end
  end

end
