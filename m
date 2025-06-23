Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC839C7115B
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 15:45:02 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.28.1750693492784879235
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Jun 2025 08:44:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=sqImgPXO;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KmcvEIwWepHqVEnOY9RgxMXZhzVeGdPr5eE+G2PZl10=; b=sqImgPXOvLtdrR4Q2YNQBA15ir
	/OeKcx1YxXlpAxvRz8Bt5m/i8kQfMAIecBg/x1CyyM/hhukAfr/YcPN8fZXwWmFOXP0bDdO9ZuBWG
	i7RgBNBgWMNezE/6WMvhsS86sfwC5Zn1/75hVhI9LtCwOh/rzAVEKME7u+5IhaA7eexyVa84NMm4J
	bYfVUmJh+gnv87fctqrunUWkvUF/PTgpE42OjukSTcT+qvmFUUSkQUSFqawcJbfCNFRaFXD77BT89
	T5Stjaj6pDjfTNU8KdFHS+eDmqXZftbmLUgLYV98VOdgIbGOpggXsj8rsoNQCaQgk1kTxowsEbWwx
	Id8Zc0fQ==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:35234 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uTjLi-0000000BTie-13Yc;
	Mon, 23 Jun 2025 11:44:50 -0400
Date: Mon, 23 Jun 2025 11:44:39 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@cherry.de>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] dev-manual, CH 5: grammar fixes and update
 recipes
In-Reply-To: <f096f57b-8889-4dac-8e9a-a15b04915344@cherry.de>
Message-ID: <fbd61902-4b3d-b4c4-4362-02ec4188ce15@crashcourse.ca>
References: <23ac0815-60ab-fef4-533b-920e61f5d38b@crashcourse.ca> <f096f57b-8889-4dac-8e9a-a15b04915344@cherry.de>
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
 <docs@lists.yoctoproject.org>; Mon, 23 Jun 2025 15:45:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7168

On Mon, 23 Jun 2025, Quentin Schulz wrote:

> Hi Robert,
>
> On 6/20/25 9:09 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> >
> > Major updates:
> >
> >    - update strace recipe version
> >    - replace git example with gnuplot, which actually has two
> >      SRC_URI values that need naming
>
> But is part of meta-openembedded. Can we use an example from oe-core maybe?
>
> Looks ok to me otherwise,
> Thanks!
> Quentin

  i think i'll break this into two independent patches, make it easier
to address the "name=" fixup.

rday

