Return-Path: <daniel.ammann@bytesatwork.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BA60CDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 12:23:28 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.212761.1697545400980134397
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Oct 2023 05:23:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bytesatwork-ch.20230601.gappssmtp.com header.s=20230601 header.b=PWSkzW86;
 spf=pass (domain: bytesatwork.ch, ip: 209.85.208.49, mailfrom: daniel.ammann@bytesatwork.ch)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-53de0d1dc46so9744310a12.3
        for <docs@lists.yoctoproject.org>; Tue, 17 Oct 2023 05:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20230601.gappssmtp.com; s=20230601; t=1697545399; x=1698150199; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=73CtWiPX+fKgj4mfmgj8qbp4mwo2p0k8gf7lgPJkpdU=;
        b=PWSkzW86aA01zFtU/zgblaALi1XvPDTX6ZlyvX6FQD0bWzTCIf7Kr/M2Eye4Hmd3/k
         kqRhDUJUFL4Fyig7mqA//3rWEGhb4LqeZBKWKtCyt3L9TS9s4yxcFqr4YWEbuh07MU9K
         jowa3j8sRKuASNt5y0zHowjrkEK2UrfAqC8MaDgJVYG4byTR1BybYjm8y44C4ldBDxs/
         dFJ6Qg0hw4RQu++m0pnodZfKvc8rWN3pKdEYh8wqcblk/wZa/475mVl6yGRKPZhLkIt2
         Li3Hq6E8tp55hXky1mZ2niw4oLFBciSQxD8cSvHtkHHl/YhzMkoMwwxc6uXMzei4TC67
         29RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697545399; x=1698150199;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=73CtWiPX+fKgj4mfmgj8qbp4mwo2p0k8gf7lgPJkpdU=;
        b=kJtg9pR/G5lo59ZPofL5jvgiPzer2U92OL8ey7snt/r9cdqoN//jledYOsBthy7iPc
         cigSSk26HA1kTQlnfm6KJbjfDtRjq4E90n2sPJgwx5UiO1NoH00ts9CGYdOA0W9uvFU9
         Kfq2TgNaZh+5odzohcnlcEFhXYPq8RZjs010KTUrCMwMBoL5S/81I4fPieQImVDkDElA
         iOBb6+AIfD+RLXmlfXRE0EZrx6EOmq13lHvLBPuFpkYpSZsW6qlnVxLD2s9/J0f4SxTC
         ++mnCkOZiOroxBKeOrHOrKJNHo2PO5FBCVpknLB0zhGFbDiq80+smlZhh/kah0Rqkm2k
         dyqQ==
X-Gm-Message-State: AOJu0YyDZIDNTF2OxSEwRCynFEgxjFcoQsguvOjg7UrHX8Bf2Coo2+Wo
	D+tuM+NAqQTKZY+tsSOaIQvhUw==
X-Google-Smtp-Source: AGHT+IE/uofVzrmv+0cWRCBF2UDWpoKcjnPkSbpGgffGSPePfDD8ClTz4VTddPYhNbe9rarkKFHKRw==
X-Received: by 2002:a50:9343:0:b0:53e:332e:3e04 with SMTP id n3-20020a509343000000b0053e332e3e04mr1599032eda.37.1697545399352;
        Tue, 17 Oct 2023 05:23:19 -0700 (PDT)
Received: from [192.168.2.42] (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id k21-20020aa7d8d5000000b0053e89721d4esm1102726eds.68.2023.10.17.05.23.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 05:23:18 -0700 (PDT)
Message-ID: <648ca8a6-28d6-4456-90ad-ab3f16e876f1@bytesatwork.ch>
Date: Tue, 17 Oct 2023 14:23:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2] ref-manual: variables: provide no-match example
 for COMPATIBLE_MACHINE
