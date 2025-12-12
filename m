Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0686D44166
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 10:22:43 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9804.1765534961832780693
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Dec 2025 02:22:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Q1Brw+no;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 90E4D1A212E
	for <docs@lists.yoctoproject.org>; Fri, 12 Dec 2025 10:22:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 66CCA606DF
	for <docs@lists.yoctoproject.org>; Fri, 12 Dec 2025 10:22:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D8476103C8E17;
	Fri, 12 Dec 2025 11:22:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765534959; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Yr0xlGXubUo9sThxl1e1j7S8UbRTMm4JsU+moPLBHZU=;
	b=Q1Brw+noiu7uDjPqsh2a4mg4KLUHQnoJYovScky7titoKBAq79s6StcHj9b4nhuRnu1r9w
	pkeq4npiLjEw46mholiRVj1s+qYDeaFNxolgk6Ejs3NMTi/1Z23bUiy6SiGbeZCshkgnZY
	r4e4d2fMV1pcwUO4Bwpt5W81aw/X922HlrH73YyL6inrnyELI7+EFmPe0a33uQaJI2HS80
	oC7ET0swa0OKlFIqtrPID/Yw3OtROYYpprfyQqSvcXXYcI/M04flc+RPfQ8DMSmH7DAi0o
	UFCKV8kgOM8ashoXJgKlz208eY1wTHq51xmQDKbmnFTd0+QBxSETLIrYh6/e9w==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 12 Dec 2025 11:22:27 +0100
Subject: [PATCH v3 5/5] ref-manual/system-requirements.rst: add RockyLinux
 install instructions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-build-docs-container-tlmgr-v3-5-a45c1ce6d8f7@bootlin.com>
References: <20251212-build-docs-container-tlmgr-v3-0-a45c1ce6d8f7@bootlin.com>
In-Reply-To: <20251212-build-docs-container-tlmgr-v3-0-a45c1ce6d8f7@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4742;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=IX9FOdcjM6rxCJNBB64CbynZE729S9yd//Cz4Bm0R/E=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpO+zqAU81hZvG+oHgle1DokhuzN+rJKpF4WwZt
 +aAbFbK4wuJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaTvs6gAKCRDRgEFAKaOo
 NhRSD/0VxobmcrGwtH3sKaHdNc0XgHZuNTYh1vkUPsPO2xZLtv/dA5NVoV5idgJaSUVDrbUy0Jh
 z6UBwTRKFhWniZOMftgtigJfjuZChxxI1Ec7Sl/zzZK43OGQdUMQyx2JMNOOdClo84iw3ETalsX
 JBZgVShT42CdYdkeKrIQVnWV7OGv5RnlsR/3OB+VLiOOL0DdYMeyZ7uhkn8tMHsNVKz/a6UlSq9
 6FnE2q1Ul++xo3Pe7nyG2oKEtCJJpqePQuS2NA2JmgZDNQwinRIyIlNqMc2zE/gXcLvuixi3H1s
 r1j/5uC62l7kK9mefhKYjpTdtN4UF0IHzaBUuHAHSYX0h4MOQQ8VwEK/8ZG2pD1mjiarc66Ye/3
 uCTCFFb1/tR/so8erpAiAyZIBLol9LDVGhx0idurZFtXMwupT4NB0lFfhSom/8EodB4r4qazSzT
 ykxvBEvYpv7HU232AqP2nzkKQpfrQmsXX6pRHPyJ3hOtIu2876Un9fl88xtLheF2IHfzl4bJo0J
 vjrVoQCJ+GB4XAmX6ykABId7rE64CrAoKogjydTdnd5mNny82dAyU8sVRW83kgLIYFvaft8jYFP
 E6uw9aHO3gEZ3ZgFD/O/hMc16zUMQWVpdqluD5+T2ynBfWM1Dk1uYXEo0T0i9T8zQX9+HuhLv3n
 Ofm59egQ8BOe1Hw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Dec 2025 10:22:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8263

Add instructions on how to install host packages on Rocky Linux. It is
very similar to AlmaLinux so installation scripts were based on it.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/system-requirements.rst   | 49 ++++++++++++++++++++++
 documentation/tools/build-docs-container           | 10 +++++
 .../tools/containerfiles/Containerfile.rocky       |  1 +
 .../tools/host_packages_scripts/rockylinux_docs.sh |  1 +
 .../host_packages_scripts/rockylinux_essential.sh  |  1 +
 5 files changed, 62 insertions(+)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index b41295c4b..a56e683ca 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -304,6 +304,55 @@ Before building the documentation PDF, setup the ``PATH`` to use the installed
 packages (with ``${textooldir}`` pointing to the TeX Live installation from the
 previous step):
 
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
+packages (with ``${textooldir}`` pointing to the TeX Live installation from the
+previous step):
+
 .. code-block:: console
 
    $ export PATH="${PATH}:${textooldir}/tl/bin/x86_64-linux"
diff --git a/documentation/tools/build-docs-container b/documentation/tools/build-docs-container
index 6a33b9068..23c3dfe33 100755
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
@@ -133,6 +135,14 @@ main ()
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
new file mode 120000
index 000000000..be13734c0
--- /dev/null
+++ b/documentation/tools/host_packages_scripts/rockylinux_docs.sh
@@ -0,0 +1 @@
+almalinux_docs.sh
\ No newline at end of file
diff --git a/documentation/tools/host_packages_scripts/rockylinux_essential.sh b/documentation/tools/host_packages_scripts/rockylinux_essential.sh
new file mode 120000
index 000000000..ed172e51d
--- /dev/null
+++ b/documentation/tools/host_packages_scripts/rockylinux_essential.sh
@@ -0,0 +1 @@
+almalinux_essential.sh
\ No newline at end of file

-- 
2.51.0


