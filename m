Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web10.12856.1628712808993695872
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Aug 2021 13:13:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.178.232, mailfrom: foss@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id CB56D200002;
	Wed, 11 Aug 2021 20:13:26 +0000 (UTC)
From: "Quentin Schulz" <foss@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss@0leil.net>
Subject: [PATCH] docs: overview-manual: concepts: remove long-gone BBHASHDEPS variable
Date: Wed, 11 Aug 2021 22:13:10 +0200
Message-Id: <20210811201310.12996-1-foss@0leil.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

BBHASHDEPS was removed from bitbake in April 2014, with the following
commit:
92526eadd09d "bitbake-worker: Drop BBHASH variables"

so let's remove mentions from the docs.

Signed-off-by: Quentin Schulz <foss@0leil.net>
---
 documentation/overview-manual/concepts.rst | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 4f8e6cb04..8667ef6da 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -1774,9 +1774,6 @@ the build. This information includes:
 -  ``BB_BASEHASH_``\ filename\ ``:``\ taskname: The base hashes for each
    dependent task.
 
--  ``BBHASHDEPS_``\ filename\ ``:``\ taskname: The task dependencies for
-   each task.
-
 -  :term:`BB_TASKHASH`: The hash of the currently running task.
 
 Shared State
-- 
2.20.1

