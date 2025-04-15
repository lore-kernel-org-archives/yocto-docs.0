Return-Path: <daniel.ammann@bytesatwork.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1647AC369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 13:18:54 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.19854.1744723127001354581
 for <docs@lists.yoctoproject.org>;
 Tue, 15 Apr 2025 06:18:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bytesatwork-ch.20230601.gappssmtp.com header.s=20230601 header.b=CfFaxfOT;
 spf=pass (domain: bytesatwork.ch, ip: 209.85.128.43, mailfrom: daniel.ammann@bytesatwork.ch)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so35434935e9.1
        for <docs@lists.yoctoproject.org>; Tue, 15 Apr 2025 06:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20230601.gappssmtp.com; s=20230601; t=1744723125; x=1745327925; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=U2+rs4PSzCONWBau1WNQL1fvdpW5hWoI4fl/3e++Lpw=;
        b=CfFaxfOTlolHuZTixV4uIPgmSD0gikfssdAEs1finynr9TFt80lWyWfkgUmCHE0kH8
         4HtmCHZa/A1u9KM2Lu02G7WaPj7afmCgab01/J+jqnxj7/XpAtVqndb8LeWqi1NkY88N
         ZMTi2teVWZqr3mjfg2lt5Tvd+V7Vl0HoKMtiocuxmYF2dNzT83DnVp0zRgU1V/N2sCW0
         LtO9r1ikU4ygzhFyn7pZZV4xBMJ7ahLVe8xMLxQacclzlh4Y3KgkFWLpHc1WagrV8Ywo
         ImuFiuNhjslhNBjS2J93dQwsuzwxPQFbTyBhljvWyUIj12FnUb0zyhCs6GLYyS4G0gw+
         1jTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744723125; x=1745327925;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U2+rs4PSzCONWBau1WNQL1fvdpW5hWoI4fl/3e++Lpw=;
        b=jgJAOhUoYhJ6rzfK+/6CIFJ2K9TsmiSk4E/mHnZ9qpZRjaqeus4LH66DCk8Uj7kE/7
         jXF00HlTE63H7bjcdl0mNwCsMtlX5/zsY32odpZvbJSYPPCktogNwjJRbnWOnvQMwc2q
         GamXweZxAqnPBBykpq0gpkUXZAqlnlQUUYyZnMobalL/GQC/7ZAP1NQiTnao6RriKQk4
         /nDRvzGRJ/jQeU0yQUW/lfnFDrnGrJyrluPBS9/XuA47pSHqZlQqYOd7XYGWaXS+5vc/
         Edp0OytyV0yJDQ9ad4uvdkG9tp/9Zp7XHtZFf/JjLvVNEJwKqXn4v6xBaRWgJq5CotQE
         UEwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVEHPJ7gSixWJZBvL1D5r+iTHSTwRp9vGt6YIrWlyhTuOmbxUjwTv8MR8Mfm9uM0mQW2cM@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yy7VO7qTsUZtsddn4gnqJ+537nprHiHOxmzVspeD8KkjeO6RUxT
	Ok3veZPeNJ0TIVlaG0eFS7FkXpszSWCaFP2GoMOoul/AETcMRGlDCcQiNt+N5jI=
X-Gm-Gg: ASbGncthJcC7rxU3hT3nT65v+71Vjd/1Om9lAkH17q8zPHNR6xFanMjOdfOeHX0iZkG
	vAcg4AmnlkXStZtCT9FJHCbygFG3eAm37qVbsnBFAUm6Aobd3GFeZm89rJ3K2F4YnGq9DW03eEW
	zdauDAHE5/KbzNFyy9VGBn1gHExWgd7wYmHAdMYsXeEaDOyeK5cvgyKL6BQH/sflfKp6X2LRTzK
	1Zk+CAZDURqbjc+ZEaDtG9M/eFiYmmfqpKVi5BUCyVHkEiX0XccfS84PbRLKa7rt8tnzQVEkbsn
	sOqSyjwv/Wn5E7lH3S3kk3+TR0/XYiubgmeb8FWkbJmpMfkzeDYAFUziiuwcIj62naB9vdQNZUc
	dcblUSLSjxg==
