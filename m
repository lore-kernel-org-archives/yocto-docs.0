Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E3A0CD6E4A
	for <webhook@archiver.kernel.org>; Thu,  4 Jun 2026 15:59:25 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15098.1780588756077173487
 for <docs@lists.yoctoproject.org>;
 Thu, 04 Jun 2026 08:59:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=q57577vV;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yy/rcL9wrq8EX72tqonedk24PrGz8nptbSuc+ql1ZVQ=; b=q57577vVR/+K8Cw+DhNG65n/my
	x7BJtj/YXMt+roeyX1/hQv7o/acpNHNI52ZgP933ctxtM4gFZdD/DzT14no8XUdvToltX9U+AScV9
	63yBVlBryC8VQP7nE5g1jVvocLo5vLy2i2h4A++40dsDLv+03+Ob6OTLABYRBK3iODux6RfCm/0Od
	vyg999gL6wAlZJ0HMLcGb3ApyMOKuG4Qmdtp8AYqfQCuyrElNE+dREtjlHP5MxvZlS7kbkeoTP35w
	RR5611aGH6koI3njFx55vsfKCx5tRnc5VbaRPmV2Ah6Knla7VBdaxLrgJgLKVj+9liq2i1+Z0ayX9
	MWxM1M2Q==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:32964 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wVATQ-0000000BYCu-1cSC
	for docs@lists.yoctoproject.org;
	Thu, 04 Jun 2026 11:59:14 -0400
Date: Thu, 4 Jun 2026 11:59:15 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] overview-manual: mention idea of dynamic layers
Message-ID: <6032efe1-86e9-a83f-6247-939b7d3a36b8@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Thu, 04 Jun 2026 15:59:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9582


Warn the reader that simply adding extra layer names to their
bblayers.conf file might have unintended consequences, and refer them
to the BBFILES_DYNAMIC variable for an explanation.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 76ace6fcf..a3893b52d 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -393,6 +393,13 @@ BitBake uses the ``conf/bblayers.conf`` file, which is part of the user
 configuration, to find what layers it should be using as part of the
 build.

+.. warning::
+
+   Even if your build doesn't need some of the layers listed in your
+   ``bblayers.conf`` file, the very inclusion of such layers might
+   affect your build based on the concept of *dynamic layers* as documented
+   by the :term:`BBFILES_DYNAMIC` variable.
+
 Distro Layer
 ~~~~~~~~~~~~


