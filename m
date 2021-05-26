Received: from lilium.sigma-star.at (lilium.sigma-star.at [109.75.188.150])
 by mx.groups.io with SMTP id smtpd.web10.4064.1622066091690980774
 for <docs@lists.yoctoproject.org>;
 Wed, 26 May 2021 14:54:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: nod.at, ip: 109.75.188.150, mailfrom: richard@nod.at)
Received: from localhost (localhost [127.0.0.1])
	by lilium.sigma-star.at (Postfix) with ESMTP id 8FA0A1817A0D2;
	Wed, 26 May 2021 23:54:49 +0200 (CEST)
Received: from lilium.sigma-star.at ([127.0.0.1])
	by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id DLGS1kdQUGUp; Wed, 26 May 2021 23:54:49 +0200 (CEST)
Received: from lilium.sigma-star.at ([127.0.0.1])
	by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id jjRDQmvgViFb; Wed, 26 May 2021 23:54:49 +0200 (CEST)
From: "Richard Weinberger" <richard@nod.at>
To: docs@lists.yoctoproject.org
Cc: Richard Weinberger <richard@nod.at>
Subject: [yocto-docs][PATCH v2] Document erofs filesystem targets
Date: Wed, 26 May 2021 23:54:43 +0200
Message-Id: <20210526215443.16066-1-richard@nod.at>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Richard Weinberger <richard@nod.at>
---
Changes since v1:
 - Order filesystem types alphabetically (requested by Quentin Schulz)
---
 documentation/ref-manual/kickstart.rst | 8 +++++---
 documentation/ref-manual/variables.rst | 3 +++
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/documentation/ref-manual/kickstart.rst b/documentation/ref-m=
anual/kickstart.rst
index 8308ffff5b72..a7443f9ea37b 100644
--- a/documentation/ref-manual/kickstart.rst
+++ b/documentation/ref-manual/kickstart.rst
@@ -106,13 +106,15 @@ the ``part`` and ``partition`` commands:
 -  ``--fstype``: Sets the file system type for the partition. Valid
    values are:
=20
-   -  ``ext4``
+   -  ``btrfs``
=20
-   -  ``ext3``
+   -  ``erofs``
=20
    -  ``ext2``
=20
-   -  ``btrfs``
+   -  ``ext3``
+
+   -  ``ext4``
=20
    -  ``squashfs``
=20
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
index df6413b68ae9..b0dacf9fbf83 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3279,6 +3279,9 @@ system and gives an overview of their function and =
contents.
       - cpio.lzma
       - cpio.xz
       - cramfs
+      - erofs
+      - erofs-lz4
+      - erofs-lz4hc
       - ext2
       - ext2.bz2
       - ext2.gz
--=20
2.26.2

