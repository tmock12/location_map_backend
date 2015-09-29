defmodule LocationMapBackend.NotificationControllerTest do
  use LocationMapBackend.ConnCase

  alias LocationMapBackend.Notification
  @valid_attrs %{latitude: "30.2944444", longitude: "-81.3933333", message: "I'm running late!"}
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "shows chosen resource", %{conn: conn} do
    notification = Repo.insert! %Notification{}
    conn = get conn, notification_path(conn, :show, notification)
    assert html_response(conn, 200) =~ "Show notification"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, notification_path(conn, :show, -1)
    end
  end
end
