Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C37BCD98DA
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 11:01:34 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.127035.1781521281526410140
 for <docs@lists.yoctoproject.org>;
 Mon, 15 Jun 2026 04:01:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=o4kPae9N;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YWek7M6YoJLqxx1VRPOmRue9L/PJeWLMz9XT1H1BQHo=; b=o4kPae9NG1bZa+TnKK+YuTOx1y
	Kswd7YId2XAaqpK5ffHPizCpwiKHA5fSisVj53IG2rJtMyewHaYCOQ13szTqTrCxfZ0Y2AXKsmx16
	v+Z5bH/aGgfcHEYUta66/suuMOHrh/73a3BD6W+7XFKg1o2evbdVlBEAebVRuw4UA9rib2VAeCykk
	W1Zz3KgKSX9CAG2F1All134zr/k/YHnxQvS8oaSQwDCKG7X/keKxSc6DS3t5vjAHSSsMx+5OzrtT+
	mmSEYCnpvq6daQJk4G55Qu4BpYMIEPwIYCH2ukIV658uYEA24fUzGZVK9id1QKAuDBuALp/Ow4Vx5
	Xc66Q9pw==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:37672 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wZ549-000000048Ke-3l3V
	for docs@lists.yoctoproject.org;
	Mon, 15 Jun 2026 07:01:20 -0400
Date: Mon, 15 Jun 2026 07:01:05 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] kernel-dev: remove references to defunct LTSI project
Message-ID: <df04bcaa-3360-c4d3-6305-8a5650d4209e@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Mon, 15 Jun 2026 11:01:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9723


As the last kernel release under LTSI (Long-Term Support Initiative)
was back in 2018, remove references to it.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  i'll submit a patch separately to uprev the kernel release numbers
in that section.

diff --git a/documentation/kernel-dev/concepts-appx.rst b/documentation/kernel-dev/concepts-appx.rst
index 6a2fe4bb0..34b5628b5 100644
--- a/documentation/kernel-dev/concepts-appx.rst
+++ b/documentation/kernel-dev/concepts-appx.rst
@@ -76,22 +76,6 @@ and included with Yocto Project releases:
 -  *linux-yocto-dev:* A development kernel based on the latest
    upstream release candidate available.

-.. note::
-
-   Long Term Support Initiative (LTSI) for Yocto Linux kernels is as
-   follows:
-
-   -  For Yocto Project releases 1.7, 1.8, and 2.0, the LTSI kernel is
-      ``linux-yocto-3.14``.
-
-   -  For Yocto Project releases 2.1, 2.2, and 2.3, the LTSI kernel is
-      ``linux-yocto-4.1``.
-
-   -  For Yocto Project release 2.4, the LTSI kernel is
-      ``linux-yocto-4.9``
-
-   -  ``linux-yocto-4.4`` is an LTS kernel.
-
 Once a Yocto Linux kernel is officially released, the Yocto Project team
 goes into their next development cycle, or upward revision (uprev)
 cycle, while still continuing maintenance on the released kernel. It is
diff --git a/documentation/kernel-dev/intro.rst b/documentation/kernel-dev/intro.rst
index 7df342f8d..1324ffdbb 100644
--- a/documentation/kernel-dev/intro.rst
+++ b/documentation/kernel-dev/intro.rst
@@ -23,11 +23,7 @@ whose Git repositories you can view in the Yocto
 heading. New recipes for the release track the latest Linux kernel
 upstream developments from https://www.kernel.org and introduce
 newly-supported platforms. Previous recipes in the release are refreshed
-and supported for at least one additional Yocto Project release. As they
-align, these previous releases are updated to include the latest from
-the Long Term Support Initiative (LTSI) project. You can learn more
-about Yocto Linux kernels and LTSI in the
-":ref:`kernel-dev/concepts-appx:yocto project kernel development and maintenance`" section.
+and supported for at least one additional Yocto Project release.

 Also included is a Yocto Linux kernel development recipe
 (``linux-yocto-dev.bb``) should you want to work with the very latest in

