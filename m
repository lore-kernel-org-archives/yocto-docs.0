Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0A0FC6FA8E
	for <webhook@archiver.kernel.org>; Thu,  2 Mar 2023 20:31:41 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web10.5556.1677789095918774927
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Mar 2023 12:31:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=olhpJ0M+;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7683B100002;
	Thu,  2 Mar 2023 20:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677789093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Vit0Qcd2caFOxGxdjfNXF9l7Ktnmf8oV7eR6ppyc6R4=;
	b=olhpJ0M+cAe0UTtGOLELQdPOD+qCWfOXjv+jscJ/UsTPojDTwCW6Bjizo1MJYmsd5dB269
	C7nSM0JIVfS3NvAGcifO6m0sKNtaRB4wQi8J+ItjqxQhjjwH5IScZOFqN5D8rwUziyowov
	CKdvOKpemihdyTyTgbix/A9JOhHcBK4flhBg9oeOenVS/j0V0NZ/LK0kMQ/RVkVgUe4Okd
	Hc9sB218xUFHwcmBNfcSTxVvMHylPZczxhK5uBl04zbr9ehKAHVFl9UmD7wYcnZMY7j9xm
	xKis7w+af9fyoa6/BzZDyjUBidxUYx3O5XTYEEcBgxFx4qpiuYktRHPCpNgnag==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] manuals: simplify references to the BitBake User Manual
Date: Thu,  2 Mar 2023 21:31:31 +0100
Message-Id: <20230302203131.513770-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 Mar 2023 20:31:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3780

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

- Replacing
  :ref:`bitbake:bitbake-user-manual/...`
  by :ref:`bitbake-user-manual/...`

  Adding "bitbake:" as a prefix is not necessary
  as there is no naming conflict between the YP
  and the BitBake manuals (all documents are in
  "bitbake-user-manual/")

- Explaining the rules in the README file

- When necessary, fixing line length in the modified paragraphs.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/README                          | 18 +++--
 documentation/brief-yoctoprojectqs/index.rst  |  2 +-
 documentation/dev-manual/debugging.rst        | 29 ++++---
 documentation/dev-manual/new-recipe.rst       | 26 +++---
 documentation/dev-manual/packages.rst         | 12 +--
 .../dev-manual/python-development-shell.rst   |  2 +-
 documentation/kernel-dev/advanced.rst         | 20 +++--
 .../migration-guides/migration-2.2.rst        |  9 +--
 .../migration-guides/migration-2.3.rst        |  6 +-
 .../migration-guides/migration-2.4.rst        |  2 +-
 .../migration-guides/migration-2.6.rst        |  2 +-
 .../migration-guides/migration-3.4.rst        |  2 +-
 .../migration-guides/migration-4.0.rst        |  4 +-
 .../migration-guides/release-notes-4.0.rst    |  2 +-
 documentation/overview-manual/concepts.rst    | 69 +++++++---------
 documentation/overview-manual/yp-intro.rst    |  2 +-
 .../ref-manual/devtool-reference.rst          |  2 +-
 documentation/ref-manual/tasks.rst            | 10 +--
 documentation/ref-manual/variables.rst        | 80 +++++++++----------
 .../sdk-manual/appendix-customizing.rst       |  2 +-
 documentation/sdk-manual/extensible.rst       | 11 ++-
 21 files changed, 150 insertions(+), 162 deletions(-)

diff --git a/documentation/README b/documentation/README
index c27ed86a33..e8aed86eb4 100644
--- a/documentation/README
+++ b/documentation/README
@@ -357,13 +357,16 @@ The sphinx.ext.intersphinx extension is enabled by default
 so that we can cross reference content from other Sphinx based
 documentation projects, such as the BitBake manual.
 
-References to the BitBake manual can be done:
+References to the BitBake manual can directly be done:
  - With a specific description instead of the section name:
-  :ref:`Azure Storage fetcher (az://) <bitbake:bitbake-user-manual/bitbake-user-manual-fetching:fetchers>`
+  :ref:`Azure Storage fetcher (az://) <bitbake-user-manual/bitbake-user-manual-fetching:fetchers>`
  - With the section name:
