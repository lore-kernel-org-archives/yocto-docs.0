Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCDE2C9830E
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 17:29:08 +0000 (UTC)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3792.1790270944158086449
 for <docs@lists.yoctoproject.org>;
 Thu, 24 Sep 2026 10:29:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=P2qGOo1t;
 spf=pass (domain: gmail.com, ip: 74.125.226.204, mailfrom: twoerner@gmail.com)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c72bfebso30751241.3
        for <docs@lists.yoctoproject.org>; Thu, 24 Sep 2026 10:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790270943; x=1790875743; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/c5GGU5m+4FGyjxwL8mzFplHZeH9+V77I+YDeOYKNQM=;
        b=P2qGOo1t4qvho5KwsFux/r/YeRCANA46Qi2VMOmCDocFAvYESLKlKPdslW+UisfRKh
         lCgSeeRRZE/FWBF+dQeS1ROcKx/2XjZHCEub+qh4RyeKrM/fn8NFfIxXUmqvlQ//YVhq
         9fuCLFs8ZRHB6UNq39G8tzfsu16Vnwcnk3LdiXgwVnThQHKsUzgwreRrQFvtzTAWMQw6
         4oUPEF+7Z9OKKwUDjtKSDOG+ABQpzA4XzmN4pgdt+bAAF37MB/+VlPV8/DH+MrgOAfDF
         TDVlUawVIhpa4CCAbvEP7VOYKeSnrTuy5vAWOAWbr6CmM2KtQtlmjQ7vi0wZmZf0P8aT
         8jpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790270943; x=1790875743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/c5GGU5m+4FGyjxwL8mzFplHZeH9+V77I+YDeOYKNQM=;
        b=fyuUe7poeLBfZAD/Tp3QXJEa+PkFAw87K+egiH2NM1jCVumVgx9eQuyJHNZvGPYagQ
         uf8TgVKeulX5pOs+a6QN0ORiqSnBax2gCB/3IjIRqKcUKjY3efe7fwtQQmZb+yVXQx8g
         GGNvxlPFFUrpJSf3WNwdM6BhSDxTzn20SAa0Emw/u+9kVp3ZYZG9ReCDZPlizeJLvIT4
         dTDBAa3go5A9VCWszkU5Yaq16G2bsboUBE4+dMxc9lAlxP2FEztAYQJUnk1uXderVyGw
         Kkyo/XdHvqfwbl3ErgtWXPaoEbzAdBv/zneNKyLSOWomSd5CPpSOPSyAbipnR+4fysgR
         vJHg==
X-Gm-Message-State: AFuF++mMOSJHdkomLVySIIqQNTIyn+jmcgbfWVUtpYpOMZpLdHDlmI4p
	am9O2EOSc8jWFDhxmqC2N6P3x3k+SGv5Rr25FuBfyOAv7nMr2V5ZVEKmVPxCVQ==
X-Gm-Gg: AYBFou27kbamYUO1XRk98AGzEMmsaugP+z61cyly1I6tWYFOnBeYcPxjoFCKIRbz9hZ
	5RmwSJHRWuHGmVBLSPbJh3rV2NK3mD2xlt7j26E4BygzcIjf/4cpQIbLj/PmL5U1MoStmHkqhqE
	ThjLoDtEcyQCFD3GRLVYWA8tC66jCd+KdLwnXaonhCzB5EkpriltQ5bYRgdc9spUA6r4WdcogFi
	5hpgUBvJjx1CcCM1pUgraJUogF4nJg/siev7PALDWmVB+VdiSJuX0zYWrksF3b1WuJhCtUcWqDF
	VCAQ/LgScpgiKreUICknC1x8Dg2+1hBXYS0shHG/fx/GTYpN8ixbVbInjZ/QEk1xURvl9hkyVDF
	OOphIM39juU9ri6hojmT9vJn0T6dIhhJJXcZ51oOrlmluNDUYvoZ8cEm0U4nBtJxYbBrtBc8a38
	qHj0+/ivqpvzLBe1Bt3u2zmeMX4p3CVNgS5BlVIBnuz4wSXZ6Y8Qt6IRbrBSMpV+7PLFuysRuZe
	Vd/ecRAc7ZbOMn0qk2vrTUroGI2qr28R26ANCwt
X-Received: by 2002:a05:6102:2928:b0:7a7:198a:c2c7 with SMTP id ada2fe7eead31-7af1f3f672emr1380050137.37.1790270942082;
        Thu, 24 Sep 2026 10:29:02 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98530725838sm1797974241.0.2026.09.24.10.29.00
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 10:29:01 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH v3 03/10] docs: show a prompt on commands the reader is meant to type
Date: Thu, 24 Sep 2026 13:28:46 -0400
Message-ID: <20260924172853.2665062-4-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260924172853.2665062-1-twoerner@gmail.com>
References: <20260924172853.2665062-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 24 Sep 2026 17:29:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10626

Most command blocks in the manuals start their lines with "$", but a
scattering of them do not, and those read as a file listing rather than
as something to run. Give them the prompt the surrounding pages already
use.

Transcripts take a prompt on their opening line alone. Two removals go
with it, because both only matter once a line is a command: a bare "$"
at the end, which is the prompt returning after the command finished,
and a trailing "\" on a Windows path, which a shell reads as a
continuation into the output.

AI-Generated: codex/claude-opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v3:
- the weston command is prompted; it had none
- commands run on the target take the full user@machine:path prompt,
  mirroring the root prompt, rather than a bare "$"

