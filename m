Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36729C43327
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 08:13:31 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16077.1782807202055295324
 for <docs@lists.yoctoproject.org>;
 Tue, 30 Jun 2026 01:13:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=esGlvtR2;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5DCD84E40BA1
	for <docs@lists.yoctoproject.org>; Tue, 30 Jun 2026 08:13:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 340F760233
	for <docs@lists.yoctoproject.org>; Tue, 30 Jun 2026 08:13:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 559FB106F1CC4;
	Tue, 30 Jun 2026 10:13:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782807199; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2wAsHg1DUXe76sluttpyqAuD9TjBuoMf8uUBgFNHjhQ=;
	b=esGlvtR2ntMZRPHN/IzjximJfzTMSgXgArhbMHLKIPrI+NAPlKo88v9+OWHV8sjwDJPgKT
	a1csFgeqSZ0Wjfq8w1gbAtsM/hJLQt3bL4ti3XXHMgF9iJaYl1tlD7C8ZGjLVxzQBRUVg5
	R7+tUFx1AWN2HzlDOE+LXmsSWcVBApjrRXaa2LL+ejZziwvTxIJnKxU1G3xqqYJTdNmeeL
	QUMOmeiIPiC9H47IkkgyRYpagaiRBapByuUXsjAZODH/wYqAXp8rqfjuAfbfgGLBZwJDLJ
	9RyoeAx6DmmwUdY/Z6qxQEhUy3zXJuyI5fZF40m0mJrkhbfuJOXAvwKUQ1nYzQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 30 Jun 2026 10:13:12 +0200
Subject: [PATCH 2/7] ref-manual/variables.rst: document missing
 CONFLICT_*_FEATURES variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-sync-documentation-conf-v1-2-da14b40cb515@bootlin.com>
References: <20260630-sync-documentation-conf-v1-0-da14b40cb515@bootlin.com>
In-Reply-To: <20260630-sync-documentation-conf-v1-0-da14b40cb515@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3681;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=jnYmzanEqUiyr7hLsnn+2UoM4VwtM9pMd4VVeIkXfew=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqQ3qc9p77kkjT4A4+yjXnT7eW7gQuYT2e+lyby
 qqYbjWh1sqJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCakN6nAAKCRDRgEFAKaOo
 NujUEAC7eeyNVLCXDSb0R+dV+eBPnrIdMAWU1Yb9LUBIJvaFNa6OxSXAD7Ilj6Pa0d2rP80TfJL
 whtjYRQCM7PINgRpdNTppjfrlq+hjQEUfEgl5FxU1RXychJMbOsgTR21eiIjZoatvveXnthzQnz
 5yQHq0V4Qaoe+/xwrIz+reAVds+k5r/bYDpHjgUNHX4vlDSx0WcOXeqcfK7kjbuOt2o3vhFe/A3
 nHNdBXPhugNRBZSp9T3fU+RJajprBBnKnRskgJcIDWTQWQJgr5eSvlX/Gxvd0FBlOU/0ByAezXj
 /kkg+r01FL2/hmGHX3xHXxgWn3Zt8I0QNF57+tm1hHonBLbnnXQaGq8hOKXSsiedzGIdEOvQZTS
 KShIPUIsM9a+f4UFvQ8TjRFVMK7fu3Wz/NGFK7RS1MU66I9yowkfYDIOqWBwsS2o6KZMW0ysrvH
 SDqAyghox58h+7nm77AYV+dJUWkAoYstL1lyqnM0FyL4MM3pj9lPQp05EFXsbZVlcb/dWxXbGhU
 DGqvu9OR9GPmu2x1CH4ZFbwj+u/TtE0NST4SVw0Gl5k4Clx5yG4fVli5f8VjhBjLmLxLWSfmOGQ
 KFtzyXWeH53C8oBrwtv9nItQNOFOhB2tsFXEmrsRsofEUp5myRnGyRjN9yITNYQ0SQrU2FbQW2e
 F2MFfI6DU7ew5Yw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 30 Jun 2026 08:13:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9982

Those are part of the features_check class.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 39 +++++++++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index f8765e084..55c0801bb 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1810,15 +1810,52 @@ system and gives an overview of their function and contents.
       Where :term:`AUTOTOOLS_SCRIPT_PATH` is the location of the of the
       Autotools build system scripts, which defaults to :term:`S`.
 
+   :term:`CONFLICT_COMBINED_FEATURES`
+      When inheriting the :ref:`ref-classes-features_check`
+      class, this variable identifies combined features (see
+      :term:`COMBINED_FEATURES` for what this means) that would be in conflict
+      should the recipe be built. In other words, if the
+      :term:`CONFLICT_COMBINED_FEATURES` variable lists a feature that also
+      appears in :term:`COMBINED_FEATURES` within the current configuration,
+      then the recipe will be skipped, and if the build system attempts to build
+      the recipe then an error will be triggered.
+
    :term:`CONFLICT_DISTRO_FEATURES`
       When inheriting the :ref:`ref-classes-features_check`
-      class, this variable identifies distribution features that would be
+      class, this variable identifies distro features that would be
       in conflict should the recipe be built. In other words, if the
       :term:`CONFLICT_DISTRO_FEATURES` variable lists a feature that also
       appears in :term:`DISTRO_FEATURES` within the current configuration, then
       the recipe will be skipped, and if the build system attempts to build
       the recipe then an error will be triggered.
 
+   :term:`CONFLICT_IMAGE_FEATURES`
+      When inheriting the :ref:`ref-classes-features_check`
+      class, this variable identifies image features that would be
+      in conflict should the recipe be built. In other words, if the
+      :term:`CONFLICT_IMAGE_FEATURES` variable lists a feature that also
+      appears in :term:`IMAGE_FEATURES` within the current configuration, then
+      the recipe will be skipped, and if the build system attempts to build
+      the recipe then an error will be triggered.
+
+   :term:`CONFLICT_MACHINE_FEATURES`
+      When inheriting the :ref:`ref-classes-features_check`
+      class, this variable identifies machine features that would be
+      in conflict should the recipe be built. In other words, if the
+      :term:`CONFLICT_MACHINE_FEATURES` variable lists a feature that also
+      appears in :term:`MACHINE_FEATURES` within the current configuration, then
+      the recipe will be skipped, and if the build system attempts to build
+      the recipe then an error will be triggered.
+
+   :term:`CONFLICT_TUNE_FEATURES`
+      When inheriting the :ref:`ref-classes-features_check`
+      class, this variable identifies tune features that would be
+      in conflict should the recipe be built. In other words, if the
+      :term:`CONFLICT_TUNE_FEATURES` variable lists a feature that also
+      appears in :term:`TUNE_FEATURES` within the current configuration, then
+      the recipe will be skipped, and if the build system attempts to build
+      the recipe then an error will be triggered.
+
    :term:`CONVERSION_CMD`
       This variable is used for storing image conversion commands.
       Image conversion can convert an image into different objects like:

-- 
2.54.0


