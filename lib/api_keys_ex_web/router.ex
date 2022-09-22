defmodule ApiKeysExWeb.Router do
  use ApiKeysExWeb, :router

  get "/auth", ApiKeysExWeb.AuthController, :show
end
