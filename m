Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8048ECD98E1
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 13:17:18 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.154226.1781615836522101073
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Jun 2026 06:17:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=npz6F7wg;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rJn+HPOWLCJnaKvMTR8W60dwyumlJ8zjvjz6uZesCeA=; b=npz6F7wgxCApJztnwgAgW04voh
	hmOPKtROKXeZFnkdi/1Qy73Q/ULO6N4/lpIbjU9MMKtzuSlHQWFbmdpZZ7RRWmIbHiVU22mMKZ7Bi
	JDS5T9vK8y4n39vVn5LGtrC0Mw+RXqLITiC0o8jbRg4p3xY43gfDyWBO/ykKOWQnGZnQS71jd7AHG
	1SNLj/ZZ53bZiMaU05u/HZ2xiZxmdvD4oV7F54iB5Z7/tPu59daghlNAZ6nM9sdkDTVoYZbD6KY/w
	96Vo6YsHT4890+vzn15dcgc8p/U5MPx38l9VYjmYGs7tygvTUBwLF2aC617dDoxPhUteXCPbc83fn
	lBe94FpA==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:55582 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wZTfF-000000070th-2Jsm
	for docs@lists.yoctoproject.org;
	Tue, 16 Jun 2026 09:17:14 -0400
Date: Tue, 16 Jun 2026 09:17:10 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual: clarify use of "PACKAGE_ARCH" in a
 packagegroup
Message-ID: <eeebe32f-3a88-90e7-555f-96ada6016c5f@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 16 Jun 2026 13:17:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9738


Warn the developer that if they need to set "PACKAGE_ARCH" in a
custom packagegroup file, that setting must precede the "inherit
packagegroup" line in the packagegroup recipe file.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/customizing-images.rst b/documentation/dev-manual/customizing-images.rst
index 6eed9ef56..606252fe1 100644
--- a/documentation/dev-manual/customizing-images.rst
+++ b/documentation/dev-manual/customizing-images.rst
@@ -183,6 +183,18 @@ build an image using these package group packages, you need to add
 :term:`IMAGE_INSTALL`. For other forms of image dependencies see the other
 areas of this section.

+.. note::
+
+   If you're defining a packagegroup and need to set::
+
+      PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+   for the packagegroup, you need to do that *before* the
+   ``inherit packagegroup`` line in the recipe file.
+   Setting it afterward can break BitBake parsing, result in
+   an "allarch" architecture mismatch error, or allow
+   architecture-independent defaults to override your intent.
+
 Customizing an Image Hostname
 =============================


