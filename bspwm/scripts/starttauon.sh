if pgrep "tauonmb";then 
    return 0
else 
    nohup python3 /opt/tauon-music-box/tauon.py %U &
fi
