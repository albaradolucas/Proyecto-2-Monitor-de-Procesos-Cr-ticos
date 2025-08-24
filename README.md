# Proyecto 2 – Monitor de Procesos Críticos

## 🎯 Objetivo
Desarrollar un script que supervise procesos críticos (como `nginx`, `apache2`, `zabbix`, `sshd`, etc.) y que sea capaz de reiniciarlos automáticamente en caso de caída, registrando el resultado en un log.

## 📌 Requisitos mínimos
- El script debe recibir el nombre de un proceso como parámetro.
- Validar que el parámetro esté presente, si no mostrar ayuda de uso.
- Verificar el estado del proceso con `systemctl status`.
- Si el proceso está detenido:
  - Intentar reiniciarlo automáticamente.
  - Registrar en `/var/log/monitor_procesos.log` una línea con el formato:
    ```
    fecha | nombre_proceso | ESTADO STOPPED | RESET OK/NOT OK
    ```
- Si el proceso está en ejecución:
  - Registrar en el log:
    ```
    fecha | nombre_proceso | ESTADO OK
    ```
- Códigos de salida:
  - `0` → proceso en ejecución.
  - `2` → proceso detenido, reinicio fallido.

## ✨ Extra (opcional)
- Aceptar múltiples procesos como parámetros y monitorearlos en un mismo ciclo.
- Enviar una notificación si el reinicio falla después de varios intentos.
- Permitir que el script se ejecute en segundo plano como demonio.

## 🚀 Entregables
- Script funcional: `monitor_procesos_criticos.sh`.
- Archivo de log: `/var/log/monitor_procesos.log`.
- Ejemplos de ejecución en distintos escenarios:
  - Proceso corriendo (OK).
  - Proceso detenido y reinicio exitoso.
  - Proceso detenido y reinicio fallido.
