Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web09.25867.1627661181835216077
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Jul 2021 09:06:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 1B34AE000A;
	Fri, 30 Jul 2021 16:06:19 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] profile-manual: document how to build perf manpages on target
Date: Fri, 30 Jul 2021 18:06:17 +0200
Message-Id: <20210730160617.185319-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks to closing yocto bug #3388, there is now a simple way
to build the perf manpages for use on the target

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/profile-manual/usage.rst | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/documentation/profile-manual/usage.rst b/documentation/profile-manual/usage.rst
index 825290c3f8..ae4efa7f4c 100644
--- a/documentation/profile-manual/usage.rst
+++ b/documentation/profile-manual/usage.rst
@@ -1157,13 +1157,14 @@ section can be found here:
 Normally, you should be able to invoke the man pages via perf itself
 e.g. 'perf help' or 'perf help record'.
 
-However, by default Yocto doesn't install man pages, but perf invokes
-the man pages for most help functionality. This is a bug and is being
-addressed by a Yocto bug: :yocto_bugs:`Bug 3388 - perf: enable man pages for
-basic 'help' functionality </show_bug.cgi?id=3388>`.
+To have the perf manpages installed on your target, modify your
+configuration as follows::
+
+   IMAGE_INSTALL:append = " perf perf-doc"
+   DISTRO_FEATURES:append = " api-documentation"
 
 The man pages in text form, along with some other files, such as a set
-of examples, can be found in the 'perf' directory of the kernel tree::
+of examples, can also be found in the 'perf' directory of the kernel tree::
 
    tools/perf/Documentation
 
-- 
2.25.1

