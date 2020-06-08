#### バックエンドサービス、envoy共にDockerコンテナで起動する時の考慮点

同じマシン上で動かしているからと言って、envoy.yamlのclusters.hosts定義にlocalhostとか127.0.0.1とかを指定しない。
バックエンドサービスのコンテナイメージのIPアドレスを確認して指定する（docker inspectで確認）。
例：

```
            "Networks": {
                "bridge": {
                    "IPAMConfig": null,
                    "Links": null,
                    "Aliases": null,
                    "NetworkID": "b9d1b3d57891e10ebc602552d0ba83aea3756c5262e121d533bc5739937c3c63",
                    "EndpointID": "134877946aab88f89a23d81f62000d242bf1066d2015e167b79d32eead8a6257",
                    "Gateway": "172.17.0.1",
                    "IPAddress": "172.17.0.3",   <-コンテナイメージのIPアドレス
                    "IPPrefixLen": 16,
                    "IPv6Gateway": "",
                    "GlobalIPv6Address": "",
                    "GlobalIPv6PrefixLen": 0,
                    "MacAddress": "02:42:ac:11:00:03",
                    "DriverOpts": null
                }
            }
```
