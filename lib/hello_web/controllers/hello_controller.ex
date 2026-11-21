defmodule HelloWeb.HelloController do
  use HelloWeb, :controller

  def world(conn, %{"name" => name}) do
    render(conn, :world, name: name, page_title: "Hello", page_title_suffix: " - INF321")
  end

  def world(conn, _params) do
    render(conn, :world, name: "world", page_title: "Hello", page_title_suffix: " - INF321")
  end

  def saudacao(conn, %{"lang" => "pt", "name" => name}) do
    render(conn, :saudacao,
      greeting: "Olá",
      name: name,
      page_title: "Page",
      page_title_suffix: ""
    )
  end

  def saudacao(conn, %{"lang" => "en", "name" => name}) do
    render(conn, :saudacao,
      greeting: "Hello",
      name: name,
      page_title: "Page",
      page_title_suffix: ""
    )
  end

  def saudacao(conn, %{"lang" => lang, "name" => name}) do
    conn
    |> put_status(:bad_request)
    |> render(:saudacao,
      greeting: "Idioma '#{lang}' não suportado",
      name: name,
      page_title: "Page",
      page_title_suffix: ""
    )
  end
end
