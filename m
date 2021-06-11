Received: from mx1.emlix.com (mx1.emlix.com [136.243.223.33])
 by mx.groups.io with SMTP id smtpd.web12.4745.1623392800686049610
 for <docs@lists.yoctoproject.org>;
 Thu, 10 Jun 2021 23:26:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: emlix.com, ip: 136.243.223.33, mailfrom: dwagenknecht@emlix.com)
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id 9EC2360068
	for <docs@lists.yoctoproject.org>; Fri, 11 Jun 2021 08:26:37 +0200 (CEST)
From: "Daniel Wagenknecht" <dwagenknecht@emlix.com>
To: docs@lists.yoctoproject.org
Cc: Daniel Wagenknecht <dwagenknecht@emlix.com>
Subject: [PATCH 1/2] ref-manual: variables: update examples refering to DEPLOY_DIR_IMAGE
Date: Fri, 11 Jun 2021 08:26:12 +0200
Message-Id: <20210611062613.188300-2-dwagenknecht@emlix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210611062613.188300-1-dwagenknecht@emlix.com>
References: <20210611062613.188300-1-dwagenknecht@emlix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

DEPLOY_DIR_IMAGE has been replaced by IMGDEPLOYDIR for most use cases
since OE-Core rev 6d969bacc718e21a5246d4da9bf9639dcae29b02. Update
examples given in the documentation to use IMGDEPLOYDIR and match their
implementation.

Signed-off-by: Daniel Wagenknecht <dwagenknecht@emlix.com>
---
 documentation/ref-manual/variables.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
index 8ebc17f24..2e859c718 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -2946,7 +2946,7 @@ system and gives an overview of their function and =
contents.
       an override for the associated type. Here is an example::
=20
          IMAGE_CMD_jffs2 =3D "mkfs.jffs2 --root=3D${IMAGE_ROOTFS} \
-             --faketime --output=3D${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.roo=
tfs.jffs2 \
+             --faketime --output=3D${IMGDEPLOYDIR}/${IMAGE_NAME}.rootfs.=
jffs2 \
              ${EXTRA_IMAGECMD}"
=20
       You typically do not need to set this variable unless you are addi=
ng
@@ -3095,10 +3095,10 @@ system and gives an overview of their function an=
d contents.
       The :ref:`image <ref-classes-image>` class defines the manifest
       file as follows::
=20
-         IMAGE_MANIFEST =3D"${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.man=
ifest"
+         IMAGE_MANIFEST =3D"${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SU=
FFIX}.manifest"
=20
       The location is
-      derived using the :term:`DEPLOY_DIR_IMAGE`
+      derived using the :term:`IMGDEPLOYDIR`
       and :term:`IMAGE_NAME` variables. You can find
       information on how the image is created in the ":ref:`overview-man=
ual/concepts:image generation`"
       section in the Yocto Project Overview and Concepts Manual.
--=20
2.25.1

