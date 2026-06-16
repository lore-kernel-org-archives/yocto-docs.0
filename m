Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9746DCD98E1
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 16:47:06 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2292.1781628421874167429
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Jun 2026 09:47:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=KQlQXeVP;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=D5ALE46hdNu+19PuLCmVIXj/hq5JLUQ70u89zIvT0RE=; b=KQlQXeVPrMc97r2/tO9w7g3mjG
	ZortdVLAb6ClwmGWXV2M6j9wNlaXpHPjypFU2zq5jFJuJ34DDktlBe6Ey5ocxeuJOKWzKE17IdsHI
	0P8mQlI0LepQvFvL93TGPsaSj95mrMlj7RdfTl5p2vAEfjePCB8wNKMBOO7DYc24yZ/0FSDPgeUGn
	abwPySUvxIZKM4iWa5WjKSfJIidsqe1Al5/dFnHp1OdkIG1oADTxATEUth/wvp/4xOeAOuU6J3aZm
	tQodpyyhAwIZXBSV7hF3igGNPfYE8qsGJrRnqwxoQTDGOWyFg8pbekRQ1HCmKdltuoKUB5RvOWBcj
	tCqxXf7g==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:49326 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wZWwE-00000007PsZ-2Fa8
	for docs@lists.yoctoproject.org;
	Tue, 16 Jun 2026 12:46:59 -0400
Date: Tue, 16 Jun 2026 12:46:51 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] ref-manual: clarify use of "PACKAGE_ARCH" in a
 packagegroup
Message-ID: <70a7a488-e6f7-3997-230c-ce8deb26308c@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 16 Jun 2026 16:47:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9760


Warn the developer that if they need to set "PACKAGE_ARCH" in a
custom packagegroup file, that setting must precede the "inherit
packagegroup" line in the packagegroup recipe file.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 95e07f85a..839a89d4b 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -2130,6 +2130,18 @@ section in the Yocto Project Development Tasks Manual.

 Previously, this class was called the ``task`` class.

+.. note::
+
+   If you're defining a packagegroup and need to set::
+
+      PACKAGE_ARCH = ${MACHINE_ARCH}
+
+   for the packagegroup, you need to do that *before* the
+   ``inherit packagegroup`` line in the recipe file.
+   Setting it afterward can break BitBake parsing, result in
+   an "allarch" architecture mismatch error, or allow
+   architecture-independent defaults to override your intent.
+
 .. _ref-classes-patch:

 ``patch``

