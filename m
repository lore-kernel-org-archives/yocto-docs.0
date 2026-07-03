Return-Path: <daniel.ammann@bytesatwork.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 435DBC44500
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 07:59:48 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87643.1783065582206835087
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Jul 2026 00:59:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bytesatwork-ch.20251104.gappssmtp.com header.s=20251104 header.b=yP1d4DhK;
 spf=pass (domain: bytesatwork.ch, ip: 209.85.128.53, mailfrom: daniel.ammann@bytesatwork.ch)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493b1710405so1356255e9.2
        for <docs@lists.yoctoproject.org>; Fri, 03 Jul 2026 00:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20251104.gappssmtp.com; s=20251104; t=1783065580; x=1783670380; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PrsuMnV3ofxtokpJvtINdCMaZAlFwXDeOzMNOGtw22U=;
        b=yP1d4DhKLOHdTpO0QI5gkikNi2GJnEYUdp0+oC6XAX3NxPPnIflkod+GuCryFD0M4Q
         2YzCeYXQCsIAh9F7jbETxT5FOm48mLRl7lidtepSrJWp+XpgK1eOn8Jy3w/HwrOVsVxH
         JWv1JB23y5Alx7zRhWs2Abmgtupx0mvMWSKKFf+wj2QypJxHr4aGzK+ZsF88McaXN41z
         gSXj3Ro7LtUDQ6syL20wVYcXSB8g4miDvehJM/a+yI/j3mGHO5axxIOaRZ/Ox20KXw/M
         zXT0D18lVipI/u/KvThhgLio1fQO/8ceHVM4Uyq4XHUiJBdQNIM3dTnQggId2u7RGgap
         VRSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783065580; x=1783670380;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PrsuMnV3ofxtokpJvtINdCMaZAlFwXDeOzMNOGtw22U=;
        b=cclNVFEvu6dfvvakJCseO6ZcbpFlELdomU36+meIbqR+67N38DL4HrUKv+ubcHZ15d
         DzPayZSXJwEQVtFIBQq8eYoxOhEXau1OdNYKnppfxyzWyeZz8MQE0qee6HL37ZHbRikh
         YZY63FEfMuK5ysNlxnd6osEz0eEjj8a7Kr01IOxasvtaFg6LXD5YseV20GIOPsmorQe5
         PQC5G6pKYnV4Rh/McBNJ7wy4WaEslUpJbAXWMngQuOZnizV9Qm/4h5aTk4eZSV3gJHDW
         8N0s1fsvTgsGKDHwt7czRLCERGxQS7vUv2IfhsXIr9yGhajHauQOnghhFZQoyBRlSH7l
         mI2w==
X-Forwarded-Encrypted: i=1; AFNElJ/5uAVP00Fm8faSDtpZe/aOMNomnrOcySssWxT8AEnvkBRaZulN07Lfz3vGEu18iHEp9w8m@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxNs6gbeMTsA4T7A6vH3TNqEMp6R1qKFCqi0P9MIcR10BLn1j0K
	RYmG+AiDXRXHIdX0KKKGdPEpbGeq6ERvqFPcnng3R81rBSrsRlyO31wHPQgWYxqXq4g=
X-Gm-Gg: AfdE7ck47dNZvpMS6AGiqfMapAP4Ma26OUVbb7fHwWEEBjmlgEmZPuIFa84Z9XiPnKV
	uqmHEpmxeyCQ1pP09VwF92Hu4o/qjL6Dc8DNSxZzd/2xrhBeZW7MjQd585k5kvvF0Ml9QlzjVSN
	P6/N56wJr84iNGGlZcjndpCnr0mdUGr2QXZ+PpfqdZiQF5CbVWjNWNfYM7EW9N7isayepj4sXqv
	6PWU2S8lwYKVQHSC+C54ur2+c7fE2dQvn9wHeGRHm9CrtKot3oWB2QdT54qpmxpmcDuqT0qAfIQ
	0nqI8PRKIWshikxjOMzfp27okV25omoQ44QhHYP6c9N3aGBYLfgo9tcm8biy92Y3LnEMWsRPQ9x
	FM2Gizov2riDO7c7SNQasZEZZfwDYQXnkCzmL3fxUs9vys/pVc85GgqmhiSHiO5ykKakI52gEK5
	FLajlW7NjVcYJtMbSQkyLa/pQ7EaLeIZ/7nk4n/bjmPzTAlXF5YPPLmrQ3
X-Received: by 2002:a05:600c:4e51:b0:493:bb0e:2832 with SMTP id 5b1f17b1804b1-493c986b332mr52780385e9.37.1783065580143;
        Fri, 03 Jul 2026 00:59:40 -0700 (PDT)
Received: from [192.168.2.42] (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bfe7427dsm114615365e9.2.2026.07.03.00.59.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 00:59:39 -0700 (PDT)
Message-ID: <69cf4a3f-6013-460b-924b-a54cef6bc593@bytesatwork.ch>
Date: Fri, 3 Jul 2026 09:59:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Daniel Ammann <daniel.ammann@bytesatwork.ch>
Subject: Re: [docs] [PATCH 5/7] ref-manual/variables.rst: document the
 LOCALE_UTF8_IS_DEFAULT variable
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260630-sync-documentation-conf-v1-0-da14b40cb515@bootlin.com>
 <20260630-sync-documentation-conf-v1-5-da14b40cb515@bootlin.com>
Content-Language: en-US
Autocrypt: addr=daniel.ammann@bytesatwork.ch; keydata=
 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
 cZ+2nBA=
In-Reply-To: <20260630-sync-documentation-conf-v1-5-da14b40cb515@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Jul 2026 07:59:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10007

Hello Antonin

See below.

Kind regards, Daniel


On 6/30/26 10:13 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Added by commit fcde0c43f7b5 ("libc-package.bbclass: add
> LOCALE_UTF8_IS_DEFAULT") in OE-Core.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/variables.rst | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 231f61d37..20bcf8d60 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -6083,6 +6083,13 @@ system and gives an overview of their function and contents.
>         :ref:`overview-manual/concepts:Package Splitting`. The list
>         contains ``${datadir}/locale`` by default.
>   
> +   :term:`LOCALE_UTF8_IS_DEFAULT`
> +      If set, locale names are renamed such that those lacking an explicit
> +      encoding (e.g. ``en_US``) will always be UTF-8, and non-UTF-8 encodings
> +      are renamed to, e.g., ``en_US.ISO-8859-1``. Otherwise, the encoding is
> +      specified by `Glibc`'s ``SUPPORTED`` file. This not supported for
                                                         ^ is
> +      precompiled locales.
> +
>      :term:`LOG_DIR`
>         Specifies the directory to which the OpenEmbedded build system writes
>         overall log files. The default directory is ``${TMPDIR}/log``.
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9986): https://lists.yoctoproject.org/g/docs/message/9986
> Mute This Topic: https://lists.yoctoproject.org/mt/120043675/3616718
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [daniel.ammann@bytesatwork.ch]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


