Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.12795.1594114607272724347
 for <docs@lists.yoctoproject.org>;
 Tue, 07 Jul 2020 02:36:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=53850 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jsk1r-0004xc-Sx; Tue, 07 Jul 2020 12:36:44 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [PATCH] documentation/poky.ent: Add screen
Date: Tue,  7 Jul 2020 12:36:32 +0300
Message-Id: <20200707093632.17972-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Add screen to the list of packages for Ubuntu. Without screen or
an alternative terminal, executing -c devshell fails due to the
following error:

ERROR: do_devshell: No valid terminal found, unable to open devshell.

Tested on a fresh installation of Ubuntu 18.04.4 LTS.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 documentation/poky.ent | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/poky.ent b/documentation/poky.ent
index aec8d455e..5e3563937 100755
--- a/documentation/poky.ent
+++ b/documentation/poky.ent
@@ -62,7 +62,7 @@
 <!ENTITY UBUNTU_HOST_PACKAGES_ESSENTIAL "gawk wget git-core diffstat unzip texinfo gcc-multilib \
      build-essential chrpath socat cpio python3 python3-pip python3-pexpect \
      xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev \
-     pylint3 xterm python3-subunit mesa-common-dev">
+     pylint3 xterm python3-subunit mesa-common-dev screen">
 <!ENTITY FEDORA_HOST_PACKAGES_ESSENTIAL "gawk make wget tar bzip2 gzip python3 unzip perl patch \
      diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath \
      ccache perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue perl-bignum socat \
-- 
2.17.1

