Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E273C87FDA
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 09:57:00 +0000 (UTC)
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
 by mx.groups.io with SMTP id smtpd.web10.3366.1753783013061110900
 for <docs@lists.yoctoproject.org>;
 Tue, 29 Jul 2025 02:56:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NVFe2SAy;
 spf=pass (domain: bootlin.com, ip: 217.70.178.235, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9F8124420A;
	Tue, 29 Jul 2025 09:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753783011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kj+IBltPSE3FVxLbF6lMl6u+Rrqh/nkIt1fBzcNmAB8=;
	b=NVFe2SAyNfvo7JyLkAqDrohSvTmf8FhwGL74VzEeVPu78Y/D03IJf0i2BcGMYIb9JPU9cT
	KqxD+KRtyOXpVfmhy+UxevGJjtbN5zhXSppqU3lMVngLyWFO62LR3MYNMya/MXyTn0exhA
	PnM3XXmdl669rrkB2iD0ikXem1lMMtG8lAw8S/l4WE+rl/B3QlLXPXJlJSsbwBfW1RW+R/
	oVbsbRGGs//YsqmiOnpiB8W+SQZNFE00eFABDDsQ9U/7zZlqH3hJL2GHd0ZsXomuseqKIj
	jt2vbjDxl2SdW9JUCX1ebJ/mVAIGScCX1bNDJ+ZtiTE0hubJeFCQWEtyuHZVQg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 29 Jul 2025 11:56:45 +0200
Subject: [PATCH 11/19] ref-manual/classes.rst: document the
 go-mod-update-modules class
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250729-release-note-5-3-first-bunch-v1-11-058971e37c93@bootlin.com>
References: <20250729-release-note-5-3-first-bunch-v1-0-058971e37c93@bootlin.com>
In-Reply-To: <20250729-release-note-5-3-first-bunch-v1-0-058971e37c93@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1276;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=huivoCD4cYYFZxJLQgtuA2AMmoe34UfF2dMeoGHAhnU=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBoiJrfSC3ihLa5WtWPufmNMuVss5FQGdsC4c+sD
 +4IGZaABoeJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaIia3wAKCRDRgEFAKaOo
 NhU1EACAuK5z2+VZ12RRZSbUu9dRqrX7TlpbgH13Z2GwhN7fA7x9d4WmqNKMsg1gS8f29+HyUdM
 UyHKxVYgB+4MnKUEvvsmL3s45TJYIygbmnC6Fr+0oFYb6q9BKHPebXHTRaptppt7BiNP5R3OpNY
 fXsjDyX/rHf0TFY0wYPU0hVDksZ0j7O13RWqziabQ7z1fa91ZY2i48sfTpwL1BAK9PHI2r8ic6N
 CezYOUFQHZOAFi7JEHBkM1HlJRC7eH806hhxAWacZAXeNethW5zq8kDQd3YoO1gaojsBWPMaFyS
 rds/KQQXH6huG6HzPDd7HzWTZzYPwFgkcswondiN4jIeTbwrms51eHsA1JqswCXXU6lvuNG+Bkg
 rp8ahtfqQZpMg4Dl2NWOUlPyY5ePrLfHeZ1xxS6rxtejw0x96VsqA9xJDWk6wun86VpBb5kSHOB
 i6W5y8pU9IBJyHeX1bFxajlec2e64TRWvCisOggHnxGHDPrSx3tNu32BsFbNAnY34o9bFnZzQAI
 /aZw5XwKXIhcf2nFEObOkL/5xOz9vL5kuvZMGgm0g6OWDaGBHHoqU6vQK/QpL4B5A//lz8GgtZk
 XtzM73xSedTYyunwZSi45/WjRWctlR9zXKPIR9T/ppn6JUxL5lL20FNwYh0KxkjZy+5pVkKHD26
 bYtPgJE5qjHSVdg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelgeejhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeigeeuhfefgeehfffgueeiteehieelfeehjeektefgkeeuheeuleduvdelgffhnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpeeinecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoo
 hhtlhhinhdrtghomh
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 29 Jul 2025 09:57:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7402

Added by commit 34bb889ffaae ("classes/go-mod-update-modules: add class
to generate module list") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 0f4405b98..586930f66 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1003,6 +1003,21 @@ The :ref:`ref-classes-go-mod` class allows to use Go modules, and inherits the
 
 See the associated :term:`GO_WORKDIR` variable.
 
+.. _ref-classes-go-mod-update-modules:
+
+``go-mod-update-modules``
+=========================
+
+The :ref:`ref-classes-go-mod-update-modules` class can be used in Go recipes and
+defines a ``do_update_modules`` task that can be run manually to update two
+files ("BPN" below corresponds to :term:`BPN`):
+
+-  ``BPN-go-mods.inc``: list of Go modules the recipe depends on.
+-  ``BPN-licenses.inc``: list of licenses for each Go modules the recipe depends
+   on.
+
+These files can then updated automatically with the ``do_update_modules`` task.
+
 .. _ref-classes-go-vendor:
 
 ``go-vendor``

-- 
2.50.1


