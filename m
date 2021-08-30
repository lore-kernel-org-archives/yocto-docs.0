Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web08.17598.1630333079069700581
 for <docs@lists.yoctoproject.org>;
 Mon, 30 Aug 2021 07:17:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 53F17C0004;
	Mon, 30 Aug 2021 14:17:57 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] dev-manual: explicit that devpyshell is a task
Date: Mon, 30 Aug 2021 16:17:50 +0200
Message-Id: <20210830141750.66210-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Without this, readers could think that "devpyshell" is a script,
at least until they read the remainder of the section.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index f3b5084436..6df1f3b791 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -3476,7 +3476,7 @@ Similar to working within a development shell as described in the
 previous section, you can also spawn and work within an interactive
 Python development shell. When debugging certain commands or even when
 just editing packages, ``devpyshell`` can be a useful tool. When you
-invoke ``devpyshell``, all tasks up to and including
+invoke the ``devpyshell`` task, all tasks up to and including
 :ref:`ref-tasks-patch` are run for the
 specified target. Then a new terminal is opened. Additionally, key
 Python objects and code are available in the same way they are to
-- 
2.25.1

