Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E210C44500
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 13:59:35 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.70283.1783000768114256266
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Jul 2026 06:59:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=cd1T+Ejj;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 616CC4E40C3B
	for <docs@lists.yoctoproject.org>; Thu,  2 Jul 2026 13:59:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 301205FF03
	for <docs@lists.yoctoproject.org>; Thu,  2 Jul 2026 13:59:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 89BA4104C958B;
	Thu,  2 Jul 2026 15:59:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783000765; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+ObhNfBpQcr55Qbt5/ZfTdwsAEcXjT6uuJqVNOPk3g8=;
	b=cd1T+EjjUQKj6x29TdtdThynCjO3jX7HAOc1ECyJOyYN0CZlzHD0NTQW6KIvDeSArLVNfa
	6iF3CSRgRD+9ZbqKE5r+c3CDhQY5ickpTT2nDyO0ht3W08NROmigZ7xLB2c7dF7nFvh1VC
	mw5HX57Fa6tQEzNcaA5IAya8iU5SvNwAYAVSGlfsj0AThsYtYXL0qt17zOkJTGwda5smG9
	uRA7cogjPemm++vY8i6DnlOUMVUa9n42PnZqfi747VlLWDpvV4rSHF4tWOTyXq/VGzT9Ms
	SBwaURbNlxRr0AyT9ZEhVef4Lqs/ua179cNlYwnz4C07tQCUsLuIQa03HaH4Eg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 02 Jul 2026 15:59:12 +0200
Subject: [PATCH 3/3] Add a pre-commit hook to check the glossaries
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-pre-commit-v1-3-0ebd211b5d5e@bootlin.com>
References: <20260702-pre-commit-v1-0-0ebd211b5d5e@bootlin.com>
In-Reply-To: <20260702-pre-commit-v1-0-0ebd211b5d5e@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1690;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=UPRiS9QKnBm8CQDvZi0hnpFzBLfxHTx8qSRqK0IKo/I=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqRm67xno96ZARyd8CvRzx6IylCvph4PokSMqaf
 RDl8nYiYECJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCakZuuwAKCRDRgEFAKaOo
 NihiD/9OaQ/un1UPm5JMbAuJ2bvWLwb8B9ERNni2RWXkMJlOwKgOPytdB7quzpyv1efc4FPu1a7
 cNNXRspq7/ipPQTiO/BSnLvpzyVWKdXm3whT+vFhmN9ALjAgqYeSBYsTRHUQgOTCsoKQoXFMNll
 dHiapLiubNblb7eUV6W3yQntIyq2Jn+ExdX8uGWiR+SYeg0x/Lhra5VcISF+tv8wpAU+mGUNS6T
 WwgWsHgeqSMP95O47bM63hHesGYi8Bj0C1CKmv5BOsoE4Ibl+DHp4btctA/85AXNgZc+oXXf9Qv
 pmq4Zg7dAqQ3bz0xFRIizrVXvqljWKBXcbo/X6EqFWlOTNYC7pt/xZqYoTnrq5mYYiqN7LO+586
 3of8hpOaNiAzZpfB+sMsbpK4vbiMzIlp2mmjYmmiJyaSPWQKqnP9ymNmBd3GJHsiG2/zrhTPNkN
 WJuEO7TIXn2HCzSnqSPqUvHjHo0DqcXEm3CcgPD2pnIjLGIdSKrHQnz93Zf0dcjWxLhF3IrYXgp
 gl8n9GKrDx/Labu3b2JDv5khsywkqKla5cznh9YxtvUcbFHMowkbbC6stvSzQSyPtIK5Vm3xB29
 wOgRxsIxfIhIJUxDp/2Gt+Uzvv6s/SvFFkSezWx3hVV+9V7/P4dFWfwSpridgL24TITu5hvaHhk
 YW6FECutU3lWM5w==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 Jul 2026 13:59:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10003

It is easy to badly order the glossaries or forget to update the list at
the beginning of the variables.rst file. Add a pre-commit hook that does
it for us, and update the README to mention to enable it.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 .pre-commit-config.yaml |  8 ++++++++
 documentation/README    | 10 ++++++++++
 2 files changed, 18 insertions(+)

diff --git a/.pre-commit-config.yaml b/.pre-commit-config.yaml
new file mode 100644
index 000000000..f2b73a481
--- /dev/null
+++ b/.pre-commit-config.yaml
@@ -0,0 +1,8 @@
+repos:
+  - repo: local
+    hooks:
+      - id: check-glossaries
+        name: Check glossaries alphabetical order
+        entry: ./documentation/tools/check-glossaries
+        language: python
+        pass_filenames: false
diff --git a/documentation/README b/documentation/README
index 7c4472c73..326930932 100644
--- a/documentation/README
+++ b/documentation/README
@@ -89,6 +89,16 @@ generated with DocBook.
 How to build the Yocto Project documentation
 ============================================
 
+If possible, install pre-commit hooks to make sure you did not miss any
+updates that are run automatically:
+
+  $ pre-commit install
+
+The pre-commit project can be installed on your host using your package manager,
+usually under the name "pre-commit", e.g.:
+
+  $ sudo apt-get install pre-commit
+
 To build the documentation, you need Sphinx and a few other packages,
 which depend on your host GNU/Linux distribution. Such packages are listed on
 https://docs.yoctoproject.org/dev/ref-manual/system-requirements.html#required-packages-for-the-build-host

-- 
2.54.0


