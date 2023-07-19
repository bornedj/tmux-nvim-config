local config = {
  cmd = {
      '/home/daniel/jls/bin/jdtls'
  },

  root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, {upward = true})[1]),
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require('jdtls').start_or_attach(config)
