Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4670BC433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Oct 2021 17:11:20 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web09.658.1635441079763344130
 for <docs@lists.yoctoproject.org>;
 Thu, 28 Oct 2021 10:11:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hpGbgp0D;
 spf=pass (domain: gmail.com, ip: 209.85.215.182,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id c4so7001234pgv.11
        for <docs@lists.yoctoproject.org>;
 Thu, 28 Oct 2021 10:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Hy4h9RnlqoltgITtNdqJ197pi56zLotsubHzahuyFmI=;
        b=hpGbgp0Dg7Pnzufxzyymhhx0zPiwHkTp+VuU+FUc4cy2rOX73pECQk3ekj+ndsRFbg
         1aMs9GFoPPF2AZffgbAjBRTIIQt+QipyswbfbftwjCMJ7myCd+HNxIBTl6w3W+vWvtZR
         3YweMY1Grsj2slF7oiFAYTQ8CivclDAodwJHW9/gHPvKtm+0S+VdB0tfp+lTy5dINuzY
         0YgriXWYndcTCXwd9FBWvR68acCN7AZEl1wvQDo5ohDis5zOX2OqGiX4SJ0SPIke1Lg1
         1+3LSL1CoZiVhEoiOOUAm35XDC+MA3P9AQUjst5FxvpPT1Ku19LUd3CrA4+9C+TSznoQ
         MSfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Hy4h9RnlqoltgITtNdqJ197pi56zLotsubHzahuyFmI=;
        b=K75eOBpgzptNwAAweBRLNiBn7iZQdReEB4BBDLukwwOXKmyQNsk0mChAI1S3KxQ+lJ
         69B+frhEkFdU8N4kJs2xwW59unPyePAiYArJhnZXgtaoOr39JtKqmKGfH5DmM/xDABsV
         2L8j6t74LtE9use7+R1Xuhj2oRicZ+Esx3WcNuT1nCPwNuJGUCTeHr2jHUpY7/aHy3EI
         yhFRyUNF/F68baNIGno/jv9lVtcZt3rXn9e8sPercRB4fPGciSgNV6DsGMr6Y2JKnLJ/
         CRczDHO+Y/tyCuWXMHcq33qnhnIfm+WNThYdHMFaoxwHeE3sDL3FfCbBVHh8Ce5R1w0Q
         ocFw==
X-Gm-Message-State: AOAM530lKnvp7dtxjSN3UJdJnx/cNAuouktJQQhZ9EMaVOnb6MFKZpec
	/jkG2n2srGu0/bCpwNFduhk=
X-Google-Smtp-Source: 
 ABdhPJzQsOSOhotSP+GcmdkFRGVjMHi7cMYN0SZYO9F/Wl3FdZi9xcL1ObpXPapn6WZX/N94hfBKQA==
X-Received: by 2002:a05:6a00:a8b:b0:44d:ef7c:94b9 with SMTP id
 b11-20020a056a000a8b00b0044def7c94b9mr5633448pfl.36.1635441079332;
        Thu, 28 Oct 2021 10:11:19 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:a5c0:c81:ea52:afe:f25d?
 ([2601:202:4180:a5c0:c81:ea52:afe:f25d])
        by smtp.gmail.com with ESMTPSA id n9sm9540370pjk.3.2021.10.28.10.11.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Oct 2021 10:11:18 -0700 (PDT)
Subject: Re: [dunfell][PATCH] poky.yaml: fedora33: add missing pkgs
From: akuster808 <akuster808@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
References: <20210909150916.3299739-1-akuster808@gmail.com>
Message-ID: <584ef651-01ae-6040-28ff-f9cf9f9244f1@gmail.com>
Date: Thu, 28 Oct 2021 10:11:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210909150916.3299739-1-akuster808@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 28 Oct 2021 17:11:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2053

ping

On 9/9/21 8:09 AM, Armin Kuster wrote:
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
> index 17426567a..bda8ff123 100644
> --- a/documentation/poky.yaml
> +++ b/documentation/poky.yaml
> @@ -18,7 +18,8 @@ FEDORA_HOST_PACKAGES_ESSENTIAL : "gawk make wget tar bzip2 gzip python3 unzip pe
>       diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath \
>       ccache perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue perl-bignum socat \
>       python3-pexpect findutils which file cpio python python3-pip xz python3-GitPython \
> -     python3-jinja2 SDL-devel xterm rpcgen mesa-libGL-devel"
> +     python3-jinja2 SDL-devel xterm rpcgen mesa-libGL-devel perl-FindBin perl-File-Compare \
> +     perl-File-Copy perl-locale"
>  OPENSUSE_HOST_PACKAGES_ESSENTIAL : "python gcc gcc-c++ git chrpath make wget python-xml \
>       diffstat makeinfo python-curses patch socat python3 python3-curses tar python3-pip \
>       python3-pexpect xz which python3-Jinja2 Mesa-libEGL1 libSDL-devel xterm rpcgen Mesa-dri-devel


