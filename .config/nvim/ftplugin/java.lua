local config = {
    cmd = { '/usr/lib/jdtls/bin/jdtls' },
    root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
    settings = {
        java = {
            configuration = {
                runtimes = {
                    -- {
                    --     name = "JavaSE-8",
                    --     path = "/usr/lib/jvm/java-8-openjdk-amd64/"
                    -- },
                    {
                        name = "JavaSE-17",
                        path = "/usr/lib/jvm/openjdk-17/"
                    },
                }
            }
        }
    }
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require('jdtls').start_or_attach(config)
