Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D628C001DF
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 14:05:59 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.15872.1690985153269535626
 for <docs@lists.yoctoproject.org>;
 Wed, 02 Aug 2023 07:05:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=S/6/1SNQ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E2B3860007;
	Wed,  2 Aug 2023 14:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690985151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dX0VJ9bsPD0zYTFkBHdG6r+1yHQI4w6nJ3/9MjAPEc4=;
	b=S/6/1SNQLA+YQrPh8ymwGEPqxkbS/9/keQleRsbeoWpm2FrVNUpXl1XyNEv73fffwOwtSu
	04WHu69SZWZQA3T6LaRSASXf8ZIsZN8R5gjtNg7JdbsUduhyxXF8E9hi/tLsy179NtnnSD
	uyhLwyfp7AzGwQ0I8Snc2jZ+7UFS2UfrYhcKj3pK34FWaNtqG70BiJfhdBH5DcoLRyy8Yq
	OvkD9WFOrWccIcRdmCDroRXEx9Xc0hqkj+LaiLfVR8wP8XwNyRhKJrFrsYV8nTBRuMzugd
	jbrG0pJvrUPjxJ81tqZLuDY+rRdds3y0ZFG7QDidzuMYgvNtV56F4YAzD+NMAw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] manuals: create a dedicated "Contributor Guide" document
Date: Wed,  2 Aug 2023 16:05:48 +0200
Message-Id: <20230802140548.174180-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 02 Aug 2023 14:05:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4097

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Starting from the original contents of dev-manual/changes.rst
and from text contributed by Richard Purdie.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

---

The content will evolve according to existing content on the OE
and Yocto wikis and on new content provided by contributors.
This initiative is supported by the YP TSC.
---
 documentation/bsp-guide/bsp.rst               |   4 +-
 .../contributor-guide/identify-component.rst  |  29 +++++
 documentation/contributor-guide/index.rst     |  25 +++++
 .../submit-change.rst}                        | 102 ++++--------------
 .../contributor-guide/submit-defect.rst       |  67 ++++++++++++
 documentation/dev-manual/debugging.rst        |   7 +-
 documentation/dev-manual/index.rst            |   3 -
 documentation/dev-manual/start.rst            |   9 +-
 documentation/dev-manual/vulnerabilities.rst  |   2 +-
 documentation/index.rst                       |   1 +
 .../development-environment.rst               |  19 ++--
 documentation/ref-manual/resources.rst        |   7 +-
 .../ref-manual/system-requirements.rst        |   4 +-
 13 files changed, 165 insertions(+), 114 deletions(-)
 create mode 100644 documentation/contributor-guide/identify-component.rst
 create mode 100644 documentation/contributor-guide/index.rst
 rename documentation/{dev-manual/changes.rst => contributor-guide/submit-change.rst} (85%)
 create mode 100644 documentation/contributor-guide/submit-defect.rst

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index 4d64c65d91..52a07cfcb0 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -927,8 +927,8 @@ Yocto Project:
    -  The name and contact information for the BSP layer maintainer.
       This is the person to whom patches and questions should be sent.
       For information on how to find the right person, see the
-      ":ref:`dev-manual/changes:submitting a change to the yocto project`"
-      section in the Yocto Project Development Tasks Manual.
+      :doc:`../contributor-guide/submit-change` section in the Yocto Project and
+      OpenEmbedded Contributor Guide.
 
    -  Instructions on how to build the BSP using the BSP layer.
 
