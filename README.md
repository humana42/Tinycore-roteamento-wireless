#  Roteamento de Wireless pelo Sistema Operacional Tinycore (Linux)
Lista de configurações e ShellScripts para o roteamento de wireless
# Instalação
`tce-load -wi  hostapd.tcz dhcpd.tcz dhcp.tcz wireless-4.19.10-tinycore.tcz wireless_tools.tcz firewire-4.29.10-tinycore.tcz iptables.tcz iproute2.tcz`
# Configuração
Copiar o arquivo `iptables.sh` para o diretorio `/etc` e fornecer permissão de execução

Copiar o arquivo `wlan0.sh` para o diretorio `/opt` e fornecer permissão de execussão

Copiar o arquivo `dhcpd.conf` para o diretorio `/etc`

Criar o diretorio e arquivo `/var/db/dhcp.leases` e fornecer permissão total ao arquivo.


No arquivo `/usr/local/etc/hostapd.conf` edite o seguintes campos:

```
 interface=wlan0
 
 ssid=”nome_da_rede”
 
 wpa=2
 
 wpa_passphrase=”senha de no mínimo 8 dígitos”
 ``` 


Adicione as seguintes linhas no arquivos >> `/opt/.filetool.lst`

``` 
var/db/dhcpd.leases

usr/local/etc/hostapd.conf

etc/dhcpd.conf

etc/iptables.sh

opt/wlan0.sh
```


Adicione as seguintes linhas no arquivo >> `/opt/bootlocal.sh` para execução automatica ao iniciar o sistema

```
sudo /usr/local/sbin/basic-firewall

/opt/eth0.sh

sleep 15s

sudo /etc/iptables.sh

sudo /opt/wlan0

sudo hostapd -B /usr/local/etc/hostapd.conf &
```

Faça o backup `filetool.sh –b` e renicie o sistema `reboot`
