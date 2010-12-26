# Config file for /etc/init.d/webcit
#See /usr/share/docs/webcit/readme for details.
WEBCIT_OPTS=""

##[-i ip_addr] The IP address you wish to bind.
##Leave this out and WebCit will listen on all network interfaces.
#WEBCIT_OPTS="${WEBCIT_OPTS} -i 127.0.0.1"

##[-p http_port] The TCP port on which to operate.
##WebCit defaults to port 2000.
#WEBCIT_OPTS="${WEBCIT_OPTS} -p 2000"

##[-u username] Lets Webcit drop root privileges and run as a useraccount.
#WEBCIT_OPTS="${WEBCIT_OPTS} -u webcit"

##[-t tracefile] Where you want WebCit to log information.
WEBCIT_OPTS="${WEBCIT_OPTS} -t /var/log/webcit"

##[-c] Causes WebCit to output an extra cookie containing the
##identity of the WebCit server.
#WEBCIT_OPTS="${WEBCIT_OPTS} -c"

##[-s] Causes WebCit to present an HTTPS web service.
#WEBCIT_OPTS="${WEBCIT_OPTS} -s"

##[-f] Tells WebCit to follow "X-Forwarded-For:" HTTP headers
#WEBCIT_OPTS="${WEBCIT_OPTS} -f"

##[remotehost [remoteport]] IP address and port of your Citadel server.
##Defaults to localhost 504
#WEBCIT_OPTS="${WEBCIT_OPTS} 127.0.0.1"
