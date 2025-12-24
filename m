Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F1C0E776D1
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:32:03 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.123718.1766593913447938800
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:31:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ZL7GPuC6;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EC82E1A23E4
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:31:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C366C6073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:31:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1A4A010AB1370;
	Wed, 24 Dec 2025 17:31:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593911; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dafVX1PRfkns+41er/td1RMSSybhHzVSFhWFftRC/8M=;
	b=ZL7GPuC6yzMCYOY0n4yDrD8nTv/aogy7r3JKn0mHaRlbmlqIa9+D0z2HxmTGm7Xjl4N9Ew
	XwlR2fWrlsTb1KkM5IHRhmaevc3EFyVgWUUdWMOpCnDoUtfQsqKm4wC7k5hUyhxOqTYqog
	OxxxO3odpx8AuLBtUtYsZzqyxhRufa8YMat4CsrhSr4tqUTjt01F8rp6X9FFI+DKFZuqnt
	z5qaZVU5rNRdMkjeEhbLO7THz0AHzhZZh+6/gmVfMv/jU0avtsblPzxM0yZad5iKiSw9OL
	bN5A5wUu77Qo+hysChgnt3rx9eVeDRBBikRngSe+w89kto+FkzJHR4+FlZEWHA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 24 Dec 2025 17:31:34 +0100
Subject: [PATCH 08/53] dev-manual/debugging.rst: remove obsolete poky repo
 references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-remove-poky-references-v1-8-658a5f4dbde2@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
In-Reply-To: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3058;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=HuqmZQLoxQ0/wk6rBcyYqzahusvtemdyxUSiQuEJFXQ=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpTBVn46XLrMpx84ixP6BD0twd4UM+I4Tp/he18
 KTcQv0WUy+JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUwVZwAKCRDRgEFAKaOo
 NrO5D/92Glzw1eCDkf/ceJNXGAwq1bl3ljC6r3AB+X8E76gWk/b1qP7A8EFwWy59odZchRAOr05
 U+7/QJOeWXQJ4S0SN7vjBaQJVfN+KWOzrjZesgHfqe7EqonF+iAeBTpKhNNWqhO0Hrd8Grx9w2A
 YU/WtxXOv4nP92P3YHDU2LaouG9RatUq5naRBGuk6UJbbfC58/9udkhH5MYYOsmtpoFyrbeJWHx
 cdMZOFnAcxON+Ip++shzPROwzGtt0xqN31yuld3UVqBDjlxBmU4dgbgyUqc0/QJCa0jWsxNO+hN
 G9+JJgTRB6eTe50io/2fEKo4tgmp3L540fJNAr69IEbiE/T+IM73WlOEs8djLFmJOmwou5Cjwph
 AjIuZiPLCrWRTdDAyhpF7U1HhPmvQCC8IN4Zvk+RwrWMxEVDJQWGaFvl1M6cmtzSelXp28/KtKs
 B3PQ47VrfVuKnKu6K3Ga090eep6Yka2WJjjfe1I0xO9FqagSlY6enK92wIIVw3zLIyZH6Mch7KB
 nGhj3fuIcKMxnD9yEO2Qihr4ku1Womci+/qHG2sYns9lEVn7WtRz2AQHndrdD5/auWVzJRVLuJJ
 L2PO/nDH2b73op7s3zPbHY/p4gkKrS/ga7voVIzFrit9mb5tfp3OGLumUMuDLjEBo/W4yZNNjf9
 hwPFDPOJnKaxvoQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8337

Remove references to the Poky repository, replace by OpenEmbedded-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/debugging.rst | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/documentation/dev-manual/debugging.rst b/documentation/dev-manual/debugging.rst
index 0202f1b32..21fb10537 100644
--- a/documentation/dev-manual/debugging.rst
+++ b/documentation/dev-manual/debugging.rst
@@ -439,7 +439,7 @@ the build system to run the task again.
 
    For an example of a commit that makes a cosmetic change to invalidate
    shared state, see this
-   :yocto_git:`commit </poky/commit/meta/classes/package.bbclass?id=737f8bbb4f27b4837047cb9b4fbfe01dfde36d54>`.
+   :oe_git:`commit </openembedded-core/commit/meta/classes/package.bbclass?id=30064a98dc9049db4a37f119d15fbb59aa3c8377>`.
 
 Running Specific Tasks
 ======================
@@ -522,7 +522,7 @@ task dependency mechanisms.
 
    .. code-block:: none
 
-      WARNING: /home/ulf/poky/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.1.bb.do_compile is tainted from a forced run
+      WARNING: /home/ulf/openembedded-core/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.1.bb.do_compile is tainted from a forced run
 
 
    The purpose of the warning is to let you know that the work directory
@@ -615,7 +615,7 @@ The same logging functions are also available in shell functions, under
 the names ``bbplain``, ``bbnote``, ``bbdebug``, ``bbwarn``, ``bberror``,
 and ``bbfatal``. The :ref:`ref-classes-logging` class
 implements these functions. See that class in the ``meta/classes``
-folder of the :term:`Source Directory` for information.
+folder of :term:`OpenEmbedded-Core (OE-Core)` for information.
 
 Logging With Python
 -------------------
@@ -852,10 +852,10 @@ patch::
    Refreshed patch patches/parallelmake.patch
 
 Once the patch file is created, you need to add it back to the originating
-recipe folder. Here is an example assuming a top-level
-:term:`Source Directory` named ``poky``::
+recipe folder. Here is an example assuming :term:`OpenEmbedded-Core (OE-Core)`
+is named ``openembedded-core``::
 
-   $ cp patches/parallelmake.patch poky/meta/recipes-connectivity/neard/neard
+   $ cp patches/parallelmake.patch openembedded-core/meta/recipes-connectivity/neard/neard
 
 The final thing you need to do to implement the fix in the build is to
 update the "neard" recipe (i.e. ``neard-0.14.bb``) so that the
@@ -940,7 +940,9 @@ debug symbols from the server.
 To run a ``debuginfod`` server, you need to do the following:
 
 -  Ensure that ``debuginfod`` is present in :term:`DISTRO_FEATURES`
-   (it already is in ``OpenEmbedded-core`` defaults and ``poky`` reference distribution).
+   (it already is in :term:`OpenEmbedded-Core (OE-Core)` defaults and
+   :term:`Poky` reference distribution).
+
    If not, set in your distro config file or in ``local.conf``::
 
       DISTRO_FEATURES:append = " debuginfod"

-- 
2.51.0