X-Google-Smtp-Source: AGHT+IEQwCAo1PmhrwPPNxIupcolAOX21sJP63EBLXcW5iSddLVPlKOC6UqQ4/jKK5ps2RRZSVnvmQ==
X-Received: by 2002:a05:600c:4f03:b0:43d:186d:a4bf with SMTP id 5b1f17b1804b1-43f94c8a866mr26854345e9.0.1744723125039;
        Tue, 15 Apr 2025 06:18:45 -0700 (PDT)
Received: from [192.168.2.42] (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae9640fdsm14096712f8f.7.2025.04.15.06.18.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 06:18:44 -0700 (PDT)
Message-ID: <235677f5-9ad7-4653-b23d-7a57c5cd8812@bytesatwork.ch>
Date: Tue, 15 Apr 2025 15:18:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH]
 migration-guides/{migration,release-notes}-5.2.rst: notes for systemd
 pni-names
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Enrico_J=C3=B6rns?= <ejo@pengutronix.de>
References: <20250415-systemd-migration-note-v1-1-24f9ee7c2b94@bootlin.com>
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
In-Reply-To: <20250415-systemd-migration-note-v1-1-24f9ee7c2b94@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 15 Apr 2025 13:18:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6747

Hello Antonin

On 4/15/25 14:41, Antonin Godard via lists.yoctoproject.org wrote:
> Add a note to the migration guide regarding the pni-names behavior
> change.
> 
> Suggested-by: Enrico Jörns <ejo@pengutronix.de>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/migration-guides/migration-5.2.rst     | 7 +++++++
>   documentation/migration-guides/release-notes-5.2.rst | 7 ++++---
>   2 files changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/documentation/migration-guides/migration-5.2.rst b/documentation/migration-guides/migration-5.2.rst
> index 6b7d02d65..9df04d291 100644
> --- a/documentation/migration-guides/migration-5.2.rst
> +++ b/documentation/migration-guides/migration-5.2.rst
> @@ -104,6 +104,13 @@ systemd changes
>      ``journald.conf`` to "persistent". The ``/var/log/journal`` directory is now
>      used for logging instead of ``/run/log``.
>   
> +-  If ``pni-names`` is not in the :term:`DISTRO_FEATURES`, the `Predictable
> +   Network Interface names <https://www.freedesktop.org/wiki/Software/systemd/PredictableNetworkInterfaceNames/>`__
> +   systemd feature will now be disabled. Previously the feature was still
> +   enabled even if ``pni-names`` was part of :term:`DISTRO_FEATURES`. Make

Shouldn't this be "was *not* part of"?

> +   sure to add the feature to :term:`DISTRO_FEATURES` if you want to keep this
> +   systemd behavior.
> +
>   Multiconfig changes
>   ~~~~~~~~~~~~~~~~~~~
>   
> diff --git a/documentation/migration-guides/release-notes-5.2.rst b/documentation/migration-guides/release-notes-5.2.rst
> index ac9c6319a..0ac276c1e 100644
> --- a/documentation/migration-guides/release-notes-5.2.rst
> +++ b/documentation/migration-guides/release-notes-5.2.rst
> @@ -523,9 +523,10 @@ New Features / Enhancements in |yocto-ver|
>            ``${libdir}`` if the ``set-time-epoch`` :term:`PACKAGECONFIG` config is
>            set.
>   
> -      -  really disable Predictable Network Interface names if the ``pni-names``
> -         feature is not part of :term:`DISTRO_FEATURES`. Previously it was only
> -         really disable for QEMU machines.
> +      -  really disable `Predictable Network Interface names
> +         <https://www.freedesktop.org/wiki/Software/systemd/PredictableNetworkInterfaceNames/>`__
> +         if the ``pni-names`` feature is not part of :term:`DISTRO_FEATURES`.
> +         Previously it was only really disabled for QEMU machines.
>   
>         -  split ``networkd`` into its own package named ``systemd-networkd``.
>   
> 
> ---
> base-commit: 1ed64dbdf4a60b000305cdc2c67dc24f4bc97ef7
> change-id: 20250415-systemd-migration-note-36e893cced28
> 
> Best regards,
> --
> Antonin Godard <antonin.godard@bootlin.com>
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#6746): https://lists.yoctoproject.org/g/docs/message/6746
> Mute This Topic: https://lists.yoctoproject.org/mt/112275153/3616718
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [daniel.ammann@bytesatwork.ch]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

Kind regards, Daniel

