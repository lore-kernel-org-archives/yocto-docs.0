Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C61E8C7115B
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 07:47:54 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.1620.1750232867990319993
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Jun 2025 00:47:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=dT/gHd3e;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BUEXH9+U8flVLRHuJ21NwU/GNBTbC0VOl6pQgM9Cnqk=; b=dT/gHd3eNz9nJP6DNX2yy+OcS9
	/N+c4wOBnP5z2RHN6mVk9DnydgaZU/ThUG/K9Y9hlTTxqDitIXLikuTQZY+Sb7tSmlwEHUF9GH944
	jfSwSSzMxU7ApT/Dz1ViPRyh49Ll/tqTtGNkw+wY0hHqOCE81NlO1NFfY/ro7MbjIPQVh0McOUUgU
	5x290aZKwrMDoxWbIIxdKjJ09xGQ4lPvE0eif9DFfllDGnB7eO+zzlJD0l6tVuoJhVfzBdWXaAXiE
	yC1H4VZ9Vo2dKThbCUhLSnh8gyVf0//+dtyidGn9oPD+MBV54iz0MQyvWjQYj/y9m7ZAroMxJmwwI
	j+eWJpyw==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:50138 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uRnWL-00000002y79-0Ion
	for docs@lists.yoctoproject.org;
	Wed, 18 Jun 2025 03:47:46 -0400
Date: Wed, 18 Jun 2025 03:47:41 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] yp-intro: new doc reference is missing leading slash
Message-ID: <b08ac36e-51de-71b6-53ad-a2f05b0d31ae@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Wed, 18 Jun 2025 07:47:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7090


The new ":doc:" reference for yocto-project-supported-features appears
to be missing a leading slash, causing HTML generation to fail.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
index 15dfb3a6b..40e9693a8 100644
--- a/documentation/overview-manual/yp-intro.rst
+++ b/documentation/overview-manual/yp-intro.rst
@@ -51,7 +51,7 @@ Here are features and advantages of the Yocto Project:
    RISC-V and other architectures. Most ODMs, OSVs, and chip vendors create and
    supply BSPs that support their hardware. If you have custom silicon, you can
    create a BSP that supports that architecture. See
-   :doc:`ref-manual/yocto-project-supported-features` for details on the level
+   :doc:`/ref-manual/yocto-project-supported-features` for details on the level
    of support for some of these architectures.

    Aside from broad architecture support, the Yocto Project fully

