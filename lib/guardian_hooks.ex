defmodule ApiTry.GuardianHooks do
    use Guardian.Hooks

    def before_encode_and_sign(conn, location) do
        IO.puts("trying to encode and sign with location: #{location}")
        conn
    end
end