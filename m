Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C71FC98321
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 15:55:16 +0000 (UTC)
Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com [74.125.226.235])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1686.1790265307000927163
 for <docs@lists.yoctoproject.org>;
 Thu, 24 Sep 2026 08:55:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UBOLJiZN;
 spf=pass (domain: gmail.com, ip: 74.125.226.235, mailfrom: twoerner@gmail.com)
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-97e7c62dde3so727249241.3
        for <docs@lists.yoctoproject.org>; Thu, 24 Sep 2026 08:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790265306; x=1790870106; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+OluqF5YLiGGtqgTD6F+/xoJjWnilE+OPROJenSTozA=;
        b=UBOLJiZNEVZb2i+7A2aRQYVLdke4llF4M9msWAPaQP5N4bKJjhvtpJ5twRZr8yp/T6
         voWnIoKZm1eMzTaCe3osukVoYH2IWLgRlMwgFOVDsQfUH/SIqSoY04d53vyO35Q9lgrg
         EMSqP2YUTK6thkqbifrAXvXGd3gsAaYchgkdxU4cFFYITUyzqVL0Zi8Deq+jomQkpXrr
         suTmvAjxJS7Cviel4GQYvk28KDmO8NqMw3A47DM4pB2MhdPSuzG3ls27OUKRkKAWUNYs
         Z/TiPcBGf9IMTyjzEP9C/Nl5a848doSDQxVlBa5JPeDpFuONo0492M6JCm0DxK4MynOi
         jXfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790265306; x=1790870106;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+OluqF5YLiGGtqgTD6F+/xoJjWnilE+OPROJenSTozA=;
        b=hA8yHnm9h4+HxTOaJi2tUYTgEDuyy3qBn0slE4Wg5JxQS01aU3FSLuJjvjsmVXMbZK
         CeshjzyHYfVbfcBTSRhijzKp4fSHAeCNY8x+M+O/qNl2FWi3Ie/bZ0SC2TskAoZhFLI4
         3lgp8VMVM2YQmxkPWuMKLZjXy1cJ11N07wbXfNiIcuVFfPeP92QwymQgTKRj6GidUFQ9
         yTRHG9ibb5qf4l9hNoFSRIxGpXz5VX3KJmBRDbP6FtMau2HXdbY/7+NsdiiJ5YnXnMFx
         j92iqWnSp723Lhs0ls2IMgOYWEYRxp7IXndg5/AlAq0jh9LmI22sBy5IGydZuUKmWcMi
         HTTA==
X-Gm-Message-State: AFuF++kzakpTNNlzCDwTg9LNgFtFA+09XoQ6mGnw8m+Zks2d099H7A2c
	pj/q7uMSUG7ifkvg5WrtC9O08V+7ee0rOPpMS9cUfbmfWtqaa3CF8l8i
X-Gm-Gg: AYBFou0mITAwwS6xW/VomSCYQRrPriD9eEYwKLyH9oynQcPnBC69OaBrEYaGNOniNGq
	Vo4P1OSSpimsyMN6cGAQ4EyXisdz1JNHQd3SIf7camEWoW8CaVsbDD7i1ds7SX7CQlJfwfvAmFx
	6oN8nUZQOq1luoO3mX/5mpjmwNPkaHTXs+sCuzmQUD4evmWMTwKAHEQdJfkSwe9x8nxlMDa8K+z
	C6buDeMDw31OhOUXScCG8Pw0PG08TcIoAp8tA2djGF2wB9CkRHsW82C+M03f8aH08c/TTIaAtBO
	bNsJxTqnrCNTqlxkVx5bgWQjRK14Zl4vdQR4/P8IpTLdHYqyszPYGaNnVeHGvBSDh0K8UARH6O3
	sI9bBMm9QHhMDvUk3SlnFFEbLBpFT+Y8iZsGpoyyBJZ3qU/NmEg2Li6r/I9+5foZQBDxICBQs4j
	1TuG4eKEwXn/AAIhKlyixULd6O251S6bj1XwbBh+z4BhUPO1R4ZGnTtEMNfkFZTJUwRCDrcKtgq
	Kz2SiB9RQWMFhZ44SFaVMptowKG1k3asbadwzOU
