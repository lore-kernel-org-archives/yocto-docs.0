Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11CC5CDB46F
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 17:44:39 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2853.1782150275791047657
 for <docs@lists.yoctoproject.org>;
 Mon, 22 Jun 2026 10:44:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=pNpFUYhU;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=eZ9oJCHf3AIQWYUq+1Zd7TIrBkCAuPrxUCPw55ZCl2I=; b=pNpFUYhUJ5QqhF6amrkbYGLQLw
	JkbypuaOutn+TEWvG6z1dTDV2M19Ii3DUCpQQGaLlebWzXGgAGp6ufrYkrYE4Z/pjNDJAfhDqJ64o
	SFIAHQHUVsHZ9A1Nx05mt9fs5NHPJ2APaurSj6mrLgf9VpuUj48hfJaZDp1j7vKoJ/kN9fF1CiY/8
	T+mWJloGekrL0bgnA/AvgLorlHhYTZ0rJ5Cune3s4m+TQI5AeQz/PlC/WmzYvY7jtqMKsCY8cf3Sd
	/xrED//MVYTHp0c77UtIpjUkF2SqRnr7UZt65Pn4ETcM/dMryoy8AGjb8ZV6l/VEYZMRiEfrBmmAV
	iI9lhs2Q==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:42124 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wbihE-0000000Awqz-2x9q
	for docs@lists.yoctoproject.org;
	Mon, 22 Jun 2026 13:44:34 -0400
Date: Mon, 22 Jun 2026 13:44:25 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] ref-manual: add missing section on build/tmp/deploy/spdx
Message-ID: <3c5da9d7-fc80-7a9a-eaa1-4fb9eed25a6d@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Mon, 22 Jun 2026 17:44:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9831


There is no subsection on build/tmp/deploy/spdx; add it.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
index ff84b250b..e22de6047 100644
--- a/documentation/ref-manual/structure.rst
+++ b/documentation/ref-manual/structure.rst
@@ -539,6 +539,15 @@ licensing, see the
 ":ref:`dev-manual/licenses:maintaining open source license compliance during your product's lifecycle`"
 section in the Yocto Project Development Tasks Manual.

+.. _structure-build-tmp-deploy-spdx:
+
+``build/tmp/deploy/spdx/``
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+This directory contains a Software Bill of Materials (SBOM) in SPDX format,
+as explained in detail in the ":ref:`dev-manual/sbom:creating a software bill of materials`"
+section of the Yocto Project Development Tasks Manual.
+
 .. _structure-build-tmp-deploy-images:

 ``build/tmp/deploy/images/``

