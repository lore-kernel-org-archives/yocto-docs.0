Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C37BCCF9EC
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 12:44:34 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.31745.1761569073807067767
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Oct 2025 05:44:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=jsnsMe5j;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 53EAEC0B889
	for <docs@lists.yoctoproject.org>; Mon, 27 Oct 2025 12:44:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 81F926062C
	for <docs@lists.yoctoproject.org>; Mon, 27 Oct 2025 12:44:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4220A102F2503;
	Mon, 27 Oct 2025 13:44:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761569071; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=i2Bfs6Mgk6nuIMSL4tJ6pfgjQmpHrpgkx3alCXlJG7w=;
	b=jsnsMe5jpimIcDtaeXSmNo8bLD8ikD8cYaoccWRdKPnZNLQajnmoK6iTj9JyqxNcknyJUZ
	SHOhndpFOMlnNhur4Coa2t58TczErpQgkp29uOgJu6yoL10fr3i9baU9WLlKM9XGnDFz49
	mYYNQ53MvzrP6n8CXi4GKme/uZJ+Sp7noAE8d0BzumRURcLIhTqmw86nfdfgnWYhv9qi3C
	TfbSudHxxz2/QsvBIQIhB0YW2KHA2orpD7FJM7VR46Xy9DvqVSzZckR+dFS/aSx1HmKUu9
	zAN6u58d+EUHj9SSWIXhhArNLQbAtWxzNiiObmBDEpHmC9FnjFHGI2kv10MXqg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 27 Oct 2025 13:43:41 +0100
Subject: [PATCH v3 09/16] ref-manual/variables.rst: document the
 REQUIRED_IMAGE_FEATURES variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-release-note-5-3-second-hunk-v3-9-07d36e2380b8@bootlin.com>
References: <20251027-release-note-5-3-second-hunk-v3-0-07d36e2380b8@bootlin.com>
In-Reply-To: <20251027-release-note-5-3-second-hunk-v3-0-07d36e2380b8@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2023;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=cE8K0U7OaGrKIPrM67ZX/G+dSjlxmAOdfL7RGXtVY/Q=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo/2kFTE9xdjVzEjjUTlQcrNszQKjsLd+QgrLvw
 J1W9P058sOJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaP9pBQAKCRDRgEFAKaOo
 Np09D/9LGrypdqbn8hqw5z/tadl7apARW4Ut9dpFqXO7tFGfeg9re4AmZ9+lTzgUPXbL511gl+E
 Zx+c80lGlw+307jF1OxjTJ6BYjryndrkuRhTGmS0d+5CLQ1JFoiCYJtLoqSjFNfDtsCSW58ldA7
 rOkrrWW2kAO6e4yyeU6fO8k5PG0pK5zBzD0dxbAjHLrCT0OdlyxEHqZsJtxbla3J1QgaDqYEwoW
 S4j6Q8ttQvPvp04aIHxOb+e4k4geJJlIcIAhwRrHPY2UlFF3+6cp+ycFiltM+3znXd45Gg/IGj9
 EBYe2+yR6/8MmFUODTtCN5w8EQm+FS5rospUJuQ6OWoFcBzlicjeMFKeaUxH5zgA4f3ZZIANDry
 dTlIqwZdyrBFKch4dwjAIJbNUOnFZvSMA8NfMk4OZE6p0nn4jNOa2UceQUjNeIcv8idp9IMGGxl
 DZphfQe7eNdIfjTbUDw3+LvWgA4PEcCMEeaqDZNGBWLzSQnT3XlbVep8xaELwB6m12VgF4aafoR
 xAsH4PXBdK7Uhe9Cdc51nYS5x2zcFAMpPsfnlLkvsw3qLwR7zfSO+ximqbptXNMuRFOomQa+tcs
 7hQfU4SwbfpekkgwmnoTPvtR+0JOHWjdRrVzC0Oglw5BiDPEnxuW6D2BWXYPcoIgJ1m447LyFC0
 PKVuoybA4aETGRA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Oct 2025 12:44:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7858

Added by commit 96a9702a24a7 ("distro_features_check: expand with
IMAGE_FEATURES") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 33da2286b..cd55bf13b 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7960,6 +7960,23 @@ system and gives an overview of their function and contents.
       the recipe will be skipped, and if the build system attempts to build
       the recipe then an error will be triggered.
 
+   :term:`REQUIRED_IMAGE_FEATURES`
+      When inheriting the :ref:`ref-classes-features_check` class, this variable
+      identifies image features that must exist in the current
+      configuration in order for the :term:`OpenEmbedded Build System` to build
+      the recipe. In other words, if the :term:`REQUIRED_IMAGE_FEATURES` variable
+      lists a feature that does not appear in :term:`IMAGE_FEATURES` within the
+      current configuration, then the recipe will be skipped, and if the build
+      system attempts to build the recipe then an error will be triggered.
+
+      Compared to other ``REQUIRED_*_FEATURES`` variables, the
+      :term:`REQUIRED_IMAGE_FEATURES` varible only targets image recipes, as the
+      :term:`IMAGE_FEATURES` variable is handled by the :ref:`ref-classes-core-image`
+      class). However, the :term:`REQUIRED_IMAGE_FEATURES` varible can also be
+      set from a :term:`Configuration File`, such as a distro
+      configuration file, if the list of required image features should apply to
+      all images using this :term:`DISTRO`.
+
    :term:`REQUIRED_MACHINE_FEATURES`
       When inheriting the :ref:`ref-classes-features_check` class, this variable
       identifies :term:`MACHINE_FEATURES` that must exist in the current

-- 
2.51.0


