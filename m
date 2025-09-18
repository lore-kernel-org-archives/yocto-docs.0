Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F66ACAC59A
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 10:25:02 +0000 (UTC)
Received: from smtp-8fa8.mail.infomaniak.ch (smtp-8fa8.mail.infomaniak.ch [83.166.143.168])
 by mx.groups.io with SMTP id smtpd.web11.10711.1758191094011804129
 for <docs@lists.yoctoproject.org>;
 Thu, 18 Sep 2025 03:24:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 83.166.143.168, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4cSBb846XZz68j;
	Thu, 18 Sep 2025 12:24:52 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4cSBb815glzNnh;
	Thu, 18 Sep 2025 12:24:52 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Thu, 18 Sep 2025 12:24:44 +0200
Subject: [PATCH 6/7] contributor-guide: submit-changes: number instruction
 list in commit your changes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-submit-patches-v1-6-28abd2919df0@cherry.de>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7549

From: Quentin Schulz <quentin.schulz@cherry.de>

... so that it's clear that you need to read and follow each and every
instruction in this list.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/contributor-guide/submit-changes.rst | 116 ++++++++++-----------
 1 file changed, 58 insertions(+), 58 deletions(-)

diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
index 49790ee14ed259c94b28bee548ca48b9e5977cb7..29af1ced959c86bd5b402d1a8000f11e3e760b8f 100644
--- a/documentation/contributor-guide/submit-changes.rst
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -127,82 +127,82 @@ to add the upgraded version.
 
       $ git commit -sa
 
-   -  The ``-s`` option of ``git commit`` adds a "Signed-off-by:" line
-      to your commit message. There is the same requirement for contributing
-      to the Linux kernel. Adding such a line signifies that you, the
-      submitter, have agreed to the `Developer's Certificate of Origin 1.1
-      <https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin>`__
-      as follows:
+   #.  The ``-s`` option of ``git commit`` adds a "Signed-off-by:" line
+       to your commit message. There is the same requirement for contributing
+       to the Linux kernel. Adding such a line signifies that you, the
+       submitter, have agreed to the `Developer's Certificate of Origin 1.1
+       <https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin>`__
+       as follows:
 
-      .. code-block:: none
+       .. code-block:: none
 
-         Developer's Certificate of Origin 1.1
+          Developer's Certificate of Origin 1.1
 
-         By making a contribution to this project, I certify that:
+          By making a contribution to this project, I certify that:
 
-         (a) The contribution was created in whole or in part by me and I
-             have the right to submit it under the open source license
-             indicated in the file; or
+          (a) The contribution was created in whole or in part by me and I
+              have the right to submit it under the open source license
+              indicated in the file; or
 
-         (b) The contribution is based upon previous work that, to the best
-             of my knowledge, is covered under an appropriate open source
-             license and I have the right under that license to submit that
-             work with modifications, whether created in whole or in part
-             by me, under the same open source license (unless I am
-             permitted to submit under a different license), as indicated
-             in the file; or
+          (b) The contribution is based upon previous work that, to the best
+              of my knowledge, is covered under an appropriate open source
+              license and I have the right under that license to submit that
+              work with modifications, whether created in whole or in part
+              by me, under the same open source license (unless I am
+              permitted to submit under a different license), as indicated
+              in the file; or
 
-         (c) The contribution was provided directly to me by some other
-             person who certified (a), (b) or (c) and I have not modified
-             it.
+          (c) The contribution was provided directly to me by some other
+              person who certified (a), (b) or (c) and I have not modified
+              it.
 
-         (d) I understand and agree that this project and the contribution
-             are public and that a record of the contribution (including all
-             personal information I submit with it, including my sign-off) is
-             maintained indefinitely and may be redistributed consistent with
-             this project or the open source license(s) involved.
+          (d) I understand and agree that this project and the contribution
+              are public and that a record of the contribution (including all
+              personal information I submit with it, including my sign-off) is
+              maintained indefinitely and may be redistributed consistent with
+              this project or the open source license(s) involved.
 
-   -  Provide a single-line summary of the change and, if more
-      explanation is needed, provide more detail in the description of the
-      commit. This summary is typically viewable in the "shortlist" of
-      changes. Thus, providing something short and descriptive that
-      gives the reader a summary of the change is useful when viewing a
-      list of many commits. You should prefix this short description
-      with the recipe name (if changing a recipe), or else with the
-      short form path to the file being changed.
+   #.  Provide a single-line summary of the change and, if more
+       explanation is needed, provide more detail in the description of the
+       commit. This summary is typically viewable in the "shortlist" of
+       changes. Thus, providing something short and descriptive that
+       gives the reader a summary of the change is useful when viewing a
+       list of many commits. You should prefix this short description
+       with the recipe name (if changing a recipe), or else with the
+       short form path to the file being changed.
 
-      .. note::
+       .. note::
 
-         To find a suitable prefix for the commit summary, a good idea
-         is to look for prefixes used in previous commits touching the
-         same files or directories::
+          To find a suitable prefix for the commit summary, a good idea
+          is to look for prefixes used in previous commits touching the
+          same files or directories::
 
-            git log --oneline <paths>
+             git log --oneline <paths>
 
-   -  For the commit description, provide detailed information
-      that describes what you changed, why you made the change, and the
-      approach you used. It might also be helpful if you mention how you
-      tested the change. Provide as much detail as you can in the commit
-      description.
+   #.  For the commit description, provide detailed information
+       that describes what you changed, why you made the change, and the
+       approach you used. It might also be helpful if you mention how you
+       tested the change. Provide as much detail as you can in the commit
+       description.
 
-      .. note::
+       .. note::
 
-         If the single line summary is enough to describe a simple
-         change, the commit description can be left empty.
+          If the single line summary is enough to describe a simple
+          change, the commit description can be left empty.
 
-   -  If the change addresses a specific bug or issue that is associated
-      with a bug-tracking ID, include a reference to that ID in the body of the
-      commit message. For example, the Yocto Project uses a
-      specific convention for bug references --- any commit that addresses
-      a specific bug should use the following form for the body of the commit
-      message. Be sure to use the actual bug-tracking ID from
-      Bugzilla for bug-id::
+   #.  If the change addresses a specific bug or issue that is associated
+       with a bug-tracking ID, include a reference to that ID in the body of the
+       commit message. For example, the Yocto Project uses a
+       specific convention for bug references --- any commit that addresses
+       a specific bug should use the following form for the body of the commit
+       message. Be sure to use the actual bug-tracking ID from
+       Bugzilla for bug-id::
 
-         single-line summary of change
+          single-line summary of change
 
-         Fixes [YOCTO #bug-id]
+          Fixes [YOCTO #bug-id]
 
-         detailed description of change
+          detailed description of change
 
 #. *Crediting contributors:* By using the ``git commit --amend`` command,
    you can add some tags to the commit description to credit other contributors

-- 
2.51.0