diff --git a/documentation/contributor-guide/identify-component.rst b/documentation/contributor-guide/identify-component.rst
new file mode 100644
index 0000000000..ba7c998888
--- /dev/null
+++ b/documentation/contributor-guide/identify-component.rst
@@ -0,0 +1,29 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Identify the component
+**********************
+
+The Yocto Project and OpenEmbedded ecosystem is built of :term:`layers <Layer>`
+so the first step is to identify the component where the issue likely lies.
+For example, if you have a hardware issue, it is likely related to the BSP
+you are using and the best place to seek advice would be from the BSP provider
+or :term:`layer`. If the issue is a build/configuration one and a distro is in
+use, they would likely be the first place to ask questions. If the issue is a
+generic one and/or in the core classes or metadata, the core layer or BitBake
+might be the appropriate component.
+
+Each metadata layer being used should contain a ``README`` file and that should
+explain where to report issues, where to send changes and how to contact the
+maintainers.
+
+If the issue is in the core metadata layer (OpenEmbedded-Core) or in BitBake,
+issues can be reported in the :yocto_bugs:`Yocto Project Bugzilla <>`. The
+:yocto_lists:`yocto </g/yocto>` mailing list is a general “catch-all” location
+where questions can be sent if you can’t work out where something should go.
+
+:term:`Poky` is a commonly used “combination” repository where multiple
+components have been combined (``bitbake``, ``openembedded-core``,
+``meta-yocto`` and ``yocto-docs``). Patches should be submitted against
+the appropriate individual component rather than :term:`Poky` itself as
+detailed in the appropriate ``README`` file.
+
diff --git a/documentation/contributor-guide/index.rst b/documentation/contributor-guide/index.rst
new file mode 100644
index 0000000000..d723854843
--- /dev/null
+++ b/documentation/contributor-guide/index.rst
@@ -0,0 +1,25 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+================================================
+Yocto Project and OpenEmbedded Contributor Guide
+================================================
+
+The Yocto Project and OpenEmbedded are open-source, community-based projects so
+contributions are very welcome, it is how the code evolves and everyone can
+effect change. Contributions take different forms, if you have a fix for an
+issue you’ve run into, a patch is the most appropriate way to contribute it.
+If you run into an issue but don’t have a solution, opening a defect in
+:yocto_bugs:`Bugzilla <>` or asking questions on the mailing lists might be
+more appropriate. This guide intends to point you in the right direction to
+this.
+
+
+.. toctree::
+   :caption: Table of Contents
+   :numbered:
+
+   identify-component
+   submit-defect
+   submit-change
+
+.. include:: /boilerplate.rst
diff --git a/documentation/dev-manual/changes.rst b/documentation/contributor-guide/submit-change.rst
similarity index 85%
rename from documentation/dev-manual/changes.rst
rename to documentation/contributor-guide/submit-change.rst
index 9db6ce010c..ba56e5986d 100644
--- a/documentation/dev-manual/changes.rst
+++ b/documentation/contributor-guide/submit-change.rst
@@ -1,79 +1,16 @@
 .. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
