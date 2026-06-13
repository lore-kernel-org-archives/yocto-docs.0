Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 274F3CD98C5
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 19:24:45 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.96655.1781378681543683704
 for <docs@lists.yoctoproject.org>;
 Sat, 13 Jun 2026 12:24:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=pXxigg/E;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=C3QNb19E2ImOY1V3lZucuW209ka1OudE7U2sPiTJEdY=; b=pXxigg/E06mPo6KuyhKFZ4qlth
	ypLa9gdu2t9Z4cwFacOYll3BkcCEt70pL10d0HTGiSROALCmhCDCovgP0U4AjAe/25uEhAjogqcdc
	kp9HelEcxqNANDwuxIIRpjBxTk79J+IUDIQvuZYEmIsr9/ZcDmx5a4OQOliCzQS339UMAFOasWH4K
	bsKvUto7qwD7sVkyJedtkLjGmuAxPd0LrxVRoiHc1v0x9CkAaEbsl1Iatepg/tGU0z2kwxyasCiTT
	huwRT4jmnc3BNBOJZFsQDs9N5UgW4+Nz/dTLnunaicCHeBm4N/tVPTEhKRaCyk/WborwIQK7Xy0+D
	g6k7RsTQ==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:39950 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wYTyA-000000002sz-0qEi
	for docs@lists.yoctoproject.org;
	Sat, 13 Jun 2026 15:24:39 -0400
Date: Sat, 13 Jun 2026 15:24:32 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] security-manual: some grammar and wording fixes in intro
Message-ID: <6f15263e-56f3-fe32-ea3c-c81d89f34d05@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Sat, 13 Jun 2026 19:24:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9712


Tweaks:

  - grammar
  - punctuation
  - delete word "necessary" as that is too strong a word and implies
    that what is being discussed is mandatory when it isn't

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/security-manual/intro.rst b/documentation/security-manual/intro.rst
index 03a8ed1ca..5ea6f5110 100644
--- a/documentation/security-manual/intro.rst
+++ b/documentation/security-manual/intro.rst
@@ -5,24 +5,24 @@ Introduction
 ************

 Welcome to the Yocto Project Security Manual. This manual provides relevant
-procedures necessary for dealing with security-related tasks supported in the
+procedures for dealing with security-related tasks supported in the
 Yocto Project environment. This manual groups related procedures into
 higher-level sections. Procedures can consist of high-level steps or low-level
 steps depending on the topic.

 This manual provides the following:

--  Procedures that help you securing an image with features supported by the
-   Yocto Project; for example making a root filesystem read-only.
+-  Procedures that help you secure an image using features supported by the
+   Yocto Project; for example, making a root filesystem read-only.

--  Procedures related to processes outside of the target images; for example how
+-  Procedures related to processes outside of the target images; for example, how
    to deal with vulnerabilities.

 This manual does not provide the following:

--  Procedures on security features implemented outside of
+-  Procedures for security features implemented outside of
    :term:`OpenEmbedded-Core (OE-Core)`.

--  Documentation on the security mechanisms themselves, which can often be found
+-  Documentation for the security mechanisms themselves, which can often be found
    in the documentation of the feature itself. This manual focuses on how to
-   integrate the security mechanism within the Yocto Project.
+   integrate those security mechanisms within the Yocto Project.


