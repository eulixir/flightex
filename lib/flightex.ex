defmodule Flightex do

  alias Flightex.Users.Agent, as: UserAgent
  alias Flightex.Users.CreateOrUpdate, as: CreateOrUpdateUser

  def start_agents do
    UserAgent.start_link(%{})

  end

  defdelegate create_or_update_user(params), to: CreateOrUpdateUser, as: :call
end