changes in v2:
- rebased on master-next; no other change
---
 documentation/brief-yoctoprojectqs/index.rst  |  2 +-
 .../contributor-guide/recipe-style-guide.rst  |  2 +-
 .../contributor-guide/submit-changes.rst      | 60 +++++++++----------
 .../dev-manual/creating-fragments.rst         |  4 +-
 documentation/dev-manual/debugging.rst        |  1 -
 documentation/dev-manual/devtool.rst          |  8 +--
 documentation/dev-manual/disk-space.rst       |  4 +-
 documentation/dev-manual/hashequivserver.rst  |  2 +-
 .../dev-manual/limiting-resources.rst         |  2 +-
 documentation/dev-manual/new-recipe.rst       |  6 +-
 documentation/dev-manual/packages.rst         |  2 +-
 .../dev-manual/python-development-shell.rst   |  1 -
 documentation/dev-manual/qemu.rst             |  8 +--
 documentation/dev-manual/start.rst            |  2 +-
 documentation/dev-manual/wayland.rst          |  8 +--
 documentation/kernel-dev/common.rst           |  3 -
 .../migration-guides/migration-2.1.rst        |  4 +-
 .../migration-guides/migration-2.5.rst        |  4 +-
 .../migration-guides/migration-4.0.rst        |  2 +-
 .../migration-guides/migration-5.3.rst        | 10 ++--
 .../migration-guides/release-notes-4.2.rst    |  2 +-
 .../migration-guides/release-notes-5.3.rst    |  2 +-
 documentation/ref-manual/classes.rst          |  8 +--
 .../ref-manual/devtool-reference.rst          |  2 -
 documentation/ref-manual/fragments.rst        | 16 ++---
 documentation/ref-manual/qa-checks.rst        |  4 +-
 documentation/ref-manual/variables.rst        |  6 +-
 .../test-manual/reproducible-builds.rst       |  2 +-
 documentation/test-manual/runtime-testing.rst |  4 +-
 29 files changed, 87 insertions(+), 94 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index f7e4606f1f7b..e138df6c9351 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -373,7 +373,7 @@ layer>`:
 
     First, clone the layer next to the other layers::
 
-      git clone -b &DISTRO_NAME_NO_CAP; https://git.yoctoproject.org/meta-raspberrypi ../layers/meta-raspberrypi
+      $ git clone -b &DISTRO_NAME_NO_CAP; https://git.yoctoproject.org/meta-raspberrypi ../layers/meta-raspberrypi
 
 #.  **Add Your Layer to the Layer Configuration File:** Before you can use
     it, you must add the layer and its dependencies to your :ref:`structure-build-conf-bblayers.conf`
diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/documentation/contributor-guide/recipe-style-guide.rst
index 84c6bb14e8b0..fe12a8e6d826 100644
--- a/documentation/contributor-guide/recipe-style-guide.rst
+++ b/documentation/contributor-guide/recipe-style-guide.rst
@@ -436,7 +436,7 @@ By default, patches created with ``git format-patch`` have a `Git` version signa
 To avoid having a `Git` signature at the end of generated or updated patches,
 you can use `Git` configuration settings::
 
-   git config --global format.signature ""
+   $ git config --global format.signature ""
 
 .. note::
    Patches generated or updated by ``devtool`` are created with no signature.
diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
index 574a92cd3465..e60f8ca7ace3 100644
--- a/documentation/contributor-guide/submit-changes.rst
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -57,20 +57,20 @@ Set up Git
 The first thing to do is to install Git packages. Here is an example
 on Debian and Ubuntu::
 
-   sudo apt install git-core git-email
+   $ sudo apt install git-core git-email
 
 Then, you need to set a name and e-mail address that Git will
 use to identify your commits::
 
-   git config --global user.name "Ada Lovelace"
-   git config --global user.email "ada.lovelace@gmail.com"
+   $ git config --global user.name "Ada Lovelace"
+   $ git config --global user.email "ada.lovelace@gmail.com"
 
 By default, Git adds a signature line at the end of patches containing the Git
 version. We suggest to remove it as it doesn't add useful information.
 
 Remove it with the following command::
 
-   git config --global format.signature ""
+   $ git config --global format.signature ""
 
 Clone the Git repository for the component to modify
 ----------------------------------------------------
@@ -79,8 +79,8 @@ After identifying the component to modify as described in the
 ":doc:`/contributor-guide/identify-component`" section, clone the
 corresponding Git repository. Here is an example for OpenEmbedded-Core::
 
-  git clone https://git.openembedded.org/openembedded-core
-  cd openembedded-core
+  $ git clone https://git.openembedded.org/openembedded-core
+  $ cd openembedded-core
 
 Create a new branch
 -------------------
@@ -177,7 +177,7 @@ to add the upgraded version.
           is to look for prefixes used in previous commits touching the
           same files or directories::
 
-             git log --oneline <paths>
+             $ git log --oneline <paths>
 
    #.  For the commit description, provide detailed information
        that describes what you changed, why you made the change, and the
@@ -278,7 +278,7 @@ Here is the general procedure on how to create patches to be sent through email:
    For this purpose, a good solution is to store the cover letter contents
    in the branch itself::
 
-      git branch --edit-description
+      $ git branch --edit-description
 
    This will open a text editor to fill in the description for your
    changes. This description can be updated when necessary and will
@@ -334,19 +334,19 @@ functional testing of the changes will be performed by ``patchtest``. Currently,
 it only supports testing patches for ``openembedded-core`` branches. To setup,
 perform the following::
 
-    pip install -r meta/lib/patchtest/requirements.txt
-    source oe-init-build-env
-    bitbake-layers add-layer ../meta-selftest
+    $ pip install -r meta/lib/patchtest/requirements.txt
+    $ source oe-init-build-env
+    $ bitbake-layers add-layer ../meta-selftest
 
 Once these steps are complete and you have generated your patch files,
 you can run ``patchtest`` like so::
 
-    patchtest --patch <patch_name>
+    $ patchtest --patch <patch_name>
 
 Alternatively, if you want ``patchtest`` to iterate over and test
 multiple patches stored in a directory, you can use::
 
-    patchtest --directory <directory_name>
+    $ patchtest --directory <directory_name>
 
 By default, ``patchtest`` uses its own modules' file paths to determine what
 repository and test suite to check patches against. If you wish to test
@@ -354,7 +354,7 @@ patches against a repository other than ``openembedded-core`` and/or use
 a different set of tests, you can use the ``--repodir`` and ``--testdir``
 flags::
 
-    patchtest --patch <patch_name> --repodir <path/to/repo> --testdir <path/to/testdir>
+    $ patchtest --patch <patch_name> --repodir <path/to/repo> --testdir <path/to/testdir>
 
 Finally, note that ``patchtest`` is designed to test patches in a standalone
 way, so if your patches are meant to apply on top of changes made by
@@ -396,11 +396,11 @@ through a direct SMTP configuration in your Git ``~/.gitconfig`` file.
 Here are the settings for letting ``git send-email`` send e-mail through your
 regular STMP server, using a Google Mail account as an example::
 
-   git config --global sendemail.smtpserver smtp.gmail.com
-   git config --global sendemail.smtpserverport 587
-   git config --global sendemail.smtpencryption tls
-   git config --global sendemail.smtpuser ada.lovelace@gmail.com
-   git config --global sendemail.smtppass = XXXXXXXX
+   $ git config --global sendemail.smtpserver smtp.gmail.com
+   $ git config --global sendemail.smtpserverport 587
+   $ git config --global sendemail.smtpencryption tls
+   $ git config --global sendemail.smtpuser ada.lovelace@gmail.com
+   $ git config --global sendemail.smtppass = XXXXXXXX
 
 These settings will appear in the ``.gitconfig`` file in your home directory.
 
@@ -463,7 +463,7 @@ Sending Patches via Email
 At this stage, you are ready to send your patches via email. Here's the
 typical usage of ``git send-email``::
 
-   git send-email --to <mailing-list-address> *.patch
+   $ git send-email --to <mailing-list-address> *.patch
 
 Then, review each subject line and list of recipients carefully, and then
 allow the command to send each message.
@@ -476,7 +476,7 @@ or any layer other than :oe_git:`openembedded-core </openembedded-core/>`,
 please add the appropriate prefix so that it is clear which layer the patch is intended
 to be applied to::
 
-   git format-patch --subject-prefix="meta-oe][PATCH" ...
+   $ git format-patch --subject-prefix="meta-oe][PATCH" ...
 
 .. note::
 
@@ -488,13 +488,13 @@ to be applied to::
    Here's a command you can use if you just have one patch in your
    branch::
 
-      git send-email --to <mailing-list-address> -1
+      $ git send-email --to <mailing-list-address> -1
 
    If you have multiple patches and a cover letter, you can send
    patches for all the commits between the reference branch
    and the tip of your branch::
 
-      git send-email --cover-letter --cover-from-description=auto --to <mailing-list-address> -M <ref-branch>
+      $ git send-email --cover-letter --cover-from-description=auto --to <mailing-list-address> -M <ref-branch>
 
 See the `git send-email manual page <https://git-scm.com/docs/git-send-email>`__
 for details.
