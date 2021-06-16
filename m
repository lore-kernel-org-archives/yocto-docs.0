Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web08.5917.1623841397017932314
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Jun 2021 04:03:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZJ010r26;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id v9so2185435wrx.6
        for <docs@lists.yoctoproject.org>; Wed, 16 Jun 2021 04:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=s4URFR3cf67wvqvNZc4mwQ7ms2p2JVTPP24uqbdPSbo=;
        b=ZJ010r266S89ApudGSjuueFZUlI4EbNRB+efU2w9rrd6ZNNzuPml/qbthUejc3KFGo
         oFRhZAbePu1t7/sacJFMijs8kCWuoDgg7kox7oI7pbOmKjQkz366ep924dMYlMxoyO0E
         qTGe/qCwO1co+1lAb8z3FD8g3OyVNIiAHIsE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=s4URFR3cf67wvqvNZc4mwQ7ms2p2JVTPP24uqbdPSbo=;
        b=mZwzbASFuadYe81ckS/hO3wbkveEljW2wBNTyXJhrFduWIDgUKvqGeI70tGVMmWTvc
         qmHT69ZstFbPPvY2iI0ZOiiFd2Vfil/lq9oWv/9Jwk3sTeWYi0SF+X89t93/ioQI8Y+7
         ksLIssy1oJjYhjP8K72DLoiQogYdl/YYhFuye+0z3J/9aXPcUzUn1AMSdcznGNg61xLT
         Y2oX+EZ32aGvlC+8whO4ky5SdCVN0X8pGFci7KaSch/bwIJGrIrab5xdcaQn7qgXPB8M
         JeamkfkcujM/eZ0A/sX5TfiGyCMO++G+XoW4e9jwhD7iwOj5uBCqDvbJqc2psx1l8Fif
         fLtw==
X-Gm-Message-State: AOAM5315Rotqst/aRYff729z6LtPNnuMHDGNgCPwCwh+6zXw3hBi4+DI
	n7o5Y+F2UVBdJ3MeX04WMn4kdUrBakfUaw==
X-Google-Smtp-Source: ABdhPJya5BVi1kqnmHHTdQ68bHCkpDIHS5Spee5a7YHAHx5KhzbPkx2XOrlmarQRxQuzf2lYBZxRgw==
X-Received: by 2002:a05:6000:18a8:: with SMTP id b8mr4555583wri.208.1623841395098;
        Wed, 16 Jun 2021 04:03:15 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:1d6e:bde3:735d:6a7d? ([2001:8b0:aba:5f3c:1d6e:bde3:735d:6a7d])
        by smtp.gmail.com with ESMTPSA id l4sm1796127wru.41.2021.06.16.04.03.14
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 04:03:14 -0700 (PDT)
Message-ID: <b1cececa6eb342376be10b1e5b4cfe263ebf15be.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] README: Tweak as the website isn't really new now
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Date: Wed, 16 Jun 2021 12:03:14 +0100
In-Reply-To: <16890B0FB0A8CC32.8130@lists.yoctoproject.org>
References: <16890B0FB0A8CC32.8130@lists.yoctoproject.org>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-06-16 at 12:01 +0100, Richard Purdie via lists.yoctoproject.org wrote:
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  documentation/README | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/documentation/README b/documentation/README
> index 3ad23a902..f9e803a28 100644
> --- a/documentation/README
> +++ b/documentation/README
> @@ -88,8 +88,8 @@ documentation.
>  Yocto Project documentation website
>  ===================================

>  -A new website has been created to host the Yocto Project
> 
> -documentation, it can be found at: https://docs.yoctoproject.org/.
> +The website hosting the Yocto Project documentation, can be found
> +at: https://docs.yoctoproject.org/.
>  

I did already merge this as Nico and I needed a test change to master to 
debug a build issue. If there are any concerns, we can improve it further
with further patches :)

Cheers,

Richard


