Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23579CDB47F
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 08:21:33 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2219.1782289285940932381
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Jun 2026 01:21:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=euDWST9C;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=80e3IjTRt/KHNWanMMgSPcA+DI3/rlOor5n7hMClBYo=; b=euDWST9CuCWikuehvID5GbII8G
	19Q+QYQm0A9zXKXTG38/aFPmi9f2+TRYBxNCuxPeT2ndrgN5IXUmDx8qUC+o/42rrp8KEc3JGec8L
	Q8ZKaxC8XCF61gcLE3Fw7xCGAttQXKcpKUhBrNL3JqNdE/ENOG0U1suUakF/60zK13EfidQT+2mAn
	KpDODOhbZYZ2DuvwxCYlWvzN76g2wsxqdyeQtiERakjXhvdHM0bvQ92TQUht8GgINP68xthU6FyBY
	pZ1w1oPVir16TndPSCrlojUCnipncpuQOcRCdmzxxCUGvosAwdHb313GixeIYrxxYMZhHH4YzJJzB
	xpotXy/g==;
Received: from bras-base-otwaon0916w-grc-51-67-71-147-190.dsl.bell.ca ([67.71.147.190]:50538 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wcIrI-0000000F3iz-2Yz5
	for docs@lists.yoctoproject.org;
	Wed, 24 Jun 2026 04:21:24 -0400
Date: Wed, 24 Jun 2026 04:21:16 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: why not rename "Maintaining Build Output Quality" to
 "buildhistory"?
Message-ID: <4871863c-1d5d-1ff9-2918-a2d9c6e19041@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Wed, 24 Jun 2026 08:21:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9850


while this section is titled "Maintaining Build Output Quality":

  https://docs.yoctoproject.org/dev-manual/build-quality.html

it's really solely about how to use "buildhistory", so why not just
call it something like "How to use YP buildhistory"? the title seems a
bit misleading and even a little inaccurate.

rday

