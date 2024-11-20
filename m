Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C85AD711B1
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 15:11:05 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.15737.1732115456820801770
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Nov 2024 07:10:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NGB1Hw9C;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 73AE5240008;
	Wed, 20 Nov 2024 15:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732115455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OFgUS/Azhnckjx187M0Zzo54KYiB9XbWB64DfhKFxr8=;
	b=NGB1Hw9CbUccAoGVPckzKYG3/M+xpzgKHAZJIFnpRXx7HZmWDuz92XtYEqjQRC2CR3VtI4
	yGyZ2OATn0QkW3u/OzPezDV25QwcSBQ99bDikc6q3N/jMnjZcAWZRP+g157fkTsSUjnh2m
	G/f0ld37Spp7WVEx9W7hK8ZZmndozZdOIgGm8YF1QkoPxzFBzdXBbUCEwX2gukErPd6dUv
	dS5wFGFIqJesN3TiOmIL6YUY7loQ7cVWblHJsZD5vynxfyPj3ToXdf+8igWpV8KQXPaQDL
	h2t/Dbt+Tr1qWNM1dcVkzUCSaSJQ3AnD3507Dgid1sfaYy+QZTwf0MlFNgQiXA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 20 Nov 2024 16:10:37 +0100
Subject: [yocto-docs PATCH 4/5] system-requirements.rst: add dependencies
 for pdf builds
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241120-update-doc-deps-v1-4-50e267ae4123@bootlin.com>
References: <20241120-update-doc-deps-v1-0-50e267ae4123@bootlin.com>
In-Reply-To: <20241120-update-doc-deps-v1-0-50e267ae4123@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6461;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=aHYTpMFKFCC+sC7eE8WJs+aUwc2wWK1SF6UQ5vEqT8o=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnPfv+O8XwaFIhS3RND2ikPgMT4jaYNzDAtPbsx
 opwoRLuTqSJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZz37/gAKCRDRgEFAKaOo
 NghPEACJyMHeEgV0tE6zcGjXKaxhVjiwr4E+6/Z7FXJ1oNYC1+Zg2v7oWZz6HfyM5eN6jwPjh/A
 pPii0xinxxV2cahCqsh+3f1H6JIElhxhyZx1Rj4UOFpZpoMRBzHmfmtKW+W+gYAYYZTvkUHN6oc
 2/bDSbpikvPJQjx66b0R/jOWbn8vhS369Pg6F46vcJW78+9PfU4OcLtzfuPIE/4Yr7YdTlxmGFt
 /vKLaz+F6e4EM1poaZD9NMrfYWS5Q8V8aDyHdwsRH5VPViFv0Uye7/fPk7vzee2RuG4vcy7KwdP
 jZebYq8rXCRipTLqU+bJN8pR7A1X46RMI4FOI+NmR1oozX80kipd4yNylSAb6MIqV97hv046dsY
 Q8f56G7RBYYO+jg4bnUCCobsE5M9QoLsIAp6uo2NA37lyFQNQVwaQUwpwagxP6QR07zT90ueNAh
 SfgP4GTw2JdwgRFGrUScBtnpdUW0Ru78wQL8EcdNYX/41isF75sxx2Xj1Ws/0XtFjNh9zObqkvW
 EaSRK6YdwQga3ASsFLQiI4vehSN8mW08hhfRF0qJwYb++1MtVc+XO28DhQHFiZ9WtTNtJXBopny
 dPquotJppBR0eW1PfccpVeXy86css3pl43a/3/+R0W2Puqsbeh6nMuvh/iBZBTZIn6mWd7Aik+z
 LR5tHRxNz7y60Dg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Nov 2024 15:11:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5778

