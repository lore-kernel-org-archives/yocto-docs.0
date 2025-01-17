Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 280FCC02183
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 14:20:09 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.11622.1737123598812476925
 for <docs@lists.yoctoproject.org>;
 Fri, 17 Jan 2025 06:19:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OmhIha4a;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9852560002;
	Fri, 17 Jan 2025 14:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737123597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=V1Nqzoyu0sG9kFE96Af7ZJMM1RDrXBUNJDBdc45HRW8=;
	b=OmhIha4aUKpZqU2v47n/Xi2WYtVlGOUpqK2hSiBWAyNeCP9FWJNuUKR4Uz7kVbRBkPKS2x
	kT7+88GWRw3rVsDD25hwWjDxDxUaPbabbusg35Ynr0unJadsjTaxSW8PqVEu/XXRScT61A
	c7MSerIO0KVvDCRqdzO1VJ9tVnsn6QiuYYl3MYMzIOBl4njQ17uMs8Vne/cra4yIzGnY0Y
	3ygSK7GlDB9e+smyfz//ZF684Y+bswSv+JSqOtHyDproGxiGSJFA5M7C3o6eooNlMGNe4x
	8iyvdlN2MxwrF5P0EL3k7kADS7VD88LEN74CwK+xjsZ6Dw44QY7zNh3RlQJfoQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 17 Jan 2025 15:19:53 +0100
Subject: [yocto-docs][PATCH] test-manual/ptest: link to common framework
 ptest classes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250117-ptest-common-classes-v1-1-043c7fd46da5@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAhnimcC/x3MSwqAMAwA0atI1gba4v8q4kJr1IC20hQRxLtbX
 L7FzANCgUmgyx4IdLGwdwk6z8Buo1sJeU4Go0yptK7xjCQRrT8O79DuowgJmpLaqZitaqsGUno
 GWvj+t/3wvh/uUh9GZgAAAA==
X-Change-ID: 20250117-ptest-common-classes-25e9b4dc0968
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1874;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=4q+KSRP2y42GiFS1prIMaLfMoxWDt9ndX7+iJShWrK0=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnimcMRKGsw9l2RTN3BLS7xW8iMHVnlBbP8yce2
 5SDDCAma02JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ4pnDAAKCRDRgEFAKaOo
 Ngb8D/42Zzlt57t6DgR6IwYw3tfyLqZS0uFnfeiAKTYpAylPR/rwFqQHDYhqDHXWCKSEOQD9Iiz
 bIyP5iKMyIzdczns7rRdggosNoTztZTOVODAOqAIkVihfhDeli7ZxTgOhqQA4G3FiNBb1fimkQI
 oi9dm1jRvfkX2ps/a+likSqE4wqQG2AFOuQcCuFBMiSgfDDuCOb7tiYkQGzRweTOnFvMBwklIal
 UNLGGARfKxQaYwZZV60kSfi3QyTJbhZQ796vUUe3/Fj9d/N1o8fv9SzCKRLTLkFsdktJQadiAI3
 Jt9gH8m/qIiQd7lP/LAP9XUbGiea7HUXf5D8ZUimZKrmGYWyTrEhEsux2wUr4gQGvFBpUYCthHL
 GGVd1p+ppQVB+9CkXGiJEy+1dWtcqc85f98p7jNzlSJoWkzf4czri9dxBivzypRafx7d2YJ4Nzt
 evBXOG1Gqldn1Lk9FP6YfwIqYgILOrLlu8xvHgjyHd8qTLnViAabEDUwh6rK5JO0x9uk4mNMBmi
 DHgeQKmfizL6q5WBvKwpYVaVfN12HVMityVpG5aO7YPUgf4bswU2nvKcWCtCQsMloU3oGZ+Lw1/
 43ZBH6Hcj/V0wIa/ZYmYwNJ3uuf+1pb2ibmjZLYzv8LycgCKDzRpCig34lW0NIR8dxVAFwIb4hK
 rcQuEjf/OzPkz0Q==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 17 Jan 2025 14:20:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6139

We document how to add ptest support for a recipe by inheriting the
ptest class. We may as well tell the user to inherit a ptest class for a
common framework which does most of the job for you.

Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/test-manual/ptest.rst | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/documentation/test-manual/ptest.rst b/documentation/test-manual/ptest.rst
index dea1bad23bd98817a2020030efdad7ce4e4b36c0..d5a0d007ac118ced77c06b141d4e681f81e60cd2 100644
--- a/documentation/test-manual/ptest.rst
+++ b/documentation/test-manual/ptest.rst
@@ -61,6 +61,19 @@ test. Here is what you have to do for each recipe:
 
       inherit ptest
 
+   .. note::
+
+      Existing class for common frameworks already exist in
+      :oe_git:`openembedded-core </openembedded-core>`, such as:
+
+      -  :oe_git:`meta/classes-recipe/go-ptest </openembedded-core/tree/meta/classes-recipe/go-ptest.bbclass>`
+      -  :oe_git:`meta/classes-recipe/ptest-cargo </openembedded-core/tree/meta/classes-recipe/ptest-cargo.bbclass>`
+      -  :oe_git:`meta/classes-recipe/ptest-perl </openembedded-core/tree/meta/classes-recipe/ptest-perl.bbclass>`
+      -  :oe_git:`meta/classes-recipe/ptest-python-pytest </openembedded-core/tree/meta/classes-recipe/ptest-python-pytest.bbclass>`
+
+      Inheriting these classes with the ``inherit`` keyword in your recipe will
+      make the next steps automatic.
+
 -  *Create run-ptest:* This script starts your test. Locate the
    script where you will refer to it using
    :term:`SRC_URI`. Here is an

---
base-commit: 6b44257874858db3aa426d3e84a79c41cb4937a3
change-id: 20250117-ptest-common-classes-25e9b4dc0968

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


