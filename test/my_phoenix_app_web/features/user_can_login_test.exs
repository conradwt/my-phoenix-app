defmodule MyPhoenixAppWeb.UserCanLoginTest do
  use MyPhoenixAppWeb.FeatureCase, async: true

  test "user can login", %{conn: conn} do
    user = insert(:user)
    
    conn
    |> visit(~p"/")
    |> click_link("Log in")
    |> within("#login_form_password", fn conn ->
      conn
      |> fill_in("Email", with: user.email)
      |> fill_in("Password", with: user.password)
      |> click_button("Log in and stay logged in")
    end)
    |> assert_has("#flash-info", text: "Welcome back!")
  end
end
