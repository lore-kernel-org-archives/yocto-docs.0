Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69D63D2C554
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 13:38:55 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.18419.1729604324965872804
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Oct 2024 06:38:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NlgvNOJH;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F3C4140014;
	Tue, 22 Oct 2024 13:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729604323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6XRY3GAAJOcq60WXvpqd0k/YfV2vQMDwUN8pN4kcD3M=;
	b=NlgvNOJH0UpacdipkeUXTFFhR+nxrVi+kuK30TwOKqWo14B9qctwgpmZ0EMU7t9pLUift0
	2wexRjEyPxzBv7W6DavM1t/ahh2fMaNxca5jsE8J1VfsSqcCVZEFoeUi6MFHZsSH/+JPmc
	Smdk8iuLLiO2QORJ9MkVOaQMaWB58L0XqEUmiE10KpNlB0dNgdMnHfzm6fIFLP+t0FJXWQ
	mFqNV7K0gnb5pjmkHetIztY1DyTaZNXdp1kiZRfIpqeJPx8HIPESJbxGtsdcG0QC2kibep
	Gj99GQ0E5K8v8VlaQbAXyZJiXWjZ7rZB+OoDqmkywEUfInzbQZnwAVMY6qXkkw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 22 Oct 2024 15:38:24 +0200
Subject: [PATCH v2] overview-manual: concepts: add details on package
 splitting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241022-bug-13225-package-split-v2-1-5715058872f0@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAM+qF2cC/3WNwQ6CMBBEf4Xs2TXdYgE9+R+GAy0FNmJLWiQaw
 r9bSTx6fJOZNytEG9hGuGQrBLtwZO8SyEMGZmhcb5HbxCCFPJEghfrZI+VSKpwac29SIU4jz6h
 KU7VGdOdCK0jrKdiOX7v5ViceOM4+vPejhb7pz1n8dS6EhFIUFVEu2tLqq/Z+HtkdjX9AvW3bB
 5lPrb3AAAAA
X-Change-ID: 20241015-bug-13225-package-split-57c8dc0f96b5
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4678;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Y+Ggum1rsH12z7HCsyt+4BPifMAivSnCOqkNt+aoi/o=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnF6ripAuRMK8NqgOTyUyCVbCCZr+Wt1dNsBWEf
 dN003gxkCSJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZxeq4gAKCRDRgEFAKaOo
 NqDLEACTvfAesXTYDlj4bYMFAUNQLf0SKOkAtX/JPfFaE4NmPQcZyA6a1xgCUwntFVJveNyNMFU
 2cILUT6M6p+THMbGbUu8gMWXJ7Pc1lT23JNdy2lZz8K8k4w9VnPe0kzn2gm5KADPZx45CKX0QoW
 MRWGi9LvA2OIhw3+vw0zcAyhMZEibNNBj8T21ikllC671+lwS0Q7MOzvLx1/Hi70w7H5t6EhJLI
 sxF89r25oXiXrhfb6tvNGOSosNpmsYC1dG8AUNbDFRr8ErUBHCAbSeR8G66bduvSHvWqn+BRJwA
 PPxctwU/FSjV52ttGFCTs82BdCXVUmNagvu6s1DHIyZcJjsCVfU0Brta/SxFjpPRatycYTOcZ3K
 9Stpol5yHguU4D7RpJ4sQ4IgJDHUKLrx/fOTx17qPMTmzL/kdUv719tTJSE9gkuDNm5501PwlH1
 v0U5LTiseRg/B+Z/gH8VDHuXJslhI+Halnvfnzx5s2OeGLr6+lsqTOz/yRngmN/L53Kxc8WtU4/
 PBWRv4ctDbBMDrfom0EPSLkTLE63o+7xtolrN6eE8gPUy7Kxy4v8yjHIuRcq6n6Uz0kcOLcAYsZ
 k6Zv5yJh/rltYF4FFGA3w1556v8pA+Sp84HIDg2EYpPenF8xTNy9AN/R1R5mV+I7KilhSQ8FAea
 523XqMkts+g6MjA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Oct 2024 13:38:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5563

The package splitting section of the overview manual currently lacks any
explanation of how package splitting is implemented and redirects to
the package class, which is not really understandable for newcomers to
the project.

This patch adds a short explanation of what is done:

