Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0A98CD8CA4
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 14:08:46 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.80553.1781014123952162299
 for <docs@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 07:08:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=l9g+H2w5;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XAwKhYbeRie7zqi5Xovsog5lnthNv0OrhFOJll/qjsM=; b=l9g+H2w5aQR33g7XgggEn7EdLo
	OVRTw64TCULpaveLtAwukjQH6q317MgMZnoNd5zu2Q7sF6fmfJhGb2nQARwGWy4QwZU5ceQP15Z4F
	KJWMnkYZdNN/e6DXXdLqwCvbwZP2lOd14T5xMz2yqfebg3P4o66+lejK60ENWIjArp5ocSgbEzti+
	uUbcFghSYatapgAAiPl+tMV7coYmHQFUOZMio7b6TsWHa8XRSXpwLymDjG7tF9/UIG66kaD6P9l9x
	C/wX4DEnbN4OfHvgu+6S35HM8p9k/nYifdbnKKtutjJ/J5FvU31zLpUSZQQNwvOSJVIUphb/+ouID
	hqStfwvQ==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:49708 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wWx8A-00000006IQ9-22d3
	for docs@lists.yoctoproject.org;
	Tue, 09 Jun 2026 10:08:42 -0400
Date: Tue, 9 Jun 2026 10:08:36 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual: drop "PREFERRED_VERSION" from x86-base.inc
 snippet
Message-ID: <b99491de-f786-3ce3-d7de-104ba1660842@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 09 Jun 2026 14:08:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9663


The machine include file "x86-base.inc" no longer includes the line
setting the PREFERRED VERSION -- that setting was removed in commit
298fa078fab58b64246376ffd70ad6a0c7589876 on Oct 1, 2023:

    qemux86/qemuarm: Drop kernel version overrides

    Drop the version overrides for the kernel for the x86 and arm machines
    so we can go back to following the distro versions. The reasons for
    these versions is mostly historical at this point as the issues were
    resolved.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-manual/new-recipe.rst
index 82c7ff4b2..0820d03b1 100644
--- a/documentation/dev-manual/new-recipe.rst
+++ b/documentation/dev-manual/new-recipe.rst
@@ -988,11 +988,10 @@ kernel recipe you want by using the :term:`PREFERRED_PROVIDER` variable. As
 an example, consider the :oe_git:`x86-base.inc
 </openembedded-core/tree/meta/conf/machine/include/x86/x86-base.inc>` include file, which is a
 machine (i.e. :term:`MACHINE`) configuration file. This include file is the
-reason all x86-based machines use the ``linux-yocto`` kernel. Here are the
-relevant lines from the include file::
+reason all x86-based machines use the ``linux-yocto`` kernel. Here is the
+relevant line from that include file::

    PREFERRED_PROVIDER_virtual/kernel ??= "linux-yocto"
-   PREFERRED_VERSION_linux-yocto ??= "4.15%"

 When you use a virtual provider, you do not have to "hard code" a recipe
 name as a build dependency. You can use the

