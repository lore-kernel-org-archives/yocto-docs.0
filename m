Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CE4C108B8F3
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 10:46:37 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9793.1774003593740214232
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Mar 2026 03:46:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=BPMYzoWi;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4141C1A2F12;
	Fri, 20 Mar 2026 10:46:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 11BB2600E0;
	Fri, 20 Mar 2026 10:46:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4B6D710450B9F;
	Fri, 20 Mar 2026 11:46:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774003591; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wr3gKK8C3+3YMUgemRwWpA3mdWuXwrEjkhJjmhBHHXw=;
	b=BPMYzoWiWbMj6D9PosDtUPQfFXEKyssKhLB3ho9Je5ufUBMl6VR4pr5aN7UEJauDWBuv8+
	VA0WtdaOmSbVqBIdLLK86RMQo5dzmAkD/DC9AcFP3PLsER6CUWBJa5oCvifdWuydjnjrdb
	71OxECmgCbMLK8liVYnbLVracm5g44fqjT5VyjoyqLJtGEKkg2KXw99mTr9TdDY3+rH22u
	3l7ACVVE1cLAbJwKGPYFO72EEOPMwv9LRM0PBTuebf6gsEvgj8U0nj1G/lPzKliYXYamgE
	U/sPL9QW2IHMfBo8GipaXzJLNy8u/mci+idFxmp6eyew4aD2GEhT2bU3uc65wQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 20 Mar 2026 11:46:25 +0100
Subject: [PATCH v2 7/8] docs-wide: add warning on disabled NPM fetcher
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-release-notes-6-0-v2-7-1bdb1eb142ae@bootlin.com>
References: <20260320-release-notes-6-0-v2-0-1bdb1eb142ae@bootlin.com>
In-Reply-To: <20260320-release-notes-6-0-v2-0-1bdb1eb142ae@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3056;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=u89cmIklot7jXPnbKRUQnaM+aqlPXg3XAgpug6MKFc0=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpvSWBVgkWrzXfdzjWiGakhBw9ynm/98YhuA/Qn
 g6dBENCKm2JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCab0lgQAKCRDRgEFAKaOo
 NubDD/9b6bcuffGmg5HoU8O53ps5fstRfh4ZKuFvf75dULlECSBChq/9FKCsfYdDzkKUascxvZ6
 9TyeJS1b67SHAij0lysvMy7zT0HShgHcmipSdtUDLle+oowz3xzvRp6SG1aMt+1IQc/+PKVl5Hm
 oOnaXRn/DEpBjxATEc1Q8VjvqW/6DQUDZprR/tRzE8NrlEyx+M8Sw48Yf4g8a9yJ07zoQaVFlJe
 e/Brgy7jiy+XN7nMpaouhYdys7hm3bDSdA/mvC1R23PCmuOaiMYQnl0OmBcpWjaxZv38puUekiV
 YnibUqzfPzDFBSWFCoB6Iy3tqdfGa2MwGx1Gl5NwdBdBKXIPxVDvD8rNIKnoxCcVnPJoMiumNLF
 m0g6lq/U20x7yMHyl/bYsRttaBqUkWX+/qblA54VgNo3RAPfYOdSqS2iw1tonDSiS7Rq/78Qlde
 qF4wootXMNIcYJJAz8HZSx2LHu3l5OSbYjatKHEpuENKYtUmbPByhcG9D5SdGzpd+Jaqt0aTqs0
 ghwY/JdO7192gkrvwWdqmY/lRGDruPQQ8tEwbH4zUvN3RJZEs5OS4sbjUzDg8TkW2nmO6v9MmZY
 nN+4qyWXgwo7xc1KXG4g2SkVL1SajAc6GC2cF+/C+hcXXbKZy8c+h2w2OqrX+8ArpPjeQhBw/JK
 gIFgxZbaAW617QA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Mar 2026 10:46:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9108

The NPM fetcher was disabled with 355cd226e072 ("fetch2/npm/npmsw:
Disable npm and npmsw fetchers due to security concerns") in BitBake.
Add warning notes throughout the documentation to let readers know.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
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
2.53.0


