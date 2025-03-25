Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C61D7C3600B
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 11:13:11 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.62795.1742901191055933682
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Mar 2025 04:13:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Cl3OWFMe;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4B71D44329;
	Tue, 25 Mar 2025 11:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742901189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=h9+EC5PsStC2YWtvHRZslxm9JhA09lk3crKgQPoP694=;
	b=Cl3OWFMe/zv2dSzNoZs4ZwOHbJtRIhZqnmYW3YLEV2ZPBvYDfhS2u+fI+4DBMmjBr7dJOa
	P1qqs2SiBLF0fHY0jEFYgJfo7KX2TLu0aLSDx7JDelN/V/tzSm8tAv/Yw8bUaLjuIzcuJc
	FijEo+9KPIDhzWgiZSl6/SQJttmiJO8eCDOxuTayS49NBeaRJa5HHYY/RAY+UYM5SSmhpO
	NBP/7e5SlFcGlOxC3/agrVeaBkuImA60yfNa/eBUi7y7UUjnBIIDe70SWVWhHrnagAiwDe
	LPuyqYBQhtOPpU6KFqiAEwSuRzRjYD+VQbSL1rqNs5hDIg4vP5iJFNTb095T3A==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 25 Mar 2025 12:13:04 +0100
Subject: [PATCH] ref-manual/variables.rst: improve the PKGV documentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250325-better-pkgv-desc-v1-1-7febf4c713ce@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAL+P4mcC/x3MMQqAMBAF0avI1i7ElRR6FbHQ5EcXQSUREYJ3N
 1i+YiZTQlQk6qtMEbcmPfaCpq7IrdO+gNUXkxixphXLM64Lkc9tudkjOe4m+OCCBOuESnZGBH3
 +5TC+7wdh+OVlYgAAAA==
X-Change-ID: 20250325-better-pkgv-desc-9aedfcf2f5c2
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1972;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=zb3itplG96lPs8quarcg3im9FCwktDHsJGGB9T5MYfM=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn4o/EMDtdR0e3RazsLHWC6mkiU7XaRd3gCm9Cr
 SOzYvL9s02JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ+KPxAAKCRDRgEFAKaOo
 Nv65D/9yzOEohz7G1x5vJtxX43uPkIjZW51xGJbI2xULIkuDVX2T//L2/cjTPHJ/ABPCr/lCTDI
 ctEWNgPmkdzAnx0tTNAEvEw15pCFItQplrRR7NrjsBeOCsLGiU3WpGt+qr2PTrTqQFsqi3UJQbF
 r692LS54TG/rQVC3EOHJ4sMmMfIsyRfC7Qmjln8wV0kE1fEf21I7MLuEdY/eThgd7euj5Kp82jw
 +eo7GVxwtGMYdHGIBVRzP3Q6vxgYp+F0yV/7BouJhlQPRHmPPE2cG8XnnV2e51Wz61Vjt6v9nbR
 C0UqJXGD+Y+mEX/zuSCAcxAJF5lCCA6H/lnLr/R0TUBLrpAEwW19IFKzOXDlNr6IT7jLb2hlrSn
 rIyLeUJ3Iz+lz5gQqriOx1T+NAkTbwepNbisoQHNcPpdTbp8qLlx55IlBThEDmr2YWQrqoCPcX2
 vQeEVhzg7z34k5o0bterHevPXPMU2xViy6SdCIY2jHyykDGF3k5dAkeCtbjl6IvXeNuAw9yYG40
 wzJH2tlwj5ReZ7VUz6ZbXrJ1+JHfqvVr4gehkHbVwtrejvapUUAxgMTA7Vff8y7gmSeUcA13Q6h
 0f0CpMntszzKiZ9QrMB02te9CbSqc62P6hbu2IENmyOU/RhcImDTqKM13ES+8JoH869R7BY+dCT
 LhyisYHjbBYHF/w==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduiedvhedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeduieejledtieeuteffveetleeuffeivdffjefgteehgfehleeiteehieeuieekueenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhot
 hhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Mar 2025 11:13:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6627

It may be confusing for users that source control information is not
present in the BitBake environment. Document it as a warning block.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 41bda5d0d..bf1f35d2d 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6771,6 +6771,23 @@ system and gives an overview of their function and contents.
       The version of the package(s) built by the recipe. By default,
       :term:`PKGV` is set to :term:`PV`.
 
+      If :term:`PV` contains the ``+`` sign, source control information will be
+      included in :term:`PKGV` later in the packaging phase. For more
+      information, see the :doc:`/dev-manual/external-scm` section of the Yocto
+      Project Development Tasks Manual.
+
+      .. warning::
+
+         Since source control information is included in a late stage by the
+         :ref:`ref-classes-package` class, it cannot be seen from the BitBake
+         environment with ``bitbake -e`` or ``bitbake-getvar``. Instead, after
+         the package is built, the version information can be retrieved with
+         ``oe-pkgdata-util package-info <package name>``. See the
+         :ref:`dev-manual/debugging:Viewing Package Information with
+         \`\`oe-pkgdata-util\`\`` section of the Yocto Project Development Tasks
+         Manual for more information on ``oe-pkgdata-util``.
+
+
    :term:`PN`
       This variable can have two separate functions depending on the
       context: a recipe name or a resulting package name.

---
base-commit: ee6b3698da044e290dbc4fbb852f3cc37638e689
change-id: 20250325-better-pkgv-desc-9aedfcf2f5c2

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


