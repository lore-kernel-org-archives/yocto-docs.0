Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F4B5CD342F
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 19:05:58 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1973.1778267156797700751
 for <docs@lists.yoctoproject.org>;
 Fri, 08 May 2026 12:05:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=C68Hq2aN;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=C+kDjVfOwsfWRYjZ6oqd7Mg6mMTmkGLsfdEFJJOEhT0=; b=C68Hq2aNBNdX4ook2VPAkz6JJT
	M3cgwmQ3xvj17cNVMRsmieJZmTr2YRl/OSpZDiOrWrotb0TpgFzCyNiLqhltXNAiqD6c18LFWDYjz
	i1pvRbz0dnsQathaLDGyFEbrwikz6BNClyPqKF9kYixCIUDcABJWKFt+ivCawTZWiApycGIXVvU+8
	az4Z5zg1/XyKhfO6couEv/sQK8S6QgAwqf97gfhDe6bQetL5lwj5ZmIWNZBl7wFb8hCpaNITF9iHY
	dAy/v34WwgKhI+5kABn0uBdW+1AcvIcQm6F9M8q+jSEXM/6AY7TazGwMq/lBMGZSam9Prs3UDdhZn
	FYwrsE4Q==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:34812 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wLQWI-00000004Nb0-2RD9
	for docs@lists.yoctoproject.org;
	Fri, 08 May 2026 15:05:55 -0400
Date: Fri, 8 May 2026 15:08:44 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] YP Quick Build: delete extraneous periods in list
Message-ID: <f64194a3-9050-eb01-9f41-64b20b33019e@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Fri, 08 May 2026 19:05:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9419


Delete inconsistent periods in software versions list so it doesn't
look weird.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 7fbf92098..b4deed646 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -63,8 +63,8 @@ following requirements:

    -  Git &MIN_GIT_VERSION; or greater
    -  tar &MIN_TAR_VERSION; or greater
-   -  Python &MIN_PYTHON_VERSION; or greater.
-   -  gcc &MIN_GCC_VERSION; or greater.
+   -  Python &MIN_PYTHON_VERSION; or greater
+   -  gcc &MIN_GCC_VERSION; or greater
    -  GNU make &MIN_MAKE_VERSION; or greater

 If your build host does not satisfy all of the above version

