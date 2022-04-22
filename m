Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DD4EC4743E
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:01 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.6810.1650624103909676811
 for <docs@lists.yoctoproject.org>;
 Fri, 22 Apr 2022 03:41:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XqgXE1zF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id bg25so4145105wmb.4
        for <docs@lists.yoctoproject.org>;
 Fri, 22 Apr 2022 03:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=xcq13GkNFYPYVIj7rkYYNsPHAixydHvSz429/KQ/Iro=;
        b=XqgXE1zFGsHSUYmxqF5TOF4fsoqLCWEgQRqkfHrg5XARmQhCJXn15Dg/RuQgfcgIT2
         IyFJvXf7Bs2mdhRuL9Fl6688Jxew3dAQFw43qmiN4EMbSP78SZBhrGmvZpgsM0allK6b
         y67vCVpLh2VLgsp7b/Gbc5qu9/X0bkd5SlpRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=xcq13GkNFYPYVIj7rkYYNsPHAixydHvSz429/KQ/Iro=;
        b=foM6lk64JavyrRIEQ282OJl8SFD/J1CJrm0cFp9Zdct1VgJQa8NvekN/AU+0piKqXw
         Us1tekiqsP/hhij3x+K0vlNRR6qrB6ZmuNH4aMxkpxIEeVuYMTsNJmUwTdO5oZR5iFvU
         C0EKD1fuorSLK30OQO57O+N3DYPZaGQmEDr3i4IDfvFU6kzhNtvYo72//ZnmHWF/O40p
         M965rYoVF/zq33rAVtVeOAnR4lsCmzoVdQqQ2ha0otVDp62E6F9Vb8PTghKaByki0Zs2
         JxYVJmxjQu90l+CAS0ze6+wd6tOgyTqon0Kt+bAmf767PdVHiTAq8AAeVn9PgdDBKL5Z
         /w0Q==
X-Gm-Message-State: AOAM531HkgcrNLxlIx3nCqmRCU5IzVsPeLgPxw/6uqt/VvTxObmonqqY
	8V6+ksJJangcCYPZFUmkaQCCfw==
X-Google-Smtp-Source: 
 ABdhPJwFKFZnhuM27yeBy8MmsB/90em7dW4oIX+nWZGLHztcUoC3nNmntX9EjaMIx4LjYms9IaK1wg==
X-Received: by 2002:a1c:2c3:0:b0:38f:f280:caa3 with SMTP id
 186-20020a1c02c3000000b0038ff280caa3mr3524986wmc.14.1650624102365;
        Fri, 22 Apr 2022 03:41:42 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9788:6d00:bfe8:c84e?
 ([2001:8b0:aba:5f3c:9788:6d00:bfe8:c84e])
        by smtp.gmail.com with ESMTPSA id
 b5-20020adff905000000b0020a8781be70sm1421410wrr.12.2022.04.22.03.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 03:41:41 -0700 (PDT)
Message-ID: 
 <3de2f3e9e9443dc00aa92ef3c5ffb9d1114b3c91.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH 1/9] migration-3.4: add missing entry on
 EXTRA_USERS_PARAMS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>, Paul Eggleton
	 <paul.eggleton@linux.microsoft.com>, docs@lists.yoctoproject.org
Date: Fri, 22 Apr 2022 11:41:37 +0100
In-Reply-To: <4ed50a72-e184-a1aa-3ae0-6fad861bc273@theobroma-systems.com>
References: <cover.1650591341.git.paul.eggleton@linux.microsoft.com>
	 <ba92472ebfa6fad1a0ca73327093afaa9e30374b.1650591341.git.paul.eggleton@linux.microsoft.com>
	 <4ed50a72-e184-a1aa-3ae0-6fad861bc273@theobroma-systems.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 Apr 2022 16:52:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2836

On Fri, 2022-04-22 at 12:30 +0200, Quentin Schulz wrote:
> Hi Paul,
> 
> On 4/22/22 03:40, Paul Eggleton wrote:
> > We missed noting this in 3.4 but I noticed the documentation was
> > recently updated, so note the removal.
> > 
> > Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
> > ---
> >   documentation/migration-guides/migration-3.4.rst | 7 +++++++
> >   1 file changed, 7 insertions(+)
> > 
> > diff --git a/documentation/migration-guides/migration-3.4.rst b/documentation/migration-guides/migration-3.4.rst
> > index 139b2bf..dead6bc 100644
> > --- a/documentation/migration-guides/migration-3.4.rst
> > +++ b/documentation/migration-guides/migration-3.4.rst
> > @@ -265,6 +265,13 @@ Miscellaneous
> >     built-in override support in the fetcher or overrides in general
> >     instead.
> >   
> > +- The ``-P`` (``--clear-password``) option can no longer be used with
> > +  ``useradd`` and ``usermod`` entries in :term:`EXTRA_USERS_PARAMS`.
> > +  It was being implemented using a custom patch to the ``shadow`` recipe
> > +  which clashed with a ``-P`` option that was added upstream in
> > +  ``shadow`` version 4.9, and in any case is fundamentally insecure.
> > +
> 
> Nice catch!
> 
> I would say that only hashed passwords are supported now and point to 
> the extrausers.bbclass doc here: 
> https://docs.yoctoproject.org/ref-manual/classes.html#extrausers-bbclass 
> which explains how to do it?
> 
> and maybe we should mention this in the EXTRA_USERS_PARAMS actually in 
> addition to where it currently is located (extrausers.bbclass).

Can I tempt you to send a follow up patch against master-next please? :)

Cheers,

Richard


