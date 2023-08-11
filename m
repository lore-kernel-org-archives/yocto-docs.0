Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A083EB64DD
	for <webhook@archiver.kernel.org>; Fri, 11 Aug 2023 17:55:54 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.49493.1691776547524667420
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Aug 2023 10:55:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WVqijEoV;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DE7F81BF206;
	Fri, 11 Aug 2023 17:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691776546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/LjNA9bUqSQPc78Wz4bvXcifvRRrrBD9WlGamVSupCM=;
	b=WVqijEoV3k16AE3440lzsFlmJIh1hSxMFRubs2ehSmpXKIiHDBwp+AgGHZUsS2E4GOs1Na
	BK8CFy9ecqXq5ZxLMbs2U7+KrJPbr8zIcdpFxFiVOCqSsQA9XFL9oAkpzwst5B3w4Cc13w
	UXrOcmWP0KCx4TsdJOCkeG5Z5X04JXsCbb7vZqCMjJjyhI8znfyeivE8/9wr41HE6/hHai
	QyZMjx6ApfJdMrdHDKQ6ZYsqQmlekUAVJhIoIqSzC+h1Pmf3TUQDvNpQlrkWfl7MKJpMCT
	9ewigY/TJf96Lk+qEo/oXe38WTXQpiKjCbaoLwWZgitIN+Q/Mk6jLyV0k8C/8w==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 5/5] contributor guide: update instructions for making and sharing changes
Date: Fri, 11 Aug 2023 19:55:27 +0200
Message-Id: <20230811175527.1116864-6-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230811175527.1116864-1-michael.opdenacker@bootlin.com>
References: <20230811175527.1116864-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Aug 2023 17:55:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4150

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

- Shifting the focus to multiple changes instead of just one
- Advising to create a branch for changes
- Removing unnecessary or too verbose explanations
- Adding useful resources and examples

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/bsp-guide/bsp.rst               |   2 +-
 documentation/contributor-guide/index.rst     |   2 +-
 .../{submit-change.rst => submit-changes.rst} | 132 +++++++++---------
 documentation/dev-manual/debugging.rst        |   2 +-
 documentation/dev-manual/start.rst            |   4 +-
 documentation/dev-manual/vulnerabilities.rst  |   2 +-
 .../development-environment.rst               |   6 +-
 7 files changed, 77 insertions(+), 73 deletions(-)
 rename documentation/contributor-guide/{submit-change.rst => submit-changes.rst} (85%)

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index 52a07cfcb0..3be314bcf6 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -927,7 +927,7 @@ Yocto Project:
    -  The name and contact information for the BSP layer maintainer.
       This is the person to whom patches and questions should be sent.
       For information on how to find the right person, see the
-      :doc:`../contributor-guide/submit-change` section in the Yocto Project and
+      :doc:`../contributor-guide/submit-changes` section in the Yocto Project and
       OpenEmbedded Contributor Guide.
 
    -  Instructions on how to build the BSP using the BSP layer.
diff --git a/documentation/contributor-guide/index.rst b/documentation/contributor-guide/index.rst
index 8fa65045a3..a832169455 100644
--- a/documentation/contributor-guide/index.rst
+++ b/documentation/contributor-guide/index.rst
@@ -21,6 +21,6 @@ this.
    identify-component
    report-defect
    recipe-style-guide
-   submit-change
+   submit-changes
 
 .. include:: /boilerplate.rst
diff --git a/documentation/contributor-guide/submit-change.rst b/documentation/contributor-guide/submit-changes.rst
similarity index 85%
rename from documentation/contributor-guide/submit-change.rst
rename to documentation/contributor-guide/submit-changes.rst
index 6bee423bfb..3f6d2db96c 100644
--- a/documentation/contributor-guide/submit-change.rst
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -1,6 +1,6 @@
 .. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
-Contributing a Change to a Component
+Contributing Changes to a Component
 ************************************
 
 Contributions to the Yocto Project and OpenEmbedded are very welcome.
@@ -60,13 +60,13 @@ list you need to use depends on the location of the code you are
 changing. Each component (e.g. layer) should have a ``README`` file that
 indicates where to send the changes and which process to follow.
 
-You can send the patch to the mailing list using whichever approach you
-feel comfortable with to generate the patch. Once sent, the patch is
+You can send the patches to the mailing list using whichever approach you
+feel comfortable with to generate the patches. Once sent, the patches are
 usually reviewed by the community at large. If somebody has concerns
