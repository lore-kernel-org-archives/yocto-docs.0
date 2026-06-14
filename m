Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DF9BCD98C7
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 18:40:02 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.114447.1781462400056441278
 for <docs@lists.yoctoproject.org>;
 Sun, 14 Jun 2026 11:40:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=j8WuHGXP;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZmQvbU4eJbRazsjVdnjbsHibIFxuzTh/3J0C6PHfVGE=; b=j8WuHGXP/qGiQIzRnjZdrtixld
	obafiMR16y44cHO5Wq16nk5+DDVqP8PwBka3trCqH8JwViYWx8nKYb53Y5s9xQZtfOSXTHZ+vmzPr
	9OmhEEOVq6Aw+nz7yAXPBMG9GS5hEYbk+VfuMdQlTP/bPYVT+e7HbIYZaaWJEFkKJNfT6bElA90bD
	gmzX/LTN9XydhnYysz5XU6esxCMuvH+r0e7RqB1EbpfNO51rFlAzoqTdJUTl7bPEsfVhiQAtrpgSE
	ODIcyTXEFrNX4UnOhDjdLlrjyxnF9nHGJXtKXiyoR+2V5FBKG/VCMbos3hZP0qxd8VOBwAnYiHLHo
	ib6FOGnQ==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:38738 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wYpkR-00000002TJ9-0QTb
	for docs@lists.yoctoproject.org;
	Sun, 14 Jun 2026 14:39:58 -0400
Date: Sun, 14 Jun 2026 14:39:42 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] kernel-dev: break a paragraph into a bullet list
Message-ID: <100f2882-f73b-4664-84ff-94819358dd0c@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Sun, 14 Jun 2026 18:40:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9713


Redo the first paragraph of the kernel intro section into a more
easily-readable bullet list.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/kernel-dev/intro.rst b/documentation/kernel-dev/intro.rst
index 7df342f8d..33a47d078 100644
--- a/documentation/kernel-dev/intro.rst
+++ b/documentation/kernel-dev/intro.rst
@@ -8,14 +8,21 @@ Overview
 ========

 Regardless of how you intend to make use of the Yocto Project, chances
-are you will work with the Linux kernel. This manual describes how to
-set up your build host to support kernel development, introduces the
-kernel development process, provides background information on the Yocto
-Linux kernel :term:`Metadata`, describes
-common tasks you can perform using the kernel tools, shows you how to
-use the kernel Metadata needed to work with the kernel inside the Yocto
-Project, and provides insight into how the Yocto Project team develops
-and maintains Yocto Linux kernel Git repositories and Metadata.
+are you will work with the Linux kernel. This manual covers the following:
+
+-  how to set up your build host to support kernel development
+
+-  coverage of the kernel development process
+
+-  background information on the Yocto Linux kernel :term:`Metadata`
+
+-  common tasks you can perform using the kernel tools
+
+-  how to use the kernel Metadata needed to work with the kernel
+   inside the Yocto Project
+
+-  details on how the Yocto Project team develops and maintains
+   Yocto Linux kernel Git repositories and Metadata.

 Each Yocto Project release has a set of Yocto Linux kernel recipes,
 whose Git repositories you can view in the Yocto

