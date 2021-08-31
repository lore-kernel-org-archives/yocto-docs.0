Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web08.3073.1630401414598250536
 for <docs@lists.yoctoproject.org>;
 Tue, 31 Aug 2021 02:16:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Tv56XM1I;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id f9-20020a05600c1549b029025b0f5d8c6cso1496992wmg.4
        for <docs@lists.yoctoproject.org>; Tue, 31 Aug 2021 02:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=sI7qbJwFRTnCtTa3KeZumeMyinoqA7+2MKqGJcAjqhs=;
        b=Tv56XM1I/btmW2IhA37A9f5erUpfdeRAwQjhqNeJpHUO+3InBHWaMgFwkd+oKjuV0L
         DWIJ59vid8rMB0Ehmv3hCROpDg1pa5S31K5VdK4MogzY6FaswkUt0qeuJrY+67tKY71N
         NCmkQpMvcGn+Fmc0z0HGf1rpXZyUTAw8NLVk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=sI7qbJwFRTnCtTa3KeZumeMyinoqA7+2MKqGJcAjqhs=;
        b=WYz/ahoDvyalsVlo+ddg1jXMLx5aW/ylxfHHPz0rffyxnIr6YI9+S13k+5sLResH4z
         Tv9m8XH3WH0+FHNccBLrkx8iYX8ypqqrH0yPCOGDq27J9njuxi6W4cUjRiMdsfXnREI6
         RHhnjppop8EnrDQWiAB2UEQ/idoUsMDWyEs2hRXnuHxO7mzQkQFolxDI6/DoT1LbzZpt
         gNXZ3HmcFO0o8XJs1NlxBK9Jc81xU9J0Ce1w/uOXskITr8dusLeRb+MLx9MNx++INm6t
         roeAIK8pmZiCHzeEbYZZbNhoTL9IiFm7N82F/isNHW2rNMRN+/FB6CfZJfMF0MIQFDWo
         EF5g==
X-Gm-Message-State: AOAM5316uEiLgBA05o4bwjsKcLE2Q/n8AOXOq3RSzreqjTyxXm/yX/AA
	zqD24kszeBJnlWk+/FeerP6Gsg==
X-Google-Smtp-Source: ABdhPJyDpiX/K7aDExIuYQ3Q4nOKjZo0sMYGb/eEyZyLbFZ35BwFnPXqb/pvIjd6mhO4XvZ31BfEVw==
X-Received: by 2002:a05:600c:a08:: with SMTP id z8mr3107297wmp.52.1630401413019;
        Tue, 31 Aug 2021 02:16:53 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:e840:dd4f:b947:28bf? ([2001:8b0:aba:5f3c:e840:dd4f:b947:28bf])
        by smtp.gmail.com with ESMTPSA id a10sm7775020wrd.51.2021.08.31.02.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 02:16:52 -0700 (PDT)
Message-ID: <795cdbf31208231b7ab001464b7247524aa6b459.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] dev-manual: correct note about virtual providers
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>, 
	docs@lists.yoctoproject.org
Cc: "Robert P . J . Day" <rpjday@crashcourse.ca>
Date: Tue, 31 Aug 2021 10:16:49 +0100
In-Reply-To: <20210830153720.68398-1-michael.opdenacker@bootlin.com>
References: <20210830153720.68398-1-michael.opdenacker@bootlin.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2021-08-30 at 17:37 +0200, Michael Opdenacker wrote:
> Fixes [YOCTO #14530]
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> Reported-by: Robert P. J. Day <rpjday@crashcourse.ca>
> ---
>  documentation/dev-manual/common-tasks.rst | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index f3b5084436..dd015a761e 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -2114,9 +2114,10 @@ The following lists specific examples of virtual providers:
>  
>  .. note::
>  
> -   Virtual providers only apply to build time dependencies specified with
> -   :term:`PROVIDES` and :term:`DEPENDS`. They do not apply to runtime
> -   dependencies specified with :term:`RPROVIDES` and :term:`RDEPENDS`.
> +   Virtual providers can be applied not only to build time dependencies
> +   specified with :term:`PROVIDES` and :term:`DEPENDS`, as show in the
> +   example above, but also to runtime dependencies specified with
> +   :term:`RPROVIDES` and :term:`RDEPENDS`.
>  

This isn't correct. virtual providers of the form virtual/ *only* apply to the
build namespace, not the runtime one.

Cheers,

Richard

