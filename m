Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E16CC71157
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 11:48:46 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.5209.1750247322887926558
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Jun 2025 04:48:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=Z+E4gJaL;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=x3kicLsfx1PuoWDbJDqXZzzY07A6tPciD5Vd6JDpAU8=; b=Z+E4gJaLSB6auNdtyC9gI9KSGT
	ZuB07cP4e1XOyl3OGKgV2JOgE7XIZKQi1FDJpWfamGmIG0xTNtoz2UBXsyDfScAEwl28RtxTwRfj9
	YWWy9ZJ5e3A1JXg03SVA92lrcNpttL94J25u0iuZs9wfPLVSE9AHUHMeENBWV/8s1CZkV4ly11csu
	gH+qSGRU1FloXjhbLy3MXnCYjLTwg6Cv11U1G52vVUbn1nH1u6izi5eTsDurLR5F6hXlq+Q8sExOF
	ogRUjaasiCA9mkIlYD82KmGGkBlxIQOKzPNS1XiXKvKv30p01Qv5Cq01RxRSqvV75NDEf87D7K6No
	uYSbqYMg==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:36866 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uRrHU-00000003WAS-1PBV
	for docs@lists.yoctoproject.org;
	Wed, 18 Jun 2025 07:48:41 -0400
Date: Wed, 18 Jun 2025 07:48:33 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] bsp guide: correct number of reference BSPs in meta-yocto-bsp
 layer
Message-ID: <1c686762-cb01-822b-2725-8dd0d8e80783@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Wed, 18 Jun 2025 11:48:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7095


Update BSP guide to reflect that there are four, not three hardware
reference BSPs in meta-yocto-bsp.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index 35972f172..012dacce2 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -764,7 +764,7 @@ workflow.

    .. note::

-      -  There are three hardware reference BSPs in the Yocto
+      -  There are four hardware reference BSPs in the Yocto
          Project release, located in the ``poky/meta-yocto-bsp``
          BSP layer:

@@ -772,6 +772,8 @@ workflow.

          -  Two generic IA platforms (``genericx86`` and ``genericx86-64``)

+         -  One generic 64-bit ARM platform (``genericarm64``)
+
    When you set up a layer for a new BSP, you should follow a standard
    layout. This layout is described in the ":ref:`bsp-guide/bsp:example filesystem layout`"
    section. In the standard layout, notice

