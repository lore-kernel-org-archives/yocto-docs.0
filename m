Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24F53CD98D5
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 11:39:50 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43383.1781177983666158813
 for <docs@lists.yoctoproject.org>;
 Thu, 11 Jun 2026 04:39:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=UxeQrCwD;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xOMIDptLc/rSobRq5nZ5LbzzIAZSo1Ca2ioRUT4oAj8=; b=UxeQrCwDtogm/xiG2RGX175Ugb
	+iOCwpd0c/yIrZb3828FgEXUhI/3wWifNHfSrvFLpdPX3pN8JfZ4KsQGrbs5cxJ8fmOz8iD44XEx6
	bMtLL/1vJNBbChLGG7Iy4/M4qfZXzGGFtHYYU4QakTO7qtDgKyOq+k5tf6GTe4XIexm0CEHP/+XtI
	ni5k1DrVjAzESowR+asl1dggquC/Fg7QrlXtVuJgr2+aIAwyVJokQs9vp5Rp+IDonN/DwhOQLhd9C
	epbtbnGLEBgFkQG2ILRfvY1PwV4jl8Zrq06fAqred5IzDCjTgqcBo4Ro9YKxX2otki5DEYAWjT4jA
	fWZtz+bw==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:54476 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wXdl7-0000000BTKQ-0s2J
	for docs@lists.yoctoproject.org;
	Thu, 11 Jun 2026 07:39:41 -0400
Date: Thu, 11 Jun 2026 07:39:34 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual: fully define SOLIBS-related variables in
 bitbake.conf
Message-ID: <cb56b55a-6a0d-754e-a97c-a92c7780ab42@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Thu, 11 Jun 2026 11:39:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9694


The current (abridged) SOLIBS-related variables were not included in
their entirety so add the missing content.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/prebuilt-libraries.rst b/documentation/dev-manual/prebuilt-libraries.rst
index 59621ca16..9cc8bd2d9 100644
--- a/documentation/dev-manual/prebuilt-libraries.rst
+++ b/documentation/dev-manual/prebuilt-libraries.rst
@@ -153,8 +153,8 @@ default :term:`FILES` variables in ``bitbake.conf`` are::

    SOLIBS = ".so.*"
    SOLIBSDEV = ".so"
-   FILES:${PN} = "... ${libdir}/lib*${SOLIBS} ..."
-   FILES_SOLIBSDEV ?= "... ${libdir}/lib*${SOLIBSDEV} ..."
+   FILES:${PN} = "... ${libdir}/lib*${SOLIBS} ... ${base_libdir}/*${SOLIBS} ..."
+   FILES_SOLIBSDEV ?= "${base_libdir}/lib*${SOLIBSDEV} ${libdir}/lib*${SOLIBSDEV}"
    FILES:${PN}-dev = "... ${FILES_SOLIBSDEV} ..."

 :term:`SOLIBS` defines a pattern that matches real shared object libraries.

