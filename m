Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 501DCF4BB65
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 17:30:45 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25852.1771954237039370833
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Feb 2026 09:30:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=dJ2KjgOE;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jUiSpHhrIcmMwFdWI8Qq9q6CwHEYqifuPTYFpdt458s=; b=dJ2KjgOESecs66JaUDdmXe/8pZ
	NWsVgMH1iXawFdUmmUMviSgebAXc0GsLTM1gd5zzG7wuhGzRUr75Iex5jJQ5u6u7eo4bQA/0vjDfg
	nGn9gWTRRQ1vQ9rRMuzorrmPK+2kI161IT144jFega+RwX2xXoO01b+1c8tfI/wDnp+9e3+CW3mUD
	vohdlZSaDpUM2Q6F0NsXGXnYl2k3Q2GNA1mQ1Qp5agSffWZEIhlIKhdv8etpCXm56lAZGjc9i46DX
	cwLf7C11KvxK1aRxcMFX7zvu8cEduak8KHLKq4uzprfG2fXMNyB39Qi+fkeL3av3gxIzQ1ueF9yda
	LgXy8jkA==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:56478 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vuwF1-0000000054V-35Mu
	for docs@lists.yoctoproject.org;
	Tue, 24 Feb 2026 12:30:36 -0500
Date: Tue, 24 Feb 2026 12:32:53 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual: delete references to "tar" package format
Message-ID: <a18346b3-9fc5-59c2-a016-bf57ad06048a@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 24 Feb 2026 17:30:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8982


There is no "tar" packaging format anymore, so delete these
references.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/packages.rst b/documentation/dev-manual/packages.rst
index a7c95a16e..4c94ffd48 100644
--- a/documentation/dev-manual/packages.rst
+++ b/documentation/dev-manual/packages.rst
@@ -565,12 +565,12 @@ variable to specify the format:

       PACKAGE_CLASSES ?= "package_packageformat"

-   where packageformat can be "ipk", "rpm",
-   "deb", or "tar" which are the supported package formats.
+   where packageformat can be "ipk", "rpm", or
+   "deb" which are the supported package formats.

    .. note::

-      Because the Yocto Project supports four different package formats,
+      Because the Yocto Project supports three different package formats,
       you can set the variable with more than one argument. However, the
       OpenEmbedded build system only uses the first argument when
       creating an image or Software Development Kit (SDK).

