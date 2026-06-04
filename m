Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9B3CCD6E77
	for <webhook@archiver.kernel.org>; Thu,  4 Jun 2026 16:35:15 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15926.1780590906677751079
 for <docs@lists.yoctoproject.org>;
 Thu, 04 Jun 2026 09:35:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=MopKUULA;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=FG61A89hKC4iDNj0dXzSor0Jkx4TVNuSkXYxSMgzNdI=; b=MopKUULA4CqhE/IalNUzgZIWL8
	teeGTRoEGfYCqB6q1QanC1aSoNoT5JxeNOZD0Z/b1dFVMuWrQrvQf31FZffAbiop4yDBYdo/vAoa1
	qk7IyQVLGbvTMvewzpbImGQ2aDx0VwW9vmLrMFQH9wjc6utXjGFRDS56fHoutErU+bgFXY+SKdx1U
	qhbtC7nMWFXBHZubdwN+BSewpA2IpmVLoEwp3rt7c82U5ljtQhenQ5Gq2akW3gFQYV/SPVFRkctNa
	asKzQ/y6np+mIznPjKF7YObCoosg/IC4rBpiSgm4on5d26EycUWSufbzh1Apzy6P8a6KRyCXS0rbR
	QHZs8rZw==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:33376 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wVB25-0000000Bc0n-3UZF
	for docs@lists.yoctoproject.org;
	Thu, 04 Jun 2026 12:35:04 -0400
Date: Thu, 4 Jun 2026 12:35:06 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] overview-manual: use correct spelling "counterpart"
Message-ID: <9c30130c-e27a-b6b5-2b40-f4de9cbd0723@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Thu, 04 Jun 2026 16:35:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9583


"counterpart" is one word, not two -- this is the only example in all
the docs that needed fixing.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 76ace6fcf..1afd5641d 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -1117,7 +1117,7 @@ host part is the part of the SDK that runs on the
 :term:`SDKMACHINE`.

 The :ref:`ref-tasks-populate_sdk_ext` task helps create the extensible SDK and
-handles host and target parts differently than its counter part does for
+handles host and target parts differently than its counterpart does for
 the standard SDK. For the extensible SDK, the task encapsulates the
 build system, which includes everything needed (host and target) for the
 SDK.

