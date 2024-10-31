Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EB07D767F0
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 16:56:39 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.17506.1730393792352467157
 for <docs@lists.yoctoproject.org>;
 Thu, 31 Oct 2024 09:56:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=ginfM/S4;
 spf=pass (domain: baylibre.com, ip: 209.85.221.50, mailfrom: jstephan@baylibre.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-37ec4e349f4so728204f8f.0
        for <docs@lists.yoctoproject.org>; Thu, 31 Oct 2024 09:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730393791; x=1730998591; darn=lists.yoctoproject.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Dfe6GLjTSwPpbVGINLkfSatO1Q/SF9CvceQ+FJ70Vc=;
        b=ginfM/S4tWlAT80vu91t/KvsN6XdvvswGDC//bmL0t3bMvZISvfBQ5hZOPm0MfIbRj
         7aZ2LMu7MQtwuK6/2Q2akbGyf5DGEpNa+WD1J+G5VfKy4GX150Zb+jm885ZcRsROQJhx
         iRs+bSPxaYeC6bwnzrwUHFHTvKxKGgfyb+4jnFQ0Cm5qfa/FnV1QJ3OtRPn7fEj+o/+5
         PX2UWJRjqpTQsRY+WCkkFEDt1E+cLyz+sskps9fW8ZqZ88MczdO+tUx62csaJJoAO5sx
         ZkSlHLdqKeWZ0O+pblpTfnFR2gK3CtXIO4JobOwwIBvAF5sQVnSCEC0fq5NYLKTJPBVZ
         jE7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730393791; x=1730998591;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Dfe6GLjTSwPpbVGINLkfSatO1Q/SF9CvceQ+FJ70Vc=;
        b=xE4h94pUY/RZD5/nxl3gosqiVAY87pKyc4mC/vL4sZurugVfNPlz7u+bQIeh39fjDN
         wMUUUB+hpWhUwa0az6pQavdKf9pydTH06T1i9jhMJo2hE4VGtQCsSCVd7Ym13bC6FUfr
         +Q+WHBSGHFpEv/a7+Q9GUAGh6qgVul8QmCDOG9CGbzKOyMmYN3KvoXMPB0ZHBCKyakFD
         G8Wt5gfxo7GPWjbfHDiYabiDSztXX0qLR8MaDNHgOoAEJySu5EkynT1INfLGv7nkiMun
         i6uIE1KcGl/jT+0aYcdhD8Wems8Q/XOrSxbw0jWQ6J35lGR9m7B9xY7g0+P99HZLnKH4
         brLw==
X-Gm-Message-State: AOJu0YyFdKqfs/tU+kWNytSPtHajAPPV5yuoPD8+RVh/ETw5sxJrf/n2
	f9AHWpR1J+ixMxuLUJCzSwdfslPdRPUknElH8rxjJYD9t63BDAw5Te/SPbRw9Bx03y1ywxbU7pL
	u1J0=
X-Google-Smtp-Source: AGHT+IEH55vyOVo/gDZZl0Qaj4jwnK4UbUU6kWBEgD9dFGBLv+sxWYgo1Eo8WQJ/IIiXARAoGLD5JA==
X-Received: by 2002:a05:6000:1fa1:b0:37c:c842:a16e with SMTP id ffacd0b85a97d-381c7a47818mr445497f8f.5.1730393790774;
        Thu, 31 Oct 2024 09:56:30 -0700 (PDT)
Received: from [192.168.1.64] (2a02-8428-e55b-1101-1e41-304e-170b-482f.rev.sfr.net. [2a02:8428:e55b:1101:1e41:304e:170b:482f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10e747csm2660525f8f.64.2024.10.31.09.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 09:56:30 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 31 Oct 2024 17:56:17 +0100
Subject: [PATCH 2/5] documentation: Makefile: add SPHINXLINTDOCS to specify
 subset to sphinx-lint
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-add-bblock-documentation-v1-2-32b89093bbda@baylibre.com>
References: <20241031-add-bblock-documentation-v1-0-32b89093bbda@baylibre.com>
In-Reply-To: <20241031-add-bblock-documentation-v1-0-32b89093bbda@baylibre.com>
To: docs@lists.yoctoproject.org, Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.14.2
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 31 Oct 2024 16:56:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5637

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
 documentation/README   |  9 ++++++++-
 2 files changed, 20 insertions(+), 12 deletions(-)

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
index 6a4db97d65b9c23828163d8b548485b2e302bc97..d2676ae2de9cb9c2dbe4191c0e38f8847cd8603b 100644
--- a/documentation/README
+++ b/documentation/README
@@ -149,7 +149,7 @@ lot of warnings/errors, thus one can run Vale on a subset:
   $ make stylecheck VALEDOCS="<file1> <file2>"
   $ make stylecheck VALEDOCS=<dir>
 
-Link checking the Yocto Project documentation
+Lint checking the Yocto Project documentation
 =============================================
 
 To fix errors which are not reported by Sphinx itself,
@@ -163,6 +163,13 @@ To run sphinx-lint:
 
  $ make sphinx-lint
 
+Lint checking the whole documentation might take some time and generate a
+lot of warnings/errors, thus one can run sphinx-lint on a specific file:
+
+  $ make sphinx-lint SPHINXLINTDOCS=<file>
+  $ make sphinx-lint SPHINXLINTDOCS="<file1> <file2>"
+  $ make sphinx-lint SPHINXLINTDOCS=<dir>
+
 Sphinx theme and CSS customization
 ==================================
 

-- 
2.47.0


