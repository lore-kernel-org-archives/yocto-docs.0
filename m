Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0259DC5B555
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 14:09:41 +0000 (UTC)
Received: from smtp-8fac.mail.infomaniak.ch (smtp-8fac.mail.infomaniak.ch [83.166.143.172])
 by mx.groups.io with SMTP id smtpd.web10.34469.1749218975960218239
 for <docs@lists.yoctoproject.org>;
 Fri, 06 Jun 2025 07:09:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 83.166.143.172, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4bDNVP5lwSzhyD;
	Fri,  6 Jun 2025 16:09:33 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4bDNVP21ylzpY4;
	Fri,  6 Jun 2025 16:09:32 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Fri, 06 Jun 2025 16:09:20 +0200
Subject: [PATCH] docs: remove lz4 from required packages
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250606-lz4-v1-1-0cc017274b37@cherry.de>
X-B4-Tracking: v=1; b=H4sIAJD2QmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMwMz3ZwqE13DJINkI8vEJNM0Q2MloMqCotS0zAqwKdGxtbUAY96joFU
 AAAA=
X-Change-ID: 20250606-lz4-1b0c29ab5f13
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 06 Jun 2025 14:09:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7020

From: Quentin Schulz <quentin.schulz@cherry.de>

Since commit b13654a4fc2f ("bitbake.conf: Drop lz4 from HOSTTOOLS") in
OE-Core, lz4 isn't an expected host dependency anymore so let's drop it
from the list of required packages.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Not tested.
---
 documentation/tools/host_packages_scripts/almalinux_essential.sh | 2 +-
 documentation/tools/host_packages_scripts/fedora_essential.sh    | 2 +-
 documentation/tools/host_packages_scripts/opensuse_essential.sh  | 2 +-
 documentation/tools/host_packages_scripts/ubuntu_essential.sh    | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/documentation/tools/host_packages_scripts/almalinux_essential.sh b/documentation/tools/host_packages_scripts/almalinux_essential.sh
index 16f25fa1f29c84d512df97988f527d1ea834bea7..76c5280eeb188ffbdf3906c0fe474c40a935a441 100644
--- a/documentation/tools/host_packages_scripts/almalinux_essential.sh
+++ b/documentation/tools/host_packages_scripts/almalinux_essential.sh
@@ -2,4 +2,4 @@ sudo dnf install -y epel-release
 sudo yum install dnf-plugins-core
 sudo dnf config-manager --set-enabled crb
 sudo dnf makecache
-sudo dnf install bzip2 ccache chrpath cpio cpp diffstat diffutils gawk gcc gcc-c++ git glibc-devel glibc-langpack-en gzip libacl lz4 make patch perl perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue python3 python3-GitPython python3-jinja2 python3-pexpect python3-pip rpcgen socat tar texinfo unzip wget which xz zstd
+sudo dnf install bzip2 ccache chrpath cpio cpp diffstat diffutils gawk gcc gcc-c++ git glibc-devel glibc-langpack-en gzip libacl make patch perl perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue python3 python3-GitPython python3-jinja2 python3-pexpect python3-pip rpcgen socat tar texinfo unzip wget which xz zstd
diff --git a/documentation/tools/host_packages_scripts/fedora_essential.sh b/documentation/tools/host_packages_scripts/fedora_essential.sh
index 4841853e1e224683b563c8d6112446f0633a081b..ea14134398bbf3b0e986d3bf9e8be7938f26a7d6 100644
--- a/documentation/tools/host_packages_scripts/fedora_essential.sh
+++ b/documentation/tools/host_packages_scripts/fedora_essential.sh
@@ -1 +1 @@
-sudo dnf install bzip2 ccache chrpath cpio cpp diffstat diffutils file findutils gawk gcc gcc-c++ git glibc-devel glibc-langpack-en gzip hostname libacl lz4 make patch perl perl-Data-Dumper perl-File-Compare perl-File-Copy perl-FindBin perl-Text-ParseWords perl-Thread-Queue perl-bignum perl-locale python python3 python3-GitPython python3-jinja2 python3-pexpect python3-pip rpcgen socat tar texinfo unzip wget which xz zstd
+sudo dnf install bzip2 ccache chrpath cpio cpp diffstat diffutils file findutils gawk gcc gcc-c++ git glibc-devel glibc-langpack-en gzip hostname libacl make patch perl perl-Data-Dumper perl-File-Compare perl-File-Copy perl-FindBin perl-Text-ParseWords perl-Thread-Queue perl-bignum perl-locale python python3 python3-GitPython python3-jinja2 python3-pexpect python3-pip rpcgen socat tar texinfo unzip wget which xz zstd
diff --git a/documentation/tools/host_packages_scripts/opensuse_essential.sh b/documentation/tools/host_packages_scripts/opensuse_essential.sh
index a784f4a5dc05f3734177f08ed97663a04d20a978..0d37e9bd5add2c6cb1386483e1a3ec89645560f6 100644
--- a/documentation/tools/host_packages_scripts/opensuse_essential.sh
+++ b/documentation/tools/host_packages_scripts/opensuse_essential.sh
@@ -1,2 +1,2 @@
-sudo zypper install bzip2 chrpath diffstat gcc gcc-c++ git gzip hostname libacl1 lz4 make makeinfo patch python python-curses python-xml python3 python3-Jinja2 python3-curses python3-pexpect python3-pip rpcgen socat tar wget which xz zstd
+sudo zypper install bzip2 chrpath diffstat gcc gcc-c++ git gzip hostname libacl1 make makeinfo patch python python-curses python-xml python3 python3-Jinja2 python3-curses python3-pexpect python3-pip rpcgen socat tar wget which xz zstd
 sudo pip3 install GitPython
diff --git a/documentation/tools/host_packages_scripts/ubuntu_essential.sh b/documentation/tools/host_packages_scripts/ubuntu_essential.sh
index f3388c88c93d885e3b035651e434c669654ee241..6584a0403d4af5c9e4d1f9fa32066f600d09b116 100644
--- a/documentation/tools/host_packages_scripts/ubuntu_essential.sh
+++ b/documentation/tools/host_packages_scripts/ubuntu_essential.sh
@@ -1 +1 @@
-sudo apt-get install build-essential chrpath cpio debianutils diffstat file gawk gcc git iputils-ping libacl1 liblz4-tool locales python3 python3-git python3-jinja2 python3-pexpect python3-pip python3-subunit socat texinfo unzip wget xz-utils zstd
+sudo apt-get install build-essential chrpath cpio debianutils diffstat file gawk gcc git iputils-ping libacl1 locales python3 python3-git python3-jinja2 python3-pexpect python3-pip python3-subunit socat texinfo unzip wget xz-utils zstd

---
base-commit: 406e8a8e30404c0538f5aa46f211540bae2b206b
change-id: 20250606-lz4-1b0c29ab5f13

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


