Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C3DF436A3
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 13:30:40 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45052.1776432638709288331
 for <docs@lists.yoctoproject.org>;
 Fri, 17 Apr 2026 06:30:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=XtUfMO6v;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 312DCC5C3C1
	for <docs@lists.yoctoproject.org>; Fri, 17 Apr 2026 13:31:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B519060497
	for <docs@lists.yoctoproject.org>; Fri, 17 Apr 2026 13:30:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DDF64104609BE;
	Fri, 17 Apr 2026 15:30:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776432636; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=TLUvEVwM2R2errWDgjtfysBltoGcL1YE5zXbo1sg80o=;
	b=XtUfMO6vUizqrPZvB9wP+wbJ1ob1KYl2nx9dxO3AhWKJnpQy/05mN+F56uMWtgEgZfzjbi
	j10pdChz5JMpGWtahLt66Th2YmcDrZSK7v5GtuCIWxVD/dx19f1AcYJRKKoBTo2f22z+0Q
	qKjvqfMnECjE3/Lctn9tOW6hAi1RadEbJ3WutBq0jp6bKUxLfXbh8S0gJhfe9zU8XTZ0q2
	0LY/5fm4s3fxQUGK8UHcB4qLd6a2sgY8jB83NnZvjhVU/R6bitbtzpz074u0ZPA5hvW7nB
	pF/gG9TE6I3l6feNbFLh9niNOieFmrTjUP63wkLM2/2AwDUcKh3/ycYCqtlOnw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 17 Apr 2026 15:30:23 +0200
Subject: [PATCH] Document shared state signing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-sstate-signing-v1-1-5df11613249e@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBBA0avIrDVpBQ1XEQtqWmNR0imRiLsrl
 m/x/wWMgZChzS4IeBDT6hNUnoGZB+9Q0JQMhSxqWSotmOMQUTA5T94J29RGVwZVozSkaAto6fy
 GXf+b93FBE98L3PcDY6aiDnIAAAA=
X-Change-ID: 20260417-sstate-signing-f96c75ce1917
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=16573;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=ELhGg9H0OFxl81CzC6eJxmsaTqSKZGuem9WQC3MmZ5A=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp4jX7f6tZ8hr8Oa/nNHONdLj5wWDkC2UosZRqn
 C8X4MT5RQGJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaeI1+wAKCRDRgEFAKaOo
 NkHYD/9NzIZC5sDeaH93J3u/vD1U0jlAezo/w/2GUf7EaweDtbt7tucbe8RkgRKVJjLJbgorfuG
 OK6UUK+NSfvepPao7xYxZpLf71N7rdWP9Wd+BcW6ZipN2SHAalQuXJY08W4OZYNkqfTS0PU5hJk
 yDoiUIcxKbZmi9AHD9QsnMK8QDyu+h/3tjrDPp7cIK/Ng9yYC9FQDe8Qym+7XHE1sYz8dhoYGo2
 +ceBjqRTDeWoqd+ZhI2bUMirrzDVjijSSCIjkPxrcMs1zWsI+9L/+3kyA/eqtzhGbRuAbBJ8AMu
 iZ+A44XeXfx8sWQIz/qSUV+u89ds4pVw7nZaYViP+go/HmhmM7VHQbt1PCpCv2LajEv4VgdzBAl
 rYWj2LlrhjlholkQvR/9/NfvccLqum72ZtS7xiWlpO1r+DEVwnJnCHw2zdXPvik56vlznYgTFJg
 OMsuVq71mj69WJPn9kPZguRe3xlIVCBeTZohyYWxZqT0L41wuaiXZbKEUl54UAHsyRYxYKIykLi
 ouD1C5mOrWuoBlTseyAeoHqgocMpoNqYzKExFypJ0O+Lgbe5N05UCcPAniQQuk689kbPGeszPbR
 /fxnYFWSgEDxKYhWyZ9vTcLDz7nw0qHtEJnlPa7DBEuCZwREU0/iNLKfrU8EVSHKHMl1N1oDPxP
 A4iOInD76TVhtVA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 17 Apr 2026 13:30:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9276

Document the shared state signing feature. Add a new document in the
Security manual, and definitions for the variables involved in this
process in the variable glossary.

[YOCTO #15217]

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
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
index 317b75913..7387a5d25 100644
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
+      The :term:`SSTATE_VERIFY_SIG` variable controls whether to enable of
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
index 000000000..1845b890f
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
+cache>`. These artifacts are stored in a directory (:term:`SSTATE_DIR`) are not
+signed by default.
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
+Assuming this directory and our temporary directory (:term:`TMPDIR`) is empty,
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
+Now that we have setup our build to sign shared state artifacts, let's see how
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
+   the the real task is executed instead of re-using the shared state.

---
base-commit: 2c12ec7bf29aedeacf82970a9d2eb262fde4670e
change-id: 20260417-sstate-signing-f96c75ce1917


