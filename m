Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3E85FA1FEC
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 19:33:24 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.91000.1776886402107017646
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Apr 2026 12:33:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AofXpR5C;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8ee63e91acfso166730985a.2
        for <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 12:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776886401; x=1777491201; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IN/q7J7O9DJlay9oov1z6oOKbOrN72JMNBI+nJAUTMI=;
        b=AofXpR5C9ie4Soy/B+FBWHuSKui4FASp+p1LQbdXsJRL3LlEfpMEHyQkdVNZYx3Odh
         XGnSiSioXF+2NnyNJ4OSz2d1naZsMpwDr82JRMim8Mh4ZNAB4HBjh1t5DKi5bc/1Uuh4
         EaRFImVDQxzhEV8Jzxsz3SXkOHkaeFe6tadb8M8OcBnUE1ARpiiEI6CgMTm5j7cxY+C9
         YhZJDKnAVXwl6Tt9Ss492fwqPwob8bmlq3otegqbzA5ptLzLjkJZcoQpEEHLbvJtu8g6
         axwQrXA2QdwVC57sSEkFEhooVLhg7FnmeRlZ9UKC/6IJAGd9AuwiGDTLKPHTdiFYfhjD
         hdvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776886401; x=1777491201;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IN/q7J7O9DJlay9oov1z6oOKbOrN72JMNBI+nJAUTMI=;
        b=qHihHIFxuVQfEyZdcL/0wstrBwoUywtsuLLayNZdLG4pJiNlm42tKABPVdVhmJ+7He
         SAuvXyOEKJf5NzwgG+71bkPoXU5mnL8kdOuTh/kOfHUqCrJ3dEPIKIgbjreoLj/BLqRe
         SifLyYP+3ybA7kAGduFa0oBsKJJhcAwxIOffwR776tWreXvsprzY2GauzysHoieMp3LC
         EPfUyxHCfNqmoajc1TIU8v6r+CSG103FiD5uEaxIhKDHnVtJvqF9HSjbLlYjuHe+Rcwb
         Bj3Slm+b1dNaYFxMBGN/KhkQ9WegwNMrfWTxuNIhpDoAVeK8ryvFpiFKaW1YBz5f9P3j
         VcXg==
X-Gm-Message-State: AOJu0YyMw3kkovOy2BNSnF4hr1/ANac8SxezaNBNyAQUR32uVgYtdnSm
	LHGsXdisv4OpeFVjLvnj4MU1rQPO/5eWJiTZdEbhvzndWx2HzpkLJY4ZpwBgJQ==
X-Gm-Gg: AeBDievyyHbrkxbrwUASeH+l5oRAoDOQ6A56QnbnZKVza/HzHN2/+0HPTbNNGj9RtEL
	mMMq7e/heZaI83JHowstcnWOZku1EisMfXnC79aOAXYUE6vqo53EPxITAAZL7SXSTdlEe77duLZ
	qBv4cQ7mGxTHf6DziSxBezbT8GbKlLYAaDXt41QtudkUt6XronJHyoFgaEu7TVMQUy7SBv31o4k
	dMStSCILoSitHYViRv08K3MhoLRNmrHfiPS/aJ4ZXPfNYn/W8TXuVxa9YU1lX/8qyTizgi4UmXp
	vtv8y2DxYquYW/7YBLKonHilgqTYVqKBy5gzYmIXZSsgFNJVLNLvpS+bAOKCJGZNxBIyTljlytr
	tgu8QRsInZAaTcUt0ILW6b3xEn0Sih/ws33JXEHVxPw/3il/IYfPGbN1PD80nE1bAapOl6ud1OE
	eWG6l17S/UPUL2GPfe0PI22lrg4tjN8uoOO6R/YutIMdvG/97GxVuaJSZLG0xE1ruQaleZF6V1I
	tWg
X-Received: by 2002:a05:620a:4803:b0:8d7:2745:6455 with SMTP id af79cd13be357-8e791b8d4f7mr3558005785a.33.1776886400930;
        Wed, 22 Apr 2026 12:33:20 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ee67115aeasm539014085a.44.2026.04.22.12.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 12:33:19 -0700 (PDT)
Date: Wed, 22 Apr 2026 15:33:18 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [RFC PATCH 1/2] add a "bitbake" pygments lexer
Message-ID: <aekifgKmUQFnOa5T@localhost.localdomain>
References: <20260421172416.1801567-1-twoerner@gmail.com>
 <20260421172416.1801567-2-twoerner@gmail.com>
 <DHZHJMU79QRA.QGWLX7MEM1TL@bootlin.com>
 <aekCLM6QTkN_VPqC@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aekCLM6QTkN_VPqC@localhost.localdomain>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 19:33:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9329

On Wed 2026-04-22 @ 01:15:24 PM, Trevor Woerner wrote:
> On Wed 2026-04-22 @ 08:55:39 AM, Antonin Godard wrote:
> > Hi,
> > 
> > On Tue Apr 21, 2026 at 7:24 PM CEST, Trevor Woerner via lists.yoctoproject.org wrote:
> > [...]
> > > +# Pygments does not ship a BitBake lexer, so this Sphinx extension provides
> > > +# one.
> > 
> > Have you considered contributing this lexer to Pygments instead? I would rather
> > have it there than having to maintain it here.
> 
> All development on Pygments occurs on github: https://github.com/pygments/pygments
> Currently there are 143 open pull requests: https://github.com/pygments/pygments/pulls
> (some going back to 2019)
> However, the latest release was 3 weeks ago: https://github.com/pygments/pygments/releases
> 
> I will create a pull request for this feature and see where it goes. The
> contributor information for the Pygments project is very clear that they
> are not interested in adding/maintaining lexers for "pet" languages.
> 
> https://pygments.org/docs/contributing/
> 
> Of course *we* are all aware of how big the community is that uses
> bitbake, but will we be able to convince them? bitbake's usage is large,
> but compared to, say, something like c or python... All I can do is
> submit and see. Realistically maintaining it ourselves is a likely
> possibility if we're interested in this feature.

We'll see what they think: https://github.com/pygments/pygments/pull/3103

> 
> It was interesting to me to discover that our own documentation does not
> know how to handle bitbake syntax.

