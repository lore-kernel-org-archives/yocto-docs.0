Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B912CCD1A3
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 08:54:51 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.3667.1760604887957146061
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Oct 2025 01:54:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=NFGqGxcu;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A2DAC1A140D
	for <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 08:54:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 794C06062C
	for <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 08:54:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D1E75102F22F1;
	Thu, 16 Oct 2025 10:54:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760604886; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NHGmvkgjd0kPVm5e6StR01sv4n5r/oIObIDHW8obEjo=;
	b=NFGqGxcuvW0jnf87rjdxcqw2SrpI9rwpRnqTBa0m32XaaKFJvVr/VVzEoU9DskCem338lG
	Arx4xy5wfMXQQFnGxarTeQC1QG+NlnHxRxlG+TMQh9d9kS1zeYEuTV8ydb6HMzMg7zlpyv
	i404BRIEPagRPlcJ8pvcJW44HVFknstPDuJu+bhVvfxqy7mi42RaqH3k0oSbLSjlnjUNr+
	Kr6QIMZUasN6w6kEOsd3CoCqsxyZygSeziwtRRHHpZq9ViVBTwoG6t1ETc/hyt8R7wcDhb
	TMzeOkjzgfel2gWFbqKx8eaYBkzP6K+2pdZTRTqraBusPZ16zX1C6r85mW/FIA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 16 Oct 2025 10:53:56 +0200
Subject: [PATCH 06/17] ref-manual/variables.rst: document the
 REQUIRED_TUNE_FEATURES variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-release-note-5-3-second-hunk-v1-6-20f21db1f93c@bootlin.com>
References: <20251016-release-note-5-3-second-hunk-v1-0-20f21db1f93c@bootlin.com>
In-Reply-To: <20251016-release-note-5-3-second-hunk-v1-0-20f21db1f93c@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1522;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=3N6JLM6GyDgDsOG1YuVjUlivGQm4deoi14+S+bJilHo=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo8LLPZ62jgLta6p0hTNSMjSUfvL1DJAYgDLAYL
 LrWJQScXSOJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaPCyzwAKCRDRgEFAKaOo
 NsjXEAC6LDq97+MEPv7kKPxr67vS7Zl5R/cHYJgrkWvvBJjXH8oI5JO7EdGVH/RXqETEjWCJnkK
 I0BO6JnwZWQ/2mMc0k1G7THzcKb/UuoxSaHBua7DO1U1lqj1zkakRR7EyH1GuPruYhqmEoTwoVf
 m7ReHU3ozskd+EBXZ6iUc5JtDC24Oplx9NSCqe7hwoWA191HURrIRRAHRM5ntJrs04+xEjZe1SY
 QQA4P23ilRCLgbP4h/S74Qq72G96EUl/IOWyNpo9OB1pq+g7GmqWngLSvUOv7kp9fwe8Z+GN2d3
 l/+z8/4hh9DPMGV0bmxqCiWyVO+9bk+VFEINcys5/Vedgf/zM5B/nQhxho1opKobVfrfd3kz1r/
 S3saL7cdmUEFQIyYscxR0AdNbi1tiNeRur29l63fklAxXw8wc8gCoJmAR771+X35+G0921YSd/V
 zkkUrNQaKTc0kyeSUV8CvKc0EV3cmkqactpKsKUcz8WjDxJcYIHZDjPfLVo3ASqB+l7OtOSgsgn
 8pf7f0CeolDIm/jyUsW6hskk+FxOyZ6NaiJOLK46dn/SCBTV7vW3op8/N40ZEEvN+aFHGrbM8eB
 IDcExHuh0b6xRF5LnevQJgNYfqv7YrWVVIhSYzQRc/MCn2C2x8+AvBOxM2BpUP4o8L+N0twqbzn
 IJbb0F/rmwF8elQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 08:54:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7716

Very similar to REQUIRED_DISTRO_FEATURES, added by commit a8ef7339ecb9
("features_check.bbclass: Add support for required TUNE_FEATURES") in
OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index e6b3afbfa..3e80e075f 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7936,6 +7936,15 @@ system and gives an overview of their function and contents.
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


