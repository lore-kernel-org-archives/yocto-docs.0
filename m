Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A27A1EE14D9
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 08:37:47 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.8428.1694075863985686972
 for <docs@lists.yoctoproject.org>;
 Thu, 07 Sep 2023 01:37:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Nyhnmtz9;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7B69F40003;
	Thu,  7 Sep 2023 08:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1694075861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=d3THG1Ei51enTalySZY7yxWXAExKt71f9RgRMmheZDQ=;
	b=Nyhnmtz9LpTGONL6BI3wFxBf3KptTLWHrhxiSuGf/i6YLwEkMTlWaBc4Box9eDbL8OQwli
	MgJS1S/wa088O2uzIMRZ8bc+3jjR8POS5VU73K6Q8dhGm6J81BRM7FnmOcVXIxR/OyP9Or
	wcJFdkUSoFNVFBaDCtFDy//UqPXjqzb9JYcZwVaEA3M/oHKLyxOJKkgVDM39BHrW8ds1yN
	MQH+qkNTqkyIaUb2Q83qfSMFZgqpzeatHj9Gfa3Z1l8ALv73BEOmWtcWIs5TZB8hkKeOQK
	+n9n6u5YFXT8DAbxCTVZkohcQHMUUwxeE00Qk8aKffZbWcd8Diaq/YR0R5IzCg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH] manuals: add new contributor guide
Date: Thu,  7 Sep 2023 10:37:36 +0200
Message-Id: <20230907083736.193457-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 07 Sep 2023 08:37:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4199

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/bsp-guide/bsp.rst               |   4 +-
 .../contributor-guide/identify-component.rst  |  31 +
 documentation/contributor-guide/index.rst     |  26 +
 .../contributor-guide/recipe-style-guide.rst  | 257 ++++++
 .../contributor-guide/report-defect.rst       |  67 ++
 .../contributor-guide/submit-changes.rst      | 754 ++++++++++++++++++
 documentation/dev-manual/common-tasks.rst     | 532 +-----------
 documentation/dev-manual/start.rst            |   9 +-
 documentation/index.rst                       |   1 +
 .../development-environment.rst               |  19 +-
 documentation/ref-manual/resources.rst        |   7 +-
 .../ref-manual/system-requirements.rst        |   5 +-
 12 files changed, 1159 insertions(+), 553 deletions(-)
 create mode 100644 documentation/contributor-guide/identify-component.rst
 create mode 100644 documentation/contributor-guide/index.rst
 create mode 100644 documentation/contributor-guide/recipe-style-guide.rst
 create mode 100644 documentation/contributor-guide/report-defect.rst
 create mode 100644 documentation/contributor-guide/submit-changes.rst

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index 8201c93862..67bcd08f2b 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -927,8 +927,8 @@ Yocto Project:
    -  The name and contact information for the BSP layer maintainer.
       This is the person to whom patches and questions should be sent.
       For information on how to find the right person, see the
-      ":ref:`dev-manual/common-tasks:submitting a change to the yocto project`"
-      section in the Yocto Project Development Tasks Manual.
+      :doc:`../contributor-guide/submit-changes` section in the Yocto Project and
+      OpenEmbedded Contributor Guide.
 
    -  Instructions on how to build the BSP using the BSP layer.
 
