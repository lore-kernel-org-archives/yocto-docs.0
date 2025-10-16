Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EA90CCD183
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 08:54:51 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.3546.1760604888987211029
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Oct 2025 01:54:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=EsoQ5P2F;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AC98A1A1416
	for <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 08:54:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8222B6062C
	for <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 08:54:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DCA2C102F22FA;
	Thu, 16 Oct 2025 10:54:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760604887; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bVYRuYUGGpYCU6cn5zrGaoT7CzaSwAE/8wUgfT4RhZc=;
	b=EsoQ5P2F1/FbRXWwWjxvVsR3JkEER1SmZ/DLxqmPhZxmKngNMirFoYG0Ipp8xlqByLXi1j
	tabhJC7qyVn1qZeIgvgporUUTuRkNuk+gG5sCkxXt1XbNvbHfPuPR+AH4N2cPUIZj8jeF6
	SMrFPwkoakMPvuDOsGE4uh5bpw/v1qWGjyX8jSfhJwqJDpxQm9wux01prp8izytZfIQCTk
	GMMp441xtGXFAe4z7Z19VKlNOTRt9+sSI6mG4efbSmS8OItgKBBS9pW9Sl2YQbptyyK9NS
	zWPSSImuOp3GqYM+aDdZzptmjzPa9uQfNj20jP5+mJUK7PoA+DFrSXzmtnXvdA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 16 Oct 2025 10:53:58 +0200
Subject: [PATCH 08/17] ref-manual/variables.rst: document the
 REQUIRED_COMBINED_FEATURES variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-release-note-5-3-second-hunk-v1-8-20f21db1f93c@bootlin.com>
References: <20251016-release-note-5-3-second-hunk-v1-0-20f21db1f93c@bootlin.com>
In-Reply-To: <20251016-release-note-5-3-second-hunk-v1-0-20f21db1f93c@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1559;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=/iQ5Hq4C8Zu48m3xRQ7XRUJyK+STMXZHLZVVHLk+ThQ=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo8LLQ7RIQ3OxEEi86xzsHjTufTzsEnt4jGcqnr
 UCFZHSkAiOJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaPCy0AAKCRDRgEFAKaOo
 NrKhD/0Uv8vSOLqMa5kPWOpg6Bu6ZX0WSScK5T8G4A9zFLluGdZaTDNvGEtnSX0xrga+KxdapUl
 0aWYJlyYGrFpLI0Appt2UoObkkpzNVJyI19Izsqj6bPeJFwCpyE+qIz95TDrvTiJkwfCuqB9GJE
 pYCqTVeroqOgIHWx4GHfbdi9RpKw7o5I60D6DDDPuZEs1nvb4pn+u3nHPaaRS85ArgeXBdyxWSu
 HFUJGMykWzBlXHhRRlFua2MBeIEPNbjPmhxZ2wRGuyzJhQwodJaCt97Ma00u72kaYG/0KZeqaIg
 GbI7p+bUYW+e9+aH0JbkKCQWqp8CWNci/5GrB/R/vEjca1wbk/XIoiKpVkbtz2ge9thQae6+bmx
 WCnULfLQ5RHC5StUo/fa2/Fgra2vBVexSXkgO/9aiWO3Y9qgjOC2x1SOvbL11a/rCiM2JYNejYA
 3r75G96lPdCA05tD27rT61JqY6vk3qW+hpffJgkTPteV+e+wo2eWcXOS4uMApl911Ui7/qJYOVP
 +FTSw6WDJjobfcbFl/2bYuMoaTv0374Nf0P0ZTW3XI2wyF6vd+zA/FQAVt+yNxiXyUG9fWN8/h1
 gEFeETCQx0PwtDXOc4Zcl5zv54WsDDwdwSj+u7qGgtvJS2BZ5NMQadO88qbi4rLKgnEZYpAjmH5
 2Zxqi+/A857A1Og==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 08:54:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7718

Added in OE-Core commit: 5f4875b950ce ("distro_features_check: expand
with MACHINE_FEATURES and COMBINED_FEATURES, rename").

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 2b01527b4..6c94b0d10 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7926,6 +7926,16 @@ system and gives an overview of their function and contents.
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


