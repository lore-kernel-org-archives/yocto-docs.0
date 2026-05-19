Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 331D1CD4851
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 12:20:05 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20112.1779193192189003904
 for <docs@lists.yoctoproject.org>;
 Tue, 19 May 2026 05:19:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=0w8un2K1;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=FeMuFEzpYEG78rwW2sYlmnu60OEzy3kftMDHBtrhVRw=; b=0w8un2K1ou9CfhSMahywqGM4p+
	9nrBSHhq43Ee5Zq+ya7wri4+h6XpUQKiRvVlOXT/RyFzrXqQgOQdLzruv5RRM3LEGLy0BpbjtDPqb
	8GnPFgem3/pCDqHl6g6mNvo7Kbsag726umTAZ1lSCsO/xyYL6/gM7AZgl++lff54g4b7w4WyBgwC1
	569JSgoDS4zYhKSA5rxni+sYi8z3amhgJyKmtqfQaETc3sImVillJDSXgFcMwgHq807MzX4ufgv+I
	lFZHL7FaOw9NLkf7FC6gaUhKZ2hFOn2/pzoilES2SGdutjoX4Ak6Lge6tZoumv3kYZxilYJ72I/1p
	kYX1Gg0A==;
Received: from [147.129.179.166] (port=44992 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wPJQI-00000008q2u-2KXu
	for docs@lists.yoctoproject.org;
	Tue, 19 May 2026 08:19:50 -0400
Date: Tue, 19 May 2026 08:23:09 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] contributor-guide: fix type "maintainance" to
 "maintenance"
Message-ID: <3b6ae4f4-b7c8-e196-ccf2-eba99097d5af@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 19 May 2026 12:20:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9485


Correct "maintainance" typo in recipe-style-guide.rst.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  sorry, forgot '[PATCH]' prefix in earlier submission. *sigh*.

diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/documentation/contributor-guide/recipe-style-guide.rst
index d0cb65295..79bf7c79b 100644
--- a/documentation/contributor-guide/recipe-style-guide.rst
+++ b/documentation/contributor-guide/recipe-style-guide.rst
@@ -315,7 +315,7 @@ following status strings:
    No determination has been made yet, or patch has not yet been submitted to
    upstream.

-   Keep in mind that every patch submitted upstream reduces the maintainance
+   Keep in mind that every patch submitted upstream reduces the maintenance
    burden in OpenEmbedded and Yocto Project in the long run, so this patch
    status should only be used in exceptional cases if there are genuine
    obstacles to submitting a patch upstream; the reason for that should be
@@ -346,7 +346,7 @@ following status strings:
    The patch is not appropriate for upstream, include a brief reason on the
    same line enclosed with ``[]``. In the past, there were several different
    reasons not to submit patches upstream, but we have to consider that every
-   non-upstreamed patch means a maintainance burden for recipe maintainers.
+   non-upstreamed patch means a maintenance burden for recipe maintainers.
    Currently, the only reasons to mark patches as inappropriate for upstream
    submission are:


