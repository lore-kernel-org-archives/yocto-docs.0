Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F70E7717F
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 09:27:26 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.77901.1734427636562909528
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Dec 2024 01:27:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ELHZHXX1;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2A07C1C000D;
	Tue, 17 Dec 2024 09:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734427635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r2/kefO5kLrNp8TNKGSYOoo26aqxvVAGcNh2govTEs4=;
	b=ELHZHXX1CMz2EDLDbPzsVcKHcN9yjAPt1Pjy40faBHKVBMMV+L13Oe9YJKlOYbQ0ZNVF/4
	4uqm9o6T5quFUkGtaP5G/5oGy6qbV84lGGMAsB6RnZebc9qLVMeCwPf0860blk8fIqDTbh
	u5JnehB2p4k0ulSA1C3sfId2TT2+Cvm+Uha/z96FvQ+pkhd+UndKQcorUj1loT2H06/r9Y
	ShOVpWaMbWFiBpjzDKDwVU7ENAI6eKUCUpl7qtzFjZHWVZ6pyYXO4cvUCs7HlTAZIKiO73
	VykYZn9cyRrpJb69zZZ/uY3jTwfECWjAJbPRFSTaj8rezCWa4Rh+lqKspcduOA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 17 Dec 2024 10:27:07 +0100
Subject: [yocto-docs PATCH 08/14] Remove debug-tweaks references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-release-note-5-2-updates-v1-8-b189493b1b09@bootlin.com>
References: <20241217-release-note-5-2-updates-v1-0-b189493b1b09@bootlin.com>
In-Reply-To: <20241217-release-note-5-2-updates-v1-0-b189493b1b09@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=11402;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=IQU48UCcKNKRVyPCi3xHJfrs+ZfsL2zAR3412iz7g74=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnYUPwAI2r2u4/srNfeWn3dr6QDBEqtFA6o4FXG
 L116mX7DqyJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ2FD8AAKCRDRgEFAKaOo
 NjNIEADMVWsQQgqnQqMtGKoqQu2LRSsfhZQUaKN2cqyZIU5CxX2L/WBXKnsCaglako3isQ1lZYu
 gMGavYBGpKmisowRuvOyTS6CiAQ2ufBbbzLu4Nlzt2KCakTs+rsy+D2qbwO04AT5H4xYxYM7Q+B
 2ZDtUB9PODOQLdj/F69xen3Fjmn4oJwVh1Au6VN27zNtq1BaJku2juqMXfSAKl+x1JWMJjQngG1
 BHXTerfUewwuO90etkpVXhBduyvrYqUl+spRiEvdmEAK53q0tkfSTNaYqPrdueyiN/e7YIHnZlY
 fs5jMTK7zLcLmglmsdprCGLIHY8fA+9OrPkyKZ6YY7YKvLc2jOtV02xSo58AItaYFTtjjLjDEhM
 bYPr0VkOQ8sSFfp+FatRsNPYuTpSLVtoNvK0bJ/LdveJHUaUfP8QTaXqOH9tezUheqwp5PqV7AC
 DmkrBZsY0sZj2wXituka4P4C5LakbBwi1Bhf2sVxXTe9k5t0mb4wzNYSuF+5GSVVAGmxKmuMuo/
 P87l3tQ/lyY/qQeKZZWDrzwb8dGPy6BmPz1Om1zS3WZsFUvA/a3vdilecy3Vm9t6K6uj1PQaR74
 rKQ4Gn5JC1XLksj3oP3iNarSg75Fs/rz3DhtT6ADPsQjrxRhX7nR8Zh7qy1PRTDd568rumJvVaj
 6akgJsuSA1HgNZA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Dec 2024 09:27:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5941

We no longer provide this feature, so remove documentation for it. In
most cases, we can replace occurrences of "debug-tweaks" by
"allow-empty-password empty-root-password allow-root-login
post-install-logging" to achieve what this feature previously enabled.

Subtle, but the default local.conf does not include
post-install-logging, so in parts where there is mention of the default
local.conf file, adjust the documentation to only mention the first
three above.

In the intro manual, instead of providing instructions that replace
EXTRA_IMAGE_FEATURES entirely, provide ones that append
EXTRA_IMAGE_FEATURES.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/build-quality.rst      |  2 +-
 documentation/dev-manual/customizing-images.rst |  3 +--
 documentation/dev-manual/securing-images.rst    | 12 ++++++------
 documentation/profile-manual/intro.rst          |  4 ++--
 documentation/profile-manual/usage.rst          |  2 +-
 documentation/ref-manual/features.rst           | 19 ++++++-------------
 documentation/ref-manual/variables.rst          | 12 ++++++++----
 documentation/sdk-manual/extensible.rst         |  5 ++++-
 8 files changed, 29 insertions(+), 30 deletions(-)

