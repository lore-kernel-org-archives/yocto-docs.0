Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88D33C43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 09:48:42 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34222.1782726521387036259
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 02:48:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=xUVYvbcR;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gT8ySon7lR9PO+1KkfU/SAgPpsRTV8fkwPHJPxnOrHc=; b=xUVYvbcRVFzeYpbkFg1otws9wi
	tGS/V7r9bzqB0juBk+nC/pBwDaEKNLhggoyU5QcBfOXiyZJQIakQqA88rRIfppmpvrT4PKUoofejO
	BxXkqA5DrSMOZfrpIoUnc6O/IEv+Z1Ri/BKBN8sKiT7tlHWd9UjtPo04qdjGRMdbJ8KYS/Tl5MiYR
	titao34rBnVKpVbVR6/E3FnnJlFsHc3FyRa0Phq8UrR3YDOFQIfZ5vzvOZJYxBm/b4ud8dBc+w0Nw
	EQW3DcmEl/Ugi8KFAYarUeS4626tmKPDtDrQIniaXcOWOumLeAkrNQFIPbdFOazeszy2IrIyvf0OZ
	i60B5KxQ==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:39728 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1we8bU-0000000AfaV-2ENU;
	Mon, 29 Jun 2026 05:48:39 -0400
Date: Mon, 29 Jun 2026 05:48:22 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: antonin.godard@bootlin.com
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: add intro content to Ref Manual
 "Tasks" section
In-Reply-To: <DJLFM8MMDKNM.YEBARH11AGN@bootlin.com>
Message-ID: <d8e5c484-0e02-a8a4-1089-78de65df9ca9@crashcourse.ca>
References: <be80b3e5-3887-e388-cf4d-8c947775c10f@crashcourse.ca> <DJLDC44CFJYL.1C6ACT3B4ATW6@bootlin.com> <592e8b31-4742-2935-5d4d-e5173b5efe14@crashcourse.ca> <DJLFM8MMDKNM.YEBARH11AGN@bootlin.com>
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
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 09:48:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9968

On Mon, 29 Jun 2026, Antonin Godard via lists.yoctoproject.org wrote:

> Hi,
>
> On Mon Jun 29, 2026 at 10:42 AM CEST, Robert P. J. Day wrote:
> [...]
> >> > +   do_compile                            Compiles the source in the compilation directory
> >> > +   .. etc etc ...
> >>
> >> Nitpick, but I think "..." is enough.
> >
> >   ok, i'll do that next time. or would you prefer that tweak?
>
> There's another comment I made regarding run and log files. So you can tweak
> this in the v2?

  ok, will get to that shortly.

rday

