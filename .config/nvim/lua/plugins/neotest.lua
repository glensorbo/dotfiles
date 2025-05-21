return {
  "nvim-neotest/neotest",
  optional = true,
  dependencies = {
    "Issafalcon/neotest-dotnet",
    "marilari88/neotest-vitest",
  },
  opts = {
    adapters = {
      ["neotest-dotnet"] = {
        -- Here we can set options for neotest-dotnet
      },
      ["neotest-vitest"] = {
        -- Here we can set options for neotest-vitest
        vitestCommand = "yarn test",
        filter_dir = function(name)
          return name ~= "node_modules"
        end,
      },
    },
  },
}
