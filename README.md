Proyecto 2 – Monitor de Procesos Críticos

🎯 Objetivo: Crear un script que vigile si un proceso crítico (por ejemplo, nginx, apache2 o sshd) está corriendo.

Si no está activo, debe:

Escribir un log con la fecha, el nombre del proceso y el estado “caído”.

Intentar reiniciarlo automáticamente.

Registrar si el reinicio fue exitoso o no.

📌 Requisitos mínimos:

El proceso a monitorear debe pasarse como parámetro al script:

./monitor.sh nginx


Si no se pasa un parámetro, mostrar un mensaje de uso.

Generar un log en /var/log/monitor_procesos.log.
