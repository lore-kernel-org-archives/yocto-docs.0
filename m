Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C28ACDB46E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 06:38:30 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.5566.1697092699433606212
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Oct 2023 23:38:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=H79+3O3q;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1dXIU08Kiy0cZg3jRRxGWKCW4+9lK2JfTcaO4qR7TaI=; b=H79+3O3q+bXpLo4M84LKXynfGN
	BdDv0C4Ic0RRUFNWXIFy/VfRnFXLkkwY4ac4QB2NwTi8jE0FLqaMdDJy+7KBg65RnVYvn+yH5ONiH
	a3lq2jgxybOLFEqpIme6YgVp1Jacgp9c5yPyHZsCord7EmXllckbmb3v3SCtzhYxG6lsUkanrO74Y
	mPPwGTWP4Mq9Wo6GxymRTPza8E9gfeNpvzR1NodtwUD3JosPKTKlujtGQ3PtTdHnVWQHJlA6Px5zZ
	ZF1mTZHJmh/EHH6z9pyOoTEDdO8VGgejkrg55O3z5PGsOD/heBLlqaEfoeynlnfO/TSTZxTl5iIAZ
	EPFrOabg==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:53458 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1qqpKp-008cK0-2A
	for docs@lists.yoctoproject.org;
	Thu, 12 Oct 2023 02:38:18 -0400
Date: Thu, 12 Oct 2023 02:38:08 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: BSP Guide: intel-quark not in meta-intel anymore, intel-skylake-64
 is
Message-ID: <e5a575c3-b75c-1289-6380-c5f73c8a154c@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Thu, 12 Oct 2023 06:38:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4357


  here:

https://docs.yoctoproject.org/bsp-guide/bsp.html#developing-a-board-support-package-bsp

the Note refers to (among other core intel BSPs) intel-quark. what is
actually in that layer these days is intel-skylake-64, not sure what
sort of rewriting that would involve.

rday