diff --git a/documentation/contributor-guide/identify-component.rst b/documentation/contributor-guide/identify-component.rst
new file mode 100644
index 0000000000..a28391a66a
--- /dev/null
+++ b/documentation/contributor-guide/identify-component.rst
@@ -0,0 +1,31 @@
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
+components have been combined (:oe_git:`bitbake </bitbake>`,
+:oe_git:`openembedded-core </openembedded-core>`,
+:yocto_git:`meta-yocto </meta-yocto>` and
+:yocto_git:`yocto-docs </yocto-docs>`). Patches should be submitted against the
+appropriate individual component rather than :term:`Poky` itself as detailed in
+the appropriate ``README`` file.
+
diff --git a/documentation/contributor-guide/index.rst b/documentation/contributor-guide/index.rst
new file mode 100644
index 0000000000..a832169455
--- /dev/null
+++ b/documentation/contributor-guide/index.rst
@@ -0,0 +1,26 @@
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
+   report-defect
+   recipe-style-guide
+   submit-changes
+
+.. include:: /boilerplate.rst
diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/documentation/contributor-guide/recipe-style-guide.rst
new file mode 100644
index 0000000000..c1a12f03ac
--- /dev/null
+++ b/documentation/contributor-guide/recipe-style-guide.rst
@@ -0,0 +1,257 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Recipe Style Guide
+******************
+
+Recipe Naming Conventions
+=========================
+
+In general, most recipes should follow the naming convention
+``recipes-category/package/packagename_version.bb``. Recipes for related
+projects may share the same package directory. ``packagename``, ``category``,
+and ``package`` may contain hyphens, but hyphens are not allowed in ``version``.
+
+If the recipe is tracking a Git revision that does not correspond to a released
+version of the software, ``version`` may be ``git`` (e.g. ``packagename_git.bb``)
+
+Version Policy
+==============
+
+Our versions follow the form ``<package epoch>:<package version>-<package revision>``
+or in BitBake variable terms ${:term:`PE`}:${:term:`PV`}-${:term:`PR`}. We
+generally follow the `Debian <https://www.debian.org/doc/debian-policy/ch-controlfields.html#version>`__
+version policy which defines these terms.
+
+In most cases the version :term:`PV` will be set automatically from the recipe
+file name. It is recommended to use released versions of software as these are
+revisions that upstream are expecting people to use.
+
+Package versions should always compare and sort correctly so that upgrades work
+as expected. With conventional versions such as ``1.4`` upgrading ``to 1.5``
+this happens naturally, but some versions don't sort. For example,
+``1.5 Release Candidate 2`` could be written as ``1.5rc2`` but this sorts after
+``1.5``, so upgrades from feeds won't happen correctly.
+
+Instead the tilde (``~``) operator can be used, which sorts before the empty
+string so ``1.5~rc2`` comes before ``1.5``. There is a historical syntax which
+may be found where :term:`PV` is set as a combination of the prior version
+``+`` the pre-release version, for example ``PV=1.4+1.5rc2``. This is a valid
+syntax but the tilde form is preferred.
+
+For version comparisons, the ``opkg-compare-versions`` program from
+``opkg-utils`` can be useful when attempting to determine how two version
+numbers compare to each other. Our definitive version comparison algorithm is
+the one within bitbake which aims to match those of the package managers and
+Debian policy closely.
+
+When a recipe references a git revision that does not correspond to a released
+version of software (e.g. is not a tagged version), the :term:`PV` variable
+should include the Git revision using the following to make the
+version clear::
+
+    PV = "<version>+git${SRCPV}"
+
+In this case, ``<version>`` should be the most recently released version of the
+software from the current source revision (``git describe`` can be useful for
+determining this). Whilst not recommended for published layers, this format is
+also useful when using :term:`AUTOREV` to set the recipe to increment source
+control revisions automatically, which can be useful during local development.
+
+Version Number Changes
+======================
+
+The :term:`PR` variable is used to indicate different revisions of a recipe
+that reference the same upstream source version. It can be used to force a
+new version of a package to be installed onto a device from a package feed.
+These once had to be set manually but in most cases these can now be set and
+incremented automatically by a PR Server connected with a package feed.
+
+When :term:`PV` increases, any existing :term:`PR` value can and should be
+removed.
+
+If :term:`PV` changes in such a way that it does not increase with respect to
+the previous value, you need to increase :term:`PE` to ensure package managers
+will upgrade it correctly. If unset you should set :term:`PE` to "1" since
+the default of empty is easily confused with "0" depending on the package
+manager. :term:`PE` can only have an integer value.
+
+Recipe formatting
+=================
+
+Variable Formatting
+-------------------
+
+-  Variable assignment should a space around each side of the operator, e.g.
+   ``FOO = "bar"``, not ``FOO="bar"``.
+
+-  Double quotes should be used on the right-hand side of the assignment,
+   e.g. ``FOO = "bar"`` not ``FOO = 'bar'``
+
+-  Spaces should be used for indenting variables, with 4 spaces per tab
+
+-  Long variables should be split over multiple lines when possible by using
+   the continuation character (``\``)
+
+-  When splitting a long variable over multiple lines, all continuation lines
+   should be indented (with spaces) to align with the start of the quote on the
+   first line::
+
+       FOO = "this line is \
+              long \
+              "
+
+   Instead of::
+
+       FOO = "this line is \
+       long \
+       "
+
+Python Function formatting
+--------------------------
+
+-  Spaces must be used for indenting Python code, with 4 spaces per tab
+
+Shell Function formatting
+-------------------------
+
+-  The formatting of shell functions should be consistent within layers.
+   Some use tabs, some use spaces.
+
+Recipe metadata
+===============
+
+Required Variables
+------------------
+
+The following variables should be included in all recipes:
+
+-  :term:`SUMMARY`: a one line description of the upstream project
+
+-  :term:`DESCRIPTION`: an extended description of the upstream project,
+   possibly with multiple lines. If no reasonable description can be written,
+   this may be omitted as it defaults to :term:`SUMMARY`.
+
+-  :term:`HOMEPAGE`: the URL to the upstream projects homepage.
+
+-  :term:`BUGTRACKER`: the URL upstream projects bug tracking website,
+   if applicable.
+
+Recipe Ordering
+---------------
+
+When a variable is defined in recipes and classes, variables should follow the
+general order when possible:
+
+-  :term:`SUMMARY`
+-  :term:`DESCRIPTION`
+-  :term:`HOMEPAGE`
+-  :term:`BUGTRACKER`
+-  :term:`SECTION`
+-  :term:`LICENSE`
+-  :term:`LIC_FILES_CHKSUM`
+-  :term:`DEPENDS`
+-  :term:`PROVIDES`
+-  :term:`PV`
+-  :term:`SRC_URI`
+-  :term:`SRCREV`
+-  :term:`S`
+-  ``inherit ...``
+-  :term:`PACKAGECONFIG`
+-  Build class specific variables such as ``EXTRA_QMAKEVARS_POST`` and :term:`EXTRA_OECONF`
+-  Tasks such as :ref:`ref-tasks-configure`
+-  :term:`PACKAGE_ARCH`
+-  :term:`PACKAGES`
+-  :term:`FILES`
+-  :term:`RDEPENDS`
+-  :term:`RRECOMMENDS`
+-  :term:`RSUGGESTS`
+-  :term:`RPROVIDES`
+-  :term:`RCONFLICTS`
+-  :term:`BBCLASSEXTEND`
+
+There are some cases where ordering is important and these cases would override
+this default order. Examples include:
+
+-  :term:`PACKAGE_ARCH` needing to be set before ``inherit packagegroup``
+
+Tasks should be ordered based on the order they generally execute. For commonly
+used tasks this would be:
+
+-  :ref:`ref-tasks-fetch`
+-  :ref:`ref-tasks-unpack`
+-  :ref:`ref-tasks-patch`
+-  :ref:`ref-tasks-prepare_recipe_sysroot`
+-  :ref:`ref-tasks-configure`
+-  :ref:`ref-tasks-compile`
+-  :ref:`ref-tasks-install`
+-  :ref:`ref-tasks-populate_sysroot`
+-  :ref:`ref-tasks-package`
+
+Custom tasks should be sorted similarly.
+
+Package specific variables are typically grouped together, e.g.::
+
+    RDEPENDS:${PN} = “foo”
+    RDEPENDS:${PN}-libs = “bar”
+
+    RRECOMMENDS:${PN} = “one”
+    RRECOMMENDS:${PN}-libs = “two”
+
+Recipe License Fields
+---------------------
+
+Recipes need to define both the :term:`LICENSE` and
+:term:`LIC_FILES_CHKSUM` variables:
+
+-  :term:`LICENSE`: This variable specifies the license for the software.
+   If you do not know the license under which the software you are
+   building is distributed, you should go to the source code and look
+   for that information. Typical files containing this information
+   include ``COPYING``, :term:`LICENSE`, and ``README`` files. You could
+   also find the information near the top of a source file. For example,
+   given a piece of software licensed under the GNU General Public
+   License version 2, you would set :term:`LICENSE` as follows::
+
+      LICENSE = "GPL-2.0-only"
+
+   The licenses you specify within :term:`LICENSE` can have any name as long
+   as you do not use spaces, since spaces are used as separators between
+   license names. For standard licenses, use the names of the files in
+   ``meta/files/common-licenses/`` or the :term:`SPDXLICENSEMAP` flag names
+   defined in ``meta/conf/licenses.conf``.
+
+-  :term:`LIC_FILES_CHKSUM`: The OpenEmbedded build system uses this
+   variable to make sure the license text has not changed. If it has,
+   the build produces an error and it affords you the chance to figure
+   it out and correct the problem.
+
+   You need to specify all applicable licensing files for the software.
+   At the end of the configuration step, the build process will compare
+   the checksums of the files to be sure the text has not changed. Any
+   differences result in an error with the message containing the
+   current checksum. For more explanation and examples of how to set the
+   :term:`LIC_FILES_CHKSUM` variable, see the
+   ":ref:`dev-manual/common-tasks:tracking license changes`" section.
+
+   To determine the correct checksum string, you can list the
+   appropriate files in the :term:`LIC_FILES_CHKSUM` variable with incorrect
+   md5 strings, attempt to build the software, and then note the
+   resulting error messages that will report the correct md5 strings.
+   See the ":ref:`dev-manual/common-tasks:fetching code`" section for
+   additional information.
+
+   Here is an example that assumes the software has a ``COPYING`` file::
+
+      LIC_FILES_CHKSUM = "file://COPYING;md5=xxx"
+
+   When you try to build the
+   software, the build system will produce an error and give you the
+   correct string that you can substitute into the recipe file for a
+   subsequent build.
+
+Tips and Guidelines for Writing Recipes
+---------------------------------------
+
+-  Use :term:`BBCLASSEXTEND` instead of creating separate recipes such as ``-native``
+   and ``-nativesdk`` ones, whenever possible. This avoids having to maintain multiple
+   recipe files at the same time.
diff --git a/documentation/contributor-guide/report-defect.rst b/documentation/contributor-guide/report-defect.rst
new file mode 100644
index 0000000000..8ef133b842
--- /dev/null
+++ b/documentation/contributor-guide/report-defect.rst
@@ -0,0 +1,67 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Reporting a Defect Against the Yocto Project and OpenEmbedded
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
diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
new file mode 100644
index 0000000000..65d8ea5343
--- /dev/null
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -0,0 +1,754 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Contributing Changes to a Component
+************************************
+
+Contributions to the Yocto Project and OpenEmbedded are very welcome.
+Because the system is extremely configurable and flexible, we recognize
+that developers will want to extend, configure or optimize it for their
+specific uses.
+
+.. _ref-why-mailing-lists:
+
+Contributing through mailing lists --- Why not using web-based workflows?
+=========================================================================
+
+Both Yocto Project and OpenEmbedded have many key components that are
+maintained by patches being submitted on mailing lists. We appreciate this
+approach does look a little old fashioned when other workflows are available
+through web technology such as GitHub, GitLab and others. Since we are often
+asked this question, we’ve decided to document the reasons for using mailing
+lists.
+
+One significant factor is that we value peer review. When a change is proposed
+to many of the core pieces of the project, it helps to have many eyes of review
+go over them. Whilst there is ultimately one maintainer who needs to make the
+final call on accepting or rejecting a patch, the review is made by many eyes
+and the exact people reviewing it are likely unknown to the maintainer. It is
+often the surprise reviewer that catches the most interesting issues!
+
+This is in contrast to the "GitHub" style workflow where either just a
+maintainer makes that review, or review is specifically requested from
+nominated people. We believe there is significant value added to the codebase
+by this peer review and that moving away from mailing lists would be to the
+detriment of our code.
+
+We also need to acknowledge that many of our developers are used to this
+mailing list workflow and have worked with it for years, with tools and
+processes built around it. Changing away from this would result in a loss
+of key people from the project, which would again be to its detriment.
+
+The projects are acutely aware that potential new contributors find the
+mailing list approach off-putting and would prefer a web-based GUI.
+Since we don’t believe that can work for us, the project is aiming to ensure
+`patchwork <https://patchwork.yoctoproject.org/>`__ is available to help track
+patch status and also looking at how tooling can provide more feedback to users
+about patch status. We are looking at improving tools such as ``patchtest`` to
+test user contributions before they hit the mailing lists and also at better
+documenting how to use such workflows since we recognise that whilst this was
+common knowledge a decade ago, it might not be as familiar now.
+
+Preparing Changes for Submission
+================================
+
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
+for your changes, starting from the reference branch in the upstream
+repository (often called ``master``)::
+
+   $ git checkout <ref-branch>
+   $ git checkout -b my-changes
+
+If you have completely unrelated sets of changes to submit, you should even
+create one branch for each set.
+
+Implement and commit changes
+----------------------------
+
+In each branch, you should group your changes into small, controlled and
+isolated ones. Keeping changes small and isolated aids review, makes
+merging/rebasing easier and keeps the change history clean should anyone need
+to refer to it in future.
+
+To this purpose, you should create *one Git commit per change*,
+corresponding to each of the patches you will eventually submit.
+See `further guidance <https://www.kernel.org/doc/html/latest/process/submitting-patches.html#separate-your-changes>`__
+in the Linux kernel documentation if needed.
+
+For example, when you intend to add multiple new recipes, each recipe
+should be added in a separate commit. For upgrades to existing recipes,
+the previous version should usually be deleted as part of the same commit
+to add the upgraded version.
+
+#. *Stage Your Changes:* Stage your changes by using the ``git add``
+   command on each file you modified. If you want to stage all the
+   files you modified, you can even use the ``git add -A`` command.
+
+#. *Commit Your Changes:* This is when you can create separate commits. For
+   each commit to create, use the ``git commit -s`` command with the files
+   or directories you want to include in the commit::
+
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
+      <https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin>`__
+      as follows:
+
+      .. code-block:: none
+
+         Developer's Certificate of Origin 1.1
+
+         By making a contribution to this project, I certify that:
+
+         (a) The contribution was created in whole or in part by me and I
+             have the right to submit it under the open source license
+             indicated in the file; or
+
+         (b) The contribution is based upon previous work that, to the best
+             of my knowledge, is covered under an appropriate open source
+             license and I have the right under that license to submit that
+             work with modifications, whether created in whole or in part
+             by me, under the same open source license (unless I am
+             permitted to submit under a different license), as indicated
+             in the file; or
+
+         (c) The contribution was provided directly to me by some other
+             person who certified (a), (b) or (c) and I have not modified
+             it.
+
+         (d) I understand and agree that this project and the contribution
+             are public and that a record of the contribution (including all
+             personal information I submit with it, including my sign-off) is
+             maintained indefinitely and may be redistributed consistent with
+             this project or the open source license(s) involved.
+
+   -  Provide a single-line summary of the change and, if more
+      explanation is needed, provide more detail in the body of the
+      commit. This summary is typically viewable in the "shortlist" of
+      changes. Thus, providing something short and descriptive that
+      gives the reader a summary of the change is useful when viewing a
+      list of many commits. You should prefix this short description
+      with the recipe name (if changing a recipe), or else with the
+      short form path to the file being changed.
+
+      .. note::
+
+         To find a suitable prefix for the commit summary, a good idea
+         is to look for prefixes used in previous commits touching the
+         same files or directories::
+
+            git log --oneline <paths>
+
+   -  For the body of the commit message, provide detailed information
+      that describes what you changed, why you made the change, and the
+      approach you used. It might also be helpful if you mention how you
+      tested the change. Provide as much detail as you can in the body
+      of the commit message.
+
+      .. note::
+
+         If the single line summary is enough to describe a simple
+         change, the body of the commit message can be left empty.
+
+   -  If the change addresses a specific bug or issue that is associated
+      with a bug-tracking ID, include a reference to that ID in your
+      detailed description. For example, the Yocto Project uses a
+      specific convention for bug references --- any commit that addresses
+      a specific bug should use the following form for the detailed
+      description. Be sure to use the actual bug-tracking ID from
+      Bugzilla for bug-id::
+
+         Fixes [YOCTO #bug-id]
+
+         detailed description of change
+
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
+Creating Patches
+================
+
+Here is the general procedure on how to create patches to be sent through email:
+
+#. *Describe the Changes in your Branch:* If you have more than one commit
+   in your branch, it's recommended to provide a cover letter describing
+   the series of patches you are about to send.
+
+   For this purpose, a good solution is to store the cover letter contents
+   in the branch itself::
+
+      git branch --edit-description
+
+   This will open a text editor to fill in the description for your
+   changes. This description can be updated when necessary and will
+   be used by Git to create the cover letter together with the patches.
+
+   It is recommended to start this description with a title line which
+   will serve a the subject line for the cover letter.
+
+#. *Generate Patches for your Branch:* The ``git format-patch`` command will
+   generate patch files for each of the commits in your branch. You need
+   to pass the reference branch your branch starts from.
+
+   If you branch didn't need a description in the previous step::
+
+      $ git format-patch <ref-branch>
+
+   If you filled a description for your branch, you will want to generate
+   a cover letter too::
+
+      $ git format-patch --cover-letter --cover-from-description=auto <ref-branch>
+
+   After the command is run, the current directory contains numbered
+   ``.patch`` files for the commits in your branch. If you have a cover
+   letter, it will be in the ``0000-cover-letter.patch``.
+
+   .. note::
+
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
+   ":ref:`contributor-guide/submit-changes:taking patch review into account`".
+
+Sending the Patches via Email
+=============================
+
+Using Git to Send Patches
+-------------------------
+
+To submit patches through email, it is very important that you send them
+without any whitespace or HTML formatting that either you or your mailer
+introduces. The maintainer that receives your patches needs to be able
+to save and apply them directly from your emails, using the ``git am``
+command.
+
+Using the ``git send-email`` command is the only error-proof way of sending
+your patches using email since there is no risk of compromising whitespace
+in the body of the message, which can occur when you use your own mail
+client. It will also properly include your patches as *inline attachments*,
+which is not easy to do with standard e-mail clients without breaking lines.
+If you used your regular e-mail client and shared your patches as regular
+attachments, reviewers wouldn't be able to quote specific sections of your
+changes and make comments about them.
+
+Setting up Git to Send Email
+----------------------------
+
+The ``git send-email`` command can send email by using a local or remote
+Mail Transport Agent (MTA) such as ``msmtp``, ``sendmail``, or
+through a direct SMTP configuration in your Git ``~/.gitconfig`` file.
+
+Here are the settings for letting ``git send-email`` send e-mail through your
+regular STMP server, using a Google Mail account as an example::
+
+   git config --global sendemail.smtpserver smtp.gmail.com
+   git config --global sendemail.smtpserverport 587
+   git config --global sendemail.smtpencryption tls
+   git config --global sendemail.smtpuser ada.lovelace@gmail.com
+   git config --global sendemail.smtppass = XXXXXXXX
+
+These settings will appear in the ``.gitconfig`` file in your home directory.
+
+If you neither can use a local MTA nor SMTP,  make sure you use an email client
+that does not touch the message (turning spaces in tabs, wrapping lines, etc.).
+A good mail client to do so is Pine (or Alpine) or Mutt. For more
+information about suitable clients, see `Email clients info for Linux
+<https://www.kernel.org/doc/html/latest/process/email-clients.html>`__
+in the Linux kernel sources.
+
+If you use such clients, just include the patch in the body of your email.
+
+Finding a Suitable Mailing List
+-------------------------------
+
+You should send patches to the appropriate mailing list so that they can be
+reviewed by the right contributors and merged by the appropriate maintainer.
+The specific mailing list you need to use depends on the location of the code
+you are changing.
+
+If people have concerns with any of the patches, they will usually voice
+their concern over the mailing list. If patches do not receive any negative
+reviews, the maintainer of the affected layer typically takes them, tests them,
+and then based on successful testing, merges them.
+
+In general, each component (e.g. layer) should have a ``README`` file
+that indicates where to send the changes and which process to follow.
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
+For changes to other layers and tools hosted in the Yocto Project source
+repositories (i.e. :yocto_git:`git.yoctoproject.org <>`), use the
+:yocto_lists:`yocto </g/yocto/>` general mailing list.
+
+For changes to other layers hosted in the OpenEmbedded source
+repositories (i.e. :oe_git:`git.openembedded.org <>`), use
+the :oe_lists:`openembedded-devel </g/openembedded-devel>`
+mailing list, unless specified otherwise in the layer's ``README`` file.
+
+If you intend to submit a new recipe that neither fits into the core Metadata,
+nor into :oe_git:`meta-openembedded </meta-openembedded/>`, you should
+look for a suitable layer in https://layers.openembedded.org. If similar
+recipes can be expected, you may consider :ref:`dev-manual/common-tasks:creating your own layer`.
+
+If in doubt, please ask on the :yocto_lists:`yocto </g/yocto/>` general mailing list
+or on the :oe_lists:`openembedded-devel </g/openembedded-devel>` mailing list.
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
+
+Sending Patches via Email
+-------------------------
+
+At this stage, you are ready to send your patches via email. Here's the
+typical usage of ``git send-email``::
+
+   git send-email --to <mailing-list-address> *.patch
+
+Then, review each subject line and list of recipients carefully, and then
+and then allow the command to send each message.
+
+You will see that ``git send-email`` will automatically copy the people listed
+in any commit tags such as ``Signed-off-by`` or ``Reported-by``.
+
+In case you are sending patches for :oe_git:`meta-openembedded </meta-openembedded/>`
+or any layer other than :oe_git:`openembedded-core </openembedded-core/>`,
+please add the appropriate prefix so that it is clear which layer the patch is intended
+to be applied to::
+
+   git send-email --subject-prefix="meta-oe][PATCH" ...
+
+.. note::
+
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
+
+Using Scripts to Push a Change Upstream and Request a Pull
+==========================================================
+
+For larger patch series it is preferable to send a pull request which not
+only includes the patch but also a pointer to a branch that can be pulled
+from. This involves making a local branch for your changes, pushing this
+branch to an accessible repository and then using the ``create-pull-request``
+and ``send-pull-request`` scripts from openembedded-core to create and send a
+patch series with a link to the branch for review.
+
+Follow this procedure to push a change to an upstream "contrib" Git
+repository once the steps in
+":ref:`contributor-guide/submit-changes:preparing changes for submission`"
+have been followed:
+
+.. note::
+
+   You can find general Git information on how to push a change upstream
+   in the
+   `Git Community Book <https://git-scm.com/book/en/v2/Distributed-Git-Distributed-Workflows>`__.
+
+#. *Request Push Access to an "Upstream" Contrib Repository:* Send an email to
+   ``helpdesk@yoctoproject.org``:
+
+    -  Attach your SSH public key which usually named ``id_rsa.pub.``.
+       If you don't have one generate it by running ``ssh-keygen -t rsa -b 4096 -C "your_email@example.com"``.
+
+    -  List the repositories you're planning to contribute to.
+
+    -  Include your preferred branch prefix for ``-contrib`` repositories.
+
+#. *Push Your Commits to the "Contrib" Upstream:* Push your
+   changes to that repository::
+
+      $ git push upstream_remote_repo local_branch_name
+
+   For example, suppose you have permissions to push
+   into the upstream ``meta-intel-contrib`` repository and you are
+   working in a local branch named `your_name`\ ``/README``. The following
+   command pushes your local commits to the ``meta-intel-contrib``
+   upstream repository and puts the commit in a branch named
+   `your_name`\ ``/README``::
+
+      $ git push meta-intel-contrib your_name/README
+
+#. *Determine Who to Notify:* Determine the maintainer or the mailing
+   list that you need to notify for the change.
+
+   Before submitting any change, you need to be sure who the maintainer
+   is or what mailing list that you need to notify. Use either these
+   methods to find out:
+
+   -  *Maintenance File:* Examine the ``maintainers.inc`` file, which is
+      located in the :term:`Source Directory` at
+      ``meta/conf/distro/include``, to see who is responsible for code.
+
+   -  *Search by File:* Using :ref:`overview-manual/development-environment:git`, you can
+      enter the following command to bring up a short list of all
+      commits against a specific file::
+
+         git shortlog -- filename
+
+      Just provide the name of the file for which you are interested. The
+      information returned is not ordered by history but does include a
+      list of everyone who has committed grouped by name. From the list,
+      you can see who is responsible for the bulk of the changes against
+      the file.
+
+   -  *Find the Mailing List to Use:* See the
+      ":ref:`contributor-guide/submit-changes:finding a suitable mailing list`"
+      section above.
+
+#. *Make a Pull Request:* Notify the maintainer or the mailing list that
+   you have pushed a change by making a pull request.
+
+   The Yocto Project provides two scripts that conveniently let you
+   generate and send pull requests to the Yocto Project. These scripts
+   are ``create-pull-request`` and ``send-pull-request``. You can find
+   these scripts in the ``scripts`` directory within the
+   :term:`Source Directory` (e.g.
+   ``poky/scripts``).
+
+   Using these scripts correctly formats the requests without
+   introducing any whitespace or HTML formatting. The maintainer that
+   receives your patches either directly or through the mailing list
+   needs to be able to save and apply them directly from your emails.
+   Using these scripts is the preferred method for sending patches.
+
+   First, create the pull request. For example, the following command
+   runs the script, specifies the upstream repository in the contrib
+   directory into which you pushed the change, and provides a subject
+   line in the created patch files::
+
+      $ poky/scripts/create-pull-request -u meta-intel-contrib -s "Updated Manual Section Reference in README"
+
+   Running this script forms ``*.patch`` files in a folder named
+   ``pull-``\ `PID` in the current directory. One of the patch files is a
+   cover letter.
+
+   Before running the ``send-pull-request`` script, you must edit the
+   cover letter patch to insert information about your change. After
+   editing the cover letter, send the pull request. For example, the
+   following command runs the script and specifies the patch directory
+   and email address. In this example, the email address is a mailing
+   list::
+
+      $ poky/scripts/send-pull-request -p ~/meta-intel/pull-10565 -t meta-intel@lists.yoctoproject.org
+
+   You need to follow the prompts as the script is interactive.
+
+   .. note::
+
+      For help on using these scripts, simply provide the ``-h``
+      argument as follows::
+
+              $ poky/scripts/create-pull-request -h
+              $ poky/scripts/send-pull-request -h
+
+Submitting Changes to Stable Release Branches
+=============================================
+
+The process for proposing changes to a Yocto Project stable branch differs
+from the steps described above. Changes to a stable branch must address
+identified bugs or CVEs and should be made carefully in order to avoid the
+risk of introducing new bugs or breaking backwards compatibility. Typically
+bug fixes must already be accepted into the master branch before they can be
+backported to a stable branch unless the bug in question does not affect the
+master branch or the fix on the master branch is unsuitable for backporting.
+
+The list of stable branches along with the status and maintainer for each
+branch can be obtained from the
+:yocto_wiki:`Releases wiki page </Releases>`.
+
+.. note::
+
+   Changes will not typically be accepted for branches which are marked as
+   End-Of-Life (EOL).
+
+With this in mind, the steps to submit a change for a stable branch are as
+follows:
+
+#. *Identify the bug or CVE to be fixed:* This information should be
+   collected so that it can be included in your submission.
+
+   See :ref:`dev-manual/common-tasks:checking for vulnerabilities`
+   for details about CVE tracking.
+
+#. *Check if the fix is already present in the master branch:* This will
+   result in the most straightforward path into the stable branch for the
+   fix.
+
+   #. *If the fix is present in the master branch --- submit a backport request
+      by email:* You should send an email to the relevant stable branch
+      maintainer and the mailing list with details of the bug or CVE to be
+      fixed, the commit hash on the master branch that fixes the issue and
+      the stable branches which you would like this fix to be backported to.
+
+   #. *If the fix is not present in the master branch --- submit the fix to the
+      master branch first:* This will ensure that the fix passes through the
+      project's usual patch review and test processes before being accepted.
+      It will also ensure that bugs are not left unresolved in the master
+      branch itself. Once the fix is accepted in the master branch a backport
+      request can be submitted as above.
+
+   #. *If the fix is unsuitable for the master branch --- submit a patch
+      directly for the stable branch:* This method should be considered as a
+      last resort. It is typically necessary when the master branch is using
+      a newer version of the software which includes an upstream fix for the
+      issue or when the issue has been fixed on the master branch in a way
+      that introduces backwards incompatible changes. In this case follow the
+      steps in ":ref:`contributor-guide/submit-changes:preparing changes for submission`"
+      and in the following sections but modify the subject header of your patch
+      email to include the name of the stable branch which you are
+      targetting. This can be done using the ``--subject-prefix`` argument to
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
diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index bc1a13f0ab..6a527f0ef8 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -10045,8 +10045,7 @@ The build should work without issue.
 As with all solved problems, if they originated upstream, you need to
 submit the fix for the recipe in OE-Core and upstream so that the
 problem is taken care of at its source. See the
