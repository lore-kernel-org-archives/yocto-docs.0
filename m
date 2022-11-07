Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE5A1C43219
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 16:08:13 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.76.1667837274054090089
 for <docs@lists.yoctoproject.org>;
 Mon, 07 Nov 2022 08:07:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.195, mailfrom: foss+yocto@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id 7A9E460003;
	Mon,  7 Nov 2022 16:07:50 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH] docs: poky.yaml.in: remove pylint3 from Ubuntu/Debian host dependencies
Date: Mon,  7 Nov 2022 17:07:37 +0100
Message-Id: <20221107-upstream-pylint-removal-v1-0-014ecbdb50c7@theobroma-systems.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 07 Nov 2022 16:08:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3460

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

It is not actually needed outside of the autobuilder and since the
package got renamed in Ubuntu 20.04 and later to pylint, it was giving
the users an incorrect command line to run and would fail all the time,
better remove it instead of trying to handle Debian/recent Ubuntu
differences in the documentation.

Moreover, the other supported host distributions didn't have pylint
listed as a dependency, proving that it's indeed not needed.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
---
 documentation/poky.yaml.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
index 5639f3ca7..2d6affbca 100644
--- a/documentation/poky.yaml.in
+++ b/documentation/poky.yaml.in
@@ -13,7 +13,7 @@ YOCTO_RELEASE_DL_URL : "&YOCTO_DL_URL;/releases/yocto/yocto-&DISTRO;"
 UBUNTU_HOST_PACKAGES_ESSENTIAL : "gawk wget git diffstat unzip texinfo gcc \
      build-essential chrpath socat cpio python3 python3-pip python3-pexpect \
      xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev \
-     pylint3 xterm python3-subunit mesa-common-dev zstd liblz4-tool"
+     xterm python3-subunit mesa-common-dev zstd liblz4-tool"
 FEDORA_HOST_PACKAGES_ESSENTIAL : "gawk make wget tar bzip2 gzip python3 unzip perl patch \
      diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath \
      ccache perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue perl-bignum socat \

---
base-commit: dce50679242d39f133e0cde5c8483b5e69f3eb54
change-id: 20221107-upstream-pylint-removal-00f7219e14f7

Best regards,
-- 
Quentin Schulz <quentin.schulz@theobroma-systems.com>

