Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34952C88CB9
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 17:10:50 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.1.1692378640817453021
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Aug 2023 10:10:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=a+J5Up80;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 194F2E0004;
	Fri, 18 Aug 2023 17:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692378637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1QaLzL9pGIT6c0wYBhBlXq3fU6FWZA+HuSCTp1Kgb/0=;
	b=a+J5Up80+9q3rpvd0oP6hIiVIk4aqVoKRnPfuzsvOe+Aw57ZH6z5+mYrCmQxGx2giFqyoi
	/m6/IXDx5VQRGwc1tAsNjNgWGpMIdV2vlhG1PPVlRcOmQdWpcN6xtEoPR4yf/nO1TXDGaX
	smCWov0yMWDjVYnEMslFltGDdGHN5THjJHPVnesLvS2IAlMIVMl9gAR9mRBl9xi3vDGcfQ
	p+VlQ/K4+aXjDdcdgEWkk/RjonUefJ69U0eFQS1ayKKHhLrJm9J1WdCcR8ayMevHbe1ygE
	oQEhCAXvoSPXyhqlDFhcj0/AhCR61I5EUPcOhJmISwplHvA98Har6c+8hr4uBg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Jon.Mason@arm.com,
	JPEWhacker@gmail.com,
	Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 07/10] contributor-guide: submit-changes: reorganize and develop sections
Date: Fri, 18 Aug 2023 19:10:02 +0200
Message-Id: <20230818171005.92381-8-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230818171005.92381-1-michael.opdenacker@bootlin.com>
References: <20230818171005.92381-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Aug 2023 17:10:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4172

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

In particular, develop the sections about sending patches.
Reorder sections for a more logical flow.
Remove unnecessary or duplicate details too.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../contributor-guide/submit-changes.rst      | 402 ++++++++++++------
 1 file changed, 262 insertions(+), 140 deletions(-)

diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
index aeef2cc90a..3098a76a6c 100644
--- a/documentation/contributor-guide/submit-changes.rst
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -48,95 +48,6 @@ test user contributions before they hit the mailing lists and also at better
 documenting how to use such workflows since we recognise that whilst this was
 common knowledge a decade ago, it might not be as familiar now.
 
