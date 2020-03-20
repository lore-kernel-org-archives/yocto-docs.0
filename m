Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web10.5910.1584726922796183669
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Mar 2020 10:55:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pM0dBp6x;
 spf=pass (domain: gmail.com, ip: 209.85.215.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f195.google.com with SMTP id x7so3469091pgh.5
        for <docs@lists.yoctoproject.org>; Fri, 20 Mar 2020 10:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uMI1zn2GzJWusW3FnCELn0kRUJTFEhPhGbzbx0tOfIQ=;
        b=pM0dBp6xlCulzJnxMNIk8DrL1vQtieDCvFOTa2DDQ7eaw8ZJfEH0q4IQ+OYXumDb/q
         /3vWQZJ3FA4tA7IumfLpI3z15gmngsxfXgb23znRLO6cZNcfoVdabFD51GDSVEOBKd5O
         7A2ywesNl69RnzPrfPHVVCn6AIP8yAimCu+od1H7dNI8qOKWpkV4TL8uZI7d7ZQmYhwb
         dhinP5VBZU//L1xuycDgUEGNgwihIJu9iZatb9cL9QJyKYBKgPYfD3mUD3JU79Ies2MB
         7w+/Ai+udBVbq1WzMcNRfCOqmq3nNE1uSjBQIcqIBg/L+8i9fZL2KEjIITOafK9Uzc1I
         aILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uMI1zn2GzJWusW3FnCELn0kRUJTFEhPhGbzbx0tOfIQ=;
        b=PpJWgyB2AbMwp4wNlbkNbgUDmCdIGWMmJECrOJe8Uzd6oabNWg8rDqpLurl0/coeOX
         CP20Fyd8mRjKD3xNA5PqzVWKQOtV4La9ckj3PtogMgavHs1D9/RMSA4e0F5z8wK7e86d
         oxiHDZR9f3SL1k2rGCCqDJz9XVAUe+29zuONqd3OjKPyEWDb6PL1q4Iw+Vn2UzidUn5V
         rng9OBQrgKSpAG7wQAQTFz7CtlOj9aC9xRu2aqdhEJl+5GIZq6segj9OawK7A1yO4gvx
         YHc6eeA/7kfr6HVTHi4vmdyhWb9Bbx6wD/oIsL7nH3Ye+GXBXN1P4D7egr8CBww9m9H8
         mQFw==
X-Gm-Message-State: ANhLgQ140BT1PmR6q2qS/OyM2v6L1vh3FJEWmhxD+xQaJB56bCVyPw6A
	7hm0ew1rxZUHhFCqZ7hBoE0=
X-Google-Smtp-Source: ADFU+vsZfHdPhjyVAH1VcTdxpQsjM6IJ38StUuFIQcmIn4bcsaWtdOSfytQSllYUO7EjsGAgXYNwbQ==
X-Received: by 2002:a63:e24c:: with SMTP id y12mr9370900pgj.244.1584726921562;
        Fri, 20 Mar 2020 10:55:21 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:8981:1b0d:92f0:88? ([2601:646:9200:4e0:8981:1b0d:92f0:88])
        by smtp.gmail.com with ESMTPSA id i124sm6059113pfg.14.2020.03.20.10.55.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2020 10:55:21 -0700 (PDT)
Subject: Re: [docs] [PATCH] documentation: add rpcgen to FEDORA_HOST_PACKAGES_ESSENTIAL
To: docs@lists.yoctoproject.org
Cc: Goran Cengic <cengic@gmail.com>
References: <20200319232314.2038-1-cengic@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <ac1eb590-1a23-ddbc-346e-568149ffc490@gmail.com>
Date: Fri, 20 Mar 2020 10:55:19 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200319232314.2038-1-cengic@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 3/19/20 4:23 PM, Goran Cengic wrote:
> On Fedora 30 and 31 the following error appears without rpcgen package:
> ERROR: The following required tools (as specified by HOSTTOOLS) appear to be unavailable in PATH, please install them in order to proceed:
>    rpcgen
> 
> Signed-off-by: Goran Cengic <cengic@gmail.com>
> ---
>   documentation/poky.ent | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/documentation/poky.ent b/documentation/poky.ent
> index 581c87679..fba2a9123 100755
> --- a/documentation/poky.ent
> +++ b/documentation/poky.ent
> @@ -65,7 +65,7 @@
>        diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath \
>        ccache perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue perl-bignum socat \
>        python3-pexpect findutils which file cpio python python3-pip xz python3-GitPython \
> -     python3-jinja2 SDL-devel xterm">
> +     python3-jinja2 SDL-devel xterm rpcgen">

Thats good. We also want to add rpcsvc-proto for suse based distros for 
same.

>   <!ENTITY OPENSUSE_HOST_PACKAGES_ESSENTIAL "python gcc gcc-c++ git chrpath make wget python-xml \
>        diffstat makeinfo python-curses patch socat python3 python3-curses tar python3-pip \
>        python3-pexpect xz which python3-Jinja2 Mesa-libEGL1
> 
> 
> 
> 
