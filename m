Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3938BD1AD55
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 13:19:17 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.22695.1729084752412006505
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Oct 2024 06:19:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=KgjGlN5x;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 75076FF80A;
	Wed, 16 Oct 2024 13:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729084750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4oz0G4VT8jmU71qYDrcKAs941bFPZ7sL1ERlAREL09s=;
	b=KgjGlN5xcBmeQRHGU1CSUpT1m1ZsLflMqwPJquWjGfeUAs7ALhrwvQoQZjLSfkzuN0c4+L
	Q8f3FeSaYDN8onnf7+fBA3Q6Z5RgtQBa55uKcO/WtQd0LQGw7PpAFwj9JB2vEuUe82ppcI
	ZcGfrq7p+m2tOPjzduz5Hq6wWV0kYSYApZdasjQmD6L9Mpm3ETXM+IQockvTEP6kPeSG5G
	Kws+7OSjTLRDZibrVwyY2jd8mFIUPU3Xyzt8r8Ign4HjajhlWYiLeBuDWU70eIZwgCMPf2
	0OvIJnD3E2NLZDtsG9NRihrdhk/qAsMOXXUCt3oZXxQS2TTaTGIHiYN/la5TVg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 16 Oct 2024 15:19:00 +0200
Subject: [PATCH] overview-manual: concepts: add details on package
 splitting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241016-bug-13225-package-split-v1-1-20681130d7eb@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAEO9D2cC/x2MWwqAIBAArxL73YJa9rpK9GG21VKUaEUQ3T3pc
 2BmHgjkmQI0yQOeLg68bxFkmoCdzTYR8hAZlFC5FFJjf04oM6U0OmMXE4XgVj5Ql7YarBjrotc
 Qa+dp5Ps/t937fnM7p8RpAAAA
X-Change-ID: 20241015-bug-13225-package-split-57c8dc0f96b5
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4066;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=GM3J2MYJY8vZQIp/bVQLcX782Uv6BpeqG/XXBu+two8=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnD71O1YjsFzomGXHK48e5Lou0GP2fulBhFM0r7
 WitHZVIJG6JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZw+9TgAKCRDRgEFAKaOo
 NvLCEAC27kbGgjev2dk01E34T3TxUoTtrmsw/XouNcJAjJpPo2b+jlJL5RnZmTD0t90hPX29lMX
 efMIICywyCkLZuud7DaZntZroAK6z0EM8N7yKoVq+k+5NwKoiP1TLcTnOXKUpJIqvN8yFh40skC
 rihNOOCzPcgUtw8LC0L7L7jieJTzr0Qf3Gs35d4kHK8AVhXP6NKTRus5+sAd5VlNt2M33i3zEqi
 itVv6qG+0Ecx9UDFVwC9r2NHG0Ja5CHvWrLLpEzhtetRSduuBY1vg625qjVymt3m+q9MxYTxpJS
 FCs6V0jVuISctj2fRgZgXU2gIbMtQ904ONV8tlsxeeCjG+5LNqSF/hxPan5St2Tgx282cDr5+JQ
 I9woRqOo0q269kqTBRcO+3QOG/4z35k54lDRrnPpn3NBvtXkOeqCPO9m19c9AKnIUjGc5vMxnrL
 ov4JJ5fnFzux/Y50DNvHQygToWFYun3MMwiiq5WZQ9c2z6hrWz2E/2x3VjhRbp2xYe6/vgZHyeS
 oius9gIaiWWGcmuzifnIWg7OHEzS+FTbYI2c2CrZEEoMrm4m0rj3eUZ7ELEcSFoyU666Je8uEpr
 qoUI8NkzROB6xL9opo04ACI8YQJq0dFYNUbn7aTiU3S8gsH4LJk55buJJXszmdxmL+ACe0P/k5y
 i1li2oLHjvmSdew==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 16 Oct 2024 13:19:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5506

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
 documentation/overview-manual/concepts.rst | 49 +++++++++++++++++++++++++++---
 1 file changed, 44 insertions(+), 5 deletions(-)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 62f2327a7e27a777f738523e7fafe62422186abb..d3e90b80d4fe1954c7aacba8f0fe243cba04c1b5 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -912,11 +912,50 @@ the analysis and package splitting process use several areas:
    execute on a system and it generates code for yet another machine
    (e.g. :ref:`ref-classes-cross-canadian` recipes).
 
-The :term:`FILES` variable defines the
-files that go into each package in
-:term:`PACKAGES`. If you want
-details on how this is accomplished, you can look at
-:yocto_git:`package.bbclass </poky/tree/meta/classes-global/package.bbclass>`.
+Packages for a recipe are listed in the :term:`PACKAGES` variable. The
+:yocto_git:`meta/conf/bitbake.conf </poky/tree/meta/conf/bitbake.conf>`
+configuration file defines the following default list of packages::
+
+  PACKAGES = "${PN}-src ${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}"
+
+Each of these packages contain a default list of files defined with the
+:term:`FILES` variable. For example, the package ``${PN}-dev`` represents the
+development variant of the main package ``${PN}`` and its default list of file
+contains development-oriented files only::
+
+  FILES:${PN}-dev = "${includedir} ${FILES_SOLIBSDEV} ${libdir}/*.la \
+                  ${libdir}/*.o ${libdir}/pkgconfig ${datadir}/pkgconfig \
+                  ${datadir}/aclocal ${base_libdir}/*.o \
+                  ${libdir}/${BPN}/*.la ${base_libdir}/*.la \
+                  ${libdir}/cmake ${datadir}/cmake"
+
+The paths in this list must be *absolute*, and must use the path prefixes
+defined by the :yocto_git:`bitbake.conf </poky/tree/meta/conf/bitbake.conf>`
+configuration file, such as ``${sysconfdir}``, ``${bindir}``, etc. They can
+optionally use wildcards (``*`` ) to match multiple files installed in a
+directory.
+
+.. note::
+
+   The list of files for a package is defined using the override syntax by
+   separating :term:`FILES` and the package name by a semi-colon (``:``).
+
+The order of the packages in the :term:`PACKAGES` is important: during package
+splitting, going from the first element in :term:`PACKAGES` to the last, each
+file matching a pattern specified in the corresponding :term:`FILES` definition
+will be included in the package and *excluded* for the remaining packages listed
+in :term:`PACKAGES`. As a consequence, custom packages should be added using the
+prepend operator (``=+``) to be prioritized.
+
+For example, to add a custom package variant of the ``${PN}`` recipe named
+``${PN}-extra`` (name is arbitrary), one should write::
+
+  PACKAGES =+ "${PN}-extra"
+
+Alternatively, a custom package can be added to the
+:term:`PACKAGE_BEFORE_PN` variable::
+
+  PACKAGE_BEFORE_PN += "${PN}-extra"
 
 Depending on the type of packages being created (RPM, DEB, or IPK), the
 :ref:`do_package_write_* <ref-tasks-package_write_deb>`

---
base-commit: 3820a7bec0bb23bcd26bd99be2275d6d214a3a04
change-id: 20241015-bug-13225-package-split-57c8dc0f96b5

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


