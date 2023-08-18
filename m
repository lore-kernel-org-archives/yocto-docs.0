Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 376F4C7EE39
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 17:10:40 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.81.1692378631309539040
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Aug 2023 10:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YVtWpkgw;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 95A44E0004;
	Fri, 18 Aug 2023 17:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692378629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VL+F+vDFiaGyd1qEJjI5U0A4wzYZl17scbep1w9xRko=;
	b=YVtWpkgw3AhoMKuNYOC6KjGHyVAjC6vGR6vlD/xW1filOAXKwqxKQrEsw796gc4TUuEzPz
	wkiVnF+oz/aAhrL2yY2GlmhMT6C8yw39qZBH4/A5+G7DfvXkKa2VKWUs3dKE5Qh/nFAUAc
	VACMrc5fCOLcxvIAMXn76sF3hiQymmb3ivCUxwUnb7/iJE0wK21z6+sgQKDAQTZrr3CN7i
	qPLgHzYHrp9wvx/0SG1QM0dB23YOjueCqq7LWaNuTF/SpMqTV5C2puoJoeXAmCKJ5zipW2
	NPo2Vrw6R7r+ksInUVF3Ka0Wq1KH0lqs5C1iA9uIUXqYq+YoEfMQMARTk57CqA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Jon.Mason@arm.com,
	JPEWhacker@gmail.com,
	Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 04/10] contributor-guide: submit-changes: detail commit and patch creation
Date: Fri, 18 Aug 2023 19:09:59 +0200
Message-Id: <20230818171005.92381-5-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230818171005.92381-1-michael.opdenacker@bootlin.com>
References: <20230818171005.92381-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Aug 2023 17:10:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4169

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Add missing steps and try to provide better guidance and more modern
solutions, for example keeping track of the cover letter in the branch
itself.

Also add subsections to divide the instructions into easier
to understand parts.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../contributor-guide/submit-changes.rst      | 148 +++++++++++++-----
 1 file changed, 110 insertions(+), 38 deletions(-)

diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
index 533aab5b83..314b41bb63 100644
--- a/documentation/contributor-guide/submit-changes.rst
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -140,7 +140,34 @@ The following sections provide procedures for submitting changes.
 Preparing Changes for Submission
 ================================
 
-The first thing to do is to create a new branch in your local Git repository
+Set up Git
+----------
+
+The first thing to do is to install Git packages. Here is an example
+on Debian and Ubuntu::
+
+   sudo aptitude install git-core git-email
+
+Then, you need to set a name and e-mail address that Git will
+use to identify your commits::
+
+   git config --global user.name "Ada Lovelace"
+   git config --global user.email "ada.lovelace@gmail.com"
+
+Clone the Git repository for the component to modify
+----------------------------------------------------
+
+After identifying the component to modify as described in the
+":doc:`../contributor-guide/identify-component`" section, clone the
+corresponding Git repository. Here is an example for OpenEmbedded-Core::
+
+  git clone https://git.openembedded.org/openembedded-core
+  cd openembedded-core
+
+Create a new branch
+-------------------
+
+Then, create a new branch in your local Git repository
 for your changes, starting from the reference branch in the upstream
 repository (often called ``master``)::
 
@@ -150,26 +177,37 @@ repository (often called ``master``)::
 If you have completely unrelated sets of changes to submit, you should even
 create one branch for each set.
 
-Then, in each branch, you should group your changes into small, controlled and
+Implement and commit changes
+----------------------------
+
+In each branch, you should group your changes into small, controlled and
 isolated ones. Keeping changes small and isolated aids review, makes
 merging/rebasing easier and keeps the change history clean should anyone need
 to refer to it in future.
 
 To this purpose, you should create *one Git commit per change*,
 corresponding to each of the patches you will eventually submit.
-So, for each identified change:
+See `further guidance <https://www.kernel.org/doc/html/latest/process/submitting-patches.html#separate-your-changes>`__
+in the Linux kernel documentation if needed.
 
-#. *Stage Your Change:* Stage your change by using the ``git add``
-   command on each file you modified.
+#. *Stage Your Changes:* Stage your changes by using the ``git add``
+   command on each file you modified. If you want to stage all the
+   files you modified, you can even use the ``git add -A`` command.
 
-#. *Commit Your Change:* Commit the change by using the ``git commit``
-   command. Make sure your commit information follows standards by
-   following these accepted conventions:
+#. *Commit Your Changes:* This is when you can create separate commits. For
+   each commit to create, use the ``git commit -s`` command with the files
+   or directories you want to include in the commit::
 
