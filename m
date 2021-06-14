Received: from mx1.emlix.com (mx1.emlix.com [136.243.223.33])
 by mx.groups.io with SMTP id smtpd.web12.26308.1623648625308650442
 for <docs@lists.yoctoproject.org>;
 Sun, 13 Jun 2021 22:30:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: emlix.com, ip: 136.243.223.33, mailfrom: dwagenknecht@emlix.com)
Received: from mailer.emlix.com (unknown [81.20.119.6])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id BB7F05FB67
	for <docs@lists.yoctoproject.org>; Mon, 14 Jun 2021 07:30:14 +0200 (CEST)
From: "Daniel Wagenknecht" <dwagenknecht@emlix.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 1/2] ref-manual: variables: fixup example in IMAGE_CMD
Date: Mon, 14 Jun 2021 07:30:12 +0200
Message-Id: <20210614053013.68669-2-dwagenknecht@emlix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614053013.68669-1-dwagenknecht@emlix.com>
References: <20210614053013.68669-1-dwagenknecht@emlix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The example for IMAGE_CMD_jffs2 given in the glossary for IMAGE_CMD
didn't align with the implementation anymore. Update it to match the
implementation.

Signed-off-by: Daniel Wagenknecht <dwagenknecht@emlix.com>
---
 documentation/ref-manual/variables.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
index ee1043108..1be825fab 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -2952,8 +2952,8 @@ system and gives an overview of their function and =
contents.
       ``btrfs``, and so forth). When setting this variable, you should u=
se
       an override for the associated type. Here is an example::
=20
-         IMAGE_CMD_jffs2 =3D "mkfs.jffs2 --root=3D${IMAGE_ROOTFS} \
-             --faketime --output=3D${IMGDEPLOYDIR}/${IMAGE_NAME}.rootfs.=
jffs2 \
+         IMAGE_CMD_jffs2 =3D "mkfs.jffs2 --root=3D${IMAGE_ROOTFS} --fake=
time \
+             --output=3D${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX=
}.jffs2 \
              ${EXTRA_IMAGECMD}"
=20
       You typically do not need to set this variable unless you are addi=
ng
--=20
2.25.1

