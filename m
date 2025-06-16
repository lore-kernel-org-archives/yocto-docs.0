Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B385CC71136
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 12:55:45 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.29823.1750078538727951206
 for <docs@lists.yoctoproject.org>;
 Mon, 16 Jun 2025 05:55:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=CRB5P5Bg;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:To:From:Date:Sender:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Z+ywaIIjESFsY/1uzzi/dOg5e+1UWr8C5YUO95W58ic=; b=CRB5P5Bgy51pNsAF8ln7mDbOLe
	mrgpCckDW22QGMHsp+wUTc39cFxz1aiRuIlkYxZ99OstUZ5WNVSWKLixLmAVdxH4eO+gd7w0gA7YT
	kBGYnlkmzFV5zTZzqnB++rhiKSacIjzAnZqp1WTZ2MEhXyRPC0gMt/JTAOmDVyt0Dx2ZJkhvKa4fw
	sDCnyYjTZySfVhIwzzNiMNkOgleranMhIA9otHIgFcuc0DyOhdmrVp7X2TopjSfYDHVGFHiBDjr+U
	Vu15WSmIQ7SRE524NvAt+dOSww0N6iaM9Bw260dUm7zSdB3DPIumwY0VBARVl4H4X27u5o/RxZDmo
	BTy0uPgg==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:32846 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uR9N8-0000000E94q-0XEe
	for docs@lists.yoctoproject.org;
	Mon, 16 Jun 2025 08:55:37 -0400
Date: Mon, 16 Jun 2025 08:55:30 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] are there any actual "container layers" left?
In-Reply-To: <184986D6A3CCFEF0.22186@lists.yoctoproject.org>
Message-ID: <1e8eb30d-88a4-22d8-459c-788d7cc854ea@crashcourse.ca>
References: <184986D6A3CCFEF0.22186@lists.yoctoproject.org>
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
 <docs@lists.yoctoproject.org>; Mon, 16 Jun 2025 12:55:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7071

On Mon, 16 Jun 2025, Robert P. J. Day wrote:

>
>   perusing the BSP developer's guide:
>
> https://docs.yoctoproject.org/bsp-guide/bsp.html
>
> and early on, there is a reference to "container layers," which i
> remember because i recall bringing up the issue of how to refer to OE
> layers that were themselves layers while containing even *more* layers
> as subdirectories.
>
>   first, since this is the BSP guide, it's a bit weird to use
> meta-openembedded as an alleged example of a container layer. but
> that's not the issue.
>
>   as i recall, the phrase "container layer" was meant to describe
> something which was itself a valid layer, while containing further
> valid layers; if memory serves, "meta-intel" used to look like that.
> but that's not what it looks like anymore, it's just a regular layer:
>
>   https://git.yoctoproject.org/meta-intel/tree/
>
> as another example, the "meta-xilinx" checkout clearly fetches
> numerous layers, but it itself is not a layer, so it doesn't fit the
> definition of a "container layer".
>
>   is this terminology still useful? and under what circumstances?
>
> rday

  never mind, i checked back and we had expanded the definition to
include checkouts that themselves were not layers but just contained
more layers. i see that meta-security still fits that bill.

rday

