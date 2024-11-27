Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16072D6ACF2
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 16:01:31 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.75059.1732723289880430934
 for <docs@lists.yoctoproject.org>;
 Wed, 27 Nov 2024 08:01:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=KFTC5+mw;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 25DEEE000D;
	Wed, 27 Nov 2024 16:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732723287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MAxaeHq/6ZxW75pirT+1/rZVJef32yOBtIPez9FAIY8=;
	b=KFTC5+mwVWCN8iBXht4jf4jwZP8hcMYcdi8IyOzK+CkoGqfreyQX/nA202ErlTLwrfdk10
	OvJ5lYIgcS99RMfxpCiiIWfxxkZDezgk49tRkrI48g08WKIed9YMgF0reMB0CMeYkKpfD+
	J4td+AnStJyXtu0wwzB+Nmy8cc/tbgQMgRL3qGRDPYRYtOldVo0aPTXajRK4lHOOB+nZlU
	WYxZi6qfZRhSA6PXimJ1hR9ZorVy1dtMEzY5tpKZ9Fji2SWqHRHsJL6uMPnSnbGhzhXEcO
	J0m73kAaCit4zvWyLtqvkrY54h+LKunjEkJrvXQdDve9s+Pk4NZYjy+VnseamQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 27 Nov 2024 17:01:18 +0100
Subject: [yocto-docs][PATCH v4] ref-manual: classes: fix bin_package
 description
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241127-fix-bin-package-v4-1-e7f7c2325dea@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAE1CR2cC/2XNQQ6DIBAF0Ks0rEszoIh21Xs0XSAMlbQFA8a0M
 d69aNLExuWf+fNmIgmjw0TOh4lEHF1ywedQHg9Ed8rfkTqTM+HAS8aYoNa9aes87ZV+qLxGNLI
 qCtuiNiRf9RFzZRWvt5w7l4YQP+uDkS3Tn1XvrJFRRhuoLLCytkapSxvC8HT+pMOLLNrINwKHv
 cAXgUklNJelMHwvFFtB7oUiC4jQgBAAoPS/MM/zF6V+8X40AQAA
X-Change-ID: 20241115-fix-bin-package-eed7633fbecd
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4604;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=+xaEv2N8IzjcxVlTQSDP1r8unX4IaBpGgoeIf316acw=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnR0JWSMnfeDMERzlcaBweT04FZiDgNOfV/Krqb
 qw0RWBp6DeJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ0dCVgAKCRDRgEFAKaOo
 NnuVD/9QmtgvTRUeX0qucfUzlCYG9wYTZwaIOGuOcT9arByicZYOapFveuT7GM3tM2elJbtKJPz
 LF0QZXzo8zY4kSTum2VteFq4IBxVbuc69g+FTcRg8i/U6uFv3fNnvkMYTmYf2wlBW0lOG7UDxZy
 cPjYvlfO7hvt9N/OFh9gfpNuCCd8vC7YuUYbzulGwgdYoxeYY+m8ki77zZJYXD7omYfwmOo3WHa
 ae+26va37FQ6aY6qrQ0vgAVtTKyjyyQqS36dqnsoL4xMzIpny3+G9KEUUMk3EN6eFO/cGJhk8rl
 d+2zPqotzUROuKRJIt8YU4dkVsgrO2t7yuZfqH01AhEk1GQYzhWGziDqCowPgcgJ83H/iu/FkGs
 3E8zlmTUR9+/4DaQSTgWz6nacmHdTSeUP79XWKYnktC85j18Q6KLnULNlke/XvCVQYsddcmHaDK
 OCY8W9o/B7XI5l5Ho0afjcpSvG08po+ngd49fKc92ypLH+ThSU1PNJK1J0ake4iltoz57mfeUJG
 ctc0/BPVRw81Pb+Mc5XxDgSKncSYF7zzDF+4ijHrypMA7mnCDn8lzXrfd9c0C17SldkNElDC70p
 uHaznCJVSAyjrc0dCuwo3zkiOl2vP2oNXSO9rnijT+asedwo4fMSw2w0TU0WXWlFLTtu/lFMd++
 BLUq7XtqNt+gw0g==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 27 Nov 2024 16:01:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5839

