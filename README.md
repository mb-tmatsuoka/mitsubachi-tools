mitsubachi Tools
================

概要
----

[mitsubachi](http://www.mushikago.org/mitsubachi/)を便利に使えるようになるツール集です。

機能一覧
--------

# pull\_resources - 指定プロジェクトのリソースをすべてローカルに保存する
# clear\_resources - 指定プロジェクトのリソースをすべて削除する

インストール方法
----------------

下記コマンドを実行後mushikago-credentials.rbを編集してAPIキーとSECRETキーを設定して下さい。

    $ git clone git@github.com:mb-tmatsuoka/mitsubachi-tools.git
    $ cd mitsubachi-tools
    $ cp mushikago-credentials.rb{.sample,}

設定後、mitsubachi-toolsにパスを通せば使用できるようになります。
~/.bashrc 等に以下の記述を追加して下さい。

    export MITSUBACHI_TOOLS_HOME=path/to/mitsubachi-tools
    export PATH=$PATH:$MITSUBACHI_TOOLS_HOME


