Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38FF5C7115D
	for <webhook@archiver.kernel.org>; Sun, 22 Jun 2025 15:09:42 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.27937.1750604973769759878
 for <docs@lists.yoctoproject.org>;
 Sun, 22 Jun 2025 08:09:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=hNXuMOD9;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=o9fkN954j6tCvBhCDGrofxxzDzhx9qq08BFyv6Tb+2c=; b=hNXuMOD9S+dK/805ycGfVxKWl3
	JnbYUI0QhRkWwfi51ewCVQNGJBkk09wHZ6IKBIY3N6MzlUiJvjQ7Wgp3ICeucaQugXo/XXUgMWi50
	7oObsp/MYNU2eFTDH6teLmAW0iZJfxy2ScKh+WOZy91y0VfhY4e0mrywXqZjNYlnXnKv8iCp0nzj8
	znTgOkd4maOi3DBf8vfQN1ArMikw5qtTbcNGrbbmRetLD+ywDTkPEQpRthrA712SbXkvzntqkmaih
	65K4QiLvKmtCOu2E+yezrVNJk1J7T8hFAy4gUAVezFcpHYswNQuTi6/PTpn2kbIzXA44PF8z04O7b
	YLKzOG/g==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:42032 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uTMK0-00000007vDR-1zHI
	for docs@lists.yoctoproject.org;
	Sun, 22 Jun 2025 11:09:29 -0400
Date: Sun, 22 Jun 2025 11:09:21 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual: Replace "On the contrary" lead-in to sentence
Message-ID: <b651b956-eb9f-6d46-f878-f09bc6bdc460@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Sun, 22 Jun 2025 15:09:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7142


"On the contrary" is entirely the wrong qualifier to us here, as it
typically introduces a *contradiction* to what has just been
expressed. That is not what is happening here.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/init-manager.rst b/documentation/dev-manual/init-manager.rst
index ddce82b81..da1cdacd1 100644
--- a/documentation/dev-manual/init-manager.rst
+++ b/documentation/dev-manual/init-manager.rst
@@ -44,7 +44,7 @@ therefore increasing the total system boot time. systemd also substantially
 increases system size because of its multiple components and the extra
 dependencies it pulls.

-On the contrary, BusyBox init is the simplest and the lightest solution and
+On the other hand, BusyBox init is the simplest and the lightest solution and
 also comes with BusyBox mdev as device manager, a lighter replacement to
 :wikipedia:`udev <Udev>`, which SysVinit and systemd both use.