-  :ref:`bitbake:bitbake-user-manual/bitbake-user-manual-intro:usage and syntax` option
- - Linking to the entire BitBake manual:
-  :doc:`BitBake User Manual <bitbake:index>`
+  :ref:`bitbake-user-manual/bitbake-user-manual-intro:usage and syntax` option
+
+If you want to refer to an entire document (or chapter) in the BitBake manual,
+you have to use the ":doc:" macro with the "bitbake:" prefix:
+ - :doc:`BitBake User Manual <bitbake:index>`
+ - :doc:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata`" chapter
 
 Note that a reference to a variable (:term:`VARIABLE`) automatically points to
 the BitBake manual if the variable is not described in the Reference Manual's Variable Glossary.
@@ -372,6 +375,11 @@ BitBake manual as follows:
 
   :term:`bitbake:BB_NUMBER_PARSE_THREADS`
 
+This would be the same if we had identical document filenames in
+both the Yocto Project and BitBake manuals:
+
+  :ref:`bitbake:directory/file:section title`
+
 Submitting documentation changes
 ================================
 
diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index cfdd14ae4a..c8310e0066 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -262,7 +262,7 @@ an entire Linux distribution, including the toolchain, from source.
    For information on using the ``bitbake`` command, see the
    :ref:`overview-manual/concepts:bitbake` section in the Yocto Project Overview and
    Concepts Manual, or see
-   :ref:`bitbake:bitbake-user-manual/bitbake-user-manual-intro:the bitbake command`
+   :ref:`bitbake-user-manual/bitbake-user-manual-intro:the bitbake command`
    in the BitBake User Manual.
 
 #. **Simulate Your Image Using QEMU:** Once this particular image is
diff --git a/documentation/dev-manual/debugging.rst b/documentation/dev-manual/debugging.rst
index edf2997d1f..cfbbf92bdb 100644
--- a/documentation/dev-manual/debugging.rst
+++ b/documentation/dev-manual/debugging.rst
@@ -99,7 +99,7 @@ Viewing Variable Values
 Sometimes you need to know the value of a variable as a result of
 BitBake's parsing step. This could be because some unexpected behavior
 occurred in your project. Perhaps an attempt to :ref:`modify a variable
-<bitbake:bitbake-user-manual/bitbake-user-manual-metadata:modifying existing
+<bitbake-user-manual/bitbake-user-manual-metadata:modifying existing
 variables>` did not work out as expected.
 
 BitBake's ``-e`` option is used to display variable values after
@@ -273,15 +273,14 @@ Viewing Task Variable Dependencies
 ==================================
 
 As mentioned in the
-":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-execution:checksums (signatures)`" section of the BitBake
-User Manual, BitBake tries to automatically determine what variables a
-task depends on so that it can rerun the task if any values of the
-variables change. This determination is usually reliable. However, if
-you do things like construct variable names at runtime, then you might
-have to manually declare dependencies on those variables using
-``vardeps`` as described in the
-":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata:variable flags`" section of the BitBake
-User Manual.
+":ref:`bitbake-user-manual/bitbake-user-manual-execution:checksums (signatures)`"
+section of the BitBake User Manual, BitBake tries to automatically determine
+what variables a task depends on so that it can rerun the task if any values of
+the variables change. This determination is usually reliable. However, if you
+do things like construct variable names at runtime, then you might have to
+manually declare dependencies on those variables using ``vardeps`` as described
+in the ":ref:`bitbake-user-manual/bitbake-user-manual-metadata:variable flags`"
+section of the BitBake User Manual.
 
 If you are unsure whether a variable dependency is being picked up
 automatically for a given task, you can list the variable dependencies
@@ -447,7 +446,7 @@ out), then you can use the ``-f`` option.
 
    The reason ``-f`` is never required when running the
    :ref:`ref-tasks-devshell` task is because the
-   [\ :ref:`nostamp <bitbake:bitbake-user-manual/bitbake-user-manual-metadata:variable flags>`\ ]
+   [\ :ref:`nostamp <bitbake-user-manual/bitbake-user-manual-metadata:variable flags>`\ ]
    variable flag is already set for the task.
 
 The following example shows one way you can use the ``-f`` option::
@@ -562,10 +561,10 @@ log to ``${T}/log.do_``\ `task`, and can also log to standard output
 -  ``bb.note(msg)``: Writes "NOTE: msg" to the log. Also logs to
    stdout if BitBake is called with "-v".
 
--  ``bb.debug(level, msg)``: Writes "DEBUG: msg" to the
-   log. Also logs to stdout if the log level is greater than or equal to
-   level. See the ":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-intro:usage and syntax`" option
-   in the BitBake User Manual for more information.
+-  ``bb.debug(level, msg)``: Writes "DEBUG: msg" to the log. Also logs to
+   stdout if the log level is greater than or equal to level. See the
+   ":ref:`bitbake-user-manual/bitbake-user-manual-intro:usage and syntax`"
+   option in the BitBake User Manual for more information.
 
 -  ``bb.warn(msg)``: Writes "WARNING: msg" to the log while also
    logging to stdout.
diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-manual/new-recipe.rst
index ba87a16870..e0310c3346 100644
--- a/documentation/dev-manual/new-recipe.rst
+++ b/documentation/dev-manual/new-recipe.rst
@@ -256,15 +256,14 @@ located. For a graphical representation of source locations, see the
 ":ref:`overview-manual/concepts:sources`" section in
 the Yocto Project Overview and Concepts Manual.
 
-The :ref:`ref-tasks-fetch` task uses
-the prefix of each entry in the :term:`SRC_URI` variable value to determine
-which :ref:`fetcher <bitbake:bitbake-user-manual/bitbake-user-manual-fetching:fetchers>` to use to get your
-source files. It is the :term:`SRC_URI` variable that triggers the fetcher.
-The :ref:`ref-tasks-patch` task uses
-the variable after source is fetched to apply patches. The OpenEmbedded
-build system uses
-:term:`FILESOVERRIDES` for
-scanning directory locations for local files in :term:`SRC_URI`.
+The :ref:`ref-tasks-fetch` task uses the prefix of each entry in the
+:term:`SRC_URI` variable value to determine which
+:ref:`fetcher <bitbake-user-manual/bitbake-user-manual-fetching:fetchers>`
+to use to get your source files. It is the :term:`SRC_URI` variable that triggers
+the fetcher. The :ref:`ref-tasks-patch` task uses the variable after source is
+fetched to apply patches. The OpenEmbedded build system uses
+:term:`FILESOVERRIDES` for scanning directory locations for local files in
+:term:`SRC_URI`.
 
 The :term:`SRC_URI` variable in your recipe must define each unique location
 for your source files. It is good practice to not hard-code version
