Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70378CF11E0
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 12:10:59 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.41788.1728562257876114509
 for <docs@lists.yoctoproject.org>;
 Thu, 10 Oct 2024 05:10:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SLdXk6vs;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6A3D8FF808;
	Thu, 10 Oct 2024 12:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728562256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yq6kHau4JQeZ7yTJDLZxSn6MLOWJfkXNa8Us6go+RPk=;
	b=SLdXk6vsq5/pGVvIzR3+1P58PD8GIdUpnUwQgmW49ws0A/F2yN9buFQf5WkJN/rr2RAzjs
	ZeIGBXwOBgYBCF35vc6FOAyS2+LVbPtzGeu5oheaT1Ux9HmCdFI+rtoWmJECt6YbX3Oy7+
	n8WFFg20jY4TIBTsLbAVfXKhRYiLRO8j/gdVU/fdsWa95yuPrd65m4PPkT4LQpVgXxQzmu
	cBJw8ClK4c+Kupxz73uXcULewQlyR2hZmo0yKTwq7RAIAL+0Tv1pH2BSs4aRBue9g04rpo
	uxRszhe9hZkvZK9J0NYPRWzE8iNH5cpcKI2H7NP98eda3wKOfLM7MEaR5M0BHA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 10 Oct 2024 14:10:27 +0200
Subject: [PATCH v3 02/16] ref-manual: add new vex class
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-release-note-5-1-v3-2-2cef1a58f1ab@bootlin.com>
References: <20241010-release-note-5-1-v3-0-2cef1a58f1ab@bootlin.com>
In-Reply-To: <20241010-release-note-5-1-v3-0-2cef1a58f1ab@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>, 
 Paul Eggleton <paul.eggleton@microsoft.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1570;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=MZbBQR9dYMC5q2RiXWC98kG76CEujbFRo57TmtrKbGs=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnB8RNDsjwVRtu2w8rinhRmUU8ft8M7m2s9jJ32
 XIAudr1VQCJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZwfETQAKCRDRgEFAKaOo
 NhLVD/0cCuxcac1+TbH0Mg8uzBMkVDRP1Nk0e/wX6kyPnRRlXf0Q90aiQB+iZcYHogsuNCAXSQ2
 4XRgbEvzcJK2ZN4mMetwchue6uC1sUoxknyrw2uiBzTL3BZ/aff/rnyPlxdyIXaFSE4txwgwxw3
 Z7JbZkzS8s+aU3lyMsCBq2JFNB181+69FaCDR3VfK9yCFi8MTsQMVYsvHoBPC9iM0GTbYw1KmLF
 5IoQ268Oj6rLLc7ihzHY//jX9dfoPUL9RTGlGDFZQORQDT7l6tMRm4CLDZKrhXa2XnAWn8AcYzS
 6zB5OhDTz66HrvFEb5wBQjNCfotJ1boXnv2Df1+zZ6Uox7BBUYVqZxZpSY61v6WDesTCV5OEJkR
 u1XB9j1az6etbBT7erCweY7WjjWw6l8X6+9n/njpaSAWJQNyps33wcLuowMhC/Xvodho8dWJJKR
 1Ho64iNs24zNnRN+kTenH/5xe3e7gaFYRrLoiyLlNrir2tvWrY4DeAL3um2Ew/oWvrtF3lYgynI
 gJt9fYMGWyEajgkRAmHl3wPsGjEF6wwfjiSXSImJ+3DHNMqJ5vCELhOi+uk2sv308vblrwiZ57X
 EVgqhoM6lSF7TfjFbuvCeXw/Mkbm9PYBE7owyY1n1QSrXYuN10a2clsiVyeuiQJUpWOoVrdqvGZ
 HYwIDO4ch1GwVeA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 10 Oct 2024 12:10:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5455

Add a brief description on the new vex.bbclass that is used to generate
metadata needed by external tools to check for vulnerabilities.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 9520d0bf7..46d77d0e5 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -3489,6 +3489,31 @@ This class is enabled by default because it is inherited by the
 The :ref:`ref-classes-vala` class supports recipes that need to build software written
 using the Vala programming language.
 
+.. _ref-classes-vex:
+
+``vex``
+========
+
+The :ref:`ref-classes-vex` class is used to generate metadata needed by external
+tools to check for vulnerabilities, for example CVEs. It can be used as a
+replacement for :ref:`ref-classes-cve-check`.
+
+In order to use this class, inherit the class in the ``local.conf`` file and it
+will add the ``generate_vex`` task for every recipe::
+
+   INHERIT += "vex"
+
+If an image is built it will generate a report in :term:`DEPLOY_DIR_IMAGE` for
+all the packages used, it will also generate a file for all recipes used in the
+build.
+
+Variables use the ``CVE_CHECK`` prefix to keep compatibility with the
+:ref:`ref-classes-cve-check` class.
+
+Example usage::
+
+   bitbake -c generate_vex openssl
+
 .. _ref-classes-waf:
 
 ``waf``

-- 
2.46.0


