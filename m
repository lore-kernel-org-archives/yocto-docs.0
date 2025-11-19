Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F15BCF34AB
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 13:01:17 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6323.1763557275364148172
 for <docs@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 05:01:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=mh4K4Ml4;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=SYYWLj1z3x8BIvNG3a+slo9hu1U2yHyGXPBDfbicz14=; b=mh4K4Ml484F9Aupwu+huV9laHL
	wz7fMXwgrNEtTHFfFhnEqEIAHjkZL5Nq9ZHOZNv9YOLPLBgJG71inDYvQwgp1jHbQsQHvcgehhkrF
	TwvMGh9Ef8BRq8No4ZiW+K7RejVlh9hVs0SDBQ2Cp/yjYo09TirCxKXB/9M3kc85no54j4gzvYR/D
	ybM6eIYsIIg01zAiWZMn1Sx/ay/69fDv66npwsPHOZSqz8b4SRI8Ew2Q4A7un9SFgrIWMxZ/qwcYX
	sjwzFlB9iMgq/ccnjdW8bQlXTW/T2pIrjW0expaxpLbmhEo35gKI1surUWGRhcf3rW//1UT5/d2A9
	rx2YpsXA==;
Received: from [147.129.179.166] (port=42822 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vLho3-000000036JG-40Bz
	for docs@lists.yoctoproject.org;
	Wed, 19 Nov 2025 08:01:11 -0500
Date: Wed, 19 Nov 2025 08:01:47 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] brief-yoctoprojectqs: shorten and clarify required host
 packages
Message-ID: <8a97eda5-0b39-03dc-1e37-76031a747f46@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Wed, 19 Nov 2025 13:01:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8084


Rather than refer specifically to Ubuntu and show an example of
installing essential packages, just refer the reader to the page on
supported Linux distributions and leave it at that.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 211b6d70f..36acd655e 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -71,21 +71,14 @@ can still use the Yocto Project. See the
 :ref:`ref-manual/system-requirements:required git, tar, python, make and gcc versions`
 section in the Yocto Project Reference Manual for information.

-Build Host Packages
-===================
-
-You must install essential host packages on your build host. The
-following command installs the host packages based on an Ubuntu
-distribution:
-
-.. literalinclude:: ../tools/host_packages_scripts/ubuntu_essential.sh
-   :language: shell
-
-.. note::
-
-   For host package requirements on all supported Linux distributions,
-   see the :ref:`ref-manual/system-requirements:required packages for the build host`
-   section in the Yocto Project Reference Manual.
+Supported Linux Distributions and Required Host Packages
+========================================================
+
+Depending on your Linux distribution, you might have to install
+some essential packages on your build host.  For host package
+requirements on all supported Linux distributions, see the
+:ref:`ref-manual/system-requirements:required packages for the build host`
+section in the Yocto Project Reference Manual.

 Use Git to Clone bitbake-setup
 ==============================


