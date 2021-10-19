Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2CF3C433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 20:10:32 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web10.15749.1634674220193702016
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Oct 2021 13:10:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=jX/KCKAm;
 spf=pass (domain: konsulko.com, ip: 209.85.219.50,
 mailfrom: scott.murray@konsulko.com)
Received: by mail-qv1-f50.google.com with SMTP id k19so705933qvm.13
        for <docs@lists.yoctoproject.org>;
 Tue, 19 Oct 2021 13:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :mime-version;
        bh=mRBfsi5NaktIMy+32bwzfHX0I5c9OJ7NiHWVnHh5kDA=;
        b=jX/KCKAm6vz22QyrFNclLJ87nAHvu2v5cI83B6CEHDc+qcVK+lK92A7WdiQoL+7e3O
         Ko5zOioZ7FQYU3obBooI9nfKHHI0yRl1uC4mFBtmgSUHg0AQxhnOElxQ4Mml39yKe/pa
         4KcquPTXYKx518La7RcL0+u98jXQ1XXDAf9y4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:mime-version;
        bh=mRBfsi5NaktIMy+32bwzfHX0I5c9OJ7NiHWVnHh5kDA=;
        b=CMflCOYz0PpgmWs8iw9P8wi4ihyRxofeZ8J5qS/5LJPezM4XcWBZv60R3WVWnKybZD
         C1+3A+tN1weXuBIQSANIL6lGBHASdZ+BampmJZq6GYY289nR+L4igeDlk4chJBegP2Z1
         ANpYTJJpei6JhQNCullxpnbzeT/kOSmcty/4f41Mlwbzc443vO18jKvuOtHzqMunzRE1
         3BeD4fK/AeLVLhKCf4oPwm6TikybmcdubHsMuL58vST2tsU2BkZwK03VshOCs62wOI0J
         B59yOHlfoijYb8u8y+KHmG7gKDxljgFHgyAIbJnws2u9E0jCL62VFam/aIFq5Lq8t77G
         l6pA==
X-Gm-Message-State: AOAM5302VS3O++b18tUuPZvmFl5TNbbFzLe/LsaXvF7fkR8vjtxB9xqo
	NjY4/BNCWgZj9Z5AH93EuqkseVBOpdAbcw==
X-Google-Smtp-Source: 
 ABdhPJzBdToWkmDgGNwCYvJJA5Q/zbHEhpbrR16sJcKNHZOB+7XDwcAiHOISnHMthcYqsWxTeMegLg==
X-Received: by 2002:a05:6214:a0d:: with SMTP id
 dw13mr1969687qvb.51.1634674219299;
        Tue, 19 Oct 2021 13:10:19 -0700 (PDT)
Received: from godzilla (192-0-174-222.cpe.teksavvy.com. [192.0.174.222])
        by smtp.gmail.com with ESMTPSA id u16sm36669qki.47.2021.10.19.13.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 13:10:19 -0700 (PDT)
Date: Tue, 19 Oct 2021 16:10:18 -0400 (EDT)
From: Scott Murray <scott.murray@konsulko.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 0/3] Improve reproducible build documentation
In-Reply-To: <517a0133-3444-0166-1e80-0242701b1536@bootlin.com>
Message-ID: <628c71f6-83f5-6fe7-a861-feb09fe8d254@spiteful.org>
References: <20211019141824.1980728-1-michael.opdenacker@bootlin.com>
 <a4697ab-c28-93f7-8479-64b3f21683e@spiteful.org>
 <517a0133-3444-0166-1e80-0242701b1536@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 Oct 2021 20:10:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2007

On Tue, 19 Oct 2021, Michael Opdenacker wrote:

> Hi Scott,
>
> On 10/19/21 8:18 PM, Scott Murray wrote:
> > On Tue, 19 Oct 2021, Michael Opdenacker wrote:
> >
> >> This adds documentation for the BUILD_REPRODUCIBLE_BINARIES (mentioned
> >> in the 3.4 migration notes) and SOURCE_DATE_EPOCH variables,
> >> as well as for the "reproducible_build" class.
> >>
> >> Let me know if you wish to extend the description of SOURCE_DATE_EPOCH
> >> to give more details about how the value is computed by reproducible_build.bbclass.
> >> Should we extract the comments from reproducible_build.bbclass?
> >>
> >> I could also mention REPRODUCIBLE_TIMESTAMP_ROOTFS, but since it's not
> >> overriden in any recipe in Poky, my first choice is not to mention it,
> >> not to add to many details to the documentation.
> >>
> >> Your opinion?
> > Richard just enabled the behavior by default in master, so the bbclass and
> > BUILD_REPRODUCIBLE_BINARIES variable are gone there.  It likely makes
> > sense to still document them for honister (and potentially earlier).
>
> Oops, bad timing then. Good that this can be useful at least for
> Honister. I'll submit this on honister-next (coming soon). I though my
> version of Poky was recent enough, I missed the latest commits. I'll pay
> extra attention to the patches then.

Just one note, the SOURCE_DATE_EPOCH piece of patch 2 is still applicable,
and definitely should go into master.

Cheers,

Scott


