Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.9680.1627566662786090293
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jul 2021 06:51:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=L0/r7SYl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id g15so7068003wrd.3
        for <docs@lists.yoctoproject.org>; Thu, 29 Jul 2021 06:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=JodAH8+twObcUKwvBAChNix/23EjUK6I4egH+SQ+xNc=;
        b=L0/r7SYl9PPayKjWYKtV+aVKMJVJ8uuCgtTszxMd1AjRqKvXSLOcfJOgz6lg+N+u3F
         UnAIgJT0GG8OCoUuxfy6wAWmgs4VkrGAoYZCX77ndKsasaGzSNUnylbg9bFR1Yvlb7m4
         uC/MlenBWydKIRD4RM3XU+D7Ca/zGzMSndnk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=JodAH8+twObcUKwvBAChNix/23EjUK6I4egH+SQ+xNc=;
        b=TjKSoHw7Hm06dQw647y4vOeRGJtIOAqCa8+YxPUlYhKWW3dxPs8MWNBJedsJrXdva5
         BLKEWXhgCIZTRC51zmAgFg5+Gr985I0MtjaEDUvtLuBCMSVWAR9rn5tY2Oi0iM8t0WyJ
         OMbf6OBKIxw8wkqO2oO8C+nuArcUpvEb0D6un199rbTdZTx8laykYxuCukqtfAZwWkEv
         eXlBElumeGbpzwPA4AivdsZvE1HEC5M9eKDxJx0CJrHljKOxTJg6v2Gc1zpesaQRCJDt
         GGrdEyzfAvdLbBo0K/v9y2fyAwxIjnQpYX5a/6jdwbnFUDyYcd2+ZwmEIRsODK1TJDkr
         J/Vg==
X-Gm-Message-State: AOAM531ALhJ0vK+D3CcNHh9q78Q2ZwCFWRUIJ/e76Gs+JTellO2wjp6L
	wo6czVZBR24IbWFmIGRLrFgMKA==
X-Google-Smtp-Source: ABdhPJx0TMt8nB0CKlDBUzQ7LvtBS9BV8LPpGiXEgqIby1DOFb5kS9MjAPD0oeQdMgAcrVz8dC6nsQ==
X-Received: by 2002:adf:e6cf:: with SMTP id y15mr4949649wrm.217.1627566661392;
        Thu, 29 Jul 2021 06:51:01 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:89c8:a51f:1301:604b? ([2001:8b0:aba:5f3c:89c8:a51f:1301:604b])
        by smtp.gmail.com with ESMTPSA id h25sm2015226wmp.33.2021.07.29.06.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 06:51:01 -0700 (PDT)
Message-ID: <1e3abc561a0492b2908acb0cfb83c81a50479210.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH v2] doc: bitbake-user-manual: grammar fix for the number of "metadata"
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>, 
	bitbake-devel@lists.openembedded.org
Cc: docs@lists.yoctoproject.org, Quentin Schulz <foss@0leil.net>
Date: Thu, 29 Jul 2021 14:51:00 +0100
In-Reply-To: <20210729131311.164092-1-michael.opdenacker@bootlin.com>
References: <16964500F28F0291.7588@lists.openembedded.org>
	 <20210729131311.164092-1-michael.opdenacker@bootlin.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-07-29 at 15:13 +0200, Michael Opdenacker wrote:
> "metadata" is used both as singular and as plural.
> The first change fixes a case in which the verb has a singular conjugation
> but absence of article indicates a plural case.
> 
> The second and third changes are for consistency with the first one inside
> the same paragraph.
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> Reviewed-by: Quentin Schulz <foss@0leil.net>
> ---
>  doc/bitbake-user-manual/bitbake-user-manual-intro.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/doc/bitbake-user-manual/bitbake-user-manual-intro.rst b/doc/bitbake-user-manual/bitbake-user-manual-intro.rst
> index eb140665..55effc35 100644
> --- a/doc/bitbake-user-manual/bitbake-user-manual-intro.rst
> +++ b/doc/bitbake-user-manual/bitbake-user-manual-intro.rst
> @@ -27,11 +27,11 @@ Linux software stacks using a task-oriented approach.
>  Conceptually, BitBake is similar to GNU Make in some regards but has
>  significant differences:
>  
> 
> --  BitBake executes tasks according to provided metadata that builds up
> -   the tasks. Metadata is stored in recipe (``.bb``) and related recipe
> +-  BitBake executes tasks according to provided metadata that build up
> +   the tasks. Metadata are stored in recipe (``.bb``) and related recipe
>     "append" (``.bbappend``) files, configuration (``.conf``) and
>     underlying include (``.inc``) files, and in class (``.bbclass``)
> -   files. The metadata provides BitBake with instructions on what tasks
> +   files. The metadata provide BitBake with instructions on what tasks
>     to run and the dependencies between those tasks.

This change doesn't sound like an improvement to me. I would always say 
"The metadata provides", not what you have here which doesn't read 
correctly to me. "builds up" also sounds better to me than "build up". I'd
also say "Metadata is" sounds more correct too.

I'm not sure I like the original wording but this doesn't sound right, at
least to me.

Cheers,

Richard




