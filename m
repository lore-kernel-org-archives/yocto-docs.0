Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.12798.1620910094817860822
 for <docs@lists.yoctoproject.org>;
 Thu, 13 May 2021 05:48:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 317301480
	for <docs@lists.yoctoproject.org>; Thu, 13 May 2021 05:48:13 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B48D43F73B
	for <docs@lists.yoctoproject.org>; Thu, 13 May 2021 05:48:12 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH] ref-manual: Ubuntu 20.04 is also LTS
Date: Thu, 13 May 2021 13:48:08 +0100
Message-Id: <20210513124808.2703933-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 documentation/ref-manual/system-requirements.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documenta=
tion/ref-manual/system-requirements.rst
index fc251945db8..9b4afc043e6 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -41,7 +41,7 @@ distributions:
=20
 -  Ubuntu 18.04 (LTS)
=20
--  Ubuntu 20.04
+-  Ubuntu 20.04 (LTS)
=20
 -  Fedora 30
=20
--=20
2.25.1

