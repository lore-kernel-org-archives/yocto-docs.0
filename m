Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38064.1793174721538370948
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Oct 2026 01:05:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=aFVXcAlU;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6FC3E1A1379
	for <docs@lists.yoctoproject.org>; Wed, 28 Oct 2026 08:05:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3FDD960769
	for <docs@lists.yoctoproject.org>; Wed, 28 Oct 2026 08:05:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5A418103290C8;
	Wed, 28 Oct 2026 09:05:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793174718; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=n0ILl5RDNpPtD+5dMKGEqZ6Md2mGkqWXatvpL+27Daw=;
	b=aFVXcAlUNlQnO/gE72ywbGc8lJDC/1ZU/WwEKHQxyK05sz/ZlIZemp+lsxh88bix532TCe
	gR5F+J46F2dYYkXVIkVzhFLlBvvIo21duFtdN35ROHibDfe6O0x0u0YcKhz3gbXM/QeY5W
	J8HgxsaSjS7z/nNr9xbxbxXTxiq063qyllxN9NZwuVxAJReOrnCjREL3S1N2OMI8Wn5/Qf
	l4DiYx0Qqf9kXN8Jxg1rdjdp3NtHsJEYGp5F4Q1pWrHNAQ2ubj8QqeciAJALgJD+vBLNj2
	o1MRKV/NutwnxLdRbSBHObFlbaauAgkP6QMRhLu52j3uqvPwfqQ66DeXRP9ebA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 28 Oct 2026 09:04:57 +0100
Subject: [PATCH 5/8] Makefile: use splithtml tag for html target
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-tags-v1-5-d5ad01019eae@bootlin.com>
References: <20261028-tags-v1-0-d5ad01019eae@bootlin.com>
In-Reply-To: <20261028-tags-v1-0-d5ad01019eae@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Antonin Godard <antonin.godard@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1005;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=L3TIlLa3o5l5SxYWf1Sil/HHtmkkTZ6vMG8ZbLqXmQc=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBq4ay4fUeP+QmobtguixOqruPi68Me307FxFotK
 ma6o32KHsKJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCauGsuAAKCRDRgEFAKaOo
 No7LEACKPSngoz7rLAPOldg51afPlyqyRk4fy6HdyaXm2rsYZQg1qmBWRSPrfFDYixcUFr1aOoW
 ItREd0xGe1QtWa/BOv9pMpNnr4QAcSFaPbDhczk7CSh6tkO7dzGAI736zdsLI1N2fYWYPPeM/pQ
 HKhIctvKxtAPiNPX5UQ9u2X0OHjYs5zHB96Uhx7HdlBy6o4s3sNTw68pcmrajz49dB0CvV4Xjus
 UYtO8v/lrRzZ8fBaYXVkBMRXqxcm2ZvifX7jBZA9pIq+paFcI5ofkTjcSaIubWKH9FbtjP7bH/v
 iXQlduP01WFP+C/bDtKLcCUcqUxrGLJaly2HUi65tAlHvUJheoNL+tn0Zyc2Mbe1i9oxBvhL/ip
 JmtkT9+O6LlRuU4RVbXrFY6Rd2wceLC6tZeAxDMWRjOvTxgBgmEQAL2gFJXWDO5ih1ebwA6RVOK
 opInDuUTbmnpG9DQxFXFKGprBnMGJW43/LFWXdoOyZbSrNrVh74kgzWSkU/FF5opoIjvIkUlusr
 xPr4CCftfC1N6j7H90SShVxBC7YuyzsCzmyaSnyaZKXzgCMAkKKoEMerPfSm5dDw0pppt4bc/ex
 7P/IEbsFwbDhix4OaTJAkOpIlqoxd3HOkcrUnbUMEKQe2WYlvikW8g41HSb0/ilWulkkQPz2a0o
 TBjcWEWohG87urg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Wed, 28 Oct 2026 08:05:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10733

Sphinx has the ability to include content based on tags in the
documentation with the '.. only::' directive. As '.. only:: html' is
common to _all_ HTML-based documents (html, singlehtml, epub), there was
no way to differentiate the split HTML build from the others.

For that reason, add the splithtml tag when building it. The goal is be
able to to include content _only_ for this build type.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/documentation/Makefile b/documentation/Makefile
index f165e36c2..2f2d6213d 100644
--- a/documentation/Makefile
+++ b/documentation/Makefile
@@ -55,6 +55,10 @@ latexpdf:
 
 all: html epub latexpdf
 
+html:
+	$(SOURCEDIR)/set_versions.py
+	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" --tag splithtml $(SPHINXOPTS)
+
 %:
 	$(SOURCEDIR)/set_versions.py
 	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS)

-- 
2.55.0

