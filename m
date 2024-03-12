Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A90CC54E5D
	for <webhook@archiver.kernel.org>; Tue, 12 Mar 2024 21:03:56 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.124.1710277431062788819
 for <docs@lists.yoctoproject.org>;
 Tue, 12 Mar 2024 14:03:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ayB3v2YS;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 432111BF205;
	Tue, 12 Mar 2024 21:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710277429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tV/SMGvrZJAtU4O+s7xbMriWi6q3yFqIF324l3nR8OM=;
	b=ayB3v2YSMGcpscgTnSQiQk9tHD2Zr7vX/ohJdtOrnKi0NI/2UIN4ewki/zrh4ZpF54Gvrz
	7/GdIbbQgRF+GVmdBgt+0OGDyJ0vRMxFm/eXf7EUNMeevq5UeqCtWA1y99oHQA8BMsAsNl
	jl5d329dMm1iPFEzdbkuic3viIBrPFaHqCb51JDdGr33VC6j1U5toRVSGUxCA9bYLcMG0+
	QdM44YHNydkrUuaR30MFlP6K9n7wGmR2HkVcia8pcwMz3lDZ0ZNJeKZIyEcjaBTiBF4shW
	uuRavEh7PPK5uuttO0aaXmtAJkn9Qi5dBwZnMStHuFiiN8G78EBOQ7jv+MxJGQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH] manuals: add initial stylechecks with Vale
Date: Tue, 12 Mar 2024 22:03:45 +0100
Message-Id: <20240312210345.8832-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 12 Mar 2024 21:03:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4945

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Use the "Vale" (https://vale.sh) tool to perform text style checks
Run "make stylecheck" to run the checks.

This just checks the text, not the Sphinx syntax style choices.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

---

See https://lwn.net/Articles/964075/ for a recent introduction.
Don't hesitate to run the checks, propose fixes for the reported
issues and improvements to the checking rules and accepted words!
---
 documentation/.gitignore                          |  2 ++
 documentation/.vale.ini                           |  7 +++++++
 documentation/Makefile                            |  9 ++++++++-
 documentation/README                              | 14 ++++++++++++++
 documentation/standards.md                        | 15 +++++++++++++++
 .../config/vocabularies/OpenSource/accept.txt     |  4 ++++
 .../styles/config/vocabularies/Yocto/accept.txt   |  4 ++++
 7 files changed, 54 insertions(+), 1 deletion(-)
 create mode 100644 documentation/.vale.ini
 create mode 100644 documentation/styles/config/vocabularies/OpenSource/accept.txt
 create mode 100644 documentation/styles/config/vocabularies/Yocto/accept.txt

diff --git a/documentation/.gitignore b/documentation/.gitignore
index 494b4f4de5..b23d598054 100644
--- a/documentation/.gitignore
+++ b/documentation/.gitignore
@@ -7,3 +7,5 @@ releases.rst
 .vscode/
 */svg/*.png
 */svg/*.pdf
+styles/*
+!styles/config
diff --git a/documentation/.vale.ini b/documentation/.vale.ini
new file mode 100644
index 0000000000..02042bb632
--- /dev/null
+++ b/documentation/.vale.ini
@@ -0,0 +1,7 @@
+StylesPath = styles
+MinAlertLevel = suggestion
+Packages = RedHat, proselint, write-good, alex, Readability, Joblint
+Vocab = Yocto, OpenSource
+[*.rst]
+BasedOnStyles = Vale, RedHat, proselint, write-good, alex, Readability, Joblint
+
diff --git a/documentation/Makefile b/documentation/Makefile
index 9fb6814c8f..e1b61f17f1 100644
--- a/documentation/Makefile
+++ b/documentation/Makefile
@@ -5,6 +5,9 @@
 # from the environment for the first two.
 SPHINXOPTS    ?= -W --keep-going -j auto
 SPHINXBUILD   ?= sphinx-build
+# Release notes are excluded because they contain contributor names and commit messages which can't be modified
+VALEOPTS      ?= --no-wrap --no-wrap --glob '!migration-guides/release-notes-*.rst'
+VALEDOCS      ?= .
 SOURCEDIR     = .
 IMAGEDIRS     = */svg
 BUILDDIR      = _build
@@ -20,7 +23,7 @@ endif
 help:
 	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
 
-.PHONY: all help Makefile clean publish epub latexpdf
+.PHONY: all help Makefile clean stylecheck publish epub latexpdf
 
 publish: Makefile html singlehtml
 	rm -rf $(BUILDDIR)/$(DESTDIR)/
@@ -46,6 +49,10 @@ PNGs := $(foreach dir, $(IMAGEDIRS), $(patsubst %.svg,%.png,$(wildcard $(SOURCED
 clean:
 	@rm -rf $(BUILDDIR) $(PNGs) $(PDFs) poky.yaml sphinx-static/switchers.js
 
+stylecheck:
+	vale init
+	vale $(VALEOPTS) $(VALEDOCS)
+
 epub: $(PNGs)
 	$(SOURCEDIR)/set_versions.py
 	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
diff --git a/documentation/README b/documentation/README
index 4d31036e69..8035418cac 100644
--- a/documentation/README
+++ b/documentation/README
@@ -151,6 +151,20 @@ dependencies in a virtual environment:
  $ pipenv install
  $ pipenv run make html
 
+Style checking the Yocto Project documentation
+==============================================
+
+The project is starting to use Vale (https://vale.sh/)
+to validate the text style.
+
+To install Vale:
+
+ $ pip install vale
+
+To run Vale:
+
+ $ make stylecheck
+
 Sphinx theme and CSS customization
 ==================================
 
diff --git a/documentation/standards.md b/documentation/standards.md
index 9f4771ebd9..a4f8be0dcf 100644
--- a/documentation/standards.md
+++ b/documentation/standards.md
@@ -5,6 +5,21 @@ documentation is created.
 
 It is currently a work in progress.
 
+## Automatic style validation
+
+There is an ongoing effort to automate style validation
+through the [Vale](https://vale.sh/). To try it, run:
+
+    $ make vale
+
+Note that this just applies to text. Therefore, the syntax
+conventions described below still apply.
+
+If you wish to add words to the "accept.txt" files
+(./styles/config/vocabularies/<Vocab>/accept.txt),
+make sure the spelling and capitalization matches
+what Wikipedia uses. Wikipedia is our reference!
+
 ## Text standards
 
 ### Bulleted lists
diff --git a/documentation/styles/config/vocabularies/OpenSource/accept.txt b/documentation/styles/config/vocabularies/OpenSource/accept.txt
new file mode 100644
index 0000000000..98e76ae1f5
--- /dev/null
+++ b/documentation/styles/config/vocabularies/OpenSource/accept.txt
@@ -0,0 +1,4 @@
+ftrace
+toolchain
+systemd
+LTTng
diff --git a/documentation/styles/config/vocabularies/Yocto/accept.txt b/documentation/styles/config/vocabularies/Yocto/accept.txt
new file mode 100644
index 0000000000..b725414014
--- /dev/null
+++ b/documentation/styles/config/vocabularies/Yocto/accept.txt
@@ -0,0 +1,4 @@
+Yocto
+BSP
+BitBake
+OpenEmbedded
-- 
2.34.1