-   -  Be sure to include a "Signed-off-by:" line in the same style as
-      required by the Linux kernel. This can be done by using the
-      ``git commit -s`` command. Adding this line signifies that you,
-      the submitter, have agreed to the `Developer's Certificate of Origin 1.1
+      $ git commit -s file1 file2 dir1 dir2 ...
+
+   To include **a**\ ll staged files::
+
+      $ git commit -sa
+
+   -  The ``-s`` option of ``git commit`` adds a "Signed-off-by:" line
+      to your commit message. There is the same requirement for contributing
+      to the Linux kernel. Adding such a line signifies that you, the
+      submitter, have agreed to the `Developer's Certificate of Origin 1.1
       <https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin>`__
       as follows:
 
@@ -241,39 +279,74 @@ So, for each identified change:
 
          detailed description of change
 
-Using Email to Submit Patches
-=============================
+Creating Patches
+================
 
-Depending on the components changed, you need to submit the email to a
-specific mailing list. For some guidance on which mailing list to use,
-see the ":ref:`contributor-guide/submit-changes:finding a suitable mailing list`"
-section above.
+Here is the general procedure on how to create patches to be sent through email:
+
+#. *Describe the Changes in your Branch:* If you have more than one commit
+   in your branch, it's recommended to provide a cover letter describing
+   the series of patches you are about to send.
+
+   For this purpose, a good solution is to store the cover letter contents
+   in the branch itself::
 
-Here is the general procedure on how to create and submit patches through email:
+      git branch --edit-description
 
-#. *Generate Patches for your Branch:* The ``git format-patch`` command for
+   This will open a text editor to fill in the description for your
+   changes. This description can be updated when necessary and will
+   be used by Git to create the cover letter together with the patches.
+
+   It is recommended to start this description with a title line which
+   will serve a the subject line for the cover letter.
+
+#. *Generate Patches for your Branch:* The ``git format-patch`` command will
    generate patch files for each of the commits in your branch. You need
-   to pass the reference branch your branch starts from::
+   to pass the reference branch your branch starts from.
+
+   If you branch didn't need a description in the previous step::
 
       $ git format-patch <ref-branch>
 
-   After the command is run, the current directory contains numbered
-   ``.patch`` files for the commits in your branch.
+   If you filled a description for your branch, you will want to generate
+   a cover letter too::
 
-   If you have more than one patch, you should also use the ``--cover``
-   option with the command, which generates a cover letter as the first
-   "patch" in the series. You can then edit the cover letter to provide
-   a description for the series of patches. Run ``man git-format-patch``
-   for details about this command.
+      $ git format-patch --cover-letter --cover-from-description=auto <ref-branch>
 
-#. *Send the patches via email:* Send the patches to the recipients and
-   relevant mailing lists by using the ``git send-email`` command.
+   After the command is run, the current directory contains numbered
+   ``.patch`` files for the commits in your branch. If you have a cover
+   letter, it will be in the ``0000-cover-letter.patch``.
 
    .. note::
 
-      In order to use ``git send-email``, you must have the proper Git packages
-      installed on your host.
-      For Ubuntu, Debian, and Fedora the package is ``git-email``.
+      The ``--cover-from-description=auto`` option makes ``git format-patch``
+      use the first paragraph of the branch description as the cover
+      letter title. Another possibility, which is easier to remember, is to pass
+      only the ``--cover-letter`` option, but you will have to edit the
+      subject line manually every time you generate the patches.
+
+      See the `git format-patch manual page <https://git-scm.com/docs/git-format-patch>`__
+      for details.
+
+#. *Review each of the Patch Files:* This final review of the patches
+   before sending them often allows to view your changes from a different
+   perspective and discover defects such as typos, spacing issues or lines
+   or even files that you didn't intend to modify. This review should
+   include the cover letter patch too.
+
+   If necessary, rework your commits as described in
+   ":ref:`contributor-guide/submit-changes:take patch review into account`".
+
+Sending the Patches via Email
+=============================
+
+Depending on the components changed, you need to submit the email to a
+specific mailing list. For some guidance on which mailing list to use,
+see the ":ref:`contributor-guide/submit-changes:finding a suitable mailing list`"
+section above.
+
+#. *Send the patches via email:* Send the patches to the recipients and
+   relevant mailing lists by using the ``git send-email`` command.
 
    The ``git send-email`` command sends email by using a local or remote
    Mail Transport Agent (MTA) such as ``msmtp``, ``sendmail``, or
@@ -420,8 +493,8 @@ have been followed:
               $ poky/scripts/create-pull-request -h
               $ poky/scripts/send-pull-request -h
 
-Responding to Patch Review
-==========================
+Take Patch Review into Account
+==============================
 
 You may get feedback on your submitted patches from other community members
 or from the automated patchtest service. If issues are identified in your
@@ -494,9 +567,8 @@ follows:
       a newer version of the software which includes an upstream fix for the
       issue or when the issue has been fixed on the master branch in a way
       that introduces backwards incompatible changes. In this case follow the
-      steps in ":ref:`contributor-guide/submit-changes:preparing changes for submission`" and
-      ":ref:`contributor-guide/submit-changes:using email to submit patches`"
-      but modify the subject header of your patch
+      steps in ":ref:`contributor-guide/submit-changes:preparing changes for submission`"
+      and in the following sections but modify the subject header of your patch
       email to include the name of the stable branch which you are
       targetting. This can be done using the ``--subject-prefix`` argument to
       ``git format-patch``, for example to submit a patch to the dunfell
-- 
2.34.1


