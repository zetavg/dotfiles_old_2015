Neson's dotfiles
================

## Installation

```bash
git clone https://github.com/Neson/dotfiles.git
dotfiles/install
```
The installation script will create symlink for all the dotfiles included.
For Sublime Text, folder `subl*` will be copy to `Packages/User`.
Old config files will be automatically backup & replaced.

### OSX

BetterTouchTool settings, Terminal profiles and other things are in `osx/`.

### Sublime Text 3

* Install Package Control:
  Press `` ctrl+` `` to open Sublime Text 2 console and paste the following command into it.

```python
import urllib.request,os,hashlib; h = '7183a2d3e96f11eeadd761d777e62404e330c659d4bb41d3bdf022e94cab3cd0'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); by = urllib.request.urlopen( 'http://sublime.wbond.net/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); print('Error validating download (got %s instead of %s), please try manual install' % (dh, h)) if dh != h else open(os.path.join( ipp, pf), 'wb' ).write(by)
```

* Install the fonts in `fonts/`

* Install OS X command line tool - subl

```bash
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/bin/subl
```

### Install Private Profiles

`cd` into the local `dotfiles` repository and then:
```bash
git clone [private dotfiles repo] secret
./install
```

**IMPORTANT: EXECUTE `dotfiles/install` ASAP TO REMOVE OTHERS' READ PERMISSION TO `secret`!**

The Private Profiles Repository contains:
* `secret/subl2`: Sublime Text 2 Settings
* `secret/gitcfg`: gitcfg profiles
* `secret/_*`: other files that should be placed as `~/.*`, e.g. `_ssh`→`~/.ssh`

## Update

`cd` into the local `dotfiles` repository and then:
```bash
git pull
./install
```

## 注意

* Sublime Text 會自動刪去設定檔中的註解，因此若要更改 Settings 或 Key Bindings，請再 `install` 回有註解的版本後後立即更改，改完也要馬上 `cp` 回 `subl2/` 更新原始檔。