-with the patch, they will usually voice their concern over the mailing
-list. If a patch does not receive any negative reviews, the maintainer
-of the affected layer typically takes the patch, tests it, and then
-based on successful testing, merges the patch.
+any of the the patches, they will usually voice their concern over the mailing
+list. If patches do not receive any negative reviews, the maintainer
+of the affected layer typically takes them, tests them, and then
+based on successful testing, merges them.
 
 The "poky" repository, which is the Yocto Project's reference build
 environment, is a hybrid repository that contains several individual
@@ -74,13 +74,13 @@ pieces (e.g. BitBake, Metadata, documentation, and so forth) built using
 the combo-layer tool. The upstream location used for submitting changes
 varies by component:
 
--  *Core Metadata:* Send your patch to the
+-  *Core Metadata:* Send your patches to the
    :oe_lists:`openembedded-core </g/openembedded-core>`
    mailing list. For example, a change to anything under the ``meta`` or
    ``scripts`` directories should be sent to this mailing list.
 
 -  *BitBake:* For changes to BitBake (i.e. anything under the
-   ``bitbake`` directory), send your patch to the
+   ``bitbake`` directory), send your patches to the
    :oe_lists:`bitbake-devel </g/bitbake-devel>`
    mailing list.
 
@@ -101,13 +101,13 @@ repositories (i.e. ``yoctoproject.org``) and tools use the
 
 For additional recipes that do not fit into the core Metadata, you
 should determine which layer the recipe should go into and submit the