@@ -1417,12 +1416,9 @@ doing the following:
       do_configure[noexec] = "1"
       do_compile[noexec] = "1"
 
-   Unlike
-   :ref:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata:deleting a task`,
-   using the flag preserves the dependency chain from the
-   :ref:`ref-tasks-fetch`,
-   :ref:`ref-tasks-unpack`, and
-   :ref:`ref-tasks-patch` tasks to the
+   Unlike :ref:`bitbake-user-manual/bitbake-user-manual-metadata:deleting a task`,
+   using the flag preserves the dependency chain from the :ref:`ref-tasks-fetch`,
+   :ref:`ref-tasks-unpack`, and :ref:`ref-tasks-patch` tasks to the
    :ref:`ref-tasks-install` task.
 
 -  Make sure your :ref:`ref-tasks-install` task installs the binaries
diff --git a/documentation/dev-manual/packages.rst b/documentation/dev-manual/packages.rst
index 0b7f3d716a..20f5586c9a 100644
--- a/documentation/dev-manual/packages.rst
+++ b/documentation/dev-manual/packages.rst
@@ -997,12 +997,12 @@ test. Here is what you have to do for each recipe:
 Creating Node Package Manager (NPM) Packages
 ============================================
 
-:wikipedia:`NPM <Npm_(software)>` is a package
-manager for the JavaScript programming language. The Yocto Project
-supports the NPM :ref:`fetcher <bitbake:bitbake-user-manual/bitbake-user-manual-fetching:fetchers>`. You can
-use this fetcher in combination with
-:doc:`devtool </ref-manual/devtool-reference>` to create
-recipes that produce NPM packages.
+:wikipedia:`NPM <Npm_(software)>` is a package manager for the JavaScript
+programming language. The Yocto Project supports the NPM
+:ref:`fetcher <bitbake-user-manual/bitbake-user-manual-fetching:fetchers>`.
+You can use this fetcher in combination with
+:doc:`devtool </ref-manual/devtool-reference>` to create recipes that produce
+NPM packages.
 
 There are two workflows that allow you to create NPM packages using
 ``devtool``: the NPM registry modules method and the NPM project code
diff --git a/documentation/dev-manual/python-development-shell.rst b/documentation/dev-manual/python-development-shell.rst
index 1b213318a5..2dc6a3f138 100644
--- a/documentation/dev-manual/python-development-shell.rst
+++ b/documentation/dev-manual/python-development-shell.rst
@@ -27,7 +27,7 @@ functions::
    pydevshell> bb.build.exec_func("do_unpack", d)
    pydevshell>
 
-See the ":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata:functions you can call from within python`"
+See the ":ref:`bitbake-user-manual/bitbake-user-manual-metadata:functions you can call from within python`"
 section in the BitBake User Manual for details about available functions.
 
 The commands execute just as if the OpenEmbedded build
diff --git a/documentation/kernel-dev/advanced.rst b/documentation/kernel-dev/advanced.rst
index a8734900a0..35195135c4 100644
--- a/documentation/kernel-dev/advanced.rst
+++ b/documentation/kernel-dev/advanced.rst
@@ -352,17 +352,15 @@ in the manual.
 Kernel Types
 ------------
 
-A kernel type defines a high-level kernel policy by aggregating
-non-hardware configuration fragments with patches you want to use when
-building a Linux kernel of a specific type (e.g. a real-time kernel).
-Syntactically, kernel types are no different than features as described
-in the ":ref:`kernel-dev/advanced:features`" section. The
-:term:`LINUX_KERNEL_TYPE`
-variable in the kernel recipe selects the kernel type. For example, in
-the ``linux-yocto_4.12.bb`` kernel recipe found in
-``poky/meta/recipes-kernel/linux``, a
-:ref:`require <bitbake:bitbake-user-manual/bitbake-user-manual-metadata:\`\`require\`\` directive>` directive
-includes the ``poky/meta/recipes-kernel/linux/linux-yocto.inc`` file,
+A kernel type defines a high-level kernel policy by aggregating non-hardware
+configuration fragments with patches you want to use when building a Linux
+kernel of a specific type (e.g. a real-time kernel). Syntactically, kernel
+types are no different than features as described in the
+":ref:`kernel-dev/advanced:features`" section. The :term:`LINUX_KERNEL_TYPE`
+variable in the kernel recipe selects the kernel type. For example, in the
+``linux-yocto_4.12.bb`` kernel recipe found in ``poky/meta/recipes-kernel/linux``, a
+:ref:`require <bitbake-user-manual/bitbake-user-manual-metadata:\`\`require\`\` directive>`
+directive includes the ``poky/meta/recipes-kernel/linux/linux-yocto.inc`` file,
 which has the following statement that defines the default kernel type::
 
    LINUX_KERNEL_TYPE ??= "standard"
