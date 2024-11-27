Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF9E5D6ACC2
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 11:36:39 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.69898.1732707393380017470
 for <docs@lists.yoctoproject.org>;
 Wed, 27 Nov 2024 03:36:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Z0au4VCW;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5E06324000C;
	Wed, 27 Nov 2024 11:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732707391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AtAL3kiByychgXd5PGLlA20TGFsqBl5wfm9kTmQ9gBw=;
	b=Z0au4VCWW0LhNDmSuPZE73jB/djBq/iXKybe9NlTLy7bffLoZXs9XDjH9lYq2+ZJAgXAoB
	eG3VzpPECbSXWu0IG0WKQ4tpIOpxNa7ec//W/E90xornc2fjdshBsTGqsSs7e3HAPZXCxm
	83qE7qtiy7GqSBinaBQduFWR4MLAXdnVoWvh2T1ljD7QhGtVpehdGhVuVkJmyd4oGiHo+p
	lxd87DaT5qKpV8UK37sK7AngjjZJOO3uU2USwLbvbH8h/HPbL+N5yRABBHwzPbs24sqHGj
	p0YJkY+d5L70uR1h8nA8vGOYd+WL+bNw8i0ZyrcK7keUUiMapXWOGjN2FasUvQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 27 Nov 2024 12:36:15 +0100
Subject: [yocto-docs][PATCH v3] ref-manual: classes: fix bin_package
 description
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241127-fix-bin-package-v3-1-ee09055000ac@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAC4ER2cC/2XNTQ7CIBAF4KsY1mIY+qsr72FcUBjsRIUGGqJpe
 ndpExNNl2/mzTcTixgIIzvtJhYwUSTvcij2O6Z75W7IyeTMpJAlAFTc0ot35Pig9F3lNaJp6qK
 wHWrD8tUQMFdW8XLNuac4+vBeHyRYpl+r3VgJOPCjqK2AsrVGqXPn/fggd9D+yRYtyR9Biq0gF
 wEaVWnZlJWR/8I8zx8rIvCz8gAAAA==
X-Change-ID: 20241115-fix-bin-package-eed7633fbecd
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4336;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=ePiZX1DelLujJRc6sXh+V6vwgVYy62rB4QHe7sTH91g=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnRwQ/gApWePyb9hpGXz4+cHi3feZQcpOY4t1Tr
 Mjh3Crm0DuJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ0cEPwAKCRDRgEFAKaOo
 NrIQEACmObOPwSIP+SL0+iVd29jekRSwjcSgvmDTn94sf56ul1sLEtk+mKNDW8qXcuccSXpcMXC
 Bl9km4Cg8AVxk3AkaSswYo7ea9V52S6juJ5yiHyMbRUoE96P70ndysZoKkzbPSqAAsu/b19fW1Q
 FZ1ecoji/n/4njv+7XnzfKVdbqJM8SWiY99gKUXSk+EiqXH+aR15uhOXS6/g+Cf1kDLmU3ba+JL
 qYN+z8qgNGVjfpRxL2ZIL0ovaOxOOthF86D+zxN0DGpDD/aYd4VWHsOnwUPnfvCsP4A3d8OYDhQ
 bYMfEF4jECwG1spOyLKAb2bTERc2VpvcdPMDZ8N/jkQsjIrn28CPV4Rq0IFeKbOCcAKdCBzFxoC
 ph/3SQWDgVSOdMw6H3mWWeiW1oRzJiIWfJOQ4OUcomZ6+qHEUb8djxy2SbkKHz9u6dQWtn/bTeS
 k/63uJuxnOQD5dNjo+wBybxS4atIopR77jEcUoCxap+VpTbI+JbH8ChvVbQMUj2R3NjRz6bOagt
 U47atMxblnv5vRJ3Wah1U+aFsSdcm9dHn3wZjgVGEwDcOEniFH5F147DO2gsK8a3V8gEooyapgu
 BQDDnwi23JN0S5AC5Gf2TyLt08Eeg1QCpYamtxE6bBfZFxp3OjBRVcC2iDPkqZ0uRxYvJVFzzNR
 DOelHrLTyUI4tJA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 27 Nov 2024 11:36:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5826

