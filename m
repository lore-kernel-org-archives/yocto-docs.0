Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web12.3957.1600300772342303322
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Sep 2020 16:59:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.195, mailfrom: foss@0leil.net)
X-Originating-IP: 80.110.110.137
Received: from fiqs.lan (80-110-110-137.cgn.dynamic.surfer.at [80.110.110.137])
	(Authenticated sender: foss@0leil.net)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPA id 9FD0960008;
	Wed, 16 Sep 2020 23:59:30 +0000 (UTC)
From: "Quentin Schulz" <foss@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss@0leil.net>
Subject: [PATCH 05/16] sphinx: overview-manual: fix bitbake basic explanation
Date: Thu, 17 Sep 2020 01:58:55 +0200
Message-Id: <20200916235906.243174-5-foss@0leil.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200916235906.243174-1-foss@0leil.net>
References: <20200916235906.243174-1-foss@0leil.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

One requests Bitbake to bake a recipe to create packages.

Signed-off-by: Quentin Schulz <foss@0leil.net>
---
 documentation/overview-manual/overview-manual-concepts.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/overview-manual/overview-manual-concepts.rst b/documentation/overview-manual/overview-manual-concepts.rst
index 695984ff1..9230527b7 100644
--- a/documentation/overview-manual/overview-manual-concepts.rst
+++ b/documentation/overview-manual/overview-manual-concepts.rst
@@ -63,8 +63,8 @@ following commands:
    $ bitbake -h
    $ bitbake --help
 
-The most common usage for BitBake is ``bitbake packagename``, where
-``packagename`` is the name of the package you want to build (referred
+The most common usage for BitBake is ``bitbake recipename``, where
+``recipename`` is the name of the recipe you want to build (referred
 to as the "target"). The target often equates to the first part of a
 recipe's filename (e.g. "foo" for a recipe named ``foo_1.3.0-r0.bb``).
 So, to process the ``matchbox-desktop_1.2.3.bb`` recipe file, you might
-- 
2.26.2

