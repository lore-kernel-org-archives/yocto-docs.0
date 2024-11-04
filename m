Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DCD9E6F07E
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 15:59:24 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.61219.1730735955508157062
 for <docs@lists.yoctoproject.org>;
 Mon, 04 Nov 2024 07:59:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=C0kK8fgc;
 spf=pass (domain: baylibre.com, ip: 209.85.221.52, mailfrom: jstephan@baylibre.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37d4a5ecc44so2825301f8f.2
        for <docs@lists.yoctoproject.org>; Mon, 04 Nov 2024 07:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730735954; x=1731340754; darn=lists.yoctoproject.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vsu9ILLFtvAA7Y9JmT8mi7CTAlLuKU84EKpr7x9TrYs=;
        b=C0kK8fgcr47UtDGxgtnOWhYHmceTzn4jvAwcAJ6aVAJe1oPJQv7d76vA3cyEAd58Ha
         YgQIOmu6VJCgYlJEiYCI6NxjPDLwu9OY+hSIiVHHLuKUtjtS3/vW01mAlN4MrRqNbEC4
         K8L38HEcs68F5elNZevohEc43GdwWb3fojLzAvxdslzLH8FLJPGc7YiG8p6Cf6+jCoNr
         axqIrPUL3FqwjJaBKpUC3eIqEmtj+sVnmWet5oMg6c2umYtvStL6Aj2uiMghn+hCSKKm
         /OyighOJhi8WYbcwItvYf+oMm9wGiyoPESMTC4UYP+8tsN0JDlHuxbn+PVr6XTVxUm0/
         av8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730735954; x=1731340754;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vsu9ILLFtvAA7Y9JmT8mi7CTAlLuKU84EKpr7x9TrYs=;
        b=tmlu27I3VAq1v59pgrN8flvGkE8RYt8bBWQZENyIeWJSKbPnORi6g98X/ErCPRUnE6
         x1cB2EKyjOn8u2/8zfpNNYEV44iStUk4dgeOvR+J81OT9nF+mpTi/LQUgp44JZtbQrTR
         HjnzszxNBNSqd54xnNgKx8YsjpSA/MdO3fctXNLb6HHQHj8zdrQuw7Mo+Q3936ye9HsK
         kJYCmPXj52Nw+seLzHQqr3iYz1gFReb2C6sF7LeaH+WV4+2n20sfljyrPBDfFOKXihQL
         rmzoj/++lolilhXhBi+fQlbhs/znqseU4E2FB4Yzx7+alwfsIbp77roix2PnXUI/bPyi
         S1kg==
X-Gm-Message-State: AOJu0YzF/BtxIUAToOJcyn8OeYK7qEeCSrNPT1Ocp/UEuKKYXWxZkqGB
	MAu6plH5JRdUYb85jKVbnMu5UxwLL7AwSCAsQSXJQr8XeZtqamkVW/AutMn7lcErHtJ9Cw3gDxr
	6nYw=
X-Google-Smtp-Source: AGHT+IF8WWT/EWO49/qEZ87/J6+1wvQwUim/AmsnRBbnHMz8iNB4jD+8bx2271ldpbhnXVg4+R1NEw==
X-Received: by 2002:adf:fb48:0:b0:37d:49cd:7b46 with SMTP id ffacd0b85a97d-38061158f51mr22319593f8f.27.1730735953747;
        Mon, 04 Nov 2024 07:59:13 -0800 (PST)
Received: from [192.168.42.0] (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10d49d4sm13581732f8f.34.2024.11.04.07.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 07:59:13 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
Date: Mon, 04 Nov 2024 16:59:13 +0100
Subject: [PATCH v2 2/2] documentation: Makefile: add SPHINXLINTDOCS to
 specify subset to sphinx-lint
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241104-add-bblock-documentation-v2-2-74a8a2cff0f8@baylibre.com>
References: <20241104-add-bblock-documentation-v2-0-74a8a2cff0f8@baylibre.com>
In-Reply-To: <20241104-add-bblock-documentation-v2-0-74a8a2cff0f8@baylibre.com>
To: docs@lists.yoctoproject.org, Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.14.2
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 04 Nov 2024 15:59:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5669

make sphinx-lint runs sphinx-lint on the whole documentation which can be
long and reports a lot or errors/warnings. Let's add a new
SHPINXLINTDOCS variable to allow specifying a subset, just as VALEDOCS
does. Keep variable assignment aligned and also use $(SOURCEDIR) by
default for SPHINXLINTDOCS and VALEDOCS variables.

Also update the README file and fix a typo in Link checking section
title.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 documentation/Makefile | 23 ++++++++++++-----------
 documentation/README   | 10 +++++++++-
 2 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/documentation/Makefile b/documentation/Makefile
index 189bd1dfac69d3b3185aa3a2ff7c212084ae280b..0bd9db5eaeb9122f9f396cda61631c403a1325a0 100644
--- a/documentation/Makefile
+++ b/documentation/Makefile
@@ -3,17 +3,18 @@
 
 # You can set these variables from the command line, and also
 # from the environment for the first two.
-SPHINXOPTS    ?= -W --keep-going -j auto
-SPHINXBUILD   ?= sphinx-build
+SPHINXOPTS     ?= -W --keep-going -j auto
+SPHINXBUILD    ?= sphinx-build
 # Release notes are excluded because they contain contributor names and commit messages which can't be modified
-VALEOPTS      ?= --no-wrap --glob '!migration-guides/release-notes-*.rst'
-VALEDOCS      ?= .
-SOURCEDIR     = .
-IMAGEDIRS     = */svg
-BUILDDIR      = _build
-DESTDIR       = final
-SVG2PNG       = inkscape
-SVG2PDF       = inkscape
+VALEOPTS       ?= --no-wrap --glob '!migration-guides/release-notes-*.rst'
+SOURCEDIR      = .
+VALEDOCS       ?= $(SOURCEDIR)
+SPHINXLINTDOCS ?= $(SOURCEDIR)
+IMAGEDIRS      = */svg
+BUILDDIR       = _build
+DESTDIR        = final
+SVG2PNG        = inkscape
+SVG2PDF        = inkscape
 
 ifeq ($(shell if which $(SPHINXBUILD) >/dev/null 2>&1; then echo 1; else echo 0; fi),0)
 $(error "The '$(SPHINXBUILD)' command was not found. Make sure you have Sphinx installed")
@@ -54,7 +55,7 @@ stylecheck:
 	vale $(VALEOPTS) $(VALEDOCS)
 
 sphinx-lint:
-	sphinx-lint $(SOURCEDIR)
+	sphinx-lint $(SPHINXLINTDOCS)
 
 epub: $(PNGs)
 	$(SOURCEDIR)/set_versions.py
diff --git a/documentation/README b/documentation/README
index 8ac8d5236793774586abddfd89cf1b3daa680edc..8a47fd4a3fd07d41d61a7d681d82bd13ac74527d 100644
--- a/documentation/README
+++ b/documentation/README
@@ -150,7 +150,7 @@ directories:
   $ make stylecheck VALEDOCS="<file1> <file2>"
   $ make stylecheck VALEDOCS=<dir>
 
-Link checking the Yocto Project documentation
+Lint checking the Yocto Project documentation
 =============================================
 
 To fix errors which are not reported by Sphinx itself,
@@ -164,6 +164,14 @@ To run sphinx-lint:
 
  $ make sphinx-lint
 
+Lint checking the whole documentation might take some time and generate a
+lot of warnings/errors, thus one can run sphinx-lint on a subset of files
+or directories:
+
+  $ make sphinx-lint SPHINXLINTDOCS=<file>
+  $ make sphinx-lint SPHINXLINTDOCS="<file1> <file2>"
+  $ make sphinx-lint SPHINXLINTDOCS=<dir>
+
 Sphinx theme and CSS customization
 ==================================
 

-- 
2.47.0


