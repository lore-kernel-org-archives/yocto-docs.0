Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63ACCCD1281
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 13:27:52 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.52058.1711373265750571006
 for <docs@lists.yoctoproject.org>;
 Mon, 25 Mar 2024 06:27:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HpurgoVo;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BD82F20004;
	Mon, 25 Mar 2024 13:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1711373263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/6lrhs6CVPZ2w09S31sDqoZua3CqXE4DoaoLcQIRyNM=;
	b=HpurgoVoRoaRAdcdjBW8vDhssZ6pffC2FbczNqag4l35lrqSIACo+9Dw+zmzWZXcJyZBvk
	ODjpKAZKwMnYfYCYXfrRSybNaoKgKwosR+1TyurZHLZzK28omFGeiEeWyvpA6HmlKe7D1D
	B2DYk1086Rp2dWSrd5q+i4B0RRyE8tQs9rdpKxhHHISBVx9kNd0zNwAK8ceYrVmUgYq1zJ
	djJIWjYnDDEkdyBsVfukfgtCIaSOMwNGFgIpCXfO1yDF+/XW7ukcfaQLRMgw0erPp/gdcN
	APobziyh9LmvqYiE7URF2eH9TyWaWxgiSsziKXJYyecUCOCnVf0Z7b5G3t2w0w==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [kirkstone][PATCH 1/9] manuals: add initial stylechecks with Vale
Date: Mon, 25 Mar 2024 14:27:29 +0100
Message-Id: <20240325132737.3018073-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240325132737.3018073-1-michael.opdenacker@bootlin.com>
References: <20240325132737.3018073-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 25 Mar 2024 13:27:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4999

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
index 096b97ec28..a8f86f7c98 100644
--- a/documentation/.gitignore
+++ b/documentation/.gitignore
@@ -5,3 +5,5 @@ sphinx-static/switchers.js
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
index 33bbca0bab..e5f0effeb5 100644
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
index a2274f6d6e..d3b25adfab 100644
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
 
 This section has not been filled yet
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


