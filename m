Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3489CD98E1
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 13:59:58 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.154928.1781618390776701421
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Jun 2026 06:59:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=I0bFuyjf;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9VfRGVAR12GWQdBE1EPMfB6QxPKF7dLrr3nFOfJnoAg=; b=I0bFuyjf5p3tkMOYvvYNKwweb8
	eReA13kdIm9yPszhnBNlyHvllU2pZJik94Y37QTW2loMPyfJTxkqRPpLhgymxBK8jTvN8THwXsH/Z
	nZ08O2s49QZeCO35xS4xpHxUXQl+Q0+2ROW+Oj//99u+2lf813EkU6uv7TheNcWYBpMQk//16t85T
	mexDNlyoI5ZpQ4Ve4lm/CHUxNIOovH+Y1+cU9ytsL69kYZ/w8N02J6jjHcgYtxnlT6AeM+DbdVV35
	gxwEnye4a0cPCMwPzWmVgJ32Jzf7LaLFutdrn+3H4azxuhGQis72gL0UbeT0OcU+asClfXjHfxluO
	EddJ8pzg==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:40236 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wZUKP-000000076Ov-1cfR
	for docs@lists.yoctoproject.org;
	Tue, 16 Jun 2026 09:59:48 -0400
Date: Tue, 16 Jun 2026 09:59:39 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH v2] dev-manual: update AUTOREV explanation to match current
 file
Message-ID: <261bea68-6fde-563c-f56c-bb4daefacfdf@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 16 Jun 2026 13:59:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9745


The code snippet for listing AUTOREV-enabled recipes needs updating
since it now inherits the "poky-bleeding" class file.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/external-scm.rst b/documentation/dev-manual/external-scm.rst
index 3ca9079b3..e7ab8a4c6 100644
--- a/documentation/dev-manual/external-scm.rst
+++ b/documentation/dev-manual/external-scm.rst
@@ -38,28 +38,29 @@ configuration file contains the line::

    require conf/distro/include/poky-floating-revisions.inc

-This line pulls in the
-listed include file that contains numerous lines of exactly that form::
-
-   #SRCREV:pn-opkg-native ?= "${AUTOREV}"
-   #SRCREV:pn-opkg-sdk ?= "${AUTOREV}"
-   #SRCREV:pn-opkg ?= "${AUTOREV}"
-   #SRCREV:pn-opkg-utils-native ?= "${AUTOREV}"
-   #SRCREV:pn-opkg-utils ?= "${AUTOREV}"
-   SRCREV:pn-gconf-dbus ?= "${AUTOREV}"
-   SRCREV:pn-matchbox-common ?= "${AUTOREV}"
-   SRCREV:pn-matchbox-config-gtk ?= "${AUTOREV}"
-   SRCREV:pn-matchbox-desktop ?= "${AUTOREV}"
-   SRCREV:pn-matchbox-keyboard ?= "${AUTOREV}"
-   SRCREV:pn-matchbox-panel-2 ?= "${AUTOREV}"
-   SRCREV:pn-matchbox-themes-extra ?= "${AUTOREV}"
-   SRCREV:pn-matchbox-terminal ?= "${AUTOREV}"
-   SRCREV:pn-matchbox-wm ?= "${AUTOREV}"
-   SRCREV:pn-settings-daemon ?= "${AUTOREV}"
-   SRCREV:pn-screenshot ?= "${AUTOREV}"
-   . . .
-
-These lines allow you to
+This line pulls in the listed include file that defines the set of
+AUTOREV-enabled recipes::
+
+   INHERIT += "poky-bleeding"
+
+   POKY_AUTOREV_RECIPES = "\
+       libmatchbox \
+       opkg-utils \
+       matchbox-config-gtk \
+       matchbox-desktop \
+       matchbox-keyboard \
+       matchbox-panel-2 \
+       matchbox-terminal \
+       matchbox-theme-sato \
+       matchbox-wm \
+       pseudo \
+       puzzles \
+       sato-icon-theme \
+       sato-screenshot \
+       settings-daemon \
+   "
+
+This allows you to
 experiment with building a distribution that tracks the latest
 development source for numerous packages.


