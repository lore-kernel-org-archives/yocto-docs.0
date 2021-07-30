Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web08.22536.1627640994428112886
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Jul 2021 03:29:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 600B020007;
	Fri, 30 Jul 2021 10:29:51 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss@0leil.net>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH v4] doc: bitbake-user-manual: grammar fix for the number of "metadata"
Date: Fri, 30 Jul 2021 12:29:50 +0200
Message-Id: <20210730102950.178246-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ebf96a35dd0205f17136e1c60860224889006890.camel@linuxfoundation.org>
References: <ebf96a35dd0205f17136e1c60860224889006890.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"metadata" is used both as singular and as plural.
This fixes a case in which the verb has a singular conjugation,
which conflicts with the absence of article indicating a plural case.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reviewed-by: Quentin Schulz <foss@0leil.net>
Reviewed-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 doc/bitbake-user-manual/bitbake-user-manual-intro.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/doc/bitbake-user-manual/bitbake-user-manual-intro.rst b/doc/bitbake-user-manual/bitbake-user-manual-intro.rst
index eb140665..ec66d8c2 100644
--- a/doc/bitbake-user-manual/bitbake-user-manual-intro.rst
+++ b/doc/bitbake-user-manual/bitbake-user-manual-intro.rst
@@ -27,7 +27,7 @@ Linux software stacks using a task-oriented approach.
 Conceptually, BitBake is similar to GNU Make in some regards but has
 significant differences:
 
--  BitBake executes tasks according to provided metadata that builds up
+-  BitBake executes tasks according to the provided metadata that builds up
    the tasks. Metadata is stored in recipe (``.bb``) and related recipe
    "append" (``.bbappend``) files, configuration (``.conf``) and
    underlying include (``.inc``) files, and in class (``.bbclass``)
-- 
2.25.1

