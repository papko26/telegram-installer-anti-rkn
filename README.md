# telegram-installer-anti-rkn
Workaround to install or update telegram-desktop, without VPN
## Why?
Russian government censorship agency Roskomnadzor blocking telegram binary sources for russian users. Telegram from apt repos often outdated, and telegram itself can't update it because of censorship, so this workaround should help untill github is not banned in Russia.
## How does it works?
It checks last release of telegram from its github repo, loads it to tmp, and then places it into /usr/share/telegram. For convenience it also creates symlink to /usr/sbin/telegram, that almost always part of $PATH in linux based OS, so you can start it by passing "telegram".
## What about Windows?
Coming soon, stay tuned.


Inspired by [jalcaldea's script](https://gist.github.com/jalcaldea/acb22b21a8c9f0728198) 
