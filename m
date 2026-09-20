Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91A33C982CC
	for <webhook@archiver.kernel.org>; Sun, 20 Sep 2026 08:45:17 +0000 (UTC)
Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26594.1789893913684698332
 for <docs@lists.yoctoproject.org>;
 Sun, 20 Sep 2026 01:45:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fPJP5a93;
 spf=pass (domain: gmail.com, ip: 74.125.230.204, mailfrom: twoerner@gmail.com)
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb76c9deeso27444321cf.1
        for <docs@lists.yoctoproject.org>; Sun, 20 Sep 2026 01:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789893912; x=1790498712; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:to:from:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TXt0ZzALnfZxGeTv0GDpuhxktdP6t0497WODW9w+hQg=;
        b=fPJP5a93l2Kg3A1kydVXxsCNY2/KfoNn6r9NVN/ED7WdTVfryoGz0J6A8hYtO081wa
         t5St0vLx5AXDxT+ckmyiOQZSPBcFTCZttknt87nYVywPZw78E04YmmZHtTCsg5vsH9qq
         bSfF6ZHFFpzl0QuPC+Y7An1RgL+Af4NfmMViPp13LbGaRCJjVRuq+cIHI5yMR8hevisd
         Gb+nuvqbJBL7H7pb7Ku2fNXn9uG2qgCvtKLX5fekQbq2H62/bWEh2Ah2r0BdGY1rBTRT
         Krx8SBbd3vxsCwwwuLDyC9E0QIAj+g26V4zBlNPfVFooY1ANH0EEEaC15Trh6/CsJcuu
         Q0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789893912; x=1790498712;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TXt0ZzALnfZxGeTv0GDpuhxktdP6t0497WODW9w+hQg=;
        b=d3bwg6BqLVQ1kJB9zejbxBiQRanDu1j+qYz/f5vGGrVVfKnj5yaT/2i+0UpiyHOlJT
         ekIPvOC8JlUSOdOcMJK7WGP6apEdpJ0+RclpO2717lEP1StsnQkvc9ui3HLOlDGZsX2w
         sjLi0OsM8DdnpEGIHo+AtOorf2XlvLGn6Ulorye9HrLMXXvX1KGWajM6RAmLZXtaes2D
         RsEoEBIlm+TXrsebn5r3p6jHksnJiceiP7cX0ZKEkl/WUjqvB/kg+W8W2mSgRJ9yO2Ev
         uYDul56KM59oQBnw21kfiCe+GlWR2qLEybxo9OY9eAlN4DG65fA4AyFNAj73FsVokyRa
         i1RA==
X-Forwarded-Encrypted: i=1; AKwUvBy4UlN+Gcs4sw9o/2eqDN0fmu+xRZL5EtuamdGnSUnwtxVv7J3aqwSzu0PxRNfIL3vELTet@lists.yoctoproject.org
X-Gm-Message-State: AFuF++k7/qauT13AE2voCHC9MXiZ+lbpbPXU6xV5ZlZrGMnDM6d3XyNZ
	ABbTS7O+2u22MBx7AJRRbHmxrxg0xulCKqHi8QY7BHtmds2y4FjR5N+l
X-Gm-Gg: AYBFou2B5u0cFXX+GWM6VVZjdLRQrPSSTBMxU4YAntCcywLcEendzCZ7qvarTY3dI1a
	/tcQtQxEQMxETwP9FRLcN13eWyHxloXP80ZHWvHX9h5yxmcHyA6c8FLNkAioQAndTgUHCHlawnK
	9xump92Q2SqXk11jswCDdarM+DHebJ1BXn1gM8Dps/yiFuhpcpUmvIXQzfXSUCycl5FUC0Qgh0i
	qXb786F77XTf4StWolRtRv7pvv5YRWx95KQX5hlzNxR/TWPSU9DBEnSQ7gT43B2JyX0FzLZSVJd
	bS4Ed5LvUMfi+osTCgqkSo4FFlmLFzJqNQKBmLuP5yWzzQIDV2zWbCM+DMSwBbQrIC24uEkXKhy
	R1A5UgH/G+sxPxgzflAeZyZxPM4l2RsS5+4xrt5scRPuY/HuVhaP10ztKnZ8o1xCETjosgxwIND
	BwctuvnnsLvC75YY4wI9uKXnP5ouaOoihAoLROo66K9jwE+6K78yhgGzYHzr/k4y/bzBV183+P9
	V2/DdNdcqp7EpQd/UupuXhx6IFMq2aXqO3YgK2z
X-Received: by 2002:ac8:7f8e:0:b0:530:1b1:72be with SMTP id d75a77b69052e-532b731b287mr49726721cf.40.1789893912516;
        Sun, 20 Sep 2026 01:45:12 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532ae60fe2dsm36756211cf.12.2026.09.20.01.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 01:45:10 -0700 (PDT)
Date: Sun, 20 Sep 2026 04:45:08 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Quentin Schulz <quentin.schulz@cherry.de>,
	Antonin Godard <antonin.godard@bootlin.com>,
	docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] docs: document the conventions used in the manuals
Message-ID: <aq-dFDtGm3Upw0fJ@localhost.localdomain>
References: <20260831031458.4070250-1-twoerner@gmail.com>
 <DL2ZCLBWUBX3.5ITP3G3AJ0SV@bootlin.com>
 <apWCaeB2azEgKMlK@localhost.localdomain>
 <92a2c1b9-16bf-475f-aec4-4fffbce0012a@cherry.de>
 <18D6A461E5931E16.876402@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <18D6A461E5931E16.876402@lists.yoctoproject.org>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 20 Sep 2026 08:45:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10554