@@ -517,7 +517,7 @@ author name. The following will ensure that your e-mails have an additional
 maintainers accepting your patches don't have to fix commit author information
 manually::
 
-   git config --global sendemail.from "linus.torvalds@kernel.org"
+   $ git config --global sendemail.from "linus.torvalds@kernel.org"
 
 The ``sendemail.from`` should match your ``user.email`` setting,
 which appears in the ``Signed-off-by`` line of your commits.
@@ -530,12 +530,12 @@ with ``git send-email``, you can use Git configuration settings.
 
 -  To set the right mailing list address for a given repository::
 
-      git config --local sendemail.to openembedded-devel@lists.openembedded.org
+      $ git config --local sendemail.to openembedded-devel@lists.openembedded.org
 
 -  If the mailing list requires a subject prefix for the layer
    (this only works when the repository only contains one layer)::
 
-      git config --local format.subjectprefix "meta-something][PATCH"
+      $ git config --local format.subjectprefix "meta-something][PATCH"
 
 Using Scripts to Push a Change Upstream and Request a Pull
 ==========================================================
@@ -597,7 +597,7 @@ have been followed:
       enter the following command to bring up a short list of all
       commits against a specific file::
 
-         git shortlog -- filename
+         $ git shortlog -- filename
 
       Just provide the name of the file for which you are interested. The
       information returned is not ordered by history but does include a
@@ -719,7 +719,7 @@ follows:
       ``git format-patch``, for example to submit a patch to the
       "&DISTRO_NAME_NO_CAP_MINUS_ONE;" branch use::
 
-         git format-patch --subject-prefix='&DISTRO_NAME_NO_CAP_MINUS_ONE;][PATCH' ...
+         $ git format-patch --subject-prefix='&DISTRO_NAME_NO_CAP_MINUS_ONE;][PATCH' ...
 
 Taking Patch Review into Account
 ================================
@@ -745,7 +745,7 @@ without the reported issues.
 A single patch can be amended using ``git commit --amend``, and multiple
 patches can be easily reworked and reordered through an interactive Git rebase::
 