diff --git a/documentation/migration-guides/migration-2.2.rst b/documentation/migration-guides/migration-2.2.rst
index 2d4f4d603e..5435835102 100644
--- a/documentation/migration-guides/migration-2.2.rst
+++ b/documentation/migration-guides/migration-2.2.rst
@@ -121,11 +121,10 @@ compared to uClibc.
 ``${B}`` No Longer Default Working Directory for Tasks
 ------------------------------------------------------
 
-``${``\ :term:`B`\ ``}`` is no longer the default working
-directory for tasks. Consequently, any custom tasks you define now need
-to either have the
-``[``\ :ref:`dirs <bitbake:bitbake-user-manual/bitbake-user-manual-metadata:variable flags>`\ ``]`` flag
-set, or the task needs to change into the appropriate working directory
+``${``\ :term:`B`\ ``}`` is no longer the default working directory for tasks.
+Consequently, any custom tasks you define now need to either have the
+``[``\ :ref:`dirs <bitbake-user-manual/bitbake-user-manual-metadata:variable flags>`\ ``]``
+flag set, or the task needs to change into the appropriate working directory
 manually (e.g using ``cd`` for a shell task).
 
 .. note::
diff --git a/documentation/migration-guides/migration-2.3.rst b/documentation/migration-guides/migration-2.3.rst
index 38117d41b4..60340b9592 100644
--- a/documentation/migration-guides/migration-2.3.rst
+++ b/documentation/migration-guides/migration-2.3.rst
@@ -198,9 +198,9 @@ The following changes took place for BitBake:
    fetcher passes the new parameter through the ``SVN_SSH`` environment
    variable during the :ref:`ref-tasks-fetch` task.
 
-   See the ":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-fetching:subversion (svn) fetcher (\`\`svn://\`\`)`"
-   section in the BitBake
-   User Manual for additional information.
+   See the
+   ":ref:`bitbake-user-manual/bitbake-user-manual-fetching:subversion (svn) fetcher (\`\`svn://\`\`)`"
+   section in the BitBake User Manual for additional information.
 
 -  ``BB_SETSCENE_VERIFY_FUNCTION`` and ``BB_SETSCENE_VERIFY_FUNCTION2``
    Removed: Because the mechanism they were part of is no longer
diff --git a/documentation/migration-guides/migration-2.4.rst b/documentation/migration-guides/migration-2.4.rst
index 9637301a47..abad43acc3 100644
--- a/documentation/migration-guides/migration-2.4.rst
+++ b/documentation/migration-guides/migration-2.4.rst
@@ -286,7 +286,7 @@ The following are additional changes:
 
 -  BitBake fires multiple "BuildStarted" events when multiconfig is
    enabled (one per configuration). For more information, see the
-   ":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata:events`"
+   ":ref:`bitbake-user-manual/bitbake-user-manual-metadata:events`"
    section in the BitBake User Manual.
 
 -  By default, the ``security_flags.inc`` file sets a
diff --git a/documentation/migration-guides/migration-2.6.rst b/documentation/migration-guides/migration-2.6.rst
index 477714b489..dd21eb3baf 100644
--- a/documentation/migration-guides/migration-2.6.rst
+++ b/documentation/migration-guides/migration-2.6.rst
@@ -274,7 +274,7 @@ The following changes have occurred:
    specifying list items to remove, be aware that leading and trailing
    whitespace resulting from the removal is retained.
 
-   See the ":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata:removal (override style syntax)`"
+   See the ":ref:`bitbake-user-manual/bitbake-user-manual-metadata:removal (override style syntax)`"
    section in the BitBake User Manual for a detailed example.
 
 .. _migration-2.6-systemd-configuration-now-split-out-to-system-conf:
diff --git a/documentation/migration-guides/migration-3.4.rst b/documentation/migration-guides/migration-3.4.rst
index 076c589c8c..a80d43a86b 100644
--- a/documentation/migration-guides/migration-3.4.rst
+++ b/documentation/migration-guides/migration-3.4.rst
@@ -45,7 +45,7 @@ would now become::
    BB_TASK_NICE_LEVEL:task-testimage = '0'
 
 This also applies to
-:ref:`variable queries to the datastore <bitbake:bitbake-user-manual/bitbake-user-manual-metadata:functions for accessing datastore variables>`,
+:ref:`variable queries to the datastore <bitbake-user-manual/bitbake-user-manual-metadata:functions for accessing datastore variables>`,
 for example using ``getVar`` and similar so ``d.getVar("RDEPENDS_${PN}")``
 becomes ``d.getVar("RDEPENDS:${PN}")``.
 
diff --git a/documentation/migration-guides/migration-4.0.rst b/documentation/migration-guides/migration-4.0.rst
index 3106498404..2aa9145ef8 100644
--- a/documentation/migration-guides/migration-4.0.rst
+++ b/documentation/migration-guides/migration-4.0.rst
@@ -207,8 +207,8 @@ For the ``append`` plus ``+=`` (and ``prepend`` plus ``=+``) combinations,
 the content should be prefixed (respectively suffixed) by a space to maintain
 the same behavior.  You can learn more about override style syntax operators
 (``append``, ``prepend`` and ``remove``) in the BitBake documentation:
