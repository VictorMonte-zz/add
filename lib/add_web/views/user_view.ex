defmodule AddWeb.UserView do
  use AddWeb, :view
  alias AddWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      cpf: user.cpf,
      user_manager_id: user.user_manager_id}
  end
end
