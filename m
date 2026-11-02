Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8889.1793611418554608567
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Nov 2026 01:23:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ExtkH3Ns;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D61EB1A1406;
	Mon,  2 Nov 2026 09:23:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A573860750;
	Mon,  2 Nov 2026 09:23:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A9A321032912A;
	Mon,  2 Nov 2026 10:23:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793611416; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8QZS7KmW0xyu/ohy/hJDPgj3IMleCvX1pF0XoUVap4A=;
	b=ExtkH3NsBqGN2av6ey7OZ3FYBy1H2zn3t1+BXTlp4eI017PzMfJg0/S+Y95x4xW7/2ukpD
	+YUZ7sjVeXXQj5PGYeZKXfbnpGGiJ3oaDHc3MkkyGWQaFr0H141CGwwaQpCy6k/7wB6FKT
	0V48H2Z5vySLCG25Fb5GAE9Gk4h4+rghp5PvqgtrOul1IK2zs1tbuT+Pkn/YktuIk/9qIS
	TOeYumd1k/2pggSGdcchdmVGLE+2m8IZEsqZ2xr/L2A/Y48gf+3DkgzE93ljsacyq9bOor
	jh4B1A5TMIHEB1RwYilBFd1Z9DZDamc06Y9htrk2RBE0hLYKItFS6H3RgWYLbw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 02 Nov 2026 10:22:59 +0100
Subject: [PATCH 2/3] ref-manual/kickstart.rst: warn about the include
 directive only working for .wks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-wks-in-v1-2-fbb797a3d5cb@bootlin.com>
References: <20261102-wks-in-v1-0-fbb797a3d5cb@bootlin.com>
In-Reply-To: <20261102-wks-in-v1-0-fbb797a3d5cb@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Trevor Woerner <twoerner@gmail.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=872;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=ya9a4LTeHv9Y6z3bdOzoeuP/egCQMXGRJj8IPnA8sUM=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBq6FZ0VDinBhgBr9KAHWSt4/RFufyUIbGd0NDBm
 M1lfCK8KJyJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCauhWdAAKCRDRgEFAKaOo
 NsOvD/44744nOUIXJBtCxXXd03qOI50woNo2xwKH/jp1z3E+EVPyiC3sBWtbrBE5q2/3uxVOb+V
 bDvNZTXK6XmJt6gGrouk+a24x0tYXC/hzUMommtKUSM6rugIyXflc305l4RDvcDMla3uDLw++zD
 O8B+pyQpDD1rrZT0qrHaw8V8D4fxCBig3durDI3HAI0Jb1oz+/RyOAwiwqQ0e0HNs46+uQK3bUz
 sMGd+POcCwDaBRWfSFxJajbpH6BAjJ/s2xR5+QKkqs9jOLUEOrnXH7wh0jW9pVyd2f4Jbp6McZ4
 TrOYep+FmnF5EcbDwV5CM5KxoRUa9WjgGtr/KOJUoRfeicfEYP7+pYN4aqnz6A7jnC90i3QrKHU
 jKhEekum2UoG816/cEh/MLdMHqIEHt5kbhiZrpSt0V5g1lPaxTXDjvPCyFdh74tCaj7b2YnlxGq
 Rk/ogCm60YrbcVwMKIuCUhQ858J6xNEkCaGXp/0sodFCIIc7ce5+HCCHKQkXRDushti6OTYIILq
 e8PZliegZt+0qOcjHe3rGt7qBrEjjNhkLNxw/C1uqvB+wkwvAuXV4jvU6mUfgJjvQqGnPxm4/JD
 rgx8T5gLINfAXdAD5idWSUIKv93+OWg2uiqLR2+tnNV4RAdFNKNKBG9f8KNSGfM29iRhkIJR9xS
 4THv+a0mfgVsjvw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Mon, 02 Nov 2026 09:23:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10754

The include directive only works for .wks files, not .wks.in. Document
this limitation.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/kickstart.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/documentation/ref-manual/kickstart.rst b/documentation/ref-manual/kickstart.rst
index 1144f1a12..5223b80a9 100644
--- a/documentation/ref-manual/kickstart.rst
+++ b/documentation/ref-manual/kickstart.rst
@@ -246,3 +246,9 @@ the current file. For example:
    include common.wks.inc
 
    bootloader --configfile="directdisk-bootloader-config.cfg"
+
+.. warning::
+
+   File inclusion is only supported for ``.wks`` files, not ``.wks.in``. See the
+   :ref:`ref-manual/kickstart:Kickstart Variable Expansion` section below for
+   more details on the differences between the two files.

-- 
2.55.0