-Finding a Suitable Mailing List
-===============================
-
-The Yocto Project and OpenEmbedded use a mailing list and a patch-based
-workflow that is similar to the Linux kernel but contains important
-differences. In general, there is a mailing list through which you can submit
-patches. You should send patches to the appropriate mailing list so that they
-can be reviewed and merged by the appropriate maintainer. The specific mailing
-list you need to use depends on the location of the code you are
-changing. Each component (e.g. layer) should have a ``README`` file that
-indicates where to send the changes and which process to follow.
-
-You can send the patches to the mailing list using whichever approach you
-feel comfortable with to generate the patches. Once sent, the patches are
-usually reviewed by the community at large. If somebody has concerns
-any of the the patches, they will usually voice their concern over the mailing
-list. If patches do not receive any negative reviews, the maintainer
-of the affected layer typically takes them, tests them, and then
-based on successful testing, merges them.
-
-The "poky" repository, which is the Yocto Project's reference build
-environment, is a hybrid repository that contains several individual
-pieces (e.g. BitBake, Metadata, documentation, and so forth) built using
-the combo-layer tool. The upstream location used for submitting changes
-varies by component:
-
--  *Core Metadata:* Send your patches to the
-   :oe_lists:`openembedded-core </g/openembedded-core>`
-   mailing list. For example, a change to anything under the ``meta`` or
-   ``scripts`` directories should be sent to this mailing list.
-
--  *BitBake:* For changes to BitBake (i.e. anything under the
-   ``bitbake`` directory), send your patches to the
-   :oe_lists:`bitbake-devel </g/bitbake-devel>`
-   mailing list.
-
--  *"meta-\*" trees:* These trees contain Metadata. Use the
-   :yocto_lists:`poky </g/poky>` mailing list.
-
--  *Documentation*: For changes to the Yocto Project documentation, use the
-   :yocto_lists:`docs </g/docs>` mailing list.
-
-For changes to other layers hosted in the Yocto Project source
-repositories (i.e. ``yoctoproject.org``) and tools use the
-:yocto_lists:`yocto </g/yocto/>` general mailing list.
-
-.. note::
-
-   Sometimes a layer's documentation specifies to use a particular
-   mailing list. If so, use that list.
-
-For additional recipes that do not fit into the core Metadata, you
-should determine which layer the recipe should go into and submit the
-changes in the manner recommended by the documentation (e.g. the
-``README`` file) supplied with the layer. If in doubt, please ask on the
-:yocto_lists:`yocto </g/yocto/>` general mailing list or on the
-:oe_lists:`openembedded-devel </g/openembedded-devel>` mailing list.
-
-You can also push changes upstream and request a maintainer to pull the
-changes into the component's upstream repository. You do this by pushing
-to a contribution repository that is upstream. See the
-":ref:`overview-manual/development-environment:git workflows and the yocto project`"
-section in the Yocto Project Overview and Concepts Manual for additional
-concepts on working in the Yocto Project development environment.
-
-Maintainers commonly use ``-next`` branches to test submissions prior to
-merging patches. Thus, you can get an idea of the status of a patch based on
-whether the patch has been merged into one of these branches. The commonly
-used testing branches for OpenEmbedded-Core are as follows:
-
--  *openembedded-core "master-next" branch:* This branch is part of the
-   :oe_git:`openembedded-core </openembedded-core/>` repository and contains
-   proposed changes to the core metadata.
-
--  *poky "master-next" branch:* This branch is part of the
-   :yocto_git:`poky </poky/>` repository and combines proposed
-   changes to BitBake, the core metadata and the poky distro.
-
-Similarly, stable branches maintained by the project may have corresponding
-``-next`` branches which collect proposed changes. For example,
-``&DISTRO_NAME_NO_CAP;-next`` and ``&DISTRO_NAME_NO_CAP_MINUS_ONE;-next``
-branches in both the "openembdedded-core" and "poky" repositories.
-
-Other layers may have similar testing branches but there is no formal
-requirement or standard for these so please check the documentation for the
-layers you are contributing to.
-
-The following sections provide procedures for submitting changes.
-
 Preparing Changes for Submission
 ================================
 
@@ -279,6 +190,32 @@ in the Linux kernel documentation if needed.
 
          detailed description of change
 
+#. *Crediting contributors:* By using the ``git commit --amend`` command,
+   you can add some tags to the commit description to credit other contributors
+   to the change:
+
+   -  ``Reported-by``: name and email of a person reporting a bug
+      that your commit is trying to fix. This is a good practice
+      to encourage people to go on reporting bugs and let them
+      know that their reports are taken into account.
+
+   -  ``Suggested-by``: name and email of a person to credit for the
+      idea of making the change.
+
+   -  ``Tested-by``, ``Reviewed-by``: name and email for people having
+      tested your changes or reviewed their code. These fields are
+      usually added by the maintainer accepting a patch, or by
+      yourself if you submitted your patches to early reviewers,
+      or are submitting an unmodified patch again as part of a
+      new iteration of your patch series.
+
+   -  ``CC:`` Name and email of people you want to send a copy
+      of your changes to. This field will be used by ``git send-email``.
+
+   See `more guidance about using such tags
+   <https://www.kernel.org/doc/html/latest/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes>`__
+   in the Linux kernel documentation.
+
 Creating Patches
 ================
 
@@ -335,7 +272,7 @@ Here is the general procedure on how to create patches to be sent through email:
    include the cover letter patch too.
 
    If necessary, rework your commits as described in
-   ":ref:`contributor-guide/submit-changes:take patch review into account`".
+   ":ref:`contributor-guide/submit-changes:taking patch review into account`".
 
 Sending the Patches via Email
 =============================
@@ -385,43 +322,156 @@ in the Linux kernel sources.
 
 If you use such clients, just include the patch in the body of your email.
 
