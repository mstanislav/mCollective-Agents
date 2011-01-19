metadata    :name        => "SimpleRPC Agent For Spam Assassin Management",
            :description => "Agent To Manage Spam Assassin",
            :author      => "Mark Stanislav",
            :license     => "GPLv2",
            :version     => "1.1",
            :url         => "https://github.com/mstanislav/mCollective-Agents",
            :timeout     => 90

action "status", :description => "Status of service and ruleset compilation timestamp" do
    display :always

    output "status",
          :description => "Status of service and timestamp of compiled rulset",
          :display_as  => "Status Execution"
end

action "update", :description => "Update rules if available" do
    display :always

    output "status",
          :description => "Updates installed or not",
          :display_as  => "Update Execution"
end

action "compile", :description => "Compile ruleset" do
    display :always

    output "status",
          :description => "Rule set compilation",
          :display_as  => "Rule Compilation Execution"
end

action "restart", :description => "Restart service" do
    display :always

    output "status",
          :description => "Restart of service",
          :display_as  => "Restart Execution"
end

action "full", :description => "Download updates, compile ruleset, and restart service" do
    display :always

    output "status",
          :description => "Rule update & compilation with a service restart",
          :display_as  => "Rule Update & Compilation, and Service Restart Execution"
end
