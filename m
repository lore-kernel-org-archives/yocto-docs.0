Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B572CD8CA4
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 08:36:03 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.74794.1780994155524209850
 for <docs@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 01:35:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=RTDHJ52g;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=o7obS1EA22B2g70Lo6jCYn3lTGB0AypX6Q2PVnYWZDU=; b=RTDHJ52gwCZ7BRiHaMI6ZIRKHj
	O4lCQopSgllALR8I+FgbxSD7zl7PVY9ayD/FWq081cUY+t4ohqhg4CkKEy3FkFzPAeqaOh2Jj24Z6
	e2LqAKSANLJGiBV7LZACA/WKPZFF8bOpzqdqrsf72kvJM8MXH+6FOnjPFE3YixAmSRAFeY4tZZnxu
	cbSsuWhltjtSz3Pz+M13QCPVohE+oW+j1OxNYa71PhRRVmJU0BBqTyBSII6WCFzJ7T/gvlg0UMFvR
	iriBfWnek5d/UFk74m44YHTD8lUJTnKWlBtW9UYZbYCmxRIYmB+G8TALeg0GjF7XD/pz0CpmBmIMH
	ggAazFpg==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:40708 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wWrw8-00000005hEq-3mLs
	for docs@lists.yoctoproject.org;
	Tue, 09 Jun 2026 04:35:54 -0400
Date: Tue, 9 Jun 2026 04:35:47 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH v3] dev-manual: explain how to properly call
 "bitbake-layers"
Message-ID: <375b7fa3-83b2-72b6-899e-45de4b79c023@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 09 Jun 2026 08:36:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9661


Emphasize right away that calling "bitbake-layers" needs an
initialized build environment to work properly -- that does not seem
to be explained in that section.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
index b8842012e..dab1d2316 100644
--- a/documentation/dev-manual/layers.rst
+++ b/documentation/dev-manual/layers.rst
@@ -11,6 +11,13 @@ see the
 ":ref:`overview-manual/yp-intro:the yocto project layer model`"
 section in the Yocto Project Overview and Concepts Manual.

+Note well that to properly call the ``bitbake-layers`` command explained
+below, you must first
+:ref:`initialize the build environment <dev-manual/start:Initializing the Build Environment>`
+using your project's environment setup script.
+Without an initialized environment, your shell would not
+know where to find the command or your build configuration.
+
 Creating Your Own Layer
 =======================


