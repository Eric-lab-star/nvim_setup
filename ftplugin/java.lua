local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = "/Users/kyungsubkim/nvimJava" .. project_name
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local config = {
	cmd = {
		"java", -- or '/path/to/java17_or_newer/bin/java'
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xmx1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",

		"-jar",
		"/Users/kyungsubkim/jdtls/plugins/org.eclipse.equinox.launcher_1.6.700.v20231214-2017.jar",

		"-configuration",
		"/Users/kyungsubkim/jdtls/config_mac",

		"-data",
		workspace_dir,
	},
	settings = {
		java = {
			ls = {
				vmargs = "-Xmx1G",
			},
		},
	},

	root_dir = vim.fs.root(0, { ".git", "mvnw", "gradlew" }),
	capabilities = capabilities,
}
require("jdtls").start_or_attach(config)
