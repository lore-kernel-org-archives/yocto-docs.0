Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web10.1642.1606895239428558869
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Dec 2020 23:47:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=jS46vC+K;
 spf=pass (domain: linaro.org, ip: 209.85.221.68, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wr1-f68.google.com with SMTP id r3so2116565wrt.2
        for <docs@lists.yoctoproject.org>; Tue, 01 Dec 2020 23:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=lBn8F3mx0ETSHQK3CUzebhpV2v04Cjo1G8+s7O+okn0=;
        b=jS46vC+KRC4UcFqe2sFl5jgixR8va3FmzZmwwEJv4QhieJqJGnma/X+BaL/8xCJ3PY
         59a7ErGYOBE2XvXeJhqDNz2ORLuI7geinoXL0u/0EFM2plTUhJj9LDTXRFwK7s573W6D
         3BBb1yCoHBTe7aylwC279hgwt9zampuSpOAjvl+QjF8uHNSJyVE7ZNMoXZqkpRp+J1uO
         p2TH20BTjpRWcE/DEknvQNPyT+m17JWUs8FqP8ph8UJgPcnOsZQ/cH0sLRFkEUyZAWOa
         9mRCvPvn0x3nW5XdOIYATHEwvTRGBOlgIR64tPtOr0LSs0MQR0KPLlgwEs2ljDKhdMxG
         sh7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lBn8F3mx0ETSHQK3CUzebhpV2v04Cjo1G8+s7O+okn0=;
        b=sIWwfcbDTH8KPe8PvTfYkZkfqhKz/TUzdw+WOhRS+piTgdahLQ3OrOh38xaQU2YSr4
         j4yQuTIvrRcplzPUH+Gze5qcprW53Z3BAEICKwIC0r5lfZuonHExlUB2znesqbTvloUF
         3CGUVB3N7LxiX+7LdGP2iZE0hqAz85DhsjIjnqpGZPFt8BJVBMUpflVjOm0qjK3dHXzn
         u9Srjw9iYXjtbemgy94vs9PWg1xIIqLhYH81WcNoHi6YQGQOjZjQV++p1zOP87v9eOcr
         P3ZtVljVDBbfd+BKKMzZyeSMp5XZOXxYfxk6irr0GBMHJ3CUr/UJH9nPaC+HqN4Pa5M2
         SS3g==
X-Gm-Message-State: AOAM5312MTDwgU53biKbuLmQwoeWEPtX+0gDP3G3IVBkRozouKVJfx1D
	FQpRVfyxPt/amOg4E6ggBOo3FKPhlweouiiK
X-Google-Smtp-Source: ABdhPJzN/XsPL0h51PXEORG68QlOEOTJcC8K9xZyr5+0e7us2Cr8LjMTAQZme+CUoNA+8JmF5K/hbQ==
X-Received: by 2002:a05:6000:c7:: with SMTP id q7mr1682359wrx.137.1606895237519;
        Tue, 01 Dec 2020 23:47:17 -0800 (PST)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from ?IPv6:2a01:e0a:1b9:3e10:6883:56ff:2b71:f8a3? ([2a01:e0a:1b9:3e10:6883:56ff:2b71:f8a3])
        by smtp.gmail.com with ESMTPSA id o67sm935374wmo.31.2020.12.01.23.47.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Dec 2020 23:47:16 -0800 (PST)
Subject: Re: [docs] [gatesgarth][PATCH] documentation: prepare for 3.2.1 release
To: Anuj Mittal <anuj.mittal@intel.com>, docs@lists.yoctoproject.org
References: <20201202014027.22533-1-anuj.mittal@intel.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Message-ID: <c2fd3029-ce7f-109f-0336-8ed8f639266b@linaro.org>
Date: Wed, 2 Dec 2020 08:47:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201202014027.22533-1-anuj.mittal@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/2/20 2:40 AM, Anuj Mittal wrote:
> Bump the current version to 3.2.1
> 
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>

Reviewed-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>

> ---
>   documentation/conf.py   | 2 +-
>   documentation/poky.yaml | 8 ++++----
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/documentation/conf.py b/documentation/conf.py
> index ed8c5c033..44f1e43a8 100644
> --- a/documentation/conf.py
> +++ b/documentation/conf.py
> @@ -16,7 +16,7 @@ import os
>   import sys
>   import datetime
>   
> -current_version = "3.2"
> +current_version = "3.2.1"
>   
>   # String used in sidebar
>   version = 'Version: ' + current_version
> diff --git a/documentation/poky.yaml b/documentation/poky.yaml
> index e184fa829..ef63d6eb7 100644
> --- a/documentation/poky.yaml
> +++ b/documentation/poky.yaml
> @@ -1,11 +1,11 @@
> -DISTRO : "3.2"
> +DISTRO : "3.2.1"
>   DISTRO_NAME_NO_CAP : "gatesgarth"
>   DISTRO_NAME : "Gatesgarth"
>   DISTRO_NAME_NO_CAP_MINUS_ONE : "dunfell"
> -YOCTO_DOC_VERSION : "3.2"
> +YOCTO_DOC_VERSION : "3.2.1"
>   YOCTO_DOC_VERSION_MINUS_ONE : "3.1.3"
> -DISTRO_REL_TAG : "yocto-3.2"
> -POKYVERSION : "24.0.0"
> +DISTRO_REL_TAG : "yocto-3.2.1"
> +POKYVERSION : "24.0.1"
>   YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
>   YOCTO_DL_URL : "https://downloads.yoctoproject.org"
>   YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
> 
> 
> 
> 
> 

