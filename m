Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7052BCDB479
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 11:22:10 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9188.1782386525990263302
 for <docs@lists.yoctoproject.org>;
 Thu, 25 Jun 2026 04:22:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=BVSscbwz;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Q4YA6UzLMjyyvQR0I6c4RsbX+Drmrcebh/RlmWJtXYE=; b=BVSscbwzYdHPA04Q6b1dx9uQrG
	EP/y/x040neumbft9RydPNs6Dplpwhh/fox6AL7DKDrpCTQq839oZQeAbpvpmVEVmiHKbVxXi4Eal
	vRJ8j+1isEuUDkKe2Kv6b4y7t6GFGxjWSLT5++HiHR5FJUj8Y30xXbP5IpD2F9pYmyP42nx5VouMN
	ZtaAq9NbImP8kTlIt8mU7KrezAqTGCOQfKLHXw7z8R3npa57BkmYUTvsBf+Y2HYXh9kYczni1qs31
	B1/iM+GLe/KzvnoKGpG2fcHFp+g/xepGhiMOjrgrku6yj1raQ2tXWn83blFVhqyLffs9trTDt8Aom
	QFmyqL5g==;
Received: from bras-base-otwaon0916w-grc-51-67-71-147-190.dsl.bell.ca ([67.71.147.190]:50826 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wci9i-00000000Jt5-2BCk
	for docs@lists.yoctoproject.org;
	Thu, 25 Jun 2026 07:22:04 -0400
Date: Thu, 25 Jun 2026 07:21:56 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] test-manual: clarify that ptest-runner is added
 automatically
Message-ID: <8c5fe4ee-1826-c72c-17ba-891157a43b63@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Thu, 25 Jun 2026 11:22:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9897


Given that ptest-runner is referenced with RRECOMMENDS in
ptest.bbclass:

  RRECOMMENDS:${PN}-ptest += "ptest-runner"

clarify that it will automatically be added to an image as long as
some ptest package is included in the image.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/test-manual/ptest.rst b/documentation/test-manual/ptest.rst
index 4b91e6fc3..2b8672214 100644
--- a/documentation/test-manual/ptest.rst
+++ b/documentation/test-manual/ptest.rst
@@ -84,8 +84,8 @@ During the execution ``ptest-runner`` keeps count of total and failed
 ``ptests``. At end the execution summary is written to the console.
 If any of the ``run-ptest`` fails, ``ptest-runner`` returns '1'.

-Consequently, you might want to add ``ptest-runner`` to your image.
-
+The inclusion of any ptest packages in your image will automatically
+include ``ptest-runner`` in your image.

 Getting Your Package Ready
 ==========================