-Subscribing to Mailing Lists
-----------------------------
+Finding a Suitable Mailing List
+-------------------------------
+
+You should send patches to the appropriate mailing list so that they can be
+reviewed by the right contributors and merged by the appropriate maintainer.
+The specific mailing list you need to use depends on the location of the code
+you are changing. Each component (e.g. layer) should have a ``README`` file
+that indicates where to send the changes and which process to follow.
+
+If people have concerns with any of the patches, they will usually voice
+their concern over the mailing list. If patches do not receive any negative
+reviews, the maintainer of the affected layer typically takes them, tests them,
+and then based on successful testing, merges them.
+
+The "poky" repository, which is the Yocto Project's reference build
+environment, is a hybrid repository that contains several individual
+pieces (e.g. BitBake, Metadata, documentation, and so forth) built using
+the combo-layer tool. The upstream location used for submitting changes
+varies by component:
+
+-  *Core Metadata:* Send your patches to the
+   :oe_lists:`openembedded-core </g/openembedded-core>`
+   mailing list. For example, a change to anything under the ``meta`` or
+   ``scripts`` directories should be sent to this mailing list.
+
+-  *BitBake:* For changes to BitBake (i.e. anything under the
+   ``bitbake`` directory), send your patches to the
+   :oe_lists:`bitbake-devel </g/bitbake-devel>`
+   mailing list.
+
+-  *"meta-\*" trees:* These trees contain Metadata. Use the
+   :yocto_lists:`poky </g/poky>` mailing list.
+
+-  *Documentation*: For changes to the Yocto Project documentation, use the
+   :yocto_lists:`docs </g/docs>` mailing list.
+
+For changes to other layers hosted in the Yocto Project source
+repositories (i.e. ``yoctoproject.org``) and tools use the
+:yocto_lists:`yocto </g/yocto/>` general mailing list.
+
+.. note::
+
+   Sometimes a layer's documentation specifies to use a particular
+   mailing list. If so, use that list.
+
+For additional recipes that do not fit into the core Metadata, you
+should determine which layer the recipe should go into and submit the
+changes in the manner recommended by the documentation (e.g. by the
+``README`` file) supplied with the layer. If in doubt, please ask on the
+:yocto_lists:`yocto </g/yocto/>` general mailing list or on the
+:oe_lists:`openembedded-devel </g/openembedded-devel>` mailing list.
+
+Subscribing to the Mailing List
+-------------------------------
+
+After identifying the right mailing list to use, you will have to subscribe to
+it if you haven't done it yet.
+
+If you attempt to send patches to a list you haven't subscribed to, your email
+will be returned as undelivered.
+
+However, if you don't want to be receive all the messages sent to a mailing list,
+you can set your subscription to "no email". You will still be a subscriber able
+to send messages, but you won't receive any e-mail. If people reply to your message,
+their e-mail clients will default to including your email address in the
+conversation anyway.
+
+Anyway, you'll also be able to access the new messages on mailing list archives,
+either through a web browser, or for the lists archived on https://lore.kernelorg,
+through an individual newsgroup feed or a git repository.
 
 Sending Patches via Email
 -------------------------
 
-Depending on the components changed, you need to submit the email to a
-specific mailing list. For some guidance on which mailing list to use,
-see the ":ref:`contributor-guide/submit-changes:finding a suitable mailing list`"
-section above.
+At this stage, you are ready to send your patches via email. Here's the
+typical usage of ``git send-email``::
 
-#. *Send the patches via email:* Send the patches to the recipients and
-   relevant mailing lists by using the ``git send-email`` command.
+   git send-email --to <mailing-list-address> *.patch
 
-   The ``git send-email`` command is the preferred method for sending
-   your patches using email since there is no risk of compromising
-   whitespace in the body of the message, which can occur when you use
-   your own mail client. The command also has several options that let
-   you specify recipients and perform further editing of the email
-   message. Here's a typical usage of this command::
+Then, review each subject line and list of recipients carefully, and then
+and then allow the command to send each message.
 
-     git send-email --to <mailing-list-address> *.patch
+You will see that ``git send-email`` will automatically copy the people listed
+in any commit tags such as ``Signed-off-by`` or ``Reported-by``.
 
-   Run ``man git-send-email`` for more details about this command.
+In case you are sending patches for :oe_git:`meta-openembedded </meta-openembedded/>`
+or any layer other than :oe_git:`openembedded-core </openembedded-core/>`,
+please add the appropriate prefix so that it is clear which layer the patch is intended
+to be applied to::
 
