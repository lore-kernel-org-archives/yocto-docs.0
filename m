Return-Path: <othacehe@gnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EEE2C0219B
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 16:13:16 +0000 (UTC)
Received: from eggs.gnu.org (eggs.gnu.org [209.51.188.92])
 by mx.groups.io with SMTP id smtpd.web10.3154.1739290393346017447
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Feb 2025 08:13:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gnu.org header.s=fencepost-gnu-org header.b=PxoEF41E;
 spf=pass (domain: gnu.org, ip: 209.51.188.92, mailfrom: othacehe@gnu.org)
Received: from fencepost.gnu.org ([2001:470:142:3::e])
	by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.90_1)
	(envelope-from <othacehe@gnu.org>)
	id 1thssq-0000vu-FZ; Tue, 11 Feb 2025 11:13:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gnu.org;
	s=fencepost-gnu-org; h=MIME-Version:References:In-Reply-To:Date:Subject:To:
	From; bh=NSUgvj9WobfksG9HJtNvy5FrOegMm5ZWwfW3kuy8OAg=; b=PxoEF41EFE/Id8AytnRb
	wWY41YIwlVhRAKzZ+dR0STBZm462RxEVmmEUeqVZFpFoHZlHKoRmqJvrovRTcGBWsdSjPqd4Ny52A
	tD6rXKelCMIqohTfbt8tBL9rm43v86j6Bd2PcXA3XvR+QI2otZiWA3eylhwkFW7ZW4E05orplOTZ4
	Lpd4WuxpaAomg3ZnMGP0ZWmsf5U0lakTDxA2a166FgD0TRBOexrcFrukoTI8fMWO8UsbvvjxING3g
	XQtJITLBOSwS4Ap431355/LYDADbbwNdcKJJ/Hw+iPTMtVXJpV7T4s36hR+Ixn/FFzCCBRIRPuVs0
	MvnCy7ca7JW36A==;
From: Mathieu Othacehe <othacehe@gnu.org>
To: docs@lists.yoctoproject.org
Cc: Antonin Godard <antonin.godard@bootlin.com>,
	Mathieu Othacehe <othacehe@gnu.org>
Subject: [PATCH v3 1/2] profile-manual: Document the PACKAGE_KEEP_DEBUG_FRAME variable.
Date: Tue, 11 Feb 2025 17:12:38 +0100
Message-ID: <20250211161239.5396-2-othacehe@gnu.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250211161239.5396-1-othacehe@gnu.org>
References: <20250211161239.5396-1-othacehe@gnu.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Feb 2025 16:13:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6336

Document the 'PACKAGE_KEEP_DEBUG_FRAME' variable that can be used to keep the
.debug_frame ELF section when stripping.

By using libunwind + minidebuginfo, that provides a way for users to get
debug_frame based backtraces on target.

Signed-off-by: Mathieu Othacehe <othacehe@gnu.org>
---
 documentation/ref-manual/variables.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 47d4e814f..f5bd7b353 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6243,6 +6243,15 @@ system and gives an overview of their function and contents.
       install, the build system does not generate an error. This variable
       is generally not user-defined.
 
+   :term:`PACKAGE_KEEP_DEBUG_FRAME`
+      Keep the ``.debug_frame`` ELF section when stripping during package
+      creation. You can set this variable in your ``local.conf`` file::
+
+        PACKAGE_KEEP_DEBUG_FRAME = "1"
+
+      That will result in passing the ``--keep-section=.debug_frame`` argument
+      to the ``strip`` command.
+
    :term:`PACKAGE_PREPROCESS_FUNCS`
       Specifies a list of functions run to pre-process the
       :term:`PKGD` directory prior to splitting the files out
-- 
2.47.1


