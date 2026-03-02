Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 954FDE9B340
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 09:38:13 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.156860.1772444284003141380
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 01:38:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=jnOlbEr1;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 72F1A4E424DC
	for <docs@lists.yoctoproject.org>; Mon,  2 Mar 2026 09:38:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 438055FE89
	for <docs@lists.yoctoproject.org>; Mon,  2 Mar 2026 09:38:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D1B0B10369533;
	Mon,  2 Mar 2026 10:38:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772444281; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cv0V5WkpvU6yYGfeuZli8SNoLoUSLqGCFK6uBu/CVQw=;
	b=jnOlbEr1Tgrx7CG22yZazOc4keWziIzmjV/bsGQRmBpzdnONH1jXaQHEef6Jha76PJfiTB
	SJJmMro+KqG79Io/nmKPtsPk9kozE/6JvAH5YyP4AilOnsoZMY0y62FQgPG3W8HjRIk2U2
	cEDFERDz9lpfRvslb0nWc6Xq8rBioGaHXOHi1HvOQ2fj/X4ieuilPKKI34mjscuZ5T/Y8r
	wksYmlvewNwhEgzuME2MhN8gUZf7OBkDPsvHIeCJILHCmUit8y4BjMjpRZhYuCIPS8fPUg
	PSvNpc+Sf9EYQpugK/oOH0T4lY8Fln7VuBubo9jRI9Gr5nTuBvXIlFBjJ8TdpA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 02 Mar 2026 10:37:50 +0100
Subject: [PATCH 3/8] ref-manual/variables.rst: SPDX_PACKAGE_URL: add
 missing parenthesis
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-release-notes-6-0-v1-3-9662dee58591@bootlin.com>
References: <20260302-release-notes-6-0-v1-0-9662dee58591@bootlin.com>
In-Reply-To: <20260302-release-notes-6-0-v1-0-9662dee58591@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=859;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=MF1/JbiL1JrcoONr00NG7AIaq9HBoDdF8XkHBFfrJ+4=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBppVp19hoT7ye0hmKaStAYNkxd1EuVrq8lGctRU
 +zmvxUYZq6JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaaVadQAKCRDRgEFAKaOo
 NpZJEACQ94L2Yzz9Ei2V4FYMsenxAK70ICSs6XH6iG8ivAgZyUhalu69OZipFt9M1nXgxMdZmJ8
 A0BrapmVxJLYQpDawSajsHzeRq9L4fohEvWYuYlImpQcu+Fe+Ofcwrekc7F55VBq9QvtuZMs5QQ
 zIekfcd4kcc6CMbvDURE3CbLXPyaDZqhBahaZ6rm9A1hcY+1gyO1VvQE3sLVVJxmIKjB2JK+7PW
 ny8FU+jnzoCEhsuFacrmhyPmnUakYcZLI9dnBBO9pw6sjkcUqFpFIZBaiSnCPB6MgffXeoTDZv+
 ZP+O2/4R7S9eb/V8Hw8AnwaiwwPFW62o4dPfhZJOgRrIwiJtbw/r2pkU1r3wbUK9MNUSziGzO60
 +Eidvviqf/81CqntAMY+m+8NmLnUebin0scGJzVdtEyH8qbdaIQOQt8FNW6a3wGX1a3mjbCtSpb
 NEU1NywzcAoOMOzNKY5i//orlu21kUw7g/7S3JrI8/o7T0m6+amN1iyS9QgNtCYFIy0mH7ni1Oz
 Q4hgwznFTk8vIfCOT8ZYwwP+V70CUkLdzV6fSpTFngbOum6A5D90tvDQCIioKLQ4rkiEIqtjE4y
 bEBGWdwYWMM1gVo7jtGOykJ9m4PxLQGJfaV7E9cOFJT24fhmQUe//u4Ks4TSnv+hDbx1YVEkjBa
 GRZgUgetgzx8PlA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 02 Mar 2026 09:38:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9021

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index bf13b05c5..1fedb98d2 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -9341,7 +9341,7 @@ system and gives an overview of their function and contents.
 
    :term:`SPDX_PACKAGE_URL`
       Provides a place for the SPDX data creator to record the package URL
-      string (``software_packageUrl``, in accordance with the Package URL
+      string (``software_packageUrl``), in accordance with the Package URL
       specification) for a software Package. The default value of this variable
       is an empty string.
 

-- 
2.52.0