-The Yocto Project uses a `Patchwork instance <https://patchwork.yoctoproject.org/>`__
-to track the status of patches submitted to the various mailing lists and to
-support automated patch testing. Each submitted patch is checked for common
-mistakes and deviations from the expected patch format and submitters are
-notified by ``patchtest`` if such mistakes are found. This process helps to
-reduce the burden of patch review on maintainers.
+   git send-email --subject-prefix="meta-oe][PATCH" ...
 
 .. note::
 
-   This system is imperfect and changes can sometimes get lost in the flow.
-   Asking about the status of a patch or change is reasonable if the change
-   has been idle for a while with no feedback.
+   It is actually possible to send patches without generating them
+   first. However, make sure you have reviewed your changes carefully
+   because ``git send-email`` will just show you the title lines of
+   each patch.
+
+   Here's a command you can use if you just have one patch in your
+   branch::
+
+      git send-email --to <mailing-list-address> -1
+
+   If you have multiple patches and a cover letter, you can send
+   patches for all the commits between the reference branch
+   and the tip of your branch::
+
+      git send-email --cover-letter --cover-from-description=auto --to <mailing-list-address> -M <ref-branch>
+
+See the `git send-email manual page <https://git-scm.com/docs/git-send-email>`__
+for details.
+
+Troubleshooting Email Issues
+----------------------------
+
+Fixing your From identity
+~~~~~~~~~~~~~~~~~~~~~~~~~
+
+We have a frequent issue with contributors whose patches are received through
+a ``From`` field which doesn't match the ``Signed-off-by`` information. Here is
+a typical example for people sending from a domain name with :wikipedia:`DMARC`::
+
+   From: "Linus Torvalds via lists.openembedded.org <linus.torvalds=kernel.org@lists.openembedded.org>"
+
+This ``From`` field is used by ``git am`` to recreate commits with the right
+author name. The following will ensure that your e-mails have an additional
+``From`` field at the beginning of the Email body, and therefore that
+maintainers accepting your patches don't have to fix commit author information
+manually::
+
+   git config --global sendemail.from "linus.torvalds@kernel.org"
+
+The ``sendemail.from`` should match your ``user.email`` setting,
+which appears in the ``Signed-off-by`` line of your commits.
+
+Streamlining git send-email usage
+---------------------------------
+
+If you want to save time and not be forced to remember the right options to use
+with ``git send-email``, you can use Git configuration settings.
+
+-  To set the right mailing list address for a given repository::
+
+      git config --local sendemail.to openembedded-devel@lists.openembedded.org
+
+-  If the mailing list requires a subject prefix for the layer
+   (this only works when the repository only contains one layer)::
+
+      git config --local format.subjectprefix "meta-something][PATCH"
 
 Using Scripts to Push a Change Upstream and Request a Pull
 ==========================================================
@@ -532,28 +582,6 @@ have been followed:
               $ poky/scripts/create-pull-request -h
               $ poky/scripts/send-pull-request -h
 
-Take Patch Review into Account
-==============================
-
-You may get feedback on your submitted patches from other community members
-or from the automated patchtest service. If issues are identified in your
-patch then it is usually necessary to address these before the patch will be
-accepted into the project. In this case you should amend the patch according
-to the feedback and submit an updated version to the relevant mailing list,
-copying in the reviewers who provided feedback to the previous version of the
-patch.
-
-The patch should be amended using ``git commit --amend`` or perhaps ``git
-rebase`` for more expert git users. You should also modify the ``[PATCH]``
-tag in the email subject line when sending the revised patch to mark the new
-iteration as ``[PATCH v2]``, ``[PATCH v3]``, etc as appropriate. This can be
-done by passing the ``-v`` argument to ``git format-patch`` with a version
-number.
-
-Lastly please ensure that you also test your revised changes. In particular
-please don't just edit the patch file written out by ``git format-patch`` and
-resend it.
-
 Submitting Changes to Stable Release Branches
 =============================================
 
@@ -610,6 +638,100 @@ follows:
       and in the following sections but modify the subject header of your patch
       email to include the name of the stable branch which you are
       targetting. This can be done using the ``--subject-prefix`` argument to
