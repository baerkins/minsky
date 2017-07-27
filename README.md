# Minsky

![Minsky](http://content.forums.previously.tv/monthly_2017_05/fargo3e.jpg.b833b8f6b39ef66428945ec45e2050a2.jpg)

I abuse my computer: constantly installing things, never really cleaning up, failing to remember to repair disc permissions. On occasion, I try to make nice by treating the machine to a spa day - by wiping it entirely.

On such an occastion, this repo provides a simple way to get back to basics in terms of the apps and scripts I need for development.

If this helps you, cool. If not, whatever. It's not your computer anyhow.

# Installations

## Git

Open Terminal, run `git`. Install will take place.

Create an ssh key: https://help.github.com/articles/generating-ssh-keys/

Clone this repo to `dev/assets/github/minksy`.
```
mkdir -p ~/dev/assets/github
cd ~/dev/assets/github
git clone https://github.com/iamhexcoder/minsky.git
cd minksy
```


## Homebrew

Run `brew-time.sh` in this repo. It installs the following:

#### Binaries
- [nvm](https://github.com/creationix/nvm)
- [ffmpeg](http://ffmpeg.org/)

#### Applications
- [Google Chrome](https://www.google.com/chrome/browser/desktop/)
- [Firefox](https://www.mozilla.org/en-US/firefox)
- [MAMP](https://www.mamp.info/en/)
- [Sublime Text 3](http://www.sublimetext.com/)
- [Transmit](https://panic.com/transmit/)
- [Dropbox](https://www.dropbox.com/)
- [Slack](https://slack.com/)
- [AppCleaner](http://www.freemacsoft.net/appcleaner/)
- [Transmission](http://www.transmissionbt.com/)

#### Fonts
- [Inconsolata](http://www.levien.com/type/myfonts/inconsolata.html)
- [Droid Sans Mono](https://www.google.com/fonts/specimen/Droid+Sans+Mono)

## bash_profile
Copy the `.bash_profile` in this repo to root:
```
cp -i .bash_profile ~/.bash_profile
```

## Sublime Text
To open Sublime from Terminal, open terminal and run:
```
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/sublime
```
Bash profile contains alias `sublime` which allows you to open your current directory using `sublime .`

Sync settings from Dropbox (just make sure to setup Dropbox first):
```
cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/
rm -r User
ln -s ~/Dropbox/Shaun/Dev/Sublime/User
```

Open Sublime and install [Package Control](https://packagecontrol.io/). In Sublime, press `` ctrl + ` `` and copy in:
```
import urllib.request,os,hashlib; h = '2915d1851351e5ee549c20394736b442' + '8bc59f460fa1548d1514676163dafc88'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); by = urllib.request.urlopen( 'http://packagecontrol.io/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); print('Error validating download (got %s instead of %s), please try manual install' % (dh, h)) if dh != h else open(os.path.join( ipp, pf), 'wb' ).write(by)
```


## NVM
NVM is installed via homebrew to make like easier. To get the latest verison up and running and set to default:
```
nvm install stable
nvm use stable
nvm alias default stable
```

## NPM
Install [Gulp](http://gulpjs.com/), [Browsersync](https://www.browsersync.io/):
```
npm install --global gulp
npm install -g browser-sync
```

## Composer
Install [Composer](https://getcomposer.org):
```
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
```

## XCode CLI Tools
Install XCode CLI Tools:
```
xcode-select --install
```







