Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60F83CC6B2B
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 08:13:57 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10991.1775117630109921606
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Apr 2026 01:13:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=PICqvWpS;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 78E5FC5997B
	for <docs@lists.yoctoproject.org>; Thu,  2 Apr 2026 08:14:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D8F925FDEB
	for <docs@lists.yoctoproject.org>; Thu,  2 Apr 2026 08:13:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 682D410451191;
	Thu,  2 Apr 2026 10:13:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775117624; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=C8iIwj/dKRFXvUrYftH7Pqtg9K7OsJqWB7P16QlJrjo=;
	b=PICqvWpS9kN9HIxs7rESFHnn4QFsZBxYwNxlRbm7Zl6Hxgmu7d2tgePtiVxYLGezkXyoKT
	SoS6z4wSueVWf04D4oti7Z8nwMinjwqj9FxZC/rHSvtxeHuI7IsmUvtYw/UwSC/JmZCjlF
	+NH/ZNQrPTr0gv9YVP6kmXhBctoJUftX2Fnxup3gl1HFytF0nYUoVKAT1+Urg4d2sVchdc
	GNprQ3qIQGWv/4FqE+V2t6ny8jTkbBOWxHBksln3viLyc9do8WW6d8Vp13y/hlF6WU/Eo+
	yh6ZdyJs6jryf55RA+KzRoCtCIL8w3OlokdzRT62kNqF309ZyYYoYWgVax0cCw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 02 Apr 2026 10:13:27 +0200
Subject: [PATCH 1/2] set_versions.py: skip laverne branch for closest
 branch
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-set-versions-fixes-v1-1-0609a8747b96@bootlin.com>
References: <20260402-set-versions-fixes-v1-0-0609a8747b96@bootlin.com>
In-Reply-To: <20260402-set-versions-fixes-v1-0-0609a8747b96@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1672;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=dVdJezkaV3DXiP5Ml4lElp2dCPqb4EdeZ8RwWRbx/fE=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpziUzXq4QepMQTGBQJPvvfKy5eIbECms8K3GNL
 whcrvCDOfeJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCac4lMwAKCRDRgEFAKaOo
 NmufD/9OV5Ggnx13dFC2EEzvYIiGB60wSVlDL1mvGbUe9GetNW8ZRTbhaKUCIFOb9FtPNHS3QJb
 AVQR3/ReNl/VxGBOl23gJvDgeLpKbR4EulQTphwL6EOyM5UxtHyXVvNq35vy+Ww/TDDgiVzrLE8
 Xj6aGYaqJaGXHYysjb8jnnCB3leNT5MJicTf9/FPNnepRMI5ULlFzI7Lra/PCmAnohlS54fLkQh
 3IZY+xp6FbbdDcPAfxI/3m9+OPZNrXljp8VTZRvPJw8Wf/6VGalizgJgdmTeig/aY0aguCuqeyF
 c8FvsziC2zTdyGKCjNBJZWWm3NGlpBJTP0+6IEkeDJYv2JKbg3WlNeASsOc2J+VC/35Df+xXFuX
 sB9kEqgKsT0AoDETFo4buQj7NfA7LjcCxh6+6lysF92CVt0pwkJpjbyuxX0sgUWi83jiAX+ZgIh
 piBcudxVoIUAJ2e8zdk9XprZZ9vPOg87uV/q4RWu78bsJ3aOotfWb8khaE/RXejEAa/95hgjdb+
 YC+HrdEluGNjQzkK/scSiiK23HIEixuuxpdz87MYf1OQrgU6NggTDW1FAMoEKsW1rbFWjiWp9Zw
 mTYk3bmEZlAqP4E32Ts+DNpZ+Qt4HNqzXazGR29+WQQOsUdR7kFZQ2fKXYa5QEXk15a150ewuEC
 eIXqJE8k8GwMELw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 Apr 2026 08:13:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9158

The laverne branch was created but never branched off, which breaks the
algorithm trying to determine the closest branch as it always gets count
0. Skip this branch as it is old and we'll never branch off of it now.

This fixes the following issue:

Branch laverne has count 0
Nearest release branch estimated to be laverne
Traceback (most recent call last):
  File "/data/yoctoproject/ws/repos/yocto-docs/documentation/./set_versions.py", line 167, in <module>
    bitbakeversion = bitbake_mapping[ourseries]
                     ~~~~~~~~~~~~~~~^^^^^^^^^^^
KeyError: 'laverne'

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/set_versions.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index 29638b324..465204998 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -142,6 +142,11 @@ if ourversion is None:
             result = subprocess.run(["git", "log", "--format=oneline", "HEAD..origin/" + b],
                                     stdout=subprocess.PIPE, stderr=subprocess.PIPE,
                                     universal_newlines=True)
+            # The laverne branch was created but never branched off, which
+            # breaks this algorithm as this always gets count 0. Skip this
+            # branch as it is old and we'll never branch off of it now.
+            if b == "laverne":
+                continue
             if result.returncode == 0:
                 count = result.stdout.count('\n')
                 if not possible_branch or count < branch_count:

-- 
2.53.0


