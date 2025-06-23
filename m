Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A874EC77B7C
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 15:27:52 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.1690.1750692462516435878
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Jun 2025 08:27:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=AnAiEXPL;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=t86qZjiX1MHZCFx2ebZJUR5dDxOXueHgh7/INwW6XuU=; b=AnAiEXPLGsRNy2afIUXslV4N9S
	K3jyMXN4jRMcKG8yYqnpRoIjg9AB39erN9u2Um9Bbp+JBZZzAgvTRwjJ5jLgBr9A+QeH2KsXDneN2
	95IcK+EHy2d9dhqsDpur8lWhIYjD/bnTVJn+lh8IwYUyi+uWHN9W1btvIwPwtYE9pS8rVPUMrXDgw
	63T9fNR6nIDFW5vn1Dbw6D8J9X5piAhwCT1L/IXpsgrFCMNz7qj9ZW4HSYmRbC/e3s9mqr2s/LVzG
	RNPLPX4SK5V3SumozNnlRBgeTqFtWE3Tk/Vx0eg3ybMXyVvIQVWdDOpUTP4msMonjsLnwDWHa3MgZ
	KsaScQAg==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:54804 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uTj59-0000000BRQs-24Vw
	for docs@lists.yoctoproject.org;
	Mon, 23 Jun 2025 11:27:41 -0400
Date: Mon, 23 Jun 2025 11:27:39 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual: replace "on the contrary" with "by contrast"
Message-ID: <4214b475-52f5-bbe6-04a7-0dded5906f2f@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Mon, 23 Jun 2025 15:27:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7166


The qualifier "By contrast" is more appropriate here, since that
phrase is used to introduce a point that is strikingly different from
what was just discussed, that being the substantial systemd.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/init-manager.rst b/documentation/dev-manual/init-manager.rst
index ddce82b81..d0fdfdf77 100644
--- a/documentation/dev-manual/init-manager.rst
+++ b/documentation/dev-manual/init-manager.rst
@@ -44,7 +44,7 @@ therefore increasing the total system boot time. systemd also substantially
 increases system size because of its multiple components and the extra
 dependencies it pulls.

-On the contrary, BusyBox init is the simplest and the lightest solution and
+By contrast, BusyBox init is the simplest and the lightest solution and
 also comes with BusyBox mdev as device manager, a lighter replacement to
 :wikipedia:`udev <Udev>`, which SysVinit and systemd both use.


