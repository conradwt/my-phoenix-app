defmodule MyPhoenixApp.Factory do
  use ExMachina.Ecto, repo: MyPhoenixApp.Repo

  def user_factory do
    %MyPhoenixApp.Accounts.User{
      email: sequence(:email, &"user-#{&1}@example.com"),
      password: "supersecrets",
      hashed_password: Bcrypt.hash_pwd_salt("supersecrets")
    }
  end
end