-Making Changes to the Yocto Project
-***********************************
-
-Because the Yocto Project is an open-source, community-based project,
-you can effect changes to the project. This section presents procedures
-that show you how to submit a defect against the project and how to
-submit a change.
-
-Submitting a Defect Against the Yocto Project
-=============================================
-
-Use the Yocto Project implementation of
-`Bugzilla <https://www.bugzilla.org/about/>`__ to submit a defect (bug)
-against the Yocto Project. For additional information on this
-implementation of Bugzilla see the ":ref:`Yocto Project
-Bugzilla <resources-bugtracker>`" section in the
-Yocto Project Reference Manual. For more detail on any of the following
-steps, see the Yocto Project
-:yocto_wiki:`Bugzilla wiki page </Bugzilla_Configuration_and_Bug_Tracking>`.
-
-Use the following general steps to submit a bug:
-
-#.  Open the Yocto Project implementation of :yocto_bugs:`Bugzilla <>`.
-
-#.  Click "File a Bug" to enter a new bug.
-
-#.  Choose the appropriate "Classification", "Product", and "Component"
-    for which the bug was found. Bugs for the Yocto Project fall into
-    one of several classifications, which in turn break down into
-    several products and components. For example, for a bug against the
-    ``meta-intel`` layer, you would choose "Build System, Metadata &
-    Runtime", "BSPs", and "bsps-meta-intel", respectively.
-
-#.  Choose the "Version" of the Yocto Project for which you found the
-    bug (e.g. &DISTRO;).
-
-#.  Determine and select the "Severity" of the bug. The severity
-    indicates how the bug impacted your work.
-
-#.  Choose the "Hardware" that the bug impacts.
-
-#.  Choose the "Architecture" that the bug impacts.
-
-#.  Choose a "Documentation change" item for the bug. Fixing a bug might
-    or might not affect the Yocto Project documentation. If you are
-    unsure of the impact to the documentation, select "Don't Know".
-
-#.  Provide a brief "Summary" of the bug. Try to limit your summary to
-    just a line or two and be sure to capture the essence of the bug.
-
-#.  Provide a detailed "Description" of the bug. You should provide as
-    much detail as you can about the context, behavior, output, and so
-    forth that surrounds the bug. You can even attach supporting files
-    for output from logs by using the "Add an attachment" button.
-
-#.  Click the "Submit Bug" button submit the bug. A new Bugzilla number
-    is assigned to the bug and the defect is logged in the bug tracking
-    system.
-
-Once you file a bug, the bug is processed by the Yocto Project Bug
-Triage Team and further details concerning the bug are assigned (e.g.
-priority and owner). You are the "Submitter" of the bug and any further
-categorization, progress, or comments on the bug result in Bugzilla
-sending you an automated email concerning the particular change or
-progress to the bug.
-
-Submitting a Change to the Yocto Project
-========================================
+Contributing a Change to a Component
+************************************
 
 Contributions to the Yocto Project and OpenEmbedded are very welcome.
 Because the system is extremely configurable and flexible, we recognize
 that developers will want to extend, configure or optimize it for their
 specific uses.
 
+Finding a Suitable Mailing List
+===============================
+
 The Yocto Project uses a mailing list and a patch-based workflow that is
 similar to the Linux kernel but contains important differences. In
 general, there is a mailing list through which you can submit patches. You
@@ -160,7 +97,7 @@ layers you are contributing to.
 The following sections provide procedures for submitting a change.
 
 Preparing Changes for Submission
---------------------------------
+================================
 
 #. *Make Your Changes Locally:* Make your changes in your local Git
    repository. You should make small, controlled, isolated changes.
@@ -243,19 +180,19 @@ Preparing Changes for Submission
          detailed description of change
 
 Using Email to Submit a Patch
------------------------------
+=============================
 
 Depending on the components changed, you need to submit the email to a
 specific mailing list. For some guidance on which mailing list to use,
-see the
-:ref:`list <dev-manual/changes:submitting a change to the yocto project>`
-at the beginning of this section. For a description of all the available
+see the ":ref:`contributor-guide/submit-change:finding a suitable mailing list`"
+section above. For a description of all the available
 mailing lists, see the ":ref:`Mailing Lists <resources-mailinglist>`" section in the
 Yocto Project Reference Manual.
 
 Here is the general procedure on how to submit a patch through email
 without using the scripts once the steps in
-:ref:`dev-manual/changes:preparing changes for submission` have been followed:
+":ref:`contributor-guide/submit-change:preparing changes for submission`"
+have been followed:
 
 #. *Format the Commit:* Format the commit into an email message. To
    format commits, use the ``git format-patch`` command. When you
@@ -333,7 +270,7 @@ reduce the burden of patch review on maintainers.
    has been idle for a while with no feedback.
 
 Using Scripts to Push a Change Upstream and Request a Pull
-----------------------------------------------------------
+==========================================================
 
 For larger patch series it is preferable to send a pull request which not
 only includes the patch but also a pointer to a branch that can be pulled
@@ -343,8 +280,9 @@ and ``send-pull-request`` scripts from openembedded-core to create and send a
 patch series with a link to the branch for review.
 
 Follow this procedure to push a change to an upstream "contrib" Git
-repository once the steps in :ref:`dev-manual/changes:preparing changes for submission` have
-been followed:
+repository once the steps in
+":ref:`contributor-guide/submit-change:preparing changes for submission`"
+have been followed:
 
 .. note::
 
@@ -442,7 +380,7 @@ been followed:
               $ poky/scripts/send-pull-request -h
 
 Responding to Patch Review
---------------------------
+==========================
 
 You may get feedback on your submitted patches from other community members
 or from the automated patchtest service. If issues are identified in your
@@ -464,7 +402,7 @@ please don't just edit the patch file written out by ``git format-patch`` and
 resend it.
 
 Submitting Changes to Stable Release Branches
----------------------------------------------
+=============================================
 
 The process for proposing changes to a Yocto Project stable branch differs
 from the steps described above. Changes to a stable branch must address
@@ -515,11 +453,11 @@ follows:
       a newer version of the software which includes an upstream fix for the
       issue or when the issue has been fixed on the master branch in a way
       that introduces backwards incompatible changes. In this case follow the
-      steps in :ref:`dev-manual/changes:preparing changes for submission` and
-      :ref:`dev-manual/changes:using email to submit a patch` but modify the subject header of your patch
+      steps in ":ref:`contributor-guide/submit-change:preparing changes for submission`" and
+      ":ref:`contributor-guide/submit-change:using email to submit a patch`"
+      but modify the subject header of your patch
       email to include the name of the stable branch which you are
       targetting. This can be done using the ``--subject-prefix`` argument to
       ``git format-patch``, for example to submit a patch to the dunfell
       branch use
       ``git format-patch --subject-prefix='&DISTRO_NAME_NO_CAP_MINUS_ONE;][PATCH' ...``.
-
diff --git a/documentation/contributor-guide/submit-defect.rst b/documentation/contributor-guide/submit-defect.rst
new file mode 100644
index 0000000000..527ffb2dc0
--- /dev/null
+++ b/documentation/contributor-guide/submit-defect.rst
@@ -0,0 +1,67 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Submitting a Defect Against the Yocto Project and OpenEmbedded
+**************************************************************
+
+You can use the Yocto Project instance of
+`Bugzilla <https://www.bugzilla.org/about/>`__ to submit a defect (bug)
+against BitBake, OpenEmbedded-Core, against any other Yocto Project component
+or for tool issues. For additional information on this implementation of
+Bugzilla see the ":ref:`Yocto Project Bugzilla <resources-bugtracker>`" section
+in the Yocto Project Reference Manual. For more detail on any of the following
+steps, see the Yocto Project
+:yocto_wiki:`Bugzilla wiki page </Bugzilla_Configuration_and_Bug_Tracking>`.
+
+Use the following general steps to submit a bug:
+
+#.  Open the Yocto Project implementation of :yocto_bugs:`Bugzilla <>`.
+
+#.  Click "File a Bug" to enter a new bug.
+
+#.  Choose the appropriate "Classification", "Product", and "Component"
+    for which the bug was found. Bugs for the Yocto Project fall into
+    one of several classifications, which in turn break down into
+    several products and components. For example, for a bug against the
+    ``meta-intel`` layer, you would choose "Build System, Metadata &
+    Runtime", "BSPs", and "bsps-meta-intel", respectively.
+
+#.  Choose the "Version" of the Yocto Project for which you found the
+    bug (e.g. &DISTRO;).
+
+#.  Determine and select the "Severity" of the bug. The severity
+    indicates how the bug impacted your work.
+
+#.  Choose the "Hardware" that the bug impacts.
+
+#.  Choose the "Architecture" that the bug impacts.
+
+#.  Choose a "Documentation change" item for the bug. Fixing a bug might
+    or might not affect the Yocto Project documentation. If you are
+    unsure of the impact to the documentation, select "Don't Know".
+
+#.  Provide a brief "Summary" of the bug. Try to limit your summary to
+    just a line or two and be sure to capture the essence of the bug.
+
+#.  Provide a detailed "Description" of the bug. You should provide as
+    much detail as you can about the context, behavior, output, and so
+    forth that surrounds the bug. You can even attach supporting files
+    for output from logs by using the "Add an attachment" button.
+
+#.  Click the "Submit Bug" button submit the bug. A new Bugzilla number
+    is assigned to the bug and the defect is logged in the bug tracking
+    system.
+
+Once you file a bug, the bug is processed by the Yocto Project Bug
+Triage Team and further details concerning the bug are assigned (e.g.
+priority and owner). You are the "Submitter" of the bug and any further
+categorization, progress, or comments on the bug result in Bugzilla
+sending you an automated email concerning the particular change or
+progress to the bug.
+
+There are no guarantees about if or when a bug might be worked on since an
+open-source project has no dedicated engineering resources. However, the
+project does have a good track record of resolving common issues over the
+medium and long term. We do encourage people to file bugs so issues are
+at least known about. It helps other users when they find somebody having
+the same issue as they do, and an issue that is unknown is much less likely
+to ever be fixed!
diff --git a/documentation/dev-manual/debugging.rst b/documentation/dev-manual/debugging.rst
index 3c5609cef5..3a8d5080ce 100644
--- a/documentation/dev-manual/debugging.rst
+++ b/documentation/dev-manual/debugging.rst
@@ -879,8 +879,7 @@ The build should work without issue.
 As with all solved problems, if they originated upstream, you need to
 submit the fix for the recipe in OE-Core and upstream so that the
 problem is taken care of at its source. See the
