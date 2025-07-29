Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63750C87FCA
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 11:30:11 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.4865.1753788610655134112
 for <docs@lists.yoctoproject.org>;
 Tue, 29 Jul 2025 04:30:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=cRV+3dNA;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3932D43866;
	Tue, 29 Jul 2025 11:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753788609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Eu0JNHpF+tHZcl9omFEOML0PKf3zBmwlsEVtkDiQvD0=;
	b=cRV+3dNAiPGMdtP6hG2FPtUsi3IKsbRjiQup9t8Ch1u8EFwBWE0SkO5c3T6OrFIqz/02i1
	HB8fivgytaeLS0elW7w5TxiLplul+VhA6dmckipu9WalhjX9UkDumvvo0Hauj/n8toeB44
	/m3mhG7yF0gVpx9gi0Ua8RCZH/OmD/af7pVr67jyIT/wzvTHfrskfJX5CIz3vds/LldU2i
	71pPyf5HFlya6mxz3E9B13yO/tNYLbR8HuKTeVliECswACxgRABe7I+glbemiVLBHJ2Zf7
	EqZOE2+BukhMbD4eZ76Kr0Wa6HKs7A+J3fgNAkl0bWNKZzR8ur+0ewdyOuiP0Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 29 Jul 2025 13:30:03 +0200
Subject: [PATCH 2/5] Makefile: add a checks rule
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250729-variables-checks-v1-2-5ad6ca9b9386@bootlin.com>
References: <20250729-variables-checks-v1-0-5ad6ca9b9386@bootlin.com>
In-Reply-To: <20250729-variables-checks-v1-0-5ad6ca9b9386@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1304;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=8u88q/FAMwDqljPT3zgg7i/JiJy0JHDYV0qD3M3RYAE=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBoiLC/wI+3FN1VAlLhx5aRtLHwqli5wReNNCB85
 Lmc6eYQsmyJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaIiwvwAKCRDRgEFAKaOo
 NuFvEACeAOXiNqYaFoCo4fZ7SNDNFGg9rVYJNrk37Olq5RNHTAFKWeyUZ617v41/7lzoicp6mBB
 2Cp9012abj2WUdr4JSUNPEhvTG7rjFSmBtc2IDjmlSIP5YLnEU98LvU5y6hthI3h8psFDC+SUua
 0xhEoG2Cl+NTGjMWqAZoLyNG3wXqQuL1hu3s15RWiwLfJqgPNl8BzgZuAhvGK85aRKJBB1SNouK
 URPzx1r29BVyE/+wc8dKb7L7oHLWqikkthPpXSYo/VbkyBdv/AWwku2cHHHosRinxZh+jxjfsyT
 EW8xQcRkudb3M5QkTRSsLbajHCHVye553rgNcGF9yhzy3whY5xalQP9AV1NLn8xxY86/W9mRqv2
 U+1q8gkjX3rRA+D3Dl7XtBxCTlz+Vps2oYkpb4PYyFBJFaDQj1TyRO+c01nqTVpEGJ4gk/f2sP4
 7eTU7bS0969dlDCgEe2+H7iuwujux/gTIGDxg0CpBzu7OsjZQyL9zevTzCuEZIygim68Cy0xKyw
 0UwtCBLcusoLJ9mrcEBenYo5PnZZB6n0USRyWfecquDiHg/klBj2Xb3tsXxocdUyk2MWrAQpP0N
 aWWK37iXP+THLFbKDggqGTLG7htXiRghJ0mJRvqAL21+UhXSNxbUSzBSyhp4tVd/swi0fZaaWud
 8eyvQxiLz2L0wzg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelgeelfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeigeeuhfefgeehfffgueeiteehieelfeehjeektefgkeeuheeuleduvdelgffhnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoo
 hhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 29 Jul 2025 11:30:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7413

The checks rule can be run to perform some checks on the docs.
For now it only includes running the check-glossaries script.

This rule should only run basic checks or should not prevent the user
from building the docs in case of failure.

This rule can be used in the future to run additional checks on the
documentation.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/Makefile | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/documentation/Makefile b/documentation/Makefile
index 65e29713d..5ba3d42fc 100644
--- a/documentation/Makefile
+++ b/documentation/Makefile
@@ -52,6 +52,9 @@ PNGs := $(foreach dir, $(IMAGEDIRS), $(patsubst %.svg,%.png,$(wildcard $(SOURCED
 clean:
 	@rm -rf $(BUILDDIR) $(PNGs) $(PDFs) poky.yaml sphinx-static/switchers.js releases.rst
 
+checks:
+	$(SOURCEDIR)/tools/check-glossaries --docs-dir $(SOURCEDIR)
+
 stylecheck:
 	vale sync
 	vale $(VALEOPTS) $(VALEDOCS)
@@ -74,6 +77,6 @@ all: html epub latexpdf
 
 # Catch-all target: route all unknown targets to Sphinx using the new
 # "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
-%:
+%: checks
 	$(SOURCEDIR)/set_versions.py
 	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

-- 
2.50.1


