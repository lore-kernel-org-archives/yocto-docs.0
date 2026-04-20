Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C534F36C39
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 07:23:58 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14269.1776669832737224941
 for <docs@lists.yoctoproject.org>;
 Mon, 20 Apr 2026 00:23:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=U/0OPqql;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 95E001A3363
	for <docs@lists.yoctoproject.org>; Mon, 20 Apr 2026 07:23:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6CC8F5FFA5
	for <docs@lists.yoctoproject.org>; Mon, 20 Apr 2026 07:23:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A576B1046088E;
	Mon, 20 Apr 2026 09:23:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776669830; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=cR6zUZHUVgxo86UknBDzsFbjhnRnHwz3g8JGPyk1DAs=;
	b=U/0OPqqlvi5Lus5X4joBTEGmewZiROpNQnTcTTVDmDqoAKjR2Q8RyPp3056onk/lb7lb+n
	JnzsbdCSkGEjT572Qnxf3lEZRcoHS0g1MyeQopX4WonwpBFtlMixors4MOaHko4F96fV48
	4PUr6qcDtNr7H4jU3GjaBdzrSwFbiXNJOhAHfCFnNbmTeuivelAVoah3KVz91S96hPwfnr
	kn//SHR+GXGe4+jhMsY/zioHki25tP3EVAxX9s/vPTdoYxT7JIOKmWRi/gVAP6mVdGh42X
	DjjiLy0O8P+ilLE7Vg1f+6nhP2nP9uapdwWaIhTU3LVq1Uxsn4ZVoFUo3RX/iA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 20 Apr 2026 09:23:36 +0200
Subject: [PATCH] ref-manual/system-requirements.rst: make
 python3-websockets a default host requirement
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-python3-websockets-requirement-v1-1-28c4fce2f766@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNyw6CMBBG4Vchs3aSWosRX8W4kPIjo7HFTvESw
 rtbdfltzplJkQRK+2qmhIeoxFCwXlXkh1M4g6UrJmvs1jhreHznIYYNP9Fq9Fdk5YT7JAk3hMy
 ubpyrTb/rGkslMib08voNDse/dWov8PlbpWX5AOKbOGCCAAAA
X-Change-ID: 20260420-python3-websockets-requirement-4594450f8d92
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4837;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=nOxqxHCIVficoq7ILVW4rAn7E4LjifAOne6/OOSD1eA=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp5dSFNT7Wn7gjWpe9BeMheOUarbYbyOmxfA0BW
 E8lpCbMGdyJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaeXUhQAKCRDRgEFAKaOo
 Nva7EADL4a3V4SVZgwssDePQSzg872MtBalTTqtkRF2TMOt+3TQQwTp9cjt0Svzju4YHbVm2BoC
 FLDlbz+geaeU8gUZnQmRVva5o8Vex67D/W2piKmULAnxtEYkngvkwqMPGeaGj0mSyI2r2Ekj0hS
 K3U6pTonauU++2JD0kWvh5uRIvC+94Z3ebsyl1nVWKQePAuPd5+jtWynuV8NreaeERHkc1AjIXW
 MOd0hoLIfIwtUOQQKIB5X60Nh/KCn1BXs0kpYrQYNPO85HomTrnBvci44drKBekDkpMPfaVBAQF
 Zdeno7byUPENaP9rJpwMRcLMspp0bFWlxRRfIY6ZdJQzgUhUamBqt1ZKpcMgJorHPVlPzhQwz7J
 4vto3QZVg4xe6SgPgjBTKHYpb7BRasSzmhEwgDuMscxnDEOMNpTq9mFACrdFZlvteKyWn26tOQv
 OSb+KzMqEI8qZj4ZgaTI8+DkqWcj/yfffQth0PsTsXvZ+YuaaCfZMcD4uPZn1NZTqgpnVpGGdhR
 Dp6/Z2bong/p+b9/CGbn2QouAtPBRFuQx7cYSoQx9D/8VeLoq7EJ/AGVVaEms3Hy0LXqMfVT62D
 rzv4iEMscgBkmNQQEMsFVTFHa/m/rNC/MZIOjD73z92nLbleAJIOGy5nQS7BJHSlDlGGKzpiDfC
 HWlhGI17KEgUd1g==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 20 Apr 2026 07:23:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9278

When configuring the project through bitbake-setup we can choose the
"poky-with-sstate" configuration, which requires the python3-websockets
package.

Add this package as a host requirement (under different names depending
on the distro).

Alma, CentOS, and Rocky have a requirement on the buildtools tarball,
which already contains this package, so we don't need to add it for
them.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/tools/host_packages_scripts/fedora_essential.sh        | 2 +-
 documentation/tools/host_packages_scripts/opensuse_essential_15.6.sh | 2 +-
 documentation/tools/host_packages_scripts/opensuse_essential_16.0.sh | 2 +-
 documentation/tools/host_packages_scripts/ubuntu_essential.sh        | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/documentation/tools/host_packages_scripts/fedora_essential.sh b/documentation/tools/host_packages_scripts/fedora_essential.sh
