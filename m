Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E09AD7496C
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 09:24:38 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13445.1766136273570484920
 for <docs@lists.yoctoproject.org>;
 Fri, 19 Dec 2025 01:24:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=o2/8j5lc;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 17FD31A22E8
	for <docs@lists.yoctoproject.org>; Fri, 19 Dec 2025 09:24:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DDE0F6071D;
	Fri, 19 Dec 2025 09:24:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BDD2A102F0BAC;
	Fri, 19 Dec 2025 10:24:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766136267; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=HDwMkK56CO8nEgtuXHyJKI0lH7rFCgIWhDwjww/6qFE=;
	b=o2/8j5lcoVAlykqtgqUkbw0s0Ij5aiFFc5DD4yysUZq5zV4uTRVxSmF24WBD5vjef5fvSt
	r/NJ+ad/cMLkIPU2DoB7oXjC3iJvrohT5JMS/Z2RJOLWZXDgZYIws1g5N09N5ONIQ8vb9Q
	XAaOuuUa5wrnallKrHC1VtDQNgHphsnzxDTwqI8PF8VjxXianMwyo7P51uSQht3n5FALlz
	35VnElT8APcJ70C1B0qVHlELFkV3JgaaSZXBcU8wm3XYM7VlN8ZudwAfc3YfThJ6Z34Bpy
	OhGqEc1+jYr1RW5xfadIUkn9Ze0j5oFwAisFH8RWj/bmH/3tnUbte+8Q7T+VNg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 19 Dec 2025 10:24:09 +0100
Subject: [PATCH v2] Add the sphinx-copybutton extension
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-sphinx-copybutton-v2-1-e6688f8d9167@bootlin.com>
X-B4-Tracking: v=1; b=H4sIALgZRWkC/22NwQ6CMBBEf4Xs2RpaIaAn/8NwoHUra7RL2kIgh
 H+3YLw5t5fMvFkgoCcMcMkW8DhSIHYJ1CED07XugYLuiUHlqpRKViL0HblJGO5nPcTIThQ5Knl
 K0UULadd7tDTtzlvz5TDoJ5q4ibZGRyGyn/fTUW69n7/+4x+lkKIqla5MYW1tz1fNHF/kjobf0
 Kzr+gGFuQwDxgAAAA==
X-Change-ID: 20251217-sphinx-copybutton-40e213333b4a
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3293;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=BgIEMzpUjkM2lS87KlmD5GiYo8JDbnrVDfd1QHXuixI=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpRRnKeOO0OOKnMKCCFkYijxfCa7L+NW4n6jA13
 bkP2fbbcOmJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUUZygAKCRDRgEFAKaOo
 NifEEACsKkOVOKV8fwHvCsj5LF/ndj/lD1Hcmg1lR095IE8QoC7lqbrAsuTO7/1GsyEniTCrEai
 zati9LJ8FRcHDFYEyJXG0Mh0PlNoXZO9SfQVOfbusBV/VVl7AH7/vWx6RUJm2q/FvqR7nsL++Zq
 hBfx17+laIN/GgQ9SQ7jgBXyrkFJzkijzUC3zGWtyf4NyosBelGNsMXUJ7awOTHGRIQE4oYhUg1
 4qd7lR59FY1zubF7CD0NWtjfH+YMd5zxIguqT9fZXegvTc8vYT/f7bciTFV2/nMtHXu32MI9p95
 0aTKS7M0XcEklJUuMEETFiksJrEPQf+/wRHjXPw+PWzA3XD6Qa97xGI0eVIPh1oGQGOn8Zw6jpM
 MVmzvCgX3ouVq75dtd8H9f01eZU1MU6Yw5HV8+cepqvANYmrCzFKzhu8sdB/y/eJBqsXYvCryFP
 8Nr2VHo9dKIVSiMo8fCSEPcap8ZjLmOz+QLtDNpk7+CCTBBBqTT99P+kuk2pEr/kVNwAxOXsjeU
 r5xWzTx6MQ9U9F1xOvLxhE1D0Ip5d23a+9R65OzS0fVUEsBJWJfZ+VAqic9h3vrB9FT5zkQ1l7i
 LPOWTEbtuEQDcQzrdTYPDHnK5xkXS2fSn2Ib05xSpCXkr6Edq8k//x5qKkvzLFNorDGqZg1mUe1
 7UiwRL74hXCMcew==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 19 Dec 2025 09:24:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8306

