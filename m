Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E42ACC54FB3
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 09:23:20 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.25247.1748251394442952639
 for <docs@lists.yoctoproject.org>;
 Mon, 26 May 2025 02:23:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=AInBFOM1;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kr/z2ZWFq8vvjOaNV6m7u31GjAAaAyTKqSH+Q0Rv0KU=; b=AInBFOM1OyjP0bwaphEOG448X6
	/EHpoKIB9J1okE2iKysw1zffxEY26gXZoWcvFjwGEXJJ9vvAcWEGLIMXR9yO54VmCh1nxdWay8KHV
	g+uAkZ8SSI7xmpZYkwBlnlou96CLpvB2G2MSTuGBbTQlxpSLA6JVFuBf/2cOGmlK1guoyz82BABE0
	O/62u4cq7wD4SHb5ybspqLJ83KO5reOWzEu+mmYiH2gSAcDs1gu6WHZie+Y/clRySX0XRFMrXBWiy
	sbdWrJeT5thmPKc/wi29y19L1EKYnBJbYaWCIJsz7M0SW2TzgCdbNfBKOKqjQWocUwZ/CbwvnDehL
	aQgPZSsg==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:51934 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uJU35-00000009aXW-0x7h
	for docs@lists.yoctoproject.org;
	Mon, 26 May 2025 05:23:13 -0400
Date: Mon, 26 May 2025 05:23:07 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [docs][PATCH] Simple cleanup of explanation of minimum version
 requirements
Message-ID: <727b1435-c923-6c06-c2df-e1ff35c8968c@crashcourse.ca>
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
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 26 May 2025 09:23:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6920


Trivial list rendering and grammar fixes.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 2f6e4cf02..a8d877a54 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -57,7 +57,7 @@ following requirements:
    :ref:`dev-manual/start:preparing the build host`
    section in the Yocto Project Development Tasks Manual.

--
+-  Ensure that the following utilities have these minimum version numbers:

    -  Git &MIN_GIT_VERSION; or greater
    -  tar &MIN_TAR_VERSION; or greater
@@ -65,7 +65,7 @@ following requirements:
    -  gcc &MIN_GCC_VERSION; or greater.
    -  GNU make &MIN_MAKE_VERSION; or greater

-If your build host does not meet any of these three listed version
+If your build host does not meet any of the above version
 requirements, you can take steps to prepare the system so that you
 can still use the Yocto Project. See the
 :ref:`ref-manual/system-requirements:required git, tar, python, make and gcc versions`

