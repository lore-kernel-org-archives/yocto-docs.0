Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 296CBC433F5
	for <webhook@archiver.kernel.org>; Tue, 18 Jan 2022 13:41:08 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web09.12597.1642513267053071755
 for <docs@lists.yoctoproject.org>;
 Tue, 18 Jan 2022 05:41:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gjY9PYzQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id n8so1023753wmk.3
        for <docs@lists.yoctoproject.org>;
 Tue, 18 Jan 2022 05:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=5h6yIHjL+UZ2UiWwJIh8ISqmwFybhUm1bphZJRb24tE=;
        b=gjY9PYzQpJFjYnLRYr8T+cLoJpbi10pP96lqtZWbKfBFJvsa4lQ0/Zln8sCUquyW5L
         Ys4LgPAFaLAltE/2tNQ/M9+sO7f4qY84RBF9JrsENf5i8w0PFEYXJwOnsh48ULeLojMf
         Lb5vSMlEvUrBAt6eJZ11zcN+kAwED5pQKTAi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=5h6yIHjL+UZ2UiWwJIh8ISqmwFybhUm1bphZJRb24tE=;
        b=DdEA8jomn56u33GM+ZWnIPUQTlQ3R9FtusRypyEV5nRw9ZrA1QyyP9SI2F0Q4gN010
         9EDUFvw0wd+pU7yF9uAWOogQP9iN/TCNO815So2qayZ0utu1C0Z4kvGODX5JDfjfWaO5
         NyPRRVZBs/h0sXLcAo8YSXLkcMbvjHYLNll2Qijq/CZ+N1mNnLQfaKx0iSfLnCCp1jTJ
         3EbPwfz2b7ijq1QzDGG/9YW9owwmJAyDXLLC+Dz/mGor2fKvFhdMNm2e9+o4kRRHwWSg
         +1y333CYgiOq/TzmfWzfSlwJ2G9sszi5UCDtxOT7R5kTHVGLa1y5Yie84muiaWv9HcRg
         asdQ==
X-Gm-Message-State: AOAM530ACng5K+B4FWuGOW8AnIzN/kH6IcptSqLwSSiZybYaXXLXRXtH
	7MGU59gHB++i9hL7bqoDHn/m6g==
X-Google-Smtp-Source: 
 ABdhPJwc8Rlj1DWZ6y9l4wOIZUoZv98P51m8qTrlyvuoe45K/jvS4GFenTr/6LBlQVx++Cb250NW4g==
X-Received: by 2002:a1c:f316:: with SMTP id q22mr32872025wmq.33.1642513265460;
        Tue, 18 Jan 2022 05:41:05 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:cdb:ba2:df58:76a3?
 ([2001:8b0:aba:5f3c:cdb:ba2:df58:76a3])
        by smtp.gmail.com with ESMTPSA id
 m40sm2677924wms.34.2022.01.18.05.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 05:41:05 -0800 (PST)
Message-ID: 
 <f59f0123cdaa1d9c26a551fcea896c82b99357c0.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] migration-3.5: mention task specific network
 access
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	docs@lists.yoctoproject.org
Date: Tue, 18 Jan 2022 13:41:04 +0000
In-Reply-To: <20220118130752.3463023-1-michael.opdenacker@bootlin.com>
References: 
	<CANNYZj83eY1hkzt-OGyfdxKSsvoQAedVJ4b1QSmspWfdnNRMrw@mail.gmail.com>
	 <20220118130752.3463023-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 18 Jan 2022 13:41:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2423

On Tue, 2022-01-18 at 14:07 +0100, Michael Opdenacker wrote:
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  documentation/migration-guides/migration-3.5.rst | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/documentation/migration-guides/migration-3.5.rst b/documentation/migration-guides/migration-3.5.rst
> index bd807eb8c7..df15487b10 100644
> --- a/documentation/migration-guides/migration-3.5.rst
> +++ b/documentation/migration-guides/migration-3.5.rst
> @@ -22,6 +22,18 @@ Recipe changes
>    recipes now need to use ``;protocol=https`` at the end of GitHub
>    URLs. The same script as above can be used to convert the recipes.
>  
> +- Network access from tasks is now disabled by default on kernels which support
> +  this feature (on most recent distros such as CentOS 8 and Debian 11 onwards).
> +  This means that tasks accessing the network need to be marked as such with the ``network``
> +  flag. For example::
> +
> +     do_mytask[network] = "1"
> +
> +  This is allowed by default from ``do_fetch`` but not from any of our other standard
> +  tasks. Recipes shouldn't be accessing the network outside of ``do_fetch`` as it
> +  usually undermines fetcher source mirroring, image and licence manifests, software
> +  auditing and supply chain security.
> +
>  - The :term:`TOPDIR` variable and the current working directory are no longer modified
>    when parsing recipes. Any code depending on that behaviour will no longer work.

Looks good to me, thanks!

Cheers,

Richard


