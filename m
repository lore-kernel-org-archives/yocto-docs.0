Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70064D6E2C9
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 07:57:42 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.8610.1732089452786584531
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Nov 2024 23:57:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=eSIZ8LQp;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7807960007;
	Wed, 20 Nov 2024 07:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732089450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=baLEHIu0F3q8+nf//k0IEecOs83Yl/3RhD9bhCANV+Y=;
	b=eSIZ8LQp83uoL+FDRfgaHeq5H3isdIO6+fXJ5V9mpYt4+3DZT0MxQo5DHe+K/Pf8BQJWDy
	RlJYGMZmXrUEH96zRYGsgf44y3u3gvAayrt4jrGEW4vpq2MqAbY7tG+TSa+Yd9pEcIaogR
	M3WdiXOSmu1awVMD+NOXHaL7I+/NDXagmW2sL47LJkI7QKAookOhdwBUdKjlurs/SciGa3
	3x5qc49ttTjM7uhGtjbkOrw7PQ08AMOVtnzFAJNnxZ6M1ls0MXmzHFKV0k0hZnzZCGAKF9
	3OIUAfh/F+UnCziIud1DCutciKxu/3YMFRAaPnnmS/12lUav1bUonKu9lmOzzA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 20 Nov 2024 08:57:08 +0100
Subject: [yocto-docs PATCH v2] ref-manual: classes: fix bin_package
 description
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241120-fix-bin-package-v2-1-917a5c2745d2@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAFOWPWcC/2WNyw6CMBBFf4XM2hqmIKIr/8Ow6GMqE7UlLSEa0
 n+3krhyee7ce2aFRJEpwblaIdLCiYMvIHcVmFH5Gwm2hUHWskXEg3D8Epq9mJS5q3ImsseuaZw
 mY6GspkilshmvQ+GR0xzie3uw4Df9ufo/14ICxanuXI1t76xSFx3C/GC/N+EJQ875A5apFdiwA
 AAA
X-Change-ID: 20241115-fix-bin-package-eed7633fbecd
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3574;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=EV7b3hIONYQo2aaLf9Dq6f4A+bMz7n/HbDIs0eB3LDM=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnPZZm1u7bVaSsRLUbaAvpZU4DBLyDZiUwkuv1g
 z2jnXSgJDqJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZz2WZgAKCRDRgEFAKaOo
 NjamD/oDvFxitf1YRB7sX/7o1AZ+nqbX6vZvKQWAav5hYOzfgG7i8r5otrjMDEgngFIGDBDklIT
 up75SV7P+WhSn5ACE0pwG65QDsKqbyOEF6Y7bs5WI4pohZocJFBOyXYTcwInTZaqW4ASM93iIwu
 cyYq3kOeTp2keuAs5D44T7Z48scjV5JfT/LU7r/oJZZUFzCyZQUs2ZBGY0+/RGA9NbikmmDNv5l
 D905HK32dEGMs5Gqi2F7MhgSAe3tzfhE8E7vhGqevaIguPx3tHsDsUtxXUo1f1wopLhUaLxnhlU
 VzBU7Q1tfN/voQEW284QBF3EpjuL1LFmjflH6ZkFKWkzGDaNsW8frLQYMkTTgG89Gm+QTaMU5Cg
 KXtRTpM/FC0MvDxs1Yx5V7U/cinToU8W+Z3pfzavCZUfvM4VeVOrFFb2fuO/226IvvAeEVKkmA8
 CnzTCCKtJLWS2HChLDcVbF2/d80CUvIeiHN/HI4bJBcQjFJ+no4Mekc64h2ZUtNHzy2AjpS6XY/
 LJFrgzNH9hjCRXbmfTPdicFd6IyuQ5eDx++4+W5+6SZxTaPrAae0Gc6vHNyBDToe7hP7YdeYZMc
 UAXLplMuTyiri2LwBNnZ9LJuvc0GuF2ebCRLCRqp9AQWp3lbOS3Kzv1t+AKqJL8NyhwuT72ySaM
 3f81oGZ76mnkAEQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Nov 2024 07:57:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5772

The previous bin_package description was confusing: it would instruct to
use the git fetcher to extract the content of an RPM package using the
`subpath` option - but that's not possible as the git fetcher can be
used to clone a repository but not to do the extraction.

Simplify the example with the HTTP fetcher that points to an RPM file,
and instruct the user to use `subdir` to extract its content to the
directory expected by S.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- Instead of updating the example, update the description of the class
  with a more common (and working) example usage of the class.
- Link to v1: https://lore.kernel.org/r/20241118-fix-bin-package-v1-1-906f0148fdaa@bootlin.com
---
 documentation/ref-manual/classes.rst | 38 ++++++++++++++++--------------------
 1 file changed, 17 insertions(+), 21 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index b92f4e4f20ea8f702c90f4e3d29251b2461d07d0..68f5d32e49d1f6ec41b2a0e25a2db5b7f70d0190 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -159,27 +159,23 @@ software that includes bash-completion data.
 ``bin_package``
 ===============
 
-The :ref:`ref-classes-bin-package` class is a helper class for recipes that extract the
-contents of a binary package (e.g. an RPM) and install those contents
-rather than building the binary from source. The binary package is
-extracted and new packages in the configured output package format are
-created. Extraction and installation of proprietary binaries is a good
-example use for this class.
-
-.. note::
-
-   For RPMs and other packages that do not contain a subdirectory, you
-   should specify an appropriate fetcher parameter to point to the
-   subdirectory. For example, if BitBake is using the Git fetcher (``git://``),
-   the "subpath" parameter limits the checkout to a specific subpath
-   of the tree. Here is an example where ``${BP}`` is used so that the files
-   are extracted into the subdirectory expected by the default value of
-   :term:`S`::
-
-      SRC_URI = "git://example.com/downloads/somepackage.rpm;branch=main;subpath=${BP}"
-
-   See the ":ref:`bitbake-user-manual/bitbake-user-manual-fetching:fetchers`" section in the BitBake User Manual for
-   more information on supported BitBake Fetchers.
+The :ref:`ref-classes-bin-package` class is a helper class for recipes that
+extracts the contents of a binary package (e.g. an RPM package) and installs
+those contents rather than building the binary from source. The binary package
+is extracted and new packages in the configured output package format are
+created. Extraction and installation of proprietary binaries is a good example
+use for this class.
+
+For RPMs and other packages that do not contain a subdirectory, you should set
+the :term:`SRC_URI` option ``subdir`` to :term:`BP` so that the contents are
+extracted to the directory expected by the default value of :term:`S`. For
+example::
+
+   SRC_URI = "https://example.com/downloads/somepackage.rpm;subdir=${BP}"
+
+See the ":ref:`bitbake-user-manual/bitbake-user-manual-fetching:fetchers`"
+section in the BitBake User Manual for more information about supported BitBake
+Fetchers.
 
 .. _ref-classes-binconfig:
 

---
base-commit: 7d5eb0cee5b2b7096969819d7d7ce569a3c92f27
change-id: 20241115-fix-bin-package-eed7633fbecd

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


