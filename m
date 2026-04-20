Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDA1FF557FE
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 09:52:34 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15790.1776678750421811450
 for <docs@lists.yoctoproject.org>;
 Mon, 20 Apr 2026 02:52:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=c6FArrIV;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 73AD9C5C992
	for <docs@lists.yoctoproject.org>; Mon, 20 Apr 2026 09:53:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A5AFA5FFA5
	for <docs@lists.yoctoproject.org>; Mon, 20 Apr 2026 09:52:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F404010460C1A;
	Mon, 20 Apr 2026 11:52:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776678748; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VlaOljZeXCnzxGCfpXKxSaEepwsJgsRjFOESEqzTG1U=;
	b=c6FArrIVjDXRryriUdXVkV4kIsYk6m3aCAJFRswHjd8T97G7y30QZ83zHx4RE27s5pOcF0
	O22OLd9il1/6ZVgVaO5EhqcgkTupm321DtRygrqvM4Xz7LVWiVEEb0DqDpXa1fx5+/QqQI
	6Fm9p+ci/0/y1tMhqjb9h4HC5zaY6gi3Zn8WB84ZUOY4fBIkYumYiXaDio7ffOIXFrWO7c
	+lXhsNOdzDe6u9XhjE7Nf3D1JwIpfv9v/U9ZPC+J7NITVzYWysydUSOwC7Y6mXY3BTF+vL
	Is6d/LYWKJlpLwYz/SxxaWoEUgqtJQOHZPAQwQ20lK/H9tbjhu9oelZ9pmM20A==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 20 Apr 2026 11:52:18 +0200
Subject: [PATCH v2 1/2] ref-manual/system-requirements.rst: make
 python3-websockets a default host requirement
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-python3-websockets-requirement-v2-1-a273a01a6f44@bootlin.com>
References: <20260420-python3-websockets-requirement-v2-0-a273a01a6f44@bootlin.com>
In-Reply-To: <20260420-python3-websockets-requirement-v2-0-a273a01a6f44@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4598;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=K3EMDnrcs+ktKvoxvff5tVLP9eMfYXEkxvPE4IOnmLQ=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp5fdaGuUHh1e5bqVVJokMPvmOnLklb179R/0xC
 A7ujE/PRPCJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaeX3WgAKCRDRgEFAKaOo
 Npu5D/9s82vuSTlgs/pk7MA5dN6zwLNZL9k1pyHBFRlReV47WMnWH3gM7Uz2ZyP8YZ0j5H024S+
 DUdABwdTzRIJZLRsmZHKYHLamnvJJWP/NX9+W++oFkur94ZaGc7gcpklLlSr6tvr+KCW0e10gRK
 r2CPVkyRqoayiCLLZpBeH0xpAklq5LLLjVkkml23J8PTPkYnoB+3Dfnph2rRScFJ7PKENZT1ydV
 VvsRmphq7Xm5IJ2+4p+GDXrnGp+J2DA1MbUn0Jq99JCK61ne8LzTbTAEgYM/3wuf2RmrDvK8FJy
 x/Qc5aI53WNSgNQtvXRtBOtiXMrePFYossnRFm7945qwuZ1Q2WSm113zneNZpMzo6DJ2QZ1dHV3
 dSbckVSk7CVbfsvoR3VRqAQ7DJgHZY1selDjMcnliJdz4vV+IGwGAVCgsD4q6wZ/wRzzl4JPspE
 TUVBAZq3zrj+2o8HDlDPfqdhKWBEYpsuN8d+DhWtb9UK+csJOHS20zD2MU1TWdRywz6YkDPluld
 FY9+P88z+F4k5jl93Uldr2HYv/RbWX7YiMYEf3SNQEgqh0eItmlVvbab+bPTZ/4r6MBFAH0egyy
 QWf5m6c24AqzevRgqs6NLpeUHzh3R0Z5mRh0ax/J4NLiiqRkR/SxnFXOiXIS+W1BquAT4vfMuFG
 +fWjEi7Qe0amxiA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 20 Apr 2026 09:52:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9285

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
 documentation/ref-manual/system-requirements.rst   | 28 ++++++++++++++++++++++
 .../host_packages_scripts/fedora_essential.sh      |  2 +-
 .../opensuse_essential_16.0.sh                     |  2 +-
 3 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 298832dd9..baa965573 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -166,6 +166,34 @@ Ubuntu and Debian
 
 .. include:: ubuntu-debian-host-packages-nodocs.rst
 
+Additionally, on distributions other than Debian 11 and Ubuntu 22.04 (otherwise
+see note below), install the following package:
+
+.. code-block:: console
+
+   $ sudo apt install python3-websockets
+
+.. note::
+
+   On Debian 11 and Ubuntu 22.04, the requirement on the version of
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
+   -  Installing ``python3-websockets`` using `Pip <https://pip.pypa.io/en/stable/>`__:
+
+      .. code-block:: console
+
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
index e557ae4fb..96bdd9317 100644
--- a/documentation/tools/host_packages_scripts/opensuse_essential_16.0.sh
+++ b/documentation/tools/host_packages_scripts/opensuse_essential_16.0.sh
@@ -1 +1 @@
-sudo zypper install bzip2 chrpath diffstat gcc gcc-c++ git gzip hostname libacl1 make makeinfo patch python3 python3-GitPython python3-Jinja2 python3-curses python3-pexpect python3-pip python3-xml rpcgen socat tar wget which xz zstd
+sudo zypper install bzip2 chrpath diffstat gcc gcc-c++ git gzip hostname libacl1 make makeinfo patch python3 python3-GitPython python3-Jinja2 python3-curses python3-pexpect python3-pip python313-websockets python3-xml rpcgen socat tar wget which xz zstd

-- 
2.53.0


