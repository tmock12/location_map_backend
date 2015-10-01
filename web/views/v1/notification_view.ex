defmodule LocationMapBackend.V1.NotificationView do
  use LocationMapBackend.Web, :view

  def render("index.json", %{notifications: notifications}) do
    %{data: render_many(notifications, LocationMapBackend.V1.NotificationView, "notification.json")}
  end

  def render("show.json", %{notification: notification}) do
    %{notification: render_one(notification, LocationMapBackend.V1.NotificationView, "notification.json")}
  end

  def render("notification.json", %{notification: notification}) do
    %{message: notification.message,
      latitude: notification.latitude,
      longitude: notification.longitude,
      id: notification.id,
      url: notification_url(LocationMapBackend.Endpoint, :show, notification.id)}
  end
end
