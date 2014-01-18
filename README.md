Neson's dotfiles
================

## Installation

```bash
git clone https://github.com/Neson/dotfiles.git
dotfiles/install
```
The installation script will create symlink for all the dotfiles included.
For Sublime Text 2, folder `subl2` will be copy to `Packages/User`.
Old config files are automatically backup&replaced.

### OSX

BetterTouchTool settings, Terminal profiles and other things are in `osx/`.

### Sublime Text 2

* Install Package Control:
  Press `` ctrl+` `` to open Sublime Text 2 console and paste the following command into it.

```python
import urllib2,os; pf='Package Control.sublime-package'; ipp=sublime.installed_packages_path(); os.makedirs(ipp) if not os.path.exists(ipp) else None; urllib2.install_opener(urllib2.build_opener(urllib2.ProxyHandler())); open(os.path.join(ipp,pf),'wb').write(urllib2.urlopen('http://sublime.wbond.net/'+pf.replace(' ','%20')).read()); print('Please restart Sublime Text to finish installation')
```

* Install the fonts in `fonts/`

### Install Private Profiles

`cd` into the local `dotfiles` repository and then:
```bash
git clone [private dotfiles repo] secret
./install
```

The Private Profiles Repository contains:
* `secret/subl2`: Sublime Text 2 Settings
* `secret/gitcfg`: gitcfg profiles
* `secret/_*`: other files that should be placed as `~/.*`, e.g. `_ssh`->`~/.ssh`

## Update

`cd` into the local `dotfiles` repository and then:
```bash
git pull
./install
```

## 注意

* Sublime Text 2 會自動刪去設定檔中的註解，因此若要更改 Settings 或 Key Bindings，請再 `install` 回有註解的版本後後立即更改，改完也要馬上 `cp` 回 `subl2/` 更新原始檔。