To: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Quentin Schulz <foss+yocto@0leil.net>
References: <20231017-dev-compatible_machine-v2-1-ea04bf0eff16@theobroma-systems.com>
Content-Language: en-US
From: Daniel Ammann <daniel.ammann@bytesatwork.ch>
Autocrypt: addr=daniel.ammann@bytesatwork.ch; keydata=
 xsFNBFSqWLUBEADJA3W9rHq6RvCVdN9KOKS0d39M56pt0eDR2za/6fMj/+Q0SuTvWs+6/6gQ
 gbfpkYIxuWLEPGL252Yi7brgCWMhGMDW+HZ1E9LqYCjemu6PSgPkWd+x9o20zcv4CDSAJ5+9
 iKhk4Jwz3LN65e/e5L4RZbqgkQFvOVSpPJnkBhMCaRM0u5sWTSK6fH72hn7uv2I4ixfSi3MQ
 k8Ev2Npmdas88wDWKgIG00VQzQlKXLcN0WVOmcTGKa/NNV24hKDR4CJWjAp8uuSWO0ZSRBUB
 zU+kleuuS8LHPN7SRRnIOXKI0er5IKDWp7JxTThmqht6zm6X2+17o7mH7fNJekCws4I9Cx2q
 DVkNzHjAClF1IJqghNnL4yarWkD3hfQMZrmRRfgRbX26WcCqN1DD1aQgNau8O5NiCAEgIizt
 5Q8Ghtus13GjmXiMcImV5Y9ELEt+BYSoLdSYG2/Wobcsna8IASqVlpuzdrbFLgPTZkucnDZH
 32F8VccDn11V+uHXYrQCEpVAnhxCwgGXFVxzqwLxALBwBOIEfh8T7CQpWxr2MYqs2iCeM6Sa
 ybc2LCAOz6VtUZzepYxnj74T5aqNDi8k8yzb4ZLuz1TA1aKIOZZxSeC24wo2vXn+ami39oc7
 LqGu264QOnPEvt2pKJfUoP12rFrX8cg8iXZZWRQC+coxPQ8E3wARAQABzSxEYW5pZWwgQW1t
 YW5uIDxkYW5pZWwuYW1tYW5uQGJ5dGVzYXR3b3JrLmNoPsLBeAQTAQIAIgUCVKpYtQIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQCGA+QlwTAu5TAhAAl9LU3+Aw5gIwY9RNnw3W
 xadKsshpn702ug1nCa5dyIbmWa94hU+tdLroY7i/JCpvnhg8qfLNxc4ho5l/awr8dXoSlK/O
 nV96EEBs7yygANJktlyjjzRKTIeJ27cd6rbAgNR6bjABvPB2rhp7fMeVqrLzE2vgUxBTStPO
 feI/4pzIxNaqgEaCxGa2NqjMuOzycKuLw1p72GMoaS6AVPZvGZa/c+i23GROzd7LQhvNCO3+
 SPhYcyIzO0SASGbrMS3ZnEQNKrl4v9H+rVjTsSbf4ZogrhxuAJGxGnEPWBXL7+59c8vBLQTp
 Q65uNsoAh1tCzQ15hZ6Fnq5pa1DOJZlfYI55tYZja1p/ZCTVNmz+uuw2BnezEcnTdYgzLASc
 quxEw3Of032GJFxfBmVeMnd7PppKd8MzUZXrbHN3INFP/UJplvDAvUFVZR+b3A8d2DEaxe0N
 ZvEzf6wcMC+kve/rYsU1p0gH3NAToZHKVCY1wAlYKsBZNzqrVnEP/1/YMoMmKf7JA7tU17J3
 mM6KcASvuoF/uC/61Znhyx8wJDaSPN6w4IwkbY+bD7gsmhuJw/1ENmF8DV0PL4YRlnqHw/hG
 sA0vCh/ZSqpLO5GMrNKyKT0D8h4HUd2cCeam/oHA/jjosJ77uxBOWAwXU2y0EdYabF2NFQVv
 Eou/OIlUzBmrqvvOwU0EVKpYtQEQALcNPgnA21lxCdJ736SWoIJb8eZxIlAySlr8lILia3fZ
 xb0uwyD0u8qlJeOE1vfkO3VZwdtlYLuWDFVXfg1v59vmid97UkrC56W7rQRXU+9WBjNoMQZ6
 kamRUzJ2FqurCAhDpa+yHwHrGriHcfu778krBMNQ10B4+0vnG4qsisyEM52rSaMJd5gtBy1v
 8kssT/MKeR+8EOkfiM7L2uJK4Hv7gxW0xlVKprzwPsKodAt79/C9qoi2pWIw1zu0mYi+zEIg
 gFxv/EVnZHqpQ2lIElDriyhJ2azO3RsCwSm75QWWOZ+ucJljicaCs49rP/i/XnhVUnl5EOk/
 +lZJECzdTOebSZuN6TINcb9B6AaqMz37ZH+RFxYij2fKvIWDrchYQITwoqiULXaRzasbloLZ
 Oz/z+PaRQZTIcXsYcML2raJsq89GaEspYTxgp+ccYUwSXty6akDWYIhW+P5LTc7vDMHa4BcN
 kMi5itbalRUSH5KG/YCDje4JNK3e4pVhob8nRw5vwL0hCMN9dDq+AgfKOytwoRdnoS+d23+H
 CPtfQZAeQtiRFiW57ju4IbkBaHZin2msVPekIEwEE4SMi6ebZVtLZdXoJC1y/lg1AyXa6D1e
 b0draLiFppr79tFq57fUTuknMXtUszz9sP79Syg4s15RsNr3CfdmkuSXsaWKeDfLABEBAAHC
 wV8EGAECAAkFAlSqWLUCGwwACgkQCGA+QlwTAu5q8w//VOrumimrcROPBSdU+IxmE3hoPn/A
 RAm91+s6OhKNrzu1XMv8W44kM4JyAuN7sBYgGYInnyk4la5oVVTeeAELZ/BZVec5uD1uDez7
 D0kvdV7pB+pXRLNgZsrwmPDJVIRDXdHTbtHKrF5haf83n6QGZhPRmRDKj1/BCuaM4r+fkvLH
 tPLtbMnugrFkaOQhr/fjRaxdDSk1Pxa8ocM9qDkc67XWJa6EmZMn9VHWFmxuc6rBpGsPu6P+
 WrDbBSusCYsqoaMm7y/MFUS3dZPqV6Jm9EDrMpQwdfjtsN0VPyX2DpYMcI4y6SC12oG+20rq
 eKJlUhtwf7n2Mco1/MtRfQzfw7UZYtGhS939Nl+KuRLveteZY3xOozNffxjVBY6fMlDtX9cJ
 o+8bnuYBiDGKBrFObmb2R/FW/Pe58JFjjQVB4PsAu9keBhp0JzAEkaTtdDFl684jZKOX9I8u
 urJuhi2NwlMuen66l1CjurXLcrdRxstkyIyMOPZKYpWXdxwQ4sciqVe2b6wehAlX0SZs7Euk
 nhFGvgnYYjBRd6K5uhRJX8ViJ6pRW3V3avqToboBr3XdJYehvU1KBd1AORSBytZjx7f7WlM0
 FEG95juQ7F6TU0brLlL0rsW2OoRsZ3mIYI/fLhiysBKOQe+zEnJFPSSxiEKnnQOlM4sll3am
 cZ+2nBA=
