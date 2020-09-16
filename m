Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.3955.1600300774421416796
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Sep 2020 16:59:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.195, mailfrom: foss@0leil.net)
X-Originating-IP: 80.110.110.137
Received: from fiqs.lan (80-110-110-137.cgn.dynamic.surfer.at [80.110.110.137])
	(Authenticated sender: foss@0leil.net)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPA id B02AC60006;
	Wed, 16 Sep 2020 23:59:32 +0000 (UTC)
From: "Quentin Schulz" <foss@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss@0leil.net>
Subject: [PATCH 08/16] sphinx: overview-manual: remove highlight in bold section
Date: Thu, 17 Sep 2020 01:58:58 +0200
Message-Id: <20200916235906.243174-8-foss@0leil.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200916235906.243174-1-foss@0leil.net>
References: <20200916235906.243174-1-foss@0leil.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Does not seem to be formatted correctly by Sphinx (escaped `).

Signed-off-by: Quentin Schulz <foss@0leil.net>
---
 documentation/overview-manual/overview-manual-yp-intro.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/overview-manual/overview-manual-yp-intro.rst b/documentation/overview-manual/overview-manual-yp-intro.rst
index 93f5b506a..f01d9f712 100644
--- a/documentation/overview-manual/overview-manual-yp-intro.rst
+++ b/documentation/overview-manual/overview-manual-yp-intro.rst
@@ -311,7 +311,7 @@ applications using the Yocto Project:
    binaries for a variety of architectures on Windows, Linux and Mac OS
    X hosts.
 
--  *``devtool``:* This command-line tool is available as part of the
+-  *devtool:* This command-line tool is available as part of the
    extensible SDK (eSDK) and is its cornerstone. You can use ``devtool``
    to help build, test, and package software within the eSDK. You can
    use the tool to optionally integrate what you build into an image
-- 
2.26.2

