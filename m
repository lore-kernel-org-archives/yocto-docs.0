Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29294CCF9F8
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 13:26:58 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.15564.1761917210448848548
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Oct 2025 06:26:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=QsbU1N+C;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KHbcs1fyqgVyc44eYPayg1nZkYh9Dl2I4meP0sYtZFw=; b=QsbU1N+C210aDu5d1bRazJNpu/
	IH/QrIHEuMLsDSP9kqJjjhXk6DmDBd55wydKthfKOxEXVBQwzZOzB73dt0wYDtd/QHp3WUnSfLCVm
	vgeTwk+6LjAyYLDDGXzf+SxP9GFAKjfAKJKBfuRd/Y1TrpGkzn1xiguv7/E8wC+eoZYmWFcSpP9Xb
	4FGga3pOeXmKxay7GoCHSmiqJ+M9YO9WEJLWlrprS1Kl0vxNdCFdKvJHoUldJ7KLaXNof2oKJjU2q
	NhGoUcqFW6B1sPKjQdKm8n+ekK1fJLw9+REEHA6i58zIVnfwLKz7mNLkoC8xP4wTLyE2ik+BQ2bUZ
	s0aTyaeQ==;
Received: from [147.129.179.166] (port=37446 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vEp9P-00000005ri1-3Np8
	for docs@lists.yoctoproject.org;
	Fri, 31 Oct 2025 09:26:47 -0400
Date: Fri, 31 Oct 2025 09:29:35 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual/new-recipe.rst: update code snippet from sed
 recipe
Message-ID: <6766a20a-e028-7803-2ffe-645f669fd2bc@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Fri, 31 Oct 2025 13:26:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7950


Update the snippet from OE-Core's sed recipe; might as well
keep up to date.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-manual/new-recipe.rst
index aa4fb97a4..30cc27248 100644
--- a/documentation/dev-manual/new-recipe.rst
+++ b/documentation/dev-manual/new-recipe.rst
@@ -1461,8 +1461,10 @@ chapter of the BitBake User Manual.
       do_install () {
           autotools_do_install
           install -d ${D}${base_bindir}
-          mv ${D}${bindir}/sed ${D}${base_bindir}/sed
-          rmdir ${D}${bindir}/
+          if [ ! ${D}${bindir} -ef ${D}${base_bindir} ]; then
+              mv ${D}${bindir}/sed ${D}${base_bindir}/sed
+              rmdir ${D}${bindir}/
+          fi
       }

    It is

