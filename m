Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1F8DE7716D
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 12:23:53 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.12923.1733315023147690556
 for <docs@lists.yoctoproject.org>;
 Wed, 04 Dec 2024 04:23:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IczLB+1j;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9C0E41BF20C;
	Wed,  4 Dec 2024 12:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733315021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FnsZUcTzkSpeM0pTsbu4Iv2d9N7ma4JiWP0eB50UES0=;
	b=IczLB+1jfSX7P2mTxVv4U8Qd0rBhUarkI14yOxjQQSce/LLS2TJp0tfXNXJAz8AXze8R7x
	UIZxnqIP55alwav/aqd46w8cwQQ65xGdS1fR80WUfbEw5Hyn7/f0hh3Q9SShuAEol4ncJy
	FXYHfSe3dmUQNPaSxIr8j7fVVxXLWu8CRy8AdpmfKVea4jYio4k6CQymwdzxVAMnUHSCsB
	QlvqPoe1qxexpo4aa/HoEKod6RiF+PaGZ6qRIXbPj31JBaooJtOyAMOLiLMilAKkgDhK15
	slg46JCcM70coOvmWzK7jl+fnuucSvOiya0Dqu7pvLDBhilqU3dn/F0BmGFjrg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 04 Dec 2024 13:23:13 +0100
Subject: [yocto-docs PATCH v2 5/6] system-requirements.rst: add
 dependencies for pdf builds
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-update-doc-deps-v2-5-1d9b4063476f@bootlin.com>
References: <20241204-update-doc-deps-v2-0-1d9b4063476f@bootlin.com>
In-Reply-To: <20241204-update-doc-deps-v2-0-1d9b4063476f@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5343;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=wHQAlY2GksZ4WU7l3HrhXfnG90C8RGnaTLOlLz402CY=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnUEnLJ/MkQz+0UFIdxrZ1gmOb2aWwYhuuTWIjZ
 l0Ydkyg9vKJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ1BJywAKCRDRgEFAKaOo
 Nk5EEACkk1acB/PHhXOHb0qexiNc1ZfLM6qb0gDICoYNRlRbLBKtUVynsvbhpgDbVHjqlO2ZRg3
 IFmtkjo4z5XUAEoEDcgEwELp/HIxOAdxN2DRlmqGIe45KAg2YW1Ck5y9buyaMt5+YvJEWtZmYy5
 l9ACQ1UJyeUcU5mvT1HgIbtUAB2PZTBV1Hadj10XBY6b4PFer6wHt+GctruUlvXyCJf6Jsq06b+
 VdomX8/mrfz2DVYLTZKqj5n0fDz907s7wrfPljbleokI5/LG6p/K11LyK1Fi5FQNps6eroHUFLc
 3YUofRObEHGYgso85C66gnYmbkpKxU/Aujg6nM4FrkMKhXvXHWvnsnXuLfns4nxmHsnwdlkDFh+
 vGX5RqcDa2GC6VkVOqp0Eq89LmBIyTKRkp4cVHUp1eqPFawUmAydPyUFH5fF+91OSKbJrRCnu3C
 zclvHHAfQGRcSgZX7MEyGdfnVi5IKk8mIeRraHu0ZqYrqditk5u1BcDCcwLkb2K0ETQIu+SNRK6
 pFGNilGaIuFesk8nWY5mm+aO7/fl/NXm3ErTeWQ/GPv5iZjIGfAyLs9zMeqcW+1V/lbxkaxHJUE
 8Mnz4rMOf/284oRaYYYo85zpGYdZj70z8YBBC7TACaX7ZB6OH/YgtREzSPjgrZeRJckBJKHteoN
 IhvGKGH4a0EkQBw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 04 Dec 2024 12:23:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5886

With the recent changes from commit
bd6265ca323fac547a197bb516dc4a9ef3897508 ("doc: Makefile: add support
for xelatex"), the list of dependencies needs to be updated.

The initial list of dependencies was made for Ubuntu/Debian, and the
packages were translated for the other distros using pkgs.org.

Add them separately from the rest of the dependencies as they pull a
_lot_ of additional dependencies (for LaTeX).

Notes:
- Fedora/OpenSUSE do not have the "lang-all" texlive collection, so
  install all available languages.
- AlmaLinux does not seem to provide texlive-collection-fontsextra,
  texlive-collection-lang*, and texlive-collection-latexextra, so add a
  warning about that.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/poky.yaml.in                       | 47 +++++++++++++++++++++++-
 documentation/ref-manual/system-requirements.rst | 27 ++++++++++++++
 2 files changed, 73 insertions(+), 1 deletion(-)

diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
index 94849acf9942c7ebddb2ac7f8aaf5eb9d87e0c5b..25385068679a51e0f2e9e516b02b62e19e126291 100644
--- a/documentation/poky.yaml.in
+++ b/documentation/poky.yaml.in
@@ -67,8 +67,17 @@ UBUNTU_DEBIAN_HOST_PACKAGES_DOC: >-
   python3-saneyaml
   python3-sphinx-rtd-theme
   sphinx
-  texlive-latex-extra
 
+UBUNTU_DEBIAN_HOST_PACKAGES_DOC_PDF: >-
+  fonts-freefont-otf
+  latexmk
+  tex-gyre
+  texlive-fonts-extra
+  texlive-fonts-recommended
+  texlive-lang-all
+  texlive-latex-extra
+  texlive-latex-recommended
+  texlive-xetex
 
 FEDORA_HOST_PACKAGES_ESSENTIAL: >-
   bzip2
@@ -129,6 +138,19 @@ FEDORA_HOST_PACKAGES_DOC: >-
   texlive-latex-extra
   which
 
+FEDORA_HOST_PACKAGES_DOC_PDF: >-
+  latexmk
+  texlive-collection-fontsextra
+  texlive-collection-fontsrecommended
+  texlive-collection-lang*
+  texlive-collection-latex
+  texlive-collection-latexextra
+  texlive-collection-latexrecommended
+  texlive-collection-xetex
+  texlive-gnu-freefont
+  texlive-tex-gyre
+  texlive-xetex
+
 OPENSUSE_HOST_PACKAGES_ESSENTIAL: >-
   bzip2
   chrpath
@@ -169,6 +191,19 @@ OPENSUSE_HOST_PACKAGES_DOC: >-
   texlive-fncychap
   which
 
+OPENSUSE_HOST_PACKAGES_DOC_PDF: >-
+  texlive-collection-fontsextra
+  texlive-collection-fontsrecommended
+  texlive-collection-lang*
+  texlive-collection-latex
+  texlive-collection-latexextra
+  texlive-collection-latexrecommended
+  texlive-collection-xetex
+  texlive-gnu-freefont
+  texlive-latexmk
+  texlive-tex-gyre
+  texlive-xetex
+
 ALMALINUX_HOST_PACKAGES_ESSENTIAL: >-
   bzip2
   ccache
@@ -214,3 +249,13 @@ ALMALINUX_HOST_PACKAGES_DOC: >-
   python3-pip
   texlive-fncychap
   which
+
+ALMALINUX_HOST_PACKAGES_DOC_PDF: >-
+  latexmk
+  texlive-collection-fontsrecommended
+  texlive-collection-latex
+  texlive-collection-latexrecommended
+  texlive-collection-xetex
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
2.46.1