-":ref:`dev-manual/changes:submitting a change to the yocto project`"
-section for more information.
+":doc:`../contributor-guide/submit-change`" section for more information.
 
 Debugging With the GNU Project Debugger (GDB) Remotely
 ======================================================
@@ -1236,9 +1235,7 @@ Here are some other tips that you might find useful:
    :yocto_bugs:`Bugzilla <>`. For information on
    how to submit a bug against the Yocto Project, see the Yocto Project
    Bugzilla :yocto_wiki:`wiki page </Bugzilla_Configuration_and_Bug_Tracking>`
-   and the
-   ":ref:`dev-manual/changes:submitting a defect against the yocto project`"
-   section.
+   and the ":doc:`../contributor-guide/submit-defect`" section.
 
    .. note::
 
diff --git a/documentation/dev-manual/index.rst b/documentation/dev-manual/index.rst
index b0bb5576ad..3106b90a45 100644
--- a/documentation/dev-manual/index.rst
+++ b/documentation/dev-manual/index.rst
@@ -4,8 +4,6 @@
 Yocto Project Development Tasks Manual
 ======================================
 
-|
-
 .. toctree::
    :caption: Table of Contents
    :numbered:
@@ -43,7 +41,6 @@ Yocto Project Development Tasks Manual
    build-quality
    runtime-testing
    debugging
