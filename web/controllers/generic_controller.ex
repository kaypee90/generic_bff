# web/controllers/generic_controller
defmodule MyBff.GenericController do
  use MyBff.Web, :controller

  require Logger

  def index(conn, _params) do
    results = []
    Logger.info "Getting all resources"
    #Logger.info _params

    content_type = conn |> get_req_header("content-type")
    accept = conn |> get_req_header("accept")

    headers = [
      "Content-Type": content_type,
      "Accept": accept
    ]
    Logger.info "Make external api GET request"
    HTTPoison.start
    response = HTTPoison.get!(
      "https://jsonplaceholder.typicode.com/todos",
      headers
    )
    Logger.info "Decoding api call response"
    results = Poison.decode!(response.body)
    json conn, results
  end

  def show(conn, %{"id" => id}) do
    result = %{}
    content_type = conn |> get_req_header("content-type")
    headers = [
      "Content-Type": content_type
    ]
    Logger.info "Make external api GET a resource request"
    url = "https://jsonplaceholder.typicode.com/todos/" <> id
    HTTPoison.start()
    response = HTTPoison.get!(url, headers)
    Logger.info "Response StatusCode:: " <> Integer.to_string(response.status_code)

    result = cond do
        response.status_code == 200 ->
          Logger.info "Http request successful"
          Logger.info "Decoding external api response"
          Poison.decode!(response.body)
        true -> []
    end

    conn
    |> put_status(response.status_code)
    |> json(result)
  end

  def create(conn, params) do
    Logger.info "Creating a resource"
    content_type = conn |> get_req_header("content-type")
    accept = conn |> get_req_header("accept")

    headers = [
      "Content-Type": content_type,
      "Accept": accept
    ]
    Logger.info "Making external api POST request"
    HTTPoison.start()

    url = "https://jsonplaceholder.typicode.com/todos"
    request_body = Poison.encode!(params)

    response = HTTPoison.post!(url, request_body, headers)

    Logger.info "Decoding external api response"
    result = Poison.decode!(response.body)
    conn
    |> put_status(:created)
    |> json(result)
  end

  def update(conn, %{"id" => id} = params) do
    Logger.info "Updating a resource"
    content_type = conn |> get_req_header("content-type")
    accept = conn |> get_req_header("accept")

    headers = [
      "Content-Type": content_type,
      "Accept": accept
    ]
    Logger.info "Making external api POST request"
    HTTPoison.start()

    url = "https://jsonplaceholder.typicode.com/todos/" <> id
    request_body = Poison.encode!(params)

    response = HTTPoison.put!(url, request_body, headers)
    Logger.info "Response StatusCode:: " <> Integer.to_string(response.status_code)
    Logger.info "Decoding external api response"
    result = Poison.decode!(response.body)
    conn
    |> put_status(:ok)
    |> json(result)
  end

end
