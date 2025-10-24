Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7E52CCF9E0
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 08:20:38 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.4946.1761294036670159911
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 01:20:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=qBCn/Q0g;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 64B4DC0C41B
	for <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 08:20:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 38DAE60703;
	Fri, 24 Oct 2025 08:20:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E9FAD102F247A;
	Fri, 24 Oct 2025 10:20:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761294034; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=D4R71BC2LPQhiqko3rYyed6jY4Ua3U9NkOWx47STIbY=;
	b=qBCn/Q0grunjikPJWbb2tC9K4wW0tCiP1wAdRC/v+xEAfVW3OuoCmxzgfR/UNWifCucs12
	puV3QBC4nS1Z7HNwXQL51mWdObyV/K7ftLYD0pcXgOjgO4SAo2siOmCO2c08SRLg7OKWaZ
	HMrXxi33pH2U9QA1BSdga5IBfD+Nsor3jJY8a49ogTuP4U65bw9ArfLL7xA7qbXbLYxOrT
	Z53oVysopH/DNmhQlXWrGgVE6maGzetEErzPSfIgJ2BsvF69vjSxOkWhSVCeCzFp0WhbOI
	trlY67UengiloeEI9ZhjKdRP1TsVnj1SJxrxaZIjIzbZHlaSjTTJJ3/Mb5CqKQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 24 Oct 2025 10:19:57 +0200
Subject: [PATCH v2 08/16] ref-manual/variables.rst: document the
 REQUIRED_COMBINED_FEATURES variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-release-note-5-3-second-hunk-v2-8-d15dabc095d0@bootlin.com>
References: <20251024-release-note-5-3-second-hunk-v2-0-d15dabc095d0@bootlin.com>
In-Reply-To: <20251024-release-note-5-3-second-hunk-v2-0-d15dabc095d0@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1615;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=qzoLHcH2tN5J+pfwsyohcUEPg+k8BBaR4yxJVZrR4ys=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo+zbJPxKFz3dp8w2Xt3O/o4njVCbCEB0Xy0nQc
 O3Q1UUFSCaJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaPs2yQAKCRDRgEFAKaOo
 NggYD/sFavNiWNLhgrPsvTUmGMhZAnSlbiB4LDziergsFuhBmq4ZhBz7VDxdp9nxIErbP/a4ylL
 UO8tWe/MYZ7MQGpgkqwTeTuVM1tqM7x/bUDkekXfTthgVhrsnQfDkSmivKbzkLS1Sm/2NvXWYfw
 mmo9NPD3SAsQxeyTON0OafkDUcmtGDKMnn5MZs7twYXVTOu7Zo/FfUjZGYLnLxol8DorlCCKo32
 eKsdfrZdOsxb9LGj7WlAKmCD71AJG94+adzU+Rul+futurwrVl1bVWNzz1E5vy6kSDtfoQpmO8T
 9TnCIVGdi611dVr3oSL4JZBOlu5fQyNYz3Ok2cLPjQ1mnhaGh7YMsYZ8zh5t8aq+Sl3nt/7r43T
 cMv3r+QMjQJMerzYhq3Rav1SClBkS9KIhF6TN3o64llNhKP6w4CEt25gD2m0vlqu14JJaGubacy
 yMNjGy5SqNyuoLrWkKYtq6rSZYyGmGMLeAQ1ioLnhndjdBhlBwA5gDeYQsWmesXWmSBxTLFPVKB
 UCrtmVKjJXbyOX2ya4YwmLcJvFYr5qgefHE2UG6fIkO+6B4GGQTHFitqmKuWVvsAk8uPw8i4ozB
 EvWNbU3vrBxmwqrYPRVbR1lcXlyhd4ZkwkzN8CSGccxZoXWNY0GECPs9xBg3UG186vMNhJYAunE
 s/Fen0StX2Gm7FA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 08:20:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7797

Added in OE-Core commit: 5f4875b950ce ("distro_features_check: expand
with MACHINE_FEATURES and COMBINED_FEATURES, rename").

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 5b8e0f7ce..167f38e86 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7876,6 +7876,16 @@ system and gives an overview of their function and contents.
    :term:`REPODIR`
       See :term:`bitbake:REPODIR` in the BitBake manual.
 
+   :term:`REQUIRED_COMBINED_FEATURES`
+      When inheriting the :ref:`ref-classes-features_check` class, this variable
+      identifies combined features (the intersection of :term:`MACHINE_FEATURES`
+      and :term:`DISTRO_FEATURES`) that must exist in the current configuration
+      in order for the :term:`OpenEmbedded Build System` to build the recipe. In
+      other words, if the :term:`REQUIRED_COMBINED_FEATURES` variable lists a
+      feature that does not appear in :term:`COMBINED_FEATURES` within the
+      current configuration, then the recipe will be skipped, and if the build
+      system attempts to build the recipe then an error will be triggered.
+
    :term:`REQUIRED_DISTRO_FEATURES`
       When inheriting the :ref:`ref-classes-features_check`
       class, this variable identifies distribution features that must exist

-- 
2.51.0


