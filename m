Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A8B4FCEE99
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 12:06:12 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43809.1772021170545364638
 for <docs@lists.yoctoproject.org>;
 Wed, 25 Feb 2026 04:06:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=W3Kjh30/;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 110801A1350
	for <docs@lists.yoctoproject.org>; Wed, 25 Feb 2026 12:06:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CA6405FDE6
	for <docs@lists.yoctoproject.org>; Wed, 25 Feb 2026 12:06:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2F20910369284;
	Wed, 25 Feb 2026 13:06:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772021168; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=J6vqAGIYdeuJXWhR/dIgfBzwYsjlN9lE/8lWurynkfc=;
	b=W3Kjh30//6zUKVpPyb27Ygot18YYJyqwrxmyqvsvNvAbvX3WxU5gsGkxQFwUZjtuoHy/uM
	T7ApwzRkBJSO203AKJLVsg/HMyLIkRWWO9Y0ebSWCIk+QtdBPlqGXFBB1RMIlm4a41eAtE
	u6KT8Cp4/qA+H0Ev31ZszMTG2BJWm6uD0SmRzr01OWkQM8FTIwLF0yTF1rNQkHlzBeRbF0
	Zf4yPwaOMZJ8Y3cm5ge4Wp170hq3srid5ptP40sNXgDpLh09RxMkVK/lwnqWXuyZHyR3xO
	aGrA+X/XBBzzIkxnYayIq631jslls4ZcuAfhwuZkye84fIpwNWxLzDCiV/5mYw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 25 Feb 2026 13:06:00 +0100
Subject: [PATCH 2/2] Makefile: add a releases.json target
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-releases-json-v1-2-fee3f01b9197@bootlin.com>
References: <20260225-releases-json-v1-0-fee3f01b9197@bootlin.com>
In-Reply-To: <20260225-releases-json-v1-0-fee3f01b9197@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4009;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=M2h/niq7PX9sZUPyrhEAvA4e8XJSzVr8DQohoElNBeE=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpnuWt3i3hl+rFPd2BAqc8sKfga2fHzT8mBNjKL
 TXv1Z03feWJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaZ7lrQAKCRDRgEFAKaOo
 NsteD/wO2ay4f7JUKo/kWHe9tDZuZQ45DuNHbsQO9MSX01kIDYf2ADSfVacQRT6b//Boy/8YKj6
 CqBnJszfClTuixhenpIOpEJOWvjy9qj5h4VyJLM7pfP9u62YqAbhyRyXI+1SyD/PDbs+o3SgPRF
 xABLWkU/ttroZERJqgxQ8LG3TpUzkHBQyzd+rcMEI9wS+2LMtzRs/ObgKl26744I9AkEPgcePaA
 9/eimFLrfCaUb6CWyKGu/yQu3KGJ7RdGYOopdTLsCpqfC+Uq7ELY3n7xEZn/5TPGDrWCRkf3329
 FqbcyPMToSBVzI22Z35DswicGfrnvQLbORGaJu0mBTqMv7yGPe/aPZO778nGEcL/iEJTSZhLwKl
 PKFwXSggGGQVb058grT3qS+5O0hQToyssjLY4m9gojQXz+c4yIwAdBsvELwtm5Paxs8V6l00sga
 oMYkvMsGtooVoiMQnl2NQlUNg1r+tx2QbIrmxyy1c/Ee0gPncS+g5hkGVD5+U/4enunB8Y9OYFf
 b9gO6HPBI3F7U3k23LkCOvTbL4Wnl2IBbnS0PgcH11FKWGx10X/QY0K0MkzvR+gMUBB1CKKdAg3
 l85I79BHK8SGgOVwYKK/su1nBTT3iqfX1cm4eI3UM3BWKzG05GHK6CNIvnEIuwg8wF3CFGkhay6
 B98/82kPoo6Wrjw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 25 Feb 2026 12:06:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8986

Add a new releases.json target which can be used to update the
releases.json file manually. It is called from the publish target only
(which is the one used on the Autobuilder).

