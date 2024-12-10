Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38754E77182
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 10:00:38 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.6758.1733824830546737769
 for <docs@lists.yoctoproject.org>;
 Tue, 10 Dec 2024 02:00:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=oieeNWOg;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0A6224000A;
	Tue, 10 Dec 2024 10:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733824829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hw4EyzCgMOrYYWUVytELGEOmOkTe1G6tvPiMWLA55aM=;
	b=oieeNWOgsdPR1qdLX/Nj0P9SOrimbq57cDFCawoSRcR5Iyl9X6ESvGLRt3VbdTFwYwbXy4
	pFKlXXhAT7HsB5A+54LI2KwQPCY+DzTFogkdDIFWq1RmL4demcCcGCXwTimAyo8HUvgdbD
	9+NZh1mJXNPmz969irb3g9aADKDrNh+mjRKc3BPHfPwbq7IwxKq98fDo1LibBUxaNc+wSU
	WTf4I20p+1jm+YhCZDpqAZkcYfY2SvzXfbIdEUPut9fSJfokMQiTTloD4iqqcZu9jr6RBg
	CgbzQbLUonJw9XsiOgrcWCKXb1frC5JZJYHwbW9Bb0C4sseQ6ZXOPUu9Xc6ExQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 10 Dec 2024 11:00:24 +0100
Subject: [yocto-docs PATCH v3 6/6] system-requirements.rst: add
 dependencies for pdf builds
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-update-doc-deps-v3-6-534699936ddc@bootlin.com>
References: <20241210-update-doc-deps-v3-0-534699936ddc@bootlin.com>
In-Reply-To: <20241210-update-doc-deps-v3-0-534699936ddc@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5583;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=zp/SeuFaLkeDZeavNtuQj/nALqeQSyhJnAlH3i4Q+zg=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnWBE6bZlrhDs8xf4z3xS5UW+SOGt9wAbzsczKV
 QEJdKXON2SJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ1gROgAKCRDRgEFAKaOo
 NhZfD/0TlJ6ASwU9ksPt9o9xkjKUP4fa6ge+saLvJbrGmmiAYaO9VGnj8vewYROgDevCFZsSheA
 CXJXOqMR263+S9tXquDU4iGgIlW7+3RY4mbpD4cFCqG9uVkimLKu9MP3HVCEj0vnUtwMMxl14bx
 oDG7DoOrk7IaktPvFeydjeUQjYoC9dIOa+By1tU93WvjZM8IAJjxxeow4/6a0c4aArwqbV0ZvAO
 84Hm8GXiVO+5SlMuiGLrBKytHPze2iGgGi4T+3+2Z/9jVehlVtKHXTS44noElX+MkuDLupuZ3gN
 lV0zrAhwbrRN8U5VkP0GP+XdTrGZ10D2JcKz/rhKujQe4tPgXX3ZVPXkMPgb48O3wrXBL7dpdmb
 JYfI84PXFWogtjWyLk8DkVrEwbb1EFOpY8M+BJ4csho12WXGb5sSl1xtDu/kqnVAFQVGcuvXEvc
 nlkujlk57WYcMx4/X34b6uCQ72T+jN7g6buK0jeUjrplAIlrE3P2J9NjnB2xva9nOeXqS5yzSkO
 7i23bui63v1D8uPWUe531utauxd0YFLU7xOw86HgK96pzm7MzSMxTG9YIbUoC3EEXjkdMWLBGW5
 XESwm0ahpzGM3c3ptCS38U7Zy/hZ06k485xDCSEGEte/gIiSOkf3s4tHBuHFZsEX4uyneElrwkf
 nq/UvYvFZFJURlw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 10 Dec 2024 10:00:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5916

