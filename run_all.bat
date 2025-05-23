@echo off
start cmd /k "python origin_server.py"
start cmd /k "python replica_server1.py"
start cmd /k "python replica_server2.py"
start cmd /k "python replica_server3.py"
start cmd /k "python controller.py"
start cmd /k "python app.py"