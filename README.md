mitsubachi Tools
================

概要
----

[mitsubachi](http://www.mushikago.org/mitsubachi/)を便利に使えるようになるツール集です。

機能一覧
--------

1. pull\_resources - 指定プロジェクトのリソースをすべてローカルに保存する
2. clear\_resources - 指定プロジェクトのリソースをすべて削除する

インストール方法
----------------

事前にrubyとmushikago-sdkがインストールされていることを確認して下さい。
mushikago-sdkは以下のコマンドでインストールすることができます。

    $ gem install mushikago-sdk

下記コマンドを実行後mushikago-credentials.rbを編集してAPIキーとSECRETキーを設定して下さい。

    $ git clone git@github.com:mb-tmatsuoka/mitsubachi-tools.git
    $ cd mitsubachi-tools
    $ cp mushikago-credentials.rb{.sample,}

設定後、mitsubachi-toolsにパスを通せば使用できるようになります。
~/.bashrc 等に以下の記述を追加して下さい。

    export MITSUBACHI_TOOLS_HOME=path/to/mitsubachi-tools
    export PATH=$PATH:$MITSUBACHI_TOOLS_HOME

プログラムを最新にアップデートしたい場合は以下のコマンドで更新することができます。

    $ cd $MITSUBACHI_TOOLS_HOME
    $ git pull

環境
----

実行には以下の環境が必要です

    ruby 1.8.7か1.9.2以上

使い方
------

### pull\_resources

    $ mitsubachi-pull-resources.rb プロジェクト名 [prefix]

実行すると、指定したプロジェクトのリソースをすべてローカルにダウンロードします。
ファイルサイズが0のファイル、すでにローカルにあるファイルはダウンロードしません。

prefixを指定することで、prefix以下のリソースのみをダウンロードします。
例えば以下のコマンドでstdoutをすべて取得することができます。

    $ mitsubachi-pull-resources.rb sample_project log/stdout/

### clear\_resources

    $ mitsubachi-clear-resources.rb プロジェクト名 [prefix]

実行すると、指定したプロジェクトのリソースをすべて削除します。
ローカルにダウンロードしたファイルは削除しません。

prefixを指定することで、prefix以下のリソースのみを削除します。
例えば以下のコマンドでstdoutをすべて削除することができます。

    $ mitsubachi-clear-resources.rb sample_project log/stdout/
