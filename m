Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D6F6C88E41
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:19:35 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5802.1769501967719333408
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 00:19:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Gmd2qojH;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 360644E422CA
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0DBBB606F5;
	Tue, 27 Jan 2026 08:19:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2F7BC119A8682;
	Tue, 27 Jan 2026 09:19:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769501965; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VpQz2X9a1/mJo9P8xhWGzblvjXHHwYgnSxuE76JQgm4=;
	b=Gmd2qojHBW7Zz7FXfwC9/l5YfAqUiV2u9e40IiSepQHIlsoKpAdnuEpB7Wh08PkeeO7zcV
	DAIpeM2saiMKUFPuR4ejGbRgd7014FSOvmoERfrTzOVfsbN9xTNJUQCiDdX8U8IjtVSWM2
	UnVnirv2u0qvRiFawoPuz9DzP6uzbedI38Al0dsM/f9WNnk/yo3Wa9/mHLp9i65ZQOJt3w
	wNP61fxAs4ogMI0TdFfv8ni6q01UNMER5P1gT/h3teJukOTTP5/FHEINFxfXNNrC53JgFE
	U7sK4LmvRYbwePB9IOaNWuAmdyaSdOU/VCBAXRekM1v+SWIAYOqUb7eHPoPQWQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 27 Jan 2026 09:19:03 +0100
Subject: [PATCH v2 08/56] dev-manual/debugging.rst: remove obsolete poky
 repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-remove-poky-references-v2-8-74bf80cc4e5a@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
In-Reply-To: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3114;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Q1Jab2vkTEJhjQAE57aYSWn2KYo23aMy8ev/8mZyUAM=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpeHT/C1jKbtmobhkrTax6BHY1SbfkXI4J1lyvX
 m+GkruJxaqJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXh0/wAKCRDRgEFAKaOo
 NmfwD/49AfsDYNjS3MWwTZi3JY/0aHXdcuGS6DNzEf0a+ALgLGy+Z0CFUAnobfKze+dNtT0/IvC
 XZq7JS2MRqPWX3qbWWmLC3rZO6fqrN8BRR9lL0LMheVO9GcMluDY3IRvUgu7ncEpUZaemjL837L
 eVozW/uNUpvhC1SuTQC+G5HCmSHuGG43vYPwYxKEl2k4MEyKriTMA7Nr6kjS5TZHi1zdYWN/z48
 6EJHDLtcll6uT7c3N3T+swuru7xtrDq+sbPD6oaS1AaOEyuRlNm46Yz7D5VreAKn2lu2fDT9Z2U
 dgRu22C7/V6/gNNEGCvbcieLBtGn/2O6gy6IGIdhJK3skqwQtEgpB/W+XWnd/woOFnzM3XkFbCh
 G9NOpQIZnX816UTcurb1C3gJ+4DQkgW7lmbp3d9uUlhraIqQiJLTVca42c2cOM1+Wr9QgMy5tmM
 yopJo+enn+kMyP8LOLEUDjbZ4VOzCJRHvo+Ok93xO4glgfmIu7xgMOb/luACfsofk9rFitWgvvX
 YnPpL0BxqV9h7FoU/djTA3LjveDV595sb3ypjY+Ydj2BV9j0DSLkGfdUtD+njerCqpj+tJTe17Z
 524wupFlm2T72jiw05m8ZRXSSPN+kH1aWaonb5rrQqCVvMPEOw8Vu5pPCjac50Cf+ApnlJPrEgS
 UEu/se5OahEM2Zg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8669

Remove references to the Poky repository, replace by OpenEmbedded-Core.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
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
2.52.0


