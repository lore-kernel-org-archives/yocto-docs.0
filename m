Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.11653.1617714708918479378
 for <docs@lists.yoctoproject.org>;
 Tue, 06 Apr 2021 06:11:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dBN5BZms;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id f12so8197279wro.0
        for <docs@lists.yoctoproject.org>; Tue, 06 Apr 2021 06:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=VEB4sYbI0qp/BZYzEi7Y8/HQd7ikN50eonzfW3+3p7Q=;
        b=dBN5BZmskpMWKgF9HtBtPdrs8Ph0WBEBmmXfHl7JpBVxo2BKDnNbmG9fGAze+xTBBM
         SO4FSJWHC6U0X7WWgqTefsQf4k6o81st4JXBnKvbD71b5bseRF1wxb6Y7Ujg+6FJtSQT
         YOlSexq7IBpRnN3W+lT+/QiFJg2j4kTT1cxVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=VEB4sYbI0qp/BZYzEi7Y8/HQd7ikN50eonzfW3+3p7Q=;
        b=Li6VO72BptcfmpxjnuXxZzd7uV16kiAVUCvs0DYzhx3mw0CUwqsBxz+6XTYxa+j4YR
         tZHHHx5nPg/0gm0TTMAh+02xffDq1g/Q2y+gnEa2sN5lGq5sA9El8jqeNxZa/K6EJ8Tc
         RZcOZjKeJ65yaAfNZQ373f5LWkxXwurKrK93BrlpCN6qgB3pxEZ5emuIwfeRTpZngLxK
         0+pOpv4RHk8oVqWWpv04Rc91V1OC9jYCBIS1WIgEWwDfF87k6WmXwwYpc8/Qui+3Z6XH
         wRZAk6gmiaALYUt2plA/Ac1ASSNw1COyvyqmSnltR1x5LORRYRVJT9m5DUHac2w6NrkO
         AT+g==
X-Gm-Message-State: AOAM531N/hwCWzrDQfq7XJUIuE70pWTqEOOjH+o84ewaRJV/fHpG42Hn
	ZA6GNtWev87/Zg41fQR+fwX77IJCVFzT3A==
X-Google-Smtp-Source: ABdhPJzUbGYio7A+Qkzf7doak+FMgTZgcnaUF04Vy8N4X8AQW36TGOq7tOdDt5u0r10la/uu3HCITg==
X-Received: by 2002:a5d:6d41:: with SMTP id k1mr36363853wri.66.1617714707623;
        Tue, 06 Apr 2021 06:11:47 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:7a9e:d3b:5548:6469? ([2001:8b0:aba:5f3c:7a9e:d3b:5548:6469])
        by smtp.gmail.com with ESMTPSA id y22sm3491644wmc.18.2021.04.06.06.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 06:11:47 -0700 (PDT)
Message-ID: <4bae80333e688d290343fad5a92e4f6b8d3d345c.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] poky.yaml: change gcc-multilib to gcc
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross@burtonini.com>, docs@lists.yoctoproject.org
Date: Tue, 06 Apr 2021 14:11:46 +0100
In-Reply-To: <20210406105359.2666372-1-ross.burton@arm.com>
References: <20210406105359.2666372-1-ross.burton@arm.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-04-06 at 11:53 +0100, Ross Burton wrote:
> None of the other distributions install compilers for 32-bit compilation,
> and this package isn't available on arm64 Ubuntu systems.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  documentation/poky.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I was a bit worried about this but I checked by Ubuntu builder and it 
doesn't have gcc-multilib installed so we're probably good with this 
change.

Cheers,

Richard

