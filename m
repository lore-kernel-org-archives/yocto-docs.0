Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D63C1C43217
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 16:44:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.9610.1666111458058876705
 for <docs@lists.yoctoproject.org>;
 Tue, 18 Oct 2022 09:44:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2F8C113E;
	Tue, 18 Oct 2022 09:44:23 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 138683F7D8;
	Tue, 18 Oct 2022 09:44:16 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: docs@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] migration-guides/release-notes-4.1.rst: add more known issues
Date: Tue, 18 Oct 2022 17:44:12 +0100
Message-Id: <20221018164412.964305-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 18 Oct 2022 16:44:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3371

Clarfify the eSDK issue, and document the externalsrc issue.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../migration-guides/release-notes-4.1.rst         | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/documentation/migration-guides/release-notes-4.1.rst b/docum=
entation/migration-guides/release-notes-4.1.rst
index be722356d..0c552bf1a 100644
--- a/documentation/migration-guides/release-notes-4.1.rst
+++ b/documentation/migration-guides/release-notes-4.1.rst
@@ -195,9 +195,17 @@ Known Issues in 4.1
   into the image.  Filed as :yocto_bugs:`bug 14928 </show_bug.cgi?id=3D1=
4928>`.
=20
 - There is a known issue with eSDKs where sstate objects may be missing,
-  resulting in packages being unavailable to install in the sysroot. Thi=
s is
-  under investigation and appears to be related to hash equivalence. Fil=
ed as
-  :yocto_bugs:`bug 14626 </show_bug.cgi?id=3D14626>`.
+  resulting in packages being unavailable to install in the sysroot. Thi=
s is due
+  to image generation optimisations having unintended consequences in eS=
DK
+  generation. This will be resolved in the next point release.  Filed as
+  :yocto_bugs:`bug 14626 </show_bug.cgi?id=3D14626>`, which also details=
 the fix.
+
+- The change to :ref:`migration-4.1-classes-split` inadvertently moved t=
he
+  :ref:`externalsrc <ref-classes-externalsrc>` class to ``meta/classes-r=
ecipe``,
+  when it is not recipe-specific and can also be used in a global contex=
t.  The
+  class will be moved back to ``meta/classes`` in the next point release=
.  Filed
+  as :yocto_bugs:`bug 14940 </show_bug.cgi?id=3D14940>`.
+
=20
 Recipe License changes in 4.1
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--=20
2.34.1


