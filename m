Received: from mx1.emlix.com (mx1.emlix.com [136.243.223.33])
 by mx.groups.io with SMTP id smtpd.web11.1856.1632386056267051097
 for <docs@lists.yoctoproject.org>;
 Thu, 23 Sep 2021 01:34:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: emlix.com, ip: 136.243.223.33, mailfrom: dwagenknecht@emlix.com)
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id 5D845630B9
	for <docs@lists.yoctoproject.org>; Thu, 23 Sep 2021 10:34:13 +0200 (CEST)
From: "Daniel Wagenknecht" <dwagenknecht@emlix.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 0/2] add notes about license implications of bundled initramfs
Date: Thu, 23 Sep 2021 10:34:10 +0200
Message-Id: <20210923083412.1500103-1-dwagenknecht@emlix.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

As discussed on IRC the license implications of using
INITRAMFS_IMAGE_BUNDLE are not necessarily obvious. This patchseries
adds notes about them in the relevant places.

Source of this interpretation of the license implications is the second
paragraph of
https://www.kernel.org/doc/html/latest/filesystems/ramfs-rootfs-initramfs=
.html#external-initramfs-images

I placed them where I saw fit, although this leads to multiple `note`
blocks in direct succession. If this should be avoided a more thorough
rewrite of those sections might be necessary.

Daniel Wagenknecht (2):
  common-tasks: add note about license implications of bundled initramfs
  ref-manual: add note about license implications of bundled initramfs

 documentation/dev-manual/common-tasks.rst | 6 ++++++
 documentation/ref-manual/variables.rst    | 6 ++++++
 2 files changed, 12 insertions(+)

--=20
2.25.1

