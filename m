Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37DCCCD98CC
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 10:35:05 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42453.1781174095508107989
 for <docs@lists.yoctoproject.org>;
 Thu, 11 Jun 2026 03:34:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=MlEJZ1Op;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kcY9nTovlqBABDzzettIJnaiBgB33CHlPsadlLHuKmY=; b=MlEJZ1Op3K8GkX6UfkxT3+QfsS
	97gxmjmHubQan5PotOHtojf9kuslD5G7lGIiqZqu5mtsA8iU828hqGqA/YxCEg+XUaGnJp6BpmnoI
	kmVXrA3QhLHUW9kdCk8b6FfOVy8VU5D6QKWa3P0O0Uy1IRx4hiejd61vdqw0CPAzeSA078FSuSOPo
	bujUz/IbMFAnKCLrJrQTKuqdYhKFZt2xjDkdlilNuSzLmrb72fovyaPQ9PJTW2uEOjnS2h5i77N6j
	SNslVibzMCllN4UzBEIuXKV4plNgfaBpOG4whRX8cjZCic4YlXL2oYAIIVcW5oPosQO2N9ioeJMmA
	RW1qwLVw==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:39088 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wXckP-0000000BMko-05Sq
	for docs@lists.yoctoproject.org;
	Thu, 11 Jun 2026 06:34:53 -0400
Date: Thu, 11 Jun 2026 06:34:47 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] ref-manual: document "RM_WORK_EXCLUDE_ITEMS" for
 rm_work.bbclass
Message-ID: <eb6dc48a-f434-3167-ad28-d348ff1f4e77@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Thu, 11 Jun 2026 10:35:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9690


Add an explanation of RM_WORK_EXCLUDE_ITEMS for rm_work.bbclass.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 95e07f85a..36b730823 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -2614,6 +2614,12 @@ which can also be set in your ``local.conf`` file. Here is an example::

    RM_WORK_EXCLUDE += "busybox glibc"

+Finally, if you are using this class for a recipe but want to prevent BitBake
+from deleting specific folders or files in that recipe's ``${WORKDIR}``
+(other than ``temp``), you can preserve those folders or files with::
+
+   RM_WORK_EXCLUDE_ITEMS += "stuff_to_keep"
+
 .. _ref-classes-rootfs*:

 ``rootfs*``