A warning is printed when the file is not up-to-date anymore.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/Makefile                                      | 9 +++++++--
 documentation/tools/host_packages_scripts/almalinux_docs.sh | 2 +-
 documentation/tools/host_packages_scripts/fedora_docs.sh    | 2 +-
 documentation/tools/host_packages_scripts/opensuse_docs.sh  | 2 +-
 documentation/tools/host_packages_scripts/ubuntu_docs.sh    | 2 +-
 5 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/documentation/Makefile b/documentation/Makefile
index e144a50b4..00c7d957d 100644
--- a/documentation/Makefile
+++ b/documentation/Makefile
@@ -24,9 +24,9 @@ endif
 help:
 	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
 
-.PHONY: all checks help Makefile clean stylecheck publish epub latexpdf
+.PHONY: all checks help Makefile clean stylecheck publish epub latexpdf releases.json
 
-publish: Makefile checks epub latexpdf html singlehtml
+publish: releases.json Makefile checks epub latexpdf html singlehtml
 	rm -rf $(BUILDDIR)/$(DESTDIR)/
 	mkdir -p $(BUILDDIR)/$(DESTDIR)/
 	cp -r $(BUILDDIR)/html/* $(BUILDDIR)/$(DESTDIR)/
@@ -73,6 +73,11 @@ latexpdf: $(PDFs)
 	$(SOURCEDIR)/set_versions.py
 	buf_size=10000000 $(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
 
+releases.json:
+	command -v curl jq || echo "curl and jq need to be installed for this target"
+	curl https://dashboard.yoctoproject.org/releases.json | jq --indent 2 >$(SOURCEDIR)/releases.json
+	git --no-pager diff --exit-code -- $(SOURCEDIR)/releases.json || echo "WARNING: releases.json needs to be updated"
+
 all: html epub latexpdf
 
 # Catch-all target: route all unknown targets to Sphinx using the new
diff --git a/documentation/tools/host_packages_scripts/almalinux_docs.sh b/documentation/tools/host_packages_scripts/almalinux_docs.sh
index 9202afc5b..e12198db3 100644
--- a/documentation/tools/host_packages_scripts/almalinux_docs.sh
+++ b/documentation/tools/host_packages_scripts/almalinux_docs.sh
@@ -1 +1 @@
-sudo dnf install -y git glibc-locale-source librsvg2-tools make python3-pip which
+sudo dnf install -y curl git jq glibc-locale-source librsvg2-tools make python3-pip which
diff --git a/documentation/tools/host_packages_scripts/fedora_docs.sh b/documentation/tools/host_packages_scripts/fedora_docs.sh
index 8188d529a..f07139d04 100644
--- a/documentation/tools/host_packages_scripts/fedora_docs.sh
+++ b/documentation/tools/host_packages_scripts/fedora_docs.sh
@@ -1 +1 @@
-sudo dnf install git glibc-locale-source librsvg2-tools make python3-pip which
+sudo dnf install curl git jq glibc-locale-source librsvg2-tools make python3-pip which
diff --git a/documentation/tools/host_packages_scripts/opensuse_docs.sh b/documentation/tools/host_packages_scripts/opensuse_docs.sh
index 7d36eb0f9..9d56fc2b8 100644
--- a/documentation/tools/host_packages_scripts/opensuse_docs.sh
+++ b/documentation/tools/host_packages_scripts/opensuse_docs.sh
@@ -1 +1 @@
-sudo zypper install git glibc-i18ndata make python3-pip rsvg-convert which
+sudo zypper install curl git jq glibc-i18ndata make python3-pip rsvg-convert which
diff --git a/documentation/tools/host_packages_scripts/ubuntu_docs.sh b/documentation/tools/host_packages_scripts/ubuntu_docs.sh
index c322b61e4..1ddd24347 100644
--- a/documentation/tools/host_packages_scripts/ubuntu_docs.sh
+++ b/documentation/tools/host_packages_scripts/ubuntu_docs.sh
@@ -1 +1 @@
-sudo apt install git librsvg2-bin locales make python3-saneyaml python3-sphinx-rtd-theme python3-sphinx-copybutton sphinx
+sudo apt install curl git jq librsvg2-bin locales make python3-saneyaml python3-sphinx-rtd-theme python3-sphinx-copybutton sphinx

-- 
2.52.0


