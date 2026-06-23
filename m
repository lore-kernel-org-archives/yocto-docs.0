Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BC5ACDB470
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 17:44:02 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27371.1782236636822436707
 for <docs@lists.yoctoproject.org>;
 Tue, 23 Jun 2026 10:43:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=Oxxc53uQ;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yHBcvHQsOC+Ol0G8up2xIVBQ23GWXGdL5WhahN4Og5c=; b=Oxxc53uQKqNcO95vH4XhU78e6j
	sTXAHlP9Rvj8/WjmK8fKp/crI5IpvdJHXW7gYxX7/l4jmSwMwPji4V6YNK33Jh4h61jjipZ4K4dQy
	x627/aBtW6kVX/xGhOarOex+EIxFeL3odz7F9bUEwZ3X5BICvYtTtK6qJ54XeluoZYlhn8APCqQnV
	OcDlTyr6DDYuXFjQXKzAlQn5KwCmJclK8z7gp0g1ptVQyOWcfAMKo8mAqmwSkfLoTUJAfCIcCd7ly
	vMpg/GYz2/dZf8r8F2YqSy99TqSUHmiA7FvduFFr/3mFefbVJu3DOZajwYZh5jQdrCc2mxBzehKzX
	+tnXOCbA==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:59404 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wc5A9-0000000DXTR-2XzM
	for docs@lists.yoctoproject.org;
	Tue, 23 Jun 2026 13:43:55 -0400
Date: Tue, 23 Jun 2026 13:43:49 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] ref_manual: add "fragments" and "templates" directories to
 structure
Message-ID: <21c2164f-ac8d-256d-f8ef-c15336fbba3e@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 23 Jun 2026 17:44:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9843


Add two new entries for the meta/conf/{fragments,templates}
directories to the structure of OE-Core metadata.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  I didn't bother with the "multiconfig" directory since all it
contained was an empty default.conf file. So let's just go with these.

diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
index ff84b250b..96f9c9f34 100644
--- a/documentation/ref-manual/structure.rst
+++ b/documentation/ref-manual/structure.rst
@@ -862,6 +862,25 @@ it is possible to extend that support to other SDK hosts by adding
 additional configuration files in this subdirectory within another
 layer.

+.. _structure-meta-conf-fragments:
+
+``meta/conf/fragments/``
+~~~~~~~~~~~~~~~~~~~~~~~~
+
+This directory contains a number of
+:term:`configuration fragments <Configuration Fragment>` ---
+top-level build configuration features that can be independently enabled
+and disabled using standard tooling.
+
+.. _structure-meta-conf-templates:
+
+``meta/conf/templates/``
+~~~~~~~~~~~~~~~~~~~~~~~~
+
+This directory contains default templates to be used as initial files
+such as ``local.conf``, ``bblayers.conf`` and other files when
+initializing a new Yocto Project build.
+
 .. _structure-meta-files:

 ``meta/files/``

