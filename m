Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12860F3C995
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 15:05:24 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22252.1771945520614141214
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Feb 2026 07:05:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=B53ncYk6;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LrRu/7zuP/SumA5aMfGq7RP0ObE3KRQKtJLjySCxpnc=; b=B53ncYk67ig3rbSuDBHUYbsc5q
	0dCjn9yUY58lfw5vf5gr8NYnF8sYtxA/z+y2skiRQDZ3K/cMmDWzxwRAuF+3aIwxQ9muCefp3xTMq
	Zy+RWVrmogFEV1z/E7VLU8VVQtvIRAtDFPK4VLDn9J7mo9a81j08jF7HttXpUhfjEI6K+JaGvpBAE
	/ypcRKUBLP5N7C76eY4nN8svPHAieYe4DTnOPxLX0cy5fcNim0yQAcdnA7G3Mw9cBAkpbELE+Ctfw
	ge5tbcrjEAhCtFmWXcv7EBaFOkaHan2DaM/JtDb3HjRnYxmPoQTnc6UrMrUiriMZIaWVYoEQatiIU
	K8C4K7wg==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:46148 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vutyQ-000000006jm-45CZ
	for docs@lists.yoctoproject.org;
	Tue, 24 Feb 2026 10:05:19 -0500
Date: Tue, 24 Feb 2026 10:07:35 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH v2] variables.rst: expand explanation of RSUGGESTS
Message-ID: <6fe6124f-27f7-01b4-43f8-b48de5b5db58@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 24 Feb 2026 15:05:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8974


Add that the RSUGGESTS variable would be processed only by a
supporting package manager when installing packages from a
package feed, and add a link to the appropriate section in
the Developers Manual.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 208b5e43d..8281d66a2 100644
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
@@ -8369,6 +8371,10 @@ system and gives an overview of their function and contents.

          RSUGGESTS:${PN} = "useful_package another_package"

+      For more information on package management, see the
+      :ref:`dev-manual/packages:Using Runtime Package Management` section
+      of the Yocto Project Development Tasks Manual.
+
    :term:`RUST_CHANNEL`
       Specifies which version of Rust to build - "stable", "beta" or "nightly".
       The default value is "stable". Set this at your own risk, as values other