diff --git a/documentation/dev-manual/build-quality.rst b/documentation/dev-manual/build-quality.rst
index 713ea3a48e53ce42634c89325edc3e95987d0aaa..fbe5fb6f0bb34df440b06bc51123eb36c33bba23 100644
--- a/documentation/dev-manual/build-quality.rst
+++ b/documentation/dev-manual/build-quality.rst
@@ -236,7 +236,7 @@ Here is an example of ``image-info.txt``:
    DISTRO_VERSION = 3.4+snapshot-a0245d7be08f3d24ea1875e9f8872aa6bbff93be
    USER_CLASSES = buildstats
    IMAGE_CLASSES = qemuboot qemuboot license_image
-   IMAGE_FEATURES = debug-tweaks
+   IMAGE_FEATURES = allow-empty-password empty-root-password allow-root-login post-install-logging
    IMAGE_LINGUAS =
    IMAGE_INSTALL = packagegroup-core-boot speex speexdsp
    BAD_RECOMMENDATIONS =
diff --git a/documentation/dev-manual/customizing-images.rst b/documentation/dev-manual/customizing-images.rst
index 5b18958adec38945a163940faa778a597bc961ad..63482594465112aaf33fa2741e98b69830d8a48f 100644
--- a/documentation/dev-manual/customizing-images.rst
+++ b/documentation/dev-manual/customizing-images.rst
@@ -62,8 +62,7 @@ To understand how these features work, the best reference is
 :ref:`meta/classes-recipe/image.bbclass <ref-classes-image>`.
 This class lists out the available
 :term:`IMAGE_FEATURES` of which most map to package groups while some, such
-as ``debug-tweaks`` and ``read-only-rootfs``, resolve as general
-configuration settings.
+as ``read-only-rootfs``, resolve as general configuration settings.
 
 In summary, the file looks at the contents of the :term:`IMAGE_FEATURES`
 variable and then maps or configures the feature accordingly. Based on
diff --git a/documentation/dev-manual/securing-images.rst b/documentation/dev-manual/securing-images.rst
index e5791d3d6df463a3d35665686dc2a53a3711e3fb..f4b528e559088b0021aab78bfc613640c493ff0a 100644
--- a/documentation/dev-manual/securing-images.rst
+++ b/documentation/dev-manual/securing-images.rst
@@ -107,18 +107,18 @@ Considerations Specific to the OpenEmbedded Build System
 You can take some steps that are specific to the OpenEmbedded build
 system to make your images more secure:
 
--  Ensure "debug-tweaks" is not one of your selected
-   :term:`IMAGE_FEATURES`.
+-  Ensure that "allow-empty-password", "allow-root-login", or
+   "empty-root-password" are not one of your selected :term:`IMAGE_FEATURES`.
    When creating a new project, the default is to provide you with an
-   initial ``local.conf`` file that enables this feature using the
+   initial ``local.conf`` file that enables these features using the
    :term:`EXTRA_IMAGE_FEATURES`
    variable with the line::
 
-      EXTRA_IMAGE_FEATURES = "debug-tweaks"
+      EXTRA_IMAGE_FEATURES = "allow-empty-password empty-root-password allow-root-login"
 
-   To disable that feature, simply comment out that line in your
+   To disable these features, simply comment out that line in your
    ``local.conf`` file, or make sure :term:`IMAGE_FEATURES` does not contain
-   "debug-tweaks" before producing your final image. Among other things,
+   any of these features before producing your final image. Among other things,
    leaving this in place sets the root password as blank, which makes
    logging in for debugging or inspection easy during development but
    also means anyone can easily log in during production.
diff --git a/documentation/profile-manual/intro.rst b/documentation/profile-manual/intro.rst
index 86310cf318411e8995e88ee2b71031887c9ab097..31791255246ec6335d9a957b4514a1a43c72a30f 100644
--- a/documentation/profile-manual/intro.rst
+++ b/documentation/profile-manual/intro.rst
@@ -43,7 +43,7 @@ an ``sdk`` image, perhaps one of::
 Alternatively,  you can add ``tools-profile`` to the :term:`EXTRA_IMAGE_FEATURES` line in
 your ``local.conf`` file::
 
-   EXTRA_IMAGE_FEATURES = "debug-tweaks tools-profile"
+   EXTRA_IMAGE_FEATURES:append = " tools-profile"
 
 If you use the ``tools-profile`` method, you don't need to build an sdk image ---
 the tracing and profiling tools will be included in non-sdk images as well e.g.::
@@ -69,7 +69,7 @@ packages (xxx-dbg) which you can manually install as needed.
 To generate debug info for packages, you can add ``dbg-pkgs`` to
 :term:`EXTRA_IMAGE_FEATURES` in ``local.conf``. For example::
 
-   EXTRA_IMAGE_FEATURES = "debug-tweaks tools-profile dbg-pkgs"
+   EXTRA_IMAGE_FEATURES:append = " dbg-pkgs"
 
 Additionally, in order to generate the right type of debug info, we also need to
 set :term:`PACKAGE_DEBUG_SPLIT_STYLE` in the ``local.conf`` file::
