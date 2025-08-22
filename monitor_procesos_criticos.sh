#!/bin/bash

# vigilar un proceso crítico que debe ser pasado como parametro ( nginx, zabbix, apache2, sshd )
# si no está running escribir un log con fecha, nombre de proceso y estado caído
        # intentar reiniciarlo automaticamente
        # registrar si se reinicio ok o no

# si no se pasa un parametro, mostrar un mensaje de uso
# generar log en /var/log/monitor_procesos.log

prcs=$1

if [ -z "$prcs" ]; then
        echo "Debes ingresar un proceso para monitorear"
        echo ""
        echo "Ejemplo: ./monitor_procesos_criticos.sh ssh"
        echo ""
        sleep 2
        exit
fi

sudo systemctl status "$prcs" | grep -q "(running)"

if [ $? -eq 0 ]; then
        echo "$(date '+%F %T') ||  $prcs  ||  ESTADO OK " >> /var/log/monitor_procesos.log
        tail -n 1 /var/log/monitor_procesos.log
        sleep 2
        exit
else
        sudo systemctl restart "$prcs"

        if [ $? -eq 0 ]; then
                echo "$(date '+%F %T') || $prcs  ||  ESTADO STOPPED  ||  RESET OK" >> /var/log/monitor_procesos.log
                tail -n 1 /var/log/monitor_procesos.log
                sleep 2
                exit
        else
                echo "$(date '+%F %T') ||  $prcs  ||  ESTADO STOPPED  ||  RESET NOT OK" >> /var/log/monitor_procesos.log
                tail -n 1 /var/log/monitor_procesos.log
                sleep 2
                exit
        fi
fi
