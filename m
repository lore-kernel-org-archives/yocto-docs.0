Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.2719.1622575982888781355
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Jun 2021 12:33:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.198, mailfrom: foss@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 92C95C0007;
	Tue,  1 Jun 2021 19:33:00 +0000 (UTC)
From: "Quentin Schulz" <foss@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss@0leil.net>
Subject: [PATCH] docs: ref-manual: migration-3.0: remove reference to non-existing BB_SETSCENE_VERIFY_FUNCTION2
Date: Tue,  1 Jun 2021 21:32:48 +0200
Message-Id: <20210601193248.10232-1-foss@0leil.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This variable has been removed in July 2019 with commit
5deaa5df730a "runqueue: Drop unused BB_SETSCENE_VERIFY_FUNCTION2" in
bitbake git repo.

The glossary entry for the variable has been recently removed from bitbake
documentation, therefore the ref breaks the build.

Let's remove the reference so that the build still passes.

Signed-off-by: Quentin Schulz <foss@0leil.net>
---

This is related to
https://lists.openembedded.org/g/bitbake-devel/message/12353 patch

 documentation/ref-manual/migration-3.0.rst | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/documentation/ref-manual/migration-3.0.rst b/documentation/ref-manual/migration-3.0.rst
index f3d20e2ed..a3da85015 100644
--- a/documentation/ref-manual/migration-3.0.rst
+++ b/documentation/ref-manual/migration-3.0.rst
@@ -184,10 +184,9 @@ The following BitBake changes have occurred.
    exceptions. Remove this argument in any calls to
    ``bb.build.exec_func()`` in custom classes or scripts.
 
--  The
-   :term:`bitbake:BB_SETSCENE_VERIFY_FUNCTION2`
-   is no longer used. In the unlikely event that you have any references
-   to it, they should be removed.
+-  The ``BB_SETSCENE_VERIFY_FUNCTION2`` variable is no longer used. In
+   the unlikely event that you have any references to it, they should be
+   removed.
 
 -  The ``RunQueueExecuteScenequeue`` and ``RunQueueExecuteTasks`` events
    have been removed since setscene tasks are now executed as part of
-- 
2.20.1

