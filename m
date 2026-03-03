Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F03C4EC1450
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 13:47:38 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18565.1772545649700984098
 for <docs@lists.yoctoproject.org>;
 Tue, 03 Mar 2026 05:47:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=ENAKVN9C;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=oZHZ7wNIhuK7x1cnkJZA4Z96UfFl3VpDFXM78bGrHAA=; b=ENAKVN9CUmzMw43gv3hHUlQ8Nb
	k+b1/yq7EEd1S5r7be8qTE+rfk60KHb98XJqyVX516XGSwAtcCW8RKWls1JpMnoB+HcZBFU8T9YBd
	0N4YSxwUFAVjLyc32L7Cj+VaLnCo69S7gaTH/6bxZ3utiJde7ZSqzHulbiLwWU4Uz//yD582zVRSs
	G6M16i4rEtgFkbRU44IaHwR7Xq6eYA0lmhKTpQoIkQMskJtIHidtLcJrlWuPHvi9Ht5WNhcJOwQVs
	kfiRYL9RMLT0Rc1S5HyaEVyo++dfbTJRgENIZSAgvpGT0XHuJNdK7+7SVYByukEr+u1RL1E6XNhi5
	7q7M2STw==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:56016 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vxQ5v-00000001HGc-0Q60
	for docs@lists.yoctoproject.org;
	Tue, 03 Mar 2026 08:47:28 -0500
Date: Tue, 3 Mar 2026 08:46:57 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] ref-manual: delete claim PACKAGE_EXCLUDE does not support
 .deb
Message-ID: <095c8524-27d0-9a44-f1a3-63079c9ba360@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 03 Mar 2026 13:47:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9050


The current explanation of "PACKAGE_EXCLUDE" claims that this
variable does not support .deb packaging; this is incorrect.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 45073d8a0..9e0c5b083 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -300,9 +300,6 @@ system and gives an overview of their function and contents.
       variable), the OpenEmbedded build system ignores your request and
       will install the packages to avoid dependency errors.

-      This variable is supported only when using the IPK and RPM
-      packaging backends. DEB is not supported.
-
       See the :term:`NO_RECOMMENDATIONS` and the
       :term:`PACKAGE_EXCLUDE` variables for related
       information.