The previous bin_package description was confusing: it would instruct to
use the git fetcher to extract the content of an RPM package using the
`subpath` option - but that's not possible as the git fetcher can be
used to clone a repository but not to do the extraction.

Update the description by telling what it really does and what it
doesn't do, and by giving an HTTPS+RPM example.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v3:
- Actually explain what bin_package does and what it doesn't do.
- Link to v2: https://lore.kernel.org/r/20241120-fix-bin-package-v2-1-917a5c2745d2@bootlin.com

Changes in v2:
- Instead of updating the example, update the description of the class
  with a more common (and working) example usage of the class.
- Link to v1: https://lore.kernel.org/r/20241118-fix-bin-package-v1-1-906f0148fdaa@bootlin.com
---
 documentation/ref-manual/classes.rst | 42 +++++++++++++++++++++---------------
 1 file changed, 25 insertions(+), 17 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index b92f4e4f20ea8f702c90f4e3d29251b2461d07d0..ff9979d1f1ac0afb0ee59fcd193dec2c1323e1fe 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -159,27 +159,35 @@ software that includes bash-completion data.
 ``bin_package``
 ===============
 
-The :ref:`ref-classes-bin-package` class is a helper class for recipes that extract the
-contents of a binary package (e.g. an RPM) and install those contents
-rather than building the binary from source. The binary package is
-extracted and new packages in the configured output package format are
-created. Extraction and installation of proprietary binaries is a good
-example use for this class.
+The :ref:`ref-classes-bin-package` class is a helper class for recipes that
+disables the :ref:`ref-tasks-configure` and :ref:`ref-tasks-compile` tasks and
+copies the content of the :term:`S` directory into the :term:`D` directory. This
+is useful for installing binary packages (e.g. RPM packages) by passing the
+package in the :term:`SRC_URI` variable and inheriting this class.
 
-.. note::
+For RPMs and other packages that do not contain a subdirectory, you should set
+the :term:`SRC_URI` option ``subdir`` to :term:`BP` so that the contents are
+extracted to the directory expected by the default value of :term:`S`. For
+example::
+
+   SRC_URI = "https://example.com/downloads/somepackage.rpm;subdir=${BP}"
 
-   For RPMs and other packages that do not contain a subdirectory, you
-   should specify an appropriate fetcher parameter to point to the
-   subdirectory. For example, if BitBake is using the Git fetcher (``git://``),
-   the "subpath" parameter limits the checkout to a specific subpath
-   of the tree. Here is an example where ``${BP}`` is used so that the files
-   are extracted into the subdirectory expected by the default value of
-   :term:`S`::
+This class assumes that the content of :term:`S` already contains the
+installation paths on the target , which is generally the case for binary
+packages. For example, a RPM package containing a library should already contain
+the ``usr/lib`` directories, and should be extracted as
+``${S}/usr/lib/<library>.so`` to be installed in :term:`D` correctly.
+
+.. note::
 
-      SRC_URI = "git://example.com/downloads/somepackage.rpm;branch=main;subpath=${BP}"
+   The extraction of the package passed in :term:`SRC_URI` is not handled by the
+   :ref:`ref-classes-bin-package` class, and is done by the appropriate
+   :ref:`fetcher <bitbake-user-manual/bitbake-user-manual-fetching:fetchers>`
+   depending on the nature of the package.
 
-   See the ":ref:`bitbake-user-manual/bitbake-user-manual-fetching:fetchers`" section in the BitBake User Manual for
-   more information on supported BitBake Fetchers.
+   See the ":ref:`bitbake-user-manual/bitbake-user-manual-fetching:fetchers`"
+   section in the BitBake User Manual for more information about supported
+   BitBake Fetchers.
 
 .. _ref-classes-binconfig:
 

---
base-commit: 4175839e718db49bf6971e900c1cf176d03458d7
change-id: 20241115-fix-bin-package-eed7633fbecd

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


