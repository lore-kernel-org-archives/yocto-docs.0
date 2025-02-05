Return-Path: <othacehe@gnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C57D1C02198
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 15:51:38 +0000 (UTC)
Received: from eggs.gnu.org (eggs.gnu.org [209.51.188.92])
 by mx.groups.io with SMTP id smtpd.web11.15472.1738770693193186231
 for <docs@lists.yoctoproject.org>;
 Wed, 05 Feb 2025 07:51:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gnu.org header.s=fencepost-gnu-org header.b=kSUsnE93;
 spf=pass (domain: gnu.org, ip: 209.51.188.92, mailfrom: othacehe@gnu.org)
Received: from fencepost.gnu.org ([2001:470:142:3::e])
	by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.90_1)
	(envelope-from <othacehe@gnu.org>)
	id 1tfhga-00006S-11; Wed, 05 Feb 2025 10:51:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gnu.org;
	s=fencepost-gnu-org; h=MIME-Version:References:In-Reply-To:Date:Subject:To:
	From; bh=9kCa07w9rtzzSaXHJWbJSbj1jVgJN79JlJMnI63/vsA=; b=kSUsnE93I8wVm+3El3l8
	p7h4MWmqf8mAmh8LDeph+t8eDQfLMoUn8tJ7PLORQhnUPQRBbZxyDhxgAdyJ80UygVxxm3lR37Dt6
	WNx6/w772kJAfRTMFVzSKXCBb1XIU/eB3aQkVwXy4Mu7EnS2Tu1f9OniYoFyW7f+ZAt1A56kAalz4
	yGKXQacXaGnsnIjctU1FYLFd4JV5/PZYoZvyRLOmT74zIzn0RO6lojv4hOUsxT6vBF1q9LOjlFF27
	rNMWqjJXzVqwK000ZyV7W2KUmio2mNMLcBScHxsYRFWDMvRFPbrd+JSiFxiGM6epxqsSje4pjfdfn
	cYhJY4LhcYd9Qg==;
From: Mathieu Othacehe <othacehe@gnu.org>
To: docs@lists.yoctoproject.org
Cc: Antonin Godard <antonin.godard@bootlin.com>,
	Mathieu Othacehe <othacehe@gnu.org>
Subject: [PATCH v2 1/2] profile-manual: Document the PACKAGE_KEEP_SECTIONS variable.
Date: Wed,  5 Feb 2025 16:49:56 +0100
Message-ID: <20250205154957.24148-2-othacehe@gnu.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250205154957.24148-1-othacehe@gnu.org>
References: <20250205154957.24148-1-othacehe@gnu.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 05 Feb 2025 15:51:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6251

Document the 'PACKAGE_KEEP_SECTIONS' variable that can be used to keep some
specific ELF sections while stripping binaries and libraries.

That one can then be used to keep the .debug_frame section around for
example, this way:

PACKAGE_KEEP_SECTIONS = ".debug_frame"

By using libunwind + minidebuginfo, that provides a way for users to get
debug_frame based backtraces on target.

Signed-off-by: Mathieu Othacehe <othacehe@gnu.org>
---
 documentation/profile-manual/intro.rst |  6 ++++++
 documentation/ref-manual/variables.rst | 12 ++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/documentation/profile-manual/intro.rst b/documentation/profile-manual/intro.rst
index 317912552..a7243c1ca 100644
--- a/documentation/profile-manual/intro.rst
+++ b/documentation/profile-manual/intro.rst
@@ -75,3 +75,9 @@ Additionally, in order to generate the right type of debug info, we also need to
 set :term:`PACKAGE_DEBUG_SPLIT_STYLE` in the ``local.conf`` file::
 
    PACKAGE_DEBUG_SPLIT_STYLE = 'debug-file-directory'
+
+When you are building a stripped image, you can also keep some specific ELF
+sections in the image by setting :term:`PACKAGE_KEEP_SECTIONS` in the
+``local.conf`` file::
+
+   PACKAGE_KEEP_SECTIONS = ".debug_frame"
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 47d4e814f..6743b1a9f 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6243,6 +6243,18 @@ system and gives an overview of their function and contents.
       install, the build system does not generate an error. This variable
       is generally not user-defined.
 
+   :term:`PACKAGE_KEEP_SECTIONS`
+      Specifies a list of ELF sections that should be kept when stripping
+      during package creation. You can set this variable in your
+      ``local.conf`` file.
+
+      For example, the following::
+
+        PACKAGE_KEEP_SECTIONS = ".debug_frame"
+
+      will result in passing the ``--keep-section=.debug_frame`` argument to
+      the ``strip`` command.
+
    :term:`PACKAGE_PREPROCESS_FUNCS`
       Specifies a list of functions run to pre-process the
       :term:`PKGD` directory prior to splitting the files out
-- 
2.47.1


