Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1790CF3966
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 16:55:59 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12021.1763571349432072277
 for <docs@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 08:55:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=UGB/EYCW;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=liCf6CF11BMHfIzn+Ll3ZOeqMDtOPy2bB4+8TeZHq4Y=; b=UGB/EYCWrBUZQ1Zj9JnB+rihh+
	ui1OsJyENy1GRrUNtlRaBwyz9mwbooiE2aiyNZGXR1mAvHSVmSzx+t6RUfchxO0eUqM/OOSs1VV/C
	4VHwUEkct1Gn4aY+GZfD8a8W9fNhcDbXww8e0PK+VdhY8PGEO51YbDJPY1vnI4wKbumUKxOAfpQpW
	JcyJhOZsasccZjcbkoVYBr7z+0wVOoC/o1RLn1npr/VTd7TtxnsmNKfnaDH4/YOhWam4GpXO6Er97
	eaR6TewNRq6uLDjc1YJi0I0Q3nODreZtFPDV9nm7RPzBGAKHVURh4iUJTxmM8rJ7CXEKHaLAbPX4A
	EE0I1ifA==;
Received: from [147.129.179.166] (port=46868 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vLlT7-00000003fwc-1Gnf
	for docs@lists.yoctoproject.org;
	Wed, 19 Nov 2025 11:55:47 -0500
Date: Wed, 19 Nov 2025 11:56:23 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH v2] brief-yoctoprojectqs: shorten and clarify required host
 packages
Message-ID: <77d4de56-c700-9ae8-f03f-ede89df13e62@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Wed, 19 Nov 2025 16:55:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8097


Rather than refer specifically to Ubuntu and show an example of
installing essential packages, just refer the reader to the page on
supported Linux distributions and leave it at that.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 07bb4e1ca..76b72e9b5 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -15,7 +15,7 @@ build a reference embedded OS called Poky.
 .. note::

    -  The examples in this paper assume you are using a native Linux
-      system running a recent Ubuntu Linux distribution. If the machine
+      system running a supported Linux distribution. If the machine
       you want to use Yocto Project on to build an image
       (:term:`Build Host`) is not
       a native Linux system, you can still perform these steps by using
@@ -71,21 +71,12 @@ can still use the Yocto Project. See the
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
+Supported Linux Distributions and Required Host Packages
+========================================================

-   For host package requirements on all supported Linux distributions,
-   see the :ref:`ref-manual/system-requirements:required packages for the build host`
-   section in the Yocto Project Reference Manual.
+For host package requirements on all supported Linux distributions,
+see the :ref:`ref-manual/system-requirements:required packages for the build host`
+section in the Yocto Project Reference Manual.

 Use Git to Clone bitbake-setup
 ==============================

