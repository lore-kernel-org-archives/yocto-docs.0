Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4024CD4F5E
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 15:04:54 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.841.1779203084163905363
 for <docs@lists.yoctoproject.org>;
 Tue, 19 May 2026 08:04:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=xeKZCFLf;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=IbIEvG79UDZtULJKGoQmxrNj1urS4PBlvxbO7BshXg4=; b=xeKZCFLfoJJdtnTX+zN6fVpcB3
	yNDudsiahkoi5adub6E1dxzP1MhdP1jbCUQa2M7NdpFwdKTZ3esZtuhDq12+ANfW8i20wrGV66iyt
	dnkVjfmyXtTjDVWpVl/qxK2dVrdXKuxLmjfUZF6yl2KKTNFAvNvfMmfxGQMhHEUD8qWPFAT8zTYqy
	3njZLpJ7TH1F9rZ9kQcxTTpIL7zrAHqeALGV6VaRKoDAf9CtVM/ZCD1xtiyNn2nX65WkDWoxIeXhk
	gBUxI6CTbU/TWmEyGF1X7vuQlnGlnKA/CUxQMb1f3Ge4bJ1zyYtUqaictR2qPksGkNcYvRwVTI0ur
	2Gxe1qDw==;
Received: from [147.129.179.166] (port=49230 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wPLzt-00000009B6W-0s2f
	for docs@lists.yoctoproject.org;
	Tue, 19 May 2026 11:04:42 -0400
Date: Tue, 19 May 2026 11:08:03 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] overview-manual: inform the reader early of
 "bitbake-getvar"
Message-ID: <994b353e-5432-0b4e-4662-8f268483518a@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 19 May 2026 15:04:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9492


Given how Chapter 4 of the Overview Manual introduces so many of the
variables that define a build, briefly introduce the reader to the
"bitbake-getvar" command so they can examine those variables.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index ec5babe4c..0dac5cfbc 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -11,6 +11,14 @@ workflow,
 cross-development toolchains, shared state cache, and so forth are
 explained.

+.. note::
+
+   Throughout this section, many variables and their meanings are
+   introduced. If, in the context of a build directory, you want to
+   examine the value of any of these variables, you can use the
+   ``bitbake-getvar`` command, explained in the
+   ":ref:`dev-manual/debugging:viewing variable values`" section.
+
 Yocto Project Components
 ========================


