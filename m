Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 129C3C77B7F
	for <webhook@archiver.kernel.org>; Sun, 22 Jun 2025 14:50:32 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.27406.1750603822694980816
 for <docs@lists.yoctoproject.org>;
 Sun, 22 Jun 2025 07:50:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=jrvVedFZ;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=D4Iz8JOLM0Bx5bOOtmG/ZD6AMcreFznDptKIRZEQnGc=; b=jrvVedFZ1tidrgqmdMIVf5CKaK
	fjA4Yi9S4oJE+5MTfskx9fiR8kh/YJKiJRlgmbTyYfxjU4hcCUAXDya7MRkv7XvO6FR3cPqyb4WXK
	gpIHMwYfSpeo++bs06E1yKVrA6SV8tSUrLa9iVVmlQuLVmE/RcG1WZnf/ME+7OoW59XeqY1k02oQZ
	FhXy0klvbfdvJCP9V89g3PRmI+QuEck9/x2XZ2cu4MCo9kGhXhn7uvgdcdGwY+vGX3YVduzNTV7v+
	/HGsOIBWfRlQ2zNNCIWz71ax5TV9FEIn6jh/lk6IuPdQZGc12FgzIvMgHq9/yMLiWNUZ/NIqCEa/E
	roQM3y6w==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:41082 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uTM1U-00000007rtW-1Ds7
	for docs@lists.yoctoproject.org;
	Sun, 22 Jun 2025 10:50:21 -0400
Date: Sun, 22 Jun 2025 10:50:17 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual: correct statement that source is always
 tarballs
Message-ID: <9c2b4c83-b40a-4f21-1680-e95a9e238a82@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Sun, 22 Jun 2025 14:50:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7141


It's misleading to suggest that source is always fetched as tarballs.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/efficiently-fetching-sources.rst b/documentation/dev-manual/efficiently-fetching-sources.rst
index a15f0a92c..2f8a68e20 100644
--- a/documentation/dev-manual/efficiently-fetching-sources.rst
+++ b/documentation/dev-manual/efficiently-fetching-sources.rst
@@ -6,7 +6,7 @@ Efficiently Fetching Source Files During a Build
 The OpenEmbedded build system works with source files located through
 the :term:`SRC_URI` variable. When
 you build something using BitBake, a big part of the operation is
-locating and downloading all the source tarballs. For images,
+locating and downloading all of the source. For images,
 downloading all the source for various packages can take a significant
 amount of time.


