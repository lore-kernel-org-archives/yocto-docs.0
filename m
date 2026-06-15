Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA4C8CD98DA
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 09:18:43 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.125760.1781515114544805081
 for <docs@lists.yoctoproject.org>;
 Mon, 15 Jun 2026 02:18:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=WZW4yAP5;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=uq35wNhgS9Q3ZqYGjZ1yCCcutSKtJ48/y8QO4KxWZAc=; b=WZW4yAP52sH/oNyyMLy3r0j3TP
	rz55cTLetu/kQKCcb0HaR5YU25YdEsuzrFY7jmyXKXHEKxkOOvALk+IZCQYVpzLjETM2iN4bpGzVY
	aUXiqxjihmvZTOSqYnpWrbcob+9+ZBX9orHzhrYYRihxyoM81oQ/+8ONva3vCldbAcw3m50hOGSev
	gNeLFy6YkG9xzLqHnr/WYEB2stgIHKh5Ea4M0RGdijowUw+oTKs35MgUsY7hf+KEx8pP3AExejcg2
	Bgamp7RLrIJ/0P6Nz7v7MSOIa1TvivzSrox9IDP4FJfsv5pSjj/sHEINTBwy1EjW5oq8yraN6T6lL
	GSmB8QZQ==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:49858 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wZ3Sd-00000003xi4-3qkA
	for docs@lists.yoctoproject.org;
	Mon, 15 Jun 2026 05:18:32 -0400
Date: Mon, 15 Jun 2026 05:18:24 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] kernel-dev: add anonymous hyperlinks for "LTSI" acronym
Message-ID: <16a55764-9ceb-5638-53e0-59eff365a7fd@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Mon, 15 Jun 2026 09:18:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9718


Link to Linux Foundation LTSI page from "LTSI" references.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/kernel-dev/concepts-appx.rst b/documentation/kernel-dev/concepts-appx.rst
index 6a2fe4bb0..123d502fe 100644
--- a/documentation/kernel-dev/concepts-appx.rst
+++ b/documentation/kernel-dev/concepts-appx.rst
@@ -78,8 +78,8 @@ and included with Yocto Project releases:

 .. note::

-   Long Term Support Initiative (LTSI) for Yocto Linux kernels is as
-   follows:
+   `Long Term Support Initiative (LTSI) <https://ltsi.linuxfoundation.org/>`__
+   for Yocto Linux kernels is as follows:

    -  For Yocto Project releases 1.7, 1.8, and 2.0, the LTSI kernel is
       ``linux-yocto-3.14``.
diff --git a/documentation/kernel-dev/intro.rst b/documentation/kernel-dev/intro.rst
index 7df342f8d..593dc9335 100644
--- a/documentation/kernel-dev/intro.rst
+++ b/documentation/kernel-dev/intro.rst
@@ -25,7 +25,8 @@ upstream developments from https://www.kernel.org and introduce
 newly-supported platforms. Previous recipes in the release are refreshed
 and supported for at least one additional Yocto Project release. As they
 align, these previous releases are updated to include the latest from
-the Long Term Support Initiative (LTSI) project. You can learn more
+the `Long Term Support Initiative (LTSI) project
+<https://ltsi.linuxfoundation.org/>`__. You can learn more
 about Yocto Linux kernels and LTSI in the
 ":ref:`kernel-dev/concepts-appx:yocto project kernel development and maintenance`" section.