index 99e5d2c0b..55b8b704b 100644
--- a/documentation/tools/host_packages_scripts/fedora_essential.sh
+++ b/documentation/tools/host_packages_scripts/fedora_essential.sh
@@ -1 +1 @@
-sudo dnf install bzip2 ccache chrpath cpio cpp diffstat diffutils file findutils gawk gcc gcc-c++ git glibc-devel glibc-langpack-en gzip hostname libacl make patch perl perl-Data-Dumper perl-File-Compare perl-File-Copy perl-FindBin perl-Text-ParseWords perl-Thread-Queue perl-bignum perl-locale python python3 python3-GitPython python3-jinja2 python3-pexpect python3-pip rpcgen socat tar texinfo unzip wget which xz zstd $([ $(rpm -E %fedora) -ge 42 ] && echo "util-linux-script")
+sudo dnf install bzip2 ccache chrpath cpio cpp diffstat diffutils file findutils gawk gcc gcc-c++ git glibc-devel glibc-langpack-en gzip hostname libacl make patch perl perl-Data-Dumper perl-File-Compare perl-File-Copy perl-FindBin perl-Text-ParseWords perl-Thread-Queue perl-bignum perl-locale python python3 python3-GitPython python3-jinja2 python3-pexpect python3-pip python3-websockets rpcgen socat tar texinfo unzip wget which xz zstd $([ $(rpm -E %fedora) -ge 42 ] && echo "util-linux-script")
diff --git a/documentation/tools/host_packages_scripts/opensuse_essential_15.6.sh b/documentation/tools/host_packages_scripts/opensuse_essential_15.6.sh
index 0d37e9bd5..f7a57ce36 100644
--- a/documentation/tools/host_packages_scripts/opensuse_essential_15.6.sh
+++ b/documentation/tools/host_packages_scripts/opensuse_essential_15.6.sh
@@ -1,2 +1,2 @@
-sudo zypper install bzip2 chrpath diffstat gcc gcc-c++ git gzip hostname libacl1 make makeinfo patch python python-curses python-xml python3 python3-Jinja2 python3-curses python3-pexpect python3-pip rpcgen socat tar wget which xz zstd
+sudo zypper install bzip2 chrpath diffstat gcc gcc-c++ git gzip hostname libacl1 make makeinfo patch python python-curses python-xml python3 python3-Jinja2 python3-curses python3-pexpect python3-pip python3-websockets rpcgen socat tar wget which xz zstd
 sudo pip3 install GitPython
diff --git a/documentation/tools/host_packages_scripts/opensuse_essential_16.0.sh b/documentation/tools/host_packages_scripts/opensuse_essential_16.0.sh
index e557ae4fb..96bdd9317 100644
--- a/documentation/tools/host_packages_scripts/opensuse_essential_16.0.sh
+++ b/documentation/tools/host_packages_scripts/opensuse_essential_16.0.sh
@@ -1 +1 @@
-sudo zypper install bzip2 chrpath diffstat gcc gcc-c++ git gzip hostname libacl1 make makeinfo patch python3 python3-GitPython python3-Jinja2 python3-curses python3-pexpect python3-pip python3-xml rpcgen socat tar wget which xz zstd
+sudo zypper install bzip2 chrpath diffstat gcc gcc-c++ git gzip hostname libacl1 make makeinfo patch python3 python3-GitPython python3-Jinja2 python3-curses python3-pexpect python3-pip python313-websockets python3-xml rpcgen socat tar wget which xz zstd
diff --git a/documentation/tools/host_packages_scripts/ubuntu_essential.sh b/documentation/tools/host_packages_scripts/ubuntu_essential.sh
index 43f071a09..a047a1bd6 100644
--- a/documentation/tools/host_packages_scripts/ubuntu_essential.sh
+++ b/documentation/tools/host_packages_scripts/ubuntu_essential.sh
@@ -1 +1 @@
-sudo apt-get install build-essential chrpath cpio debianutils diffstat file gawk gcc git iputils-ping libacl1 libcrypt-dev locales python3 python3-git python3-jinja2 python3-pexpect python3-pip python3-subunit socat texinfo unzip wget xz-utils zstd
+sudo apt-get install build-essential chrpath cpio debianutils diffstat file gawk gcc git iputils-ping libacl1 libcrypt-dev locales python3 python3-git python3-jinja2 python3-pexpect python3-pip python3-subunit python3-websockets socat texinfo unzip wget xz-utils zstd

---
base-commit: 2c12ec7bf29aedeacf82970a9d2eb262fde4670e
change-id: 20260420-python3-websockets-requirement-4594450f8d92


