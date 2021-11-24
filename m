Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5498BC433F5
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 18:11:01 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web08.1711.1637777459779918991
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Nov 2021 10:11:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RkU0L0Yh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id j3so5839636wrp.1
        for <docs@lists.yoctoproject.org>;
 Wed, 24 Nov 2021 10:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Lj2uYv3S0qxcgVXzrFuOdv/juwfTjNG+O9qzx/yzQ0o=;
        b=RkU0L0YhmZcvF8/aRQfmAGWGUyLIWA6i7anCcIWjk7HwCTUnXJyNUf5kMbIA8DRJrT
         igr7Mw3ELD+skgLSUMNuRDso+3lbbV8IQ2uZYPBz3SGAhVBQ7wmpcrxwYwX3oCqCukMw
         8/RXM66MUmqyOCZX1NtpjZxxTa8XHAOTWHmRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Lj2uYv3S0qxcgVXzrFuOdv/juwfTjNG+O9qzx/yzQ0o=;
        b=mnEJkKLKprRtvXGbTTkuHz9VE3Ss3mGAj3zNNaoTN6dQyf8eiqn8Y7WZ3ni7XlER3R
         ZgpP/yUwi3fPhjS4sbiDCMqdgXdbbBlWpmqU3Go/uvMyXKRTX8nKAIH0fjtKEKeZsNAa
         E8W2Er3t1ZOuSF2S+Ds8v+m3xlXDwPgv6eWZBDo5TgOj0DuWsih9h/wjyGms8Fd1nbUD
         2pjjB5WAU9qFWu8qqGO2YHbzg/UODuesnS3iiBNKQI52i5cWic9g7YlQpqa3g+dJ7uTr
         cyae67uSM5uc6Vy1DykcOj0Qw+SEgOKlXVhOrA+fgGFUvVcEWt0lgGTJUPj1Bfl5yjTt
         BpLQ==
X-Gm-Message-State: AOAM530RGFkvFAGiqcz5mxmnDkHBsnOMVi0T6ffP+qphDUg4FgK+/98L
	Fbg1KJpS3mJ8pMlnJk2R5C0Fpg==
X-Google-Smtp-Source: 
 ABdhPJyyF9H46JOxVzG0M0aP7KFhIKZt2Ubl8dHAGjkEpHokOs25wMMizzQwuETGvD6wV/BRbNkGTg==
X-Received: by 2002:adf:f602:: with SMTP id t2mr155463wrp.539.1637777457959;
        Wed, 24 Nov 2021 10:10:57 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:246e:77cb:e23:80f?
 ([2001:8b0:aba:5f3c:246e:77cb:e23:80f])
        by smtp.gmail.com with ESMTPSA id w4sm489481wrs.88.2021.11.24.10.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 10:10:57 -0800 (PST)
Message-ID: 
 <98664c40610ee3163638a373f105f29c9c70a912.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH yocto-autobuilder-helper] scripts/run-docs-build:
 remove gatesgarth
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	yocto@lists.yoctoproject.org
Cc: docs@lists.yoctoproject.org
Date: Wed, 24 Nov 2021 18:10:56 +0000
In-Reply-To: <20211124171617.2088604-1-michael.opdenacker@bootlin.com>
References: <20211124171617.2088604-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Nov 2021 18:11:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2193

On Wed, 2021-11-24 at 18:16 +0100, Michael Opdenacker wrote:
> Together with the corresponding Bitbake version, which are no
> longer supported.
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  scripts/run-docs-build | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/run-docs-build b/scripts/run-docs-build
> index 3db4a97..5e1d649 100755
> --- a/scripts/run-docs-build
> +++ b/scripts/run-docs-build
> @@ -35,7 +35,7 @@ mkdir $outputdir/bitbake/next
>  cp -r ./_build/final/* $outputdir/bitbake/next
>  
>  # stable branches
> -for branch in 1.46 1.48 1.50 1.52; do
> +for branch in 1.46 1.50 1.52; do
>      git checkout $branch
>      make clean
>      make publish
> @@ -68,7 +68,7 @@ mkdir $outputdir/next
>  cp -r ./_build/final/* $outputdir/next
>  
>  # stable branches
> -for branch in dunfell gatesgarth hardknott honister; do
> +for branch in dunfell hardknott honister; do
>      cd $ypdocs
>      git checkout $branch
>      make clean

I'm a bit torn on this. They are no longer officially supported releases now but
it may make sense to rebuild all the sphinx docs in this script rather than some
subset?

Cheers,

Richard




