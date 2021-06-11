Received: from mx1.emlix.com (mx1.emlix.com [136.243.223.33])
 by mx.groups.io with SMTP id smtpd.web10.5309.1623396686604556347
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Jun 2021 00:31:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: emlix.com, ip: 136.243.223.33, mailfrom: dwagenknecht@emlix.com)
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id CD15C5F9A9
	for <docs@lists.yoctoproject.org>; Fri, 11 Jun 2021 09:31:24 +0200 (CEST)
From: "Daniel Wagenknecht" <dwagenknecht@emlix.com>
To: docs@lists.yoctoproject.org
Cc: Daniel Wagenknecht <dwagenknecht@emlix.com>
Subject: [PATCH 3/3] ref-manual: migration-2.2: add note about IMGDEPLOYDIR
Date: Fri, 11 Jun 2021 09:30:46 +0200
Message-Id: <20210611073045.289728-1-dwagenknecht@emlix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210611062613.188300-3-dwagenknecht@emlix.com>
References: <20210611062613.188300-3-dwagenknecht@emlix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Daniel Wagenknecht <dwagenknecht@emlix.com>
---
 documentation/ref-manual/migration-2.2.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/documentation/ref-manual/migration-2.2.rst b/documentation/r=
ef-manual/migration-2.2.rst
index a60ce8d52..5fab00faf 100644
--- a/documentation/ref-manual/migration-2.2.rst
+++ b/documentation/ref-manual/migration-2.2.rst
@@ -263,6 +263,17 @@ If you have recipes or
 classes that use ``KERNEL_IMAGE_BASE_NAME`` directly, you might need to
 update the references to ensure they continue to work.
=20
+.. _migration-2.2-imgdeploydir-replaces-deploy-dir-image-for-most-use-ca=
ses:
+
+``IMGDEPLOYDIR`` Replaces ``DEPLOY_DIR_IMAGE`` for Most Use Cases
+-----------------------------------------------------------------
+
+The :term:`IMGDEPLOYDIR` variable was introduced to allow sstate caching=
 of
+image creation results. Image recipes defining custom :term:`IMAGE_CMD` =
or
+doing postprocessing on the generated images need to be adapted to use
+``IMGDEPLOYDIR`` instead of :term:`DEPLOY_DIR_IMAGE`. ``IMAGE_MANIFEST``
+creation and symlinking of the most recent image file will fail otherwis=
e.
+
 .. _migration-2.2-bitbake-changes:
=20
 BitBake Changes
--=20
2.25.1

