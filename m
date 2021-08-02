Received: from smtp.missinglinkelectronics.com (smtp.missinglinkelectronics.com [94.130.14.54])
 by mx.groups.io with SMTP id smtpd.web08.16647.1627886468181401062
 for <docs@lists.yoctoproject.org>;
 Sun, 01 Aug 2021 23:41:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: missinglinkelectronics.com, ip: 94.130.14.54, mailfrom: stefan.wiehler@missinglinkelectronics.com)
Received: from localhost (localhost [127.0.0.1])
	by smtp.missinglinkelectronics.com (Postfix) with ESMTP id 1C0AC202DD
	for <docs@lists.yoctoproject.org>; Mon,  2 Aug 2021 08:41:06 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at missinglinkelectronics.com
Received: from smtp.missinglinkelectronics.com ([127.0.0.1])
	by localhost (mail.missinglinkelectronics.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0x5ZYi_o_H-X; Mon,  2 Aug 2021 08:41:05 +0200 (CEST)
Received: from pfanne-bionic2.mle (p578c5bfe.dip0.t-ipconnect.de [87.140.91.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: stefan)
	by smtp.missinglinkelectronics.com (Postfix) with ESMTPSA id B6167200A8;
	Mon,  2 Aug 2021 08:41:05 +0200 (CEST)
From: "Stefan Wiehler" <stefan.wiehler@missinglinkelectronics.com>
To: docs@lists.yoctoproject.org
Cc: Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>
Subject: [PATCH] dev-manual: fix source release example script
Date: Mon,  2 Aug 2021 08:28:05 +0200
Message-Id: <20210802062805.43135-1-stefan.wiehler@missinglinkelectronics.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>
---
 documentation/dev-manual/common-tasks.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/de=
v-manual/common-tasks.rst
index 5600076b7..77af03b3c 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -10929,7 +10929,7 @@ concerned with GPL code as identified by running =
the following script:
          p=3D${p%-*}
          # Only archive GPL packages (update *GPL* regex for your licens=
e check)
          numfiles=3D`ls tmp/deploy/licenses/$p/*GPL* 2> /dev/null | wc -=
l`
-         if [ $numfiles -gt 1 ]; then
+         if [ $numfiles -ge 1 ]; then
             echo Archiving $p
             mkdir -p $src_release_dir/$p/source
             cp $d/* $src_release_dir/$p/source 2> /dev/null
--=20
2.29.2

