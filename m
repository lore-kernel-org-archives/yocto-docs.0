Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7A16E674A4
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 12:28:31 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.79096.1766406509049958609
 for <docs@lists.yoctoproject.org>;
 Mon, 22 Dec 2025 04:28:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=H45a01z3;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 41A0F1A236D
	for <docs@lists.yoctoproject.org>; Mon, 22 Dec 2025 12:28:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0E021606C1;
	Mon, 22 Dec 2025 12:28:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 31BEE10AB0286;
	Mon, 22 Dec 2025 13:28:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766406502; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LBxJnBt5XWdtRpJVkm2wwxV6jJO4ZXpXcPxBxA2rTMU=;
	b=H45a01z3VQBbOBK98JVt9nP0IezYgKLr5BCw0IMBl643hHx7udZA08Ka4VuTnhJ1iNHSVI
	8FpYvVEmT0+siqReS0HXl9a9HmJBEdNmJ71Rrqdn6fUMs6hdiX/sgP0OLFhi7YwAGNdiLh
	nA54uZpOKBfiBWxSI8WNYlHJZvMOgDWimn1/AFPwgXHUZVgcFQsZGkJdnbwIS4SxXT6IDU
	vy/h5xx5CSK2ltzZvCC+A2PV22DdEJLMtJcuEBqmRFmv9YMH65epDlcKhVjaIGKzT+2nrG
	332bmI00en9CzxJ3zJryu+sjqDjmSv1cI6kojAxYYm41YbljBt1luFl7Y3SKOQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 22 Dec 2025 13:27:51 +0100
Subject: [PATCH 5/8] Makefile: wrap set_versions.py with flock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-concurrent-safety-v1-5-e3d86e44cd38@bootlin.com>
References: <20251222-concurrent-safety-v1-0-e3d86e44cd38@bootlin.com>
In-Reply-To: <20251222-concurrent-safety-v1-0-e3d86e44cd38@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2331;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=NmSLRODMd7MtGLMfR1Jlh0nEs13L0LKLDkVje6/NfOY=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpSTlS9RiTNBWlEs9TYtkwS4lRHgxvBB11VMYNv
 YdGI3KRt5SJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUk5UgAKCRDRgEFAKaOo
 NuVjD/9OpPM9YnpZPeA2FbuKqTA+hr8Jl5XxnYkOnSekdsWfEgHFJLxuxzSBUiiys+kyZp0B+hR
 YX6JP5sJS6IP0yieLYh8hcj1ydhNg9ZezyxBJTN4Te4vizZF3a289baUo4zuLFrQJ4Cka2EuYVd
 vpvAcMRtP6tTr28yXezzgfW9Ndcu6CRc0nsQ3aQE/kMHe/scLFQ2j1rnC94Dtkts/t41F02TkzA
 3dpeUwJhLkCJG494ZmeuRiFxqs1WF1c3dGa1boTY43FWg4cFH6MbKjGJFLOyPdRTejeGppNRuq/
 udvgQnfOC8AK84SLAcPhznBirXO/RDjLslIMhKA3NirFp+amJdOMLlHp0r4MIu1mSln8hAMWOkg
 giqyUHz1T+gQtlICu6PdYrQ4RKd9vTCp3BAuzmViYDz5YKfOwqwg43tXwg0T+NSUw6uQuTVXFZ/
 5kRgdGZuS3WQ4DVbWgwMnfs9TFbyFctwHkDD4HS8BVHOBovy9InNYtDy5Or/xGmSgQfEfggsCjX
 7qzcCcxVdTxoNlW797EouoWAY2oKWGOqVAvxyfIjNTdgE8z5OX+vqSg5u8vcYiW83CayenKnnJ9
 LLeWudCYt6VpcyX/4gskJy8/DkqYVJqf1UgltUqarEQuH946HT06EJ3wy/uASpYnXbTmRKN7Uds
 JwID5wd1h0IMJOQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 22 Dec 2025 12:28:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8314

The set_versions.py script modified files in the source directory. To
improve concurrent docs builds, wrap the set_versions.py with flock,
with a 30 seconds timeout.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/.gitignore | 1 +
 documentation/Makefile   | 8 ++++----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/documentation/.gitignore b/documentation/.gitignore
index b23d598054..a5a5efc19c 100644
--- a/documentation/.gitignore
+++ b/documentation/.gitignore
@@ -9,3 +9,4 @@ releases.rst
 */svg/*.pdf
 styles/*
 !styles/config
+set-versions.lock
diff --git a/documentation/Makefile b/documentation/Makefile
index 5f84a93e32..fe49d74cc6 100644
--- a/documentation/Makefile
+++ b/documentation/Makefile
@@ -50,7 +50,7 @@ PNGs := $(foreach dir, $(IMAGEDIRS), $(patsubst %.svg,%.png,$(wildcard $(SOURCED
 	$(SVG2PNG) --format=png --output=$@ $<
 
 clean:
-	@rm -rf $(BUILDDIR) $(PNGs) $(PDFs) poky.yaml sphinx-static/switchers.js releases.rst
+	@rm -rf $(BUILDDIR) $(PNGs) $(PDFs) poky.yaml sphinx-static/switchers.js releases.rst set-versions.lock
 
 checks:
 	$(SOURCEDIR)/tools/check-glossaries --docs-dir $(SOURCEDIR)
@@ -63,14 +63,14 @@ sphinx-lint:
 	sphinx-lint $(SPHINXLINTDOCS)
 
 epub: $(PNGs)
-	$(SOURCEDIR)/set_versions.py
+	flock -w 30 "$(SOURCEDIR)"/set-versions.lock -c $(SOURCEDIR)/set_versions.py
 	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
 
 # Note: we need to pass buf_size here (which is also configurable from
 # texmf.cnf), to avoid following error:
 #   Unable to read an entire line---bufsize=200000. Please increase buf_size in texmf.cnf.
 latexpdf: $(PDFs)
-	$(SOURCEDIR)/set_versions.py
+	flock -w 30 "$(SOURCEDIR)"/set-versions.lock -c $(SOURCEDIR)/set_versions.py
 	buf_size=10000000 $(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
 
 all: html epub latexpdf
@@ -78,5 +78,5 @@ all: html epub latexpdf
 # Catch-all target: route all unknown targets to Sphinx using the new
 # "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
 %:
-	$(SOURCEDIR)/set_versions.py
+	flock -w 30 "$(SOURCEDIR)"/set-versions.lock -c $(SOURCEDIR)/set_versions.py
 	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

-- 
2.51.0


