echo "Instalando Java, por favor espera..."
sudo apt-get update > /dev/null 2>&1
sudo apt-get install -y openjdk-17-jre-headless > /dev/null 2>&1
echo "Java instalado."
echo ""

echo "Asegurando que los puertos sean públicos..."
gh codespace ports visibility 25565:public 19132:public -c $CODESPACE_NAME

if [ ! -f "server.properties" ]; then
    echo "Detectado primer inicio del servidor. Realizando configuración inicial..."
    echo "eula=true" > eula.txt
    echo "level-name=${WORLD_NAME:-world}" > server.properties
    
    if [ -n "$WORLD_SEED" ]; then
        echo "level-seed=${WORLD_SEED}" >> server.properties
        echo "Usando semilla personalizada: $WORLD_SEED"
    else
        echo "No se especificó semilla, se usará una aleatoria."
    fi
    echo ""
fi

echo "Iniciando servidor de Minecraft..."
java -Xms1G -Xmx3G -jar paper-1.21.8-60.jar nogui