In-Reply-To: <20231017-dev-compatible_machine-v2-1-ea04bf0eff16@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Oct 2023 12:23:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4397

Hi Quentin

Comments inline.

Kind regards

Daniel


On 10/17/23 13:45, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> 
> COMPATIBLE_MACHINE is used to forbid the use of a recipe or its packages
> for a specific set of machines.
> 
> In some cases, it may make more sense to have the logic inverted and
> have the recipe always forbidden except for hand-picked machines. Such
> could be the case for pieces of software that only support some
> architectures. In that scenario, it is sometimes a bit easier on the eye
> and for maintenance to use the OVERRIDES mechanism but for that, a
> default should be set.
> 
> COMPATIBLE_MACHINE:aarch64 = "$(aarch64)$"
                                 ^ shouldn't this also be "^"?
> COMPATIBLE_MACHINE:mips64 = "$(mips64)$"
                                ^ shouldn't this also be "^"?
> 
> wouldn't do much because if COMPATIBLE_MACHINE isn't set, the recipe is
> assumed compatible and therefore, if no default is provided we enter
> that case.
> 
> Hence, we need to add
> 
> COMPATIBLE_MACHINE = "^$"
> 
> as default so that it only matches the empty string, which isn't
> possible for MACHINEOVERRIDES.
> 
> Cc: Quentin Schulz <foss+yocto@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> ---
> Changes in v2:
> - use double backticks instead of backticks surrounding machine
>    architecture to stay consistent with the rest of the file
> - Link to v1: https://lore.kernel.org/r/20231016-dev-compatible_machine-v1-1-6528e1c98611@theobroma-systems.com
> ---
>   documentation/ref-manual/variables.rst | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 11523bb9e..f7507038d 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -1358,6 +1358,26 @@ system and gives an overview of their function and contents.
>         speed since the build system skips parsing recipes not compatible
>         with the current machine.
>   
> +      If one wants to have a recipe only available for some architectures
> +      (here ``aarch64`` and ``mips64``), the following can be used::
> +
> +         COMPATIBLE_MACHINE = "^$"
> +         COMPATIBLE_MACHINE:arch64 = "^(aarch64)$"
> +         COMPATIBLE_MACHINE:mips64 = "^(mips64)$"
> +
> +      The first line means "match all machines whose :term:`MACHINEOVERRIDES`
> +      contains the empty string", which will always be none.
> +
> +      The second is for matching all machines whose :term:`MACHINEOVERRIDES`
> +      contains one override which is exactly ``aarch64``.
> +
> +      The third is for matching all machines whose :term:`MACHINEOVERRIDES`
> +      contains one override which is exactly ``mips64``.
> +
> +      The same could be achieved with::
> +
> +         COMPATIBLE_MACHINE = "^(aarch64|mips64)$"
> +
>      :term:`COMPLEMENTARY_GLOB`
>         Defines wildcards to match when installing a list of complementary
>         packages for all the packages explicitly (or implicitly) installed in
> 
> ---
> base-commit: ceb1812e63b9fac062f886c2a1dde23137c0e1ed
> change-id: 20231016-dev-compatible_machine-2b0d5c26e12a
> 
> Best regards,
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#4394): https://lists.yoctoproject.org/g/docs/message/4394
> Mute This Topic: https://lists.yoctoproject.org/mt/102015677/3616718
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [daniel.ammann@bytesatwork.ch]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

