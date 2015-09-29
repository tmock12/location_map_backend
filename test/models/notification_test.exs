defmodule LocationMapBackend.NotificationTest do
  use LocationMapBackend.ModelCase

  alias LocationMapBackend.Notification

  @valid_attrs %{latitude: "-4321", longitude: "1234", message: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Notification.changeset(%Notification{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Notification.changeset(%Notification{}, @invalid_attrs)
    refute changeset.valid?
  end
end
