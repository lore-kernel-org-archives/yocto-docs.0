Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.3960.1600300776531169635
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Sep 2020 16:59:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.195, mailfrom: foss@0leil.net)
X-Originating-IP: 80.110.110.137
Received: from fiqs.lan (80-110-110-137.cgn.dynamic.surfer.at [80.110.110.137])
	(Authenticated sender: foss@0leil.net)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPA id CA5C460003;
	Wed, 16 Sep 2020 23:59:34 +0000 (UTC)
From: "Quentin Schulz" <foss@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss@0leil.net>
Subject: [PATCH 11/16] sphinx: brief-yoctoprojectqs: put other distros note after Ubuntu-specific packages
Date: Thu, 17 Sep 2020 01:59:01 +0200
Message-Id: <20200916235906.243174-11-foss@0leil.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200916235906.243174-1-foss@0leil.net>
References: <20200916235906.243174-1-foss@0leil.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Quentin Schulz <foss@0leil.net>
---
 .../brief-yoctoprojectqs/brief-yoctoprojectqs.rst         | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst b/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
index 6d65cf8fd..9d8b502f8 100644
--- a/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
+++ b/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
@@ -78,16 +78,16 @@ You must install essential host packages on your build host. The
 following command installs the host packages based on an Ubuntu
 distribution:
 
+.. code-block:: shell
+
+  $ sudo apt-get install &UBUNTU_HOST_PACKAGES_ESSENTIAL;
+
 .. note::
 
    For host package requirements on all supported Linux distributions,
    see the :ref:`ref-manual/ref-system-requirements:required packages for the build host`
    section in the Yocto Project Reference Manual.
 
-.. code-block:: shell
-
-  $ sudo apt-get install &UBUNTU_HOST_PACKAGES_ESSENTIAL;
-
 Use Git to Clone Poky
 =====================
 
-- 
2.26.2

