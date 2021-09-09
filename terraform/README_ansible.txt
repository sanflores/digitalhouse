En el playbook hay una variable llamada "alumno", para configurarla con el valor que nosotros
querramos, deberemos ejecutar el playbook con el siguiente comando (reemplazando mi_nombre):

ansible-playbook -e "alumno=mi_nombre" clase7.yaml
