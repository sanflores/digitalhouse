echo "====================================================================================================================
Se recomienta ejecutar esta imagen con el siguiente comando:

docker run -ti --env-file=credenciales.txt -v $PWD:/infra-II/alumno sanflores/digitalhouse:infra-ii


Esto cargara nuestras credenciales, y creara un directorio compartido entre el contender y nuestra maquina.
Solo los archivos que se encuentren en /infra-II/alumno se van a copiar en nuestra maquina. Cualquier archivo
que modifiquemos y NO este en este directorio va a DESAPARECER al apagar el contenedor.

====================================================================================================================

"

if [ ! -z $AWS_ACCESS_KEY_ID ] && [ ! -z $AWS_SECRET_ACCESS_KEY ] && [ ! -z $AWS_SESSION_TOKEN ]; then
  if aws sts get-caller-identity; then
    echo "Credenciales cargadas correctamente"
  else
    echo "Las credenciales no funcionan, verificar que esten bien cargadas" && exit 1
  fi
else
  echo "Debes cargar tus credenciales de aws en un archivo llamado credenciales.txt con el siguiente contenido: 

AWS_ACCESS_KEY_ID=aaaaaaaaaaaaaaaaaaaaa
AWS_SECRET_ACCESS_KEY=bbbbbbbbbbbbbbbbb
AWS_SESSION_TOKEN=ccccccccccccccccccccc
AWS_DEFAULT_REGION=us-east-1


que luego sera cargado en el contenedor al ejecutar el comando run:

docker run -ti --env-file=credenciales.txt sanflores/digitalhouse:terraform-parte1
" && exit 1
fi