-:ref:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata:appending and prepending (override style syntax)`
-and :ref:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata:removal (override style syntax)`.
+:ref:`bitbake-user-manual/bitbake-user-manual-metadata:appending and prepending (override style syntax)`
+and :ref:`bitbake-user-manual/bitbake-user-manual-metadata:removal (override style syntax)`.
 
 Miscellaneous changes
 ~~~~~~~~~~~~~~~~~~~~~
diff --git a/documentation/migration-guides/release-notes-4.0.rst b/documentation/migration-guides/release-notes-4.0.rst
index 563113b4db..6eb5f807de 100644
--- a/documentation/migration-guides/release-notes-4.0.rst
+++ b/documentation/migration-guides/release-notes-4.0.rst
@@ -115,7 +115,7 @@ New Features / Enhancements in 4.0
 
    - Fetcher enhancements:
    
-      - New :ref:`bitbake:bitbake-user-manual/bitbake-user-manual-fetching:crate fetcher (\`\`crate://\`\`)` for Rust packages
+      - New :ref:`bitbake-user-manual/bitbake-user-manual-fetching:crate fetcher (\`\`crate://\`\`)` for Rust packages
       - Added striplevel support to unpack
       - git: Add a warning asking users to set a branch in git urls
       - git: Allow git fetcher to support subdir param
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 4cee4bb169..2938571c68 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -69,12 +69,10 @@ type the following::
 
    $ bitbake matchbox-desktop
 
-Several different
-versions of ``matchbox-desktop`` might exist. BitBake chooses the one
-selected by the distribution configuration. You can get more details
-about how BitBake chooses between different target versions and
-providers in the
-":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-execution:preferences`" section
+Several different versions of ``matchbox-desktop`` might exist. BitBake chooses
+the one selected by the distribution configuration. You can get more details
+about how BitBake chooses between different target versions and providers in the
+":ref:`bitbake-user-manual/bitbake-user-manual-execution:preferences`" section
 of the BitBake User Manual.
 
 BitBake also tries to execute any dependent tasks first. So for example,
@@ -570,13 +568,11 @@ Source Control Managers (Optional)
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 Another place from which the build system can get source files is with
-:ref:`bitbake:bitbake-user-manual/bitbake-user-manual-fetching:fetchers` employing various Source
-Control Managers (SCMs) such as Git or Subversion. In such cases, a
-repository is cloned or checked out. The
-:ref:`ref-tasks-fetch` task inside
-BitBake uses the :term:`SRC_URI`
-variable and the argument's prefix to determine the correct fetcher
-module.
+:ref:`bitbake-user-manual/bitbake-user-manual-fetching:fetchers` employing
+various Source Control Managers (SCMs) such as Git or Subversion. In such
+cases, a repository is cloned or checked out. The :ref:`ref-tasks-fetch` task
+inside BitBake uses the :term:`SRC_URI` variable and the argument's prefix to
+determine the correct fetcher module.
 
 .. note::
 
@@ -1145,7 +1141,7 @@ Since :term:`STAMPS_DIR` is usually a subdirectory of :term:`TMPDIR`, removing
 properly be rerun to repopulate :term:`TMPDIR`.
 
 If you want some task to always be considered "out of date", you can
-mark it with the :ref:`nostamp <bitbake:bitbake-user-manual/bitbake-user-manual-metadata:variable flags>`
+mark it with the :ref:`nostamp <bitbake-user-manual/bitbake-user-manual-metadata:variable flags>`
 varflag. If some other task depends on such a task, then that task will
 also always be considered out of date, which might not be what you want.
 
@@ -1811,19 +1807,18 @@ The following list explains the previous example:
       }
       addtask do_deploy_setscene
 
-  ``sstate_setscene()`` takes the flags above as input and accelerates the :ref:`ref-tasks-deploy` task
-  through the shared state cache if possible. If the task was
-  accelerated, ``sstate_setscene()`` returns True. Otherwise, it
-  returns False, and the normal :ref:`ref-tasks-deploy` task runs. For more
-  information, see the ":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-execution:setscene`"
-  section in the BitBake User Manual.
+   ``sstate_setscene()`` takes the flags above as input and accelerates the
+   :ref:`ref-tasks-deploy` task through the shared state cache if possible. If
+   the task was accelerated, ``sstate_setscene()`` returns True. Otherwise, it
+   returns False, and the normal :ref:`ref-tasks-deploy` task runs. For more
+   information, see the ":ref:`bitbake-user-manual/bitbake-user-manual-execution:setscene`"
+   section in the BitBake User Manual.
 
