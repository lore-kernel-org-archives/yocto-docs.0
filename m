Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 064C6CD5BC8
	for <webhook@archiver.kernel.org>; Tue, 26 May 2026 08:18:42 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32472.1779783519720248548
 for <docs@lists.yoctoproject.org>;
 Tue, 26 May 2026 01:18:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=i9aqCNrX;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2E96E4E42D59
	for <docs@lists.yoctoproject.org>; Tue, 26 May 2026 08:18:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F0D9E60732
	for <docs@lists.yoctoproject.org>; Tue, 26 May 2026 08:18:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D5FF010888419;
	Tue, 26 May 2026 10:18:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779783517; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=4hIMMm+J4W0IKDwMswLu1pOVVY/P3/HDRi6w3cecbJw=;
	b=i9aqCNrX4gCryhtA4GsNW9Nc1NMyyHD8nDDUt/X4a79qR1q1AQmf7Ae6QfRzDVp1Ayikn3
	+t66fsAN8lscCxzRomCZiV3oQO8BgLxCKrXPoxba+nE9opUlhPfzpqVKMGvf7kwRShCoo+
	jEDAuR+sM12IQt91IcOVw9bF1GEU+abd+VYUPsk6fxijlVYkoBfP9LQ4X7qD1UBc7H+827
	GBg0kzvebDmJnq5iFYAFI9rVp6ucwD6LHkw1mVd1quEhldcyJyq2sFfFmUamxJQhdLoQ+l
	b7mb00fkHL81OogCzlcfMzh5Fi9WejMQV0NSTIF9MtKG1QzNgroBfZdmv177TQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 26 May 2026 10:18:29 +0200
Subject: [PATCH v4] Document shared state signing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-sstate-signing-v4-1-e6c91c460a21@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XOTQ6CMBAF4KuYrq1xhp+KK+9hXECZ4hhtTVuJh
 nB3KW40xOVL3nxvBhHIMwWxXw3CU8+BnZ1Cvl4Jfa5tR5LbKQvcYrnNQckQYh1JBu4s206aqtS
 q0AQVKDEd3T0Zfs7g8fTJ4dFcSMekpMaZQ3T+NS/2kHp/8R4kyKI1ACVkmFd0aJyLV7Yb7W4i8
 T1+AQgLACdANYVCQDBo2iWQfQO7BZClD1DrHSjV5Mb8AuM4vgG2mfEgQgEAAA==
X-Change-ID: 20260417-sstate-signing-f96c75ce1917
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=17675;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=ors3qalNfDyld47dmCFJMvAb9rLq+VQrPs2qjvdg/2o=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqFVdc0wTTyvRVZvdn+M1lGMFRSfsvfwofSWcN4
 N57j+UIj3qJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCahVXXAAKCRDRgEFAKaOo
 NrgyD/9dEoIgPmjR572xOTJdkcDgQXYEt2lZ/KS8tPBmzVqF4tNC6mAylxXEbJwXkVUWuIWZBIE
 tW8MHZGieO9oAk6/G6xdLwZpZ8utOtplix2Obrw8To0MbkLe3OwcH3jkrmG90tuVxt9pXkJipph
 wfKzbq1bzDOM62hAcfv1Z5NrlpFTo4sfOZyQcckdyBAOOBGdGGiNAHSzGSsRLDPvzRMIO4KPUeW
 l2BtP2ISsv+1dOMx+OQRbrnvYl59bTwiJ7voTYnck+1dbVEuTrHJqJhXgjIsunwqi510t5mvChJ
 j0vgICBmS7pOpTeNLOFaqIpOJoh1suNBEqxRDbb6z5ldDukOI6jxnyXyjkaXNFzrBa5zweD/DCg
 +G5VL+msDNf8GBxRnxFg7tpFM7uprtjww7HH/l32ElcvJ9hnPX5upTXLHgTKISEhk08QBq0QNFu
 jliRM1tp9NIDgzudqaqECy9mwnu5HrQTsZRW46/bv1EFnjmn5wE9oy5yz3/gvIFu+NBgOONZpIK
 0EHRqoADnkdlX4bjVOCQt+AJRBWO6r1TgTJj0oD3wuaaaA3to687Yzx1o/i/6ut9WZ5HnKDe1kY
 CF3wdwot4zCL3uQfnb/Wy/6EVy/tvAvPSgljwnn+M/poS3g+zmes+fGYWIRp6Y3oLXnAGo5JyHN
 0Ew4wDGKyw9/gTw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 26 May 2026 08:18:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9538

