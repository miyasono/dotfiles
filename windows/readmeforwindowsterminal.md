# WindowsTerminalをインストールする
ストアから普通に。

# WindowsTerminalのjsonにアクセスする。

`$vi /mnt/c/Users/satoru/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json` 
とかでいけると思う。

# fontをCicaにする、colorschemeも変更する？？？
```
    "$schema": "https://aka.ms/terminal-profiles-schema", 
```
```
            {
                "guid": "{07b52e3e-de2c-5db4-bd2d-ba144ed6c273}",
                "hidden": false,
                "name": "Ubuntu-20.04",
                "source": "Windows.Terminal.Wsl",
                "fontFace": "Cica",
                "colorScheme": "MyCampbell"
            }, 
```

# defaultProfileの変更(guidは設定されているものを利用

```
"defaultProfile": "{07b52e3e-de2c-5db4-bd2d-ba144ed6c273}",
```

