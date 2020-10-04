Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web10.7365.1601801886421936976
 for <docs@lists.yoctoproject.org>;
 Sun, 04 Oct 2020 01:58:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.178.230, mailfrom: foss@0leil.net)
Received: from fiqs.lan (80-110-110-137.cgn.dynamic.surfer.at [80.110.110.137])
	(Authenticated sender: foss@0leil.net)
	by relay10.mail.gandi.net (Postfix) with ESMTPA id 8AAEB240006;
	Sun,  4 Oct 2020 08:58:04 +0000 (UTC)
From: "Quentin Schulz" <foss@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss@0leil.net>
Subject: [PATCH 5/8] docs: ref-manual: migration-2.3: specify 2.3 version instead of DISTRO
Date: Sun,  4 Oct 2020 10:57:25 +0200
Message-Id: <20201004085728.8015-5-foss@0leil.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201004085728.8015-1-foss@0leil.net>
References: <20201004085728.8015-1-foss@0leil.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Quentin Schulz <foss@0leil.net>
---
 documentation/ref-manual/migration-2.3.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/migration-2.3.rst b/documentation/ref-manual/migration-2.3.rst
index 25c5e0f14..5bf3e7033 100644
--- a/documentation/ref-manual/migration-2.3.rst
+++ b/documentation/ref-manual/migration-2.3.rst
@@ -120,7 +120,7 @@ The following changes to scripts took place:
       $ . oe-find-native-sysroot recipe
 
    You must now supply a recipe for recipe
-   as part of the command. Prior to the Yocto Project &DISTRO; release, it
+   as part of the command. Prior to the Yocto Project 2.3 release, it
    was not necessary to provide the script with the command.
 
 -  ``oe-run-native``: The usage for the ``oe-run-native`` script has
@@ -131,7 +131,7 @@ The following changes to scripts took place:
 
    You must
    supply the name of the native recipe and the tool you want to run as
-   part of the command. Prior to the Yocto Project DISTRO release, it
+   part of the command. Prior to the Yocto Project 2.3 release, it
    was not necessary to provide the native recipe with the command.
 
 -  ``cleanup-workdir``: The ``cleanup-workdir`` script has been
-- 
2.26.2

