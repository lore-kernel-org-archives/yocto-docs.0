Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A270D29FB5
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 07:48:55 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.40793.1730879325377202811
 for <docs@lists.yoctoproject.org>;
 Tue, 05 Nov 2024 23:48:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dGVKJkEN;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CBDC2FF80D;
	Wed,  6 Nov 2024 07:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730879324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u/lXnvows4YXgYQbcE4aZ7HpxCFGYGU7eNJtjt0SyRM=;
	b=dGVKJkENb2aNahpcRgQgwfRQpZ9NAwO/qrVt14dy4uftuBW8SxfEe8qE9xfU7od7bNDI06
	B8y8VegbGZ4HcOCqKOWlzjzSCfbAJT2+bgHaeyHkQ2Dnnz+ucA+BtQY20eAqdDD9ghprqH
	rpNHA6PgHmvaAd3/bY7GyKGNLpO4GxfrpRkJb+nu+IC7xaye81slr1h45ROonXrFa06Myx
	dfgYb+tdz7KXOg6PEjeJ/1twzdgVM/8JoGWUFjxpHLYF7docefa3Lqwcf+RLfwZFpss3xL
	ebi/EeGq9P8NWStx7mw7Buide2Bomi0wcN8K9OSPrZ06Uczzafz6rjza7O3y8A==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 06 Nov 2024 08:48:24 +0100
Subject: [PATCH 2/5] doc: Makefile: add support for xelatex
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241106-pdf-xetex-v1-2-044eab7e77d3@bootlin.com>
References: <20241106-pdf-xetex-v1-0-044eab7e77d3@bootlin.com>
In-Reply-To: <20241106-pdf-xetex-v1-0-044eab7e77d3@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Richard Purdie <richard.purdie@linuxfoundation.org>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2339;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=0l16od1Wyl5VScPl8WdDgP3rKKU3Hk+COU5jleK1/XQ=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnKx9a4dbkPUroOy7ejlaJeTKLasPuasOg/NsSg
 seJxSvAzo+JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZysfWgAKCRDRgEFAKaOo
 NkZbD/498Bmv/hPJi8eC/D+9Je9OCC/RpAoWL1IRZu1cZWLTmzOEml06rm2OqVOs4k5KSMpFHnt
 /SdvFrti8Z/GXUDqoqor5xAcw7MeHDcdn4YcK1wPuvyV2+NEfTN5cerMFrn/4ABOOS2lrUkxwQE
 FeCuSGoSMdq6g1bitFFmHhl871OtVQ5nnhlJnBg3p30ueqE8oIaCV5dxrprNBuVM83B+u5qYQ+Z
 VrLuNiJqZ4LHljgdfBOsVWKPxDA3yQGesenKkKn15V9SyRR8kvTfi1lLxQl+elqQNBy9/8ODuqJ
 v5svVu0qTFT+jQ3fDAxCZbs3b//6+JY7rC28FaoOJ5QrXO0jwbxDl5Zg40yYda7fKZupUR9TGpT
 pculz7YYC6MigaMhWG4yW0Di1jkIxTzuwodhZMf7da+QUY8OAIU3ioTj0xV3X1ebNc3dBhEwGgT
 iJtL8RHWgYbEoPl83DiKbG+SBQTAqG0af6c3faAJ32CtR/nc6JpilK7yBnarE3MGaAXR2ss1Lk2
 LfHcmHhjzcQ4x/V0+yFjm1054UzqvToq+4JDOS/GrL+xEuRBu/IrEqdd+dW8YRLNznBgPg2RE6f
 /F9yqmrRiBP4vAv8t2CzcV3e1wix/9Sc7aV/Gbgn6P3wej4GnhjHZolfRnGf+CjHdU4TN646efe
 ZcDpAgMwHRt+NUA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 06 Nov 2024 07:48:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5686

This patch makes the "latexpdf" target compile the documentation with
xelatex instead of the default pdflatex engine.

The reason behind this is stated in [YOCTO #14357]: pdflatex does not
support compiling foreign characters, so we need to resort to another
engine, here xelatex.

It also increases the texmf config buf_size to 10000000 to avoid a
compilation error.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/Makefile | 5 ++++-
 documentation/conf.py  | 7 ++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/documentation/Makefile b/documentation/Makefile
index d0333de2cb84ba648a64e51fd3711113788d6714..12ca2f95f6578a31cd309f80b58a2702561a6b9f 100644
--- a/documentation/Makefile
+++ b/documentation/Makefile
@@ -60,9 +60,12 @@ epub: $(PNGs)
 	$(SOURCEDIR)/set_versions.py
 	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
 
+# Note: we need to pass buf_size here (which is also configurable from
+# texmf.cnf), to avoid following error:
+#   Unable to read an entire line---bufsize=200000. Please increase buf_size in texmf.cnf.
 latexpdf: $(PDFs)
 	$(SOURCEDIR)/set_versions.py
-	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
+	buf_size=10000000 $(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
 
 all: html epub latexpdf
 
diff --git a/documentation/conf.py b/documentation/conf.py
index 9e87df0564c1e93140bce8705d9b45f75cbded58..c7dd4e03fc0e99176a0fa2f74fda58efaf0af9b2 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -158,9 +158,14 @@ html_last_updated_fmt = '%b %d, %Y'
 # Remove the trailing 'dot' in section numbers
 html_secnumber_suffix = " "
 
+# We need XeTeX to process special unicode character, sometimes the contributor
+# list from the release note contains those.
+# See https://docs.readthedocs.io/en/stable/guides/pdf-non-ascii-languages.html.
+latex_engine = 'xelatex'
+latex_use_xindy = False
 latex_elements = {
     'passoptionstopackages': '\\PassOptionsToPackage{bookmarksdepth=5}{hyperref}',
-    'preamble': '\\setcounter{tocdepth}{2}',
+    'preamble': '\\usepackage[UTF8]{ctex}\n\\setcounter{tocdepth}{2}',
 }
 
 # Make the EPUB builder prefer PNG to SVG because of issues rendering Inkscape SVG

-- 
2.46.1


