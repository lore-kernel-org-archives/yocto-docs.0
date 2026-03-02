Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F4FBFEFB6B
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 09:38:13 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.156863.1772444285837630228
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 01:38:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=nW3215CO;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4F4894E424DB
	for <docs@lists.yoctoproject.org>; Mon,  2 Mar 2026 09:38:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 208C35FE89
	for <docs@lists.yoctoproject.org>; Mon,  2 Mar 2026 09:38:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 64C6910369502;
	Mon,  2 Mar 2026 10:38:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772444283; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=P7GiXGTnrGJIBYMzbXmqdLIALRB9e/XI9VGpBPE+qZs=;
	b=nW3215COm57mhOOTfTTsGzAvk9zzVcmLTcSL2xwVGjEm3ZPOzHv1Gc3sdaWcDwvgPH/TXC
	eRL/80+rtxPA0b/i+e19Aha5Oza5QiKUFxvrlvnak501F36kXSlvxV3DOci77Xa1ef/W4u
	QqWc5WG7ed1e3n9xtcUIyjzobw9PZ2Dr2RWBEuQFOq+Qo2p3AHVAZ/MPkOkS9DpP00+pW4
	J5dakIr1Ou7nucMQFHH1sJfy/XQfIHFx98iEgLoj4L3oenNX4jHVMXQAN7bLIqhlRToiZ2
	c4vqp7ePo2KNP3fgeEk3hFgjdJJ1U6rr09PRxQiPOxWifbaAdFTuQOVzFd2Amw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 02 Mar 2026 10:37:54 +0100
Subject: [PATCH 7/8] docs-wide: add warning on disabled NPM fetcher
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-release-notes-6-0-v1-7-9662dee58591@bootlin.com>
References: <20260302-release-notes-6-0-v1-0-9662dee58591@bootlin.com>
In-Reply-To: <20260302-release-notes-6-0-v1-0-9662dee58591@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3000;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=T2ajLSey6AXdaQt0tM0ewG4BU8NmP5qqZH63Igm3yqk=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBppVp2eBu4SRoDobJL9PFGfGWAoLl2n989DvhIx
 xhSvP0ipLqJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaaVadgAKCRDRgEFAKaOo
 Njm1D/9QmmJW53XCMgks/h+j3y2Tvlf5z7XAcYyuU/UHUbt+bqdBzWSJ4n/SO9zc6PP3yrchrKo
 fnynBh+zu9kmBWse1gGkbvcoVRQNIUNt1PR1FmqLu1KyY9d5eDqo9PQ2rNq5sbFl/yy57nSGrX/
 R/AgmghRxG1w45qvzACmar1ngM1a3NIaOTsNbQmfG4VlmBVYEqHZuYGOJV0d7Av7zPLYLMeTU0y
 Ey4qkwHV7PokypDzVVCc8TYwCHYyE+CBqW8oscr0jlhLghAb5uUSjfXEPg3mGtj/bSNOtHl4doF
 FBDpsM6D9jLdmpxIginBc+H2wo9CuwQAGP3YSoUSjkBEWVj3UtN5XoZey7p+cy9TN4iraMBVjJo
 ZdDOr9b6HuJohAf6RXZUHFywRUztl2gGA/1Rj8KPqWI858lrQa3IM/LpmK9K+YjXXz6vRdB/iEE
 R/pF78HNCqm54+9zUZd7GErEcpqUl5rv0GM7v0WfkxJjul37ueKApn2GjjQBPqM1MxyNqLliBhP
 vunZPLUO+mTItR9sfp1Bxi4vXTf4tD+lpB/lUaqcruvs7gf7vXhdXWI17/MB2o0GdHPitHRBUGA
 QDWDiZACTwOAH9kd1cftfE2MEKr6ndXqbWDrQlqos+u5pa5WneendogW/mzURzEGLc4r5wHJcKH
 uqHLlAr/BgEIFnw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 02 Mar 2026 09:38:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9024

The NPM fetcher was disabled with 355cd226e072 ("fetch2/npm/npmsw:
Disable npm and npmsw fetchers due to security concerns") in BitBake.
Add warning notes throughout the documentation to let readers know.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/devtool.rst  |  5 +++++
 documentation/dev-manual/packages.rst | 10 +++++++++-
 documentation/ref-manual/classes.rst  |  5 +++++
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/documentation/dev-manual/devtool.rst b/documentation/dev-manual/devtool.rst
index c82dc9c33..08d4ffa9d 100644
--- a/documentation/dev-manual/devtool.rst
+++ b/documentation/dev-manual/devtool.rst
@@ -1111,6 +1111,11 @@ the following methods when you run ``devtool add``:
 Adding Node.js Modules
 ----------------------
 
+.. warning::
+
+   The NPM fetcher is currently disabled due to security concerns. See
+   :bitbake_rev:`355cd226e072` for more information.
+
 You can use the ``devtool add`` command two different ways to add
 Node.js modules: through ``npm`` or from a repository or local source.
 
diff --git a/documentation/dev-manual/packages.rst b/documentation/dev-manual/packages.rst
index 4c94ffd48..b3c9408b0 100644
--- a/documentation/dev-manual/packages.rst
+++ b/documentation/dev-manual/packages.rst
@@ -18,7 +18,7 @@ This section describes a few tasks that involve packages:
 -  :ref:`Setting up and running package test
    (ptest) <test-manual/ptest:testing packages with ptest>`
 
--  :ref:`dev-manual/packages:creating node package manager (npm) packages`
+-  (**disabled**) :ref:`dev-manual/packages:creating node package manager (npm) packages`
 
 -  :ref:`dev-manual/packages:adding custom metadata to packages`
 
@@ -914,6 +914,14 @@ Yocto Project Test Environment Manual.
 Creating Node Package Manager (NPM) Packages
 ============================================
 
+.. warning::
+
+   The NPM fetcher is currently disabled due to security concerns. See
+   :bitbake_rev:`355cd226e072` for more information.
+
+   This section is left there if it is re-enabled in the future, but is
+   currently obsolete.
+
 :wikipedia:`NPM <Npm_(software)>` is a package manager for the JavaScript
 programming language. The Yocto Project supports the NPM
 :ref:`fetcher <bitbake-user-manual/bitbake-user-manual-fetching:fetchers>`.
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index dc131be9f..053e5dd11 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1891,6 +1891,11 @@ generation provided by :ref:`ref-classes-create-spdx`.
 ``npm``
 =======
 
+.. warning::
+
+   The NPM fetcher is currently disabled due to security concerns. See
+   :bitbake_rev:`355cd226e072` for more information.
+
 Provides support for building Node.js software fetched using the
 :wikipedia:`node package manager (NPM) <Npm_(software)>`.
 

-- 
2.52.0


