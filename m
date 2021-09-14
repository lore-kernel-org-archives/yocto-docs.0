Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web09.131.1631657463005722384
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Sep 2021 15:11:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QiVG/aYa;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id i23so636167wrb.2
        for <docs@lists.yoctoproject.org>; Tue, 14 Sep 2021 15:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=MpGwMI1aiFrgKXQQLZaN1dyelekuSUNX+Qd7Z1oTtdo=;
        b=QiVG/aYamAuk1Dfdf8dx6TqCjL+0JBd13ObSIYLxY/cQ5bQ0yLLERH2BZu1YUuNHpu
         vKIOAeLledhS4T6+qg6BbTCqED5ES8HfbUbKqt8b6qF2MJnx3pD6rpuy8Cwv0R3T+Pkt
         vEqWR8D0wf2KgSo16hMPCLLQpZPzqcxtIBi6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=MpGwMI1aiFrgKXQQLZaN1dyelekuSUNX+Qd7Z1oTtdo=;
        b=N0kMZi2202+++XSMqUQFfTIk+rtJy8AxcPeBGRH587Qb77QbY4uOH9NpfndLcA2Ta5
         6jYCS+xM9Co3dzwVzZOKcwNSQ587+L2GXvPRmvtvgcoCmArDHUeEjDVA5dSxqX6cyBXP
         J2V5mGBobOSS23eDtnw37bdiKkF7F9QojpGAdICAAazbO8bHEzT2Rq5oJ1zwSW8N7AeL
         bY2pbINgB3SMRteiPkyzP7a3wN2pi92YkjfXGXqjgarfeb9FZlElStu+rJoysXrIQ0aY
         D5C3YgCvG5yDQ46mHK++JR2dQLxVSwAt4b/HSSw/reOImLwArwP0VtU2ky5zF0ghYc5B
         cxRw==
X-Gm-Message-State: AOAM532eRTBdNV7kU/uZIOFsALJcWN8ZEI7xvgXrXIB9RAJ4sOnf39d/
	lRTlD2OZ3bfYEoglCjsyt3OI2w==
X-Google-Smtp-Source: ABdhPJwgRkgXpVzIb4TmDC80gEBUNUe++6TgUhyULPMbHeSbgqbMEy3DhFNayApn9WdPtRalDy/7Mg==
X-Received: by 2002:adf:c14c:: with SMTP id w12mr1411750wre.115.1631657461422;
        Tue, 14 Sep 2021 15:11:01 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:cb98:b99:6df8:dffd? ([2001:8b0:aba:5f3c:cb98:b99:6df8:dffd])
        by smtp.gmail.com with ESMTPSA id z19sm2771991wma.0.2021.09.14.15.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 15:11:01 -0700 (PDT)
Message-ID: <e2e971ad0d00ea02456bdf5010015c1031fe2d77.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] manuals: replace Freenode by Libera Chat as IRC host
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>, 
	docs@lists.yoctoproject.org
Date: Tue, 14 Sep 2021 23:10:59 +0100
In-Reply-To: <20210914190432.2045216-1-michael.opdenacker@bootlin.com>
References: <20210914190432.2045216-1-michael.opdenacker@bootlin.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2021-09-14 at 21:04 +0200, Michael Opdenacker wrote:
> Fixes [YOCTO #14546]
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  documentation/boilerplate.rst          | 2 +-
>  documentation/ref-manual/resources.rst | 7 ++++---
>  2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/documentation/boilerplate.rst b/documentation/boilerplate.rst
> index baccc9fe40..9b64d91efd 100644
> --- a/documentation/boilerplate.rst
> +++ b/documentation/boilerplate.rst
> @@ -14,5 +14,5 @@ Commons.
>  To report any inaccuracies or problems with this (or any other Yocto Project)
>  manual, or to send additions or changes, please send email/patches to the Yocto
>  Project documentation mailing list at ``docs@lists.yoctoproject.org`` or
> -log into the Freenode ``#yocto`` channel.
> +log into the `Libera Chat <https://libera.chat/>`__ ``#yocto`` channel.
>  
> diff --git a/documentation/ref-manual/resources.rst b/documentation/ref-manual/resources.rst
> index 5ffd2b3991..f34ab8a53d 100644
> --- a/documentation/ref-manual/resources.rst
> +++ b/documentation/ref-manual/resources.rst
> @@ -90,8 +90,8 @@ For more Yocto Project-related mailing lists, see the
>  Internet Relay Chat (IRC)
>  =========================
>  
> -Two IRC channels on Freenode are available for the Yocto Project and
> -Poky discussions:
> +Two IRC channels on `Libera Chat <https://libera.chat/>`__
> +are available for the Yocto Project and Poky discussions:
>  
>  -  ``#yocto``
>  
> @@ -187,7 +187,8 @@ Here is a list of resources you might find helpful:
>     implementation of Bugzilla for logging and tracking Yocto Project
>     defects.
>  
> --  *Internet Relay Chat (IRC):* Two IRC channels on Freenode are
> +-  *Internet Relay Chat (IRC):* Two IRC channels on
> +   `Libera Chat <https://libera.chat/>`__ are
>     available for Yocto Project and Poky discussions: ``#yocto`` and
>     ``#poky``, respectively.
>  

I think the poky channel is mostly dead now. Perhaps we should mention #oe
instead?

Cheers,

Richard