-      ``git format-patch``, for example to submit a patch to the dunfell
-      branch use
-      ``git format-patch --subject-prefix='&DISTRO_NAME_NO_CAP_MINUS_ONE;][PATCH' ...``.
+      ``git format-patch``, for example to submit a patch to the
+      "&DISTRO_NAME_NO_CAP_MINUS_ONE;" branch use::
+
+         git format-patch --subject-prefix='&DISTRO_NAME_NO_CAP_MINUS_ONE;][PATCH' ...
+
+Taking Patch Review into Account
+================================
+
+You may get feedback on your submitted patches from other community members
+or from the automated patchtest service. If issues are identified in your
+patches then it is usually necessary to address these before the patches are
+accepted into the project. In this case you should your commits according
+to the feedback and submit an updated version to the relevant mailing list.
+
+In any case, never fix reported issues by fixing them in new commits
+on the tip of your branch. Always come up with a new series of commits
+without the reported issues.
+
+.. note::
+
+   It is a good idea to send a copy to the reviewers who provided feedback
+   to the previous version of the patch. You can make sure this happens
+   by adding a ``CC`` tag to the commit description::
+
+      CC: William Shakespeare <bill@yoctoproject.org>
+
+A single patch can be amended using ``git commit --amend``, and multiple
+patches can be easily reworked and reordered through an interactive Git rebase::
+
+   git rebase -i <ref-branch>
+
+See `this tutorial <https://hackernoon.com/beginners-guide-to-interactive-rebasing-346a3f9c3a6d>`__
+for practical guidance about using Git interactive rebasing.
+
+You should also modify the ``[PATCH]`` tag in the email subject line when
+sending the revised patch to mark the new iteration as ``[PATCH v2]``,
+``[PATCH v3]``, etc as appropriate. This can be done by passing the ``-v``
+argument to ``git format-patch`` with a version number::
+
+   git format-patch -v2 <ref-branch>
+
+Lastly please ensure that you also test your revised changes. In particular
+please don't just edit the patch file written out by ``git format-patch`` and
+resend it.
+
+Tracking the Status of Patches
+==============================
+
+The Yocto Project uses a `Patchwork instance <https://patchwork.yoctoproject.org/>`__
+to track the status of patches submitted to the various mailing lists and to
+support automated patch testing. Each submitted patch is checked for common
+mistakes and deviations from the expected patch format and submitters are
+notified by ``patchtest`` if such mistakes are found. This process helps to
+reduce the burden of patch review on maintainers.
+
+.. note::
+
+   This system is imperfect and changes can sometimes get lost in the flow.
+   Asking about the status of a patch or change is reasonable if the change
+   has been idle for a while with no feedback.
+
+If your patches have not had any feedback in a few days, they may have already
+been merged. You can run ``git pull``  branch to check this. Note that many if
+not most layer maintainers do not send out acknowledgement emails when they
+accept patches. Alternatively, if there is no response or merge after a few days
+the patch may have been missed or the appropriate reviewers may not currently be
+around. It is then perfectly fine to reply to it yourself with a reminder asking
+for feedback.
+
+.. note::
+
+      Patch reviews for feature and recipe upgrade patches are likely be delayed
+      during a feature freeze because these types of patches aren't merged during
+      at that time --- you may have to wait until after the freeze is lifted.
+
+Maintainers also commonly use ``-next`` branches to test submissions prior to
+merging patches. Thus, you can get an idea of the status of a patch based on
+whether the patch has been merged into one of these branches. The commonly
+used testing branches for OpenEmbedded-Core are as follows:
+
+-  *openembedded-core "master-next" branch:* This branch is part of the
+   :oe_git:`openembedded-core </openembedded-core/>` repository and contains
+   proposed changes to the core metadata.
+
+-  *poky "master-next" branch:* This branch is part of the
+   :yocto_git:`poky </poky/>` repository and combines proposed
+   changes to BitBake, the core metadata and the poky distro.
+
+Similarly, stable branches maintained by the project may have corresponding
+``-next`` branches which collect proposed changes. For example,
+``&DISTRO_NAME_NO_CAP;-next`` and ``&DISTRO_NAME_NO_CAP_MINUS_ONE;-next``
+branches in both the "openembdedded-core" and "poky" repositories.
+
+Other layers may have similar testing branches but there is no formal
+requirement or standard for these so please check the documentation for the
+layers you are contributing to.
+
-- 
2.34.1


