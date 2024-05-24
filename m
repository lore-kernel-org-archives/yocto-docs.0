Return-Path: <amurray@thegoodpenguin.co.uk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3F8AC25B74
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 10:01:59 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.12158.1716544919133747898
 for <docs@lists.yoctoproject.org>;
 Fri, 24 May 2024 03:01:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.s=20230601 header.b=dZkdfQg9;
 spf=pass (domain: thegoodpenguin.co.uk, ip: 209.85.215.174, mailfrom: amurray@thegoodpenguin.co.uk)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-681907af4e7so565295a12.1
        for <docs@lists.yoctoproject.org>; Fri, 24 May 2024 03:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1716544918; x=1717149718; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8XuVECkthWfVgqwkcYxnMqILSNVo8Sc8czEykzMwoP8=;
        b=dZkdfQg97VmLisFQTkgJeQ9pfCxBLqJ3JkGJBPCj/mAnjMSTTkse+jvcoqzO34X5gg
         OBqn39XeRTe7WgJ4LXCPmZAKmH2XCDMr6J+wakjV0ZZx8OSSlVdSstsDXSJdqf3skAH0
         epQni0Uy+AETaCWDVA52t7c8L8/sYZSHq77CwPT2UkU+2CimaoSFUeF3eWeRXwPfQIze
         xt8y5cx9xKOfLvyp6WbBsOu5E/Rakze0Vc6Lm0EAOR4TsifVpLN5UPzHNwMW6+jsAv4t
         WcXREfb+w57nX2+e8sOEqPZ8jkvaiAE9TSJaON5k/B9qnf7A73KoSRhPjCvkmCGGANNb
         vGKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716544918; x=1717149718;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8XuVECkthWfVgqwkcYxnMqILSNVo8Sc8czEykzMwoP8=;
        b=tB7xlBTzUDlTqARdX735wUSDPVq34/782Kv8aE5nG5YpKUQlzVd4T4v1n28RQ1fRND
         l9mK+QMvSwyD+gNyy+Taf+N/0bvEtZ4NusXrhB17bpcHM0Nh4VjW+SrTJWWB6KWdlZKi
         h0l6H2oCnv+BzQ/MzHWwzFN3z8ZQOmwqBI6pD0atpk2vdPUw0hT5khZolt5PfbsY8sp1
         h1CKDtLqG4ZAphVUD8K9GI7xNXc/oMaPMyZoMjN5mxr2l10BkVzJlU8MY1RpFGHY5a9f
         BxZDV1FPTkLtvVPWmobZt4f5phIA05Uapq/QYzIU/MRGVSD1YeII7lg7k3VrTfp6P9fO
         dPzQ==
X-Gm-Message-State: AOJu0Yw0WEwU2BIn6PBTnG01XMGSJEkpWcH8C+lz6LzZauVQpK7epz31
	S+slQsnTJvJ4UtvOe8hzFzEZW76KbPJnmEZe6i5OmmuDduOjAnuAWNqCQmq+DI/6oVtDLciHCUc
	Avkyle2tk7jp9Ac7+opZHM7XiOHdyUceqbuo5bQ==
X-Google-Smtp-Source: AGHT+IHjDbypHbEXlAXoTO0tikjB+I0H6rearEhQvl0qZmqDdXbRfuKwpqvmhxiFjX8s1ME2KJPFRWFB8nznvvF58xA=
X-Received: by 2002:a05:6a21:8193:b0:1a9:b2ee:5f72 with SMTP id
 adf61e73a8af0-1b212d4c365mr1793276637.36.1716544918386; Fri, 24 May 2024
 03:01:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240523135628.3076018-1-michael.opdenacker@bootlin.com>
 <20240523135628.3076018-2-michael.opdenacker@bootlin.com> <CALqELGzk_0CS4LU_TEwzg1=vrNZcdnNNGOTEZH2T7hhLYM-NWQ@mail.gmail.com>
 <cdf74200-11d6-465f-976a-f17b7b4d0ee9@bootlin.com>
In-Reply-To: <cdf74200-11d6-465f-976a-f17b7b4d0ee9@bootlin.com>
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Fri, 24 May 2024 11:01:46 +0100
Message-ID: <CALqELGw=Pov6GHa7Nz-LD-LqdHOSkCAZU8V0a_py4o7s5n7ovg@mail.gmail.com>
Subject: Re: [docs] [PATCH 2/3] ref-manual: introduce UNPACKDIR variable
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 May 2024 10:01:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5251

On Fri, 24 May 2024 at 09:26, Michael Opdenacker
<michael.opdenacker@bootlin.com> wrote:
>
> Hi Andy
>
> On 5/23/24 at 16:15, Andrew Murray wrote:
> > Hi Michael,
> >
> > On Thu, 23 May 2024 at 14:56, Michael Opdenacker via
> > lists.yoctoproject.org
> > <michael.opdenacker=bootlin.com@lists.yoctoproject.org> wrote:
> >> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> >>
> >> Note that this doesn't touch the "Source Fetching" section
> >> in overview-manual/concepts.rst yet, as the unpack implementation
> >> may not be finalized yet.
> >>
> >> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> >> ---
> >>   documentation/ref-manual/tasks.rst     | 8 ++++----
> >>   documentation/ref-manual/variables.rst | 5 +++++
> >>   2 files changed, 9 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
> >> index 2e4b23408d..70c0dea3bb 100644
> >> --- a/documentation/ref-manual/tasks.rst
> >> +++ b/documentation/ref-manual/tasks.rst
> >> @@ -412,12 +412,12 @@ them. You can learn more by looking at the
> >>   -------------
> >>
> >>   Unpacks the source code into a working directory pointed to by
> >> -``${``\ :term:`WORKDIR`\ ``}``. The :term:`S`
> >> -variable also plays a role in where unpacked source files ultimately
> >> -reside. For more information on how source files are unpacked, see the
> >> +``${``\ :term:`UNPACKDIR`\ ``}``. Another, legacy way to specify
> >> +this directory is through the :term:`S` and :term:`WORKDIR` variables.
> > I find this sentence a little confusing to read.
> >
> > "Another, legacy" suggests you've already given a method that was
> > legacy. But here you're really saying "Another way, which is legacy".
> > Perhaps this could be phrased differently, e.g. "A legacy way to
> > specify this directory is through..."
> >
> > Also it doesn't really tell you how to use S and WORKDIR. I wonder if
> > you need to mention these at all, given they'll be described elsewhere
> > in the document. Why point a user to something legacy?
>
> This definitely makes sense, thanks!
>
> I simplified my paragraph as follows:
>
> Unpacks the source code into a working directory pointed to by
> ``${``\ :term:`UNPACKDIR`\ ``}``. A legacy way to specify
> this directory is through the :term:`S` and :term:`WORKDIR` variables.
> For more information on how source files are unpacked, see the
> ":ref:`overview-manual/concepts:source fetching`"
> section in the Yocto Project Overview and Concepts Manual.

That looks good. Feel free to add my:

Reviewed-by: Andrew Murray <amurray@thegoodpenguin.co.uk>

