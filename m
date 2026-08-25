Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CD50C61DBE
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 15:05:28 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24152.1787670320582270658
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Aug 2026 08:05:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=q+/XFVrK;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-9061a795d76so52982806d6.3
        for <docs@lists.yoctoproject.org>; Tue, 25 Aug 2026 08:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787670319; x=1788275119; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6RVm9Pxxr2dzZh2SzG/SMDmOWiRgYPGk7utOr8VHMGs=;
        b=q+/XFVrKy2nLVlDYe5M6BR5F/dwgwW4WPMrq6iqZ3/TQkC3cq7kqK1cARumGAmm0Jn
         fnfcvfSX72cZGbSyoUEJw+ps1TbKyRjcwIEwWg7dWBEh6C/qw0/4/3yw2HfkKxooL6sA
         K72XeXkmMojsJgvZPRwtDtKZhiR4h/00IXEYqmgJhEHqAmVIqK5sYoTiYLFFDsDVnX4b
         fS2zBEISKHenD1a3zZ2X/eQcl26lN0pCOAPqUsxQhq1Ws9LSlnsker0hmBtfD04DO1rc
         FuZXM6ZaSIkij0smFmiTORIvXItis5Pl2vu2YzcMHODecHhod4o/8uRqayl92y9UsBzT
         Oe2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787670319; x=1788275119;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6RVm9Pxxr2dzZh2SzG/SMDmOWiRgYPGk7utOr8VHMGs=;
        b=TVd2E6jzF18OcplwyrekzVNLZpD3mVWHSvrtTmi23IkpBfMn+hsUbCwJt3gCTcUUPN
         KTsebrhqfiFkVbayBj22oFTVKbUQ6soC1GzTjM8lIuapGzuqx9F8Koa4UnJoAli32L80
         QTW3s2iGJklTkpSWFwhYowyAz7hXdebCjS8kSA6zvwu5mYy/r+Mj/dNzAohlRWpHmfoF
         wEKd2awwnpugXcfYqCsA9821pEJQvsBURnRyL91EySILbZ3B+Q9h6HqRu9BbbmN17iTP
         FPj3PzD36T5+FaetGVqSVxVkATh4XrbnbJBX7IAm0qYgM2uM7v5ZyAxmYJQ/iLCRQctz
         Oyww==
X-Gm-Message-State: AFuF++ljtjensmQ5uOo6vyu9cbudJv7NBcxtksIOiv0MDlzNjdPDC5lC
	FvAVWTp6etrmyZ5+iAMTxo0p9YNcgwrseT0HVA2jh0Lq2ezorQQVtuRk
X-Gm-Gg: AR+sD118RWRZOxDtmJ61QgaE6TjEEvqOUPuc3/dBuUWB/RPDupNnkqbv+AX1aAIYMCV
	HbDxCENa9xwtQfN4xkuWCexQeFERQu5QoaJ/F8S2WVJEzoDP4qJPQR2aL85DBJHA3REzQ0bi+nB
	kwe9Ruuy196bBsYVYxpiQudYQVKxbwoVp5KNvGrac0kkyxt4Rp4AzZONMl+o0KQ68onjm2e0hov
	4UbFu+GWjMwmRvPuxT0lHPsM6WBaguP+O4q+yZI4hedTVu1QcoQf3ZqHmYK5B8YSirz0fkrhEOK
	SuEtbVyPvZ2wZaxbnsE9zP0o+YqHqr6tT5Vgt9eIrfTC0LL2RhpgOBXK0My23Mdn+9w4QVT5Onl
	FFo6CA0wq8Kio6awxFzUM5U7KYrkm5nIaeZNMnk6xBEKuzIyL40pfRE7UllQuHWIh5+R5h0bqnP
	YFdJlws7tLe9yrC40fbhnIxCXt24GtQ8B58y+FyZRjIagy1autkgVGSH7F2FtrsErwAjdrsYyU0
	xX2lQhH0umAMUBbnmALw+z2qDA/GDo=
X-Received: by 2002:a05:6214:4597:b0:90a:4361:9c4f with SMTP id 6a1803df08f44-90cb77e80b1mr88943456d6.1.1787670319200;
        Tue, 25 Aug 2026 08:05:19 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90cc63e3108sm833556d6.11.2026.08.25.08.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 08:05:17 -0700 (PDT)
Date: Tue, 25 Aug 2026 11:05:15 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: request a rebuild to pick up Pygments 2.21.0
Message-ID: <ao2vKw7IxuaePqs6@localhost.localdomain>
References: <aozKcnogXKWfOiFA@localhost.localdomain>
 <53235180fe3e221ea8bd27c81afc4a35085226b7.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <53235180fe3e221ea8bd27c81afc4a35085226b7.camel@linuxfoundation.org>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Aug 2026 15:05:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10340

On Tue 2026-08-25 @ 07:36:48 AM, Richard Purdie wrote:
> On Mon, 2026-08-24 at 18:49 -0400, Trevor Woerner wrote:
> > Could someone build buildtools-docs against current master and publish
> > the result?
> > 
> > scripts/run-docs-build line 29 pins the docs toolchain to the
> > yocto-6.0_M2 tarball, which ships Pygments 2.19.2. The newest
> > published milestone, yocto-6.1_M2, has 2.20.0. OE-Core master carries
> > python3-pygments_2.21.0.bb.
> > 
> > 2.21.0 is the release that added a BitBake lexer, so it is the first
> > version in which
> > 
> > 	.. code-block:: bitbake
> > 
> > does anything at all. I have a conversion of the BitBake snippets
> > in yocto-docs and the BitBake user manual ready to send, but on the
> > current toolchain every block would publish unhighlighted - and since
> > run-docs-build drops the Makefile's -W, silently.
> > 
> > I've tested the change. run-docs-build feeds every BitBake docs branch
> > through $builddir/buildtools unconditionally, and yocto-docs from
> > scarthgap forward, so I built all of them twice - once with 2.19.2,
> > once with 2.21.0 - applying the same docs-build-patches and master-file
> > checkouts the script does:
> > 
> > 	bitbake     1.46 through 2.18, and master          14/14 identical
> > 	yocto-docs  scarthgap styhead walnascar whinlatter   4/4 identical
> > 
> > 36 builds, same exit status, same warning count - zero warnings
> > throughout.
> 
> How urgent is this? Could we do this as part of M3 and use the artefact
> from that release build?

Not urgent at all. Adding a bitbake lexer will just make the docs
prettier.

