Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DA0CCD5BB3
	for <webhook@archiver.kernel.org>; Fri, 22 May 2026 16:16:02 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20311.1779466553488638881
 for <docs@lists.yoctoproject.org>;
 Fri, 22 May 2026 09:15:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=Z5g6wj70;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dZ/4g+rGoFHfKiKOY6AhJOVYP6SlsL6cZM5YlDN7qtU=; b=Z5g6wj70pRWxQu5yOUQZLOzbKH
	NmQKrmVFennOV5avRJ2wO1z3YhKA0vDFsyJWeimU+sBdNp3KoQNHt7eKxFBYSMQpArCng+AMbyF8o
	tVRmkYuYKIPunrgqd4JBM4EnXvS9UD1/OoH4R8VgHg7THKOP1Y5r+tXeocfkmcX+KY2cBnu8gWUkw
	XgA0MsksYPPpY7aqZwTkLBY3b/qYdXMy15Ik1QA4QEFxweBD5kxU3RV+rdgl2jgLiQJHjmEq6R2s/
	CA4IUnP/HP4Y9aWFPamp20DUWc7Rk7/xJGni9EMVQZv6jBCFgOZVOHLR1+kA1ogq8eiOLvw+JsfoN
	f1wrjI4g==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:53884 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wQSXO-00000005ntN-0t8N
	for docs@lists.yoctoproject.org;
	Fri, 22 May 2026 12:15:51 -0400
Date: Fri, 22 May 2026 12:19:17 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] ref-manual: clarify that PACKAGE_EXCLUDE supports DEB
 packaging
Message-ID: <cb7c2ab0-bf11-5fa5-5730-2776d56dad0d@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Fri, 22 May 2026 16:16:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9527


As an accompaniment to earlier commit
0d05dedd62a6d4c726f120a23654ede1f0b23d8e, correct that the
PACKAGE_EXCLUDE supports the DEB packaging backend.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index c65794229..2773e9864 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6927,8 +6927,8 @@ system and gives an overview of their function and contents.
       an iterative development process to remove specific components from a
       system.

-      This variable is supported only when using the IPK and RPM
-      packaging backends. DEB is not supported.
+      This variable is supported by all of the RPM, DEB and IPK
+      packaging backends.

       See the :term:`NO_RECOMMENDATIONS` and the
       :term:`BAD_RECOMMENDATIONS` variables for

