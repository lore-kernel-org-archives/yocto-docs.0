Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE429CD4F2C
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 08:10:01 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.65672.1781251798520295675
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Jun 2026 01:09:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=bnhz01hD;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=d8jKWqaEYFIx4/3uWwv+4Hx0oxxWavpMpbb8MpoX0Lc=; b=bnhz01hDuDEIL9InySx1k2moWx
	VJ6vL5V5KVJJiammnE4ivSv35issTl9XBq9wxEzQXlcKa7MpOtdYM49o4pKhDbaSe2x9Akjw0CZID
	KYPl5gSBmd+2UjL6ge4mC2sQlwsIc9nOEEcdjnADHKo/KjHh5LexwzxsKAhJFfRO8YSm8i/CVuov1
	l/CN+jd5bsR6KvZYl2TCXO59DGIElG7/S+BNF54P0HT9tshnm15bbjKWZA0vrb/kwYb9oeAXXeLyr
	D0444aVv1Y4wMLRfYnYy1Ky7ZVg1B8q57OISYnskRBBuqm6YFskq+K95nSVl899TR4H+DGT+2gQb7
	wYv5FVDA==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:45982 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wXwxc-0000000DmY0-31kO
	for docs@lists.yoctoproject.org;
	Fri, 12 Jun 2026 04:09:57 -0400
Date: Fri, 12 Jun 2026 04:09:50 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual: update AUTOREV explanation to match current
 file
Message-ID: <6fcb9b9c-e179-6c09-e233-56919a855701@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Fri, 12 Jun 2026 08:10:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9702


The code snippet for listing AUTOREV-enabled recipes needs updating
since it now inherits the "poky-bleeding" class file.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/external-scm.rst b/documentation/dev-manual/external-scm.rst
index 3ca9079b3..7971d65f5 100644
--- a/documentation/dev-manual/external-scm.rst
+++ b/documentation/dev-manual/external-scm.rst
@@ -38,26 +38,27 @@ configuration file contains the line::

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

 These lines allow you to
 experiment with building a distribution that tracks the latest

