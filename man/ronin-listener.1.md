# ronin-listener 1 "2023-02-01" Ronin Listener "User Manuals"

## NAME

ronin-listener - A Ruby CLI utility for receiving exfiltrated data

## SYNOPSIS

`ronin-listener` [*options*] [*COMMAND*]

## DESCRIPTION

Allows quickly starting a DNS or HTTP server for receiving exfiltrated data.

## OPTIONS

`-h`, `--help`
: Prints help information.

## COMMANDS

`dns`
: Starts a DNS server for receiving exfiltrated data.

`http`
: Starts a HTTP server for receiving exfiltrated data.

`new`
: Creates a new DNS or HTTP listener Ruby script.

`help`
: Prints help information about this command or another command.

## AUTHOR

Postmodern <postmodern.mod3@gmail.com>

## SEE ALSO

[ronin-listener-dns](ronin-listener-dns.1.md) [ronin-listener-http](ronin-listener-http.1.md)
