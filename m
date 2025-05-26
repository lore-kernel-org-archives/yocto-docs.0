Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D779C5AE59
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 10:49:11 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.26115.1748256546780527174
 for <docs@lists.yoctoproject.org>;
 Mon, 26 May 2025 03:49:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=HvETfeKa;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JYdFi7lnpautiSLoz4Jva3ZvstcZzngeMn/QZ7GBCPc=; b=HvETfeKaHz6ui5DtD0cD1Gc2dj
	JuJduCAWIaUSm3VY9J0SrDBwUvDm4Y5lGqEMMoBh2SyKva2gBUHaZX90jlNIdsmFLmxWfCMW8GQrB
	UMesYL3ecPYcxpNNpPaA7M9DfNywF8QU56ZHrLW9R6gxsrFKYVPDDDrM4/GC6jnF5B/x/WldcDKA0
	CpZ+QS7wlURjXxaIssOKidixGRYgDlTb/jZGdN5K2KyECg9FZjL4VFA16n5D2lIu4xqiP9h4Qz+nl
	BQaFn9jXWU2px73RtWwf/uFdlN16qTnCCObNuvN6UkX1rokCFVImqqjTwbwZrj9Lsvz7ZmQTLwikb
	1nMJR/KA==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:42966 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uJVOB-00000009lun-1TgU
	for docs@lists.yoctoproject.org;
	Mon, 26 May 2025 06:49:05 -0400
Date: Mon, 26 May 2025 06:48:59 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [docs][PATCH] Add an introductory section on how to use site.conf
 file
Message-ID: <27c9b177-1e6f-4be3-9ecc-312d0f133fb0@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Mon, 26 May 2025 10:49:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6925

It's useful for beginners to appreciate the value of site.conf.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 2f6e4cf02..2073e861a 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -290,6 +290,39 @@ an entire Linux distribution, including the toolchain, from source.
 #. **Exit QEMU:** Exit QEMU by either clicking on the shutdown icon or by typing
    ``Ctrl-C`` in the QEMU transcript window from which you evoked QEMU.

+Reducing duplication by using a global "site.conf" file
+=======================================================
+
+As you start building multiple images, you will probably notice that you are frequently
+adding a lot of common content to the new ``local.conf`` in each build directory;
+this can get tedious and repetitive, but there is a way to centralize all of that
+common content and pull it into each of your new builds.
+
+If your build's ``conf/`` directory contains a file named ``site.conf``, that file
+will be included in the build's processing before the ``local.conf`` file; this
+means you can create a single ``site.conf`` file somewhere outside of your build
+directories and, after creating a new build directory, you can either copy or
+symlink that file into the ``conf/`` directory, where its contents will be processed
+before that build's ``local.conf`` (so that you can always set build-specific configuration
+in ``local.conf`` which will override the more general settings).
+
+As a simple example, here's a ``site.conf`` file that will configure, for each
+build that includes it, settings for a local mirror, that all your builds will
+be based on ``systemd``, and that you want to build ``.deb`` packages for each build::
+
+  SCONF_VERSION = "1"
+  SOURCE_MIRROR_URL ?= "file:///(where downloaded tarballs are)"
+  INHERIT += "own-mirrors"
+  BB_GENERATE_MIRROR_TARBALLS = "1"
+
+  INIT_MANAGER = "systemd"
+
+  PACKAGE_CLASSES = "package_deb"
+
+Again, if a ``site.conf`` file exists, it will be processed before that build's
+``local.conf`` file, so that any build is free to override ``site.conf`` settings
+with any build-specific settings in ``local.conf``.
+
 Customizing Your Build for Specific Hardware
 ============================================


