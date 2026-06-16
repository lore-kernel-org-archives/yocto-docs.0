Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DABACCD98E4
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 14:29:18 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.155823.1781620154875037173
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Jun 2026 07:29:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=HyOWl1kE;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=cl3m6ipqeTkX1vwkXSWLSsZidXMQwYUkUWH940Qt6Ug=; b=HyOWl1kEmh5V3MrTXoOWfNcJBx
	uHCq+BQsYSfgsTS6wgf4oi3Th9kMVkyKnHOb43HTUoAQD7z3zqIApS4y8HPNKGMAYVTTwo+0SXrNy
	hf5i/2r3AW/AWyulfdgugeRBt2f71RiS46T9QWuven/aZnOhxjHpVwu6g0/jxiABan6Z/c6RAFytq
	mFDE92iLeeLfrRhHSAEVEebm8H6TxOfNMfJqBWSuN/jpDSh/7EqmsqUwzxLgS+vuztA7imjO5AsZE
	b0crl0saHxJpG7IeIfth8uhNAkPDNA39TSMUz8TPsUmG6Yy4xZNdVUmyHplAzbpy+DP/Ee50veMLI
	LiJ2H2Aw==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:49874 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wZUmu-000000079tL-0sTy
	for docs@lists.yoctoproject.org;
	Tue, 16 Jun 2026 10:29:12 -0400
Date: Tue, 16 Jun 2026 10:29:08 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual: SysVinit is the default init manager for Poky
Message-ID: <2b679560-e819-76cd-5e54-9213b03169c2@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 16 Jun 2026 14:29:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9747


Correct the opening sentence of the Init Manager section to clarify
that SysVinit is the default init manager if one is using the Poky
distro.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/init-manager.rst b/documentation/dev-manual/init-manager.rst
index 670810310..c9d344a88 100644
--- a/documentation/dev-manual/init-manager.rst
+++ b/documentation/dev-manual/init-manager.rst
@@ -5,7 +5,7 @@
 Selecting an Initialization Manager
 ***********************************

-By default, the Yocto Project uses :wikipedia:`SysVinit <Init#SysV-style>` as
+By default, the :term:`Poky` distro uses :wikipedia:`SysVinit <Init#SysV-style>` as
 the initialization manager. There is also support for BusyBox init, a simpler
 implementation, as well as support for :wikipedia:`systemd <Systemd>`, which
 is a full replacement for init with parallel starting of services, reduced

