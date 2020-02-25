## How to use

### Initial setup

1. You must have imported [the dependent box](https://github.com/uzxmx/boxes/tree/master/mybox) before going on.
1. Run `cp .env.example .env` and modify values in `.env`.
1. Run `vagrant up`, make sure it's finished successfully. If failed to provision, you
may run `vagrant provision` manually.

### Remaining steps

Once initial setup is finished, you never need to it again unless you want to make a new vm.
Below steps can be run anytime you want.

1. Use `vagrant ssh` to enter into vm.
1. Use `/vagrant/start.sh` to start vpn connection.
1. Use `/vagrant/stop.sh` to stop vpn connection.

## Troubleshooting

Use below commands to find what's going on.

```
ip addr
ip route

sudo tcpdump -n -i ppp0
curl https://www.google.com

sudo journalctl -u ipsec -f
sudo journalctl -u xl2tpd -f

sudo systemctl restart ipsec
sudo systemctl restart xl2tpd
```

## TODO

* Sometimes ppp0 disappears accidentally.
* Configure timeout and retry interval for ipsec and xl2tpd?

## References

* https://github.com/hwdsl2/setup-ipsec-vpn/blob/master/docs/clients.md#configure-linux-vpn-clients-using-the-command-line
* https://kinboyw.github.io/2018/09/07/CentOS7.4%E6%90%AD%E5%BB%BAL2TPIPSec%20VPN/
* https://www.elastichosts.com/blog/linux-l2tpipsec-vpn-client/
* https://github.com/hwdsl2/setup-ipsec-vpn/issues/561
