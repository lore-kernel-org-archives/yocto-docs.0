Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C93C433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Oct 2021 17:10:54 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.681.1635441052972697894
 for <docs@lists.yoctoproject.org>;
 Thu, 28 Oct 2021 10:10:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nU+ev9b6;
 spf=pass (domain: gmail.com, ip: 209.85.214.178,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id i5so4896733pla.5
        for <docs@lists.yoctoproject.org>;
 Thu, 28 Oct 2021 10:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=+LisBVJsoat9rXsWCPo7FNhAhENc1mf0lmQInpjEuuk=;
        b=nU+ev9b6Z2Jx5j5K7QBJQUKli3bsqVEDg8GB5GKirZYw4pp8wZ2ZNaJ1RMhzOAIsD9
         ApIa9pH3b2GyCpK1mtpLOC4F7GtAhLCqVW1MYEZp+es7w7+Kfx1RuPP7mPyduVgwjjYB
         PXzVWZmHs8ZfD56ExxzWuRqWB51aQzoNVUuUbRPCtP3pYEv7mXc7nQWEpe65lteEO2dZ
         T28SlP95HFrRp9S+Zz8/oRGAYky3rjPWPwq6lIyw6s6DaLb8mojfRU4R3HBp7jfdwsII
         Han5criaIU6dldcyo65TjTH0VkPhggO0oo3zRKnQazGsENOOoQWgdRcgJhX70oNjYNhW
         z4LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=+LisBVJsoat9rXsWCPo7FNhAhENc1mf0lmQInpjEuuk=;
        b=Xw6sRmu/64dWieNSFtRCI+jrQ62681EhS6dmTqLjIdboMjdWq0ZwHE6zIXz14IE8nQ
         qJClWHJ1LMi4mv+KI6bBIF0WfLRcIy+zXwX2ehoXNCroUbzd+IgloMj1qXVOM2g3N0Tc
         jtZJ16sIdH2PXyU3etfCJj8Ttm4EVecNgG+nyXXvkIU2VxCG6wB8wXgwYcqUUljvWKCF
         k2mrgBLNI9fOYRQ+b/MkgkCs2ZVOPRz6/ZvnDJOLtQ8vOl+r6QRYOUardCGMHaTh0M9j
         aDGyIqOdwOBubgb1EmVLRtwIOeluCGQcJFvDbSLbDqBSU4sLCUMcmCW4nBgITExreFwV
         MePA==
X-Gm-Message-State: AOAM533bXnTxoyLeLgqnN09ZCELPjJ9eFE3dajc5U1YT4mHqpi4Kl6KW
	u+2zAB/ECAECZPDUYm6o+tMNth/LoMk=
X-Google-Smtp-Source: 
 ABdhPJwa9tswDKIgZDc5/nIwN6R7pc2Spx/LRYsS0q/zrLQLPVJ6XLZlBHyKJy6RzBsiyBtD+4qByg==
X-Received: by 2002:a17:902:f550:b0:140:54d5:78bb with SMTP id
 h16-20020a170902f55000b0014054d578bbmr5090579plf.76.1635441052454;
        Thu, 28 Oct 2021 10:10:52 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:a5c0:c81:ea52:afe:f25d?
 ([2601:202:4180:a5c0:c81:ea52:afe:f25d])
        by smtp.gmail.com with ESMTPSA id
 d11sm4520526pfv.185.2021.10.28.10.10.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Oct 2021 10:10:51 -0700 (PDT)
Subject: Re: [hardknott][PATCH] poky.yaml: fedora33: add missing pkgs
From: akuster808 <akuster808@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
References: <20210909150842.3299672-1-akuster808@gmail.com>
Message-ID: <6ad9f754-bfe3-68f8-4498-4147af8c6b02@gmail.com>
Date: Thu, 28 Oct 2021 10:10:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210909150842.3299672-1-akuster808@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 28 Oct 2021 17:10:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2052

ping

On 9/9/21 8:08 AM, Armin Kuster wrote:
> [ Yocto #14188]
>
> The following packages where needed to a fresh FC33 install
> perl-FindBin
> perl-File-Compare
> perl-File-Copy
> perl-locale
>
> Error seen:
>
> openssl-native-1.1.1g-r0 do_configure: Execution of '/{snipped}/build/tmp-glibc/work/x86_64-linux/openssl-native/1.1.1g-r0/temp/run.do_configure.14627' failed with exit code 2:
> Can't locate FindBin.pm in @INC (you may need to install the FindBin module)
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> (cherry picked from commit 5b4127dd72a465ff8c962c425e78140ca8e536db)
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  documentation/poky.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/documentation/poky.yaml b/documentation/poky.yaml
> index 02c9bf3dc..7207df142 100644
> --- a/documentation/poky.yaml
> +++ b/documentation/poky.yaml
> @@ -19,7 +19,8 @@ FEDORA_HOST_PACKAGES_ESSENTIAL : "gawk make wget tar bzip2 gzip python3 unzip pe
>       diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath \
>       ccache perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue perl-bignum socat \
>       python3-pexpect findutils which file cpio python python3-pip xz python3-GitPython \
> -     python3-jinja2 SDL-devel xterm rpcgen mesa-libGL-devel"
> +     python3-jinja2 SDL-devel xterm rpcgen mesa-libGL-devel perl-FindBin perl-File-Compare \
> +     perl-File-Copy perl-locale"
>  OPENSUSE_HOST_PACKAGES_ESSENTIAL : "python gcc gcc-c++ git chrpath make wget python-xml \
>       diffstat makeinfo python-curses patch socat python3 python3-curses tar python3-pip \
>       python3-pexpect xz which python3-Jinja2 Mesa-libEGL1 libSDL-devel xterm rpcgen Mesa-dri-devel