With the recent changes from commit
bd6265ca323fac547a197bb516dc4a9ef3897508 ("doc: Makefile: add support
for xelatex"), the list of dependencies needs to be updated.

The initial list of dependencies was made for Ubuntu/Debian, and the
packages were translated for the other distros using pkgs.org.

Add them separately from the rest of the dependencies as they pull a
_lot_ of additional dependencies (for latex).

Notes:
- Fedora/OpenSUSE do not have the "lang-all" texlive collection, so
  install all available languages.
- AlmaLinux does not seem to provide texlive-collection-fontsextra,
  texlive-collection-lang*, and texlive-collection-latexextra, so add a
  warning about that.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/poky.yaml.in                       | 79 +++++++++++++++++++++++-
 documentation/ref-manual/system-requirements.rst | 27 ++++++++
 2 files changed, 105 insertions(+), 1 deletion(-)

diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
index d0c8973db27340838f78f560c01d44fb67771b25..d95b73c74ad7979609c6e7f4e1be5343968da743 100644
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
@@ -131,6 +140,35 @@ FEDORA_HOST_PACKAGES_DOC: >-
   which
   texlive-fncychap
 
+FEDORA_HOST_PACKAGES_DOC_PDF: >-
+  latexmk
+  texlive-collection-fontsextra
+  texlive-collection-fontsrecommended
+  texlive-collection-langarabic
+  texlive-collection-langchinese
+  texlive-collection-langcjk
+  texlive-collection-langcyrillic
+  texlive-collection-langczechslovak
+  texlive-collection-langenglish
+  texlive-collection-langeuropean
+  texlive-collection-langfrench
+  texlive-collection-langgerman
+  texlive-collection-langgreek
+  texlive-collection-langitalian
+  texlive-collection-langjapanese
+  texlive-collection-langkorean
+  texlive-collection-langother
+  texlive-collection-langpolish
+  texlive-collection-langportuguese
+  texlive-collection-langspanish
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
@@ -171,6 +209,35 @@ OPENSUSE_HOST_PACKAGES_DOC: >-
   texlive-fncychap
   which
 
+OPENSUSE_HOST_PACKAGES_DOC_PDF: >-
+  texlive-collection-fontsextra
+  texlive-collection-fontsrecommended
+  texlive-collection-langarabic
+  texlive-collection-langchinese
+  texlive-collection-langcjk
+  texlive-collection-langcyrillic
+  texlive-collection-langczechslovak
+  texlive-collection-langenglish
+  texlive-collection-langeuropean
+  texlive-collection-langfrench
+  texlive-collection-langgerman
+  texlive-collection-langgreek
+  texlive-collection-langitalian
+  texlive-collection-langjapanese
+  texlive-collection-langkorean
+  texlive-collection-langother
+  texlive-collection-langpolish
+  texlive-collection-langportuguese
+  texlive-collection-langspanish
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
@@ -224,3 +291,13 @@ ALMALINUX_HOST_PACKAGES_DOC: >-
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
index 50c153ad7cc68a3ad175d6aad7f4527d9e4d219b..aa1f1958da580516b7f38fa1a325d1f03364ee66 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -184,6 +184,11 @@ Here are the packages needed to build Project documentation manuals::
 
    $ sudo apt install &UBUNTU_DEBIAN_HOST_PACKAGES_DOC;
 
+In addition to the previous packages, here are the packages needed to build the
+documentation in PDF format::
+
+   $ sudo apt install &UBUNTU_DEBIAN_HOST_PACKAGES_DOC_PDF;
+
 Fedora Packages
 ---------------
 
@@ -197,6 +202,11 @@ Here are the packages needed to build Project documentation manuals::
    $ sudo dnf install &FEDORA_HOST_PACKAGES_DOC;
    $ sudo pip3 install &PIP3_HOST_PACKAGES_DOC;
 
+In addition to the previous packages, here are the packages needed to build the
+documentation in PDF format::
+
+   $ sudo dnf install &FEDORA_HOST_PACKAGES_DOC_PDF;
+
 openSUSE Packages
 -----------------
 
@@ -211,6 +221,11 @@ Here are the packages needed to build Project documentation manuals::
    $ sudo zypper install &OPENSUSE_HOST_PACKAGES_DOC;
    $ sudo pip3 install &PIP3_HOST_PACKAGES_DOC;
 
+In addition to the previous packages, here are the packages needed to build the
+documentation in PDF format::
+
+   $ sudo zypper install &OPENSUSE_HOST_PACKAGES_DOC_PDF;
+
 
 AlmaLinux Packages
 ------------------
@@ -238,6 +253,18 @@ Here are the packages needed to build Project documentation manuals::
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