diff --git a/documentation/profile-manual/usage.rst b/documentation/profile-manual/usage.rst
index 17be149580341366f950d74f0c1a21e0ccd971ed..d17b256d0f649a6d11481a9aebaec54f3d753f94 100644
--- a/documentation/profile-manual/usage.rst
+++ b/documentation/profile-manual/usage.rst
@@ -308,7 +308,7 @@ install the debugging information for the BusyBox package.
 To generate the debug info for the packages in the image, we can add
 ``dbg-pkgs`` to :term:`EXTRA_IMAGE_FEATURES` in ``local.conf``. For example::
 
-   EXTRA_IMAGE_FEATURES = "debug-tweaks tools-profile dbg-pkgs"
+   EXTRA_IMAGE_FEATURES:append = " dbg-pkgs"
 
 Additionally, in order to generate the type of debugging information that perf
 understands, we also need to set :term:`PACKAGE_DEBUG_SPLIT_STYLE`
diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
index 6e52dfce17b9e06bdb8ad67a5fc8d7304a0f479d..4d327f1a7dca93010b932636dab1f229d667d1cd 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -285,31 +285,24 @@ The image features available for all images are:
 -  *dbg-pkgs:* Installs debug symbol packages for all packages installed
    in a given image.
 
--  *debug-tweaks:* Makes an image suitable for development (e.g. allows
-   root logins, logins without passwords ---including root ones, and enables
-   post-installation logging). See the ``allow-empty-password``,
-   ``allow-root-login``, ``empty-root-password``, and ``post-install-logging``
-   features in this list for additional information.
-
 -  *dev-pkgs:* Installs development packages (headers and extra library
    links) for all packages installed in a given image.
 
 -  *doc-pkgs:* Installs documentation packages for all packages
    installed in a given image.
 
--  *empty-root-password:* This feature or ``debug-tweaks`` is required if
-   you want to allow root login with an empty password. If these features
-   are not present in :term:`IMAGE_FEATURES`, a non-empty password is
-   forced in ``/etc/passwd`` and ``/etc/shadow`` if such files exist.
+-  *empty-root-password:* This feature can be used if you want to allow root
+   login with an empty password. If this feature is not present in
+   :term:`IMAGE_FEATURES`, a non-empty password is forced in ``/etc/passwd`` and
+   ``/etc/shadow`` if such files exist.
 
    .. note::
        ``empty-root-password`` doesn't set an empty root password by itself.
        You get an initial empty root password thanks to the
        :oe_git:`base-passwd </openembedded-core/tree/meta/recipes-core/base-passwd/>`
        and :oe_git:`shadow </openembedded-core/tree/meta/recipes-extended/shadow/>`
-       recipes, and the presence of ``empty-root-password`` or ``debug-tweaks``
-       just disables the mechanism which forces an non-empty password for the
-       root user.
+       recipes, and the presence of ``empty-root-password`` just disables the
+       mechanism which forces an non-empty password for the root user.
 
 -  *lic-pkgs:* Installs license packages for all packages installed in a
    given image.
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 2c2226dd16c25ebb5cdefce9a657a124e51ab143..08fb0f4d5666b80be153f39310826a7e1b9022fe 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -2605,10 +2605,14 @@ system and gives an overview of their function and contents.
         - "dbg-pkgs" --- adds -dbg packages for all installed packages including
           symbol information for debugging and profiling.
 
-        - "debug-tweaks" --- makes an image suitable for debugging. For example, allows root logins without passwords and
-          enables post-installation logging. See the 'allow-empty-password' and
-          'post-install-logging' features in the ":ref:`ref-features-image`"
-          section for more information.
+        - "empty-root-password" --- This feature can be used if you want to
+          allow root login with an empty password.
+        - "allow-empty-password" --- Allows Dropbear and OpenSSH to accept
+          logins from accounts having an empty password string.
+        - "allow-root-login" --- Allows Dropbear and OpenSSH to accept root logins.
+        - "post-install-logging" --- Enables logging postinstall script runs to
+          the ``/var/log/postinstall.log`` file on first boot of the image on
+          the target system.
         - "dev-pkgs" --- adds -dev packages for all installed packages. This is
           useful if you want to develop against the libraries in the image.
         - "read-only-rootfs" --- creates an image whose root filesystem is
diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
index 3f6a754d8818cdf3b718c359ef68238dea34b655..9a50d7fc54c280441958890730eea94a5fee8940 100644
--- a/documentation/sdk-manual/extensible.rst
+++ b/documentation/sdk-manual/extensible.rst
@@ -655,7 +655,10 @@ The extensible SDK supports two different development modes.
       # SSH is mandatory, no password simplifies the usage
       EXTRA_IMAGE_FEATURES += "\
          ssh-server-openssh \
-         debug-tweaks \
+         allow-empty-password \
+         allow-root-login \
+         empty-root-password \
+         post-install-logging \
       "
 
       # Remote debugging needs gdbserver on the target device

-- 
2.47.1


