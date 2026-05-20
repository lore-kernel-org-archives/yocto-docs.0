Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05847CD4F3C
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 09:58:40 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8739.1779271111954564761
 for <docs@lists.yoctoproject.org>;
 Wed, 20 May 2026 02:58:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=Yu8mgIji;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WMsguyNEwzL6vnG2eh0VzQNNPyi9v5QPSvam9ti76KM=; b=Yu8mgIjiA8NouZCPXzDawJrYZG
	76nbSreQr+ZNHMfQlYe3TmbIafMyRiPXkbrDmP8TVsW7O7OPnpY/ij8pJL6dagejydk1DPWWdcQ/X
	ucBTF8sQ+/TSimEgsO470oKjxotQrygKB3KCgWGKLR+t6GhWf73NQd1m3EIa01Q3yQ6mK8f8Y9UHX
	LeHWZVFpcOb0vgayt3mP+yHbc4+81/SKUn5soyb12UZc+oJ62MEm/Ms42qh1+vpp0s/InPtNi560d
	nhItbUa5j9/2mTdPNXR6c9zI8FCyzPvlSdxtI4l/72a7eQsVOdi03YEAvLdO742r+8ZdWRLrYMlJ3
	N0SO48hw==;
Received: from [147.129.179.166] (port=55760 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wPdh6-0000000BMmH-2kC4
	for docs@lists.yoctoproject.org;
	Wed, 20 May 2026 05:58:30 -0400
Date: Wed, 20 May 2026 06:01:50 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] bsp-guide: mention bootloader and device tree in BSP intro
Message-ID: <9c88b765-1ae9-ec34-aafc-461613b132e1@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Wed, 20 May 2026 09:58:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9498


In the intro to the BSP guide, mention that a BSP layer might also
contain content related to the bootloader and device tree files.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index a3b57d29f..e08e720a0 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -7,10 +7,10 @@ Board Support Packages (BSP) --- Developer's Guide
 A Board Support Package (BSP) is a collection of information that
 defines how to support a particular hardware device, set of devices, or
 hardware platform. The BSP includes information about the hardware
-features present on the device and kernel configuration information
-along with any additional hardware drivers required. The BSP also lists
-any additional software components required in addition to a generic
-Linux software stack for both essential and optional platform features.
+features present on the device, any essential bootloader, kernel and
+device tree configuration, along with any additional hardware drivers required.
+The BSP also lists any additional software components required in addition to
+a generic Linux software stack for both essential and optional platform features.

 This guide presents information about BSP layers, defines a structure
 for components so that BSPs follow a commonly understood layout,