-   git rebase -i <ref-branch>
+   $ git rebase -i <ref-branch>
 
 See `this tutorial <https://hackernoon.com/beginners-guide-to-interactive-rebasing-346a3f9c3a6d>`__
 for practical guidance about using Git interactive rebasing.
@@ -755,7 +755,7 @@ sending the revised patch to mark the new iteration as ``[PATCH v2]``,
 ``[PATCH v3]``, etc as appropriate. This can be done by passing the ``-v``
 argument to ``git format-patch`` with a version number::
 
-   git format-patch -v2 <ref-branch>
+   $ git format-patch -v2 <ref-branch>
 
 
 After generating updated patches (v2, v3, and so on) via ``git
diff --git a/documentation/dev-manual/creating-fragments.rst b/documentation/dev-manual/creating-fragments.rst
index 8dabd599f13f..cd87341e9a51 100644
--- a/documentation/dev-manual/creating-fragments.rst
+++ b/documentation/dev-manual/creating-fragments.rst
@@ -86,7 +86,7 @@ For now, our fragment exists and is listed by the
 enable this fragment, use the :ref:`ref-bitbake-config-build-enable-fragment`
 command::
 
-   bitbake-config-build enable-fragment meta-custom/custom-fragment
+   $ bitbake-config-build enable-fragment meta-custom/custom-fragment
 
 .. note::
 
@@ -143,4 +143,4 @@ configuration file:
 You can then use the :ref:`ref-bitbake-config-build-enable-fragment` command to
 set a value to the ``CUSTOM_VARIABLE`` variable::
 
-   bitbake-config-build enable-fragment custom-builtin-fragment/somevalue
+   $ bitbake-config-build enable-fragment custom-builtin-fragment/somevalue
diff --git a/documentation/dev-manual/debugging.rst b/documentation/dev-manual/debugging.rst
index 4995ba73f06b..0f6e9d1d7e85 100644
--- a/documentation/dev-manual/debugging.rst
+++ b/documentation/dev-manual/debugging.rst
@@ -821,7 +821,6 @@ missing dependency clearly visible at the end::
                      ^
    compilation terminated.
    make: *** [tools/snep-send.o] Error 1
-   $
 
 
 Creating a Patch for the Fix
diff --git a/documentation/dev-manual/devtool.rst b/documentation/dev-manual/devtool.rst
index 242ea9dd9942..471134da8629 100644
--- a/documentation/dev-manual/devtool.rst
+++ b/documentation/dev-manual/devtool.rst
@@ -548,7 +548,7 @@ the two modes:
    -  To work on the source code of a recipe another instance of VSCode is
       started in the recipe's workspace. Example::
 
-         code build/workspace/sources/my-recipe
+         $ code build/workspace/sources/my-recipe
 
       This instance of VSCode uses plugins that are useful for the development
       of the application. ``devtool ide-sdk`` generates the necessary
@@ -720,9 +720,9 @@ the two modes:
    VSCode. First of all we need a folder containing a CMake project.
    For this example, let's create a CMake project and start VSCode::
 
-      mkdir kit-test
-      echo "project(foo VERSION 1.0)" > kit-test/CMakeLists.txt
-      code kit-test
+      $ mkdir kit-test
+      $ echo "project(foo VERSION 1.0)" > kit-test/CMakeLists.txt
+      $ code kit-test
 
    If there is a CMake project in the workspace, cross-compilation is
    supported:
diff --git a/documentation/dev-manual/disk-space.rst b/documentation/dev-manual/disk-space.rst
index 5516f793e301..ee02b267081c 100644
--- a/documentation/dev-manual/disk-space.rst
+++ b/documentation/dev-manual/disk-space.rst
@@ -33,7 +33,7 @@ disk space. However, only the most recent ones are likely to be reused.
 The following command is a quick way to purge all the cache files which
 haven't been used for a least a specified number of days::
 
-   find build/sstate-cache -type f -mtime +$DAYS -delete
+   $ find build/sstate-cache -type f -mtime +$DAYS -delete
 
 The above command relies on the fact that BitBake touches the sstate cache
 files as it accesses them, when it has write access to the cache.
@@ -49,7 +49,7 @@ requires a full build environment to be available and doesn't work well
 covering multiple releases. It won't work either on limited environments
 such as BSD based NAS::
 
-   sstate-cache-management.py --remove-duplicated --cache-dir=sstate-cache
+   $ sstate-cache-management.py --remove-duplicated --cache-dir=sstate-cache
 
 This command will ask you to confirm the deletions it identifies.
 Run ``sstate-cache-management.py`` for more details about this script.
diff --git a/documentation/dev-manual/hashequivserver.rst b/documentation/dev-manual/hashequivserver.rst
index 75b77c30b944..0a67e79b66bc 100644
--- a/documentation/dev-manual/hashequivserver.rst
+++ b/documentation/dev-manual/hashequivserver.rst
@@ -22,7 +22,7 @@ the :term:`BitBake` repository, which can be found :oe_git:`here </bitbake>`.
 
 To start a basic Hash Equivalence server, one could simply run::
 
-   ./bin/bitbake-hashserv
+   $ ./bin/bitbake-hashserv
 
 This will take all of the default options of the script, which are already
 sufficient to start a local server.
diff --git a/documentation/dev-manual/limiting-resources.rst b/documentation/dev-manual/limiting-resources.rst
index 892b0069accf..93c20c44c36e 100644
--- a/documentation/dev-manual/limiting-resources.rst
+++ b/documentation/dev-manual/limiting-resources.rst
@@ -104,7 +104,7 @@ details.
 
    #.  Then, start a heavy-load build, for example::
 