X-Received: by 2002:a05:6102:358d:b0:7a1:f7d2:e843 with SMTP id ada2fe7eead31-7af1e9f2334mr1150163137.19.1790265305877;
        Thu, 24 Sep 2026 08:55:05 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7abf5c6d7b2sm8954667137.8.2026.09.24.08.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 08:55:04 -0700 (PDT)
Date: Thu, 24 Sep 2026 11:55:02 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v2 8/8] ref-manual: put the ARCHIVER_MODE comments
 on their own lines
Message-ID: <arVH1uMcpgStP9Yu@localhost.localdomain>
References: <20260922183249.2433345-1-twoerner@gmail.com>
 <20260922183249.2433345-9-twoerner@gmail.com>
 <81ce3fb5-55c9-4b50-abea-aa0b1306bccd@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <81ce3fb5-55c9-4b50-abea-aa0b1306bccd@cherry.de>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 24 Sep 2026 15:55:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10618

On Wed 2026-09-23 @ 01:09:11 PM, Quentin Schulz wrote:
> Hi Trevor,
> 
> On 9/22/26 8:32 PM, Trevor Woerner via lists.yoctoproject.org wrote:
> > BitBake has no inline comments. A "#" after a value is not stripped and
> > does not end the statement: the parser simply fails to match the line, so
> > each of these varflag examples would be rejected outright if copied into
> > a configuration file.
> > 
> > Move each explanation to the line above the setting it describes, which
> > parses and reads the same.
> > 
> > AI-Generated: codex/claude-opus 5 (xhigh)
> > Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> > ---
> > changes in v2:
> > - the srpm varflag is no longer in this block, having been removed
> >    upstream in d5216e3fd4be
> > ---
> >   documentation/ref-manual/variables.rst | 21 ++++++++++++++-------
> >   1 file changed, 14 insertions(+), 7 deletions(-)
> > 
> > diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> > index 8a9bd9075843..0d7069433bf2 100644
> > --- a/documentation/ref-manual/variables.rst
> > +++ b/documentation/ref-manual/variables.rst
> > @@ -158,13 +158,20 @@ system and gives an overview of their function and contents.
> >         original source, configured source, and so forth by employing the
> >         following variable flags (varflags)::
> > -         ARCHIVER_MODE[src] = "original"                   # Uses original (unpacked) source files.
> > -         ARCHIVER_MODE[src] = "patched"                    # Uses patched source files. This is the default.
> > -         ARCHIVER_MODE[src] = "configured"                 # Uses configured source files.
> > -         ARCHIVER_MODE[diff] = "1"                         # Uses patches between do_unpack and do_patch.
> > -         ARCHIVER_MODE[diff-exclude] ?= "<file> <file> ..."    # Lists files and directories to exclude from diff.
> > -         ARCHIVER_MODE[dumpdata] = "1"                     # Uses environment data.
> > -         ARCHIVER_MODE[recipe] = "1"                       # Uses recipe and include files.
> > +         # Uses original (unpacked) source files.
> > +         ARCHIVER_MODE[src] = "original"
> > +         # Uses patched source files. This is the default.
> > +         ARCHIVER_MODE[src] = "patched"
> > +         # Uses configured source files.
> > +         ARCHIVER_MODE[src] = "configured"
> > +         # Uses patches between do_unpack and do_patch.
> > +         ARCHIVER_MODE[diff] = "1"
> > +         # Lists files and directories to exclude from diff.
> > +         ARCHIVER_MODE[diff-exclude] ?= "<file> <file> ..."
> > +         # Uses environment data.
> > +         ARCHIVER_MODE[dumpdata] = "1"
> > +         # Uses recipe and include files.
> > +         ARCHIVER_MODE[recipe] = "1"
> 
> It probably is also for the best to avoid long lines wherever we can. I
> personally would add a newline before each new comment so it is easier on
> the eye but that's just a matter of taste.

I agree too. I was on the fence about it, but since you flagged it, i'm
happy to make the change.

> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
> 
> Thanks!
> Quentin