-change in the manner recommended by the documentation (e.g. the
+changes in the manner recommended by the documentation (e.g. the
 ``README`` file) supplied with the layer. If in doubt, please ask on the
 :yocto_lists:`yocto </g/yocto/>` general mailing list or on the
 :oe_lists:`openembedded-devel </g/openembedded-devel>` mailing list.
 
-You can also push a change upstream and request a maintainer to pull the
-change into the component's upstream repository. You do this by pushing
+You can also push changes upstream and request a maintainer to pull the
+changes into the component's upstream repository. You do this by pushing
 to a contribution repository that is upstream. See the
 ":ref:`overview-manual/development-environment:git workflows and the yocto project`"
 section in the Yocto Project Overview and Concepts Manual for additional
@@ -135,29 +135,43 @@ Other layers may have similar testing branches but there is no formal
 requirement or standard for these so please check the documentation for the
 layers you are contributing to.
 
-The following sections provide procedures for submitting a change.
+The following sections provide procedures for submitting changes.
 
 Preparing Changes for Submission
 ================================
 
-#. *Make Your Changes Locally:* Make your changes in your local Git
-   repository. You should make small, controlled, isolated changes.
-   Keeping changes small and isolated aids review, makes
-   merging/rebasing easier and keeps the change history clean should
-   anyone need to refer to it in future.
+The first thing to do is to create a new branch in your local Git repository
+for your changes, starting from the reference branch in the upstream
+repository (often called ``master``)::
 
-#. *Stage Your Changes:* Stage your changes by using the ``git add``
-   command on each file you changed.
+   $ git checkout <ref-branch>
+   $ git checkout -b my-changes
 
-#. *Commit Your Changes:* Commit the change by using the ``git commit``
+If you have completely unrelated sets of changes to submit, you should even
+create one branch for each set.
+
+Then, in each branch, you should group your changes into small, controlled and
+isolated ones. Keeping changes small and isolated aids review, makes
+merging/rebasing easier and keeps the change history clean should anyone need
+to refer to it in future.
+
+To this purpose, you should create *one Git commit per change*,
+corresponding to each of the patches you will eventually submit.
+So, for each identified change:
+
+#. *Stage Your Change:* Stage your change by using the ``git add``
+   command on each file you modified.
+
+#. *Commit Your Change:* Commit the change by using the ``git commit``
    command. Make sure your commit information follows standards by
    following these accepted conventions:
 
    -  Be sure to include a "Signed-off-by:" line in the same style as
       required by the Linux kernel. This can be done by using the
       ``git commit -s`` command. Adding this line signifies that you,
-      the submitter, have agreed to the Developer's Certificate of
-      Origin 1.1 as follows:
+      the submitter, have agreed to the `Developer's Certificate of Origin 1.1
+      <https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin>`__
+      as follows:
 
       .. code-block:: none
 
@@ -196,6 +210,14 @@ Preparing Changes for Submission
       with the recipe name (if changing a recipe), or else with the
       short form path to the file being changed.
 
+      .. note::
+
+         To find a suitable prefix for the commit summary, a good idea
+         is to look for prefixes used in previous commits touching the
+         same files or directories::
+
+            git log --oneline <paths>
+
    -  For the body of the commit message, provide detailed information
       that describes what you changed, why you made the change, and the
       approach you used. It might also be helpful if you mention how you
@@ -220,50 +242,30 @@ Preparing Changes for Submission
 
          detailed description of change
 
-Using Email to Submit a Patch
+Using Email to Submit Patches
 =============================
 
 Depending on the components changed, you need to submit the email to a
 specific mailing list. For some guidance on which mailing list to use,
-see the ":ref:`contributor-guide/submit-change:finding a suitable mailing list`"
+see the ":ref:`contributor-guide/submit-changes:finding a suitable mailing list`"
 section above.
 
-Here is the general procedure on how to submit a patch through email
-without using the scripts once the steps in
-":ref:`contributor-guide/submit-change:preparing changes for submission`"
-have been followed:
-
-#. *Format the Commit:* Format the commit into an email message. To
-   format commits, use the ``git format-patch`` command. When you
-   provide the command, you must include a revision list or a number of
-   patches as part of the command. For example, either of these two
-   commands takes your most recent single commit and formats it as an
-   email message in the current directory::
-
-      $ git format-patch -1
-
-   or ::
+Here is the general procedure on how to create and submit patches through email:
 
-      $ git format-patch HEAD~
+#. *Generate Patches for your Branch:* The ``git format-patch`` command for
+   generate patch files for each of the commits in your branch. You need
+   to pass the reference branch your branch starts from::
 
-   After the command is run, the current directory contains a numbered
-   ``.patch`` file for the commit.
+      $ git format-patch <ref-branch>
 
-   If you provide several commits as part of the command, the
-   ``git format-patch`` command produces a series of numbered files in
-   the current directory – one for each commit. If you have more than
-   one patch, you should also use the ``--cover`` option with the
-   command, which generates a cover letter as the first "patch" in the
-   series. You can then edit the cover letter to provide a description
-   for the series of patches. For information on the
-   ``git format-patch`` command, see ``GIT_FORMAT_PATCH(1)`` displayed
-   using the ``man git-format-patch`` command.
+   After the command is run, the current directory contains numbered
+   ``.patch`` files for the commits in your branch.
 
-   .. note::
-
-      If you are or will be a frequent contributor to the Yocto Project
-      or to OpenEmbedded, you might consider requesting a contrib area
-      and the necessary associated rights.
+   If you have more than one patch, you should also use the ``--cover``
+   option with the command, which generates a cover letter as the first
+   "patch" in the series. You can then edit the cover letter to provide
+   a description for the series of patches. Run ``man git-format-patch``
+   for details about this command.
 
 #. *Send the patches via email:* Send the patches to the recipients and
    relevant mailing lists by using the ``git send-email`` command.
@@ -291,9 +293,11 @@ have been followed:
    whitespace in the body of the message, which can occur when you use
    your own mail client. The command also has several options that let
    you specify recipients and perform further editing of the email
-   message. For information on how to use the ``git send-email``
-   command, see ``GIT-SEND-EMAIL(1)`` displayed using the
-   ``man git-send-email`` command.
+   message. Here's a typical usage of this command::
+
+     git send-email --to <mailing-list-address> *.patch
+
+   Run ``man git-send-email`` for more details about this command.
 
 The Yocto Project uses a `Patchwork instance <https://patchwork.yoctoproject.org/>`__
 to track the status of patches submitted to the various mailing lists and to
@@ -320,7 +324,7 @@ patch series with a link to the branch for review.
 
 Follow this procedure to push a change to an upstream "contrib" Git
 repository once the steps in
-":ref:`contributor-guide/submit-change:preparing changes for submission`"
+":ref:`contributor-guide/submit-changes:preparing changes for submission`"
 have been followed:
 
 .. note::
@@ -368,7 +372,7 @@ have been followed:
       the file.
 
    -  *Find the Mailing List to Use:* See the
-      ":ref:`contributor-guide/submit-change:finding a suitable mailing list`"
+      ":ref:`contributor-guide/submit-changes:finding a suitable mailing list`"
       section above.
 
 #. *Make a Pull Request:* Notify the maintainer or the mailing list that
@@ -491,8 +495,8 @@ follows:
       a newer version of the software which includes an upstream fix for the
       issue or when the issue has been fixed on the master branch in a way
       that introduces backwards incompatible changes. In this case follow the
-      steps in ":ref:`contributor-guide/submit-change:preparing changes for submission`" and
-      ":ref:`contributor-guide/submit-change:using email to submit a patch`"
+      steps in ":ref:`contributor-guide/submit-changes:preparing changes for submission`" and
+      ":ref:`contributor-guide/submit-changes:using email to submit patches`"
       but modify the subject header of your patch
       email to include the name of the stable branch which you are
       targetting. This can be done using the ``--subject-prefix`` argument to
diff --git a/documentation/dev-manual/debugging.rst b/documentation/dev-manual/debugging.rst
index 890578cc05..fea2cb30a1 100644
--- a/documentation/dev-manual/debugging.rst
+++ b/documentation/dev-manual/debugging.rst
@@ -879,7 +879,7 @@ The build should work without issue.
 As with all solved problems, if they originated upstream, you need to
 submit the fix for the recipe in OE-Core and upstream so that the
 problem is taken care of at its source. See the
-":doc:`../contributor-guide/submit-change`" section for more information.
+":doc:`../contributor-guide/submit-changes`" section for more information.
 
 Debugging With the GNU Project Debugger (GDB) Remotely
 ======================================================
diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index 372959d9ed..88afa27ad5 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -246,13 +246,13 @@ particular working environment and set of practices.
     -  The Yocto Project community encourages you to send patches to the
        project to fix bugs or add features. If you do submit patches,
        follow the project commit guidelines for writing good commit
-       messages. See the ":doc:`../contributor-guide/submit-change`"
+       messages. See the ":doc:`../contributor-guide/submit-changes`"
        section in the Yocto Project and OpenEmbedded Contributor Guide.
 
     -  Send changes to the core sooner than later as others are likely
        to run into the same issues. For some guidance on mailing lists
        to use, see the lists in the
-       ":ref:`contributor-guide/submit-change:finding a suitable mailing list`"
+       ":ref:`contributor-guide/submit-changes:finding a suitable mailing list`"
        section. For a description
        of the available mailing lists, see the ":ref:`resources-mailinglist`" section in
        the Yocto Project Reference Manual.
diff --git a/documentation/dev-manual/vulnerabilities.rst b/documentation/dev-manual/vulnerabilities.rst
index 297789dae6..71111bb3e2 100644
--- a/documentation/dev-manual/vulnerabilities.rst
+++ b/documentation/dev-manual/vulnerabilities.rst
@@ -22,7 +22,7 @@ issues may be impacting Poky and OE-Core. It is up to the maintainers, users,
 contributors and anyone interested in the issues to investigate and possibly fix them by
 updating software components to newer versions or by applying patches to address them.
 It is recommended to work with Poky and OE-Core upstream maintainers and submit
-patches to fix them, see ":doc:`../contributor-guide/submit-change`" for details.
+patches to fix them, see ":doc:`../contributor-guide/submit-changes`" for details.
 
 Vulnerability check at build time
 =================================
diff --git a/documentation/overview-manual/development-environment.rst b/documentation/overview-manual/development-environment.rst
index 55f34c18da..262d5cb203 100644
--- a/documentation/overview-manual/development-environment.rst
+++ b/documentation/overview-manual/development-environment.rst
@@ -264,7 +264,7 @@ push them into the "contrib" area and subsequently request that the
 maintainer include them into an upstream branch. This process is called
 "submitting a patch" or "submitting a change." For information on
 submitting patches and changes, see the
-":doc:`../contributor-guide/submit-change`" section in the Yocto Project
+":doc:`../contributor-guide/submit-changes`" section in the Yocto Project
 and OpenEmbedded Contributor Guide.
 
 In summary, there is a single point of entry for changes into the
@@ -330,7 +330,7 @@ Book <https://book.git-scm.com>`__.
    release to facilitate this workflow. You can find these scripts in
    the ``scripts`` folder of the :term:`Source Directory`. For information
    on how to use these scripts, see the
-   ":ref:`contributor-guide/submit-change:using scripts to push a change upstream and request a pull`"
+   ":ref:`contributor-guide/submit-changes:using scripts to push a change upstream and request a pull`"
    section in the Yocto Project and OpenEmbedded Contributor Guide.
 
 -  *Patch Workflow:* This workflow allows you to notify the maintainer
@@ -339,7 +339,7 @@ Book <https://book.git-scm.com>`__.
    this type of change, you format the patch and then send the email
    using the Git commands ``git format-patch`` and ``git send-email``.
    For information on how to use these scripts, see the
-   ":doc:`../contributor-guide/submit-change`" section in the Yocto Project
+   ":doc:`../contributor-guide/submit-changes`" section in the Yocto Project
    and OpenEmbedded Contributor Guide.
 
 Git
-- 
2.34.1


