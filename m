Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37907.1793174719719483143
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Oct 2026 01:05:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=h+97m27s;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E3BF01A1377
	for <docs@lists.yoctoproject.org>; Wed, 28 Oct 2026 08:05:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B9CFE60769
	for <docs@lists.yoctoproject.org>; Wed, 28 Oct 2026 08:05:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 13F1A1032909C;
	Wed, 28 Oct 2026 09:05:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793174717; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=V1vC7rhV0DBZWnPW2po+wGsIYyCsAIwxeA5NZhM/FfQ=;
	b=h+97m27s0o/PAMFsKcwFmAj89SLxZtUuEwEs5lZKmCdhajfjZRnnsSka4vq+IBgfIwx6zX
	9+HXtVjmeo7Cnn3a0LWn/wZFEUt0eUWYvW845wcT972s8PQHyumkiVGmpsU43RmWhWJ0LY
	t8hdtptMovtKw2Uw5pd/y42fLzAlBeYoWeTbVzTCnDy5L655hafT+iFVcSTNsNSnJLn+Rh
	cyl90bpcYypLUIvBZ46GB6nTERHx5Qfc6IKMdgmzgPqgAILSb3/3YTyXGmSMOByb/0gJNR
	RE+kNzmbqDywyK70CJI5eGSobROh8dCZdugf2XrmA5VRb2jvv5+RIGxHhG9LWw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 28 Oct 2026 09:04:55 +0100
Subject: [PATCH 3/8] conf.py: enable the sphinx-tags extension
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-tags-v1-3-d5ad01019eae@bootlin.com>
References: <20261028-tags-v1-0-d5ad01019eae@bootlin.com>
In-Reply-To: <20261028-tags-v1-0-d5ad01019eae@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Antonin Godard <antonin.godard@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2257;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=vkrO+5Uh5UvmkBPuarjX2vi6Qqilg1UufDa5VajUTp4=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBq4ay3nMqT9dEo3n7tKE9VnGPNQsTvHhRSqBmdj
 Ih1ICDn4yWJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCauGstwAKCRDRgEFAKaOo
 Ng8ND/909uz8gByC3+dW0Q1DL70qn6n225KbPFIeHN4yCdU5ej7x55lObcm6GEdwKrMI1eefhg8
 Shti0EVMBJsuHdmDoAbrFw3KO6X+jQPZkAYFmfWPDaMy/mPNpY5C+BNTgi9E7J6PUhTAygERpZy
 A+yeqkpn5SCn0hFLRDp8+Ur4IUzYee5goHcuhUVl/+jvcGuAdVF0BXSnYiP6pZNBfjdBzkVBbK6
 001TC/GxuVJZ95jG+HyZ5O+aFITCYPd25it6edCXgUex0+LOG5Y6zazZKbw6pBoEJDyHLh31hBs
 dENAWsjcKAyG2fL3dKuqvFaDbiEcFPJY91ZSw95Zf8H30MI/cKqWoeE4O1GWvZiTWbuvO5eHWLb
 +R3rIAZdNLfQCdKu+iJM+h3hNVtcdklWh6Qz18Ak2lThnJ3JEgVnwf8UJFLXoak7iwALEeFlpEu
 x3tJPhB3uh1G1I8myng1n3dzLkUR7/AuYVdmZiUh/pX8jeNDDW4erQS9DVTKlMSpbMdZzxubl9W
 liHATj4wAFaAQPUM9/8w55E8ghGpGIrmYP2Uv970OPtKUvMYgicOsI8XmoGk9g3jB+XHibMEqrb
 cHDhUsSF8s9t0FRo3fL5iNwYTCSSFQ0JSCy1GWDhIUthCV/0e7iirkx88YodFp/7vzXnWml+zhY
 Lzceh66/YX10LpA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Wed, 28 Oct 2026 08:05:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10731

The sphinx-tags extension can be used to add tags to document, which
then creates a section of the documentation with a list of tags which
group documents. This should help users finding the different documents
across the Yocto Project documentation which fall under a common
category.

Update the Makefile to remove the generated _tags/ directory on a make
clean, and the .gitignore.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/.gitignore | 1 +
 documentation/Makefile   | 2 +-
 documentation/conf.py    | 8 ++++++++
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/documentation/.gitignore b/documentation/.gitignore
index d6d020efb..84d82f45d 100644
--- a/documentation/.gitignore
+++ b/documentation/.gitignore
@@ -1,5 +1,6 @@
 sphinx/__pycache__
 _build/
+_tags/
 Pipfile.lock
 poky.yaml
 sphinx-static/switchers.js
diff --git a/documentation/Makefile b/documentation/Makefile
index 2df23ebf4..f165e36c2 100644
--- a/documentation/Makefile
+++ b/documentation/Makefile
@@ -33,7 +33,7 @@ publish: Makefile checks epub latexpdf html singlehtml
 	sed -i -e 's@index.html#@singleindex.html#@g' $(BUILDDIR)/$(DESTDIR)/singleindex.html
 
 clean:
-	@rm -rf $(BUILDDIR) poky.yaml sphinx-static/switchers.js releases.rst releases.json
+	@rm -rf $(BUILDDIR) _tags/ poky.yaml sphinx-static/switchers.js releases.rst releases.json
 
 checks:
 	$(SOURCEDIR)/tools/check-glossaries --docs-dir $(SOURCEDIR)
diff --git a/documentation/conf.py b/documentation/conf.py
index d2252d5ab..75d062945 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -50,6 +50,7 @@ extensions = [
     'sphinx.ext.extlinks',
     'sphinx.ext.intersphinx',
     'sphinx_copybutton',
+    'sphinx_tags',
     'sphinxcontrib.rsvgconverter',
     'yocto-vars'
 ]
@@ -260,3 +261,10 @@ copybutton_prompt_is_regexp = True
 copybutton_only_copy_prompt_lines = True
 copybutton_remove_prompts = True
 copybutton_line_continuation_character = "\\"
+
+# -- sphinx_tags configuration -----------------------------------------------
+
+tags_create_tags = True
+tags_page_title = "Tag"
+tags_page_header = "Document(s) with this tag"
+tags_create_badges = True

-- 
2.55.0

