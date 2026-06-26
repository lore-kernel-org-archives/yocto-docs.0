Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70254C43458
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 18:20:09 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40968.1782498007785966167
 for <docs@lists.yoctoproject.org>;
 Fri, 26 Jun 2026 11:20:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=Gxfpxctp;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kZL0YDWowyNbUgem4eTzb0TJSUJvS6VVTuKga4q8XxQ=; b=Gxfpxctpdt+Q3t0krna1EUbuzR
	OLpkZfcYmBefL/UnK2Oz3R6DsE4cRAgZhfwlOjGUVnwrcA4CYmo+ss4bRiLn4MxenQIBYsPrFCONu
	dC6rupBq7DoT2EP3av1VGVcMNZhbwA2fE7u79UA0q7vZpJkSznmnLrb5ENWgQm2VKzt1P2ijDHXQf
	D0YlpSG0BZzMPG2Axhvv3wutyCMH6dmLV2kMk5u9HPk1b2RDPbqdJknzyfQttYWvz4cdzaiRFdKQs
	ZmGuLZ95+W0fYjNxFiNYRVO/Zgzv2RlE77eyTcp5V5m8tmfSyxLsvhUOcMnrX7Ddg7q3ESJfU6dUu
	1KnjzZwA==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:51642 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wdB9n-00000003fA1-0jzu
	for docs@lists.yoctoproject.org;
	Fri, 26 Jun 2026 14:20:05 -0400
Date: Fri, 26 Jun 2026 14:19:58 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] ref-manual: mention EXTRA_IMAGE_FEATURES in task
Message-ID: <9f0461f4-af06-5c62-a01f-18235c953673@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Fri, 26 Jun 2026 18:20:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9916


Expand the explanation of the list-image-features task to mention that
available features for an image can also be added via the
EXTRA_IMAGE_FEATURES variable.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index e6301e708..262cf1a04 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -572,7 +572,7 @@ Yocto Project Development Tasks Manual for more information about using
 --------------------------

 Lists the available features for an image recipe. These features can be set
-in the :term:`IMAGE_FEATURES` variable.
+through either the :term:`IMAGE_FEATURES` or :term:`EXTRA_IMAGE_FEATURES` variables.

 .. _ref-tasks-listtasks:


