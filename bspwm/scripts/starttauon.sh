if pgrep -x "tauonmb" > /dev/null
then :
else nohup python3 /opt/tauon-music-box/tauon.py %U &
fi