Document the shared state signing feature. Add a new document in the
Security manual, and definitions for the variables involved in this
process in the variable glossary.

[YOCTO #15217]

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v4:
- Address comments from Quentin (thanks!)
- Link to v3: https://patch.msgid.link/20260428-sstate-signing-v3-1-52cc8177b4ff@bootlin.com

Changes in v3:
- Rework after Quentin's suggestions (thanks!)
- Link to v2: https://patch.msgid.link/20260421-sstate-signing-v2-1-7b572121f2fd@bootlin.com

Changes in v2:
- Fix typos reported by Ulrich (thanks!)
- Link to v1: https://patch.msgid.link/20260417-sstate-signing-v1-1-5df11613249e@bootlin.com
---
 documentation/overview-manual/concepts.rst       |   6 +
 documentation/ref-manual/variables.rst           |  55 +++++
 documentation/security-manual/index.rst          |   1 +
 documentation/security-manual/sstate-signing.rst | 285 +++++++++++++++++++++++
 4 files changed, 347 insertions(+)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index ec5babe4c..c00c73231 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -1242,6 +1242,12 @@ variable is the function that determines whether a given dependency
 needs to be followed, and whether for any given relationship the
 function needs to be passed. The function returns a True or False value.
 
+.. note::
+
+   It is possible to sign these artifacts with :wikipedia:`GPG
+   <GNU_Privacy_Guard>`. See :doc:`/security-manual/sstate-signing` in the Yocto
+   Project Security Manual for more information.
+
 Images
 ------
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index c65794229..15db2ff44 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -10071,6 +10071,24 @@ system and gives an overview of their function and contents.
 
       For details on the process, see the :ref:`ref-classes-staging` class.
 
+   :term:`SSTATE_SIG_KEY`
+      When signing :ref:`shared state <overview-manual/concepts:setscene tasks
+      and shared state>` artifacts (when :term:`SSTATE_VERIFY_SIG` is set to
+      "1"), the :term:`SSTATE_SIG_KEY` variable is the :wikipedia:`GPG
+      <GNU_Privacy_Guard>` key identifier used to sign them.
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
@@ -10091,6 +10109,43 @@ system and gives an overview of their function and contents.
 
          SSTATE_SKIP_CREATION = "1"
 
+   :term:`SSTATE_VALID_SIGS`
+      When verifying :ref:`shared state <overview-manual/concepts:setscene tasks
+      and shared state>` artifacts (when :term:`SSTATE_VERIFY_SIG` is set to
+      "1"), the :term:`SSTATE_VALID_SIGS` variable is a space-separated list of
+      :wikipedia:`GPG <GNU_Privacy_Guard>` key identifiers to use to verify their
+      signature.
+
+      It must contain the short form identifier of the key pair. For example,
+      when running the ``gpg --list-keys`` command (in bold text below):
+
+      .. parsed-literal::
+
+         pub   ed25519 2026-04-17 [SC]
+               \4049A47E3AAA99D0250966DC\ **5B97632FA7F4E942**
+         uid           [ultimate] Antonin Godard (SState Signing) <antonin.godard\@bootlin.com>
+         sub   cv25519 2026-04-17 [E]
+
+      The short form equals the last 16 characters of the identifier. In the
+      above example: ``5B97632FA7F4E942``.
+
+      .. note::
+
+         If this variable is empty (the default), any of the GPG key present on
+         the :term:`Build Host` can be used by the :term:`OpenEmbedded Build
+         System` to verify the shared state artifacts.
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
index 000000000..74a5d6bf0
--- /dev/null
+++ b/documentation/security-manual/sstate-signing.rst
@@ -0,0 +1,285 @@
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
+For example, Debian-based distributions provide it with the ``gpg`` package.
+Install it as follows:
+
+.. code-block:: console
+
+   $ sudo apt-get install gpg
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
+You need a pair of public and private keys for two independent tasks:
+
+-  Signing the shared state artifacts that the :term:`OpenEmbedded Build System`
+   generates with your **private key**.
+
+-  Verifying the shared state artifacts with your **public key** when re-using them.
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
+It will guide you through the steps of creating the key pair.
+
+Once done, you should be able to list your new key with the following command:
+
+.. code-block:: console
+
+   $ gpg --list-keys
+   pub   ed25519 2026-04-17 [SC]
+         4049A47E3AAA99D0250966DC5B97632FA7F4E942
+   uid           [ultimate] Antonin Godard (SState Signing) <antonin.godard\@bootlin.com>
+   sub   cv25519 2026-04-17 [E]
+
+In the above example, take note of the
+``4049A47E3AAA99D0250966DC5B97632FA7F4E942`` key identifier. This will be used
+to configure the build.
+
+Configuring The Build System To Sign Shared State Artifacts
+===========================================================
+
+Shared State Location
+---------------------
+
+The build system needs to be configured to sign new shared state artifacts when
+they are generated. The generation of new artifacts is done once a task has
+finished being executed.
+
+For the following sections let's assume that the build system has the shared
+state directory location (:term:`SSTATE_DIR`) defined as follows::
+
+   SSTATE_DIR = "${TOPDIR}/sstate-cache"
+
+Assuming this directory and the temporary directory (:term:`TMPDIR`) are empty,
+let's run the ``create_recipe_spdx`` task of the ``gettext-minimal-native``
+recipe:
+
+.. code-block:: console
+
+   $ bitbake gettext-minimal-native -c create_recipe_spdx
+
+Let's take this command as an example throughout this document.
+
+After execution, the shared state directory should be populated with new files:
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
+   Despite its name, the `siginfo` file is unrelated to GPG signing.
+
+Enabling Shared State Signing
+-----------------------------
+
+Create a new :term:`configuration file` on your host **in a safe location** and
+add the two following statements::
+
+   SSTATE_VERIFY_SIG = "1"
+   SSTATE_SIG_KEY = "4049A47E3AAA99D0250966DC5B97632FA7F4E942"
+   SSTATE_SIG_PASSPHRASE = "<your GPG key passphrase>"
+
+It is advised to put these statements in a separate file as those contain
+secrets and should not be shared. For this example, let's assume this file is
+``conf/sstate-sig-key.conf``.
+
+You can make sure this file is only owned by you and not readable by another
+user with:
+
+.. code-block:: console
+
+   $ chown $USER:$USER conf/sstate-sig-key.conf
+   $ chmod o-rwx conf/sstate-sig-key.conf
+
+The statements in this file define:
+
+-  :term:`SSTATE_VERIFY_SIG`: setting this variable to "1" enables the shared
+   state signing feature.
+
+-  :term:`SSTATE_SIG_KEY`: the GPG key identifier for signing shared state
+   artifacts with the private key.
+
+   In the example, this corresponds to the identifier printed with the ``gpg
+   --list-keys`` command :ref:`above <security-manual/sstate-signing:Generating
+   A Public And Private Key Pair With GPG>`.
+
+-  :term:`SSTATE_SIG_PASSPHRASE`: the passphrase used to protect your private
+   key, chosen when creating the key pair.
+
+Let's test the configuration:
+
+#. Continuing with the ``gettext-minimal-native`` example, let's first remove the
+   existing shared state artifacts, to make sure the shared state artifacts for
+   my ``do_create_recipe_spdx`` task are re-generated:
+
+   .. code-block:: console
+
+      $ rm -r sstate-cache/
+
+#. Run the ``create_recipe_spdx`` task for ``gettext-minimal-native``, but this
+   time pass the new ``sstate-sig-key.conf`` file to :term:`BitBake`:
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
+A new ``.sig`` file was created: this means the artifact was successfully
+signed, and the signature is stored in a separate ``.sig`` file.
+
+Verifying Signed Shared State Artifacts
+=======================================
+
+Now that you have set up the build to sign shared state artifacts, let's see how
+you can verify them with the public key counterpart of the private key.
+
+.. note::
+
+   Signature of shared state and its verification can happen on two different
+   hosts, meaning one host can be in charge of the signature while another only
+   verifies the artifacts. This is preferred as the private key should not be
+   shared between multiple hosts.
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
+   which shared state artifacts are accepted.
+
+   This means that shared state will be reused **only if it was signed with the
+   private key corresponding to key identifier**.
+
+   You'll notice the short-form of the key identifier here, which are the last 16
+   characters of the long-form key identifier shown with ``gpg --list-keys`` (in
+   bold text below):
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
+   make the :term:`OpenEmbedded Build System` rebuild everything using the
+   shared state:
+
+   .. code-block:: console
+
+      $ rm -rf tmp/
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
+   The shared state was successfully verified and used!
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
+      $ rm -r tmp/
+
+   Now, try executing the task:
+
+   .. code-block:: console
+
+      $ bitbake gettext-minimal-native -c create_recipe_spdx
+
+   You should have warnings from :term:`BitBake` printed on the console:
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
base-commit: d7376cca64a0784e59d4fd60b9baefb4da2ce289
change-id: 20260417-sstate-signing-f96c75ce1917


