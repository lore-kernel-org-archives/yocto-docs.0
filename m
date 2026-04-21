Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92AABF327B4
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 07:19:37 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14563.1776755972963055601
 for <docs@lists.yoctoproject.org>;
 Tue, 21 Apr 2026 00:19:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=VSLFOMzw;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E225A1A337C
	for <docs@lists.yoctoproject.org>; Tue, 21 Apr 2026 07:19:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B068F600D2
	for <docs@lists.yoctoproject.org>; Tue, 21 Apr 2026 07:19:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 660001046087F;
	Tue, 21 Apr 2026 09:19:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776755969; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=voxiEo+1e+oCuGKBlEc2tIZRdtGMgfONX8J2ibqsO48=;
	b=VSLFOMzwEoJ5nngIGF8R0UKf/xzcXu418jqctDqSxJF1aVwoBwQtxOojnxt/scbJBwsFJt
	S9vFICCIm1MMKmNNXok96lAOz2oh2OSUduWB5V2WvcRehdF72/5rSUhRri3uR40TwQyAXH
	+chpXd9NpdJ5wxPaQZIs20JW1X+YWIzUOapoWfC4JVC6VbhCGozKCse7vjHhkjMdOSpKl9
	JWrJmJrT0m3eEoTiSGgmYOgYd0l0qU7fc7Fu3xgJFDIw6NUjOlbtMGKUGuWQXYbHPqgWzR
	REc3Rvva2xxCU2cBCup/Fyujj9J5mGQr4d8V6tmy9QmRnynn6EyW/yx+o5N0RA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 21 Apr 2026 09:19:14 +0200
Subject: [PATCH v2] Document shared state signing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-sstate-signing-v2-1-7b572121f2fd@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNyw6CMBBFf4XM2hqm8giu/A/DAsoAY7Q1nUo0h
 H+3xbXLk5x77gpCnkngnK3gaWFhZyPoQwZm7uxEiofIoHNd5QXWSiR0gZTwZNlOamwqU5eGsME
 a4ujpaeT3Hry2P5ZXfyMTUiUZM0tw/rM/Lpi8v/EFFapyGBErPOmioUvvXLizPRr3gHbbti/RM
 4LAwAAAAA==
X-Change-ID: 20260417-sstate-signing-f96c75ce1917
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=16732;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=R++/hng/CgF4xZ+zV8G1pyI7oBtVa0MeMvIrrRgs5lw=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp5yUAfkc8EIv08dORDDqh5g8Wpb/Zc9DOZzncu
 6BDfn7jTYmJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaeclAAAKCRDRgEFAKaOo
 NpwWD/9WKTZz3mo0be+9DuhUtRn8M9Muza55aaOk4tNwzZ+m2g3QiW7tzmUN1pLiXOLnxHxkx82
 IDOFJUg9HKc8Hb8q1FHguIZMvmph/r7zfoV66mpvN6tPmjb/1P7ss8s8Z4KH1MPNY+tgsBBZl9+
 lwMrd9Lz6s4jszhl3FYJWi1fjWUN9Oyxpbqx86j/4g0d/5bOfhIKBRdeGiEaxSdLhSoQtWcb38Z
 8FUeUIY7biGsbv+pG2nu5EO9OfIYG033xSypTjzTLv3+Tk44REZPwbhYGcQWqhhCIGF0aHevfZ9
 k9sIRtB2gPz2Wp6Bj3J8/VQI30axxjXlEKgTR6ZXlQsu0bnCv9H0EXR3fcFgSfjjXtGY6nwxEd+
 OdcZ2YpB9/GD/BUsU2r1qcrZLvRSxrFrLtMTw5b6dLLV6W1y+InFJ2mbIwok4DUEvWpY3glXXAJ
 JAMxzmvWHaGHSHfsd0yOr7nhWejfdxy4vcdUEXUpbeHgVz16ETuajHXqMzS4EfkF8RCuQoB2DyY
 3xPGGcqkiWnqSmbNS5JtKW8idzHD8JUYfbMLLS348yCzmBWCQLNl+7OlKTtJAl4P3+SxFvyHig9
 RJnXCegBURG/bA0258+Suqw3cNQIdMYb/pp+kAJqXZM2aUSsSHIXR1MdnpeBtHK2MNjc4Vl0Kku
 GvwMuKC/TTJqW/A==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 21 Apr 2026 07:19:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9295

