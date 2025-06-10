Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17329C5B543
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 10:19:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.83109.1749550772192304611
 for <docs@lists.yoctoproject.org>;
 Tue, 10 Jun 2025 03:19:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8381D14BF
	for <docs@lists.yoctoproject.org>; Tue, 10 Jun 2025 03:19:12 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 588E23F673
	for <docs@lists.yoctoproject.org>; Tue, 10 Jun 2025 03:19:31 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH] ref-manual: classes: add recipe-naming QA test
Date: Tue, 10 Jun 2025 11:19:26 +0100
Message-ID: <20250610101926.2235143-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 10 Jun 2025 10:19:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7046

Add documentation for the new recipe-naming recipe QA test.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 documentation/ref-manual/classes.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-man=
ual/classes.rst
index 54a98bf24f3..9be1c2c587c 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1591,6 +1591,10 @@ The tests you can list with the :term:`WARN_QA` an=
d
    For example, assignments such as ``FILES:${PN} =3D "xyz"`` effectivel=
y
    turn into ``FILES =3D "xyz"``.
=20
+-  ``recipe-naming:`` Checks that the recipe name and recipe class match=
, so
+   that ``*-native`` recipes inherit :term:`native` and ``nativesdk-*`` =
recipes
+   inherit :term:`nativesdk`.
+
 -  ``rpaths:`` Checks for rpaths in the binaries that contain build
    system paths such as :term:`TMPDIR`. If this test fails, bad ``-rpath=
``
    options are being passed to the linker commands and your binaries
--=20
2.43.0


