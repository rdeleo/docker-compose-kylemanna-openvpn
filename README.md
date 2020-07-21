# Docker-compose version of Kylemanna/OpenVpn
These are instructions for setting up a VPN server using this repo

### Generate Config
```
$docker-compose run --rm openvpn ovpn_genconfig -u udp://<EXTERNAL_ADDRESS> -n <DNS_IP>
```

### Initialise Certificate
```
$ docker-compose run --rm openvpn ovpn_initpki
```

### Start environment
```
$ docker-compose up -d
```
## Clients
### Add New Client
```
$ export CLIENTNAME="<NAME>"
$ docker-compose exec openvpn easyrsa build-client-full $CLIENTNAME
```

### Retrieve Client Configuration
```
$ docker-compose exec openvpn getclient_ovpn $CLIENTNAME > $CLIENTNAME.ovpn
```

### Remove Client Configuration
```
$ docker-compose exec openvpn ovpn_revokeclient $CLIENTNAME remove
```


## Notes
Ubuntu clients need the following installed
```
# apt-get install openvpn-systemd-resolved
```
And should have a config file generated using the following command
```
$ docker-compose exec openvpn getclient_ovpn $CLIENTNAME ubuntu > $CLIENTNAME.ovpn
```