Received: from mx1.emlix.com (mx1.emlix.com [136.243.223.33])
 by mx.groups.io with SMTP id smtpd.web09.4941.1623392793421835163
 for <docs@lists.yoctoproject.org>;
 Thu, 10 Jun 2021 23:26:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: emlix.com, ip: 136.243.223.33, mailfrom: dwagenknecht@emlix.com)
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id 45B916004E
	for <docs@lists.yoctoproject.org>; Fri, 11 Jun 2021 08:26:31 +0200 (CEST)
From: "Daniel Wagenknecht" <dwagenknecht@emlix.com>
To: docs@lists.yoctoproject.org
Cc: Daniel Wagenknecht <dwagenknecht@emlix.com>
Subject: [PATCH 0/2] ref-manual: variables: document IMGDEPLOYDIR
Date: Fri, 11 Jun 2021 08:26:11 +0200
Message-Id: <20210611062613.188300-1-dwagenknecht@emlix.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello!

I recently stumbled upon direct references to DEPLOY_DIR_IMAGE when
upgrading an old Yocto Krogoth project. Those caused the symlinking of
the most recent image to fail. I needed quite some time to find the root
cause, since IMGDEPLOYDIR was not documented yet.

I'm unsure if a note to `documentation/ref-manual/migration-2.2.rst`
should also be added, since that is when the changes where introduced.

Best Regards
Daniel Wagenknecht


Daniel Wagenknecht (2):
  ref-manual: variables: update examples refering to DEPLOY_DIR_IMAGE
  ref-manual: variables: document IMGDEPLOYDIR

 documentation/ref-manual/variables.rst | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

--=20
2.25.1

