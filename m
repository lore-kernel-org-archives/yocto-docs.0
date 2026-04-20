Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63CB0F36C5E
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 12:15:30 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18174.1776687326885829305
 for <docs@lists.yoctoproject.org>;
 Mon, 20 Apr 2026 05:15:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Pwn4iek8;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 32A44C5C998
	for <docs@lists.yoctoproject.org>; Mon, 20 Apr 2026 12:16:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5A3BB5FFA5
	for <docs@lists.yoctoproject.org>; Mon, 20 Apr 2026 12:15:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9CD9010460866;
	Mon, 20 Apr 2026 14:15:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776687324; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5f2lDCdwD1jC+KH79I6Z5usecV3i3dbOjQ7u6CtYGkM=;
	b=Pwn4iek83AOh+J79cawa8UR8IZmErdB2H6aKZlHbdzq22tHl1I62+yQhCWKecPBrOvmweA
	sOzfnZ2Qs/LFDwiUTVnysozpefeiqFeI6Hm+B6G6KYBve2gfhjnnq4JYw7ZxgDwv7v5YGG
	1lXcUoXcD11COKXwEPOZQj4RywvPFFaXcyBYGfPg3Qz9QWFfu+cO2lwWdSKfuCdsrfZ/QZ
	9m4Hp+sWiZnejUD7e6aLgcuHkJM+MiexSjX0L3YBd0gs2uIGECdEZxNt4N0eoabycKHMaR
	5jO17TV0mLOTELvg1vgZ9FyvRv+0/wPA0Sb/ITT9mEY2xO2bgzeHxpNGB59EoA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 20 Apr 2026 14:15:16 +0200
Subject: [PATCH v3 1/2] ref-manual/system-requirements.rst: make
 python3-websockets a default host requirement
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-python3-websockets-requirement-v3-1-22bfa3f411cc@bootlin.com>
References: <20260420-python3-websockets-requirement-v3-0-22bfa3f411cc@bootlin.com>
In-Reply-To: <20260420-python3-websockets-requirement-v3-0-22bfa3f411cc@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4730;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=W4QUnx8vuq4yuchXtJafzl4dUr3btyJRaB4P3s+NRBo=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp5hjb39fSvDdsKNFGfTkvfTioYNqx1s9PAsK3R
 +Vg5HCy2ASJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaeYY2wAKCRDRgEFAKaOo
 Np0cEACWeLRhgpTnpOk8Q7O+qUIqG7pEPwXyrV1H0wvrJaX52n5qZIeCUrhF3D8OlGxpeUulOFE
 pB4kGovsLHHE2R/HFK/27hSjN/6lE2FIm5vNLkjyk+D0TNEVXxA1iue5ezsUKE608BLuKj/zzxU
 LDpN7gK40OgKP1WnHEDchOfJPrRJFKTKOcZTrZTelWcqx7ozyL6zgsBy1F1SmdUciMnL2amVM3q
 0+f3mp8Wy0gUOB0onjTNvLL3FwcQZ+emX8Wvm2ZPQdwmTT+D3sFA2PW0LulTj7tmzx+5FW4ge+v
 YEwS0Z40riaPaXi0WNmJpGj1O4ocrWgS3uCNQRlQuip7UxrImIlGsqs1xr2LHeWD3Z3vcV/W2oJ
 eA9w//1GP6TJXDpVHeQ0P041B7MDC9To+krw4FTtKxsei9Mnc4Uf8/yr3JRHf4qgxLVTZintx/L
 B1v8UMZUk0ttVm95SN1ffgxrZK4hpdUX1njB89iIuPijDOoB1yYPO0r1oulSkKNLXqc9KlmnH1i
 Sj5TPFV+FCkTzfhQYFdWT9bTrLeITJbX6Mi/aaLiBzituGc/HP9Jbgi/OCGGca6oj6/p2AoVx3K
 b+P6RtS38PEACZSoQBHu2ygI7zhkv8WPUBzMrSGDTSQQNc38tq4i3iugj/QaWn6IE91PMGawq6N
 KKa1MouBdah5m5Q==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 20 Apr 2026 12:15:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9291

When configuring the project through bitbake-setup we can choose the
"poky-with-sstate" configuration, which requires the python3-websockets
package.

Add this package as a host requirement (under different names depending
on the distro).

Alma, CentOS, and Rocky have a requirement on the buildtools tarball,
which already contains this package, so we don't need to add it for
them.