-          bitbake virtual/kernel -c compile -f
+          $ bitbake virtual/kernel -c compile -f
 
        You can stop the build at anytime with Control + C.
 
diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-manual/new-recipe.rst
index f43fc2be3f4c..a23a796f5a40 100644
--- a/documentation/dev-manual/new-recipe.rst
+++ b/documentation/dev-manual/new-recipe.rst
@@ -106,19 +106,19 @@ Here are some syntax examples:
  - Use this syntax to generate a recipe based on source. Once generated,
    the recipe resides in the existing source code layer::
 
-      recipetool create -o OUTFILE source
+      $ recipetool create -o OUTFILE source
 
  - Use this syntax to generate a recipe using code that
    you extract from source. The extracted code is placed in its own layer
    defined by :term:`EXTERNALSRC`::
 
-      recipetool create -o OUTFILE -x EXTERNALSRC source
+      $ recipetool create -o OUTFILE -x EXTERNALSRC source
 
  - Use this syntax to generate a recipe based on source. The options
    direct ``recipetool`` to generate debugging information. Once generated,
    the recipe resides in the existing source code layer::
 
-      recipetool create -d -o OUTFILE source
+      $ recipetool create -d -o OUTFILE source
 
 Locating and Using a Similar Recipe
 -----------------------------------
diff --git a/documentation/dev-manual/packages.rst b/documentation/dev-manual/packages.rst
index 0271cca10cc9..8cd90b9f25b1 100644
--- a/documentation/dev-manual/packages.rst
+++ b/documentation/dev-manual/packages.rst
@@ -176,7 +176,7 @@ work against a common, shared package feed, you have a single PR Service
 running and it is connected to each building system. For this scenario,
 you need to start the PR Service using the ``bitbake-prserv`` command::
 
-   bitbake-prserv --host ip --port port --start
+   $ bitbake-prserv --host ip --port port --start
 
 In addition to
 hand-starting the service, you need to update the
diff --git a/documentation/dev-manual/python-development-shell.rst b/documentation/dev-manual/python-development-shell.rst
index 07563043232c..034100ae8799 100644
--- a/documentation/dev-manual/python-development-shell.rst
+++ b/documentation/dev-manual/python-development-shell.rst
@@ -25,7 +25,6 @@ functions::
    pydevshell> d.delVar("FOO")
    pydevshell> d.getVar("FOO")
    pydevshell> bb.build.exec_func("do_unpack", d)
-   pydevshell>
 
 See the ":ref:`bitbake-user-manual/bitbake-user-manual-metadata:functions you can call from within python`"
 section in the BitBake User Manual for details about available functions.
diff --git a/documentation/dev-manual/qemu.rst b/documentation/dev-manual/qemu.rst
index 514a72fc528a..6d092b2d2034 100644
--- a/documentation/dev-manual/qemu.rst
+++ b/documentation/dev-manual/qemu.rst
@@ -65,7 +65,7 @@ available. Follow these general steps to run QEMU:
       initializes the toolchain. For example, the following commands run
       the initialization script from the default ``poky_sdk`` directory::
 
-         . poky_sdk/environment-setup-core2-64-poky-linux
+         $ . poky_sdk/environment-setup-core2-64-poky-linux
 
 #. *Ensure the Artifacts are in Place:* You need to be sure you have a
    pre-built kernel that will boot in QEMU. You also need the target
@@ -227,15 +227,15 @@ using an NFS server.
 
    -  To start the NFS share::
 
-         runqemu-export-rootfs start file-system-location
+         $ runqemu-export-rootfs start file-system-location
 
    -  To stop the NFS share::
 
-         runqemu-export-rootfs stop file-system-location
+         $ runqemu-export-rootfs stop file-system-location
 
    -  To restart the NFS share::
 
-         runqemu-export-rootfs restart file-system-location
+         $ runqemu-export-rootfs restart file-system-location
 
 QEMU CPU Compatibility Under KVM
 ================================
diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index c7d0fe3dab8d..73b7d9501ae4 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -423,7 +423,7 @@ your Yocto Project build host:
       replace the PackageFamilyName and your user on the following path
       to find your VHDX file::
 
-         ls C:\Users\myuser\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79abcdefgh\LocalState\
+         C:\WINDOWS\system32> ls C:\Users\myuser\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79abcdefgh\LocalState
          Mode                 LastWriteTime         Length Name
          -a----         3/14/2020   9:52 PM    57418973184 ext4.vhdx
 
diff --git a/documentation/dev-manual/wayland.rst b/documentation/dev-manual/wayland.rst
index 5e333b6265f4..ec8ed86c1c60 100644
--- a/documentation/dev-manual/wayland.rst
+++ b/documentation/dev-manual/wayland.rst
@@ -80,11 +80,11 @@ the CLI, you need to do the following after your image is built:
 
 #. Run these commands to export ``XDG_RUNTIME_DIR``::
 
-      mkdir -p /tmp/$USER-weston
-      chmod 0700 /tmp/$USER-weston
-      export XDG_RUNTIME_DIR=/tmp/$USER-weston
+      user@machine:~$ mkdir -p /tmp/$USER-weston
+      user@machine:~$ chmod 0700 /tmp/$USER-weston
+      user@machine:~$ export XDG_RUNTIME_DIR=/tmp/$USER-weston
 
 #. Launch Weston in the shell::
 
-      weston
+      user@machine:~$ weston
 
diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index 65bd3d0d1f46..6e67156bedc5 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -75,7 +75,6 @@ section:
       $ bitbake-layers create-layer ../layers/meta-mylayer
       NOTE: Starting bitbake server...
       Add your new layer with 'bitbake-layers add-layer ../layers/meta-mylayer'
