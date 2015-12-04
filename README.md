# integration-sample-ios

devise + omniauth-facebookなRailsアプリケーションにdoorkeeper入れてiOSと連携できるようにするサンプルのiOS側のコード。

Rails側のコードはこちら。

https://github.com/xoyip/integration-sample-rails

# 動かし方

- `pod install`はしなくてOK
- `integration-sample-ios.xcworkspace`を開く
- `Constants.swift`を開いて書き換える
    - APP_ID = "dorkeeperで作ったOAuthアプリケーションのid"
    - APP_SECRET = "secret"
    - SERVER_URL = "http://integration-sample-rails.192.168.11.4.xip.io"
- Run!

動かなかったら教えてほしいです。
