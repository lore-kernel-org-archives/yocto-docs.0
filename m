Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 374C1C4332F
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 10:29:50 +0000 (UTC)
Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web08.10417.1636453789358415056
 for <docs@lists.yoctoproject.org>;
 Tue, 09 Nov 2021 02:29:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com
 ([174.114.107.13]:53148 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mkONv-0002ly-Eb
	for docs@lists.yoctoproject.org; Tue, 09 Nov 2021 05:29:47 -0500
Date: Tue, 9 Nov 2021 05:29:44 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] ref-manual: generalize definition of "container layer"
Message-ID: <ff564054-a080-8b5d-4b4f-cda0976188d@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id:
 rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 09 Nov 2021 10:29:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2107


Given that there seems to be little value in being excruciatingly
pedantic about whether a container layer has a valid layer as a
top-level directory, expand the definition to allow either.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index eccae91a1..89b140e3f 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -134,10 +134,27 @@ universal, the list includes them just in case:
       the Texas Instruments ARM Cortex-A8 development board).

    :term:`Container Layer`
-      Layers that hold other layers. An example of a container layer is
-      OpenEmbedded's `meta-openembedded
-      <https://github.com/openembedded/meta-openembedded>`_ layer. The
-      ``meta-openembedded`` layer contains many ``meta-*`` layers.
+      A flexible definition that typically refers to a single Git checkout
+      which contains multiple (and typically related) sub-layers which can
+      be included independently in your project's ``bblayers.conf`` file.
+
+      In some cases, such as with OpenEmbedded's
+      `meta-openembedded <https://github.com/openembedded/meta-openembedded>`_
+      layer, the top level ``meta-openembedded/`` directory is not itself an actual layer,
+      so you would never explicitly include it in a ``bblayers.conf`` file;
+      rather, you would include any number of its layer subdirectories, such as
+      `meta-openembedded/meta-oe <https://github.com/openembedded/meta-openembedded/tree/master/meta-oe>`_,
+      `meta-openembedded/meta-python <https://github.com/openembedded/meta-openembedded/tree/master/meta-python>`_
+      and so on.
+
+      On the other hand, some container layers (such as
+      `meta-security <https://git.yoctoproject.org/cgit/cgit.cgi/meta-security>`_)
+      have a top-level directory that is itself an actual layer, as well as
+      a variety of sub-layers, both of which could be included in your
+      ``bblayers.conf`` file.
+
+      In either case, the phrase "container layer" is simply used to describe
+      a directory structure which contains multiple valid OpenEmbedded layers.

    :term:`Cross-Development Toolchain`
       In general, a cross-development toolchain is a collection of software

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

