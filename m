Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBB3CC004D6
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 15:11:32 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.42358.1695222684207832914
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Sep 2023 08:11:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=NRkZPXEN;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-401d80f4ef8so76111315e9.1
        for <docs@lists.yoctoproject.org>; Wed, 20 Sep 2023 08:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1695222682; x=1695827482; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DxnN5GGrQa98hktsylmtDCsYx5+KZFiUlfphM+HBqws=;
        b=NRkZPXENgokWKXlHVTsRdxlh2dfOafrHdaQQDpcvQkvOlTAYH8c47WXLFBHwxYg7hb
         ybSIE22INv/XQDt0U2dg45P1434S6cLqXPwAdm+CPDvy/Z4k1GDsx+umaQKXZqj6RxbK
         p96nKShh1pf4053VSUtaMoBOJ6cUDPL+EeZJ+rPCQJS/x0tGwdtiAFJtLM6aG7i5LKcL
         /IvlemhgG5CgbShmwzhC/d2QRiKv6srsnrqhu7BdbOHEsw2ZzJGjaCDdzdRueE9GrLUY
         DolRtNCLCoy+aINmmB4K+wJw4Xgupxt5uiUPfN+2ab49GkJurC2tT41NavzYZn6KGHik
         X/Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695222682; x=1695827482;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DxnN5GGrQa98hktsylmtDCsYx5+KZFiUlfphM+HBqws=;
        b=HqD22Th8ulYivrNDJH/XOUiXnEsAXMgY9gQKjxW11rUtOp9F8i2Bmj1T4l6AKlFR2+
         T7BomON596yGmkCHXZs/dPorZbcWiHqb5tdPCK7IUV2EgVp3/Xt5USjv6VvULfRAKwz3
         88GgwRHsbeASe6RhWoXYz0ia4qO/wWTk57Sr7C6Ou1MxIkaFP7WoBJKpGrEODEX7PpdS
         uILlh43m4fFDcSUgRx39/i9ASvX0ciCjvlHdWvztL3UlMjwskzUBzdevcfjT3uvFNtxU
         Ga8s/MPNFJkRVvQE0jUtunAWcwi3hTw2G3SnLV+HLkYVTcslm1bZXDecFVOzmYoewt7q
         bHiQ==
X-Gm-Message-State: AOJu0Yy4SHVN8UNeKoBO5qRSYQlGGO1kV7jaS7cYMeASztl00HNyhOyR
	lYkbtgQaSeUaMzVRSI1RTN+Y4g==
X-Google-Smtp-Source: AGHT+IFZnEVIfnOi5ZqaNX1QdbmAbPRKJTcvOMEs+U65EwWlB5NkOYrDG5bH/1EYgHImy/kDfiFosQ==
X-Received: by 2002:a7b:c4cb:0:b0:3fa:8db4:91ec with SMTP id g11-20020a7bc4cb000000b003fa8db491ecmr2850845wmk.10.1695222682492;
        Wed, 20 Sep 2023 08:11:22 -0700 (PDT)
Received: from [10.1.9.164] (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id f11-20020adff58b000000b003180027d67asm18774389wro.19.2023.09.20.08.11.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Sep 2023 08:11:22 -0700 (PDT)
Message-ID: <95b653db-9dd2-7fe9-189c-03d646a57b20@smile.fr>
Date: Wed, 20 Sep 2023 17:11:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [docs] [PATCH] contributor-guide/style-guide: Add a note about
 task idempotence
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 docs@lists.yoctoproject.org
References: <20230920145954.1055731-1-richard.purdie@linuxfoundation.org>
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <20230920145954.1055731-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Sep 2023 15:11:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4276

Hi,

On 9/20/23 16:59, Richard Purdie wrote:
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  documentation/contributor-guide/recipe-style-guide.rst | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/documentation/contributor-guide/recipe-style-guide.rst
> index 1a1c1c6ee..040536058 100644
> --- a/documentation/contributor-guide/recipe-style-guide.rst
> +++ b/documentation/contributor-guide/recipe-style-guide.rst
> @@ -257,6 +257,16 @@ Tips and Guidelines for Writing Recipes
>     and ``-nativesdk`` ones, whenever possible. This avoids having to maintain multiple
>     recipe files at the same time.
>  
> +-  Recipes should have tasks which are idempotent, i.e. that executing a given task
> +   multiple times shouldn't change the end result. The build environment is built upon
> +   this assumption and breaking it can cause obscure build failures.
> +
> +-  For idempotence when modifying files it is usually best to copy a file 'X' to
> +   'X.orig' only if it already doesn't exist before copying 'X.orig' to 'X' and
> +   modifying 'X'. This ensures if rerun the task always has the same end result

I have a hard time parsing this phrase :-/

How about :
 For idempotence, when modifying files, it is usually best to :
 * copy a file 'X' to 'X.orig' (only if it doesn't exist already)
 * then, copy 'X.orig' back to 'X',
 * and, finally, modify 'X'.

(Not being a native speaker, I've no idea if this is really better T_T)

> +   and the original file can be preserved to reuse. It also guards against an
> +   interrupted build corrupting the file.
> +
>  Patch Upstream Status
>  =====================
>  

Regards,
-- 
Yoann Congal
Smile ECS - Tech Expert

