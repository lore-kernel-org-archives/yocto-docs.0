Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5600ACD98E4
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 16:22:26 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1725.1781626945141320387
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Jun 2026 09:22:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=RSjZTWyP;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ygNC5scPYyD89auwuGUaxC9wdIFms1RHCN3uXDP7n1Q=; b=RSjZTWyPsz787tJtflVvuJVfdR
	Hpi50xRjcu/hr45CeRtcsW8huMvv2SHQw6bZg1u1Bg/A9ogMvKueHjxLvnn2wB0rfKzccK8eLQZn9
	5pm6hOcNlTdtd49QCHfIlKuSHzAsb1qq1AA7pPeBrbsm3JjiPIjw75fHZDcn5CelceChXS2+Rh4J7
	hgYR3+pbq2n9an5fea7QLydziAnjyLcA2aElpdmUBJpAJ//wo/4zrQw0PhEprLrliTqm0ZBz216Zr
	rj27SL9t+pNlMsJ7ACjVm52xM9mGcP2KGz01ezlFFUowyjRXE2EWreYBZMXUZvwNKcmNXD3QA50sR
	eWLy42jg==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:55144 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wZWYQ-00000007NBU-26ei
	for docs@lists.yoctoproject.org;
	Tue, 16 Jun 2026 12:22:23 -0400
Date: Tue, 16 Jun 2026 12:22:16 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual: update bmaptool section, refer to "bmaptool"
 package
Message-ID: <b3901bb2-dbcc-3145-caec-c2dfb87f5dc9@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 16 Jun 2026 16:22:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9757


Update the section on "bmaptool" to use the newer "bmaptool" package
name rather than the older "bmap-tools" name (which still exists but
is simply a transitional package).

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/bmaptool.rst b/documentation/dev-manual/bmaptool.rst
index 87162a49c..29e7f0d2e 100644
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
@@ -56,3 +56,10 @@ For help on the ``bmaptool`` command, use the following command::

    $ bmaptool --help

+.. note::
+
+   Earlier releases of Ubuntu and Debian had a package named
+   ``bmap-tools``; you can still install by this name as this
+   is simply a transitional package which exists solely to
+   ensure backward compatibility and smooth upgrades from
+   older installations.

