Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A612C433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 19:18:03 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.814.1633547882342797431
 for <docs@lists.yoctoproject.org>;
 Wed, 06 Oct 2021 12:18:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YkigA2T1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id v25so11861194wra.2
        for <docs@lists.yoctoproject.org>;
 Wed, 06 Oct 2021 12:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=evK+zjYrIqjOwgwoi9isOG1lOPCuYQH4MVA+TFeTovg=;
        b=YkigA2T1wSvZ5DfflnvR9v7S7ZZxjOAyCwzvrnYVUa9RHNuMUDBy30vrt3MOSm2Zvx
         0vGbSKgoD9RaxhIZ4TMGi7qxV381eda5O17lTg1UFQ/sSxoN2d4UwBL0J+PkREwqNAA7
         3Me3qp4PZab9RCRroKBkS5pWL7DdRt5DwQPCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=evK+zjYrIqjOwgwoi9isOG1lOPCuYQH4MVA+TFeTovg=;
        b=0s9WeFgGmV17zwEXqpjfgw9BfGVUoZ6ymxL9RyXI4y0GGoayWE80hMQjNd3SvUN5c2
         DMeAKRDqryBBV6P2NYl1Wlb/iSJqMwtPF26cobvd47Grl0aH9FVumuk570wGH+DmNVbB
         57QcatNRhXmPpWDvuqUWq8pASUJa4JRgcgZnhB1dEJl9yLuleFk6/59vgv2VLFjbRHDr
         BNFc2u5MypKlkNb8EIuPZlS+O30+Q5fg4/Ws4DpxOMWDHhMAwEl+OodOkD9OApxxmX+B
         hVT95UapJH2gS92R8ru4kQwS0E1N6TkNOvalFttTXCHZvP9MtauYyK9l8vVrenzpW0Uv
         tggg==
X-Gm-Message-State: AOAM530GOz1J74YkF5vEv5Wkp3TlPoW8xBSCOHiVPiykuoliMxfwGXml
	oGv9SHZri4lPQJzGemDfi8So5g==
X-Google-Smtp-Source: 
 ABdhPJx/TOdpqjbOqFGk8/BIUjx4tfCLexBQFaJ+upZaaS1H5LjSU1GA6l4NJ+NYFpUZjD2pjZqROw==
X-Received: by 2002:a5d:4212:: with SMTP id
 n18mr30318248wrq.162.1633547880731;
        Wed, 06 Oct 2021 12:18:00 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4ef0:3e29:718c:a98a?
 ([2001:8b0:aba:5f3c:4ef0:3e29:718c:a98a])
        by smtp.gmail.com with ESMTPSA id
 s13sm21001609wrv.97.2021.10.06.12.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 12:18:00 -0700 (PDT)
Message-ID: 
 <341253e1d24e58b01ead644537cbadfb0594d805.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] manuals: replace "apt-get" by "apt"
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	docs@lists.yoctoproject.org
Date: Wed, 06 Oct 2021 20:17:57 +0100
In-Reply-To: <20211006190319.963605-1-michael.opdenacker@bootlin.com>
References: <20211006190319.963605-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 06 Oct 2021 19:18:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1934

On Wed, 2021-10-06 at 21:03 +0200, Michael Opdenacker wrote:
> Modern Debian based distros (such as Ubuntu) now
> use "apt" instead of "apt-get"
> 
> Also make sure "apt" is invoked with root privileges (mandatory)
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  documentation/brief-yoctoprojectqs/index.rst     |  2 +-
>  documentation/dev-manual/common-tasks.rst        |  6 +++---
>  documentation/ref-manual/system-requirements.rst | 10 +++++-----
>  documentation/toaster-manual/setup-and-use.rst   |  2 +-
>  documentation/toaster-manual/start.rst           |  2 +-
>  5 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
> index 74167befad..c299df3b6a 100644
> --- a/documentation/brief-yoctoprojectqs/index.rst
> +++ b/documentation/brief-yoctoprojectqs/index.rst
> @@ -80,7 +80,7 @@ distribution:
>  
>  .. code-block:: shell
>  
> -  $ sudo apt-get install &UBUNTU_HOST_PACKAGES_ESSENTIAL;
> +  $ sudo apt install &UBUNTU_HOST_PACKAGES_ESSENTIAL;
>  
>  .. note::
>  
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index 71e5d6ef57..45834361bf 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -5874,7 +5874,7 @@ system image files much faster.
>        use the tool without specifying ``PATH`` even from the root
>        account::
>  
> -         $ sudo apt-get install bmap-tools
> +         $ sudo apt install bmap-tools
>  
>     -  If you are unable to install the ``bmap-tools`` package, you will
>        need to build Bmaptool before using it. Use the following command::
> @@ -7066,7 +7066,7 @@ to fetch the repository information:
>  
>  .. code-block:: none
>  
> -  # apt-get update
> +  # sudo apt update
>  

I think the prompt there is "#" suggesting you have root privileges. Maybe that
needs to be $ now?

Cheers,

Richard


