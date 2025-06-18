Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FEF0C7115A
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 10:34:16 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.4106.1750242851306812282
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Jun 2025 03:34:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=eO3syu06;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=x2YqW94ct3b7ssUyoaIU2dMEBjPdy8BzVNVFxTbiR+Y=; b=eO3syu06kSJxEBluS2VmotkjBf
	wxGSVffHexRfM3GBf+dOGFAiiymp8RPUqssZVvHUdDhfOOTelIhx5yYeuLcOXw0QvFagJRJtpbaEY
	Jo6HMPXSMT5TmgXKSlFj5b/CCw0v9jS9UhtAskCMxMM2Mc8nXQSIfs7eB4dIGez5Z+ajwtyYaAuns
	35th3cilPXqXgJ7LRwsJHvXystPTng5oaolsilllTZBgLWpnJMmJRrK41irkEwpUQZKmQ6dvBM+pM
	VEHS6xsapyl30YX2wLlQYgALsGoiq/j6gpeHneLT/BkPQ5Tkl+zyQRFjgobTaQweCXoGlNoTEUbd3
	lEEEYowA==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:36900 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uRq7K-00000003M3v-02W5
	for docs@lists.yoctoproject.org;
	Wed, 18 Jun 2025 06:34:09 -0400
Date: Wed, 18 Jun 2025 06:33:57 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] bsp guide: update kernel version example to 6.12
Message-ID: <dc8e4016-70d0-d090-6d8f-3996212563fc@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Wed, 18 Jun 2025 10:34:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7093


Change the sample kernel version being used from 4.4 to a more modern
6.12.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index 35972f172..4a24fc3ff 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -674,21 +674,21 @@ to the kernel recipe by using a similarly named append file, which is
 located in the BSP Layer for your target device (e.g. the
 ``meta-bsp_root_name/recipes-kernel/linux`` directory).

-Suppose you are using the ``linux-yocto_4.4.bb`` recipe to build the
+Suppose you are using the ``linux-yocto_6.12.bb`` recipe to build the
 kernel. In other words, you have selected the kernel in your
 ``"bsp_root_name".conf`` file by adding
 :term:`PREFERRED_PROVIDER` and :term:`PREFERRED_VERSION`
 statements as follows::

    PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
-   PREFERRED_VERSION_linux-yocto ?= "4.4%"
+   PREFERRED_VERSION_linux-yocto ?= "6.12%"

 .. note::

    When the preferred provider is assumed by default, the :term:`PREFERRED_PROVIDER`
    statement does not appear in the ``"bsp_root_name".conf`` file.

-You would use the ``linux-yocto_4.4.bbappend`` file to append specific
+You would use the ``linux-yocto_6.12.bbappend`` file to append specific
 BSP settings to the kernel, thus configuring the kernel for your
 particular BSP.

@@ -698,14 +698,19 @@ in the Yocto Project Linux Kernel Development Manual.

 An alternate scenario is when you create your own kernel recipe for the
 BSP. A good example of this is the Raspberry Pi BSP. If you examine the
-``recipes-kernel/linux`` directory you see the following::
+``recipes-kernel/linux`` directory in that layer you see the following
+Raspberry Pi-specific recipes and associated files::

+   files/
+   linux-raspberrypi_6.12.bb
+   linux-raspberrypi_6.1.bb
+   linux-raspberrypi_6.6.bb
    linux-raspberrypi-dev.bb
    linux-raspberrypi.inc
-   linux-raspberrypi_4.14.bb
-   linux-raspberrypi_4.9.bb
-
-The directory contains three kernel recipes and a common include file.
+   linux-raspberrypi-v7_6.12.bb
+   linux-raspberrypi-v7_6.1.bb
+   linux-raspberrypi-v7_6.6.bb
+   linux-raspberrypi-v7.inc

 Developing a Board Support Package (BSP)
 ========================================

