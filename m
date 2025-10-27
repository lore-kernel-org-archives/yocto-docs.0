Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E2C8CCF9EE
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 12:44:34 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web11.31563.1761569070264122750
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Oct 2025 05:44:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=uT6LFAeo;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id BF49FC0B887
	for <docs@lists.yoctoproject.org>; Mon, 27 Oct 2025 12:44:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EE9AF6062C;
	Mon, 27 Oct 2025 12:44:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3D370102F2505;
	Mon, 27 Oct 2025 13:44:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761569068; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Dh1Zi55Hej9mtFADWqiPoDC5OR7QDoYbZiYw/jZzCnk=;
	b=uT6LFAeog0puOoxSnV4jEz5LI559SgQIXoHrQDfZ/3Ro+AYEh+Arb/q6HsiCPTQbryi+ds
	8xcE/H8VuIb75MFyYciAAQbBtjxn9szOeCxJIEF/Q0gdTJxiLngSdEur2gCbgqCAjF9S5K
	CM425ZlGYk6mlKmXNBRJHe2q4JCAvblxo0OeI3lZEJyjiSq+WsTptt+0NRMkIqaG1qWBp+
	t7ByLGusM8B5rRnfhla0THMAMTwjMZnDbAXYHq53D60yKNtS7FqA6cXWDrUElIUwQGmtLl
	5jH3Vzz/s7OFZXn3Zvn/eRnzkvT8mOHdCk8a+V79GpZyLAC4KQ2SniuNpomL7A==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 27 Oct 2025 13:43:38 +0100
Subject: [PATCH v3 06/16] ref-manual/variables.rst: document the
 REQUIRED_TUNE_FEATURES variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-release-note-5-3-second-hunk-v3-6-07d36e2380b8@bootlin.com>
References: <20251027-release-note-5-3-second-hunk-v3-0-07d36e2380b8@bootlin.com>
In-Reply-To: <20251027-release-note-5-3-second-hunk-v3-0-07d36e2380b8@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1578;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=I1yvoK1Kh7x6SiiTU3c5HOQBldP4/vpcrcoiR4aaBsE=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo/2kFtI0rYba7ocCsjEbZ2FnzIqCUrgNdWOH82
 SVgLvhXK+WJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaP9pBQAKCRDRgEFAKaOo
 NgdNEACSQhs6dxOgXHDzeYmjHs8hDcrtIgzYWjQSXuakAphO1Aoz0T+u9kJdT4XDbeUPJ0+ii7H
 /lwEW9bSe/qUojwfwPwfQEci49nPYL6VwYbJDUX1vofiyb2KihFK4aW3tOyCdEMrIVn07ii6U3s
 /BAqYnKdRU3tgYzOTdkJq+Mn5vCeEFJL6olEQFPjkN3OHuq7/Pps49NAyg06BkcplirbwAMsnFS
 bFNA5nsvmmxw2U6sLsuCeysvLzd0x2CdjeXAd2vqM65xGopO1ISNvA/3irob/DHiTY9h0y7ZsSx
 d4kRPSwi2tMeJBGpK+VnuSDkBP8GORtHALWB7BOi7ujkfo2CpjxnwK4zOqORGN/5l2qK1gdopfb
 IYNy6r+RLvup6a0jQPU57cN8lYLbMiVK6OVG8MJu6q25DD7/Oufx/CE83eK3xZDpl33Q8o1yKAH
 LDnZsRxVB408Ma4pxts6kLY5TQT/68i5G4Oll+IjM3jCgm8Ohvsv1aRwzxM6bgmg4m65UUBS5Id
 1PA8EeVPNW6gQzJu5ZqaYEQNz8R43CIbbpiUl8RN9Pnqp8Klj5+4a0TVe5YjQbT3VXg9o8AMOah
 jR3/ZaRzDO2YPogGn+mkfaTgUdcGBpcw/p0vNo+9hblgnfqMVntadz/eozRbCDFInKKWL0pX59w
 P9zrJNc3ImPfq0A==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Oct 2025 12:44:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7855

Very similar to REQUIRED_DISTRO_FEATURES, added by commit a8ef7339ecb9
("features_check.bbclass: Add support for required TUNE_FEATURES") in
OE-Core.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index a79d60edc..5af64a018 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7950,6 +7950,15 @@ system and gives an overview of their function and contents.
       the recipe will be skipped, and if the build system attempts to build
       the recipe then an error will be triggered.
 
+   :term:`REQUIRED_TUNE_FEATURES`
+      When inheriting the :ref:`ref-classes-features_check` class, this variable
+      identifies tune features that must exist in the current configuration in
+      order for the :term:`OpenEmbedded Build System` to build the recipe. In
+      other words, if the :term:`REQUIRED_TUNE_FEATURES` variable lists a
+      feature that does not appear in :term:`TUNE_FEATURES` within the current
+      configuration, then the recipe will be skipped, and if the build system
+      attempts to build the recipe then an error will be triggered.
+
    :term:`REQUIRED_VERSION`
       If there are multiple versions of a recipe available, this variable
       determines which version should be given preference.

-- 
2.51.0


