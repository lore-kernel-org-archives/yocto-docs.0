Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 480E2F8D74C
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 14:04:15 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15009.1776348245172605249
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Apr 2026 07:04:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=NCpgqGlR;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 22FBD4E42A1F
	for <docs@lists.yoctoproject.org>; Thu, 16 Apr 2026 14:04:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id ED54360495
	for <docs@lists.yoctoproject.org>; Thu, 16 Apr 2026 14:04:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DD8691046089B;
	Thu, 16 Apr 2026 16:03:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776348240; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=gZT7T2DN0m0hSPtCbNiI3bTQsOA9AFRV3QEd1oHhB/8=;
	b=NCpgqGlRT4dqk9QzcKGgsYHW3e+KO+jLG2maCLORJkmi4Yv4qc9bnJYDgRQB2GuDWrqDPl
	pP7JEIQFB60Eznr4ft+JIGdOnmLjYi5t+qbc85Bn1QJ913QKiA7NCSfgHi1b0t5csY36ZX
	/PWzvLm/QOTTFN6vlb5wBZdV4nakOO1r+Qqc1yDyGwFiiKbVlbRJCETSVJuHef8Gel2BGu
	orM9LMvGkgQo1DfhWpYtj8ay7LsvA/fa0DBrwXbfiXnpajwP+pqNeWDf0d+hUKO7h7JKAc
	1HiIU/TvyI1xJk8mbd0MVvZnzqwn8HxAH8RwhQ5qQj3eWWB3VIbDwd1DZWX0wg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 16 Apr 2026 16:03:54 +0200
Subject: [PATCH] dev-manual/new-recipe.rst: rework Unpacking Code section
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-unpacking-code-v1-1-19bc7d4fd7ee@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqAIBBA0avErBNMIqKrRAsdx5oCC60Iwrtnt
 XyL/2+IFJgidMUNgU6OvPqMqiwAJ+1HEmyzQUnVyLpqxOE3jQv7UeBqSWh01mipnMEWcrQFcnx
 9w374HQ8zE+7vBVJ6ANEZDmVyAAAA
X-Change-ID: 20260416-unpacking-code-acfdba02fbc8
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2816;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=cJk77aGrUT0u2TXPzss8+Skhl+6Q23ZdlCIRTSywUoU=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp4OxPHItm8TeOxS+PBsLFgI9jyNSiMpJazN0SP
 ppTr06FL/6JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaeDsTwAKCRDRgEFAKaOo
 Ns6tD/9eD2GsgWHdGNEe4146RR9FK87J/2t5nuLUJUbCjnE/sfCWx8wuiBB7g2MR7XBQsC+Q+mk
 z6Aj1pJil38Np6eeV9tJrij+RSBhAsdN5O3HtFoOJGtcdWHvjgziaY9lUmC5Z9/qidc09vPZ/Lc
 fvThAyURDSjgmLKT8NS6V5dfoQurUoQofkvGmsmPHOcQBKkO/q17Vj1kU7JhCkR1QwtXT4pEtT5
 ks9UnPgc/NJAggDsE7pb/uQB6kE7Po0plKE3pMHT6Z5eQ3RGkkAb6/9YtNCBtw1qsjWZrQnF6UD
 2Oj0GR+CRUosFqUFOYOWIm8Rf8zLIqmeambUOgpAUntU627H2MqfODUu8RlgiSs9Abn1WoSB2Pf
 PnlFLf2v+h5JscxzLTBLQ50iaSijcOgNyEdX+k8KGhwTL+HjSMCY2NotDNHK2krMXdKArxRpH1q
 r8JIm1LpnbsXD7wYs8mqroxeQxV8L1XxHgxt+jshUThQF0nB1jK240K7Jn1fhmhri+a0w1mTTlV
 fkZ2X8Lzvtr3ZDwlowfL6oecWLXQ8a/RMolIkh21jdcbMU2G/oo/g1P5oI00X+7UtmKSuva8Tab
 UkLe/1iXcoOtc31umfoa+LFdbtzdZJkHhX1/iQEfSM5Guti1UuuSYKwzPCDR7Oxx3dcuQtb4sJW
 2mIT0XkmrU1H8OQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Apr 2026 14:04:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9272

There were recent changes to how Bitbake/OECore unpacks code.
Importantly we no longer need to set S when fetching with the Git or
other fetchers. Rework this section and mention UNPACKDIR/BP.

[YOCTO #16049]

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/new-recipe.rst          | 24 +++++++++++++-----------
 documentation/migration-guides/migration-5.3.rst |  2 ++
 2 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-manual/new-recipe.rst
index 5e9498afc..82c7ff4b2 100644
--- a/documentation/dev-manual/new-recipe.rst
+++ b/documentation/dev-manual/new-recipe.rst
@@ -408,17 +408,19 @@ During the build, the
 the source with ``${``\ :term:`S`\ ``}``
 pointing to where it is unpacked.
 
-If you are fetching your source files from an upstream source archived
-tarball and the tarball's internal structure matches the common
-convention of a top-level subdirectory named
-``${``\ :term:`BPN`\ ``}-${``\ :term:`PV`\ ``}``,
-then you do not need to set :term:`S`. However, if :term:`SRC_URI` specifies to
-fetch source from an archive that does not use this convention, or from
-an SCM like Git or Subversion, your recipe needs to define :term:`S`.
-
-If processing your recipe using BitBake successfully unpacks the source
-files, you need to be sure that the directory pointed to by ``${S}``
-matches the structure of the source.
+By default, the value of ``${``\ :term:`S`\ ``}`` is already set to where the
+:term:`OpenEmbedded Build System` will unpack the source code, by using the
+value of :term:`UNPACKDIR` and :term:`BP`.
+
+You typically don't need to set :term:`S` explicitly. If processing your recipe
+using BitBake successfully unpacks the source files, you can verify that the
+directory pointed to by ``${S}`` is the root of your source code.
+
+.. note::
+
+   It used to be that when fetching with Git, recipes should explicitly set
+   :term:`S` to ``${WORKDIR}/git``: this is no longer the case. See
+   :ref:`ref-migration-5-3-s-workdir-git` for more information.
 
 Patching Code
 =============
diff --git a/documentation/migration-guides/migration-5.3.rst b/documentation/migration-guides/migration-5.3.rst
index 464006aaa..8746141cd 100644
--- a/documentation/migration-guides/migration-5.3.rst
+++ b/documentation/migration-guides/migration-5.3.rst
@@ -54,6 +54,8 @@ changed to::
 
    S = "${UNPACKDIR}/something"
 
+.. _ref-migration-5-3-s-workdir-git:
+
 ``S = ${WORKDIR}/git`` and ``S = ${UNPACKDIR}/git`` should be removed
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 

---
base-commit: 560bc33c0c2ecd60d68ba06a2edff8c25b9a3f90
change-id: 20260416-unpacking-code-acfdba02fbc8


