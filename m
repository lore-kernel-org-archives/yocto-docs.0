Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5109FCD98C7
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 19:54:07 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29588.1781121235944014831
 for <docs@lists.yoctoproject.org>;
 Wed, 10 Jun 2026 12:53:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=RxJazukI;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=QXrDA8FA0h76u8X7jIoYXVCnocQq+LHQxXGKnCAevOQ=; b=RxJazukI5Sm/eSdtpMoJDPEwZH
	bgkQfRhErLqAaZMzbAgMTbg/s30hKR++oXA2Bk55OUb+61FZBezMQoDTZ67BARj8iePt/jpGBGtm2
	2oAvQdKg0fXVJOW1AYeui74UcK9uv1XRKIh0zWeRHA74FhGuHRXv/BA88V7AqroQdNmBMP66UGlRI
	E4JBpb+/kKWrYcw55vyCB6gLivUYpX9kgcCJwGXE8NpgwhBMz/xWOv+CnvLPRLdaFJp27XSUFK3nF
	YFg56rPqRO+iFBZdVvGHj8DwJAI4/NfzYs7VzMNwgUL7C9eQdxpivR2pNctKK7mAO9kaqZ2zmh1rH
	sC71sjiQ==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:51088 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wXOzp-00000009hWx-2SHp
	for docs@lists.yoctoproject.org;
	Wed, 10 Jun 2026 15:53:54 -0400
Date: Wed, 10 Jun 2026 15:53:48 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual: clarify use of "PACKAGE_ARCH" in a
 packagegroup
Message-ID: <967c7da4-403e-0417-78ac-e416c44af1ef@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Wed, 10 Jun 2026 19:54:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9687


Warn the developer that if they want to set "PACKAGE_ARCH" in a
packagegroup file, that setting must precede the "inherit
packagegroup" line in the packagegroup recipe file.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/building.rst b/documentation/dev-manual/building.rst
index 9983c7939..d4f1544bb 100644
--- a/documentation/dev-manual/building.rst
+++ b/documentation/dev-manual/building.rst
@@ -615,6 +615,18 @@ your tunings to best consider build times and package feed maintenance.

       PACKAGE_ARCH = "${TUNE_PKGARCH}"

+   .. note::
+
+      If you're defining a packagegroup and you want to set::
+
+         PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+      for the packagegroup, you need to do that *before* the
+      ``inherit packagegroup`` line in the recipe file.
+      Setting it afterward can break BitBake parsing, result in
+      an "allarch" architecture mismatch error, or allow
+      architecture-independent defaults to override your intent.
+
 -  *Choose a Generic Tuning File if Possible:* Some tunes are more
    generic and can run on multiple targets (e.g. an ``armv5`` set of
    packages could run on ``armv6`` and ``armv7`` processors in most

