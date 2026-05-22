Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1E9ECD5BB0
	for <webhook@archiver.kernel.org>; Fri, 22 May 2026 17:15:05 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21770.1779470099237468673
 for <docs@lists.yoctoproject.org>;
 Fri, 22 May 2026 10:14:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=JUuDTIQU;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Ymp9FxX3+GfL1ubVTNmOyDqUVuIyxZMEBIADayeTs58=; b=JUuDTIQU/7mekFdnQr+Iou/IDk
	SXhXO5EyZM0LI9KUR+EwQUkJ/mSyAMopSiDxerD7D6myFk/959hA/m6D4Hwki74MppfseKWmPAxxD
	BtGbbyYn8vTOD5G5duppHnlr7yjTUQp0s0tnuSlUzNaRLli8ibdek9YBiVe+gzMDkbj8TE0BdSLWK
	XFRuIHc2s+FVl6vflH+7vdqePbR/fhQoZkh7qt/roK0rsouOQnBJf8+SI6skqq3dGwaUw3BS00rSP
	r1gsMiUUCD8dr/UHMvnlRNJ666b0l0Rg8KuGOMD19KORaiIQ1S6Adztv11tOCMa6owi+6CHjqDZcg
	DzrN9KBQ==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:47370 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wQTSX-00000005uJv-0PQh
	for docs@lists.yoctoproject.org;
	Fri, 22 May 2026 13:14:57 -0400
Date: Fri, 22 May 2026 13:18:18 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH v2] bsp-guide: simplify example of structure of BSP layer
Message-ID: <6e1fcbc9-6a7a-9f72-6a91-74fc46cb44b3@crashcourse.ca>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1562852446-1779470308=:254343"
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
 <docs@lists.yoctoproject.org>; Fri, 22 May 2026 17:15:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9534

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1562852446-1779470308=:254343
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: 8BIT


Rather than introduce a generic example of a BSP layer and follow that
with a link to meta-yocto-bsp, eliminate the middleman and just show a
clear hierarchical view of the meta-yocto-bsp layer where readers can
immediately see the point being made.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index a3b57d29f..28fd9169d 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -1222,22 +1222,30 @@ Project Development Tasks Manual.
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
+``meta-yocto-bsp`` BSP layer:
+
+.. code-block:: console
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
--8323329-1562852446-1779470308=:254343--

