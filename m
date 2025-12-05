Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84A03D32D96
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 14:51:42 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7466.1764946300938461017
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Dec 2025 06:51:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=XO0I3S89;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 02D42C19648
	for <docs@lists.yoctoproject.org>; Fri,  5 Dec 2025 14:51:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7075E606AC
	for <docs@lists.yoctoproject.org>; Fri,  5 Dec 2025 14:51:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 837C9102F0A9B;
	Fri,  5 Dec 2025 15:51:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764946298; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gxzTiKlJgAzypIpV90gVytsIFQedBKGk2uUo0uwVd8E=;
	b=XO0I3S89XUG49VU3XW4FBL4/wqvflpzokzpYZGfUCfSSMh6jQl/V96/o9gbA8tKJLETj3q
	sOs46rjPpG4PCuZz+WOAzqz7OzpsprqEIa8IBiVWlwqzWU/SrXm5WwdxchfnSI/p8Z6Yn7
	y0w78EZzqUhFs5mEpEhTo+ilVsCYy0GowXGSjyjLvMrJtX/RINq5lwreAZq9ZyaXA2jgSY
	8wt2NHozehjZNxN11sUrwPDnOQSzQOM1n30nNCWGUzBn7zfZWfWlNyUeWH+yx4/8n/KpLT
	dX0AfqtOZB0YoLefmp6bk6P86CVrGL37yUiNjU8m78udxWH5ztTflmps9Ybedw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 05 Dec 2025 15:51:28 +0100
Subject: [PATCH 5/5] ref-manual/system-requirements.rst: add RockyLinux
 install instructions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-build-docs-container-tlmgr-v1-5-de30623e664d@bootlin.com>
References: <20251205-build-docs-container-tlmgr-v1-0-de30623e664d@bootlin.com>
In-Reply-To: <20251205-build-docs-container-tlmgr-v1-0-de30623e664d@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5101;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=LwHt7nhP6b1B3D43H8QuAff5euInx0wS/jkGdg+yjSw=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpMvF1QrLRVBfiTr3/tpzYaBhjz6z+NdfS8skg6
 ZLYCuJpApKJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaTLxdQAKCRDRgEFAKaOo
 NvbcD/9T2GKpXCYbbbrAznoFDxn41Ks5ky2jmkDbjcXrOMG30cI9/LBTa85hc5oUOQjty/+XBE8
 4F3Efo3f/yiBUGiJXWoO9Yy6QyiOYZ2dFIbguax1KRCuLMe7p+M0xrcWcA87M6BwMrH3O5nGGj3
 uMuxUziAsM5ss44nApupEjsfz19s3zdbq1NcCRq/6OBELXP5WVF6FFaPuffRmSCkdRuwN9FHyqs
 AS9VIewpLNVOpdVoLPRMnb1kAsb4rAQT98TN5OWI9XqBwNVjtnKFKGu2Wm3jhwVT3IPxRc/dyFC
 +Sd3YFB6BX4avVAgM06mJlT4m/4rucfJug/No/fSW1KMdo+Wrl7u3qQ58d4xs+3otf4hd1ENYJK
 k8O3dtX0N0bzaw0TR/bKhfHIYwvAshPwji2VnaVWsWq74NWv2KUQVQ6xc5SZ89T2OJG7DipDH1/
 GUbNn8y6a2eTcDjbIMx0mCGPbxf6EBsKBB2aX+ydHOsJwMCleWgQ116FlmFs8YT5uwwPptzgpZd
 887pXoE6OXa1dVEm/4B5zL+hRiD4AvR8y4v9I/tBnKuriO3M9OHeNYIgEhdObMGPv2JG7n1KMMz
 c3hkqML6kIarMV75ZZj8ugAqaq0xV6K17WmWlyjlndiajLLuzuURvXnnnK4Y+TilZEF/tYh3p7I
 GOroeQlTWlNYjOQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Dec 2025 14:51:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8232

Add instructions on how to install host packages on Rocky Linux. It is
very similar to AlmaLinux so installation scripts were based on it.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/system-requirements.rst   | 44 ++++++++++++++++++++++
 documentation/tools/build-docs-container           | 10 +++++
 .../tools/containerfiles/Containerfile.rocky       |  1 +
 .../tools/host_packages_scripts/rockylinux_docs.sh |  1 +
 .../host_packages_scripts/rockylinux_essential.sh  |  5 +++
 5 files changed, 61 insertions(+)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index af102ce98..79513687d 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -294,6 +294,50 @@ the `TeX Live package manager <https://tug.org/texlive/tlmgr.html>`__:
 Before building the documentation PDF, setup the ``PATH`` to use the installed
 packages:
 