-   changes
    licenses
    vulnerabilities
    sbom
diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index 4881481044..372959d9ed 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -246,14 +246,13 @@ particular working environment and set of practices.
     -  The Yocto Project community encourages you to send patches to the
        project to fix bugs or add features. If you do submit patches,
        follow the project commit guidelines for writing good commit
-       messages. See the
-       ":ref:`dev-manual/changes:submitting a change to the yocto project`"
-       section.
+       messages. See the ":doc:`../contributor-guide/submit-change`"
+       section in the Yocto Project and OpenEmbedded Contributor Guide.
 
     -  Send changes to the core sooner than later as others are likely
        to run into the same issues. For some guidance on mailing lists
-       to use, see the list in the
-       ":ref:`dev-manual/changes:submitting a change to the yocto project`"
+       to use, see the lists in the
+       ":ref:`contributor-guide/submit-change:finding a suitable mailing list`"
        section. For a description
        of the available mailing lists, see the ":ref:`resources-mailinglist`" section in
        the Yocto Project Reference Manual.
diff --git a/documentation/dev-manual/vulnerabilities.rst b/documentation/dev-manual/vulnerabilities.rst
index 6d87d02ecb..297789dae6 100644
--- a/documentation/dev-manual/vulnerabilities.rst
+++ b/documentation/dev-manual/vulnerabilities.rst
@@ -22,7 +22,7 @@ issues may be impacting Poky and OE-Core. It is up to the maintainers, users,
 contributors and anyone interested in the issues to investigate and possibly fix them by
 updating software components to newer versions or by applying patches to address them.
 It is recommended to work with Poky and OE-Core upstream maintainers and submit
-patches to fix them, see ":ref:`dev-manual/changes:submitting a change to the yocto project`" for details.
+patches to fix them, see ":doc:`../contributor-guide/submit-change`" for details.
 
 Vulnerability check at build time
 =================================
diff --git a/documentation/index.rst b/documentation/index.rst
index 6335c707e0..4d0231503d 100644
--- a/documentation/index.rst
+++ b/documentation/index.rst
@@ -34,6 +34,7 @@ Welcome to the Yocto Project Documentation
    Application Development and the Extensible SDK (eSDK) <sdk-manual/index>
    Toaster Manual <toaster-manual/index>
    Test Environment Manual <test-manual/index>
+   Contributor Guide <contributor-guide/index>
    bitbake
 
 .. toctree::
diff --git a/documentation/overview-manual/development-environment.rst b/documentation/overview-manual/development-environment.rst
index 6139e7a412..55f34c18da 100644
--- a/documentation/overview-manual/development-environment.rst
+++ b/documentation/overview-manual/development-environment.rst
@@ -232,8 +232,8 @@ and so forth.
 
    For information on finding out who is responsible for (maintains) a
    particular area of code in the Yocto Project, see the
