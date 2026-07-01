Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF26EC43458
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 15:51:26 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48394.1782921084731515398
 for <docs@lists.yoctoproject.org>;
 Wed, 01 Jul 2026 08:51:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=pdBrQZBg;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=r7Dq2krQ44l1Z+nxV6EkZkABblv+q5iRpxuKYI0fqVU=; b=pdBrQZBg8N2hzsTqjDXKwRyhlS
	qp+Qqxe5N6k5y3U/Arj5ZRPkQWG5O3w+9iNyU8aiAtA46c5rRzBrmAisy3ofBDhlhlQwEnJS2cF+T
	Ji0J1fZMr9bgIQT//VXeljCUMgZOjb4LZUaeJzt0m8OPbdnWU+kxw7nyEp2p+b3sNTCXWn3OWmux8
	BTeCyRUwvHF5INQrF3LwCE57IlC+A+vIKBTp5kd3lWcULxgLU/XBxb+HRwcTNz3Sj4kV/wzSiK0+R
	1poI/mEQ1ju7aigU9kLEquIKNHGJZPrGkO8eitRVY7kFq9PHsg+++zFNNSsxhAFL8acmsR8Jau+Kv
	Fs/JqtTw==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:49896 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wexDb-00000001xKA-3LUw;
	Wed, 01 Jul 2026 11:51:23 -0400
Date: Wed, 1 Jul 2026 11:51:01 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: antonin.godard@bootlin.com
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] is kernel task "do_kernel_menuconfig" different from
 "do_menuconfig"?
In-Reply-To: <DJNCMBDLM2PH.3SR2L79QRQHYV@bootlin.com>
Message-ID: <235ddf43-f449-cbfa-553d-d2587c37d29a@crashcourse.ca>
References: <c832e729-0920-c0a7-f047-22a2f3bc9558@crashcourse.ca> <DJNCMBDLM2PH.3SR2L79QRQHYV@bootlin.com>
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
 <docs@lists.yoctoproject.org>; Wed, 01 Jul 2026 15:51:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9993

On Wed, 1 Jul 2026, Antonin Godard via lists.yoctoproject.org wrote:

> Hi,
>
> On Wed Jul 1, 2026 at 3:06 PM CEST, Robert P. J. Day wrote:
> >
> > here:
> >
> > https://docs.yoctoproject.org/ref-manual/tasks.html#do-kernel-menuconfig
> >
> > i don't see a "kernel_menuconfig" task defined anywhere in the OE-core
> > layer, but i see just below that a reference to "do_menuconfig", which
> > does exist.
> >
> >   are these meant to be the same thing? should the former task be
> > deleted from the list, and reference to it be adjusted to the latter?
> >
> >   or what is going on here?
>
> Yes, I don't find it either in OE-Core nor in the history, so not
> sure why this was added in the first place.
>
> If you want you can send a patch to remove it and also rework the
> `do_menuconfig` section to make it non-kernel-specific, since you
> can also run this task for U-boot, and other recipes that inherit
> the cml1 class.

  i wouldn't bother rewriting it to make it non-kernel-specific since
it's in the "Kernel-Related Tasks" section, but i have an idea for a
reworking of that entire tasks section that would address what you're
talking about. so for now, i'll just fix it for the kernel. might not
get to it right away, it's Canada Day, time to go out and party!!!

rday