* How the PACKAGES variable is defined.
* How the FILES variable is defined.
* How the two work together.
* How to add a custom package.

This should give enough details to a new user on what package splitting
achieves and how to add a custom package.

Adresses [YOCTO #13225]

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- Rewrite multiple paragraphs after reviews from Quentin.
- Be explicit on _NOT_ using D in FILES!
- Mention the oe-pkgdata-util cli tool.
- Link to v1: https://lore.kernel.org/r/20241016-bug-13225-package-split-v1-1-20681130d7eb@bootlin.com
---
 documentation/overview-manual/concepts.rst | 61 +++++++++++++++++++++++++++---
 1 file changed, 56 insertions(+), 5 deletions(-)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 62f2327a7e27a777f738523e7fafe62422186abb..e38ca196260c1f7ece2dcd0cfd3aafe41fd27147 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -912,11 +912,62 @@ the analysis and package splitting process use several areas:
    execute on a system and it generates code for yet another machine
    (e.g. :ref:`ref-classes-cross-canadian` recipes).
 
-The :term:`FILES` variable defines the
-files that go into each package in
-:term:`PACKAGES`. If you want
-details on how this is accomplished, you can look at
-:yocto_git:`package.bbclass </poky/tree/meta/classes-global/package.bbclass>`.
+Packages for a recipe are listed in the :term:`PACKAGES` variable. The
+:oe_git:`bitbake.conf </openembedded-core/tree/meta/conf/bitbake.conf>`
+configuration file defines the following default list of packages::
+
+  PACKAGES = "${PN}-src ${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}"
+
+Each of these packages contain a default list of files defined with the
+:term:`FILES` variable. For example, the package ``${PN}-dev`` represents files
+useful to the development of applications depending on ``${PN}``. The default
+list of files for ``${PN}-dev``, also defined in :oe_git:`bitbake.conf
+</openembedded-core/tree/meta/conf/bitbake.conf>`, is defined as follows::
+
+  FILES:${PN}-dev = "${includedir} ${FILES_SOLIBSDEV} ${libdir}/*.la \
+                  ${libdir}/*.o ${libdir}/pkgconfig ${datadir}/pkgconfig \
+                  ${datadir}/aclocal ${base_libdir}/*.o \
+                  ${libdir}/${BPN}/*.la ${base_libdir}/*.la \
+                  ${libdir}/cmake ${datadir}/cmake"
+
+The paths in this list must be *absolute* paths from the point of view of the
+root filesystem on the target, and must *not* make references to the variable
+:term:`D` or any :term:`WORKDIR` related variable. A correct example would be::
+
+  ${sysconfdir}/foo.conf
+
+.. note::
+
+   The list of files for a package is defined using the override syntax by
+   separating :term:`FILES` and the package name by a semi-colon (``:``).
+
+.. note::
+
+  To find out which package installs a file, the ``oe-pkgdata-util``
+  command-line utility can be used::
+
+    $ oe-pkgdata-util find-path '/etc/fstab'
+    base-files: /etc/fstab
+
+  For more information on the ``oe-pkgdata-util`` utility, see the section
+  :ref:`dev-manual/debugging:Viewing Package Information with
+  \`\`oe-pkgdata-util\`\`` of the Yocto Project Development Tasks Manual.
+
+A given file can only ever be in one package. By iterating from the leftmost to
+rightmost package in :term:`PACKAGES`, each file matching one of the patterns
+defined in the corresponding :term:`FILES` definition is included in the
+package.
+
+To add a custom package variant of the ``${PN}`` recipe named
+``${PN}-extra`` (name is arbitrary), one can add it to the
+:term:`PACKAGE_BEFORE_PN` variable::
+
+  PACKAGE_BEFORE_PN += "${PN}-extra"
+
+Alternatively, a custom package can be added by adding it to the
+:term:`PACKAGES` variable using the prepend operator (``=+``)::
+
+  PACKAGES =+ "${PN}-extra"
 
 Depending on the type of packages being created (RPM, DEB, or IPK), the
 :ref:`do_package_write_* <ref-tasks-package_write_deb>`

---
base-commit: e4b64514673471850635a8dbbf62f34e710e276a
change-id: 20241015-bug-13225-package-split-57c8dc0f96b5

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