-      $
 
    .. note::
 
@@ -98,7 +97,6 @@ section:
       $ cd bitbake-builds/build
       $ bitbake-layers add-layer ../../meta-mylayer
       NOTE: Starting bitbake server...
-      $
 
 #. *Build the Clean Image:* The final step in preparing to work on the
    kernel is to build an initial image using ``bitbake``::
@@ -194,7 +192,6 @@ section:
       $ cd bitbake-builds/build
       $ bitbake-layers add-layer ../../meta-mylayer
       NOTE: Starting bitbake server ...
-      $
 
 #. *Create a Local Copy of the Kernel Git Repository:* You can find Git
    repositories of supported Yocto Project kernels organized under
diff --git a/documentation/migration-guides/migration-2.1.rst b/documentation/migration-guides/migration-2.1.rst
index 473dd10ff121..987464f4d77f 100644
--- a/documentation/migration-guides/migration-2.1.rst
+++ b/documentation/migration-guides/migration-2.1.rst
@@ -46,8 +46,8 @@ not specify the final expand parameter to calls that do specify the
 parameter. You can run the following ``sed`` command at the base of a
 layer to make this change::
 
-   sed -e 's:\(\.getVar([^,()]*\)):\1, False):g' -i `grep -ril getVar *`
-   sed -e 's:\(\.getVarFlag([^,()]*,[^,()]*\)):\1, False):g' -i `grep -ril getVarFlag *`
+   $ sed -e 's:\(\.getVar([^,()]*\)):\1, False):g' -i `grep -ril getVar *`
+   $ sed -e 's:\(\.getVarFlag([^,()]*,[^,()]*\)):\1, False):g' -i `grep -ril getVarFlag *`
 
 .. note::
 
diff --git a/documentation/migration-guides/migration-2.5.rst b/documentation/migration-guides/migration-2.5.rst
index 8e182cd2bc4a..70946b5e11b4 100644
--- a/documentation/migration-guides/migration-2.5.rst
+++ b/documentation/migration-guides/migration-2.5.rst
@@ -138,11 +138,11 @@ BitBake Changes
    :ref:`ref-classes-archiver` classes). There is a BitBake option to complete this for
    any arbitrary task. For example::
 
-      bitbake <target> -c fetchall
+      $ bitbake <target> -c fetchall
 
    should now be replaced with::
 
-      bitbake <target> --runall=fetch
+      $ bitbake <target> --runall=fetch
 
 .. _migration-2.5-python-and-python3-changes:
 
diff --git a/documentation/migration-guides/migration-4.0.rst b/documentation/migration-guides/migration-4.0.rst
index c8c2b856d91c..31ce15a9cafc 100644
--- a/documentation/migration-guides/migration-4.0.rst
+++ b/documentation/migration-guides/migration-4.0.rst
@@ -256,7 +256,7 @@ Miscellaneous changes
 - The Python development shell (previously known as ``devpyshell``) feature has been
   renamed to ``pydevshell``. To start it you should now run::
 
-     bitbake <target> -c pydevshell
+     $ bitbake <target> -c pydevshell
 
 - The ``packagegroups-core-full-cmdline-libs`` packagegroup is no longer produced, as
   libraries should normally be brought in via dependencies. If you have any references
diff --git a/documentation/migration-guides/migration-5.3.rst b/documentation/migration-guides/migration-5.3.rst
index 38c7d6771667..e5521d94b59f 100644
--- a/documentation/migration-guides/migration-5.3.rst
+++ b/documentation/migration-guides/migration-5.3.rst
@@ -83,16 +83,16 @@ How to make those adjustments without tedious manual editing
 The following sed command can be used to remove S = "${WORKDIR}/git
 across a whole layer::
 
-   sed -i "/^S = \"\${WORKDIR}\/git\"/d" `find . -name '*.bb' -o -name '*.inc' -o -name '*.bbclass'`
+   $ sed -i "/^S = \"\${WORKDIR}\/git\"/d" `find . -name '*.bb' -o -name '*.inc' -o -name '*.bbclass'`
 
 Then, the following command can tweak the remaining :term:`S` assignments to
 refer to :term:`UNPACKDIR` instead of :term:`WORKDIR`::
 
-   sed -i "s/^S = \"\${WORKDIR}\//S = \"\${UNPACKDIR}\//g" `find . -name '*.bb' -o -name '*.inc' -o -name '*.bbclass'`
+   $ sed -i "s/^S = \"\${WORKDIR}\//S = \"\${UNPACKDIR}\//g" `find . -name '*.bb' -o -name '*.inc' -o -name '*.bbclass'`
 
 The first change can introduce a lot of consecutive empty lines, so those can be removed with::
 
-   sed -i -z -E 's/([ \t\f\v\r]*\n){3,}/\n\n/g' `find . -name '*.bb' -o -name '*.inc'`
+   $ sed -i -z -E 's/([ \t\f\v\r]*\n){3,}/\n\n/g' `find . -name '*.bb' -o -name '*.inc'`
 
 
 BitBake Git fetcher ``tag`` parameter
@@ -312,11 +312,11 @@ The following classes have been removed in this release:
    #. Use the specific FIT image recipe rather than the base kernel recipe.
       For example, instead of::
 
-         bitbake linux-yocto
+         $ bitbake linux-yocto
 
       the FIT image is now build by::
 
-         bitbake linux-yocto-fitimage
+         $ bitbake linux-yocto-fitimage
 
       For custom kernel recipes, creating a corresponding custom FIT image recipe
       is usually a good approach.
