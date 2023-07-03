# ronin-listener-dns 1 "2023-03-24" Ronin Listener "User Manuals"

## SYNOPSIS

`ronin-listener dns` [*options*] *DOMAIN*

## DESCRIPTION

Starts a DNS server for receiving exfiltrated data.

## ARGUMENTS

*DOMAIN*
  The domain to receive DNS queries for.

## OPTIONS

`-H`, `--host` *IP*
  The interface to listen on. Defaults to `0.0.0.0` if not given.

`-p`, `--port` *PORT*
  The port to listen on. Defaults to `53` if not given.

`-h`, `--help`
  Prints help information.

## EXAMPLES

Runs a DNS listener on `127.0.0.1:5553` for domain `example.com`:

        $ ronin-listener dns -H 127.0.0.1 -p 5553 example.com

Run a DNS listener on `0.0.0.0:53` for domain `example.com` as root:

        $ sudo ronin-listener dns example.com

## AUTHOR

Postmodern <postmodern.mod3@gmail.com>

## SEE ALSO

ronin-listener-http(1)