With the recent changes from commit
bd6265ca323fac547a197bb516dc4a9ef3897508 ("doc: Makefile: add support
for xelatex"), the list of dependencies needs to be updated.

The initial list of dependencies was made for Ubuntu/Debian, and the
packages were translated for the other distros using pkgs.org.

Add them separately from the rest of the dependencies as they pull a
_lot_ of additional dependencies (for LaTeX).

Move the texlive-fncychap documentation dependency to the PDF specific
dependency.

Notes:
- Fedora/OpenSUSE do not have the "lang-all" texlive collection, so
  install all available languages.
- AlmaLinux does not seem to provide texlive-collection-fontsextra,
  texlive-collection-lang*, and texlive-collection-latexextra, so add a
  warning about that.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/poky.yaml.in                       | 52 ++++++++++++++++++++++--
 documentation/ref-manual/system-requirements.rst | 27 ++++++++++++
 2 files changed, 76 insertions(+), 3 deletions(-)

diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
index eedefcdea88694061fa2a3536bc86f78ed4a28d0..0933cbbd351985899ecaea94ae42748bd7ba1753 100644
--- a/documentation/poky.yaml.in
+++ b/documentation/poky.yaml.in
@@ -68,7 +68,17 @@ UBUNTU_DEBIAN_HOST_PACKAGES_DOC: >-
   python3-saneyaml
   python3-sphinx-rtd-theme
   sphinx
+
+UBUNTU_DEBIAN_HOST_PACKAGES_DOC_PDF: >-
+  fonts-freefont-otf
+  latexmk
+  tex-gyre
+  texlive-fonts-extra
+  texlive-fonts-recommended
+  texlive-lang-all
   texlive-latex-extra
+  texlive-latex-recommended
+  texlive-xetex
 
 FEDORA_HOST_PACKAGES_ESSENTIAL: >-
   bzip2
@@ -123,9 +133,22 @@ FEDORA_HOST_PACKAGES_DOC: >-
   librsvg2-tools
   make
   python3-pip
-  texlive-fncychap
   which
 
+FEDORA_HOST_PACKAGES_DOC_PDF: >-
+  'texlive-collection-lang*'
+  latexmk
+  texlive-collection-fontsextra
+  texlive-collection-fontsrecommended
+  texlive-collection-latex
+  texlive-collection-latexextra
+  texlive-collection-latexrecommended
+  texlive-collection-xetex
+  texlive-fncychap
+  texlive-gnu-freefont
+  texlive-tex-gyre
+  texlive-xetex
+
 OPENSUSE_HOST_PACKAGES_ESSENTIAL: >-
   bzip2
   chrpath
@@ -164,9 +187,22 @@ OPENSUSE_HOST_PACKAGES_DOC: >-
   make
   python3-pip
   rsvg-convert
-  texlive-fncychap
   which
 
+OPENSUSE_HOST_PACKAGES_DOC_PDF: >-
+  'texlive-collection-lang*'
+  texlive-collection-fontsextra
+  texlive-collection-fontsrecommended
+  texlive-collection-latex
+  texlive-collection-latexextra
+  texlive-collection-latexrecommended
+  texlive-collection-xetex
+  texlive-fncychap
+  texlive-gnu-freefont
+  texlive-latexmk
+  texlive-tex-gyre
+  texlive-xetex
+
 ALMALINUX_HOST_PACKAGES_ESSENTIAL: >-
   bzip2
   ccache
@@ -211,5 +247,15 @@ ALMALINUX_HOST_PACKAGES_DOC: >-
   librsvg2-tools
   make
   python3-pip
-  texlive-fncychap
   which
+
+ALMALINUX_HOST_PACKAGES_DOC_PDF: >-
+  latexmk
+  texlive-collection-fontsrecommended
+  texlive-collection-latex
+  texlive-collection-latexrecommended
+  texlive-collection-xetex
+  texlive-fncychap
+  texlive-gnu-freefont
+  texlive-tex-gyre
+  texlive-xetex
diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 7c7f518d9fe1f68e5b014cf31e59dc9bbe322e4c..b087d374d23a71104dc9c050e96e4a2c20f5abb0 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -193,6 +193,11 @@ Here are the packages needed to build Project documentation manuals::
 
    $ sudo apt install &UBUNTU_DEBIAN_HOST_PACKAGES_DOC;
 
+In addition to the previous packages, here are the packages needed to build the
+documentation in PDF format::
+
+   $ sudo apt install &UBUNTU_DEBIAN_HOST_PACKAGES_DOC_PDF;
+
 Fedora Packages
 ---------------
 
@@ -206,6 +211,11 @@ Here are the packages needed to build Project documentation manuals::
    $ sudo dnf install &FEDORA_HOST_PACKAGES_DOC;
    $ sudo pip3 install &PIP3_HOST_PACKAGES_DOC;
 
+In addition to the previous packages, here are the packages needed to build the
+documentation in PDF format::
+
+   $ sudo dnf install &FEDORA_HOST_PACKAGES_DOC_PDF;
+
 openSUSE Packages
 -----------------
 
@@ -220,6 +230,11 @@ Here are the packages needed to build Project documentation manuals::
    $ sudo zypper install &OPENSUSE_HOST_PACKAGES_DOC;
    $ sudo pip3 install &PIP3_HOST_PACKAGES_DOC;
 
+In addition to the previous packages, here are the packages needed to build the
+documentation in PDF format::
+
+   $ sudo zypper install &OPENSUSE_HOST_PACKAGES_DOC_PDF;
+
 
 AlmaLinux Packages
 ------------------
@@ -251,6 +266,18 @@ Here are the packages needed to build Project documentation manuals::
    $ sudo dnf install &ALMALINUX_HOST_PACKAGES_DOC;
    $ sudo pip3 install &PIP3_HOST_PACKAGES_DOC;
 
+In addition to the previous packages, here are the packages needed to build the
+documentation in PDF format::
+
+   $ sudo dnf install &ALMALINUX_HOST_PACKAGES_DOC_PDF;
+
+.. warning::
+
+   Unlike Fedora or OpenSUSE, AlmaLinux does not provide the packages
+   ``texlive-collection-fontsextra``, ``texlive-collection-lang*`` and
+   ``texlive-collection-latexextra``, so you may run into issues. These may be
+   installed using `tlmgr <https://tug.org/texlive/tlmgr.html>`_.
+
 .. _system-requirements-buildtools:
 
 Required Git, tar, Python, make and gcc Versions

-- 
2.47.1