diff --git a/documentation/migration-guides/release-notes-4.2.rst b/documentation/migration-guides/release-notes-4.2.rst
index f50ef180ac66..3586622edca9 100644
--- a/documentation/migration-guides/release-notes-4.2.rst
+++ b/documentation/migration-guides/release-notes-4.2.rst
@@ -173,7 +173,7 @@ New Features / Enhancements in 4.2
       command, which allowed to spot and fix a regression in the
       ``quilt`` ptest::
 
-         yocto_testresults_query.py regression-report 4.2_M1 4.2_M2
+         $ yocto_testresults_query.py regression-report 4.2_M1 4.2_M2
 
       See this `blog post about regression detection
       <https://bootlin.com/blog/continuous-integration-in-yocto-improving-the-regressions-detection/>`__.
diff --git a/documentation/migration-guides/release-notes-5.3.rst b/documentation/migration-guides/release-notes-5.3.rst
index 8a564716f319..311a9a94718a 100644
--- a/documentation/migration-guides/release-notes-5.3.rst
+++ b/documentation/migration-guides/release-notes-5.3.rst
@@ -466,7 +466,7 @@ New Features / Enhancements in |yocto-ver|
       -  The script can now run compressed images with snapshot mode. For
          example, with :term:`IMAGE_FSTYPES` containing ``ext4.zst``, you can run::
 
-            runqemu snapshot ext4.zst <image-recipe>
+            $ runqemu snapshot ext4.zst <image-recipe>
 
       -  Add support for the ``erofs`` filesystem.
 
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index cbad93e8a38d..7b67ae8cc6b3 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -366,7 +366,7 @@ To do so, create a recipe for your program, for example using
 make it inherit the :ref:`ref-classes-cargo` and
 :ref:`ref-classes-cargo-update-recipe-crates` and run::
 
-   bitbake -c update_crates recipe
+   $ bitbake -c update_crates recipe
 
 This creates a ``recipe-crates.inc`` file that you can include in your
 recipe::
@@ -1372,7 +1372,7 @@ The simplest example for building a FIT image is to add::
 
 to the machine :term:`configuration file` and to execute::
 
-   bitbake linux-yocto-fitimage
+   $ bitbake linux-yocto-fitimage
 
 This results in a ``fitImage`` file deployed to the :term:`DEPLOY_DIR_IMAGE`
 directory and a ``linux-yocto-fitimage`` package which can be installed.
@@ -1386,7 +1386,7 @@ lines to the machine configuration file::
 
 The FIT image, this time including the RT kernel, is built again by calling::
 
-   bitbake linux-yocto-fitimage
+   $ bitbake linux-yocto-fitimage
 
 For other kernels provided by other layers, the same approach would work.
 However, it is usually more intuitive to add a custom FIT image recipe next to
@@ -3864,7 +3864,7 @@ build.
 
 Example usage::
 
-   bitbake -c generate_vex openssl
+   $ bitbake -c generate_vex openssl
 
 .. _ref-classes-waf:
 
diff --git a/documentation/ref-manual/devtool-reference.rst b/documentation/ref-manual/devtool-reference.rst
index d2e80611a994..4aa95d8e0499 100644
--- a/documentation/ref-manual/devtool-reference.rst
+++ b/documentation/ref-manual/devtool-reference.rst
@@ -461,7 +461,6 @@ Here is an example that resets the workspace directory that contains the
    $ devtool reset mtr
    NOTE: Cleaning sysroot for recipe mtr...
    NOTE: Leaving source tree /home/scottrif/bitbake-builds/build/workspace/sources/mtr as-is; if you no longer need it then please delete it manually
-   $
 
 .. _devtool-finish-working-on-a-recipe:
 
@@ -634,7 +633,6 @@ to create and add the ``mtr_0.86.bb`` recipe to the ``workspace`` directory::
 
    $ devtool status
    mtr:/home/scottrif/bitbake-builds/build/workspace/sources/mtr (/home/scottrif/bitbake-builds/build/workspace/recipes/mtr/mtr_0.86.bb)
-   $
 
 .. _devtool-search-for-available-target-recipes:
 
diff --git a/documentation/ref-manual/fragments.rst b/documentation/ref-manual/fragments.rst
index e5cd9fc436c1..c5640b826eae 100644
--- a/documentation/ref-manual/fragments.rst
+++ b/documentation/ref-manual/fragments.rst
@@ -72,25 +72,25 @@ command, you can determine which fragments can be enabled for your build.
 For example, the following command would enable the
 :ref:`ref-fragments-core-yocto-sstate-mirror-cdn` fragment::
 
-   bitbake-config-build enable-fragment core/yocto/sstate-mirror-cdn
+   $ bitbake-config-build enable-fragment core/yocto/sstate-mirror-cdn
 
 .. note::
 
    Multiple fragments can be enabled at once with the same command::
 
-      bitbake-config-build enable-fragment <fragment1> <fragment2> ...
+      $ bitbake-config-build enable-fragment <fragment1> <fragment2> ...
 
 :term:`Built-in fragments <Built-in Fragment>` are enabled the same way, and
 their values are defined from the command-line directly. For example, the
 following command sets the ``qemuarm64`` :term:`MACHINE` through the
 :ref:`ref-fragments-builtin-core-machine` fragment::
 
-   bitbake-config-build enable-fragment machine/qemuarm64
+   $ bitbake-config-build enable-fragment machine/qemuarm64
 
 This fragment can be overridden from the command-line by setting it to another
 value, for example::
 
