echo "Script d'installation d'Unix Agent"
echo "Si vous n'avez pas encore ajouter ce node a observium, quittez ce script"
apt-get install -y xinetd
echo "Creation du dossier"
mkdir /usr/lib/observium_agent
mkdir /usr/lib/observium_agent/local
echo "Copie des fichiers de configuration"
cd files/
cp observium_agent_xinetd /etc/xinetd.d/
cp observium_agent /usr/bin/
echo "Copie des fichiers de detection d'OS, de VM"
cp os /usr/lib/observium_agent/local/
cp proxmox-qemu /usr/lib/observium_agent/local/
chmod +x /usr/lib/observium_agent/local/*
echo "Démarrage des services"
service xinetd restart
echo "Patientez 5 minutes avant l'apparition sur Observium"