-":ref:`dev-manual/common-tasks:submitting a change to the yocto project`"
-section for more information.
+:doc:`../contributor-guide/submit-changes` section for more information.
 
 Debugging With the GNU Project Debugger (GDB) Remotely
 ------------------------------------------------------
@@ -10409,9 +10408,7 @@ Here are some other tips that you might find useful:
    :yocto_bugs:`Bugzilla <>`. For information on
    how to submit a bug against the Yocto Project, see the Yocto Project
    Bugzilla :yocto_wiki:`wiki page </Bugzilla_Configuration_and_Bug_Tracking>`
-   and the
-   ":ref:`dev-manual/common-tasks:submitting a defect against the yocto project`"
-   section.
+   and the ":doc:`../contributor-guide/report-defect`" section.
 
    .. note::
 
@@ -10419,529 +10416,6 @@ Here are some other tips that you might find useful:
       that are purely internal and have a limited scope (e.g. internal
       variables used to implement a single ``.bbclass`` file).
 
-Making Changes to the Yocto Project
-===================================
-
-Because the Yocto Project is an open-source, community-based project,
-you can effect changes to the project. This section presents procedures
-that show you how to submit a defect against the project and how to
-submit a change.
-
-Submitting a Defect Against the Yocto Project
----------------------------------------------
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
-1.  Open the Yocto Project implementation of :yocto_bugs:`Bugzilla <>`.
-
-2.  Click "File a Bug" to enter a new bug.
-
-3.  Choose the appropriate "Classification", "Product", and "Component"
-    for which the bug was found. Bugs for the Yocto Project fall into
-    one of several classifications, which in turn break down into
-    several products and components. For example, for a bug against the
-    ``meta-intel`` layer, you would choose "Build System, Metadata &
-    Runtime", "BSPs", and "bsps-meta-intel", respectively.
-
-4.  Choose the "Version" of the Yocto Project for which you found the
-    bug (e.g. &DISTRO;).
-
-5.  Determine and select the "Severity" of the bug. The severity
-    indicates how the bug impacted your work.
-
-6.  Choose the "Hardware" that the bug impacts.
-
-7.  Choose the "Architecture" that the bug impacts.
-
-8.  Choose a "Documentation change" item for the bug. Fixing a bug might
-    or might not affect the Yocto Project documentation. If you are
-    unsure of the impact to the documentation, select "Don't Know".
-
-9.  Provide a brief "Summary" of the bug. Try to limit your summary to
-    just a line or two and be sure to capture the essence of the bug.
-
-10. Provide a detailed "Description" of the bug. You should provide as
-    much detail as you can about the context, behavior, output, and so
-    forth that surrounds the bug. You can even attach supporting files
-    for output from logs by using the "Add an attachment" button.
-
-11. Click the "Submit Bug" button submit the bug. A new Bugzilla number
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
-----------------------------------------
-
-Contributions to the Yocto Project and OpenEmbedded are very welcome.
-Because the system is extremely configurable and flexible, we recognize
-that developers will want to extend, configure or optimize it for their
-specific uses.
-
-The Yocto Project uses a mailing list and a patch-based workflow that is
-similar to the Linux kernel but contains important differences. In
-general, there is a mailing list through which you can submit patches. You
-should send patches to the appropriate mailing list so that they can be
-reviewed and merged by the appropriate maintainer. The specific mailing
-list you need to use depends on the location of the code you are
-changing. Each component (e.g. layer) should have a ``README`` file that
-indicates where to send the changes and which process to follow.
-
-You can send the patch to the mailing list using whichever approach you
-feel comfortable with to generate the patch. Once sent, the patch is
-usually reviewed by the community at large. If somebody has concerns
-with the patch, they will usually voice their concern over the mailing
-list. If a patch does not receive any negative reviews, the maintainer
-of the affected layer typically takes the patch, tests it, and then
-based on successful testing, merges the patch.
-
-The "poky" repository, which is the Yocto Project's reference build
-environment, is a hybrid repository that contains several individual
-pieces (e.g. BitBake, Metadata, documentation, and so forth) built using
-the combo-layer tool. The upstream location used for submitting changes
-varies by component:
-
--  *Core Metadata:* Send your patch to the
-   :oe_lists:`openembedded-core </g/openembedded-core>`
-   mailing list. For example, a change to anything under the ``meta`` or
-   ``scripts`` directories should be sent to this mailing list.
-
--  *BitBake:* For changes to BitBake (i.e. anything under the
-   ``bitbake`` directory), send your patch to the
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
-:yocto_lists:`Yocto Project </g/yocto/>` general mailing list.
-
-.. note::
-
-   Sometimes a layer's documentation specifies to use a particular
-   mailing list. If so, use that list.
-
-For additional recipes that do not fit into the core Metadata, you
-should determine which layer the recipe should go into and submit the
-change in the manner recommended by the documentation (e.g. the
-``README`` file) supplied with the layer. If in doubt, please ask on the
-Yocto general mailing list or on the openembedded-devel mailing list.
-
-You can also push a change upstream and request a maintainer to pull the
-change into the component's upstream repository. You do this by pushing
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
-   changes to bitbake, the core metadata and the poky distro.
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
-The following sections provide procedures for submitting a change.
-
-Preparing Changes for Submission
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-1. *Make Your Changes Locally:* Make your changes in your local Git
-   repository. You should make small, controlled, isolated changes.
-   Keeping changes small and isolated aids review, makes
-   merging/rebasing easier and keeps the change history clean should
-   anyone need to refer to it in future.
-
-2. *Stage Your Changes:* Stage your changes by using the ``git add``
-   command on each file you changed.
-
-3. *Commit Your Changes:* Commit the change by using the ``git commit``
-   command. Make sure your commit information follows standards by
-   following these accepted conventions:
-
-   -  Be sure to include a "Signed-off-by:" line in the same style as
-      required by the Linux kernel. This can be done by using the
-      ``git commit -s`` command. Adding this line signifies that you,
-      the submitter, have agreed to the Developer's Certificate of
-      Origin 1.1 as follows:
-
-      .. code-block:: none
-
-         Developer's Certificate of Origin 1.1
-
-         By making a contribution to this project, I certify that:
-
-         (a) The contribution was created in whole or in part by me and I
-             have the right to submit it under the open source license
-             indicated in the file; or
-
-         (b) The contribution is based upon previous work that, to the best
-             of my knowledge, is covered under an appropriate open source
-             license and I have the right under that license to submit that
-             work with modifications, whether created in whole or in part
-             by me, under the same open source license (unless I am
-             permitted to submit under a different license), as indicated
-             in the file; or
-
-         (c) The contribution was provided directly to me by some other
-             person who certified (a), (b) or (c) and I have not modified
-             it.
-
-         (d) I understand and agree that this project and the contribution
-             are public and that a record of the contribution (including all
-             personal information I submit with it, including my sign-off) is
-             maintained indefinitely and may be redistributed consistent with
-             this project or the open source license(s) involved.
-
-   -  Provide a single-line summary of the change and, if more
-      explanation is needed, provide more detail in the body of the
-      commit. This summary is typically viewable in the "shortlist" of
-      changes. Thus, providing something short and descriptive that
-      gives the reader a summary of the change is useful when viewing a
-      list of many commits. You should prefix this short description
-      with the recipe name (if changing a recipe), or else with the
-      short form path to the file being changed.
-
-   -  For the body of the commit message, provide detailed information
-      that describes what you changed, why you made the change, and the
-      approach you used. It might also be helpful if you mention how you
-      tested the change. Provide as much detail as you can in the body
-      of the commit message.
-
-      .. note::
-
-         You do not need to provide a more detailed explanation of a
-         change if the change is minor to the point of the single line
-         summary providing all the information.
-
-   -  If the change addresses a specific bug or issue that is associated
-      with a bug-tracking ID, include a reference to that ID in your
-      detailed description. For example, the Yocto Project uses a
-      specific convention for bug references - any commit that addresses
-      a specific bug should use the following form for the detailed
-      description. Be sure to use the actual bug-tracking ID from
-      Bugzilla for bug-id::
-
-         Fixes [YOCTO #bug-id]
-
-         detailed description of change
-
-Using Email to Submit a Patch
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Depending on the components changed, you need to submit the email to a
-specific mailing list. For some guidance on which mailing list to use,
-see the
-:ref:`list <dev-manual/common-tasks:submitting a change to the yocto project>`
-at the beginning of this section. For a description of all the available
-mailing lists, see the ":ref:`Mailing Lists <resources-mailinglist>`" section in the
-Yocto Project Reference Manual.
-
-Here is the general procedure on how to submit a patch through email
-without using the scripts once the steps in
-:ref:`dev-manual/common-tasks:preparing changes for submission` have been followed:
-
-1. *Format the Commit:* Format the commit into an email message. To
-   format commits, use the ``git format-patch`` command. When you
-   provide the command, you must include a revision list or a number of
-   patches as part of the command. For example, either of these two
-   commands takes your most recent single commit and formats it as an
-   email message in the current directory::
-
-      $ git format-patch -1
-
-   or ::
-
-      $ git format-patch HEAD~
-
-   After the command is run, the current directory contains a numbered
-   ``.patch`` file for the commit.
-
-   If you provide several commits as part of the command, the
-   ``git format-patch`` command produces a series of numbered files in
-   the current directory – one for each commit. If you have more than
-   one patch, you should also use the ``--cover`` option with the
-   command, which generates a cover letter as the first "patch" in the
-   series. You can then edit the cover letter to provide a description
-   for the series of patches. For information on the
-   ``git format-patch`` command, see ``GIT_FORMAT_PATCH(1)`` displayed
-   using the ``man git-format-patch`` command.
-
-   .. note::
-
-      If you are or will be a frequent contributor to the Yocto Project
-      or to OpenEmbedded, you might consider requesting a contrib area
-      and the necessary associated rights.
-
-2. *Send the patches via email:* Send the patches to the recipients and
-   relevant mailing lists by using the ``git send-email`` command.
-
-   .. note::
-
-      In order to use ``git send-email``, you must have the proper Git packages
-      installed on your host.
-      For Ubuntu, Debian, and Fedora the package is ``git-email``.
-
-   The ``git send-email`` command sends email by using a local or remote
-   Mail Transport Agent (MTA) such as ``msmtp``, ``sendmail``, or
-   through a direct ``smtp`` configuration in your Git ``~/.gitconfig``
-   file. If you are submitting patches through email only, it is very
-   important that you submit them without any whitespace or HTML
-   formatting that either you or your mailer introduces. The maintainer
-   that receives your patches needs to be able to save and apply them
-   directly from your emails. A good way to verify that what you are
-   sending will be applicable by the maintainer is to do a dry run and
-   send them to yourself and then save and apply them as the maintainer
-   would.
-
-   The ``git send-email`` command is the preferred method for sending
-   your patches using email since there is no risk of compromising
-   whitespace in the body of the message, which can occur when you use
-   your own mail client. The command also has several options that let
-   you specify recipients and perform further editing of the email
-   message. For information on how to use the ``git send-email``
-   command, see ``GIT-SEND-EMAIL(1)`` displayed using the
-   ``man git-send-email`` command.
-
-The Yocto Project uses a `Patchwork instance <https://patchwork.yoctoproject.org/>`__
-to track the status of patches submitted to the various mailing lists and to
-support automated patch testing. Each submitted patch is checked for common
-mistakes and deviations from the expected patch format and submitters are
-notified by patchtest if such mistakes are found. This process helps to
-reduce the burden of patch review on maintainers.
-
-.. note::
-
-   This system is imperfect and changes can sometimes get lost in the flow.
-   Asking about the status of a patch or change is reasonable if the change
-   has been idle for a while with no feedback.
-
-Using Scripts to Push a Change Upstream and Request a Pull
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-For larger patch series it is preferable to send a pull request which not
-only includes the patch but also a pointer to a branch that can be pulled
-from. This involves making a local branch for your changes, pushing this
-branch to an accessible repository and then using the ``create-pull-request``
-and ``send-pull-request`` scripts from openembedded-core to create and send a
-patch series with a link to the branch for review.
-
-Follow this procedure to push a change to an upstream "contrib" Git
-repository once the steps in :ref:`dev-manual/common-tasks:preparing changes for submission` have
-been followed:
-
-.. note::
-
-   You can find general Git information on how to push a change upstream
-   in the
-   `Git Community Book <https://git-scm.com/book/en/v2/Distributed-Git-Distributed-Workflows>`__.
-
-1. *Push Your Commits to a "Contrib" Upstream:* If you have arranged for
-   permissions to push to an upstream contrib repository, push the
-   change to that repository::
-
-      $ git push upstream_remote_repo local_branch_name
-
-   For example, suppose you have permissions to push
-   into the upstream ``meta-intel-contrib`` repository and you are
-   working in a local branch named `your_name`\ ``/README``. The following
-   command pushes your local commits to the ``meta-intel-contrib``
-   upstream repository and puts the commit in a branch named
-   `your_name`\ ``/README``::
-
-      $ git push meta-intel-contrib your_name/README
-
-2. *Determine Who to Notify:* Determine the maintainer or the mailing
-   list that you need to notify for the change.
-
-   Before submitting any change, you need to be sure who the maintainer
-   is or what mailing list that you need to notify. Use either these
-   methods to find out:
-
-   -  *Maintenance File:* Examine the ``maintainers.inc`` file, which is
-      located in the :term:`Source Directory` at
-      ``meta/conf/distro/include``, to see who is responsible for code.
-
-   -  *Search by File:* Using :ref:`overview-manual/development-environment:git`, you can
-      enter the following command to bring up a short list of all
-      commits against a specific file::
-
-         git shortlog -- filename
-
-      Just provide the name of the file for which you are interested. The
-      information returned is not ordered by history but does include a
-      list of everyone who has committed grouped by name. From the list,
-      you can see who is responsible for the bulk of the changes against
-      the file.
-
-   -  *Examine the List of Mailing Lists:* For a list of the Yocto
-      Project and related mailing lists, see the ":ref:`Mailing
-      lists <resources-mailinglist>`" section in
-      the Yocto Project Reference Manual.
-
-3. *Make a Pull Request:* Notify the maintainer or the mailing list that
-   you have pushed a change by making a pull request.
-
-   The Yocto Project provides two scripts that conveniently let you
-   generate and send pull requests to the Yocto Project. These scripts
-   are ``create-pull-request`` and ``send-pull-request``. You can find
-   these scripts in the ``scripts`` directory within the
-   :term:`Source Directory` (e.g.
-   ``poky/scripts``).
-
-   Using these scripts correctly formats the requests without
-   introducing any whitespace or HTML formatting. The maintainer that
-   receives your patches either directly or through the mailing list
-   needs to be able to save and apply them directly from your emails.
-   Using these scripts is the preferred method for sending patches.
-
-   First, create the pull request. For example, the following command
-   runs the script, specifies the upstream repository in the contrib
-   directory into which you pushed the change, and provides a subject
-   line in the created patch files::
-
-      $ poky/scripts/create-pull-request -u meta-intel-contrib -s "Updated Manual Section Reference in README"
-
-   Running this script forms ``*.patch`` files in a folder named
-   ``pull-``\ `PID` in the current directory. One of the patch files is a
-   cover letter.
-
-   Before running the ``send-pull-request`` script, you must edit the
-   cover letter patch to insert information about your change. After
-   editing the cover letter, send the pull request. For example, the
-   following command runs the script and specifies the patch directory
-   and email address. In this example, the email address is a mailing
-   list::
-
-      $ poky/scripts/send-pull-request -p ~/meta-intel/pull-10565 -t meta-intel@lists.yoctoproject.org
-
-   You need to follow the prompts as the script is interactive.
-
-   .. note::
-
-      For help on using these scripts, simply provide the ``-h``
-      argument as follows::
-
-              $ poky/scripts/create-pull-request -h
-              $ poky/scripts/send-pull-request -h
-
-Responding to Patch Review
-~~~~~~~~~~~~~~~~~~~~~~~~~~
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
-Submitting Changes to Stable Release Branches
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-The process for proposing changes to a Yocto Project stable branch differs
-from the steps described above. Changes to a stable branch must address
-identified bugs or CVEs and should be made carefully in order to avoid the
-risk of introducing new bugs or breaking backwards compatibility. Typically
-bug fixes must already be accepted into the master branch before they can be
-backported to a stable branch unless the bug in question does not affect the
-master branch or the fix on the master branch is unsuitable for backporting.
-
-The list of stable branches along with the status and maintainer for each
-branch can be obtained from the
-:yocto_wiki:`Releases wiki page </Releases>`.
-
-.. note::
-
-   Changes will not typically be accepted for branches which are marked as
-   End-Of-Life (EOL).
-
-With this in mind, the steps to submit a change for a stable branch are as
-follows:
-
-1. *Identify the bug or CVE to be fixed:* This information should be
-   collected so that it can be included in your submission.
-
-   See :ref:`dev-manual/common-tasks:checking for vulnerabilities`
-   for details about CVE tracking.
-
-2. *Check if the fix is already present in the master branch:* This will
-   result in the most straightforward path into the stable branch for the
-   fix.
-
-   a. *If the fix is present in the master branch - Submit a backport request
-      by email:* You should send an email to the relevant stable branch
-      maintainer and the mailing list with details of the bug or CVE to be
-      fixed, the commit hash on the master branch that fixes the issue and
-      the stable branches which you would like this fix to be backported to.
-
-   b. *If the fix is not present in the master branch - Submit the fix to the
-      master branch first:* This will ensure that the fix passes through the
-      project's usual patch review and test processes before being accepted.
-      It will also ensure that bugs are not left unresolved in the master
-      branch itself. Once the fix is accepted in the master branch a backport
-      request can be submitted as above.
-
-   c. *If the fix is unsuitable for the master branch - Submit a patch
-      directly for the stable branch:* This method should be considered as a
-      last resort. It is typically necessary when the master branch is using
-      a newer version of the software which includes an upstream fix for the
-      issue or when the issue has been fixed on the master branch in a way
-      that introduces backwards incompatible changes. In this case follow the
-      steps in :ref:`dev-manual/common-tasks:preparing changes for submission` and
-      :ref:`dev-manual/common-tasks:using email to submit a patch` but modify the subject header of your patch
-      email to include the name of the stable branch which you are
-      targetting. This can be done using the ``--subject-prefix`` argument to
-      ``git format-patch``, for example to submit a patch to the dunfell
-      branch use
-      ``git format-patch --subject-prefix='&DISTRO_NAME_NO_CAP_MINUS_ONE;][PATCH' ...``.
-
 Working With Licenses
 =====================
 
@@ -11485,7 +10959,7 @@ issues may be impacting Poky and OE-Core. It is up to the maintainers, users,
 contributors and anyone interested in the issues to investigate and possibly fix them by
 updating software components to newer versions or by applying patches to address them.
 It is recommended to work with Poky and OE-Core upstream maintainers and submit
-patches to fix them, see ":ref:`dev-manual/common-tasks:submitting a change to the yocto project`" for details.
+patches to fix them, see :doc:`../contributor-guide/submit-changes` for details.
 
 Vulnerability check at build time
 ---------------------------------
diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index 96fabac1aa..d5e702a5a4 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -246,14 +246,13 @@ particular working environment and set of practices.
     -  The Yocto Project community encourages you to send patches to the
        project to fix bugs or add features. If you do submit patches,
        follow the project commit guidelines for writing good commit
-       messages. See the
-       ":ref:`dev-manual/common-tasks:submitting a change to the yocto project`"
-       section.
+       messages. See the ":doc:`../contributor-guide/submit-changes`"
+       section in the Yocto Project and OpenEmbedded Contributor Guide.
 
     -  Send changes to the core sooner than later as others are likely
        to run into the same issues. For some guidance on mailing lists
-       to use, see the list in the
-       ":ref:`dev-manual/common-tasks:submitting a change to the yocto project`"
+       to use, see the lists in the
+       ":ref:`contributor-guide/submit-changes:finding a suitable mailing list`"
        section. For a description
        of the available mailing lists, see the ":ref:`resources-mailinglist`" section in
        the Yocto Project Reference Manual.
diff --git a/documentation/index.rst b/documentation/index.rst
index 6335c707e0..3fef1704a4 100644
--- a/documentation/index.rst
+++ b/documentation/index.rst
@@ -26,6 +26,7 @@ Welcome to the Yocto Project Documentation
    :caption: Manuals
 
    Overview and Concepts Manual <overview-manual/index>
+   Contributor Guide <contributor-guide/index>
    Reference Manual <ref-manual/index>
    Board Support Package (BSP) Developer's guide <bsp-guide/index>
    Development Tasks Manual <dev-manual/index>
diff --git a/documentation/overview-manual/development-environment.rst b/documentation/overview-manual/development-environment.rst
index 19095fc116..5b182e70e3 100644
--- a/documentation/overview-manual/development-environment.rst
+++ b/documentation/overview-manual/development-environment.rst
@@ -244,8 +244,8 @@ and so forth.
 
    For information on finding out who is responsible for (maintains) a
    particular area of code in the Yocto Project, see the
-   ":ref:`dev-manual/common-tasks:submitting a change to the yocto project`"
-   section of the Yocto Project Development Tasks Manual.
+   ":doc:`../contributor-guide/identify-component`"
+   section of the Yocto Project and OpenEmbedded Contributor Guide.
 
 The Yocto Project ``poky`` Git repository also has an upstream
 contribution Git repository named ``poky-contrib``. You can see all the
@@ -276,8 +276,8 @@ push them into the "contrib" area and subsequently request that the
 maintainer include them into an upstream branch. This process is called
 "submitting a patch" or "submitting a change." For information on
 submitting patches and changes, see the
-":ref:`dev-manual/common-tasks:submitting a change to the yocto project`"
-section in the Yocto Project Development Tasks Manual.
+":doc:`../contributor-guide/submit-changes`" section in the Yocto Project
+and OpenEmbedded Contributor Guide.
 
 In summary, there is a single point of entry for changes into the
 development branch of the Git repository, which is controlled by the
@@ -340,11 +340,10 @@ Book <https://book.git-scm.com>`__.
    software on which to develop. The Yocto Project has two scripts named
    ``create-pull-request`` and ``send-pull-request`` that ship with the
    release to facilitate this workflow. You can find these scripts in
-   the ``scripts`` folder of the
-   :term:`Source Directory`. For information
+   the ``scripts`` folder of the :term:`Source Directory`. For information
    on how to use these scripts, see the
-   ":ref:`dev-manual/common-tasks:using scripts to push a change upstream and request a pull`"
-   section in the Yocto Project Development Tasks Manual.
+   ":ref:`contributor-guide/submit-changes:using scripts to push a change upstream and request a pull`"
+   section in the Yocto Project and OpenEmbedded Contributor Guide.
 
 -  *Patch Workflow:* This workflow allows you to notify the maintainer
    through an email that you have a change (or patch) you would like
@@ -352,8 +351,8 @@ Book <https://book.git-scm.com>`__.
    this type of change, you format the patch and then send the email
    using the Git commands ``git format-patch`` and ``git send-email``.
    For information on how to use these scripts, see the
-   ":ref:`dev-manual/common-tasks:submitting a change to the yocto project`"
-   section in the Yocto Project Development Tasks Manual.
+   ":doc:`../contributor-guide/submit-changes`" section in the Yocto Project
+   and OpenEmbedded Contributor Guide.
 
 Git
 ===
diff --git a/documentation/ref-manual/resources.rst b/documentation/ref-manual/resources.rst
index c942384662..a175a1db8e 100644
--- a/documentation/ref-manual/resources.rst
+++ b/documentation/ref-manual/resources.rst
@@ -23,8 +23,7 @@ The Yocto Project gladly accepts contributions. You can submit changes
 to the project either by creating and sending pull requests, or by
 submitting patches through email. For information on how to do both as
 well as information on how to identify the maintainer for each area of
-code, see the ":ref:`dev-manual/common-tasks:submitting a change to the yocto project`" section in the
-Yocto Project Development Tasks Manual.
+code, see the :doc:`../contributor-guide/index`.
 
 .. _resources-bugtracker:
 
@@ -46,8 +45,8 @@ your expectations).
 For a general procedure and guidelines on how to use Bugzilla to submit a bug
 against the Yocto Project, see the following:
 
--  The ":ref:`dev-manual/common-tasks:submitting a defect against the yocto project`"
-   section in the Yocto Project Development Tasks Manual.
+-  The ":doc:`../contributor-guide/report-defect`"
+   section in the Yocto Project and OpenEmbedded Contributor Guide.
 
 -  The Yocto Project :yocto_wiki:`Bugzilla wiki page </Bugzilla_Configuration_and_Bug_Tracking>`
 
diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 83e9ea0f43..2527b5bdb6 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -115,9 +115,8 @@ tested on former revisions of "&DISTRO_NAME;", but no longer are:
       interested in hearing about your experience. For information on
       how to submit a bug, see the Yocto Project
       :yocto_wiki:`Bugzilla wiki page </Bugzilla_Configuration_and_Bug_Tracking>`
-      and the ":ref:`dev-manual/common-tasks:submitting a defect against the yocto project`"
-      section in the Yocto Project Development Tasks Manual.
-
+      and the ":doc:`../contributor-guide/report-defect`"
+      section in the Yocto Project and OpenEmbedded Contributor Guide.
 
 Required Packages for the Build Host
 ====================================
-- 
2.34.1