Document the shared state signing feature. Add a new document in the
Security manual, and definitions for the variables involved in this
process in the variable glossary.

[YOCTO #15217]

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- Fix typos reported by Ulrich (thanks!)
- Link to v1: https://patch.msgid.link/20260417-sstate-signing-v1-1-5df11613249e@bootlin.com
---
 documentation/overview-manual/concepts.rst       |   6 +
 documentation/ref-manual/variables.rst           |  50 +++++
 documentation/security-manual/index.rst          |   1 +
 documentation/security-manual/sstate-signing.rst | 272 +++++++++++++++++++++++
 4 files changed, 329 insertions(+)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index ab723d7c3..f0b336226 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -1240,6 +1240,12 @@ variable is the function that determines whether a given dependency
 needs to be followed, and whether for any given relationship the
 function needs to be passed. The function returns a True or False value.
 
+.. note::
+
+   Is is possible to sign these artifacts with :wikipedia:`GPG
+   <GNU_Privacy_Guard>`. See :doc:`/security-manual/sstate-signing` in the Yocto
+   Project Security Manual for more information.
+
 Images
 ------
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 317b75913..90d7fc924 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -10097,6 +10097,25 @@ system and gives an overview of their function and contents.
 
       For details on the process, see the :ref:`ref-classes-staging` class.
 
+   :term:`SSTATE_SIG_KEY`
+      When signing :ref:`shared state <overview-manual/concepts:setscene tasks
+      and shared state>` artifacts (when :term:`SSTATE_VERIFY_SIG` is set to
+      "1"), the :term:`SSTATE_SIG_KEY` variable is the :wikipedia:`GPG
+      <GNU_Privacy_Guard>` key identifier used to sign them (with the private
+      key).
+
+      See :doc:`/security-manual/sstate-signing` in the Yocto Project Security
+      Manual for more information.
+
+   :term:`SSTATE_SIG_PASSPHRASE`
+      When signing :ref:`shared state <overview-manual/concepts:setscene tasks
+      and shared state>` artifacts (when :term:`SSTATE_VERIFY_SIG` is set to
+      "1"), the :term:`SSTATE_SIG_PASSPHRASE` variable is the passphrase used to
+      protect the private key signing the artifacts.
+
+      See :doc:`/security-manual/sstate-signing` in the Yocto Project Security
+      Manual for more information.
+
    :term:`SSTATE_SKIP_CREATION`
       The :term:`SSTATE_SKIP_CREATION` variable can be used to skip the
       creation of :ref:`shared state <overview-manual/concepts:shared state cache>`
@@ -10117,6 +10136,37 @@ system and gives an overview of their function and contents.
 
          SSTATE_SKIP_CREATION = "1"
 
+   :term:`SSTATE_VALID_SIGS`
+      When verifying :ref:`shared state <overview-manual/concepts:setscene tasks
+      and shared state>` artifacts (when :term:`SSTATE_VERIFY_SIG` is set to
+      "1"), the :term:`SSTATE_VALID_SIGS` variable is a space-separated list of
+      :wikipedia:`GPG <GNU_Privacy_Guard>` key identifiers to use to verify their
+      signature.
+
+      It must contain the short form identifier of the key pair. For example,
+      when running the ``gpg --list-keys`` command:
+
+      .. parsed-literal::
+
+         pub   ed25519 2026-04-17 [SC]
+               \4049A47E3AAA99D0250966DC\ **5B97632FA7F4E942**
+         uid           [ultimate] Antonin Godard (SState Signing) <antonin.godard\@bootlin.com>
+         sub   cv25519 2026-04-17 [E]
+
+      The short form equals the last 16 characters of the identier. In the above
+      example: ``5B97632FA7F4E942``.
+
+      See :doc:`/security-manual/sstate-signing` in the Yocto Project Security
+      Manual for more information.
+
+   :term:`SSTATE_VERIFY_SIG`
+      The :term:`SSTATE_VERIFY_SIG` variable controls whether to enable or
+      disable the :ref:`shared state <overview-manual/concepts:setscene tasks
+      and shared state>` artifacts signing feature.
+
+      See :doc:`/security-manual/sstate-signing` in the Yocto Project Security
+      Manual for more information.
+
    :term:`STAGING_BASE_LIBDIR_NATIVE`
       Specifies the path to the ``/lib`` subdirectory of the sysroot
       directory for the build host.
diff --git a/documentation/security-manual/index.rst b/documentation/security-manual/index.rst
index 3453940f5..a767cd9c6 100644
--- a/documentation/security-manual/index.rst
+++ b/documentation/security-manual/index.rst
@@ -14,6 +14,7 @@ Yocto Project Security Manual
    securing-images
    vulnerabilities
    read-only-rootfs
+   sstate-signing
 
 .. include:: /boilerplate.rst
 
diff --git a/documentation/security-manual/sstate-signing.rst b/documentation/security-manual/sstate-signing.rst
new file mode 100644
index 000000000..54ae92d50
--- /dev/null
+++ b/documentation/security-manual/sstate-signing.rst
@@ -0,0 +1,272 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Shared State Signing
+********************
+
+The :term:`OpenEmbedded Build System` build system has a built-in mechanism
+allowing to save execution time by re-using pre-built artifacts: the
+:ref:`shared state cache (sstate cache) <overview-manual/concepts:shared state
+cache>`. These artifacts are stored in a directory (:term:`SSTATE_DIR`) and are
+not signed by default.
+
+This document goes through the steps to enable shared state signing.
+This feature is fully dependent on :wikipedia:`GPG <GNU_Privacy_Guard>`, meaning
+examples shown in this document will use the ``gpg`` command-line tool.
+
+Host Requirements
+=================
+
+As :wikipedia:`GPG <GNU_Privacy_Guard>` is not part of the default :ref:`host
+requirements <ref-manual/system-requirements:Required Packages for the Build
+Host>`, you will need to install it on your host.
+
+For example, Debian based distributions provide it with the `gpg` package name.
+Install it as follows:
+
+.. code-block:: console
+
+   $ sudo apt install gpg
+
+Verify that your installation is successful by showing the version of GPG:
+
+.. code-block:: console
+
+   $ gpg --version
+
+Generating A Public And Private Key Pair With GPG
+=================================================
+
+.. note::
+
+   This step is optional if you already have a pair of public and private keys.
+
+We need a pair of public and private keys for two independent tasks:
+
+-  Signing our sstate artifacts that the :term:`OpenEmbedded Build System`
+   generates with our **private key**.
+
+-  Verifying our sstate artifacts with our **public key** when re-using them.
+
+.. note::
+
+   For more information on public key cryptography, see
+   :wikipedia:`Public-key_cryptography`.
+
+With the ``gpg`` command-line tool, generate a new pair of public and private
+keys:
+
+.. code-block:: console
+
+   $ gpg --full-generate-key
+
+This will guide you through the steps of creating the key pair.
+
+Once done, you should be able to list your new key with the following command:
+
+.. code-block:: console
+
+   $ gpg --list-keys
+   pub   ed25519 2026-04-17 [SC]
+         4049A47E3AAA99D0250966DC5B97632FA7F4E942
+   uid           [ultimate] Antonin Godard (SState Signing) <antonin.godard@bootlin.com>
+   sub   cv25519 2026-04-17 [E]
+
+In the above example, take note of the
+``4049A47E3AAA99D0250966DC5B97632FA7F4E942`` key identifier. This will be used
+to configure our build.
+
+Configuring Our Build System To Sign Sstate Artifacts
+=====================================================
+
+Shared State Location
+---------------------
+
+Our build system needs to be configured to sign new sstate artifacts when they
+are generated. The generation of new artifacts is done once a task has finished
+being executed.
+
+For the following sections let's assume that our build system has the shared
+state directory location (:term:`SSTATE_DIR`) defined as follows::
+
+   SSTATE_DIR = "${TOPDIR}/sstate-cache"
+
+Assuming this directory and our temporary directory (:term:`TMPDIR`) are empty,
+as an example throughout this document, let's run the ``create_recipe_spdx``
+task of the ``gettext-minimal-native`` recipe:
+
+.. code-block:: console
+
+   $ bitbake gettext-minimal-native -c create_recipe_spdx
+
+After execution, our shared state directory should be populated with new files:
+
+.. code-block:: console
+
+   $ find $BUILDDIR/sstate-cache/ -name "*gettext-minimal-native*create_recipe_spdx*"
+   sstate-cache/universal/a3/6e/sstate:gettext-minimal-native:x86_64-linux:1.0:r0:x86_64:14:a36ef66df6b8c0cb5a849bc70a99dcfd61e4bacd11cefe6bbaf4978b2b3b617a_create_recipe_spdx.tar.zst
+   sstate-cache/universal/a3/6e/sstate:gettext-minimal-native:x86_64-linux:1.0:r0:x86_64:14:a36ef66df6b8c0cb5a849bc70a99dcfd61e4bacd11cefe6bbaf4978b2b3b617a_create_recipe_spdx.tar.zst.siginfo
+
+These are the default shared state artifacts generated by the
+:term:`OpenEmbedded Build System`. They are not signed with GPG by default, so
+let's see how to add signing of these artifacts.
+
+.. note::
+
+   The `siginfo` file is not related to GPG signing.
+
+Enabling Shared State Signing
+-----------------------------
+
+Create a new :term:`configuration file` on your host **in a safe location** and
+add the two following statements::
+
+   SSTATE_VERIFY_SIG = "1"
+   SSTATE_SIG_KEY = "80613045069236143C2EE1A3C8855DA51F042B42"
+   SSTATE_SIG_PASSPHRASE = "3lvJGHo8HZIcaufWFRezFIYRFDMSDmmkxOiwQ67PeM8IZre90I"
+
+It is advised to put these statements in a separate file as those contain
+secrets and should not be shared. For this example, let's assume this file is
+``conf/sstate-sig-key.conf``.
+
+These statements define:
+
+-  :term:`SSTATE_VERIFY_SIG`: setting this variable to "1" enables the shared
+   state signing feature.
+
+-  :term:`SSTATE_SIG_KEY`: the GPG key identifier for signing shared state
+   artifacts with the private key.
+
+   In our example, this corresponds to the identifier printed with the ``gpg
+   --list-keys`` command :ref:`above <security-manual/sstate-signing:Generating
+   A Public And Private Key Pair With GPG>`.
+
+-  :term:`SSTATE_SIG_PASSPHRASE`: the passphrase used to protect your private
+   key when creating the key, chosen when creating the key pair.
+
+Let's test our configuration:
+
+#. Continuing with our ``gettext-minimal-native`` example, let's first clean the
+   existing shared state artifacts:
+
+   .. code-block:: console
+
+      $ bitbake gettext-minimal-native -c cleansstate
+
+#. Run the ``create_recipe_spdx`` task for ``gettext-minimal-native``, but this
+   time pass our new ``sstate-sig-key.conf`` file to :term:`BitBake`:
+
+   .. code-block:: console
+
+      $ bitbake -R conf/sstate-sig-key.conf gettext-minimal-native -c create_recipe_spdx
+
+List the files in the shared state directory again:
+
+.. code-block:: console
+
+   $ find sstate-cache/ -name "*gettext-minimal-native*create_recipe_spdx*"
+   sstate-cache/universal/a3/6e/sstate:gettext-minimal-native:x86_64-linux:1.0:r0:x86_64:14:a36ef66df6b8c0cb5a849bc70a99dcfd61e4bacd11cefe6bbaf4978b2b3b617a_create_recipe_spdx.tar.zst
+   sstate-cache/universal/a3/6e/sstate:gettext-minimal-native:x86_64-linux:1.0:r0:x86_64:14:a36ef66df6b8c0cb5a849bc70a99dcfd61e4bacd11cefe6bbaf4978b2b3b617a_create_recipe_spdx.tar.zst.sig
+   sstate-cache/universal/a3/6e/sstate:gettext-minimal-native:x86_64-linux:1.0:r0:x86_64:14:a36ef66df6b8c0cb5a849bc70a99dcfd61e4bacd11cefe6bbaf4978b2b3b617a_create_recipe_spdx.tar.zst.siginfo
+
+A new ``.sig`` file was created: this means our artifact was successfully
+signed, and the signature is stored in a separate ``.sig`` file.
+
+Verifying Signed Shared State Artifacts
+=======================================
+
+Now that we have set up our build to sign shared state artifacts, let's see how
+we can verify them with the public key counterpart of the private key.
+
+.. note::
+
+   Signature of shared state and its verification can happen on two different
+   hosts, meaning one host can be in charge of the signature while another only
+   verifies the artifacts. This is preferred as the private key should not be
+   shared spread on multiple hosts.
+
+From a :term:`configuration file` such as the :ref:`site configuration file
+<structure-build-conf-site.conf>`, include the following statements::
+
+   SSTATE_VERIFY_SIG = "1"
+   SSTATE_VALID_SIGS = "5B97632FA7F4E942"
+
+These statements define:
+
+-  :term:`SSTATE_VERIFY_SIG`: setting this variable to "1" enables the shared
+   state signing feature.
+
+-  :term:`SSTATE_VALID_SIGS`: a space-separated list of key identifiers for
+   which we can accept shared state artifacts.
+
+   This means that shared state will be reused **only if it was signed with the
+   private key corresponding to key identifier**.
+
+   You'll notice the short-form of the key identifier here, which are the last 16
+   characters of the long-form key identifier shown with ``gpg --list-keys``:
+
+   .. parsed-literal::
+
+      pub   ed25519 2026-04-17 [SC]
+            \4049A47E3AAA99D0250966DC\ **5B97632FA7F4E942**
+      uid           [ultimate] Antonin Godard (SState Signing) <antonin.godard\@bootlin.com>
+      sub   cv25519 2026-04-17 [E]
+
+Let's verify that signature verification works:
+
+#. First, remove temporary outputs (:term:`TMPDIR`) from the previous builds, to
+   make the :term:`OpenEmbedded Build System` use the shared state:
+
+   .. code-block:: console
+
+      $ rm -r $BUILDDIR/tmp/
+
+#. Then, run the task again:
+
+   .. code-block:: console
+
+      $ bitbake gettext-minimal-native -c create_recipe_spdx
+
+#. To make sure the shared state artifact was successfully used, look for the
+   :ref:`setscene <overview-manual/concepts:setscene tasks and shared state>` task
+   for ``create_recipe_spdx`` in the latest log file from :term:`BitBake`:
+
+   .. code-block:: console
+
+      $ grep create_recipe_spdx_setscene tmp/log/cooker/<machine>/console-latest.log
+      NOTE: Running setscene task 1 of 1 (../layers/openembedded-core/meta/recipes-core/gettext/gettext-minimal-native_1.0.bb:do_create_recipe_spdx_setscene)
+      NOTE: recipe gettext-minimal-native-1.0-r0: task do_create_recipe_spdx_setscene: Started
+      NOTE: recipe gettext-minimal-native-1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
+
+   Our shared state was successfully verified and used!
+
+.. note::
+
+   To make sure shared state verification is working, you can set a "fake"
+   public key identifier in :term:`SSTATE_VALID_SIGS`::
+
+      SSTATE_VALID_SIGS = "CAFECAFECAFECAFE"
+
+   Remove the temporary outputs again:
+
+   .. code-block:: console
+
+      $ rm -r $BUILDDIR/tmp/
+
+   Now, try executing the task:
+
+   .. code-block:: console
+
+      $ bitbake gettext-minimal-native -c create_recipe_spdx
+
+   You should have warnings from :term:`BitBake`:
+
+   .. code-block:: text
+
+      WARNING: gettext-minimal-native-1.0-r0 do_create_recipe_spdx_setscene: No accepted signatures found. Good signatures found: 5B97632FA7F4E942.
+      WARNING: gettext-minimal-native-1.0-r0 do_create_recipe_spdx_setscene: Cannot verify signature on sstate package ../build/sstate-cache/universal/a3/6e/sstate:gettext-minimal-native:x86_64-linux:1.0:r0:x86_64:14:a36ef66df6b8c0cb5a849bc70a99dcfd61e4bacd11cefe6bbaf4978b2b3b617a_create_recipe_spdx.tar.zst, skipping acceleration...
+      WARNING: gettext-minimal-native-1.0-r0 do_create_recipe_spdx_setscene: No sstate archive obtainable, will run full task instead.
+      WARNING: Logfile for failed setscene task is ../build/tmp/work/x86_64-linux/gettext-minimal-native/1.0/temp/log.do_create_recipe_spdx_setscene.6994
+      WARNING: Setscene task (../layers/openembedded-core/meta/recipes-core/gettext/gettext-minimal-native_1.0.bb:do_create_recipe_spdx_setscene) failed with exit code '1' - real task will be run instead
+
+   As you can see, this does not prevent :term:`BitBake` from continuing, but
+   the real task is executed instead of re-using the shared state.

---
base-commit: 2c12ec7bf29aedeacf82970a9d2eb262fde4670e
change-id: 20260417-sstate-signing-f96c75ce1917


