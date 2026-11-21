defmodule HelloWeb.HelloControllerTest do
  use HelloWeb.ConnCase

  test "GET /saudacao/pt/:name renders Portuguese greeting", %{conn: conn} do
    conn = get(conn, ~p"/saudacao/pt/lucas")
    assert html_response(conn, 200) =~ "Olá, Lucas!"
  end

  test "GET /saudacao/en/:name renders English greeting", %{conn: conn} do
    conn = get(conn, ~p"/saudacao/en/lucas")
    assert html_response(conn, 200) =~ "Hello, Lucas!"
  end

  test "GET /saudacao/:lang/:name returns 400 for unsupported language", %{conn: conn} do
    conn = get(conn, ~p"/saudacao/es/lucas")
    assert html_response(conn, 400) =~ "Idioma &#39;es&#39; não suportado"
  end

  test "GET /hello/:name renders greeting", %{conn: conn} do
    conn = get(conn, ~p"/hello/phoenix")
    assert html_response(conn, 200) =~ "Hello Phoenix!"
  end
end
