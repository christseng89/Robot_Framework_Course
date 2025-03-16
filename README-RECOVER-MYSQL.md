```cmd
net stop MySQL84
cd C:\Program Files\MySQL\MySQL Server 8.4\bin

mysqld --initialize --console
    2025-03-16T06:48:55.013175Z 0 [System] [MY-015017] [Server] MySQL Server Initialization - start.
    2025-03-16T06:48:55.021529Z 0 [System] [MY-013169] [Server] C:\Program Files\MySQL\MySQL Server 8.4\bin\mysqld.exe (mysqld 8.4.2) initializing of server in progress as process 12832
    2025-03-16T06:48:55.052939Z 1 [System] [MY-013576] [InnoDB] InnoDB initialization has started.
    2025-03-16T06:48:55.628454Z 1 [System] [MY-013577] [InnoDB] InnoDB initialization has ended.
    2025-03-16T06:48:57.740278Z 6 [Note] [MY-010454] [Server] A temporary password is generated for root@localhost: YU3E<tkb6>gV
    2025-03-16T06:49:00.311449Z 0 [System] [MY-015018] [Server] MySQL Server Initialization - end.

net start MySQL84
notepad C:\mysql-init.txt
    ALTER USER 'root'@'localhost' IDENTIFIED BY 't1nnnn$Cxxxx';

mysqld --init-file=C:\\mysql-init.txt
```