On Sat 2026-09-19 @ 02:17:17 AM, Trevor Woerner via lists.yoctoproject.org wrote:
> On Mon 2026-09-14 @ 06:39:59 PM, Quentin Schulz wrote:
> > Hi Trevor,
> > 
> > On 8/31/26 3:32 PM, Trevor Woerner via lists.yoctoproject.org wrote:
> > > On Mon 2026-08-31 @ 10:18:42 AM, Antonin Godard wrote:
> > > > Hi,
> > > > 
> > > > On Mon Aug 31, 2026 at 5:14 AM CEST, Trevor Woerner via lists.yoctoproject.org wrote:
> > > > > The manuals use angle brackets for placeholders and a prompt to mark a
> > > > > command, and say so nowhere. A reader can only infer both, and one
> > > > > example reads as advice to paste a line that will not parse.
> > > > > 
> > > > > Include the new section from every manual, the way the boilerplate is
> > > > > included, so each is self-contained.
> > > > 
> > > > We already have a standard.md document that explains these kind of things. I
> > > > think it would be more appropriate to add these conventions there.
> > > 
> > > Oh, that's interesting, and I hadn't thought of that.
> > > 
> > > You know how, whenever you pick up any programming book, there's a
> > > section (usually in the Preface) that shows you what typeface is used
> > > for code (versus prose), how a "Warning" admonition is drawn? That's
> > > what I'm trying to recreate here. A "conventions used in this document"
> > > section that is *reader* facing.
> > > 
> > 
> > Fair enough.
> > 
> > > What you're pointing at is a *contributor* facing document. And it's a
> > > good point, something should probably be mentioned there so that
> > > contributors follow the same conventions throughout; it helps make the
> > > document look like it was written by one person.
> > > 
> > > But I feel that a reader-facing conventions section is still warranted.
> > > 
> > 
> > I really think we should aim at removing the prompt for all instructions
> > that do not actually require one, that is (in my opinion) anything that
> > doesn't include the output of the command. Then there should be less
> > confusion around what needs to be pasted or not.
> > 
> > I'm also not entirely sure we follow those conventions currently across the
> > docs, so maybe there's some additional work to be done to ensure the
> > conventions are actually followed.
> 
> Currently our docs are a combination of both: some code-blocks use
> prompts and some don't (regardless of whether output is included).

It looks like, across all of the Yocto docs, there are roughly 705
code-blocks that record command-line interactions describing to the
reader what they need to do on the cmdline (aka command blocks).

Of those 705, 631 already carry a prompt, versus at least 74 that don't.
The convention is already in place, we shouldn't be rehashing a decision
that has already been made.

The only things not already in place are the "how to use this document"
preface I'm proposing, the author-facing material naming the convention,
and fixes for the 74 stragglers.

> I
> would really like to see consistency across all the docs, and would
> happily provide as many commits as are required to see this through.
> 
> The steps to achieve that (in my opinion) would be:
> - have a standard
> - adjust to current docs to that standard
> - write down the standard
> - try to enforce it on future pull requests knowing full well that...
> - ... we'll need regular fixup sweeps to bring everything in line
> 
> I would much rather see the docs adopt the convention that all
> code-blocks that contain things we expect users to type would start with
> a prompt on all lines the user types. The prompt isn't just useless
> noise at the start of the command, it clearly delineates between things
> that are to be run as a regular user versus things that are to be run as
> the superuser. For example while most command on the build machine would
> be expected to be run as a regular user, many commands run on a target
> are performed as the superuser. The prompts '$' and '#' indicate this
> clearly to the reader. Secondly, not all code-block blocks are going to
> contain console examples, there are other reasons to use code-block and
> the prompt would identify which ones are for console interactions and
> which aren't. As you mentioned, some console examples are going to show
> both what the user is expected to type as well as the output; having a
> prompt clearly shows what are commands to type and what is output. For
> the sake of uniformity I would rather not have code-block examples that
> have and others that don't have prompts. Why make it more confusing?
> Things the reader is to type has prompts, regardless of whether output
> is included - simple.
> 
> As for the "what to copy" issue. Every code-block has a "copy" symbol
> that appears in the code-block when you hover over the code-block. If
> the code-block contains things to type with prompts and you click on the
> copy icon of a code-block, the commands are copied and the prompts are
> not. However, if the user highlights what to copy by clicking and
> dragging with the mouse, they will get both the commands as well as the
> prompts. However, that is configurable! It is possible to configure any
> code-block identified as console to not copy the prompts, even when
> clicked-and-dragged with the mouse.
> 
> With this adjustment, there is no confusion about what to copy and what
> not to copy, because it will not be possible to copy the prompt! And, it
> can be configured so that if there is any leading preamble before the
> prompts, the preamble is not copied either. So, for example, if your
> code-block console session looks like:
> 
> 	some/directory (user)$ ls
> 
> And either the user clicks on the in code-block copy icon or they
> click and drag with the mouse, all they will copy is the "ls" and
> nothing before it.
> 
> Having a "how to use this document" section would explain and codify it
> into our standards, as well as having an author-facing document that
> would give this as an expectation. Review would then be performed
> against these documents for consistency.
> 
> > Cheers,
> > Quentin

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#10553): https://lists.yoctoproject.org/g/docs/message/10553
> Mute This Topic: https://lists.yoctoproject.org/mt/121008467/900817
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [twoerner@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


