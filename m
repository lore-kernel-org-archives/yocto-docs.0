Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D325C982D8
	for <webhook@archiver.kernel.org>; Sat, 19 Sep 2026 06:17:32 +0000 (UTC)
Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7697.1789798642068995510
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Sep 2026 23:17:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mBWFTo3G;
 spf=pass (domain: gmail.com, ip: 74.125.230.234, mailfrom: twoerner@gmail.com)
Received: by mail-qk2-f42.google.com with SMTP id af79cd13be357-93bf10a402dso32083885a.2
        for <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 23:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789798641; x=1790403441; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=diqEj/BcbgZnApsEDloOagwvwpMIMSLhvWjcHOima5A=;
        b=mBWFTo3Gg86GR+psN+8ciGgswOLCTTQ6mcK7lwNCmt5uni/yBfmq2C/j/9koedMMyE
         qmBvg0KE5QuwliINzV2J51kDZrTX2ab35PdbNKtygSUXpw0uIp+vuXIfp7GMueuGoCQ4
         AabfF+xenOb8wHRDhcMPtu8UD62zVTOoNlbT8Ssl/1bz9qqbwWn5JgqcSLaU8IsAmnbG
         28Bt5dbb1J4XC54cJWgYM0KDFl0Kd8RZc9HmYuQ1gij5sjSmEeHioksDVOGH6DOAN47l
         qmp5BZwfi5qqoKBl4FekpHJIviUJIyvrm20Vb4FBcWKOcZKJiG/8h8UzhBNiYo6Bc9kA
         I/xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789798641; x=1790403441;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=diqEj/BcbgZnApsEDloOagwvwpMIMSLhvWjcHOima5A=;
        b=k6ah2cIAffF0sE1FJ1xFbvOqF/yG3z9Z4fbmcy94uged0T9eCXCmIIz+NG3p2fPfVq
         WRup8GlrQbu2GXAPrAdwj1u678+uMfJ+7rdwQdRaqrWgnP5dBFH8eoRT+z5wIJG08tHt
         KBtWkBp4HxPd4tu7XUKIehJTrU42yHkovBeo/tlOxW461i8lWoNYvFX6ldCk+Du7uZ+X
         uUk6MwAGu24I855EJYh+6kBvk29cUQ//YGJW/8KNxvBOotNqZ/xDKcJlSfPF2kyIA/3U
         5ATVmPOFyY/wyTSDC8GYx9nNXOA0tOHgOR0PIJQOmy6EUEecyUZLAM8cO3ORUZfcvXCa
         ygAw==
X-Forwarded-Encrypted: i=1; AKwUvBxEuoy6G9DCIT43RcKvp89vtQNHof9y92jShC4OPkZQKUwIywCpa5NWc1b2tIfmguA9K/4L@lists.yoctoproject.org
X-Gm-Message-State: AFuF++lrgX1ty4OKLEns62WNxmDv3+j4gYlbn2It0TwFjciwrlwsVfkV
	yaptD+GQKvEejT6SlMFYnBsSH9a3z4ymNYvHd5++TjvShwTtILJkIzDL
X-Gm-Gg: AYBFou2oBUuZ9BkKeZYIQWh+sOdxwl5jpukiCCXc40jhVqTfl1QNq976PUp4Ic+lDsO
	ScoH+bsS6OpLhR/Z2gxR2fOmftyYkErtNK8Xjoel6b4mXeH/SkJ5DEzqPYcha+M67rwZL0+7gdI
	8Y+qUiZAknc+GEQR+P5OuvIyFIPlCEF+ibEQKHuZ/dikh+QuK7FrkcmBolIeQwQBlfT9lCaNnyV
	570GKzWfhR4yHurcac8eb4OCepJ3rhPOyvRbFTDeR63fFelrZ59U9kMU5CQSXfgKe1AQZHsYvxD
	pf4lDtmxmeVfAldsERH0devMk+Fr0/MOlovAQqQVdY3rMl2Z7TBTzHGPNS59EJMrL2fVE2hUa89
	83PblFcCFtL9gXFIx+0osMy54/ukvHPze9JYVIYfwrOe/N4ZinnMDhdCuK/t0dGWqBDEmqvYchn
	Z8brGegTSHgcncE7QyjjJiwqQxoHhk065lDpi3lwIPj/FaEeqqH/sHnC9TPdtV46ou7nWSP7POd
	uf60xgV1w7Tvn9uLZqrMuGwkEGodlNXuBPli8as
X-Received: by 2002:a05:620a:808d:b0:939:707b:ec10 with SMTP id af79cd13be357-93bf5740c61mr25433885a.52.1789798640954;
        Fri, 18 Sep 2026 23:17:20 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93bedc103e7sm119259485a.18.2026.09.18.23.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 23:17:19 -0700 (PDT)
Date: Sat, 19 Sep 2026 02:17:17 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Antonin Godard <antonin.godard@bootlin.com>,
	docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] docs: document the conventions used in the manuals
