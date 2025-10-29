Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CCF7CCF9EE
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 18:19:00 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.11617.1761761933583673880
 for <docs@lists.yoctoproject.org>;
 Wed, 29 Oct 2025 11:18:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=bfF7hlRA;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ij83u72aLoYCfq8H7MQhW6ubgxlAiCUH97LXyJIhQmQ=; b=bfF7hlRAqrPiyD8mgRexGvTYR7
	vmYk3kBaf8JOh7KhrlaoLEOdNQNWzqQK4U6FKPZ0iRhiXHukM4ESmkRrrzpmCr4td9BU1Dq7KSWhz
	3XT2C1Mtf9d+yT5pgC3Ko046O0ZFOJ+WDcCPEWlI++MRTdYrOimIA1jZObmQuwx73UCRL+IAQ6Gwb
	5sioMaY5/stLtWGkDbstk9rbKu5w9f9AdWfhY2TUlvlqKHo7GJO0q8Uol5LL1vM1Uv5q9i2/zKer2
	pLuQIhO9xUNb06JyfstnSTBPH0XG+U6JtvcoaU1WYmKnsSEvvTV9kGqrO9pueOmhwkX9TzifaXjce
	/bjKpUoA==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:59260 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vEAkz-0000000H1D4-0fSL;
	Wed, 29 Oct 2025 14:18:51 -0400
Date: Wed, 29 Oct 2025 14:21:42 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <foss+yocto@0leil.net>
cc: docs@lists.yoctoproject.org, Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH 3/3] dev-manual: debugging: use bitbake-getvar in Viewing
 Variable Values section
In-Reply-To: <20251029-bitbake-e-v1-3-c06ad212db9e@cherry.de>
Message-ID: <dfa4d689-75f1-9e20-ec84-e9a5a72ba00a@crashcourse.ca>
References: <20251029-bitbake-e-v1-0-c06ad212db9e@cherry.de> <20251029-bitbake-e-v1-3-c06ad212db9e@cherry.de>
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
 <docs@lists.yoctoproject.org>; Wed, 29 Oct 2025 18:19:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7907

On Wed, 29 Oct 2025, Quentin Schulz wrote:

> From: Quentin Schulz <quentin.schulz@cherry.de>
>
> We should recommend using bitbake-getvar command wherever possible as
> its output is much less confusing and overwhelming than bitbake -e.
>
> Unfortunately, bitbake-getvar currently doesn't list Python tasks or
> functions, unlike bitbake -e, so keep the latter for some corner cases.
>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>

... snip ...

  thanks for handling all that.

rday

