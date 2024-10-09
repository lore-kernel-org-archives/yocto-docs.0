Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 264ECCEE322
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 15:25:02 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.19645.1728487495482463923
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Oct 2024 08:24:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IQoZz/jH;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DC22924000E;
	Wed,  9 Oct 2024 15:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728487494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yq6kHau4JQeZ7yTJDLZxSn6MLOWJfkXNa8Us6go+RPk=;
	b=IQoZz/jHkVBerkiyLnQWepIL5feg4xIXFPpKoJ4OFcvUrFoOqmj2XitkvqW4mlHBty3h9v
	68Z17ETrMH3BydN753NEbRZDx9rvoPtZb2AZx91dh6s4aWVT/t0cWyAuNxRlR06W9WxxTR
	CqXk+jUoI3vIiDPCP5AzY66lajJYbWh+S4Ww9S0TUWUqnGLM6kZp8tAFh60zp+b0lpGlls
	ehsjDcPicyt1p3ZjXqub1ENuzSIMPzIOOex4kenuR3olvslXj+77MDWWPK4+fRKYrslg8K
	Z8oAkCPELX384E3q/ARpEQsGuGTvNof1ptFlLdEsbEWKI3wxIt7CD7tPfExoCQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 09 Oct 2024 17:24:10 +0200
Subject: [PATCH v2 02/16] ref-manual: add new vex class
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241009-release-note-5-1-v2-2-7d484f7e7b6f@bootlin.com>
References: <20241009-release-note-5-1-v2-0-7d484f7e7b6f@bootlin.com>
In-Reply-To: <20241009-release-note-5-1-v2-0-7d484f7e7b6f@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>, 
 Paul Eggleton <paul.eggleton@microsoft.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1570;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=MZbBQR9dYMC5q2RiXWC98kG76CEujbFRo57TmtrKbGs=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnBqBDrP8hsv+LsfvBhc4DL+AFla2FWfC57JWGP
 qDMdF9tzvWJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZwagQwAKCRDRgEFAKaOo
 NjRcD/4jzZb9rbUTIdQny56ZJ+7li19A4mwVsEo5I5ED8U8+pG85VnHWplwEPHm1sPsG8MgQV+o
 ENEUVIMP60JP8i9AXNxUofiB9EHFzIaatnHBL54MtpCnXfJwlCxP322Mg7mFowTuNEkg6YhXmX6
 ev/JikFhVgjHDh0a1ps5XeOvRKWhHRLhcnG8q+vOL0oIuvPjHSGM0trVpdMziPegQHffv8F+NUY
 OnFeW2PLlVFrONyoGsDdcXZQxDxGfsbhws6sTRFlyUoMhVZ+Wim53jL52r8f9N+PFFrBeidI+2U
 qfqegD4b3NLG12a78yVt9FheH+lv22tT/N6edKN1u21AyYFwnbAUSTbzILati1Ee/FsKpqpv52R
 kwSkSKoCsoGINsKvUEWEZRVBkxZ5POP10RUMEohIHbYYkbuerc9VQj+yvRaQCrJvW0GpYHNXLYj
 kuh1oMuUPIv+V7bm2QiZiktuYvH7nt+LlCY/ihKMgKPsbqvkZRT7erpWIxdpmcEAJU+4/6Hs2pu
 8wUHDBuSjYATYDaVtUZyBU0Mgsm3Jzpl/J5/SFCa5yHYbDMMYaTcD4djmVdlDEBK7X3UW2uyp7S
 ohz45GVyu5JG6oM+V4PGXJhLIs/9y9rhP5sbe9eit+lVZK8BKfFRCjYSgnqmnaZ5/L679+sXSHs
 aVkkis75IpZ1xow==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Oct 2024 15:25:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5430

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


