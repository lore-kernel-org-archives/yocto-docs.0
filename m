Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C15DFCAC5BC
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 13:06:41 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.16866.1758891991286818962
 for <docs@lists.yoctoproject.org>;
 Fri, 26 Sep 2025 06:06:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=gDO8S8Un;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7C44B4E40DF6;
	Fri, 26 Sep 2025 13:06:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 526D4606B5;
	Fri, 26 Sep 2025 13:06:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D37D1102F186E;
	Fri, 26 Sep 2025 15:06:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758891988; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=2lA6GBEs3oH06Y+xQTPb+Yg0DudIMv/YPtMXPaMCjtI=;
	b=gDO8S8UnjrP6xMrYqNpIeNK58Ne+chCu9rA4QiEkxRexARtD86/FquWNeFndRJC7sLge06
	+QcvhSWFbdsYQG89971ETETGJfiL7ncsGxKvtZbixHg0g9ZF95Q92wwdVINkB9TCtALyky
	fZ+ABGPgnBwNX9v2t4rMB0pHkqmMUG9OjB/rPhcxRJVE/whTo5xmkwXMKzMj23+hrmCoMx
	7NhwXWHe2mdJLYqvezXwBUjADL6mtFg03wEVLlLwBAUw59eF/lvvUgKr3kxoKNMRsJyMI/
	EKDgqemrrZ0/2B4DbZ1c2FWAa17f8h8Ph/1pDEGELDxxTfc/XEXouNL5kXw+/w==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v2 0/2] Add documentation on fragments
Date: Fri, 26 Sep 2025 15:06:21 +0200
Message-Id: <20250926-fragments-v2-0-3f096c33efa0@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM2P1mgC/02N0QqCMBRAf0Xucws3NbGn/iN82Oad3sgttjUK2
 b+nRtDjgcM5CwT0hAHOxQIeEwVydgVxKEBP0o7IaFgZRCmashM1M16OM9oYmFLVIDlHUUkJq//
 waOi1t679l8NT3VDHLbAZE4Xo/HufJb55v27z102clUx3pq3b6sSNEhflXLyTPWo3Q59z/gDlv
 PLrtgAAAA==
X-Change-ID: 20250924-fragments-bb3da11e23aa
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tim Orling <tim.orling@konsulko.com>, 
 Alexander Kanavin <alex.kanavin@gmail.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1364;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=mOzGoh0HBV0sp7j69o2LYQtUEZG1KnCbl4aSsw7Nll0=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo1o/S7qF56FGLEsklDZOv1pUy9lAFAKdPH+WpH
 h9gy7Mkh4OJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaNaP0gAKCRDRgEFAKaOo
 NsiTEACUjA58X7Rn5OMuYr8Uedvxyhlt7KNk91xFHsU46KyCqR5V/gyqDdbjRrkKVDFLs9mztBa
 vAJRKErzA4JDlo0ntQtT+xR383rgTMxn0RZWrk+auIvyhX0GktMrwuiudwiHvgEIXaOGltb1/kc
 4N3JwS648BD9GP4dKXPXsWyvyQxpta3kGzGJOWPXatbz9mp8YQnTu+gNuEqHzz5Q68wKIcqQmMd
 95iZG8cfGj5BZmlmScER2lMxuGmLc/0nUUPUbxxcrTbBNRY7yR3hnjeELQyLTXO5q8GnAh1Zb+k
 IxyThQznGufjDLh/8XhbH74np+cDiOzn4PhFnVm13skk037puqD75+yHVdUZt6vBemYBmPnQgaE
 3VbwCsZZuyAoB0fgt7nvp1CBZbJG/N8PP1mmDQX6wTLoqN7eWOLMm3j4sSnKngVH0e/ZZzPsuKo
 D6B7GaaURSq5sf7kBJL8tkKbNKUHHF7H3LTrb9U1+tcaVTGY0UwLvHaeJQbuxJAXp3lr8a44k9Z
 Q2UWewarNCJGjp5wyOh+HG7tJhr6AvHo5GKoKKzNGhMKW9CYEVcf24QXutMw22laR+gEivrTQwz
 R8K93XPVB1c6BeNkpStZzNqjYCUePzWbRby1z8bHir7c4GTlhXNre3gHJ3zh5F2QloL1BZDPICr
 ++9jsX9gyZhs1rg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 26 Sep 2025 13:06:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7615

First patch introduces doc for auto.conf, and the second one adds docs
on fragments.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- Rename using-fragments to creating fragments. Adjust title
  accordingly.
- Multiple recommendations from Alexander Kanavin (thanks!), namely:
  - Some better phrasings
  - Usage of "Standard" configuration fragment for fragment configuration files.
  - Add a section on how to add custom built-in fragments.
- Link to v1: https://lore.kernel.org/r/20250925-fragments-v1-0-c9f747361fb2@bootlin.com

---
Antonin Godard (2):
      ref-manual/structure: document the auto.conf file
      Add documentation on fragments

 documentation/dev-manual/creating-fragments.rst | 146 ++++++++++++++
 documentation/dev-manual/index.rst              |   1 +
 documentation/ref-manual/fragments.rst          | 258 ++++++++++++++++++++++++
 documentation/ref-manual/index.rst              |   1 +
 documentation/ref-manual/structure.rst          |   9 +
 documentation/ref-manual/terms.rst              |  92 +++++++++
 documentation/ref-manual/variables.rst          |  39 ++++
 7 files changed, 546 insertions(+)
---
base-commit: e77139b5c616e6e5ad436eb91416fd804389425f
change-id: 20250924-fragments-bb3da11e23aa

Best regards,
--  
Antonin Godard <antonin.godard@bootlin.com>


