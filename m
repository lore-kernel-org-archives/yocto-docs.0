Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE208E9B258
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 12:15:49 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18969.1771935344641169982
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Feb 2026 04:15:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=I/IN+8PD;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0mPwi7eodPALmIc9o16YHxTbsIW3FLYXwQ6SdG3QnHI=; b=I/IN+8PD6OAjiVi93ApwT8Og2O
	FUJUmeaoCVW6Byx2RyybwnCuMo9xKf6+6m/BQ15DPldxAP429SzCQzxCZ0DA3g6UYiEyf6176bj1V
	wsIhNYj2aEsardY5GsIV4iAuwO5z4GPFnr4B4I7lM2sRc8yGDHN32y2ADjIJRofkyAz21D0OIjXdc
	YNmkShknLzw//xQsCLHdPexzaYlzJe3UDqZJn1fSaEEXYGmifH2iTlBWJsIo0IBHjuRCSRIsxkqpT
	Kn/S7q8KTHo2UYjpmMVc3s8b7UqDlFDuexxIHT8j/HwgRXx5ra9HkG1rYiM8QFXdYgwgRJAvHj8sq
	KpqS/r6g==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:47514 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vurKJ-00000003E2r-25J9
	for docs@lists.yoctoproject.org;
	Tue, 24 Feb 2026 07:15:43 -0500
Date: Tue, 24 Feb 2026 07:17:59 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] variables.rst: expand explanation of RSUGGESTS
Message-ID: <1ee12fbd-a5c7-7b14-a558-cd6dda9e539e@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 24 Feb 2026 12:15:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8966


Add that the RSUGGESTS variable would be processed only by a
supporting package manager when installing packages from a
package feed.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/ref-manual/variables.rst
b/documentation/ref-manual/variables.rst
index 208b5e43d..92476d509 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8361,7 +8361,9 @@ system and gives an overview of their function and contents.
    :term:`RSUGGESTS`
       A list of additional packages that you can suggest for installation
       by the package manager at the time a package is installed. Not all
-      package managers support this functionality.
+      package managers support this functionality. This feature takes effect
+      only when the package manager is being used to install packages on
+      the target system from a package feed.

       As with all package-controlling variables, you must always use this
       variable in conjunction with a package name override. Here is an

