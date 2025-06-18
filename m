Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E403C7115A
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 17:44:27 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.2029.1750268657642829400
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Jun 2025 10:44:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=nzQ3zZjS;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=eZmhnmfBk6VD8yAK3AFStllxHGQ/QqWv0psD28+uZ74=; b=nzQ3zZjSfMcE5r+pc32H0tOhpO
	xodrXSN3hOFIA/PjhHnmEiviBJom9wCVwQ8x0a2x2pSusm/rIX44tC4YcPzk5WrB6qoGtp6dl1Z1L
	W/q/2qxc89gOG/IGMBaxhDF7yx6hPacY7U/3n5cCEe3IrDZm9uelKlrPspZQIFE2DIedkiYpyHn7X
	TgR3zOH+wiWn9PJQjKs421QkqzdrgjQTtlXU4aJUQY47o9GkLAXxuHfSZYbgNIwZ21CNSkmhob14L
	XUluJV5M87L2zWchYbg+rrGe5zMrTQZdDkqbutiSrbrW/gvcgBm1jYoDZLT+qD4Pj3OYQN8YtZT4W
	llaJbdHg==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:45910 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uRwpb-00000005ozp-0gnE
	for docs@lists.yoctoproject.org;
	Wed, 18 Jun 2025 13:44:15 -0400
Date: Wed, 18 Jun 2025 13:44:11 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] bsp-guide: update lonely "4.12" kernel reference to "6.12"
Message-ID: <48a03c30-a5d4-0710-efd3-579de1698cc3@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Wed, 18 Jun 2025 17:44:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7105


To accompany earlier updating of kernel version, update this lonely
reference to be consistent.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  there will be one more patch to update the rest of the BSP guide,
but that will be submitted separately.

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index 35972f172..a3020789f 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -1177,7 +1177,7 @@ Use these steps to create a BSP layer:

 -  *Create a Kernel Recipe:* Create a kernel recipe in
    ``recipes-kernel/linux`` by either using a kernel append file or a
-   new custom kernel recipe file (e.g. ``linux-yocto_4.12.bb``). The BSP
+   new custom kernel recipe file (e.g. ``linux-yocto_6.12.bb``). The BSP
    layers mentioned in the previous step also contain different kernel
    examples. See the ":ref:`kernel-dev/common:modifying an existing recipe`"
    section in the Yocto Project Linux Kernel Development Manual for

