
# ONE LINER para obtener el mejor ping (tiempo promedio) de una lista de hosts
# Se supone que se tiene un archivo (lista_server.txt) con una lista de hosts a probar.
# Cada host, tiene el siguiente formato:
# http://espejito.fder.edu.uy/centos/8-stream/isos/x86_64/
# http://mirror.orbyta.com/8-stream/isos/x86_64/
# http://mirror.netglobalis.net/centos/8-stream/isos/x86_64/
# http://mirror.ufro.cl/centos/8-stream/isos/x86_64/
# http://ftp.inf.utfsm.cl/pub/Linux/CentOS/8-stream/isos/x86_64/
# ...


for i in $(awk -F "http://" '{print $2}' lista_server.txt | awk -F "/" '{print $1}'); 
do  
p=$(ping -n 1 $i | tail -1 | cut -d "=" -f 4); echo " " $i " => " $p; 
done | sort -t '>' -k2,2n