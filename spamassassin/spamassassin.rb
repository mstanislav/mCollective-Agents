module MCollective
    module Agent
        class Spamassassin<RPC::Agent
            metadata    :name        => "SimpleRPC Agent For Spam Assassin Management",
                        :description => "Agent To Manage Spam Assassin",
                        :author      => "Mark Stanislav",
                        :license     => "GPLv2",
                        :version     => "1.0",
                        :url         => "https://github.com/mstanislav/mCollective-Agents",
                        :timeout     => 90

            def update_action
                reply.data = %x[/usr/bin/sa-update && echo 'UPDATES RETRIEVED' || echo 'NO UPDATES FOUND'].chomp
            end

            def compile_action
                reply.data = %x[/usr/bin/sa-compile > /dev/null 2>&1 && echo OK || echo FAILED].chomp
            end

            def restart_action
                reply.data = %x[/sbin/service spamassassin restart > /dev/null 2>&1 && echo OK || echo FAILED].chomp
            end

            def full_action
                result_1 = update_action
                result_2 = compile_action
                result_3 = restart_action

                reply.data = result_1 + ", COMPILATION " + result_2 + ", RESTART " + result_3
            end
        end
    end
end
