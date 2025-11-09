echo "Instalando Java, por favor espera..."
sudo apt-get update > /dev/null 2>&1
sudo apt-get install -y openjdk-17-jre-headless > /dev/null 2>&1
echo "Java instalado."

# Inicia el servidor de Minecraft
echo "Iniciando servidor de Minecraft..."
# ASEGÚRATE DE QUE EL NOMBRE DEL .JAR COINCIDE CON EL QUE SUBISTE
java -Xms4G -Xmx6G -jar paper-1.21.8-60.jar nogui 