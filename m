Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.3596.1626871834429918554
 for <docs@lists.yoctoproject.org>;
 Wed, 21 Jul 2021 05:50:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3E146D
	for <docs@lists.yoctoproject.org>; Wed, 21 Jul 2021 05:50:28 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5CEB83F73D
	for <docs@lists.yoctoproject.org>; Wed, 21 Jul 2021 05:50:28 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH] kickstart: update busybox note regarding PARTUUID
Date: Wed, 21 Jul 2021 13:50:25 +0100
Message-Id: <20210721125025.3996595-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

As of oe-core c996cabf the default BusyBox configuration supports
PARTUUID, so update the note to reflect this.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 documentation/ref-manual/kickstart.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/kickstart.rst b/documentation/ref-m=
anual/kickstart.rst
index fc723ccbe..9de3f763d 100644
--- a/documentation/ref-manual/kickstart.rst
+++ b/documentation/ref-manual/kickstart.rst
@@ -54,8 +54,9 @@ must also provide one of the ``--ondrive``, ``--ondisk`=
`, or
 .. note::
=20
    The mount program must understand the PARTUUID syntax you use with
-   ``--use-uuid`` and non-root *mountpoint*, including swap. The BusyBox
-   versions of these application are currently excluded.
+   ``--use-uuid`` and non-root *mountpoint*, including swap. The default
+   configuration of BusyBox in OpenEmbedded support this, but this may
+   be disabled in custom configurations.
=20
 Here is an example that uses "/" as the mountpoint. The command uses
 ``--ondisk`` to force the partition onto the ``sdb`` disk::
--=20
2.25.1

