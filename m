Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C8E3C43458
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 17:57:29 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40794.1782496646249625778
 for <docs@lists.yoctoproject.org>;
 Fri, 26 Jun 2026 10:57:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=S5zFa1lu;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Eo7HwimqA2jA9sJCnh74pXwCtjA5Vln+WJdnaDtIipE=; b=S5zFa1luBlyP+oTMapxvx/J8H5
	my/t9ESKfYnEhgf3+nxnaC27CSUOuWCro2A60bN7Uo1cWuW4ssrey55pslq0Iksnnvnl1QW/jOsK9
	csDAxeq0Y+tgtbwKymdQLFi1UwM4JVhIAm8me+KDsT91a6auml4NVUyjjaSLGiBr+GVIec8t7E+t+
	whqzE37jJPRxaR5626uBneH9TZZVGra1Wp3dCuUTV/dwAEYAuinNXF48QogUFVeakHjU1i3pGQVkl
	RRNG8bjfgKBjd7mylVURaPBqIkBXLddpW3vT/v6Jy/Yb0JBvKjtNejnMpcgFsX1NnuGb0T3UIldvj
	XBvLAwzw==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:60886 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wdAnq-00000003cZt-3mTa
	for docs@lists.yoctoproject.org;
	Fri, 26 Jun 2026 13:57:24 -0400
Date: Fri, 26 Jun 2026 13:57:18 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] ref-manual: add intro content to "Manually Called Tasks"
Message-ID: <5bad0a1a-46fa-4b09-83b1-53fefa37de17@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Fri, 26 Jun 2026 17:57:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9915


For readers who understand BitBake syntax, showing an example of
defining a manually-called task would probably be useful.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index e6301e708..1eee4f036 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -432,7 +432,26 @@ Manually Called Tasks
 =====================

 These tasks are typically manually triggered (e.g. by using the
-``bitbake -c`` command-line option):
+``bitbake -c`` command-line option) because they are not normally
+part of any standard build workflow. As an example, consider the
+``listtasks`` task, which displays the tasks defined for a given
+recipe and would be invoked with:
+
+.. code-block:: console
+
+   $ bitbake -c listtasks recipename
+
+A typical definition of a manually-called task would look like::
+
+   addtask listtasks
+   do_listtasks[nostamp] = "1"
+   python do_listtasks() {
+      ... definition of task ...
+   }
+
+which defines that function as a task without building it into any
+task dependency chain, as well as setting the ``[nostamp]`` flag to
+ensure that it is run every time it is invoked.

 ``do_checkuri``
 ---------------

