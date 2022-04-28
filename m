Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60F92C433F5
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 08:44:35 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web12.7631.1651135469333575696
 for <docs@lists.yoctoproject.org>;
 Thu, 28 Apr 2022 01:44:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VqwAqrAk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id v12so5731565wrv.10
        for <docs@lists.yoctoproject.org>;
 Thu, 28 Apr 2022 01:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=klddqvcm9LWreT/K8rTfTnaJBCBsX+N03TfNgnYbte0=;
        b=VqwAqrAk/X77wNkOVs4GpWB5wVDuyf395lRl/zHAcOFKVFSji5Ah4o/ZF6hupZ/Vt0
         cER9SWAfAI6N9yrNhef5cpcZNDC+VW2br3M9ZWA0DOT64h8/PIe2YOlScUTQILI06q+h
         19/jNT2YXFLuA1ohbxz3AyRltYT83KQZGJi/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=klddqvcm9LWreT/K8rTfTnaJBCBsX+N03TfNgnYbte0=;
        b=hBclp2I9HYOi6zDIdMjZkq7qEBmWmJkqZvxBLbK2wkaD9V7KzHKk3IhcdjUqGOBk1U
         ERbn6tYX53Kjw5nyx5QV1ZHAcTK4uF8SixCYp3tUZnZ2L9iRAUeKJOMQVikmDdcUMR6O
         nzaEntB3Zwruasd9i3qiqpce7MtZejwYWPzszoPG24/IGJUO1xP7X9mC7WXb75y+zKy7
         edO4Y4xs9wUWXOsWO+nlTEd5UWvE44uwn4oyA4eaUR1tKBDHNCaXwb8L6F7HiXXVyK/y
         H82nXE1x42xml/aOcQRSFz/wIQSl0EXwtj/T0MsGluWrEeweT8eohY8cS3JOhDk9fnHC
         nBUQ==
X-Gm-Message-State: AOAM533T/5emc93+fmgBZYa/yx6p6KZsD0n19/g2pXW3k/WmEiZKUb5W
	H7fKOesTy/ehQPNPxkQ46X+wdA==
X-Google-Smtp-Source: 
 ABdhPJzSz07vanLwP+ztPje1FET7iuXs4OTYZBQxjFj43Sk1W2MfXj6QH03xJNDfL1lMq+Y/v16QIw==
X-Received: by 2002:a05:6000:156d:b0:20a:e015:315f with SMTP id
 13-20020a056000156d00b0020ae015315fmr13392644wrz.140.1651135467551;
        Thu, 28 Apr 2022 01:44:27 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e3fc:fa86:a530:4b66?
 ([2001:8b0:aba:5f3c:e3fc:fa86:a530:4b66])
        by smtp.gmail.com with ESMTPSA id
 j8-20020a5d5648000000b0020af42ae172sm1740778wrw.87.2022.04.28.01.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 01:44:27 -0700 (PDT)
Message-ID: 
 <5438037befca4f22b78f0f8e45843891b2cd8345.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] docs: set_versions.py: remove hardknott from
 active releases list
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>, Quentin Schulz
	 <foss+yocto@0leil.net>
Date: Thu, 28 Apr 2022 09:44:24 +0100
In-Reply-To: <20220428081706.526839-1-foss+yocto@0leil.net>
References: <20220428081706.526839-1-foss+yocto@0leil.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 28 Apr 2022 08:44:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2901

On Thu, 2022-04-28 at 10:17 +0200, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> 
> Hardknott 3.3.6 is the last release of the series and the release is now
> obsolete.
> 
> Let's remove hardknott from the list of active releases.
> 
> Cc: Quentin Schulz <foss+yocto@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> ---
>  documentation/set_versions.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/documentation/set_versions.py b/documentation/set_versions.py
> index cd02cc739..c4be1ae41 100755
> --- a/documentation/set_versions.py
> +++ b/documentation/set_versions.py
> @@ -23,7 +23,7 @@ ourversion = None
>  if len(sys.argv) == 2:
>      ourversion = sys.argv[1]
>  
> -activereleases = ["kirkstone", "honister", "hardknott", "dunfell"]
> +activereleases = ["kirkstone", "honister", "dunfell"]
>  devbranch = "langdale"
>  ltsseries = ["kirkstone", "dunfell"]

This was on my todo list, looks good to me, thanks!

Cheers,

Richard


