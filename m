Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6138FCDB47F
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 08:03:06 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6595.1782374582940884352
 for <docs@lists.yoctoproject.org>;
 Thu, 25 Jun 2026 01:03:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=QjKj4bMl;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BuCqm3ckP2xPEa6rMtgp/kmVnyFEB+17FKwviZ8gVr0=; b=QjKj4bMl/iPTpes41OWiMDDNuN
	U7FHPbH91D4mK36oGQS0rd7kQeYvE7ncHbl8cbasLPBD6+Af6WqKWU8580hZUIDzmQyIN/HV8GP+K
	z8OWGP8gQQLXRAa3hPWPR27y1bce4xPoExXQR5RkFCnUjR4nLTZ6peFmbbKir6XAiLRz15NVMH7YD
	CynouK2w+85fA1xS5Wjv0d5WwcPQVhquRyevmCrI93Q3vTxJbuWlvh84QzRVYZCNcLn5NMaHgTRW8
	bwJsMvxQ6wPoRypfzpHm2ylzg4ZatyRBKkwsrqfBafYIqyVaoYlSnDaoryXGOK4l1Vgyfo+O6YXts
	5F+klX+A==;
Received: from bras-base-otwaon0916w-grc-51-67-71-147-190.dsl.bell.ca ([67.71.147.190]:56708 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wcf35-0000000HYxM-20DC;
	Thu, 25 Jun 2026 04:03:01 -0400
Date: Thu, 25 Jun 2026 04:02:53 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: antonin.godard@bootlin.com
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: organize all recipes-* directories
 under subdirectory
In-Reply-To: <DJHZ0Q6RNWE3.4CJ8FWBSSANU@bootlin.com>
Message-ID: <eee247a8-6ba3-a60f-0192-01e802ab75be@crashcourse.ca>
References: <543708dc-e1aa-0798-653b-d8c073dbec50@crashcourse.ca> <DJHZ0Q6RNWE3.4CJ8FWBSSANU@bootlin.com>
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
 <docs@lists.yoctoproject.org>; Thu, 25 Jun 2026 08:03:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9873

On Thu, 25 Jun 2026, Antonin Godard via lists.yoctoproject.org wrote:

> Hi,
>
> On Mon Jun 22, 2026 at 10:29 PM CEST, Robert P. J. Day wrote:
> >
> > It's cumbersome to list all meta/recipes-* directories under the same
> > level as other meta/ directories, so place them under a recipes-*
> > higher-level directory.
>
> I disagree. I don't see the added value of this, and following this
> logic you'd have to do this for conf/ as well. I think it would just
> add too many levels of headers.

  yeah, i rethought that and you're right. toss it.

rday

