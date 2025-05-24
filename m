Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 312EFC54ED1
	for <webhook@archiver.kernel.org>; Sat, 24 May 2025 01:08:10 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.1690.1748048888986613284
 for <docs@lists.yoctoproject.org>;
 Fri, 23 May 2025 18:08:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kfaiE+go;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6f8ae08e3b3so4042976d6.3
        for <docs@lists.yoctoproject.org>; Fri, 23 May 2025 18:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748048887; x=1748653687; darn=lists.yoctoproject.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OIW9MkOtToTxfvQxYadUFbZvVjPfcRBH8Jgwp1VvJUM=;
        b=kfaiE+goGPaZoqX8Er8Rklw0o46Si4RPHUdXtp9gS0abEMQrUDJY+oWdmk2FvWYtGJ
         u/peFVVxK9LH7agQhFxxCGvHPcBL/SsNjzHhtJT6wrMDV9SypMxQ0aMw53bGd5glRSam
         x1gwSOyotu8zoGbIpkUUioMcGlhby8wSgEC8tZC4iQfRCWQa8Bw+E/XOD4iGYb1YX2KT
         aRYUNNqsDU4Lc13XxIWhjuRDHwGMhYV7DnGcC8Ty1VfMvU9ignMgzREarMROkDT8YR8O
         nKLtuOWkY2/RYxsZI81ABHsaN4JsqdVfO7p3AYk/aNHqk38BSY0ecXLoMTPEiI5k3eih
         OkWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748048887; x=1748653687;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OIW9MkOtToTxfvQxYadUFbZvVjPfcRBH8Jgwp1VvJUM=;
        b=C7dyj+MqG2FUNYqP4GcWKGG4B3Yx+E8mL5wDJ/9ic531BHdxhGTRn20Nz2SfvrT6kt
         +niriKdij9LN1q9mK3B6+OTQlFa0RqTeVYG3JOuG+EENTI4E7MQJfLEIoOqVrkAJXOdr
         DB755d02H3fRhtxm7wwGWadjSOJhIvI4MUupIg05XkknOgY3ZBc8tkNXaiAk69HX2Xk1
         ISAOtReCkaF7wMRnRE5EnBK/PUJFnxnhZ/lzeAuWuqPOxUawxtzceOk7GieGtc+uM2za
         qSfZvMS1vwRNG0/HbDMZVptzv5x23lgVncSKZicuMnCATxrwsCe8r/245JKGUkxdx5ZB
         aYoQ==
X-Gm-Message-State: AOJu0YwI1JZglu5Lk4BQ0WN1j7mYddrxFdf6Z5nCKh1GM2ZyiylOPVkQ
	sl82QxBHLxeTruWbu9Kkv5VnCXNDEbBex0pC+LwcVNgdB0qS5CGGrlPZGgzNHQ==
X-Gm-Gg: ASbGncvAtQVW2BT/+rq/HP4UBIzcv5mZjjGZakJuUteY5zgX+fIhMxz18Esyucc/R2J
	/djioxHE1cMGBKqLqJDDQLsdEQc1ukOFMAkG7EIqbnOpK+xhSALCFiwv458MrdvwkoMb3v91ZYs
	jRZBWc8OW5LvRbl7R5zJ3PI2/d9yTcAaLsPVJRcjAxa4+qlKv6532+sYcFsPU1W+dDPvCoe2Udk
	ZKUVWob578hz9E2Zytt7R0S7Ty6zw46Tquc8DItPcb4yO4F7wPs5TG2C3bj+QLp/kY6gG9JSKyT
	H10tGqG8aElPtbwQPPa53C7JUZPefeWc4E5YpFGjCXaACqbAhC//+vD3Uey8NAB0Y7dH7rReMaV
	Xmwz6Oo/YYSdqVw==
X-Google-Smtp-Source: AGHT+IHWMBky/quXSGt9GJOIUe2K5Zvem6GqdVVz62IWD4IoQeB1dtZMjEa2JV1Y9jMWHAzyCBSLBA==
X-Received: by 2002:a05:6214:4115:b0:6e8:9086:261 with SMTP id 6a1803df08f44-6fa9cfea47fmr21892246d6.3.1748048887303;
        Fri, 23 May 2025 18:08:07 -0700 (PDT)
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b097b5c2sm122190276d6.112.2025.05.23.18.08.06
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 18:08:06 -0700 (PDT)
Date: Fri, 23 May 2025 21:08:03 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: Re: [PATCH 1/3] sphinx-lint: trailing whitespace
Message-ID: <20250524010803.GA19014@localhost>
References: <20250524010609.40569-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250524010609.40569-1-twoerner@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 24 May 2025 01:08:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6892

Oops! Wasn't able to Ctrl+C it in time to stop all of them...
Please ignore this patch.

On Fri 2025-05-23 @ 09:06:07 PM, Trevor Woerner wrote:
> Fix all instances of trailing-whitespace as reported by 'make sphinx-lint'.
> 
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>  documentation/sdk-manual/extensible.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
> index d8d3858bfee2..a7546e728849 100644
> --- a/documentation/sdk-manual/extensible.rst
> +++ b/documentation/sdk-manual/extensible.rst
> @@ -669,7 +669,7 @@ SDK or eSDK:
>     ``devtool build``.
>     It also allows to benefit from the very good integration that IDEs like
>     VSCode offer for tools like CMake or GDB.
> -   
> +
>     However, supporting many programming languages and multiple
>     IDEs is quite an elaborate and constantly evolving thing. Support for IDEs
>     is therefore implemented as plugins. Plugins can also be provided by
> -- 
> 2.44.0.501.g19981daefd7c
> 

