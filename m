Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A689C83F1A
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 14:27:37 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.15969.1753280850178700534
 for <docs@lists.yoctoproject.org>;
 Wed, 23 Jul 2025 07:27:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=C8vjdzgN;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A976644438;
	Wed, 23 Jul 2025 14:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753280848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ejEyGrbgpdoW/jHBdHFI+mLI2yyj3vqwx+zCGi0Uepg=;
	b=C8vjdzgNT784HE2FGGDq4aKPGR04lF3rX6w/ES/r9lkYk0rMY5XW8vF+bQfOWx1pnJRqb8
	+OwpSTgD6KbrVxjIM8314JlpC4QWOtmcSCMaFTcMnLyTHe3pZuFRse6BKarxZX3rG4fbVk
	TfGmWjNtwQ5evi6pAZwqcMIZ1z06k+lMbuOiVtPDTzXSA9rDEv7+Uzvc1fMJjfq3GhFqcT
	RH4ltPmRNWbGTOf0suQbkePjuBnQYTEFhGGZ8f+IyHDN0LCK2CByS5JRRUaAt6+ur6A9zE
	jtO8JsroXXqiQvPFldA4iobmNovI0HO42Ub9eQ7QTt+QALwdBk/ZBtjjfYPlzw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 23 Jul 2025 16:27:18 +0200
Subject: [PATCH 2/3] ref-manual/classes.rst: drop obsolete QA errors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250723-refactor-qa-checks-v1-2-3a72c751ba83@bootlin.com>
References: <20250723-refactor-qa-checks-v1-0-3a72c751ba83@bootlin.com>
In-Reply-To: <20250723-refactor-qa-checks-v1-0-3a72c751ba83@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2114;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=nM79Dfe48ERBimEGLBa4/0RElY+6Wqw6w+WwilT1Wg4=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBogPFPbANO4O9d8BqXscYcQd4Vo/4LhOh4rls3i
 j9K80eyuQmJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaIDxTwAKCRDRgEFAKaOo
 NiJ7EACTjhYoaswjPORR374tnumkfA0mEjt1WI4PNvZTGtO2i+3rPfsAJgZxdUowb2e044RWrR6
 JQZ+gLcfeDRCD2eMIio57xxCr9jSjy4jVTZXfonxPLRDSc3n2Tx+XdhJdLj0hbmwAHVs2gNNNQe
 z7HDI3/3LHX4gJTeGxNX6iQEHVfA57HITJvOpzc9w1L2EFlO/TKFOsHv6oVVcdUmWEPTQ2I6cVP
 v0Z8EAnZFUSxXpIn3aUM5yUPUALdzbTYy+z99QJIkR+TkaT4q/68UY40tsEWoU3OF8HbsSwGAOP
 ytVH8lAYuMzxHBn44ms0eM/smTsI9UtU2zHGuAo1VMb9e8PnJkzeW/5Pmg9k/4hmVXOqqTyWs7b
 kg/AGO9tBNuLFQ3JkzG0fT83cCxyKnK+BKX2X6HivVHIHO75TxiaHPjMkezrlSzFw0Q2zG1kuxZ
 GmpNHm+lHTODIP68QPhuv2kH2zcK1xc/eyG/TlXf/I0/lADwHrj2d5GPOztRCNvZT4IkrC1UIY2
 Ja1drhFhNa9F/Pae2tLlBRGROKHeEhEBtRvP+n/TtZmFPsq6s3pE/O4HLHOqQpqZaaPgSo/jYlk
 wSNf22LZnt7FUmmt8FW8wnZaGPt3JjWVKfBmOphRTzMXEsTFgmkwmcWxlfabbUw/Er99G4dZkjB
 wln1Le9S6Qbg3Ag==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejkedtvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeigeeuhfefgeehfffgueeiteehieelfeehjeektefgkeeuheeuleduvdelgffhnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhro
 hhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 23 Jul 2025 14:27:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7367

Drop after commit 068d38214307 ("insane: remove obsolete QA errors")
from OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index f22af7b04..5f7b7c5ce 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1390,11 +1390,6 @@ The tests you can list with the :term:`WARN_QA` and
    directive, that the recipe also inherits the :ref:`ref-classes-gettext`
    class to ensure that gettext is available during the build.
 
--  ``compile-host-path:`` Checks the
-   :ref:`ref-tasks-compile` log for indications that
-   paths to locations on the build host were used. Using such paths
-   might result in host contamination of the build output.
-
 -  ``debug-deps:`` Checks that all packages except ``-dbg`` packages
    do not depend on ``-dbg`` packages, which would cause a packaging
    bug.
@@ -1462,11 +1457,6 @@ The tests you can list with the :term:`WARN_QA` and
    being created due to being marked with a license that is in
    :term:`INCOMPATIBLE_LICENSE`.
 
--  ``install-host-path:`` Checks the
-   :ref:`ref-tasks-install` log for indications that
-   paths to locations on the build host were used. Using such paths
-   might result in host contamination of the build output.
-
 -  ``installed-vs-shipped:`` Reports when files have been installed
    within :ref:`ref-tasks-install` but have not been included in any package by
    way of the :term:`FILES` variable. Files that do not
@@ -1599,9 +1589,6 @@ The tests you can list with the :term:`WARN_QA` and
    in a packaged script is not longer than 128 characters, which can cause
    an error at runtime depending on the operating system.
 
--  ``split-strip:`` Reports that splitting or stripping debug symbols
-   from binaries has failed.
-
 -  ``staticdev:`` Checks for static library files (``*.a``) in
    non-``staticdev`` packages.
 

-- 
2.50.1


