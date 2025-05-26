Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1A3FC54FB3
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 12:05:41 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.27135.1748261140856437141
 for <docs@lists.yoctoproject.org>;
 Mon, 26 May 2025 05:05:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=fXzeiPFJ;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ylUQQJkbh9AXl1xFaWfqG6d0ea1SXOKTTfGjHninZJI=; b=fXzeiPFJyH8+TV6StNaHsIwfSt
	gIen8liizQB6MXZRVMXeIqufqyl9IcgMFhKFtt82p9v8IkyUILD1gf10f/vNdDygcKnHTKhzuQCzj
	txbTXlwuit9+2DFINtsbI23GE6A/Mc/BvqdR0FASCU9zij2pdB29NXnCUarV3gl4jB8JIbVThxDnr
	2rpWUl8Xlw+ON7TsHEUuZq9HNmG+85K4JLpY6t9Y37JAaZDdHMh+mwqx7eyru9Y8rGHnHI6CmWNxi
	l7QBhCe6PVssjPcg+b4oNVS9rSAvbZNf32FssU6jWOhz/ujTbYUb07lnvheVCa+IY1T6gvoS+BTcA
	rn+EYQQQ==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:60284 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uJWaI-00000009wdy-1JF2;
	Mon, 26 May 2025 08:05:39 -0400
Date: Mon, 26 May 2025 08:05:34 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@cherry.de>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs][PATCH v2] Clean up explanation of minimum required version
 numbers
In-Reply-To: <93b137bc-bbc6-418c-98eb-c7a4d9e9752f@cherry.de>
Message-ID: <da9cfc5b-b43d-d96b-384b-5a1191a14958@crashcourse.ca>
References: <77073870-67eb-b7ba-80c7-a88ed13a2ff2@crashcourse.ca> <93b137bc-bbc6-418c-98eb-c7a4d9e9752f@cherry.de>
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
 <docs@lists.yoctoproject.org>; Mon, 26 May 2025 12:05:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6927

On Mon, 26 May 2025, Quentin Schulz wrote:

> Hi Robert,
>
> On 5/26/25 11:43 AM, Robert P. J. Day via lists.yoctoproject.org wrote:
> > Some simple rendering and grammar fixes.
> >
> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> >
>
> Please keep the Reviewed-by, Acked-by, ... from earlier versions when sending
> a new one (except if drastic changes were made and you feel like it reasonably
> requires to have a new look at it).
>
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

  yeah, i realized that after i hit ENTER. apologies.

rday