This extension adds a copy button to code-blocks.

It was added to the buildtools tarballs for documentation with
commit ebf14a6dc1a5 ("python3-sphinx-copybutton: add recipe") in
OE-Core, so the the Autobuilder can use it.

Add it as a requirement in the docs, including in Ubuntu requirements.
According to https://pkgs.org/download/python3-sphinx-copybutton this
packages is provided under "python3-sphinx-copybutton" on all the
versions of Ubuntu we support.

Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- Suggested by Quentin: set copybutton_prompt_text to "$ " in
  conf.py so dollar signs at line beginnings are not copied.
- Link to v1: https://patch.msgid.link/20251218-sphinx-copybutton-v1-1-752b7c4ff8f9@bootlin.com
---
 documentation/Pipfile                                    | 1 +
 documentation/conf.py                                    | 4 ++++
 documentation/tools/host_packages_scripts/pip3_docs.sh   | 2 +-
 documentation/tools/host_packages_scripts/ubuntu_docs.sh | 2 +-
 4 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/documentation/Pipfile b/documentation/Pipfile
index 7ee1d22905..1fa2df31e7 100644
--- a/documentation/Pipfile
+++ b/documentation/Pipfile
@@ -9,6 +9,7 @@ verify_ssl = true
 sphinx = "*"
 sphinx-rtd-theme = "*"
 pyyaml = "*"
+sphinx-copybutton = "*"
 
 [requires]
 python_version = "3"
diff --git a/documentation/conf.py b/documentation/conf.py
index c07b6c4199..3d04f90572 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -66,6 +66,7 @@ extensions = [
     'sphinx.ext.autosectionlabel',
     'sphinx.ext.extlinks',
     'sphinx.ext.intersphinx',
+    'sphinx_copybutton',
     'yocto-vars'
 ]
 autosectionlabel_prefix_document = True
@@ -123,6 +124,9 @@ intersphinx_mapping = {
 # Suppress "WARNING: unknown mimetype for ..."
 suppress_warnings = ['epub.unknown_project_files']
 
+# sphinx-copybutton configuration
+copybutton_prompt_text = "$ "
+
 # -- Options for HTML output -------------------------------------------------
 
 # The theme to use for HTML and HTML Help pages.  See the documentation for
diff --git a/documentation/tools/host_packages_scripts/pip3_docs.sh b/documentation/tools/host_packages_scripts/pip3_docs.sh
index fd6ad98053..907ecec55c 100644
--- a/documentation/tools/host_packages_scripts/pip3_docs.sh
+++ b/documentation/tools/host_packages_scripts/pip3_docs.sh
@@ -1 +1 @@
-sudo pip3 install sphinx sphinx_rtd_theme pyyaml
+sudo pip3 install sphinx sphinx_rtd_theme pyyaml sphinx-copybutton
diff --git a/documentation/tools/host_packages_scripts/ubuntu_docs.sh b/documentation/tools/host_packages_scripts/ubuntu_docs.sh
index 67bb810946..c322b61e42 100644
--- a/documentation/tools/host_packages_scripts/ubuntu_docs.sh
+++ b/documentation/tools/host_packages_scripts/ubuntu_docs.sh
@@ -1 +1 @@
-sudo apt install git librsvg2-bin locales make python3-saneyaml python3-sphinx-rtd-theme sphinx
+sudo apt install git librsvg2-bin locales make python3-saneyaml python3-sphinx-rtd-theme python3-sphinx-copybutton sphinx

---
base-commit: d84d916d4fc505e8386693306b6a90b0064c0518
change-id: 20251217-sphinx-copybutton-40e213333b4a


