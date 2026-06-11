Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59FFCCD98C7
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 08:31:21 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40799.1781166678708469941
 for <docs@lists.yoctoproject.org>;
 Thu, 11 Jun 2026 01:31:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=i8JvWh1s;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3/hbaaMpBM/JHQi5aRgewf75dlm7gOQ6LCva2lBCVgM=; b=i8JvWh1sK85hfVsHqNQVNcBii7
	qgToJcg4spZMJNUjQReictFSGbfbHJAkHKh5SBKWqNlWvQv2X4uRXGxzNB8KGs3XoHv5LWCpuzHqT
	cVo/LsNesLRiUNKo9VpCKOR885wjsB00STMvxvXxW8iOx3EPanEIf/UV65mZxDP1FQ0e+liWgCEKt
	4UsFJ4fEJhAKffcIlE67AFs+NtQaRyZR3rimPIwtOsRDfpqF3T7BGQJqVGQoc+lOIsmJEjl43BEZ2
	rYRFzYmi+arvewVrzytT97Sm6sLWD2EoyTx7fxxFM6oGFUgY5ei6Pe19DS2lznQ4qGEdpPYvAcglS
	B1pA8eRQ==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:56068 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wXaol-0000000BA02-2X2M
	for docs@lists.yoctoproject.org;
	Thu, 11 Jun 2026 04:31:16 -0400
Date: Thu, 11 Jun 2026 04:31:13 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual: fix grammatical error, missing word "with"
Message-ID: <a1d31ebe-dd6b-ce3f-f1da-4dea86f02010@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Thu, 11 Jun 2026 08:31:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9689


Add the missing word "with."

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/building.rst b/documentation/dev-manual/building.rst
index 9983c7939..c8bb31b92 100644
--- a/documentation/dev-manual/building.rst
+++ b/documentation/dev-manual/building.rst
@@ -744,7 +744,7 @@ Replicating a Build Offline
 It can be useful to take a "snapshot" of upstream sources used in a
 build and then use that "snapshot" later to replicate the build offline.
 To do so, you need to first prepare and populate your downloads
-directory your "snapshot" of files. Once your downloads directory is
+directory with your "snapshot" of files. Once your downloads directory is
 ready, you can use it at any time and from any machine to replicate your
 build.