The previous bin_package description was confusing: it would instruct to
use the git fetcher to extract the content of an RPM package using the
`subpath` option - but that's not possible as the git fetcher can be
used to clone a repository but not to do the extraction.

Update the description by telling what it really does and what it
doesn't do, and by giving an HTTPS+RPM example.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v4:
- Typos / corrections spotted by Quentin.
- Add tarball example.
- Link to v3: https://lore.kernel.org/r/20241127-fix-bin-package-v3-1-ee09055000ac@bootlin.com

Changes in v3:
- Actually explain what bin_package does and what it doesn't do.
- Link to v2: https://lore.kernel.org/r/20241120-fix-bin-package-v2-1-917a5c2745d2@bootlin.com

Changes in v2:
- Instead of updating the example, update the description of the class
  with a more common (and working) example usage of the class.
- Link to v1: https://lore.kernel.org/r/20241118-fix-bin-package-v1-1-906f0148fdaa@bootlin.com
---
 documentation/ref-manual/classes.rst | 45 ++++++++++++++++++++++--------------
 1 file changed, 28 insertions(+), 17 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index b92f4e4f20ea8f702c90f4e3d29251b2461d07d0..e7a8925806e1b6ea21e251c797c83d54b7049756 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -159,27 +159,38 @@ software that includes bash-completion data.
 ``bin_package``
 ===============
 
-The :ref:`ref-classes-bin-package` class is a helper class for recipes that extract the
-contents of a binary package (e.g. an RPM) and install those contents
-rather than building the binary from source. The binary package is
-extracted and new packages in the configured output package format are
-created. Extraction and installation of proprietary binaries is a good
-example use for this class.
+The :ref:`ref-classes-bin-package` class is a helper class for recipes, that
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
+
+This class can also be used for tarballs. For example::
 
-   For RPMs and other packages that do not contain a subdirectory, you
-   should specify an appropriate fetcher parameter to point to the
-   subdirectory. For example, if BitBake is using the Git fetcher (``git://``),
-   the "subpath" parameter limits the checkout to a specific subpath
-   of the tree. Here is an example where ``${BP}`` is used so that the files
-   are extracted into the subdirectory expected by the default value of
-   :term:`S`::
+   SRC_URI = "file://somepackage.tar.xz;subdir=${BP}"
 
-      SRC_URI = "git://example.com/downloads/somepackage.rpm;branch=main;subpath=${BP}"
+The :ref:`ref-classes-bin-package` class will copy the extracted content of the
+tarball from :term:`S` to :term:`D`.
+
+This class assumes that the content of the package as installed in :term:`S`
+mirrors the expected layout once installed on the target, which is generally the
+case for binary packages. For example, an RPM package for a library would
+usually contain the ``usr/lib`` directories, and should be extracted to
+``${S}/usr/lib/<library>.so.<version>`` to be installed in :term:`D` correctly.
+
+.. note::
 
-   See the ":ref:`bitbake-user-manual/bitbake-user-manual-fetching:fetchers`" section in the BitBake User Manual for
-   more information on supported BitBake Fetchers.
+   The extraction of the package passed in :term:`SRC_URI` is not handled by the
+   :ref:`ref-classes-bin-package` class, but rather by the appropriate
+   :ref:`fetcher <bitbake-user-manual/bitbake-user-manual-fetching:fetchers>`
+   depending on the file extension.
 
 .. _ref-classes-binconfig:
 

---
base-commit: 4175839e718db49bf6971e900c1cf176d03458d7
change-id: 20241115-fix-bin-package-eed7633fbecd

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