-   bitbake-config-build enable-fragment machine/qemux86-64
+   $ bitbake-config-build enable-fragment machine/qemux86-64
 
 In the above example, the new value of :term:`MACHINE` is now equal to
 ``qemux86-64``.
@@ -118,18 +118,18 @@ command. The list of enabled fragments can be obtained with
 For example, the following command disables the
 :ref:`ref-fragments-core-yocto-sstate-mirror-cdn` fragment::
 
-   bitbake-config-build disable-fragment core/yocto/sstate-mirror-cdn
+   $ bitbake-config-build disable-fragment core/yocto/sstate-mirror-cdn
 
 Likewise, :term:`Built-in Fragments <Built-in Fragment>` are disabled the
 same way. For example, this would disable the ``machine/qemuarm64`` fragment::
 
-   bitbake-config-build disable-fragment machine/qemuarm64
+   $ bitbake-config-build disable-fragment machine/qemuarm64
 
 .. note::
 
    Multiple fragments can be disabled at once with the same command::
 
-      bitbake-config-build disable-fragment <fragment1> <fragment2>
+      $ bitbake-config-build disable-fragment <fragment1> <fragment2>
 
 .. _ref-bitbake-config-build-disable-all-fragments:
 
@@ -142,7 +142,7 @@ currently enabled fragments.  The list of enabled fragments can be obtained with
 
 This command is run without arguments::
 
-   bitbake-config-build disable-all-fragments
+   $ bitbake-config-build disable-all-fragments
 
 Core Fragments
 ==============
diff --git a/documentation/ref-manual/qa-checks.rst b/documentation/ref-manual/qa-checks.rst
index 8e1ce4438c79..14e3632ce6b8 100644
--- a/documentation/ref-manual/qa-checks.rst
+++ b/documentation/ref-manual/qa-checks.rst
@@ -573,14 +573,14 @@ patched file to still compile without errors.
 Use the ``devtool`` command as explained by the warning. First, unpack the
 source into devtool workspace::
 
-   devtool modify <recipe>
+   $ devtool modify <recipe>
 
 This will apply all of the patches, and create new commits out of them in
 the workspace --- with the patch context updated.
 
 Then, replace the patches in the recipe layer::
 
-   devtool finish --force-patch-refresh <recipe> <layer_path>
+   $ devtool finish --force-patch-refresh <recipe> <layer_path>
 
 The patch updates then need be reviewed (preferably with a side-by-side diff
 tool) to ensure they are indeed doing the right thing i.e.:
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 1c0864d8720e..c050c422bffc 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -967,7 +967,7 @@ system and gives an overview of their function and contents.
       Use the following format to export the variable to the BitBake
       environment::
 
-         export BBSERVER=localhost:$port
+         $ export BBSERVER=localhost:$port
 
       By default, :term:`BBSERVER` also appears in :term:`BB_BASEHASH_IGNORE_VARS`.
       Consequently, :term:`BBSERVER` is excluded from checksum and dependency
@@ -9357,7 +9357,7 @@ system and gives an overview of their function and contents.
 
      You can obtain the signature of all the tasks for the recipe ``bc`` using::
 
-       bitbake -S none bc
+       $ bitbake -S none bc
 
      Then you can look at files in ``build/tmp/stamps/<arch>/bc`` and look for
      files like: ``<PV>.do_compile.sigdata.09772aa4532512baf96d433484f27234d4b7c11dd9cda0d6f56fa1b7ce6f25f0``.
@@ -9514,7 +9514,7 @@ system and gives an overview of their function and contents.
          This file requires permissions set to ``400`` or ``600`` to prevent
          other users from reading the file::
 
-            chmod 600 "$HOME/.netrc"
+            $ chmod 600 "$HOME/.netrc"
 
          Another method to configure the username and password is from the URL
          in :term:`SOURCE_MIRROR_URL` directly, with the ``user`` and ``pswd``
diff --git a/documentation/test-manual/reproducible-builds.rst b/documentation/test-manual/reproducible-builds.rst
index 892f7b9c8f0d..4e39cf3f79d8 100644
--- a/documentation/test-manual/reproducible-builds.rst
+++ b/documentation/test-manual/reproducible-builds.rst
@@ -89,7 +89,7 @@ it always depends upon the paths it is built in.
 To run our automated selftest, as we use in our CI on the Autobuilder, you can
 run::
 
-   oe-selftest -r reproducible.ReproducibleTests.test_reproducible_builds
+   $ oe-selftest -r reproducible.ReproducibleTests.test_reproducible_builds
 
 This defaults to including a ``world`` build so, if other layers are added, it
 would also run the tests for recipes in the additional layers. Different build
diff --git a/documentation/test-manual/runtime-testing.rst b/documentation/test-manual/runtime-testing.rst
index 55c19900f439..5a7193f015b4 100644
--- a/documentation/test-manual/runtime-testing.rst
+++ b/documentation/test-manual/runtime-testing.rst
@@ -326,7 +326,7 @@ You can start the tests automatically or manually:
    Next, build your image. If the image successfully builds, the
    tests run::
 
-      bitbake core-image-sato
+      $ bitbake core-image-sato
 
 -  *Manually running tests:* To manually run the tests, first globally
    inherit the :ref:`ref-classes-testimage` class by editing your
@@ -336,7 +336,7 @@ You can start the tests automatically or manually:
 
    Next, use BitBake to run the tests::
 
-      bitbake -c testimage image
+      $ bitbake -c testimage image
 
 All test files reside in ``meta/lib/oeqa/runtime/cases`` in
 :term:`OpenEmbedded-Core (OE-Core)`. A test name maps
-- 
2.50.0.173.g8b6f19ccfc3a


