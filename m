Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1D54CDB481
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 13:52:47 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7729.1782309164817885663
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Jun 2026 06:52:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=LvuO9KF5;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=iXNhI4zijKxOf4004oQBGqh6W5wWuXh9Vg95iv6cKkU=; b=LvuO9KF5PpjDNmwYEzEp6Hi4Bw
	PurredZMQeSTPKBIt8GTBHbPj4Fb0ELhkBPLFxrOwDvwOZvfkV7R5daZI30Ggpm7OwR2f4hEy/pNo
	S2KytVy//QFE8EI/bAWpfxtPaYEBX7pkZwmGCFV54g//WagbxCnkQ+LfLQb/3YqhavztymUAN4S5u
	ai3ZLT6vzvCi4r3qj2LiOxESiOYfIYfXXy/rwBkD5909OwpQZh4aZnjAeZkozwOk7+sFu0P7BqGXF
	aBxcXwkBW9QEGvNtJvn7xBl07UbmA6oumgRzC0Yc0tFdh0zr+Yjz8I/y/PjWCQU8Rl5i0SN3wxPRe
	xeF1LY9A==;
Received: from bras-base-otwaon0916w-grc-51-67-71-147-190.dsl.bell.ca ([67.71.147.190]:50964 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wcO1t-0000000Fe4s-0ZR0;
	Wed, 24 Jun 2026 09:52:43 -0400
Date: Wed, 24 Jun 2026 09:52:25 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Paul Barker <paul@pbarker.dev>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] Should Poky's "tiny-init.bb" recipe be documented?
In-Reply-To: <720327d5a41a7ec8ef5fcfa4ebf48c6aabffa60d.camel@pbarker.dev>
Message-ID: <40dfa966-a2e2-5bbc-2bae-cdbddf0ce3ea@crashcourse.ca>
References: <5288d9bd-9e65-5b51-02ca-c898b5b34bcb@crashcourse.ca> <720327d5a41a7ec8ef5fcfa4ebf48c6aabffa60d.camel@pbarker.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Jun 2026 13:52:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9868

On Wed, 24 Jun 2026, Paul Barker wrote:

> On Mon, 2026-06-22 at 08:59 -0400, Robert P. J. Day wrote:
> >   Was just perusing the meta-poky layer and noticed the recipe
> > "tiny-init.bb", which claims:
> >
> >   SUMMARY = "Poky-tiny init"
> >   DESCRIPTION = "Basic init system for poky-tiny"
> >
> > But the poky-tiny distro defines its init manager with:
> >
> >   # enable mdev/busybox for init
> >   POKY_INIT_MANAGER:poky-tiny = "mdev-busybox"
> >
> > and "tiny-init" is not a valid value for INIT_MANAGER, so what is the
> > purpose of tiny-init.bb, and should it be documented?
>
> Looking at the git history, tiny-init was a custom init for the
> poky-tiny distro, added in 2012. In 2016 poky-tiny changed to use
> busybox's init system by default. I don't see any other references to
> tiny-init, so we should probably retire it.

  i will let someone else handle that.

rday

