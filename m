Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1ECDCD11DD
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 13:29:32 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.52093.1711373370802834794
 for <docs@lists.yoctoproject.org>;
 Mon, 25 Mar 2024 06:29:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lO3cSkWP;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EA411C0004;
	Mon, 25 Mar 2024 13:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1711373369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mIJIvxq4ck/AilZ+C4cy5cRVqykZRdak4xgJq8aX6AY=;
	b=lO3cSkWPMPOnaurtc9H/fKiqfca3vhNXAhziw0CKi50y8fYNSihhG+X84SKP/7iUEhBH0x
	BooIiwWjIMqgHN0QQLz0sNYoAfdOSC8sEEtOobbj9RyPicgKEUsQt8c2OA9uvycs6R+7si
	qeato4rZuVt2DhxBuKpek8M+Ak0aDHkTJ0FHYec/L7+x+QA3F63gj7u3teNRnFDlXTYVw7
	Fcz2trnBjDz/g5rjakt4Esx8eiw5Ui28K5M8XzH1WgV+vAd82e49tsii+HoO5/2ONI0Yx3
	J98IJKuT3KJaOzTCCmrOI2DJBGeKSQMmastN8QKEdKe+3p43x/yAX3gJ2PNjYA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [nanbield][PATCH 01/11] manuals: add initial stylechecks with Vale
Date: Mon, 25 Mar 2024 14:29:16 +0100
Message-Id: <20240325132926.3018186-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240325132926.3018186-1-michael.opdenacker@bootlin.com>
References: <20240325132926.3018186-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 25 Mar 2024 13:29:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5009

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Use the "Vale" (https://vale.sh) tool to perform text style checks
Run "make stylecheck" to run the checks.

This just checks the text, not the Sphinx syntax style choices.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 documentation/.gitignore                          |  2 ++
 documentation/.vale.ini                           |  7 +++++++
 documentation/Makefile                            | 13 ++++++++++++-
 documentation/README                              | 14 ++++++++++++++
 documentation/standards.md                        | 15 +++++++++++++++
 .../config/vocabularies/OpenSource/accept.txt     |  4 ++++
 .../styles/config/vocabularies/Yocto/accept.txt   |  4 ++++
 7 files changed, 58 insertions(+), 1 deletion(-)
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
index 9fb6814c8f..804a7dd94c 100644
--- a/documentation/Makefile
+++ b/documentation/Makefile
@@ -5,6 +5,9 @@
 # from the environment for the first two.
 SPHINXOPTS    ?= -W --keep-going -j auto
 SPHINXBUILD   ?= sphinx-build
+# Release notes are excluded because they contain contributor names and commit messages which can't be modified
+VALEOPTS      ?= --no-wrap --glob '!migration-guides/release-notes-*.rst'
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
@@ -46,6 +49,14 @@ PNGs := $(foreach dir, $(IMAGEDIRS), $(patsubst %.svg,%.png,$(wildcard $(SOURCED
 clean:
 	@rm -rf $(BUILDDIR) $(PNGs) $(PDFs) poky.yaml sphinx-static/switchers.js
 
+stylecheck:
+	vale sync
+	vale $(VALEOPTS) $(VALEDOCS)
+
+stylecheck:
+	vale sync
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
index 9f4771ebd9..e0c0cba83c 100644
--- a/documentation/standards.md
+++ b/documentation/standards.md
@@ -5,6 +5,21 @@ documentation is created.
 
 It is currently a work in progress.
 
+## Automatic style validation
+
+There is an ongoing effort to automate style validation
+through the [Vale](https://vale.sh/). To try it, run:
+
+    $ make stylecheck
+
+Note that this just applies to text. Therefore, the syntax
+conventions described below still apply.
+
+If you wish to add a new word to an "accept.txt" file
+(./styles/config/vocabularies/<Vocab>/accept.txt),
+make sure the spelling and capitalization matches
+what Wikipedia or the project defining this word uses.
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


