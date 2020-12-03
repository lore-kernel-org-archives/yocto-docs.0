Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com [209.85.210.65])
 by mx.groups.io with SMTP id smtpd.web08.4163.1607031626913884475
 for <docs@lists.yoctoproject.org>;
 Thu, 03 Dec 2020 13:40:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ua54B7Qz;
 spf=pass (domain: gmail.com, ip: 209.85.210.65, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f65.google.com with SMTP id b62so3251554otc.5
        for <docs@lists.yoctoproject.org>; Thu, 03 Dec 2020 13:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=kS+4MUrmjkNQbEz7T2CUrcF0X1bdN4cYbM8vAij6NCU=;
        b=Ua54B7Qzw9Wozdo4845BBayMu3TlUXYu+PACv+C7lnuKwL3FTveXo45zCnvMdHa3nG
         oFl0V7VVFToDWmReiTb6OqB/bDOMdBD/gHlNYLPpxmATrLBkrCT4UOx6LVaBTS+mlcie
         VMGm/pfDZkSMaXDqZD5yfgi2KsAUY8X7Pxj0X0PMGgczSlTdIhQIkxmIViFvbqGGKtas
         ib2YWJRQjRmlyXcTt0BPItWcLz/OL1o2s3sQeZ71DlD69oLCsPniWOODrg1kPNI+PFit
         LE9N4F/fYz25goYj6s07OhDHC9e+/qUY4RIBOiFxJ3WhCyEe4g6Y9xyH+Lddc/hKVNid
         Hnew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=kS+4MUrmjkNQbEz7T2CUrcF0X1bdN4cYbM8vAij6NCU=;
        b=G84Je7n4M0yJpjy3kiYgN4rLloyAiE739DM6Hej+TFZ30N2QBXqUG7qrO9/3H5AEof
         SnUjQBLfl/NuQ/l2YsDOr+267BqGXl8RVXqFpgvlIaz3z2n5mdQmDnjjnC+LwX65Bnd9
         fWjnNv/ItAv3MoUPBYja7LUBGjNMfUpianJ8Tay2XWd+vJ5x99ON3UDLsB6RtUUj3aCg
         j5LFkTnyEJUoFbhPYIcx0wmzEIq3UHY4CvdmAYWBxrqBAqUEnNRECH/RTke97wr1R9nV
         QidKrQWd2D+osvrDKgICjSE/ufkbvuTYgVYyV2UL3ZLxNRgNMwnbB4dOM6/HHRcx3/Yw
         jyzQ==
X-Gm-Message-State: AOAM530UKwXXRcAceCVe9jtwDJPWw9NgF1xhHGA+3HM8hDKciCN+BqpB
	K0p0jWlCHAtbmbvlKYNHW68=
X-Google-Smtp-Source: ABdhPJxZwNopBxq00rAoYUA/V3av8NXtdULdphJ7dEhO1cvuoLXTpRYhEBOh1uqHrVwZqvIXHe468Q==
X-Received: by 2002:a9d:3e1d:: with SMTP id a29mr1016947otd.249.1607031626264;
        Thu, 03 Dec 2020 13:40:26 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:5cc4:c55d:be5e:64c7? ([2601:202:4180:a5c0:5cc4:c55d:be5e:64c7])
        by smtp.gmail.com with ESMTPSA id i43sm156169ota.39.2020.12.03.13.40.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Dec 2020 13:40:25 -0800 (PST)
Subject: Re: [docs] [PATCH] releases: conf: add link to 3.1.4, update to include 3.1.4
To: Michael Halstead <mhalstead@linuxfoundation.org>,
 docs@lists.yoctoproject.org
Cc: rpurdie@linuxfoundation.org, nicolas.dechesne@linaro.org
References: <20201202220453.33336-1-mhalstead@linuxfoundation.org>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <a9242731-e044-c649-ac05-4b18ee33f011@gmail.com>
Date: Thu, 3 Dec 2020 13:40:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201202220453.33336-1-mhalstead@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

IMHO, I believe the branch maintainer should take up this task.

Should update process page if not already noted.

-armin



On 12/2/20 2:04 PM, Michael Halstead wrote:
> Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
> ---
>  documentation/poky.yaml                  | 2 +-
>  documentation/releases.rst               | 1 +
>  documentation/sphinx-static/switchers.js | 2 +-
>  3 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/documentation/poky.yaml b/documentation/poky.yaml
> index 57da0a7c2..c1340c25e 100644
> --- a/documentation/poky.yaml
> +++ b/documentation/poky.yaml
> @@ -4,7 +4,7 @@ DISTRO_NAME : "Gatesgarth"
>  DISTRO_NAME_NO_CAP_MINUS_ONE : "dunfell"
>  DISTRO_NAME_NO_CAP_LTS : "dunfell"
>  YOCTO_DOC_VERSION : "3.2"
> -YOCTO_DOC_VERSION_MINUS_ONE : "3.1.3"
> +YOCTO_DOC_VERSION_MINUS_ONE : "3.1.4"
>  DISTRO_REL_TAG : "yocto-3.2"
>  POKYVERSION : "24.0.0"
>  YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
> diff --git a/documentation/releases.rst b/documentation/releases.rst
> index 9992f97d5..85b31b64d 100644
> --- a/documentation/releases.rst
> +++ b/documentation/releases.rst
> @@ -12,6 +12,7 @@
>  - :yocto_docs:`3.1.1 Documentation </3.1.1>`
>  - :yocto_docs:`3.1.2 Documentation </3.1.2>`
>  - :yocto_docs:`3.1.3 Documentation </3.1.3>`
> +- :yocto_docs:`3.1.4 Documentation </3.1.4>`
>  
>  ==========================
>   Previous Release Manuals
> diff --git a/documentation/sphinx-static/switchers.js b/documentation/sphinx-static/switchers.js
> index fe9841b10..fc901d329 100644
> --- a/documentation/sphinx-static/switchers.js
> +++ b/documentation/sphinx-static/switchers.js
> @@ -4,7 +4,7 @@
>    var all_versions = {
>      'dev': 'dev (3.3)',
>      '3.2': '3.2',
> -    '3.1.3': '3.1.3',
> +    '3.1.4': '3.1.4',
>      '3.0.4': '3.0.4',
>      '2.7.4': '2.7.4',
>    };
>
> 
>

