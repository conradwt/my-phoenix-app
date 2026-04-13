# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     MyPhoenixApp.Repo.insert!(%MyPhoenixApp.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong. 

alias Raffley.Accounts.User
alias Raffley.Accounts

conrad =
  %User{is_admin: true}
  |> User.registration_changeset(%{
    email: "conrad@example.com",
    username: "conrad"
  })
  |> Repo.insert!()

{:ok, _} =
  Accounts.update_user_password(conrad, %{password: "supersecrets"})
