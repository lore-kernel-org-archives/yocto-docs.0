Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F638CD98E2
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 08:46:57 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10957.1781686011170155397
 for <docs@lists.yoctoproject.org>;
 Wed, 17 Jun 2026 01:46:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=PcF3PrFg;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Ys8eKbrmDX6ypIDYdO4/ked7hPK4xMPFlRCeVlVqswM=; b=PcF3PrFgejHOJIzUJlkVBpCZMP
	abCjjLbJEUr7Zv8rLka8dA/c/ApviaJqD4AnQs3eWLhTS7Q2MwlASDIyMLDiGvMcmiZ0ZFnlSZN5p
	BmTWpRtH/9Jce4RkOvEaIbpHNAj2744hogYtqGjgIM4/mJdO/io1PU+MsXmRdFHZ7bYdfoeDhjhxL
	V88sxXxgCH1youg2sd8IKm2EHYg0q1QXJa3uHl18GFT5iQpI3rX4sKiKJeA+Srhwsx+r3rl+541+U
	qQApwWT3R+TNXZtYTUjx8QVWRPnZaxCQmzmawbNa2f+oPTA3f5S0BP/iDoFsGNnr9HRxAkH5v+bkE
	8eMSc+rg==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:54018 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wZlv6-000000095sE-1RkB
	for docs@lists.yoctoproject.org;
	Wed, 17 Jun 2026 04:46:49 -0400
Date: Wed, 17 Jun 2026 04:46:44 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH v2] test-manual: add more detail to the ptest section
Message-ID: <4c6924c3-e8ef-9086-dad6-19220324b027@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Wed, 17 Jun 2026 08:46:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9769


Enhance the ptest section by:

  - distinguishing between adding all ptest packages to your
    image versus selecting the ones you want
  - mention "oe-pkgdata-util" utility for listing all available
    ptest packages in the local package feed

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/test-manual/ptest.rst b/documentation/test-manual/ptest.rst
index 1c946f81d..2edbbc4a3 100644
--- a/documentation/test-manual/ptest.rst
+++ b/documentation/test-manual/ptest.rst
@@ -31,17 +31,49 @@ see the :yocto_wiki:`Ptest </Ptest>` wiki page.
 Adding ptest to Your Build
 ==========================

-To add package testing to your build, add the :term:`DISTRO_FEATURES` and
-:term:`EXTRA_IMAGE_FEATURES` variables to your ``local.conf`` file, which
-is found in the :term:`Build Directory`::
+Adding package testing to your image is done in two steps:
+
+#. Select that all ptest packages should be built and packaged, and
+
+#. Identify which of those ptest packages to add to your image.
+
+First, in order to build all ptest packages, add the following line
+to a :term:`configuration file`::

    DISTRO_FEATURES:append = " ptest"
-   EXTRA_IMAGE_FEATURES += "ptest-pkgs"
+
+Note that this will cause all ptest packages to be built and packaged,
+but will not add any of those packages to your image; that comes in
+the next step. You can then add ptest packages to your image in one of two ways.
+
+#. If you want to add *all* of the generated ptest packages, add the line::
+
+      EXTRA_IMAGE_FEATURES += "ptest-pkgs"
+
+#. On the other hand, if you want to add only a select few of the ptest
+   packages, you can use some variation of::
+
+      IMAGE_INSTALL:append = " e2fsprogs-ptest zlib-ptest"

 Once your build is complete, the ptest files are installed into the
 ``/usr/lib/package/ptest`` directory within the image, where ``package``
 is the name of the package.

+.. note::
+
+   If you want to list all ptest packages currently available from
+   the local package feed that *could* be installed in your image
+   (not just the ones you're selecting), you can use the
+   ``oe-pkgdata-util`` command:
+
+   .. code-block:: console
+
+      oe-pkgdata-util list-pkgs "*-ptest"
+      acl-ptest
+      attr-ptest
+      bash-ptest
+      ... etc etc ...
+
 Running ptest
 =============


