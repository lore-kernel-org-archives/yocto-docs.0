Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCD6ECD98E1
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 14:17:08 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.155542.1781619420429748392
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Jun 2026 07:17:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=NWcnjRok;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=eo9SjK4aR1Mn/oG9bnz/kzUZBrKoQAUwmXFANTha4mI=; b=NWcnjRokEaN11b0WT6BF4PEI32
	0tpBQ1lJnn0YQyzWvJgpheRSFaq6mq5eYIRR3kTSaOqQqOgGRy18o/cmffgj3nqpP6v3Bi9drrUT0
	SE3YKjMdRhLG6iAdFtRqnkHguFl48Gj+Eovququ5Y8BHDEq3GSjX/bdeRE0q3MWzSXFR4pZ2M8HmM
	AvUQxbr7aaRfGAaxEsCAjR++6IcRtCqHeOvwV+aLy6C5RIwYuD/bvU+vKi5BXYPjVTuG1N2fys9J8
	0HQsO0hhou/7PdsFyPk1vy42s3UphMvYKyFm3/W5AYWmuayIIu9HUGT7DW2UG6yMOrWZJPLTHbikI
	dk27/ijg==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:44362 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wZUb3-000000078dC-310K
	for docs@lists.yoctoproject.org;
	Tue, 16 Jun 2026 10:16:58 -0400
Date: Tue, 16 Jun 2026 10:16:54 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH v2] dev-manual: update bmap-tools package to refer to
 bmaptool
Message-ID: <f1851b98-7b99-e132-8ff1-a63a5e457089@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 16 Jun 2026 14:17:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9746


Update the bmaptool section to refer to the newer name of the package
"bmaptool", and add a note mentioning that the old name of
"bmap-tools" is a transitional package for this.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

commit e69f21e8a7aa97817d16b8961d68c0cef1c80540
Author: Robert P. J. Day <rpjday@crashcourse.ca>
Date:   Tue Jun 16 10:14:12 2026 -0400

    bmap

diff --git a/documentation/dev-manual/bmaptool.rst b/documentation/dev-manual/bmaptool.rst
index 87162a49c..0b3a20481 100644
--- a/documentation/dev-manual/bmaptool.rst
+++ b/documentation/dev-manual/bmaptool.rst
@@ -13,13 +13,13 @@ system image files much faster.
 .. note::

    -  If you are using Ubuntu or Debian distributions, you can install
-      the ``bmap-tools`` package using the following command and then
+      the ``bmaptool`` package using the following command and then
       use the tool without specifying ``PATH`` even from the root
       account::

-         $ sudo apt install bmap-tools
+         $ sudo apt install bmaptool

-   -  If you are unable to install the ``bmap-tools`` package, you will
+   -  If you are unable to install the ``bmaptool`` package, you will
       need to build `bmaptool` before using it. Use the following command::

          $ bitbake bmaptool-native -caddto_recipe_sysroot
@@ -56,3 +56,13 @@ For help on the ``bmaptool`` command, use the following command::

    $ bmaptool --help

+.. note::
+
+   Earlier releases of Ubuntu and Debian had a package named
+   ``bmap-tools``; you can still install by this name as this
+   is simply a transitional package which exists solely to
+   ensure backward compatibility and smooth upgrades from
+   older installations.
+
+   If you have this package installed, you can safely remove it
+   and install the newer ``bmaptool`` package.

