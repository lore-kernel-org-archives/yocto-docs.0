Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B33CCD5BB3
	for <webhook@archiver.kernel.org>; Fri, 22 May 2026 16:18:22 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20357.1779466697538169395
 for <docs@lists.yoctoproject.org>;
 Fri, 22 May 2026 09:18:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=xrBgnPtW;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yfZ7XqnTtgGnFOZU28aWcs7KeouZpTnxWLd7spOFgWU=; b=xrBgnPtWz732ZbLfFfTLKk2Nyp
	bb/BVuWd7oll8CtapVBdFp1I5ZATqX042HAkSQqDViD04MPd0rlRay0R9zZwRo1wVjNMmArC1wYnx
	iGLnrqHElNZxfvIcokOzqG/2+Lus2bGueXRyISImeXYUrJ+ZyqQih5U9XmThLT3VDx0RJxK9PhuAy
	R491yNEwt7MyOLKbSk82XZyn2anD6q+X8YhoEfgTDSWd+ug5FDhMW4NkF21GpK4pUQb5A2N5zwuhu
	lWJRTby9EWiJTD83I0j6C/gHDxSuxMDHk5KZUx44X+9FrQs5QbN6u3EYgwDA9uNVJ1PDBMAAbhiQs
	rOhs2wlA==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:43990 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wQSZi-00000005o4m-2yQI
	for docs@lists.yoctoproject.org;
	Fri, 22 May 2026 12:18:15 -0400
Date: Fri, 22 May 2026 12:21:45 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH v2] ref-manual: clarify that PACKAGE_EXCLUDE supports DEB
 packaging
Message-ID: <3faa7374-9428-5882-2862-861454dd0b49@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Fri, 22 May 2026 16:18:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9528


As an accompaniment to earlier commit
0d05dedd62a6d4c726f120a23654ede1f0b23d8e, correct that the
PACKAGE_EXCLUDE variable supports the DEB packaging backend.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  sorry, forgot the word "variable"

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index c65794229..2773e9864 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6927,8 +6927,8 @@ system and gives an overview of their function and contents.
       an iterative development process to remove specific components from a
       system.

-      This variable is supported only when using the IPK and RPM
-      packaging backends. DEB is not supported.
+      This variable is supported by all of the RPM, DEB and IPK
+      packaging backends.

       See the :term:`NO_RECOMMENDATIONS` and the
       :term:`BAD_RECOMMENDATIONS` variables for

