Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E458AC87FCF
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 08:52:35 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.77275.1753692752582095058
 for <docs@lists.yoctoproject.org>;
 Mon, 28 Jul 2025 01:52:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lwDhwAlE;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2CED44335E;
	Mon, 28 Jul 2025 08:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753692751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E1SugAsuIpfmpMDsqOX9l4TfmFx7kL3I/mPB5sRoBWc=;
	b=lwDhwAlEG5nBraYqlNTljvXAhp9LLk1/2dRFlhe+D6yigvZ+fGOYdsvSvyEDVqKOoiDZE0
	CKb1jfyyrTWGrKUlK4jQOK6RXpKf88pStv32ik5mYu7ppQ/jnPkR4N6x0X7wxcwhN4nGL/
	7iC5cdsg+HK85061bRo+4Q5hBaGSEiLTIYVSXH04q8tiYch9BadPRHpGOPeJSTBjaMrdqS
	a5u6VSKfb//1sjKSjDk8D71a9ZGlLi0ZWjpK2j3tRvEEzxusj0SHM/5x7af8vHHx3kP8NM
	u9itfoFal3y86bLJ1+raM7RgMuLW26nVS/6Fh3ln1sh3LewU9zmfi+z4zEIFGA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 28 Jul 2025 10:52:24 +0200
Subject: [PATCH v2 2/3] ref-manual/classes.rst: drop obsolete QA errors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250728-refactor-qa-checks-v2-2-9e0737979f05@bootlin.com>
References: <20250728-refactor-qa-checks-v2-0-9e0737979f05@bootlin.com>
In-Reply-To: <20250728-refactor-qa-checks-v2-0-9e0737979f05@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2869;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=YkV+wHflrB34+x8cMD2oCJeSIe0VifllymBtYf8YGxE=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBohzpOfd6Rpzfj0Or+J8CRU/2Gl2ZW1/kOP2Dd0
 nEQ7GT++7yJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaIc6TgAKCRDRgEFAKaOo
 NhBYD/9gDdxljr/TPlH8+ZEW4HWpvHR22hrMPGZU4dQ/Hvp+VP2wRsguHRjOQ8qamDIUNCgoPTi
 1FMN9ZRmYNWNjThEp+/qfav1SlrWPfFuB1f8a5npKfW61kPCYpYnhLlDgmXvSfk8UGpkz75RHtS
 4KUVbJsCqf8oCG2rS1l6lIUbmQJZARQfsWx9UpLvYb1KRw4p8lh1j74baqnhw9uGNykbRckhiSl
 GKWrJDbBtmklb1cx++fmr1WH1Bc7Ux26qzelZzHlulri8VFzoCQjWOPT9bpycXrBgMUucCunp0m
 xpBkDk1RLqYo3JrYLg3oj5irovu6O2yarcm2/rRXYfjMbEEEPjAQhQwUzLp/sjXK1+WZmlw/Bwz
 coCmdCadldlIg4K8OYrSQGvwioAeDg8K9hUzpFhLio0EQfxYKkDbDT735AHjSI2THPNR1x9Rj9a
 DnbSB0LAufVlTcf0E7i9ym9KCOdkFo1tXiHBshGALROKG2StfzJB/nriq6EP9wuY5GZwlhPp21v
 wodSa4ugIElUR4a86UQBhLrUd/s8CaPjdqUIfP5bzFLUJStTOD3cX3xgWcLT27Z5UDKzmyiEH+1
 PUMgHnO0vRGAYmMQsamFmRxPb6K38NPvw/4NFOzxuUbsPtmLAkjdpAm7wImCa+0u0wZiyDBoceU
 if8ijWB3LnMG9Gg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeludejgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeigeeuhfefgeehfffgueeiteehieelfeehjeektefgkeeuheeuleduvdelgffhnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoo
 hhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 28 Jul 2025 08:52:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7391

Drop after commit 068d38214307 ("insane: remove obsolete QA errors")
from OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/migration-3.2.rst |  2 +-
 documentation/ref-manual/classes.rst             | 13 -------------
 2 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/documentation/migration-guides/migration-3.2.rst b/documentation/migration-guides/migration-3.2.rst
index c538df04d2..5cb958e750 100644
--- a/documentation/migration-guides/migration-3.2.rst
+++ b/documentation/migration-guides/migration-3.2.rst
@@ -166,7 +166,7 @@ be indicators of genuine underlying problems and are therefore now treated as
 errors:
 
 - :ref:`already-stripped <qa-check-already-stripped>`
-- :ref:`compile-host-path <qa-check-compile-host-path>`
+- ``compile-host-path``
 - :ref:`installed-vs-shipped <qa-check-installed-vs-shipped>`
 - :ref:`ldflags <qa-check-ldflags>`
 - :ref:`pn-overrides <qa-check-pn-overrides>`
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index f22af7b04d..5f7b7c5ce9 100644
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