On Ubuntu 22.04 and Debian 11, the version of python3-websockets
provided by the distribution is too old compared to what we need [1].
Add a separate set of instructions for these.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/system-requirements.rst   | 31 ++++++++++++++++++++++
 .../host_packages_scripts/fedora_essential.sh      |  2 +-
 .../opensuse_essential_16.0.sh                     |  2 +-
 3 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 298832dd9..dba11a135 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -166,6 +166,37 @@ Ubuntu and Debian
 
 .. include:: ubuntu-debian-host-packages-nodocs.rst
 
+Additionally, on distributions other than Debian 11 and Ubuntu 22.04 (otherwise
+see note below), install the following package:
+
+.. code-block:: console
+
+   $ sudo apt-get install python3-websockets
+
+.. note::
+
+   On Debian 11 and Ubuntu 22.04, the minimum version for
+   ``python3-websockets`` is not satisfied by the host distribution. This
+   package is used for fetching pre-built :ref:`shared state
+   <overview-manual/concepts:shared state>` artifacts from upstream Yocto Project
+   servers (see :ref:`ref-fragments-core-yocto-sstate-mirror-cdn` for more
+   information).
+
+   In order to use this feature, you can get the correct version of
+   ``python3-websockets`` by either:
+
+   -  Using a :term:`buildtools` tarball by following the
+      :ref:`system-requirements-buildtools` section below.
+
+   -  Installing ``python3-websockets`` using `Pip
+      <https://pip.pypa.io/en/stable/>`__ in a virtual environment, e.g.:
+
+      .. code-block:: console
+
+         $ python3 -m venv --clear ./yocto-docs-venv
+         $ . ./yocto-docs-venv/bin/activate
+         $ pip install websockets
+
 Here are the packages needed to build Project documentation manuals:
 
 .. literalinclude:: ../tools/host_packages_scripts/ubuntu_docs.sh
diff --git a/documentation/tools/host_packages_scripts/fedora_essential.sh b/documentation/tools/host_packages_scripts/fedora_essential.sh
index 99e5d2c0b..55b8b704b 100644
--- a/documentation/tools/host_packages_scripts/fedora_essential.sh
+++ b/documentation/tools/host_packages_scripts/fedora_essential.sh
@@ -1 +1 @@
-sudo dnf install bzip2 ccache chrpath cpio cpp diffstat diffutils file findutils gawk gcc gcc-c++ git glibc-devel glibc-langpack-en gzip hostname libacl make patch perl perl-Data-Dumper perl-File-Compare perl-File-Copy perl-FindBin perl-Text-ParseWords perl-Thread-Queue perl-bignum perl-locale python python3 python3-GitPython python3-jinja2 python3-pexpect python3-pip rpcgen socat tar texinfo unzip wget which xz zstd $([ $(rpm -E %fedora) -ge 42 ] && echo "util-linux-script")
+sudo dnf install bzip2 ccache chrpath cpio cpp diffstat diffutils file findutils gawk gcc gcc-c++ git glibc-devel glibc-langpack-en gzip hostname libacl make patch perl perl-Data-Dumper perl-File-Compare perl-File-Copy perl-FindBin perl-Text-ParseWords perl-Thread-Queue perl-bignum perl-locale python python3 python3-GitPython python3-jinja2 python3-pexpect python3-pip python3-websockets rpcgen socat tar texinfo unzip wget which xz zstd $([ $(rpm -E %fedora) -ge 42 ] && echo "util-linux-script")
diff --git a/documentation/tools/host_packages_scripts/opensuse_essential_16.0.sh b/documentation/tools/host_packages_scripts/opensuse_essential_16.0.sh
index e557ae4fb..f3ee6ad54 100644
--- a/documentation/tools/host_packages_scripts/opensuse_essential_16.0.sh
+++ b/documentation/tools/host_packages_scripts/opensuse_essential_16.0.sh
@@ -1 +1 @@
-sudo zypper install bzip2 chrpath diffstat gcc gcc-c++ git gzip hostname libacl1 make makeinfo patch python3 python3-GitPython python3-Jinja2 python3-curses python3-pexpect python3-pip python3-xml rpcgen socat tar wget which xz zstd
+sudo zypper install bzip2 chrpath diffstat gcc gcc-c++ git gzip hostname libacl1 make makeinfo patch python3 python3-GitPython python3-Jinja2 python3-curses python3-pexpect python3-pip python3-websockets python3-xml rpcgen socat tar wget which xz zstd

-- 
2.53.0


