Around('@no_connection_to_qaserver') do |scenario, block|
	%x[sudo ipfw add 10 deny tcp from qaserver to me]
	%x[sudo ipfw add 11 deny tcp from me to qaserver]
	block.call
	%x[sudo ipfw delete 11 > /dev/null 2>&1]
	%x[sudo ipfw delete 10 > /dev/null 2>&1]
end

Around('@no_network') do |scenario, block|
	%x[sudo ifconfig en1 down]
	block.call
	%x[sudo ifconfig en1 up]
	sleep 5
end