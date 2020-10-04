Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web10.7366.1601801888600267860
 for <docs@lists.yoctoproject.org>;
 Sun, 04 Oct 2020 01:58:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.178.230, mailfrom: foss@0leil.net)
Received: from fiqs.lan (80-110-110-137.cgn.dynamic.surfer.at [80.110.110.137])
	(Authenticated sender: foss@0leil.net)
	by relay10.mail.gandi.net (Postfix) with ESMTPA id D1842240004;
	Sun,  4 Oct 2020 08:58:06 +0000 (UTC)
From: "Quentin Schulz" <foss@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss@0leil.net>
Subject: [PATCH 8/8] docs: ref-manual: ref-structure: replace oe-init-build-env by &OE_INIT_FILE;
Date: Sun,  4 Oct 2020 10:57:28 +0200
Message-Id: <20201004085728.8015-8-foss@0leil.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201004085728.8015-1-foss@0leil.net>
References: <20201004085728.8015-1-foss@0leil.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Quentin Schulz <foss@0leil.net>
---
 documentation/ref-manual/ref-structure.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/ref-manual/ref-structure.rst b/documentation/ref-manual/ref-structure.rst
index 32c2dbf23..a5b43259e 100644
--- a/documentation/ref-manual/ref-structure.rst
+++ b/documentation/ref-manual/ref-structure.rst
@@ -139,7 +139,7 @@ back to the Yocto Project, such as ``create-pull-request`` and
 
 .. _structure-core-script:
 
-``oe-init-build-env``
+``&OE_INIT_FILE;``
 ---------------------
 
 This script sets up the OpenEmbedded build environment. Running this
@@ -156,7 +156,7 @@ simple suggestions as to what to do next, including a list of some
 possible targets to build. Here is an example:
 ::
 
-   $ source oe-init-build-env
+   $ source &OE_INIT_FILE;
 
    ### Shell environment set up for builds. ###
 
@@ -170,7 +170,7 @@ possible targets to build. Here is an example:
 
    You can also run generated qemu images with a command like 'runqemu qemux86-64'
 
-The default output of the ``oe-init-build-env`` script is from the
+The default output of the ``&OE_INIT_FILE;`` script is from the
 ``conf-notes.txt`` file, which is found in the ``meta-poky`` directory
 within the :term:`Source Directory`. If you design a
 custom distribution, you can include your own version of this
-- 
2.26.2

