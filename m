Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC2FACD98DA
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 10:14:13 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.126477.1781518450096677643
 for <docs@lists.yoctoproject.org>;
 Mon, 15 Jun 2026 03:14:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=qksC+moq;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CTMh8Z0WYA2wctDekt3GBbOxzkarEGfGQmR2hX2mYoQ=; b=qksC+moqtbFf/20EtgB+sR9wTr
	i9DhVM/75yJfle34PRtPuykPCvIbPMy8Kqrp9bfjvblAOYDY5RVmkCySFZvgdBob4TribBzqrmiz3
	GzZTIZmlW842Ve9PfE+fUau9fhMqYJOIlHmve5XD6L1iJQ0Y+2tPPr81aZpmOF49r3P+khwns/9cR
	cYQcb3tWBD6FuE65OLTYuwt0msF/FUm4YjS7Q5e46CXr4u0Sg9ko4lsx9fWH3HbYKvRud15wGlvJs
	UWOn+Lge+oZegnnCiCQiTnw8zxIuIexhqbzVWNP6U76Uzulb+8iorkTb3oBuoQ/hV9ZtkzrHpgB1x
	vh634d1w==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:48374 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wZ4KU-000000043I8-0qD8;
	Mon, 15 Jun 2026 06:14:08 -0400
Date: Mon, 15 Jun 2026 06:13:56 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Paul Barker <paul@pbarker.dev>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] kernel-dev: add anonymous hyperlinks for "LTSI"
 acronym
In-Reply-To: <69aa94d76c521ccab58336b5ca5b953253cbb6d2.camel@pbarker.dev>
Message-ID: <ac0c40fa-bfdf-40f6-9825-d9723a337524@crashcourse.ca>
References: <16a55764-9ceb-5638-53e0-59eff365a7fd@crashcourse.ca> <69aa94d76c521ccab58336b5ca5b953253cbb6d2.camel@pbarker.dev>
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
 <docs@lists.yoctoproject.org>; Mon, 15 Jun 2026 10:14:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9720

On Mon, 15 Jun 2026, Paul Barker wrote:

> On Mon, 2026-06-15 at 05:18 -0400, Robert P. J. Day wrote:
> > Link to Linux Foundation LTSI page from "LTSI" references.
>
> The last LTSI release was in 2018, it's ancient history at this point.
> Better to remove references to it from the docs.
>
> The closest current equivalent is the CIP Project [1].
>
> [1]: https://cip-project.org

  OK, i don't know enough about that to intelligently adjust the docs,
so i'll let someone else decide on any updating there.

rday

