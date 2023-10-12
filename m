Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1108CDB46E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 05:48:29 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.5086.1697089703406061922
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Oct 2023 22:48:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=dASLbJ+p;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vCfZJRxJ92ZFKzz+/3SJ4zSx3DAX7HsDbYaqwDJNfVc=; b=dASLbJ+pDopii9woRHIQ9Fisnr
	D7yxggXEaEiWllalYMtUvJLsWbSXCLK2YZRlHCmuzBHm8Y8a77Fsa0Pvca7k0NOiS1ZSTYirQby9W
	OYSdg7n7uFqcWZVGDyTSROspytUCF9S9Kxpw7fKypPbMm4mouD9Cha4R397l0mfM/TJIf5L8uffgT
	yO1p+zwcBtf0ujop6Q9sx358N2WsW+ZwRrjOwYmF5+S5DGYe469Ri4CNOwJEi2jCSkfMF30gyJY+/
	Q4cUnWEVTFpCsmSvAz4T8d48w5yHou6BT25By/SG1In01zLaSznwYGnxIlgcn7KeTAhwKPViqfP7R
	+RWE040g==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:53444 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1qqoYV-008XvB-13;
	Thu, 12 Oct 2023 01:48:21 -0400
Date: Thu, 12 Oct 2023 01:48:11 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] confused about distinction between "BSP" and "BSP
 layer"
In-Reply-To: <6d6409a0527b88f00208aa3f4e8f690c6c70f7f1.camel@linuxfoundation.org>
Message-ID: <25747217-f4ff-c861-7e54-4f01d576320@crashcourse.ca>
References: <bf75ec3734c0a4e0e88e69b06cd6514b@crashcourse.ca> <6d6409a0527b88f00208aa3f4e8f690c6c70f7f1.camel@linuxfoundation.org>
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
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 12 Oct 2023 05:48:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4356

On Wed, 11 Oct 2023, Richard Purdie wrote:

> On Wed, 2023-10-11 at 12:24 -0400, Robert P. J. Day wrote:
> > currently reading the BSP Guide, and here's the opening sentence:
> >
> > "A Board Support Package (BSP) is a collection of information that
> > defines how to support a particular hardware device, set of devices,
> > or hardware platform."
> >
> > so ... "set of devices", as in, a BSP can define the support for more
> > than one board? i ask since, here:
>
> Yes, a BSP can support more than one board.
>
> >
> > file:///home/rpjday/oe/dist/layers/yocto-docs/documentation/_build/html/bsp-guide/bsp.html#developing-a-board-support-package-bsp
> >
> > one reads:
> >
> > "Although not required for BSP creation, the meta-intel repository,
> > which contains many BSPs ..."
> >
> > whoa ... the meta-intel repository "contains many BSPs"?? so a BSP
> > layer contains many BSPs? that just seems confusing.
>
> Yes, they can and do.
>
> > oh, and the meta-intel layer defines all of three "machines", not
> > precisely the list in the Note in that section.
>
> In many cases machine definitions have been able to support multiple
> platforms which is good and it results in decreased MACHINE counts. In
> general a BSP layer can and will support multiple MACHINEs though and
> this has been the norm for a long time.

  i think i worded my original email badly, i think it would be useful
to introduce some form of what you just wrote in the early part of the
BSP Guide. it just seemed like the Guide confusingly conflated a BSP
with a BSP layer, and bounced back and forth in a puzzling way.

rday

