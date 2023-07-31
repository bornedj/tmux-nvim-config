local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = '/mnt/c/Users/daniel.borne/gitlab_repos/' .. project_name

local config = {
    cmd = {
        'java',
        '-configuration', '/usr/lib/jdtls/bin/jdtls',
        '-data', workspace_dir
    },
    root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw', 'pom' }, { upward = true })[1]),
    settings = {
        java = {
            configuration = {
                runtimes = {
                    {
                        name = "JavaSE-8",
                        path = "/usr/lib/jvm/java-8-openjdk-amd64/"
                    },
                    {
                        name = "JavaSE-17",
                        path = "/usr/lib/jvm/java-17-openjdk-amd64/"
                    },
                }
            }
        }
    }
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require('jdtls').start_or_attach(config)
