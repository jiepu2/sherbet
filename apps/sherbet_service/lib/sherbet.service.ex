defmodule Sherbet.Service do
    @moduledoc false

    use Application

    def start(_type, _args) do
        import Supervisor.Spec, warn: false

        children = [
            Sherbet.Service.Repo,
            Sherbet.Service.Contact
        ]

        opts = [strategy: :one_for_one, name: Sherbet.Service.Supervisor]
        Supervisor.start_link(children, opts)
    end
end