-   ":ref:`dev-manual/changes:submitting a change to the yocto project`"
-   section of the Yocto Project Development Tasks Manual.
+   ":doc:`../contributor-guide/identify-component`"
+   section of the Yocto Project and OpenEmbedded Contributor Guide.
 
 The Yocto Project ``poky`` Git repository also has an upstream
 contribution Git repository named ``poky-contrib``. You can see all the
@@ -264,8 +264,8 @@ push them into the "contrib" area and subsequently request that the
 maintainer include them into an upstream branch. This process is called
 "submitting a patch" or "submitting a change." For information on
 submitting patches and changes, see the
-":ref:`dev-manual/changes:submitting a change to the yocto project`"
-section in the Yocto Project Development Tasks Manual.
+":doc:`../contributor-guide/submit-change`" section in the Yocto Project
+and OpenEmbedded Contributor Guide.
 
 In summary, there is a single point of entry for changes into the
 development branch of the Git repository, which is controlled by the
@@ -328,11 +328,10 @@ Book <https://book.git-scm.com>`__.
    software on which to develop. The Yocto Project has two scripts named
    ``create-pull-request`` and ``send-pull-request`` that ship with the
    release to facilitate this workflow. You can find these scripts in
-   the ``scripts`` folder of the
-   :term:`Source Directory`. For information
+   the ``scripts`` folder of the :term:`Source Directory`. For information
    on how to use these scripts, see the
-   ":ref:`dev-manual/changes:using scripts to push a change upstream and request a pull`"
-   section in the Yocto Project Development Tasks Manual.
+   ":ref:`contributor-guide/submit-change:using scripts to push a change upstream and request a pull`"
+   section in the Yocto Project and OpenEmbedded Contributor Guide.
 
 -  *Patch Workflow:* This workflow allows you to notify the maintainer
    through an email that you have a change (or patch) you would like
@@ -340,8 +339,8 @@ Book <https://book.git-scm.com>`__.
    this type of change, you format the patch and then send the email
    using the Git commands ``git format-patch`` and ``git send-email``.
    For information on how to use these scripts, see the
-   ":ref:`dev-manual/changes:submitting a change to the yocto project`"
-   section in the Yocto Project Development Tasks Manual.
+   ":doc:`../contributor-guide/submit-change`" section in the Yocto Project
+   and OpenEmbedded Contributor Guide.
 
 Git
 ===
diff --git a/documentation/ref-manual/resources.rst b/documentation/ref-manual/resources.rst
index d2344e39a0..324d1fad10 100644
--- a/documentation/ref-manual/resources.rst
+++ b/documentation/ref-manual/resources.rst
@@ -23,8 +23,7 @@ The Yocto Project gladly accepts contributions. You can submit changes
 to the project either by creating and sending pull requests, or by
 submitting patches through email. For information on how to do both as
 well as information on how to identify the maintainer for each area of
-code, see the ":ref:`dev-manual/changes:submitting a change to the yocto project`" section in the
-Yocto Project Development Tasks Manual.
+code, see the :doc:`../contributor-guide/index`.
 
 .. _resources-bugtracker:
 
@@ -46,8 +45,8 @@ your expectations).
 For a general procedure and guidelines on how to use Bugzilla to submit a bug
 against the Yocto Project, see the following:
 
--  The ":ref:`dev-manual/changes:submitting a defect against the yocto project`"
-   section in the Yocto Project Development Tasks Manual.
+-  The ":doc:`../contributor-guide/submit-defect`"
+   section in the Yocto Project and OpenEmbedded Contributor Guide.
 
 -  The Yocto Project :yocto_wiki:`Bugzilla wiki page </Bugzilla_Configuration_and_Bug_Tracking>`
 
diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index d6e8b4583c..3c2f979a6d 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -114,8 +114,8 @@ Currently, the Yocto Project is supported on the following distributions:
       interested in hearing about your experience. For information on
       how to submit a bug, see the Yocto Project
       :yocto_wiki:`Bugzilla wiki page </Bugzilla_Configuration_and_Bug_Tracking>`
-      and the ":ref:`dev-manual/changes:submitting a defect against the yocto project`"
-      section in the Yocto Project Development Tasks Manual.
+      and the ":doc:`../contributor-guide/submit-defect`"
+      section in the Yocto Project and OpenEmbedded Contributor Guide.
 
 
 Required Packages for the Build Host
-- 
2.34.1