Message-ID: <aq4o7Zu-ILYDZnGw@localhost.localdomain>
References: <20260831031458.4070250-1-twoerner@gmail.com>
 <DL2ZCLBWUBX3.5ITP3G3AJ0SV@bootlin.com>
 <apWCaeB2azEgKMlK@localhost.localdomain>
 <92a2c1b9-16bf-475f-aec4-4fffbce0012a@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <92a2c1b9-16bf-475f-aec4-4fffbce0012a@cherry.de>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 19 Sep 2026 06:17:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10553

On Mon 2026-09-14 @ 06:39:59 PM, Quentin Schulz wrote:
> Hi Trevor,
> 
> On 8/31/26 3:32 PM, Trevor Woerner via lists.yoctoproject.org wrote:
> > On Mon 2026-08-31 @ 10:18:42 AM, Antonin Godard wrote:
> > > Hi,
> > > 
> > > On Mon Aug 31, 2026 at 5:14 AM CEST, Trevor Woerner via lists.yoctoproject.org wrote:
> > > > The manuals use angle brackets for placeholders and a prompt to mark a
> > > > command, and say so nowhere. A reader can only infer both, and one
> > > > example reads as advice to paste a line that will not parse.
> > > > 
> > > > Include the new section from every manual, the way the boilerplate is
> > > > included, so each is self-contained.
> > > 
> > > We already have a standard.md document that explains these kind of things. I
> > > think it would be more appropriate to add these conventions there.
> > 
> > Oh, that's interesting, and I hadn't thought of that.
> > 
> > You know how, whenever you pick up any programming book, there's a
> > section (usually in the Preface) that shows you what typeface is used
> > for code (versus prose), how a "Warning" admonition is drawn? That's
> > what I'm trying to recreate here. A "conventions used in this document"
> > section that is *reader* facing.
> > 
> 
> Fair enough.
> 
> > What you're pointing at is a *contributor* facing document. And it's a
> > good point, something should probably be mentioned there so that
> > contributors follow the same conventions throughout; it helps make the
> > document look like it was written by one person.
> > 
> > But I feel that a reader-facing conventions section is still warranted.
> > 
> 
> I really think we should aim at removing the prompt for all instructions
> that do not actually require one, that is (in my opinion) anything that
> doesn't include the output of the command. Then there should be less
> confusion around what needs to be pasted or not.
> 
> I'm also not entirely sure we follow those conventions currently across the
> docs, so maybe there's some additional work to be done to ensure the
> conventions are actually followed.

Currently our docs are a combination of both: some code-blocks use
prompts and some don't (regardless of whether output is included). I
would really like to see consistency across all the docs, and would
happily provide as many commits as are required to see this through.

The steps to achieve that (in my opinion) would be:
- have a standard
- adjust to current docs to that standard
- write down the standard
- try to enforce it on future pull requests knowing full well that...
- ... we'll need regular fixup sweeps to bring everything in line

I would much rather see the docs adopt the convention that all
code-blocks that contain things we expect users to type would start with
a prompt on all lines the user types. The prompt isn't just useless
noise at the start of the command, it clearly delineates between things
that are to be run as a regular user versus things that are to be run as
the superuser. For example while most command on the build machine would
be expected to be run as a regular user, many commands run on a target
are performed as the superuser. The prompts '$' and '#' indicate this
clearly to the reader. Secondly, not all code-block blocks are going to
contain console examples, there are other reasons to use code-block and
the prompt would identify which ones are for console interactions and
which aren't. As you mentioned, some console examples are going to show
both what the user is expected to type as well as the output; having a
prompt clearly shows what are commands to type and what is output. For
the sake of uniformity I would rather not have code-block examples that
have and others that don't have prompts. Why make it more confusing?
Things the reader is to type has prompts, regardless of whether output
is included - simple.

As for the "what to copy" issue. Every code-block has a "copy" symbol
that appears in the code-block when you hover over the code-block. If
the code-block contains things to type with prompts and you click on the
copy icon of a code-block, the commands are copied and the prompts are
not. However, if the user highlights what to copy by clicking and
dragging with the mouse, they will get both the commands as well as the
prompts. However, that is configurable! It is possible to configure any
code-block identified as console to not copy the prompts, even when
clicked-and-dragged with the mouse.

With this adjustment, there is no confusion about what to copy and what
not to copy, because it will not be possible to copy the prompt! And, it
can be configured so that if there is any leading preamble before the
prompts, the preamble is not copied either. So, for example, if your
code-block console session looks like:

	some/directory (user)$ ls

And either the user clicks on the in code-block copy icon or they
click and drag with the mouse, all they will copy is the "ls" and
nothing before it.

Having a "how to use this document" section would explain and codify it
into our standards, as well as having an author-facing document that
would give this as an expectation. Review would then be performed
against these documents for consistency.

> Cheers,
> Quentin

