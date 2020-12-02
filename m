Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web11.1746.1606895496219521286
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Dec 2020 23:51:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ZtFLAVwH;
 spf=pass (domain: linaro.org, ip: 209.85.128.66, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wm1-f66.google.com with SMTP id e25so4796247wme.0
        for <docs@lists.yoctoproject.org>; Tue, 01 Dec 2020 23:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=2YnJ1zmqhIPYbEVQOHGSFPgihu5P/6jA4maO7HEvXpI=;
        b=ZtFLAVwHdWgM4sKcXVKO1C4iIzy/yQy3aMJf46INz3JYY7tBnJDm3RyOBt7bWn1hLe
         vavIbTfIU5uQFB4uhzg6ZRtKHUZAMhAKXK0IYX6oLLhOGYd6YgDwDmjAC8fWOKdrxVwY
         srKdkShI3ft48dEp33D+6XEvLXSXMD03Pv/dZaAwvcI7XNMowgNSvNgZJ/tglmX6D6a4
         d46ALQPEASRAV2A5UmcF8jDwOyMtKGGBFZGLYNv5j2voT7xB95ZHChgvq21CrdnF+khQ
         Dp63EMxVtCiIVHSMBVKyMc1+pjuaFkh2E+NQ5kKUrHVthyiVHgbRNYZ0/9CG3x77E626
         /MTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2YnJ1zmqhIPYbEVQOHGSFPgihu5P/6jA4maO7HEvXpI=;
        b=Hs76w/QLD59K+4Mn3eIN7y8mnNFpn8bl2prPRhgVEsMsJT09ZLuHtbwy5DI+GryQWj
         4jsa63a+RSyjwAVdP6pnSigeGSKotPfBYaZ4KNCPrj9yZwZuVb8WAstMYfuSczO6zim/
         xVQrICybG2yjRTJ5u2XCCTYCT5dza1hLuBblCx7AT3et0NT1fs3HfeDIaoebqg3FC2f5
         kxPnFru4AC1ixEspWnyg46pvw1p2hNLtNPBxQ473thTdSQsoy9w+EdR5AwzSCYRZePGS
         /yjeD/sLR/OLGQz94DdM3+XvPPLlhXWITxCwlJ+j9F1cKMAJ2cpWcvvif/DBhWaDriiM
         yrcg==
X-Gm-Message-State: AOAM531Ct4wNd0E+LGtkyOYNINrOItz1F3UO7+ctUDa4bTuLNwP4qJNV
	GrY44ewyybEniPmvI/IKLVsm8epbfI/HDLUu
X-Google-Smtp-Source: ABdhPJyF1Bq7XJlFKUH/n7q3kfgPNdWG0CM9w2jXON5oF8QYUEwdjLzNjFlyWUlkJyvUxsxKA7hFkA==
X-Received: by 2002:a1c:9d16:: with SMTP id g22mr1657873wme.140.1606895494120;
        Tue, 01 Dec 2020 23:51:34 -0800 (PST)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from ?IPv6:2a01:e0a:1b9:3e10:6883:56ff:2b71:f8a3? ([2a01:e0a:1b9:3e10:6883:56ff:2b71:f8a3])
        by smtp.gmail.com with ESMTPSA id d8sm979033wrp.44.2020.12.01.23.51.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Dec 2020 23:51:33 -0800 (PST)
Subject: Re: [docs] [gatesgarth][PATCH 1/2] sphinx: releases: add link to 3.1.3
To: Anuj Mittal <anuj.mittal@intel.com>, docs@lists.yoctoproject.org
References: <20201202012330.20273-1-anuj.mittal@intel.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Message-ID: <021e6971-5283-305f-8a8a-adff65eb53a8@linaro.org>
Date: Wed, 2 Dec 2020 08:51:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201202012330.20273-1-anuj.mittal@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/2/20 2:23 AM, Anuj Mittal wrote:
> From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> 
> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit bf395d0af044f6e9826a8235b760b2d285602b26)
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>

Reviewed-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>

However... this clearly shows that we have a problem.. it's not the 
right thing to do to maintain releases.rst in each branch.. Can you 
please open a bug so that we can discuss further. I am not sure what's 
the best solution is here.. We already have a similar issue with the 
dropdown menu, and we override the file in the AB during the publishing 
to the website. Perhaps we need something similar, or perhaps not..

e.g. we could have an 'empty' releases.rst file, and generate the 
content on the AB...

> ---
>   documentation/releases.rst | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/documentation/releases.rst b/documentation/releases.rst
> index 536c3a6d2..9992f97d5 100644
> --- a/documentation/releases.rst
> +++ b/documentation/releases.rst
> @@ -11,6 +11,7 @@
>   - :yocto_docs:`3.1 Documentation </3.1>`
>   - :yocto_docs:`3.1.1 Documentation </3.1.1>`
>   - :yocto_docs:`3.1.2 Documentation </3.1.2>`
> +- :yocto_docs:`3.1.3 Documentation </3.1.3>`
>   
>   ==========================
>    Previous Release Manuals
> 
> 
> 
> 
> 

