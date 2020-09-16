Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web12.3954.1600300771011295614
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Sep 2020 16:59:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.195, mailfrom: foss@0leil.net)
X-Originating-IP: 80.110.110.137
Received: from fiqs.lan (80-110-110-137.cgn.dynamic.surfer.at [80.110.110.137])
	(Authenticated sender: foss@0leil.net)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPA id 4B19C60005;
	Wed, 16 Sep 2020 23:59:29 +0000 (UTC)
From: "Quentin Schulz" <foss@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss@0leil.net>
Subject: [PATCH 03/16] sphinx: brief-yoctoprojectqs: add missing boilerplate
Date: Thu, 17 Sep 2020 01:58:53 +0200
Message-Id: <20200916235906.243174-3-foss@0leil.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200916235906.243174-1-foss@0leil.net>
References: <20200916235906.243174-1-foss@0leil.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Quentin Schulz <foss@0leil.net>
---
 documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst b/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
index bcba1336c..40f9587f3 100644
--- a/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
+++ b/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
@@ -420,3 +420,5 @@ information including the website, wiki pages, and user manuals:
    :ref:`ref-manual/resources:links and related documentation`
    section in the Yocto Project Reference Manual provides a
    comprehensive list of all related links and other user documentation.
+
+.. include:: /boilerplate.rst
-- 
2.26.2

