defmodule LocationMapBackend.NotificationController do
  use LocationMapBackend.Web, :controller

  alias LocationMapBackend.Notification

  def show(conn, %{"id" => id}) do
    notification = Repo.get!(Notification, id)
    render(conn, "show.html", notification: notification)
  end

end