--  The ``do_deploy[dirs] = "${DEPLOYDIR} ${B}"`` line creates
-   ``${DEPLOYDIR}`` and ``${B}`` before the :ref:`ref-tasks-deploy` task runs, and
-   also sets the current working directory of :ref:`ref-tasks-deploy` to ``${B}``.
-   For more information, see the ":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata:variable flags`"
-   section in the BitBake
-   User Manual.
+-  The ``do_deploy[dirs] = "${DEPLOYDIR} ${B}"`` line creates ``${DEPLOYDIR}``
+   and ``${B}`` before the :ref:`ref-tasks-deploy` task runs, and also sets the
+   current working directory of :ref:`ref-tasks-deploy` to ``${B}``. For more
+   information, see the ":ref:`bitbake-user-manual/bitbake-user-manual-metadata:variable flags`"
+   section in the BitBake User Manual.
 
    .. note::
 
@@ -1835,12 +1830,10 @@ The following list explains the previous example:
               do_package[sstate-plaindirs] = "${PKGD} ${PKGDEST}"
 
 
--  The ``do_deploy[stamp-extra-info] = "${MACHINE_ARCH}"`` line appends
-   extra metadata to the :ref:`stamp
-   file <overview-manual/concepts:stamp files and the rerunning of tasks>`. In
-   this case, the metadata makes the task specific to a machine's architecture.
-   See
-   ":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-execution:the task list`"
+-  The ``do_deploy[stamp-extra-info] = "${MACHINE_ARCH}"`` line appends extra
+   metadata to the :ref:`stamp file <overview-manual/concepts:stamp files and the rerunning of tasks>`.
+   In this case, the metadata makes the task specific to a machine's architecture.
+   See the ":ref:`bitbake-user-manual/bitbake-user-manual-execution:the task list`"
    section in the BitBake User Manual for more information on the
    ``stamp-extra-info`` flag.
 
@@ -2122,12 +2115,12 @@ dependencies, you must manually declare the dependencies.
    :term:`ALLOW_EMPTY` variable
    for more information.
 
-The :ref:`ref-tasks-package` task depends on the :ref:`ref-tasks-packagedata` task of each
-recipe in :term:`DEPENDS` through use
-of a ``[``\ :ref:`deptask <bitbake:bitbake-user-manual/bitbake-user-manual-metadata:variable flags>`\ ``]``
-declaration, which guarantees that the required
-shared-library/module-to-package mapping information will be available
-when needed as long as :term:`DEPENDS` has been correctly set.
+The :ref:`ref-tasks-package` task depends on the :ref:`ref-tasks-packagedata`
+task of each recipe in :term:`DEPENDS` through use of a
+``[``\ :ref:`deptask <bitbake-user-manual/bitbake-user-manual-metadata:variable flags>`\ ``]``
+declaration, which guarantees that the required shared-library /
+module-to-package mapping information will be available when needed as long as
+:term:`DEPENDS` has been correctly set.
 
 Fakeroot and Pseudo
 ===================
diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
index 35f5345ad4..d694642af2 100644
--- a/documentation/overview-manual/yp-intro.rst
+++ b/documentation/overview-manual/yp-intro.rst
@@ -704,7 +704,7 @@ BitBake also supports both ``:prepend`` and ``:append`` operators as a
 method of extending task functionality. These operators inject code into
 the beginning or end of a task. For information on these BitBake
 operators, see the
-":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata:appending and prepending (override style syntax)`"
+":ref:`bitbake-user-manual/bitbake-user-manual-metadata:appending and prepending (override style syntax)`"
 section in the BitBake User's Manual.
 
 The OpenEmbedded Build System Workflow
diff --git a/documentation/ref-manual/devtool-reference.rst b/documentation/ref-manual/devtool-reference.rst
index 8e62c21425..0f19230838 100644
--- a/documentation/ref-manual/devtool-reference.rst
+++ b/documentation/ref-manual/devtool-reference.rst
@@ -353,7 +353,7 @@ variables in package recipes.
       :yocto_git:`maintainers.inc </poky/tree/meta/conf/distro/include/maintainers.inc>`
       file.
 
