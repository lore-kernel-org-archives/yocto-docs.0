Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD2B8CCD1A5
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 12:50:30 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.9849.1761310221870534540
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 05:50:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=Lzrmnh0p;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=A8L5hp7JBIdwDi1CzGdIDtnFlFK4YEzPpTSMkN/stTo=; b=Lzrmnh0p9JKCWpJSNiJIi+ekbJ
	IOlVoq9XQQS4kZCBoJxEuhuvGptAy+Cs/S2nxn0/Y4DlNHu5uNdRTW311lp14emR1uKzZn8hyjXTO
	HjpF33hPaxH0tScoB7yu/qDg9/UlN0oD5HjjkZHwEGDwfqJeo/UTThOQHXSLaC8yvjS9ePusWgbXu
	ddhwaeHWOpLT7bGRt1jTtdEHT+0N9Yg3PRWimgxK144qm4dqkhB1FzKpuyH3ig78BDczXubIa/Z/K
	8yQbVdAjv0oOwaLBYqhDaPEMH+eM1ZrPviIrIpHOQIg5exE61VnXbcbHk6EA94FX6mpiQacWVS1vy
	EQCwwZRA==;
Received: from [147.129.179.166] (port=36178 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vCHFI-0000000GJfm-3gnz
	for docs@lists.yoctoproject.org;
	Fri, 24 Oct 2025 08:50:20 -0400
Date: Fri, 24 Oct 2025 08:52:47 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual/start.rst: fix typo "RELEASE" -> "RELEASES"
Message-ID: <4b9f4516-12b1-ac82-02cc-614905b2971e@crashcourse.ca>
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
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 12:50:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7817


In addition, some minor grammatical tweaking.

Signed-off-by: Robert P. J. Day <robday@acresecurity.com>

diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index 77ba16e2f..2a1be7260 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -653,8 +653,8 @@ described in the ":ref:`dev-manual/start:accessing source archives`" section.
 #. *Get to the Downloads Area:* Select the "RELEASES" item from the
    pull-down "DEVELOPMENT" tab menu near the top of the page.

-#. *Select a Yocto Project Release:* On the top of the "RELEASE" page currently
-   supported releases are displayed, further down past supported Yocto Project
+#. *Select a Yocto Project Release:* On the top of the "RELEASES" page, currently
+   supported releases are displayed; further down, past supported Yocto Project
    releases are visible. The "Download" links in the rows of the table there
    will lead to the download tarballs for the release.


