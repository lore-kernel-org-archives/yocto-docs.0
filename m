Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58019D41C14
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 09:06:41 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5346.1765443987243346037
 for <docs@lists.yoctoproject.org>;
 Thu, 11 Dec 2025 01:06:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=QIdt5/q2;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D4B954E41B7D
	for <docs@lists.yoctoproject.org>; Thu, 11 Dec 2025 09:06:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AB0CB6068C
	for <docs@lists.yoctoproject.org>; Thu, 11 Dec 2025 09:06:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 028DE103C8E16;
	Thu, 11 Dec 2025 10:06:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765443984; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yn4T8g6qt3/SAYp4DuKnGnT7WMO4eissUgIskLUlEIM=;
	b=QIdt5/q2p2UcZ6O27MaNj7vPi33/Aq1Bi41zHzbAs46pNON9jCwGVboCShgp5w/1O9c7lG
	TcaS2+dPWx0BaoNYTRq20VcDqfJ9drNR6dk7SAmOiZxEr9Czu61mAABcNk3QM2XWB0qxkI
	e7OHZTjQo51k9lTnqMw4RyfF78+Vrp+kYaGFhrWCCQKgfAaJUiiCs0AOe/CvZqDNHSpJsH
	quxg+uvlq2VYyKkVypn5b3kH7QeqXE8naU1XtMwMqQFd/LiFe7hrqTfuFIoE/awsT4t/qv
	XqcWDOWaxceGWj5Ux01wgrVpQRFxA5muacyRuvhaRmj8mYeCNc1LEyHp0Nhy5A==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 11 Dec 2025 10:06:18 +0100
Subject: [PATCH v2 5/5] ref-manual/system-requirements.rst: add RockyLinux
 install instructions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-build-docs-container-tlmgr-v2-5-58719c103a50@bootlin.com>
References: <20251211-build-docs-container-tlmgr-v2-0-58719c103a50@bootlin.com>
In-Reply-To: <20251211-build-docs-container-tlmgr-v2-0-58719c103a50@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5142;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=kihFm8A5UtcxZiPCcDKBsUEukXv+toHphtztEfpGEE4=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpOomMYHfscIbop1UmzOAleFDe/fSHOI7+Fk5QL
 llZ6ZipQAuJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaTqJjAAKCRDRgEFAKaOo
 NsjzD/9/L4oAWFaQxwJcqRFdORi3/fGqwd3fyQVm8ex5+VU6Ipgh5OH7fNyqxlp7J0HWdiAdX7/
 L4ppZeoIea7jF5jsvvCQ3Of3b0reuEdmvCy4RmW8kkvoBco6gibhOQOGnUfzJUpc+Em3EiQTh/q
 W4DrqYBFm3KK4oDCG3fuqhCJw5fZ4OdVtOo7TuomIV/EHybIMvAleF+fArp5s1Ws1Au2BWfNVpg
 Az2Bc0rKA/ZyTbn0UIeTSNgXO87NV+zz8tw/zV3Wy5lzBTuKfFB3ruCr1+jvq+olIPecw8MjRLt
 uGDknIrZBVGk45gK+8WNHC4weyijV3bWVdWRROe9anRq9GkSvOLko+dZoi4ivj9D4eivL8rEJee
 HaCTffPJNrr4SNIBRgWHDChdtX3pxMB/nphORNbeOcGMIER3YsWBH/0m7RggicSVGPynVhItTK8
 5mHp1lZ+s8Gxy9AhoIjPJv78UfMzDOKyUs3+t4KVkgNpoTPkBKGnj8RqNctdbF2wVb9fnJ0R2Ug
 G008YZnyx5BnhodpSjBMpc6oTW7hJzgGFk6pta3eFwG2WZVHSeIPomwW1oYuQGvBVEc0xF9gdgd
 Fh4cl2DEPsXVTOk7Iu4XNaz1IwgknoYl3MathteVwDyuDd+9HkCGKGO44MtIGLBVo/DEDmWAUy2
 OJUV6HGkixDmYPg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 11 Dec 2025 09:06:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8247

Add instructions on how to install host packages on Rocky Linux. It is
very similar to AlmaLinux so installation scripts were based on it.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/system-requirements.rst   | 48 ++++++++++++++++++++++
 documentation/tools/build-docs-container           | 10 +++++
 .../tools/containerfiles/Containerfile.rocky       |  1 +
 .../tools/host_packages_scripts/rockylinux_docs.sh |  1 +
 .../host_packages_scripts/rockylinux_essential.sh  |  5 +++
 5 files changed, 65 insertions(+)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 4063253f7..66d920698 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -302,6 +302,54 @@ the `TeX Live package manager <https://tug.org/texlive/tlmgr.html>`__:
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
+.. warning::
+
+   The Tex Live installation above is only valid for `x86_64` hosts.
+
+Before building the documentation PDF, setup the ``PATH`` to use the installed
+packages:
+
 .. code-block:: console
 
    $ export PATH="${PATH}:${textooldir}/tl/bin/x86_64-linux"
diff --git a/documentation/tools/build-docs-container b/documentation/tools/build-docs-container
index 9d1bfdcdf..dda4a6170 100755
--- a/documentation/tools/build-docs-container
+++ b/documentation/tools/build-docs-container
@@ -44,6 +44,8 @@ $0 OCI_IMAGE [make arguments...]
      - fedora:42
      - leap:15.5
      - leap:15.6
+     - rockylinux:8
+     - rockylinux:9
      - ubuntu:22.04
      - ubuntu:24.04
      - ubuntu:25.04
@@ -130,6 +132,14 @@ main ()
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
     "ubuntu:22.04"*|\
     "ubuntu:24.04"*|\
     "ubuntu:25.04"*|\
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
index 000000000..dfb201fe2
--- /dev/null
+++ b/documentation/tools/host_packages_scripts/rockylinux_docs.sh
@@ -0,0 +1 @@
+sudo dnf install git glibc-locale-source librsvg2-tools make python3-pip which wget
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


