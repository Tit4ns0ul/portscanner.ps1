$ports = (80, 445)
$ip = "192.168.2.1"

foreach ($port in $ports) {
    try {
        # Attempt to create a TCP connection
        $socket = New-Object System.Net.Sockets.TcpClient($ip, $port)

        # Check if the socket is null (failed connection)
        if ($socket -eq $null) {
            echo "$ip : $port - Closed"
        } else {
            echo "$ip : $port - Open"
            $socket.Close() # Close the connection if successful
        }
    }
    catch {
        echo "$ip : $port - Closed"
    }
}
