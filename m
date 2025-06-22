Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1420AC7115C
	for <webhook@archiver.kernel.org>; Sun, 22 Jun 2025 08:42:50 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.22999.1750581765742090921
 for <docs@lists.yoctoproject.org>;
 Sun, 22 Jun 2025 01:42:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=zUDp5BbX;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4xTjuZcv3AaYx5ZghKbWoa0MSu7MdziQ8DxcMmJ4/io=; b=zUDp5BbXGQQIRH4eY7iCurC6d6
	gxZkU7U3WMuG4Y6hRwL86j2M5ZIBOHv0OOq8x9VNnxc4sC/SIcE+Vxk/ZY8dSTcG9bWqBRPsZ9fps
	7b49djQsESW9kfW3QLBrI0KOaoQB0KS56JuJuVHF3FC7u6tYpKXZMpTi6CG4EkiG9ScuCARGjSjxL
	4VXfS3d1v9BJzt9D4hIOq/vwNBVVjJQUY10FcDGWqvsVPin1uPx1y8IMkFhB0uTX3LvLI3flzxUtY
	UIpchVPF57t3PVqhqK1GKIAmAVV/bK+HiFwnSvBfrkKMb8Je6dXTJ13LqH++M/ulqdh0aZlac+mIw
	yq9yZZ/A==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:54408 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uTGHa-00000006odD-22By
	for docs@lists.yoctoproject.org;
	Sun, 22 Jun 2025 04:42:43 -0400
Date: Sun, 22 Jun 2025 04:42:29 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: improper rendering of ":term:" in bold
Message-ID: <8a705bb7-e1d2-a784-0018-a3106d02bbf8@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Sun, 22 Jun 2025 08:42:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7132


if you check here:

https://docs.yoctoproject.org/dev-manual/building.html#building-images-for-more-than-one-machine

note the improper processing of :term: in that first bullet point,
which is rendered verbatim as:

  Share the :term:`Build Directory`:

i'm guessing there is some weird conflict between bold and :term:, or
something.

rday

