#!/bin/bash

docker run -it -v /c/aMyUbuntu/metaplex/assets_template_sample:/assets -v /c/Users/Administrator/Desktop/blocks/solana_nft:/webfront -p3000:3000 registry.cn-hangzhou.aliyuncs.com/kais_2020/metaplex bash
