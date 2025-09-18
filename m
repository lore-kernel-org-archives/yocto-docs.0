Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50F69CAC5A8
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 10:25:02 +0000 (UTC)
Received: from smtp-190e.mail.infomaniak.ch (smtp-190e.mail.infomaniak.ch [185.125.25.14])
 by mx.groups.io with SMTP id smtpd.web11.10712.1758191094452425707
 for <docs@lists.yoctoproject.org>;
 Thu, 18 Sep 2025 03:24:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 185.125.25.14, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4cSBb902yZzKLM;
	Thu, 18 Sep 2025 12:24:53 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4cSBb84CqHzLrw;
	Thu, 18 Sep 2025 12:24:52 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Thu, 18 Sep 2025 12:24:45 +0200
Subject: [PATCH 7/7] contributor-guide: submit-changes: make "Crediting
 contributors" part of "Commit your changes"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-submit-patches-v1-7-28abd2919df0@cherry.de>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7550

From: Quentin Schulz <quentin.schulz@cherry.de>

There's no need to differentiate crediting contributors from committing
your changes, so let's simply make it the last step of "Commit your
changes" section.

This simply indents the text so it's now part of "Commit your changes"
list instead of the main list in the "Implement and commit changes"
section. Because of this reorganisation, the instruction to use "git
commit --amend" to add the contributors is moved to a note, and the
first few sentences are reworded to better match the wording of other
items in the "Commit your changes" list of instructions.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/contributor-guide/submit-changes.rst | 44 ++++++++++++----------
 1 file changed, 24 insertions(+), 20 deletions(-)

diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
index 29af1ced959c86bd5b402d1a8000f11e3e760b8f..e3b29500d348be7ca273ac0d3b7d5d825c752579 100644
--- a/documentation/contributor-guide/submit-changes.rst
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -204,31 +204,35 @@ to add the upgraded version.
 
           detailed description of change
 
-#. *Crediting contributors:* By using the ``git commit --amend`` command,
-   you can add some tags to the commit description to credit other contributors
-   to the change:
+   #. If other people participated in this patch, add some tags to the commit
+      description to credit other contributors to the change:
 
-   -  ``Reported-by``: name and email of a person reporting a bug
-      that your commit is trying to fix. This is a good practice
-      to encourage people to go on reporting bugs and let them
-      know that their reports are taken into account.
+      -  ``Reported-by``: name and email of a person reporting a bug
+         that your commit is trying to fix. This is a good practice
+         to encourage people to go on reporting bugs and let them
+         know that their reports are taken into account.
 
-   -  ``Suggested-by``: name and email of a person to credit for the
-      idea of making the change.
+      -  ``Suggested-by``: name and email of a person to credit for the
+         idea of making the change.
 
-   -  ``Tested-by``, ``Reviewed-by``: name and email for people having
-      tested your changes or reviewed their code. These fields are
-      usually added by the maintainer accepting a patch, or by
-      yourself if you submitted your patches to early reviewers,
-      or are submitting an unmodified patch again as part of a
-      new iteration of your patch series.
+      -  ``Tested-by``, ``Reviewed-by``: name and email for people having
+         tested your changes or reviewed their code. These fields are
+         usually added by the maintainer accepting a patch, or by
+         yourself if you submitted your patches to early reviewers,
+         or are submitting an unmodified patch again as part of a
+         new iteration of your patch series.
 
-   -  ``Cc``: name and email of people you want to send a copy
-      of your changes to. This field will be used by ``git send-email``.
+      -  ``Cc``: name and email of people you want to send a copy
+         of your changes to. This field will be used by ``git send-email``.
 
-   See `more guidance about using such tags
-   <https://www.kernel.org/doc/html/latest/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes>`__
-   in the Linux kernel documentation.
+      See `more guidance about using such tags
+      <https://www.kernel.org/doc/html/latest/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes>`__
+      in the Linux kernel documentation.
+
+      .. note::
+
+         One can amend an existing git commit message to add missing tags for
+         contributors with the ``git commit --amend`` command.
 
 Test your changes
 -----------------

-- 
2.51.0