+.. code-block:: console
+
+   $ export PATH="${PATH}:${textooldir}/tl/bin/x86_64-linux"
+
+RockyLinux Packages
+-------------------
+
+Here are the packages needed to build an image on a headless system
+with a supported RockyLinux distribution:
+
+.. literalinclude:: ../tools/host_packages_scripts/rockylinux_essential.sh
+   :language: shell
+
+.. note::
+
+   -  Extra Packages for Enterprise Linux (i.e. ``epel-release``) is
+      a collection of packages from Fedora built on RHEL/CentOS for
+      easy installation of packages not included in enterprise Linux
+      by default. You need to install these packages separately.
+
+   -  The ``PowerTools/CRB`` repo provides additional packages such as
+      ``rpcgen`` and ``texinfo``.
+
+   -  The ``makecache`` command consumes additional Metadata from
+      ``epel-release``.
+
+Here are the packages needed to build Project documentation manuals:
+
+.. literalinclude:: ../tools/host_packages_scripts/rockylinux_docs.sh
+   :language: shell
+
+.. literalinclude:: ../tools/host_packages_scripts/pip3_docs.sh
+   :language: shell
+
+In addition to the previous packages, the following TeX Live packages
+are needed to build the documentation in PDF format and can be installed with
+the `TeX Live package manager <https://tug.org/texlive/tlmgr.html>`__:
+
+.. literalinclude:: ../tools/host_packages_scripts/tlmgr_docs_pdf.sh
+   :language: shell
+
+Before building the documentation PDF, setup the ``PATH`` to use the installed
+packages:
+
 .. code-block:: console
 
    $ export PATH="${PATH}:${textooldir}/tl/bin/x86_64-linux"
diff --git a/documentation/tools/build-docs-container b/documentation/tools/build-docs-container
index d61ba5d4c..d92d6ee50 100755
--- a/documentation/tools/build-docs-container
+++ b/documentation/tools/build-docs-container
@@ -43,6 +43,8 @@ $0 OCI_IMAGE [make arguments...]
      - fedora:42
      - leap:15.5
      - leap:15.6
+     - rockylinux:8
+     - rockylinux:9
      - tgagor/centos:stream9
      - ubuntu:22.04
      - ubuntu:24.04
@@ -122,6 +124,14 @@ main ()
       docs_pdf=opensuse_docs_pdf.sh
       pip3=pip3_docs.sh
       ;;
+    "rockylinux:8"*|\
+    "rockylinux:9"*)
+      containerfile=Containerfile.rocky
+      essential=rockylinux_essential.sh
+      docs=rockylinux_docs.sh
+      docs_pdf=tlmgr_docs_pdf.sh
+      pip3=pip3_docs.sh
+      ;;
     "tgagor/centos:stream9"*)
       containerfile=Containerfile.stream
       essential=centosstream_essential.sh
diff --git a/documentation/tools/containerfiles/Containerfile.rocky b/documentation/tools/containerfiles/Containerfile.rocky
new file mode 120000
index 000000000..5430d17dc
--- /dev/null
+++ b/documentation/tools/containerfiles/Containerfile.rocky
@@ -0,0 +1 @@
+Containerfile.stream
\ No newline at end of file
diff --git a/documentation/tools/host_packages_scripts/rockylinux_docs.sh b/documentation/tools/host_packages_scripts/rockylinux_docs.sh
new file mode 100644
index 000000000..8188d529a
--- /dev/null
+++ b/documentation/tools/host_packages_scripts/rockylinux_docs.sh
@@ -0,0 +1 @@
+sudo dnf install git glibc-locale-source librsvg2-tools make python3-pip which
diff --git a/documentation/tools/host_packages_scripts/rockylinux_essential.sh b/documentation/tools/host_packages_scripts/rockylinux_essential.sh
new file mode 100644
index 000000000..9564bb4fe
--- /dev/null
+++ b/documentation/tools/host_packages_scripts/rockylinux_essential.sh
@@ -0,0 +1,5 @@
+sudo dnf install -y epel-release
+sudo yum install -y dnf-plugins-core
+sudo dnf config-manager --set-enabled crb || sudo dnf config-manager --set-enabled powertools
+sudo dnf makecache
+sudo dnf install -y bzip2 ccache chrpath cpio cpp diffstat diffutils gawk gcc gcc-c++ git glibc-devel glibc-langpack-en gzip libacl make patch perl perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue python3 python3-GitPython python3-jinja2 python3-pexpect python3-pip rpcgen socat tar texinfo unzip wget which xz zstd

-- 
2.51.0


