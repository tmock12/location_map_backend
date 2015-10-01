defmodule LocationMapBackend.V1.NotificationControllerTest do
  use LocationMapBackend.ConnCase

  alias LocationMapBackend.Notification
  @valid_attrs %{latitude: "120.5", longitude: "120.5", message: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, v1_notification_path(conn, :create), notification: @valid_attrs
    assert json_response(conn, 201)["notification"]["id"]
    assert Repo.get_by(Notification, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, v1_notification_path(conn, :create), notification: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end
end
