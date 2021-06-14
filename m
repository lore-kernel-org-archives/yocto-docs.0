Received: from mx1.emlix.com (mx1.emlix.com [136.243.223.33])
 by mx.groups.io with SMTP id smtpd.web08.26031.1623648633080473633
 for <docs@lists.yoctoproject.org>;
 Sun, 13 Jun 2021 22:30:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: emlix.com, ip: 136.243.223.33, mailfrom: dwagenknecht@emlix.com)
Received: from mailer.emlix.com (unknown [81.20.119.6])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id EBE3B5FBD7
	for <docs@lists.yoctoproject.org>; Mon, 14 Jun 2021 07:30:14 +0200 (CEST)
From: "Daniel Wagenknecht" <dwagenknecht@emlix.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 2/2] ref-manual: variables: fixup class reference in IMAGE_MANIFEST
Date: Mon, 14 Jun 2021 07:30:13 +0200
Message-Id: <20210614053013.68669-3-dwagenknecht@emlix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614053013.68669-1-dwagenknecht@emlix.com>
References: <20210614053013.68669-1-dwagenknecht@emlix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The definition of IMAGE_MANIFEST was moved to a different class. Fixup
the documentation to reflect this change.

Signed-off-by: Daniel Wagenknecht <dwagenknecht@emlix.com>
---
 documentation/ref-manual/variables.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
index 1be825fab..ff37c9f18 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3099,7 +3099,7 @@ system and gives an overview of their function and =
contents.
=20
           packagename packagearch version
=20
-      The :ref:`image <ref-classes-image>` class defines the manifest
+      The :ref:`rootfs-postcommands <ref-classes-rootfs*>` class defines=
 the manifest
       file as follows::
=20
          IMAGE_MANIFEST =3D"${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SU=
FFIX}.manifest"
--=20
2.25.1

