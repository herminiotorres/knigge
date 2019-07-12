defmodule Knigge.Error do
  @moduledoc false

  def default_for_required_callback!(env) do
    raise_compile_error(
      "you can not define a default implementation for a required callback, as it will never be invoked.",
      env
    )
  end

  def behaviour_not_loaded!(module, env) do
    raise_compile_error(
      "the behaviour module could not be found: #{inspect(module)}",
      env
    )
  end

  def implementation_not_loaded!(module, env) do
    raise_compile_error(
      "the implementing module could not be found: #{inspect(module)}",
      env
    )
  end

  defp raise_compile_error(message, env) do
    raise CompileError,
      description: message,
      file: env.file,
      line: env.line
  end
end