-   -  If the recipe is using the :ref:`bitbake:bitbake-user-manual/bitbake-user-manual-fetching:git fetcher (\`\`git://\`\`)`
+   -  If the recipe is using the :ref:`bitbake-user-manual/bitbake-user-manual-fetching:git fetcher (\`\`git://\`\`)`
       rather than a tarball, the commit hash points to the commit that matches
       the recipe's latest version tag, or in the absence of suitable tags,
       to the latest commit (when :term:`UPSTREAM_CHECK_COMMITS` set to ``1``
diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index 7a664cc6c0..f2b93185af 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -14,8 +14,8 @@ Normal Recipe Build Tasks
 
 The following sections describe normal tasks associated with building a
 recipe. For more information on tasks and dependencies, see the
-":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata:tasks`" and
-":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-execution:dependencies`" sections in the
+":ref:`bitbake-user-manual/bitbake-user-manual-metadata:tasks`" and
+":ref:`bitbake-user-manual/bitbake-user-manual-execution:dependencies`" sections in the
 BitBake User Manual.
 
 .. _ref-tasks-build:
@@ -118,9 +118,9 @@ If the :ref:`ref-tasks-deploy` task re-executes, any previous output is removed
 ``do_fetch``
 ------------
 
-Fetches the source code. This task uses the
-:term:`SRC_URI` variable and the argument's prefix to
-determine the correct :ref:`fetcher <bitbake:bitbake-user-manual/bitbake-user-manual-fetching:fetchers>`
+Fetches the source code. This task uses the :term:`SRC_URI` variable and the
+argument's prefix to determine the correct
+:ref:`fetcher <bitbake-user-manual/bitbake-user-manual-fetching:fetchers>`
 module.
 
 .. _ref-tasks-image:
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 2e32e264db..6c59ffee5f 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -243,12 +243,12 @@ system and gives an overview of their function and contents.
       To add a tune to the list, be sure to append it with spaces using the
       "+=" BitBake operator. Do not simply replace the list by using the
       "=" operator. See the
-      ":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata:basic syntax`" section in the BitBake
+      ":ref:`bitbake-user-manual/bitbake-user-manual-metadata:basic syntax`" section in the BitBake
       User Manual for more information.
 
    :term:`AZ_SAS`
       Azure Storage Shared Access Signature, when using the
-      :ref:`Azure Storage fetcher (az://) <bitbake:bitbake-user-manual/bitbake-user-manual-fetching:fetchers>`
+      :ref:`Azure Storage fetcher (az://) <bitbake-user-manual/bitbake-user-manual-fetching:fetchers>`
       This variable can be defined to be used by the fetcher to authenticate
       and gain access to non-public artifacts::
 
@@ -1833,15 +1833,14 @@ system and gives an overview of their function and contents.
 
           DEPENDS = "bar"
 
-      The practical effect of the previous
-      assignment is that all files installed by bar will be available in
-      the appropriate staging sysroot, given by the
-      :term:`STAGING_DIR* <STAGING_DIR>` variables, by the time the
-      :ref:`ref-tasks-configure` task for ``foo`` runs.
-      This mechanism is implemented by having :ref:`ref-tasks-configure` depend on
-      the :ref:`ref-tasks-populate_sysroot` task of
-      each recipe listed in :term:`DEPENDS`, through a
-      ``[``\ :ref:`deptask <bitbake:bitbake-user-manual/bitbake-user-manual-metadata:variable flags>`\ ``]``
+      The practical effect of the previous assignment is that all files
+      installed by bar will be available in the appropriate staging sysroot,
+      given by the :term:`STAGING_DIR* <STAGING_DIR>` variables, by the time
+      the :ref:`ref-tasks-configure` task for ``foo`` runs. This mechanism is
+      implemented by having :ref:`ref-tasks-configure` depend on the
+      :ref:`ref-tasks-populate_sysroot` task of each recipe listed in
+      :term:`DEPENDS`, through a
+      ``[``\ :ref:`deptask <bitbake-user-manual/bitbake-user-manual-metadata:variable flags>`\ ``]``
       declaration in the :ref:`ref-classes-base` class.
 
       .. note::
@@ -1888,12 +1887,12 @@ system and gives an overview of their function and contents.
             to the recipe that installs ``libbar``, other recipes might
             fail to link against ``libfoo``.
 
-      For information on runtime dependencies, see the
-      :term:`RDEPENDS` variable. You can also see the
-      ":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata:tasks`" and
-      ":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-execution:dependencies`" sections in the
-      BitBake User Manual for additional information on tasks and
-      dependencies.
+      For information on runtime dependencies, see the :term:`RDEPENDS`
+      variable. You can also see the
+      ":ref:`bitbake-user-manual/bitbake-user-manual-metadata:tasks`" and
+      ":ref:`bitbake-user-manual/bitbake-user-manual-execution:dependencies`"
+      sections in the BitBake User Manual for additional information on tasks
+      and dependencies.
 
    :term:`DEPLOY_DIR`
       Points to the general area that the OpenEmbedded build system uses to
@@ -2817,15 +2816,13 @@ system and gives an overview of their function and contents.
       recipe to correctly extend the path.
 
    :term:`FILESOVERRIDES`
-      A subset of :term:`OVERRIDES` used by the
-      OpenEmbedded build system for creating
-      :term:`FILESPATH`. The :term:`FILESOVERRIDES` variable
-      uses overrides to automatically extend the
-      :term:`FILESPATH` variable. For an example of how
-      that works, see the :term:`FILESPATH` variable
+      A subset of :term:`OVERRIDES` used by the OpenEmbedded build system for
+      creating :term:`FILESPATH`. The :term:`FILESOVERRIDES` variable uses
+      overrides to automatically extend the :term:`FILESPATH` variable. For an
+      example of how that works, see the :term:`FILESPATH` variable
       description. Additionally, you find more information on how overrides
       are handled in the
-      ":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata:conditional syntax (overrides)`"
+      ":ref:`bitbake-user-manual/bitbake-user-manual-metadata:conditional syntax (overrides)`"
       section of the BitBake User Manual.
 
       By default, the :term:`FILESOVERRIDES` variable is defined as::
@@ -3547,19 +3544,19 @@ system and gives an overview of their function and contents.
             section in the Yocto Project Development Tasks Manual.
 
          -  Using :term:`IMAGE_INSTALL` with the
-            :ref:`+= <bitbake:bitbake-user-manual/bitbake-user-manual-metadata:appending (+=) and prepending (=+) with spaces>`
+            :ref:`+= <bitbake-user-manual/bitbake-user-manual-metadata:appending (+=) and prepending (=+) with spaces>`
             BitBake operator within the ``/conf/local.conf`` file or from
-            within an image recipe is not recommended. Use of this operator
-            in these ways can cause ordering issues. Since
-            :ref:`ref-classes-core-image` sets :term:`IMAGE_INSTALL` to a default
-            value using the
-            :ref:`?= <bitbake:bitbake-user-manual/bitbake-user-manual-metadata:setting a default value (?=)>`
+            within an image recipe is not recommended. Use of this operator in
+            these ways can cause ordering issues. Since
+            :ref:`ref-classes-core-image` sets :term:`IMAGE_INSTALL` to a
+            default value using the
+            :ref:`?= <bitbake-user-manual/bitbake-user-manual-metadata:setting a default value (?=)>`
             operator, using a ``+=`` operation against :term:`IMAGE_INSTALL`
             results in unexpected behavior when used within
-            ``conf/local.conf``. Furthermore, the same operation from
-            within an image recipe may or may not succeed depending on the
-            specific situation. In both these cases, the behavior is
-            contrary to how most users expect the ``+=`` operator to work.
+            ``conf/local.conf``. Furthermore, the same operation from within an
+            image recipe may or may not succeed depending on the specific
+            situation. In both these cases, the behavior is contrary to how
+            most users expect the ``+=`` operator to work.
 
    :term:`IMAGE_LINGUAS`
       Specifies the list of locales to install into the image during the
@@ -3921,7 +3918,7 @@ system and gives an overview of their function and contents.
       ``classes-global/`` or ``classes/`` subdirectories.
 
       For more information on :term:`INHERIT`, see the
-      :ref:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata:\`\`inherit\`\` configuration directive`"
+      :ref:`bitbake-user-manual/bitbake-user-manual-metadata:\`\`inherit\`\` configuration directive`"
       section in the BitBake User Manual.
 
    :term:`INHERIT_DISTRO`
@@ -5619,7 +5616,7 @@ system and gives an overview of their function and contents.
          FOO:an-override = "overridden"
 
       See the
-      ":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata:conditional syntax (overrides)`"
+      ":ref:`bitbake-user-manual/bitbake-user-manual-metadata:conditional syntax (overrides)`"
       section in the BitBake User Manual for more information on the
       overrides mechanism.
 
@@ -6824,12 +6821,11 @@ system and gives an overview of their function and contents.
 
          RDEPENDS:${PN} = "foo (>= 1.2)"
 
-      For information on build-time dependencies, see the
-      :term:`DEPENDS` variable. You can also see the
-      ":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata:tasks`" and
-      ":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-execution:dependencies`" sections in the
-      BitBake User Manual for additional information on tasks and
-      dependencies.
+      For information on build-time dependencies, see the :term:`DEPENDS`
+      variable. You can also see the
+      ":ref:`bitbake-user-manual/bitbake-user-manual-metadata:tasks`" and
+      ":ref:`bitbake-user-manual/bitbake-user-manual-execution:dependencies`" sections in the
+      BitBake User Manual for additional information on tasks and dependencies.
 
    :term:`RECIPE_NO_UPDATE_REASON`
       If a recipe should not be replaced by a more recent upstream version,
diff --git a/documentation/sdk-manual/appendix-customizing.rst b/documentation/sdk-manual/appendix-customizing.rst
index 2be76875e0..61091d83ba 100644
--- a/documentation/sdk-manual/appendix-customizing.rst
+++ b/documentation/sdk-manual/appendix-customizing.rst
@@ -77,7 +77,7 @@ adjustments:
       either define the entire list by using the "=" operator, or you
       will need to append a value using either ":append" or the "+="
       operator. You can learn more about these operators in the
-      ":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata:basic syntax`"
+      ":ref:`bitbake-user-manual/bitbake-user-manual-metadata:basic syntax`"
       section of the BitBake User Manual.
 
 -  If you have classes or recipes that add additional tasks to the
diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
index 7c7ceb695a..9e08e57a4e 100644
--- a/documentation/sdk-manual/extensible.rst
+++ b/documentation/sdk-manual/extensible.rst
@@ -651,12 +651,11 @@ counterparts.
    :ref:`dev-manual/upgrading-recipes:upgrading recipes` section
    of the Yocto Project Development Tasks Manual.
 
-The ``devtool upgrade`` command is flexible enough to allow you to
-specify source code revision and versioning schemes, extract code into
-or out of the ``devtool``
-:ref:`devtool-the-workspace-layer-structure`,
-and work with any source file forms that the
-:ref:`bitbake:bitbake-user-manual/bitbake-user-manual-fetching:fetchers` support.
+The ``devtool upgrade`` command is flexible enough to allow you to specify
+source code revision and versioning schemes, extract code into or out of the
+``devtool`` :ref:`devtool-the-workspace-layer-structure`, and work with any
+source file forms that the
+:ref:`bitbake-user-manual/bitbake-user-manual-fetching:fetchers` support.
 
 The following diagram shows the common development flow used with the
 ``devtool upgrade`` command:
-- 
2.37.2


