Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BB31CD5BA4
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 11:50:59 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34649.1779364256845779795
 for <docs@lists.yoctoproject.org>;
 Thu, 21 May 2026 04:50:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=I6pioATn;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=R7iHZFrbqy994klmz96zeQ9DyDH2uGW3e5nsVrko4m0=; b=I6pioATnCumkiZekmWVbhMGMGJ
	+NAvyszxCXFdzJwNPqa4tU+keDLuOVQlOrsUKUN+FOp7AKNxh4p6TvrFf1KfYesMEr3W6H4q8vIt8
	8UT2eIEGMc8fXRsLQMzu4XtIekhiTTNhi41mfWsHttgEUvXFFGxYsJbyjWPVI5xz4A0l4+0Z6Yt/p
	/sMJ/p7jxGjM8jRo33zfbhO6oZsnwKrkDSre8CISsNR3x+17/Ap5D07yDWbbiItgXZtXmtRgqDM8M
	L5hDis+IsTZulN60C4f7lUP9newi1u3njPoVhstDT3iyJ00qGaJRWI1mLMdZFu6Fs/ur67tH/aQpa
	Ur2+tVeQ==;
Received: from [147.129.179.166] (port=47364 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wQ1vO-00000002V1w-3vI9
	for docs@lists.yoctoproject.org;
	Thu, 21 May 2026 07:50:55 -0400
Date: Thu, 21 May 2026 07:54:10 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] bsp-guide: simplify example of structure of BSP layer
Message-ID: <ea426fa3-2f18-891b-4e9d-c85ff1f0bcd3@crashcourse.ca>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1415588802-1779364459=:1809257"
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
 <docs@lists.yoctoproject.org>; Thu, 21 May 2026 11:50:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9515

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1415588802-1779364459=:1809257
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: 8BIT


Rather than introduce a generic example of a BSP layer and follow that
with a link to meta-yocto-bsp, eliminate the middleman and just show a
clear hierarchical view of the meta-yocto-bsp layer where readers can
immediately see the point being made.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index a3b57d29f..1ae9d3353 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -1222,22 +1222,28 @@ Project Development Tasks Manual.
 BSP Machine Configuration Example
 ---------------------------------

-As mentioned earlier in this section, the existence of a machine
+As mentioned earlier in this section, the existence of at least one machine
 configuration file is what makes a layer a BSP layer as compared to a
 general or kernel layer.

-There are one or more machine configuration files in the
-``bsp_layer/conf/machine/`` directory of the layer::
-
-   bsp_layer/conf/machine/machine1\.conf
-   bsp_layer/conf/machine/machine2\.conf
-   bsp_layer/conf/machine/machine3\.conf
-   ... more ...
-
-For example, the machine configuration file for the `BeagleBone and
-BeagleBone Black development boards <https://beagleboard.org/bone>`__ is
-located in :yocto_git:`/meta-yocto/tree/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf
-</meta-yocto/tree/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf>`.
+As an actual example, consider the relevant content from the
+:yocto_git:`/meta-yocto/tree/meta-yocto-bsp/conf/
+</meta-yocto/tree/meta-yocto-bsp/conf/>` directory of the
+``meta-yocto-bsp`` BSP layer::
+
+   $ tree -F conf
+   conf/
+   ��� layer.conf
+   ��� machine/
+       ��� beaglebone-yocto.conf
+       ��� genericarm64.conf
+       ��� genericx86-64.conf
+       ��� genericx86.conf
+       ��� include/
+           ��� genericx86-common.inc
+
+showing four machine configuration files along with a lower-level
+tuning configuration file.

 The variables used to configure the machine define machine-specific properties; for
 example, machine-dependent packages, machine tunings, the type of kernel
--8323329-1415588802-1779364459=:1809257--

