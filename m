Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FB2DCAC5AC
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 10:25:02 +0000 (UTC)
Received: from smtp-190e.mail.infomaniak.ch (smtp-190e.mail.infomaniak.ch [185.125.25.14])
 by mx.groups.io with SMTP id smtpd.web10.10437.1758191093666428224
 for <docs@lists.yoctoproject.org>;
 Thu, 18 Sep 2025 03:24:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 185.125.25.14, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4cSBb818ZNzJYW;
	Thu, 18 Sep 2025 12:24:52 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4cSBb73X7czJq5;
	Thu, 18 Sep 2025 12:24:51 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Thu, 18 Sep 2025 12:24:43 +0200
Subject: [PATCH 5/7] contributor-guide: submit-changes: reword commit
 message instructions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-submit-patches-v1-5-28abd2919df0@cherry.de>
References: <20250918-submit-patches-v1-0-28abd2919df0@cherry.de>
In-Reply-To: <20250918-submit-patches-v1-0-28abd2919df0@cherry.de>
To: docs@lists.yoctoproject.org
Cc: Barne Carstensen <barne.carstensen@danfoss.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 18 Sep 2025 10:25:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7548

From: Quentin Schulz <quentin.schulz@cherry.de>

This should hopefully make it clearer what is expected from the
contributor.

This follows my understanding of git-commit(1)[1] where the following is
a git commit message:

"""
git commit title

git commit description
"""

I'm putting the "Fixes [YOCTO" line in "body of the commit message" so
it's understood as being different from the git commit description so
that the note admonition allowing us to have an empty commit description
doesn't apply to the "Fixes [YOCTO" line.

[1] https://www.man7.org/linux/man-pages/man1/git-commit.1.html#DISCUSSION
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/contributor-guide/submit-changes.rst | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
index 1de4b6c0ed838d1c4c225df06763f672ff7c27f1..49790ee14ed259c94b28bee548ca48b9e5977cb7 100644
--- a/documentation/contributor-guide/submit-changes.rst
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -163,7 +163,7 @@ to add the upgraded version.
              this project or the open source license(s) involved.
 
    -  Provide a single-line summary of the change and, if more
-      explanation is needed, provide more detail in the body of the
+      explanation is needed, provide more detail in the description of the
       commit. This summary is typically viewable in the "shortlist" of
       changes. Thus, providing something short and descriptive that
       gives the reader a summary of the change is useful when viewing a
@@ -179,23 +179,23 @@ to add the upgraded version.
 
             git log --oneline <paths>
 
-   -  For the body of the commit message, provide detailed information
+   -  For the commit description, provide detailed information
       that describes what you changed, why you made the change, and the
       approach you used. It might also be helpful if you mention how you
-      tested the change. Provide as much detail as you can in the body
-      of the commit message.
+      tested the change. Provide as much detail as you can in the commit
+      description.
 
       .. note::
 
          If the single line summary is enough to describe a simple
-         change, the body of the commit message can be left empty.
+         change, the commit description can be left empty.
 
    -  If the change addresses a specific bug or issue that is associated
-      with a bug-tracking ID, include a reference to that ID in your
-      detailed description. For example, the Yocto Project uses a
+      with a bug-tracking ID, include a reference to that ID in the body of the
+      commit message. For example, the Yocto Project uses a
       specific convention for bug references --- any commit that addresses
-      a specific bug should use the following form for the detailed
-      description. Be sure to use the actual bug-tracking ID from
+      a specific bug should use the following form for the body of the commit
+      message. Be sure to use the actual bug-tracking ID from
       Bugzilla for bug-id::
 
          single-line summary of change

-- 
2.51.0


