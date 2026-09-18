Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E3A3C982E2
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 13:54:29 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11775.1789739661135842895
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Sep 2026 06:54:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=sA2tjhd7;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 57A71C58478
	for <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:55:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8041460649
	for <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:54:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 78A9810328D58;
	Fri, 18 Sep 2026 15:54:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789739659; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fgl0MK8YNazlqP14R9aUU9qIiJjDLJS73aHdGEwukB0=;
	b=sA2tjhd790mgq4d/d0v4D3oyegPT37nZoIszWg+OxASUylb7r6XZrr7nIMDizxB38GQuc8
	CWJzTrPPhOiERGS/Rz9JFlluMkvWT6STdFaB38qNNjSDNMHXAbqh7EP8u/yLX1daC7qKz4
	3gS3+1tAkqtWVQ3YWDpP8NYb2MmWGShZO0XjK3Ob6ele/qF+jEoWGa6dRneTh7zJNPQQFm
	1+XKcCo8Rbt6LbElCVGeON/7kIqLRinSKOgQnNdjJqd/7hSNT5thTIfQ2XEpcVtD3kXNb2
	Bc7i7wddbxxwFLvjM0Fq2g1NdTQUm4UffY5hZd5F1fkSMW1Ah2dll0qhwJIavA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 18 Sep 2026 15:53:46 +0200
Subject: [PATCH 16/20] migration-guides/migration/release-notes-6.1.rst:
 cover recent changes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-releases-notes-6-1-v1-16-2d0fceffa242@bootlin.com>
References: <20260918-releases-notes-6-1-v1-0-2d0fceffa242@bootlin.com>
In-Reply-To: <20260918-releases-notes-6-1-v1-0-2d0fceffa242@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=38758;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=5TF6APBu50GRaAV+o8NsnWVdPXQQcj1uWVKqJOup+Vo=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqrUJlAVj//p5XsGUf5eQr8EyTUqd+2616T/Uda
 07J97hTqnyJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaq1CZQAKCRDRgEFAKaOo
 NixIEACL9Cmpssgl12pxSk4U27iJFF4SbFY9/jzV3chUw9lraVMs7iuu8Du7Jk7jNoMsLL6Y75S
 d59wLGabve73lhp2uu3he2W4GvbVm/+aVUc3sKlk1dlyHvq6oCwtCghMAX6i/R9J7GbBiQYXtmT
 SZvw69NzojdFSndSIbLb6QC5DGvgz7Nx/ds3X7y2aH98S+NX7hiItgI2sbC/9h3tXlQVcWT4VUH
 zx2QrMUvEOMBCY/wPjgSO92jV+NAne3yaPKa1aIAwlVJ+eqnXcgEXdKD3dverJeDQXbFolr2pj8
 vcNOlEUmaUPtNIdVwPwUkQe2yAqtHaMqxcnhmqYTpy9B5/G/edeMIZhaquxt9dvD9cH07Z31Gob
 7KnOtaF8Ok7XP2gVLU0WKjx+VpacBVuuQCJGGzrO2wOLQx1qD28dI4LwKY2ql+xTwxgmTR7CnZw
 xa66TeSIti9iYlPHQWcinE0btofZyraKaP4DWMNvlLRraIzlXtg1qU8aT3Batw1RzMDFflk+DMb
 OSf4NYuNtQ346eOGy3xaBsof9QzcBlHyjtVRQsDzEsAvE7zgmF/6Gmh/jA7gzRQC+vkSFXMv9VQ
 7fl6TBCAbxFaLMw626zqwIQGDc8Nd3tFDMDhnbyqDOJ1qUk3yyiJ4r5iOX9uHF51cRZ0OoNrsR0
 8sw9rh3qIoFly9w==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:54:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10548

Cover recent changes:

- openembedded-core: bfc0a651f5 to d48e03cf74
- bitbake: 02a7ba546df to 046a90b0e9b
- meta-yocto: fa0b356c9e to c02ac0f8b8

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/migration-6.1.rst   |  48 +-
 .../migration-guides/release-notes-6.1.rst         | 599 ++++++++++++++++++---
 2 files changed, 561 insertions(+), 86 deletions(-)

diff --git a/documentation/migration-guides/migration-6.1.rst b/documentation/migration-guides/migration-6.1.rst
index 457d27bf6..43a02e90c 100644
--- a/documentation/migration-guides/migration-6.1.rst
+++ b/documentation/migration-guides/migration-6.1.rst
@@ -16,7 +16,7 @@ For a list of new features and enhancements, see the
 Supported kernel versions
 -------------------------
 
-The :term:`OLDEST_KERNEL` setting is XXX in this release, meaning that
+The :term:`OLDEST_KERNEL` setting is 5.15 in this release, meaning that
 out the box, older kernels are not supported. See :ref:`4.3 migration notes
 <migration-4.3-supported-kernel-versions>` for details.
 
@@ -26,11 +26,9 @@ Supported distributions
 Compared to the previous releases, running BitBake is supported on new
 GNU/Linux distributions:
 
--  XXX
-
-On the other hand, some earlier distributions are no longer supported:
-
--  XXX
+-  AlmaLinux 10
+-  Fedora 44
+-  Rocky Linux 10
 
 See :ref:`all supported distributions <system-requirements-supported-distros>`.
 
@@ -175,22 +173,56 @@ library in :term:`OpenEmbedded-Core (OE-Core)`:
 Removed recipes
 ---------------
 
--  ``libdazzle``, ``libhandy``: no longer a dependency of the ``epiphany`` recipe, moved to
+-  ``libdazzle``, ``libhandy``: No longer a dependency of the ``epiphany`` recipe, moved to
    `meta-gnome` (in `meta-openembedded`)
    (:oecore_rev:`32d91b67b71de89e0e7cc7525371aec123655908`)
 
--  ``libpcre``: obsolete project now replaced by ``libpcre2``
+-  ``libpcre``: Obsolete project now replaced by ``libpcre2``
    (:oecore_rev:`057cccd9576e1dd0f947fbfc390bc06b210f71cb`)
 
+-  ``libxfont``: Recipe is obsolete and successor libxfont2 is available,
+   nothing depends on it in :term:`OpenEmbedded-Core (OE-Core)` anymore
+   (:oecore_rev:`4666968b23eefe8290b75e60fc3f3a7b8328c193`)
+
+-  ``gptfdisk``: Remove recipe as there are no dependencies on this recipe in
+   :term:`OpenEmbedded-Core (OE-Core)` anymore
+   (:oecore_rev:`188d84bcc136e87d03736606fb8e49f35df47fae`)
+
+-  ``libclc``: Remove recipe as it was replaced by ``mesa-libclc``
+   (:oecore_rev:`5457c35142cc9b6d3fa537cc5ef56e90cce85c88`)
+
+-  ``makedepend``: Remove recipe as ``mesa`` no longer depends on ``makedepend``
+   (:oecore_rev:`7e696b1fa0862da801fbe6e41f8820e65d82cd7a`)
+
+-  ``python-six``: Moved to :oe_git:`meta-python
+   </meta-openembedded/tree/meta-python>`
+   (:oecore_rev:`372ee47516cf6abb2b9a2767df80094491690f97`)
+
+Removed variables
+-----------------
+
+-  ``SDK_TOOLCHAIN_LANGS``: Merged into :term:`SDK_FEATURES`
+   (:oecore_rev:`933981a21e58dffce6dd2b400f2690444320d7d7`)
+
 Removed :term:`PACKAGECONFIG` options
 -------------------------------------
 
 Removed classes
 ---------------
 
+-  ``linux-kernel-base.bbclass``: Was removed as its functionality was moved to
+   :ref:`ref-classes-kernel-arch`. Users of this class should now inherit
+   :ref:`ref-classes-kernel-arch` instead.
+
 Miscellaneous changes
 ---------------------
 
+-  :ref:`ref-classes-archiver`: ``srpm`` support for :term:`ARCHIVER_MODE` was
+   removed (:oecore_rev:`69ce7593e8ed2d82125ed44e3989731d9e9f6858`)
+
+-  ``systemd-systemctl-native``: Rename to ``systemd-tools-native``
+   (:oecore_rev:`ff985de4df46945a92ae4ca59e54c930b7640c9a`)
+
 .. _SPDX License Identifier: https://spdx.org/licenses/
 .. _SPDX License Exception: https://spdx.org/licenses/exceptions-index.html
 .. _SPDX License Check: https://tools.spdx.org/app/check_license/
diff --git a/documentation/migration-guides/release-notes-6.1.rst b/documentation/migration-guides/release-notes-6.1.rst
index 49354f638..3632a2ab0 100644
--- a/documentation/migration-guides/release-notes-6.1.rst
+++ b/documentation/migration-guides/release-notes-6.1.rst
@@ -16,17 +16,17 @@ section.
 New Features / Enhancements in |yocto-ver|
 ------------------------------------------
 
--  Linux kernel XXX, gcc XXX, glibc XXX, LLVM XXX, and over XXX other
+-  Linux kernel 7.2, gcc 16.2, glibc 2.44, LLVM 23.1.1, and over 300 other
    recipe upgrades
 
 ..
    Found in meta/lib/oe/sanity.py:check_sanity_everybuild
 
--  Minimum Python version required on the host: XXX.
+-  Minimum Python version required on the host: 3.9.
 
 -  Kernel-related changes:
 
-   -  :ref:`ref-classes-kernel-module-split`: return list of values in
+   -  :ref:`ref-classes-kernel-module-split`: Return list of values in
       ``extract_modinfo``
       (:oecore_rev:`43da9b93bdf40bc4f2fb81687e80b94571232d5b`)
 
@@ -34,56 +34,157 @@ New Features / Enhancements in |yocto-ver|
       (:term:`MODULE_TARBALL_DEPLOY`) by default
       (:oecore_rev:`f51d48c9eb0bcb630525566091c66ec1af4d770e`)
 
-   -  :ref:`ref-classes-kernel-fit-image`: Validate key files expected by
-      ``mkimage`` for the selected algorithm
-      (:oecore_rev:`7570ab598d10a08fa046d3e8f5897424193240e1`)
-
-   -  ``linux-yocto``: remove CVE exclusion list as
+   -  ``linux-yocto``: Remove CVE exclusion list as
       :ref:`ref-classes-sbom-cve-check` does this itself
       (:oecore_rev:`596ad6c397c5ca264c6c257283ea78095562e67c`)
 
-   -  :ref:`ref-classes-kernel-fit-image`: Do not include ``kernel`` property in
-      DTBO configuration sub-nodes
-      (:oecore_rev:`06ed34005957a6afb88270603df5e545941546b0`)
+   -  :ref:`ref-classes-kernel-fit-image`:
+
+      -  Validate key files expected by
+         ``mkimage`` for the selected algorithm
+         (:oecore_rev:`7570ab598d10a08fa046d3e8f5897424193240e1`)
+
+      -  Do not include ``kernel`` property in DTBO configuration sub-nodes
+         (:oecore_rev:`06ed34005957a6afb88270603df5e545941546b0`)
+
+      -  Fix operation with :term:`KERNEL_DTBVENDORED` set to "1"
+         (:oecore_rev:`4297b94c3728cd2e320d75b68c508e12ab127719`)
+
+      -  Add :term:`KERNEL_DTBVENDORED` support for :term:`FIT_CONF_DEFAULT_DTB`
+         (:oecore_rev:`3bceb2dabeee13c0a80ddd74ea7ae991606d6772`)
+
+      -  Make kernel entry point and load address optional
+         (:oecore_rev:`54c4b4826a3a67fbfef23c93356bfd7e5cb097c1`)
+
+      -  Avoid shadowing os stdlib import
+         (:oecore_rev:`fe1b5a0e7a39619b648cc420ef6ea4033f8cc50d`)
+
+      -  Introduce :term:`FIT_OS` variable to override 'os' field
+         (:oecore_rev:`dc00e830c3f8e6876630a8c81e7d11c18e531a01`)
+
+      -  Reference the boot script as "script"
+         (:oecore_rev:`6bb0775e6ca56eb50119e9ad618dc5b865252f72`)
+
+      -  Skip sign key check for PKCS #11 URI
+         (:oecore_rev:`b606b7153001b76de3467e1fd8a66ae6396de5c1`)
+
+      -  Don't add configuration hash node when signing is enabled
+         (:oecore_rev:`7346ffe190482ee4932728ba8d8741be8bed1d5b`)
 
-   -  :ref:`ref-classes-kernel-fit-image`: Fix operation with
-      :term:`KERNEL_DTBVENDORED` set to "1"
-      (:oecore_rev:`4297b94c3728cd2e320d75b68c508e12ab127719`)
+   -  :ref:`ref-classes-kernel-arch`: Add `Clang` toolchain support
+      (:oecore_rev:`928d81916f6e3e30e486d63d92a02fd6dcb8a59b`)
+
+   -  :ref:`ref-classes-kernel-arch`: Fall back to GNU ``ld`` unless
+      ``ld-is-lld`` is in :term:`DISTRO_FEATURES`
+      (:oecore_rev:`f92bfb5309d87aaf5f9683cd3e80e2a1884db6dc`)
+
+   -  :ref:`ref-classes-kernel-yocto`: Set ``CLANG_FLAGS`` for kernel config
+      checks when using Clang
+      (:oecore_rev:`e88ee794a3f75d7754fe0a3b3c14877c60e7401f`)
+
+   -  ``linux-yocto-dev``: Enable BSP config audit reporting (through
+      :term:`KCONF_BSP_AUDIT_LEVEL`)
+      (:oecore_rev:`c98e8391b3227d0bfefa9a2e3dee1143f1c54589`)
+
+   -  ``kernel-devsrc``: Install sources required for BPF host tools
+      (:oecore_rev:`cf5b6271a9f88f70b2eb9a4a77613ba70c408859`)
+
+   -  :ref:`ref-classes-kernel-yocto-rust`: Add `Clang` toolchain check for
+      ``riscv64``
+      (:oecore_rev:`2b228490b7ef063cc54165fc2aa582a9abf9aa85`)
+
+   -  ``lib/oe/kernel_module.py``: Re-sign kernel modules after package stripping process
+      (:oecore_rev:`a608d107cca13587cd45be45ddfbc4bfdc228f2c`)
+
+   -  :ref:`ref-classes-kernel-module-split`: Don't re-sign compressed kernel modules
+      (:oecore_rev:`3483d029346c56050b40596cf4ad51de45fc63f8`)
 
 -  New core recipes:
 
-   -  ``python3-vcs-versioning``: added as a new dependency of the
+   -  ``python3-vcs-versioning``: Added as a new dependency of the
       ``python3-setuptools-scm`` recipe
       (:oecore_rev:`507bb5234cc13377ba27b8708f798a0815c3485f`)
 
-   -  ``cgo-helloworld``: a Go example recipe with `cgo
+   -  ``cgo-helloworld``: A Go example recipe with `cgo
       <https://go.dev/wiki/cgo>`__ enabled
       (:oecore_rev:`204e4f7398ca0e8847a026c5b4f46685760af90a`)
 
-   -  ``python3-qemu-qmp``: added as a new dependency of QEMU
-      (:oecore_rev:`5babf4e57c20eb54674c323b3527f9b922f17e1e`)
-
-   -  ``jansson``: add a recipe from ``meta-oe``, as it is a new hard dependency
+   -  ``jansson``: Add a recipe from ``meta-oe``, as it is a new hard dependency
       of the ``igt-gpu-tools`` recipe
       (:oecore_rev:`2b6e7d092b4a21930186682ebf085848b2e49de5`)
 
+   -  ``packagegroup-core-buildessential-rust``: A
+      :ref:`ref-classes-packagegroup` to provide the on-target dependencies
+      required for building `Rust`-based kernel modules, including the `Rust`
+      toolchain, ``bindgen``, and ``libclang``
+      (:oecore_rev:`500b45f8382a0f772c8ade37a46307fb671796b2`)
+
+   -  ``nativesdk-packagegroup-sdk-host-rust``: Similar to
+      ``packagegroup-core-buildessential-rust`` but for building `Rust`-based
+      kernel modules in the SDK
+      (:oecore_rev:`a05c097edb552c5a7bc0fd812be353f079f8d201`)
+
+   -  ``nativesdk-packagegroup-sdk-host-clang``: :ref:`ref-classes-nativesdk`
+      :ref:`ref-classes-packagegroup` providing the `Clang`, ``lld``, and
+      ``llvm-bin`` dependencies needed to build external/out-of-tree modules in
+      the SDK using the LLVM/Clang toolchain
+      (:oecore_rev:`2b1db6ec316d6f92d1631b82e91b4c334962213e`)
+
+   -  ``gstreamer1.0-plugins-rs``: GStreamer Rust plugins
+      (:oecore_rev:`3a2b032f0fccc9dd636db82a63f67d644ad8bf51`)
+
+   -  ``rust-source``: Recipe that fetches, unpacks, and patches the ``rustc``
+      source tree into a "work-shared" location
+      (:oecore_rev:`395fe161362c5b6d39a9b01e938d99567c6273c3`)
+
+   -  ``libzip``: Added because it is a dependency of various tools
+      (:oecore_rev:`f17e8750c39030fbd4bc41e22d4f5e80c4ccaf87`)
+
+   -  ``mesa-libclc``: New recipe for forking ``libclc`` for ``Rusticl`` purposes in Mesa
+      (:oecore_rev:`956aaf355dc875cdf4579884d187e9eb3a236f85`)
+
+   -  ``libtracefs``: Added as ``powertop`` version 2.16 requires it
+      (:oecore_rev:`3c3f22739573f91392330e202c0fa7e96c8dc7ab`)
+
+   -  ``libfaketime``: Used for reproducibility testing
+      (:oecore_rev:`f3a4faaf4c3cf78f74baa7e5a147749dfa6bbe47`)
+
+   -  ``python3-tomlkit``: New dependency of ``hatchling``
+      (:oecore_rev:`46d3b26a63703f4b5d055c0d9da3c7550161ec32`)
+
 -  New core classes:
 
-   -  :ref:`ref-classes-python_uv_build`: used to build Python recipe with
+   -  :ref:`ref-classes-python_uv_build`: Used to build Python recipes with
       ``uv_build``, a slimmed down version of ``uv``
       (:oecore_rev:`c535a9f5dbdc5d8ddb4a2438604456b8084a73aa`)
 
-   -  :ref:`ref-classes-upstream-stable-release-point`: helper class for setting
+   -  :ref:`ref-classes-upstream-stable-release-point`: Helper class for setting
       the :term:`UPSTREAM_STABLE_RELEASE_REGEX` variable with
       :term:`STABLE_VERSION_PARTS`
       (:oecore_rev:`a1e069d04cb13e990b362804bd56a4935338ef96`)
 
+   -  :ref:`ref-classes-python_pbr`: Used to build Python recipes with the
+      `Python Build Reasonableness <https://pypi.org/project/pbr/>`__ backend
+      (:oecore_rev:`b9f3b369b8538a1cf5d4980c9010888d697eb2f1`)
+
 -  New variables:
 
    -  :term:`UBOOT_FIT_CONF_DESC` allows configuring the description property
       of the configuration node of a U-Boot FIT image
       (:oecore_rev:`df16e4a3900f53245cc8d9a92e277aead56a7369`)
 
+   -  :term:`KERNEL_TOOLCHAIN`: Allows specifying the toolchain to use to build
+      the Linux kernel
+      (:oecore_rev:`0e3756efe0923e621d88f61121cfa56b23454211`)
+
+   -  :term:`FIT_OS`: Controls the ``os`` field of the FIT image built with the
+      :ref:`ref-classes-kernel-fit-image` class
+      (:oecore_rev:`dc00e830c3f8e6876630a8c81e7d11c18e531a01`)
+
+   -  :term:`CARGO_PROFILE`: Allows selecting the :ref:`ref-classes-cargo`
+      profile to use (``--profile``)
+      (:oecore_rev:`d4de7d0256aca47cdb1df48640c37221deaa09d4`)
+
 -  :term:`OpenEmbedded-Core (OE-Core)` library changes:
 
    -  ``oe/lsb``: Only read ``/etc/os-release``
@@ -94,10 +195,16 @@ New Features / Enhancements in |yocto-ver|
 
 -  Global configuration changes:
 
-   -  ``bitbake.conf``: define a new ``firmwaredir`` variable (which by default
-      points to ``/lib/firmware``). This variable was adopted in
-      several recipes to replace ``${nonarch_base_libdir}/firmware``
-      (:oecore_rev:`2b75c7ba5e3aa6fc57d7b4afe59e2277b4d87de1`)
+   -  ``bitbake.conf``:
+
+      -  Define a new ``firmwaredir`` variable (which by default points to
+         ``/lib/firmware``). This variable was adopted in several recipes to
+         replace ``${nonarch_base_libdir}/firmware``
+         (:oecore_rev:`2b75c7ba5e3aa6fc57d7b4afe59e2277b4d87de1`)
+
+      -  Drop ``opencl`` from :term:`DISTRO_FEATURES_FILTER_NATIVE` and
+         :term:`DISTRO_FEATURES_FILTER_NATIVESDK`
+         (:oecore_rev:`f810998ac90f7a3e20e26555f39d754b16ce8b69`)
 
    -  :ref:`ref-classes-useradd`: Add support for the :term:`USERMOD_PARAM`
       variable, acting as a replacement of the ``GROUPMEMS_PARAM`` variable
@@ -110,9 +217,6 @@ New Features / Enhancements in |yocto-ver|
    -  :ref:`ref-classes-useradd`: Switch from ``--root`` to ``--prefix`` option
       (:oecore_rev:`a7b846ba7d6d63a5e59939d75d9c5fe3e4cbb0e9`)
 
-   -  :ref:`ref-classes-extrausers`: Switch from using --root to --prefix
-      (:oecore_rev:`8f20f792482bcecc58a0c51ec7947339eb6e2a61`)
-
 -  BitBake changes:
 
    -  The ``git-make-shallow`` utility script was dropped along with its test
@@ -122,6 +226,11 @@ New Features / Enhancements in |yocto-ver|
    -  Replace ``codegen`` with ``ast.unparse()``
       (:bitbake_rev:`76dd6d69c59c1686be2dfb3fc5b72c2a9df34871`)
 
+   -  After the removal of the previous obsolete ``bb.fetch`` module, the
+      ``bb.fetch2`` module was renamed to ``bb.fetch``. A warning will be
+      printed if ``bb.fetch2`` is used in layers
+      (:bitbake_rev:`34ea7cb48090f1ee962d40aca3ebbaf1679b6b23`)
+
    -  ``fetch/git``:
 
       -  Fix leaking of temporary directory
@@ -136,19 +245,94 @@ New Features / Enhancements in |yocto-ver|
    -  Unpack RPMs with ``--no-absolute-filenames``
       (:bitbake_rev:`1b1a71586aa93678c1d9ca40ef2c6fa518f89356`)
 
-   -  ``tinfoil``: Only allow one process progress bar at once
-      (:bitbake_rev:`d6bc0e5ec549a4f984cb3d470dd3c04d0ea46fde`)
+   -  ``tinfoil``:
+
+      -  Only allow one process progress bar at once
+         (:bitbake_rev:`d6bc0e5ec549a4f984cb3d470dd3c04d0ea46fde`)
+
+      -  Add a prepared task runner, to execute a single recipe task and nothing
+         else
+         (:bitbake_rev:`280a3b379bc11567ac1397e25f164297d65c70eb`)
+
+   -  ``knotty``: Show elapsed time on the task progress bar
+      (:bitbake_rev:`b8dfa3567db01d129fc5bda4285fcb36883b0f12`)
 
-   -  ``bitbake-setup``: add a "notes" item to ``bitbake-setup`` configuration
-      files which create a "conf-notes.txt" file in the :term:`Build Directory`
-      (:bitbake_rev:`020a5ba24c7df53eacf834deb87216053ccd38db`)
+   -  ``bitbake-setup``:
+
+      -  Add a "notes" item to ``bitbake-setup`` configuration
+         files which create a "conf-notes.txt" file in the :term:`Build Directory`
+         (:bitbake_rev:`020a5ba24c7df53eacf834deb87216053ccd38db`)
+
+      -  Add a ``--version`` option
+         (:bitbake_rev:`0e39acaaebb726a1e5524fdd28749f747b6ccf63`)
+
+      -  Add PyPI packaging for ``bitbake-setup``, allowing to install the tool
+         with ``pip``
+         (:bitbake_rev:`6b51b93a77adb363e9da19244064486f968a547e`)
+
+      -  Use the :term:`BitBake` built-in fetcher for buildtools installer download
+         (:bitbake_rev:`e8d531cec67644ee4340c6b99365454349ebc246`)
+
+      -  ``default-registry``: Use the
+         :ref:`ref-fragments-core-yocto-monitor-disk-space` fragment by default
+         (:bitbake_rev:`975b322cfa6349e751e21717c3e2e8526494108c`)
+
+      -  Print a note about fetcher log if something fails there
+         (:bitbake_rev:`3860fabb2d0dcdb280ad268c08d6f6f27a417141`)
 
    -  ``lib``: Drop ``pyinotify``, as it wasn't used by :term:`BitBake` anymore
       (:bitbake_rev:`d20e7dcbd8b6b47273222b5281b956aab58b3351`)
 
-   -  ``fetch2/crate``: support user-defined protocols
+   -  ``lib``: Rename ``fetch2`` as ``fetch`` and invert compatibility shim to
+      make ``bb.fetch2`` equal to ``bb.fetch``
+      (:bitbake_rev:`34ea7cb48090f1ee962d40aca3ebbaf1679b6b23`)
+
+   -  ``fetch``: Switch to shared locking for read accesses
+      (:bitbake_rev:`e8f8ab657e521f6409f0ad783b420e6ca559f317`)
+
+   -  ``fetch/crate``: Support user-defined protocols
       (:bitbake_rev:`22a993aed05baecb06bcf9b6875eb43bf543a1a0`)
 
+   -  ``fetch``: Export ``AWS_SHARED_CREDENTIALS_FILE`` for S3 fetches,
+      allowing to use a credential file different than ``~/.aws/credentials``
+      (:bitbake_rev:`0d6aa2b58aa2f253c91c3874f42e2051f8b56d56`)
+
+   -  ``fetch/{npm,npmsw}``: Re-enable fetchers now that checksums come from
+      :term:`SRC_URI`, and restore the fetcher's test coverage
+      (:bitbake_rev:`9e45e00a2009f28829417c9517f5ab623f66dd5d`,
+      :bitbake_rev:`f7608f3195af9abb405af9be95286e2267221331`)
+
+   -  ``fetch/wget``:
+
+      -  Handle long filenames correctly
+         (:bitbake_rev:`da1fcdf15c647a2a718ae921e261a76e451b442a`)
+
+      -  Reuse cached HTTPS connections
+         (:bitbake_rev:`2c236d8bdc51742cbc5a97e30fb126d82d4a908a`)
+
+      -  Cache SSL context instead of recreating every time
+         (:bitbake_rev:`625b25ad1c115d0a732330c71a79d323e09b8848`)
+
+   -  ``fetch/gitsm``: Store the original URL data to fix relative ``gitsm://`` paths
+      (:bitbake_rev:`58872250f72f5760b4126552bdec5497f5a1a1f4`)
+
+   -  Add ``pyproject.toml`` and ``vendor.txt`` for vendoring
+      (:bitbake_rev:`70b54fdace8597043ff70e23737273a17d303a70`)
+
+   -  ``data``: Return a list from exported_vars()
+      (:bitbake_rev:`c870f5bd96ad02efc02c58133c27bdae3a300e3e`)
+
+   -  ``asyncrpc``: Add Task Group
+      (:bitbake_rev:`4fc36e6b93bb85040526954371ed53a6f8b71ea7`)
+
+   -  ``hashserv``:
+
+      -  Client: Add asynchronous streaming API
+         (:bitbake_rev:`544d9f1badcc51843f1448be7c73974b5aea0c3f`)
+
+      -  Server: Add queued streaming API
+         (:bitbake_rev:`9e0f0649de0f956c942f5fe42df13ba094e8c92b`)
+
 -  SPDX-related changes:
 
    -  Add SHA 512 support
@@ -157,67 +341,238 @@ New Features / Enhancements in |yocto-ver|
    -  Add custom annotations to recipe packages
       (:oecore_rev:`e5a4a7d7c1916d88456838fbb31ee87d6a1e48ab`)
 
+   -  ``common-licenses``: Add SPDX License Exceptions
+      (:oecore_rev:`9c8d126ac9bb6f88a77ed34278f4c3502646260a`)
+
+   -  ``lib/oe``: Add SPDX license library
+      (:oecore_rev:`51c793022081ce3c404cb0f8b3fa18551c88f187`)
+
+   -  ``lib/oe/license``: Rework package licenses matching
+      (:oecore_rev:`e3c5cb744195f519e9e3b52a68326dcff7749620`)
+
+   -  ``lib/oe/spdx30_tasks``: Fix image deploy dir
+      (:oecore_rev:`fe3a72172d7ad67cd1f54e6a1e8337567ccdc042`)
+
+-  :ref:`ref-classes-sbom-cve-check`-related changes:
+
+   -  ``sbom-cve-check`` recipe: Enable offline mode
+      (:oecore_rev:`db2e0fdf82af5b50053840e522bf72550d1cbe66`)
+
+-  Packaging changes:
+
+   -  ``package_manager/ipk``: Skip checksums for unsigned local feeds
+      (:oecore_rev:`3f50b047b17392a11a4a2587d44c1db8fb652506`)
+
+   -  :ref:`ref-classes-package_rpm`: Drop external dependency generator to support RPM 6
+      (:oecore_rev:`093ae9987bd2de38a3a9627fcbc09745f0a8b67f`)
+
+   -  ``libarchive``: Add RPM format reader to support RPM 6
+      (:oecore_rev:`8401bac0ca8ab969e9a2861b116896e1f9c8b9f6`)
+
+   -  No longer modify paths in ``save_debugsources_info()``
+      (:oecore_rev:`b567c2f0d91fbf36886d0c3a6f6ea90c07771044`)
+
 -  QEMU / ``runqemu`` changes:
 
+   -  ``runqemu-export-rootfs``: Set :term:`PSEUDO_INCLUDE_PATHS` for ``unfsd``
+      (:oecore_rev:`76b8b8320436b086059b20813de6523161a5a666`)
+
+   -  ``runqemu-extract-sdk``: Refactor in Python
+      (:oecore_rev:`78c176df185b49f7d7720145e85089c3556c9833`)
+
+   -  ``qemu``: Set the compilation progress bar flag
+      (:oecore_rev:`21994d6de3f753728ec2bc1ed11d2e819442a3f7`)
+
+   -  ``qemu``: Add ``ppc64le`` support to :term:`COMPATIBLE_HOST`
+      (:oecore_rev:`77a329d18a068dcc7d3b24c1e90826dfde45d2d1`)
+
+   -  ``python3-qemu-qmp``: Added as a new dependency of QEMU
+      (:oecore_rev:`5babf4e57c20eb54674c323b3527f9b922f17e1e`)
+
 -  Documentation changes:
 
--  Go changes:
+   -  New document on :doc:`shared state signing </security-manual/sstate-signing>`
 
--  Rust changes:
+   -  New document on :doc:`setting up a shared state mirror </dev-manual/sstate-mirrors-setup>`
 
--  Wic Image Creator changes:
+   -  New document on how security is handled in builds:
+      :doc:`/security-manual/build-process-security`
+
+-  Go changes:
+
+   -  :ref:`ref-classes-go-vendor`: Remove vendor symlink
+      (:oecore_rev:`d3cbc285a257f132a17ec042ddb11eef136c6d2b`)
 
 -  Testing-related changes:
 
    - :ref:`ref-classes-ptest` support was added for the following recipes:
 
-      -  ``go``
-      -  ``libatomic-ops``
-      -  ``libxslt``
-      -  ``python3-vcs-versioning``
-
-   -  ``meta-selftest``: add a ``usegroup-deponly`` recipe to test
+      -  ``go`` (:oecore_rev:`9ca41405e6bca276468a3b6f67eaa328b8016485`)
+      -  ``libatomic-ops`` (:oecore_rev:`d899b7f50aad0c09d2db16dc83627fc1898bfab2`)
+      -  ``libcap`` (:oecore_rev:`bfc0a651f5bdf57080f811fd0c63b80f179f7563`)
+      -  ``libxslt`` (:oecore_rev:`fa4328b70af3e6bad42970322a5874c192761c6d`)
+      -  ``python3-certifi`` (:oecore_rev:`0aa251fa23646440182f5507215a91381ddeef5c`)
+      -  ``python3-pyopenssl`` (:oecore_rev:`3fdfff9b7e873904674eb64d345334e017bea10d`)
+      -  ``python3-vcs-versioning`` (:oecore_rev:`90c8bc12b2af0df3ea73d3e036e114bc683bdb6c`)
+      -  ``wget`` (:oecore_rev:`bb24e394d151293be52e110d898e398a95c32ea0`)
+      -  ``zstd`` (:oecore_rev:`f3e3ccba7f8090cc6e8752faed6b973409ae0832`)
+
+   -  ``meta-selftest``: Add a ``usegroup-deponly`` recipe to test
       :term:`USERADD_DEPENDS` only
       (:oecore_rev:`36eac58184a22ba972f8613bd9f564e0f6bd1680`)
 
-   -  ``python3``: use a ``SKIPPED_TESTS`` variable instead of test skip patches
+   -  ``python3``: Use a ``SKIPPED_TESTS`` variable instead of test skip patches
       (:oecore_rev:`a8b2baa6020f96468a98200619ec37c460694c4c`)
 
--  Utility script changes:
+   -  ``oeqa/oelib``: Add ``runcmd`` tests
+      (:oecore_rev:`b364c44de83bcf73c621972ad5e09e46ccb9d412`)
 
-   -  ``scripts/cve-json-to-text.py``: simplify ``getopt`` argument parsing
-      (:oecore_rev:`a92dfe569844189344fbb5ea0521b2bf7dbf0623`)
+   -  ``oeqa/selftest/pkgdata``: Add a test for variable consistency in
+      :ref:`ref-classes-multilib*`
+      (:oecore_rev:`b937278645b4e170c821910c559bfb7be7be0f44`)
+
+   -  ``oeqa/selftest/kernelmodulesplit``: Test cross-recipe kernel module dependencies
+      (:oecore_rev:`6ca1f213e2718b95c52a1e643b80d17bb9317da5`)
+
+   -  ``oe-selftest``: :ref:`ref-classes-kernel-fit-image`: Add tests for
+      :term:`KERNEL_DTBVENDORED`
+      (:oecore_rev:`de2e11e63624f86583875163e66f63ea7457c121`)
+
+   -  :ref:`ref-classes-testimage`: Handle bootlog variants on failed QEMU tests
+      (:oecore_rev:`7a6596925cb0eb8dd48a0362a51875cdd60152bc`)
+
+   -  ``oeqa/selftest``: Add :ref:`ref-classes-go-vendor` selftest suite
+      (:oecore_rev:`79d251a1893865ad126aabf3599173729a6321a7`)
+
+   -  ``oeqa/selftest/clang``: Add selftests for Clang/LLVM/LLD test suites
+      (:oecore_rev:`8e7a293bcf050ff79f5a42d9048ab58960dc335c`)
+
+   -  ``oe-selftest``: ``devtool``: Add test for ``add``/``finish`` workflow
+      (:oecore_rev:`36472a7b495eabe5a038644e943931cf6913cf15`)
+
+-  ``devtool``-related changes:
+
+   -  Disable GPG signing when setting up source tree repos
+      (:oecore_rev:`b5c84b07b87eafb4f68f7662b6cf26d8b73e3247`)
+
+   -  ``upgrade`` command: Extract changelog between versions
+      (:oecore_rev:`ddd54d6d9760e6c049ef82f250c81a10592d409d`)
+
+   -  Fix ``finish``/``update-recipe`` for recipes using :term:`AUTOREV`
+      (:oecore_rev:`ae7be93cfd63088f6f160e75a99d9eaca1e1bd7f`)
+
+   -  Fix ``update-recipe``/``finish`` ``--initial-rev`` override
+      (:oecore_rev:`62abb60b899e63ea6db5c745f4b1b6af0d4b40f1`)
+
+   -  Guess ``srcrev`` update mode for ``gitsm://`` recipes too
+      (:oecore_rev:`9307c37634c56f7df19ca5a93689e2fe6213f10e`)
+
+   -  ``upgrade``: Ignore changelogs from 3rd party
+      (:oecore_rev:`1c9d4bb853e457ce533edecd2ddddf1f6ff8a8f1`)
 
-   -  ``devtool``:
+   -  ``deploy-target``: Fix running ``strip`` under :term:`pseudo`
+      (:oecore_rev:`a48a731a2beb7833177400dc9422b1621d064e35`)
 
-      -  Disable GPG signing when setting up source tree repos
-         (:oecore_rev:`b5c84b07b87eafb4f68f7662b6cf26d8b73e3247`)
+   -  ``ide-sdk``:
 
-      -  ``upgrade`` command: extract changelog between versions
-         (:oecore_rev:`ddd54d6d9760e6c049ef82f250c81a10592d409d`)
+      -  Add `LLDB` support for `Clang` toolchain
+         (:oecore_rev:`e81d8971f756963850be7dee7b05e5579bfe7bbf`)
 
-   -  ``upgrade`` command: add a ``--stable`` option
+      -  Default to all modified recipes
+         (:oecore_rev:`4c1c0ff4512fd7882f8e0916bc19441e91e5a6c3`)
+
+      -  Auto-write image debug settings to ``bbappend``
+         (:oecore_rev:`929a8c198df54f022f1ba65d8931f9d285a0e763`)
+
+      -  Support ``runqemu slirp``
+         (:oecore_rev:`5cc15eccbcde40ecdb3ff04ea7c08e0e3dda2d9d`)
+
+      -  Support NFS rootfs
+         (:oecore_rev:`4ab284aadca01f4fcb262e99f3d3e48b86121689`)
+
+      -  Add clangd support for VSCode IntelliSense
+         (:oecore_rev:`10a0a09003cbfed7fb180fc21d56f021e9dd33f9`)
+
+      -  Support clangd for non-clang toolchain recipes
+         (:oecore_rev:`da9ac674451616dcb7c6f8d59e15a459c9fb37d6`)
+
+      -  Format C/C++ with clangd when .clang-format is present
+         (:oecore_rev:`5c13e480ad926ebd67f5f0c44e676a3ac2c482d7`)
+
+      -  Support LLDB ATTACH mode
+         (:oecore_rev:`6a4227b03a2c515cd97b33f4bf2b9ae65bc5d82c`)
+
+      -  Allow --ide to select multiple plugins
+         (:oecore_rev:`8aa5c039973d614f7ebe557e5cd58537bf012ebc`)
+
+   -  Fix file copy on ``finish --force``
+      (:oecore_rev:`b8fda5dd1571bba32f894339e83f43d1872db986`)
+
+   -  ``deploy-target``: Add ``--package``/``--file-glob`` filters
+      (:oecore_rev:`cf6d07f8d8417b9c241b8e2ba1dbc1fd1e3998ff`)
+
+   -  ``deploy``: Make :term:`pseudo` calls independent of bitbake.conf
+      (:oecore_rev:`462019b92fb023768a17df5162975e65e60fda47`)
+
+   -  ``deploy``: Allow deploying directly into a local rootfs directory
+      (:oecore_rev:`763accbf1ddc558175413b80fdfdc643b8d4ec47`)
+
+-  Utility script changes:
+
+   -  ``scripts/cve-json-to-text.py``: Simplify ``getopt`` argument parsing
+      (:oecore_rev:`a92dfe569844189344fbb5ea0521b2bf7dbf0623`)
+
+   -  ``upgrade`` command: Add a ``--stable`` option
       (:oecore_rev:`1e86aa039108621b2af734ef358a1e9d3c4d88d8`)
 
-   -  ``oe-pkgdata-util``: fix empty ``runtime-rprovides`` directory handling
+   -  ``oe-pkgdata-util``: Fix empty ``runtime-rprovides`` directory handling
       (:oecore_rev:`678c1c2077316b6b81ba9be000528b50dca19ca6`,
       :oecore_rev:`dbca656205a7d9a9a9b0aa25b4ad6562af9c5180`)
 
-   -  ``recipeutils``: add optional ``stable_upgrade`` parameter to
+   -  ``recipeutils``: Add optional ``stable_upgrade`` parameter to
       ``get_recipe_upgrade_status``, to add the possibility of doing stable
       version upgrades of recipes
       (:oecore_rev:`1ed8fdda035dcc21f3df71c0c996973224f4f683`)
 
-   -  ``install-buildtools``: auto-discover environment setup script via glob
-      (:oecore_rev:`1105378e967a812f3bdc3fcc25bb7fd5350cca6c`)
+   -  ``scripts/pull-spdx-licenses.py``: Add exceptions to the script that
+      updates the SPDX license files
+      (:oecore_rev:`4190cdd6ceff9b88005f0845866a78eb407b0aa5`)
 
--  Clang/LLVM related changes:
+   -  ``install-buildtools``:
 
--  SPDX-related changes:
+      -  Auto-discover environment setup script via glob
+         (:oecore_rev:`1105378e967a812f3bdc3fcc25bb7fd5350cca6c`)
+
+      -  Add a ``--local-file`` option
+         (:oecore_rev:`e160ff4510de712ba43e37c8f2bfb1a57580bfaf`)
+
+   -  ``scripts/contrib``: Add ``reuse-get-license.py``, a script that extracts
+      the :term:`LICENSE` and :term:`LIC_FILES_CHKSUM` for projects that use
+      `reuse <https://reuse.software/>`__
+      (:oecore_rev:`8ec5b74051308d0882e2018bbec3be06958dae03`)
+
+   -  ``scripts/contrib``: Add helper to report and fix missing :term:`SRC_URI`
+      ``;tag=`` parameters
+      (:oecore_rev:`d9a75fa667a89f9dfd81b8fdcea74c5b9048689b`)
+
+   -  ``resulttool``: Add support for ptests results for both `Musl` and `Glibc`
+      (:oecore_rev:`c0508fbea8d26242e0c761d412d727943f9d6355`)
+
+   -  ``scripts/oe-depends-dot``: Give the ``dotfile`` argument a sensible default
+      (:oecore_rev:`88620a3d917ec23ea3a4760a622bf319a3fe3d84`)
+
+   -  ``sstate-cache-management.py``: Also check the :term:`SSTATE_DIR`
+      environment variable for ``--cache-dir``
+      (:oecore_rev:`ad44f5edfb440a97ad8add379489b649ae29ab1b`)
+
+-  Clang/LLVM-related changes:
+
+   -  ``clang``: Enable cmake flags for llvm, clang, lld tests
+      (:oecore_rev:`c926c4f9f7ecf22698b7426609f8806feee175ca`)
 
 -  Patchtest-related changes:
 
--  :ref:`ref-classes-insane` / :ref:`ref-classes-sanity` classes related changes:
+-  :ref:`ref-classes-insane` / :ref:`ref-classes-sanity` classes-related changes:
 
    -  Add a check that :term:`SOURCE_MIRROR_URL` is defined when
       :ref:`ref-classes-own-mirrors` is used
@@ -226,72 +581,160 @@ New Features / Enhancements in |yocto-ver|
    -  Add a check for build host ``HOME`` directory in packaged files
       (:oecore_rev:`81bbe42edbed590389a1b0ed4b1a58a6738dc760`)
 
+   -  Allow exceptions in ``buildpaths`` ``HOME`` checks
+      (:oecore_rev:`ee29a9132a2566ba03f28c5042554a5faf9d233e`)
+
+   -  :ref:`ref-classes-sanity`: Warn on `Cargo` config files outside of the
+      build tree
+      (:oecore_rev:`77516d3c4fe4291eb947c2f7c636a362c041c911`)
+
+   -  Increase shebang size limit
+      (:oecore_rev:`c205e77fc394b50ddf4f4e0bec29bb1c8eec44d6`)
+
+   -  Improve ``HOME`` checks exceptions
+      (:oecore_rev:`f6b9494eac4d4da3ba72303ca5de82d5f60e48f0`)
+
 -  Security changes:
 
 -  :ref:`ref-classes-sbom-cve-check`-related changes:
 
 -  New :term:`PACKAGECONFIG` options for individual recipes:
 
+   -  ``curl``: ``libpsl``, ``libssh``
+   -  ``dhcpcd``: ``seccomp``
+   -  ``ethtool``: ``pretty-dump``
+   -  ``ffmpeg``: ``libdav1d``
+   -  ``iproute2``: ``dcb``, ``dpll``
+   -  ``libical``: ``introspection``, ``vala``
    -  ``libportal``: ``gtk4``
    -  ``librsvg``: ``avif``, ``gdkpixbuf``
-   -  ``perf``: ``bpf-skel``, ``llvm``
    -  ``p11-kit``: ``systemd``, ``trust``
+   -  ``pciutils``: ``dns``, ``shared``
+   -  ``perf``: ``bpf-skel``, ``llvm``
+   -  ``seatd``: ``manpages``
+   -  ``strace``: ``libdw``
+   -  ``vim``: ``desktop``
+   -  ``webkitgtk``: ``bubblewrap``, ``librice``, ``webrtc``
    -  ``wpa-supplicant``: ``suiteb``, ``mbo``, ``wnm``
 
--  systemd related changes:
+-  systemd-related changes:
+
+   -  ``systemd-tools-native``: Add ``systemd-hwdb``
+      (:oecore_rev:`2a7c2ddd739db59bc14d781aa919bdd4724b365e`)
+
+   -  ``systemd``: Enable ``coredump`` in :term:`PACKAGECONFIG` by default
+      (:oecore_rev:`1086a56d222fac8c602f086cc3d6467b34f4d61e`)
+
+-  U-Boot-related changes:
+
+   -  Add support for `Clang` toolchain
+      (:oecore_rev:`321421117de088e6b23da9c746d16df0c6081323`)
+
+   -  :ref:`ref-classes-uboot-sign`: List the TEE loadable behind U-Boot
+      (:oecore_rev:`a9a20a0c95eba16e0dce0abe5e9a3998e4520386`)
+
+-  Busybox-related changes:
+
+   -  ``fdisk``: Enable GPT support
+      (:oecore_rev:`d0914b892b9236ad18ba29d4807d5adbbae992e6`)
+
+   -  Enable ``xxd``
+      (:oecore_rev:`2852025109cb23577897461f4d2bdfd213602461`)
 
--  U-Boot related changes:
+   -  Enable ``findfs`` for initramfs ``LABEL`` support
+      (:oecore_rev:`c2b681e39421ae5b4fea917b3c3ed69bd1020b6c`)
+
+-  ``initramfs-framework``-related changes:
+
+   -  ``overlayroot``: Use ``switch_root`` instead of ``chroot``
+      (:oecore_rev:`848c368291b59ce6e928cdc973f94b34a6cdaa12`)
+
+   -  Add opt-in root-only ``udev`` trigger
+      (:oecore_rev:`d3a196f5742425fb24cfc21bb380f3e96c49253c`)
+
+   -  Support ``LABEL`` with root-only ``udev`` trigger
+      (:oecore_rev:`fda394c2b91b3c66545f75dc13f7e8649e3cdb6d`)
+
+   -  Avoid external commands in rootfs resolution
+      (:oecore_rev:`d6e8e722763f87ceef9c0dbd1ec7f38088e7f0df`)
+
+   -  Allow opting out of ``efivarfs`` mount
+      (:oecore_rev:`9147744020f9b948f656a116ac03a9656e5a254b`)
 
 -  Miscellaneous changes:
 
-   -  ``pulseaudio``: split pactl into a dedicated client subpackage
+   -  ``pulseaudio``: Split pactl into a dedicated client subpackage
       (:oecore_rev:`31dd308b3fe68a6142738100e8ad18a09bccbce6`)
 
    -  ``u-boot-tools``: Add dependency on ``libyaml`` for ``dtschema`` validation
       (:oecore_rev:`02e09e036e5d037b29f2a53d63c2231535da1a5e`)
 
-   -  ``p11-kit``: rewrite packaging to provide additional ``p11-kit-modules``
+   -  ``p11-kit``: Rewrite packaging to provide additional ``p11-kit-modules``
       and ``p11-kit-remote`` packages
       (:oecore_rev:`7511a8624e79ab5c9fc242bcf3c6b74c828c8584`)
 
-   -  ``harfbuzz``: improve packaging
+   -  ``harfbuzz``: Improve packaging
       (:oecore_rev:`fb39870f27b19af790244a20ae9887923df8e464`)
 
    -  :ref:`ref-classes-sstate`: Detect broken shared state paths containing
       :term:`TMPDIR`
       (:oecore_rev:`907af8fb448e2f9ecf8e0439f2d8c7c397fb873f`)
 
-   -  ``gcr``: package the ssh-agent into a separate package
+   -  ``gcr``: Package the ssh-agent into a separate package
       (:oecore_rev:`c9579094da0a6a178cab9f370ab7cb0e414d6ca9`)
 
-   -  ``initramfs-framework``: ``overlayroot``: use ``switch_root`` instead of
-      ``chroot``
-      (:oecore_rev:`848c368291b59ce6e928cdc973f94b34a6cdaa12`)
-
-   -  ``glibc``: disable automatic ``libatomic`` linking
+   -  ``glibc``: Disable automatic ``libatomic`` linking
       (:oecore_rev:`677f0acc96072e65442158519589cea4294a88f9`)
 
-   -  :ref:`ref-classes-uboot-sign`: sign SPL FIT into a copy of the SPL DTB
+   -  :ref:`ref-classes-uboot-sign`: Sign SPL FIT into a copy of the SPL DTB
       (:oecore_rev:`79584fe7e7efec4fc9153217d74b1d48774df911`)
 
    -  :ref:`ref-classes-archiver`: Properly remove artifacts when configuration changes
       (:oecore_rev:`4b0ac92f28caa8b7ae7d645afbeff1ebc34b36dc`)
 
-   -  ``wget``: disable NTLM support
+   -  ``wget``: Disable NTLM support
       (:oecore_rev:`4eb7e98020eb5b87990f5fd5929adf7e333dc038`)
 
-   -  ``vex``: drop obsolete conflict check with ``cve-check`` class
+   -  ``vex``: Drop obsolete conflict check with ``cve-check`` class
       (:oecore_rev:`ddb00a3eaeb5fa7c84636aad9fb841f61cd99fa7`)
 
    -  :ref:`ref-classes-toaster`: Support layers that are not Git repositories
       (:oecore_rev:`3fb96cc91dc4e625502751b64ac982e5ba6f0cb8`)
 
-   -  :ref:`ref-classes-go-vendor`: Remove vendor symlink
-      (:oecore_rev:`d3cbc285a257f132a17ec042ddb11eef136c6d2b`)
+   -  ``classes/meson``: Use ninja explicitly when compiling
+      (:oecore_rev:`9e1513b29849c56fe372e0d73ce229cebed32d9e`)
+
+   -  ``webkitgtk``: Allow using `Clang` to compile for arm target
+      (:oecore_rev:`77023812cf13a96d67aef7ad9a743f66861bd759`)
+
+   -  :ref:`ref-classes-report-error`: Add ``site.conf``/``toolcfg.conf`` into error report
+      (:oecore_rev:`40ca5fc9098be25574130a3810560219b8ee9d07`)
+
+   -  :ref:`ref-classes-cml1`: Use :term:`KCONFIG_CONFIG_ROOTDIR` in savedefconfig
+      (:oecore_rev:`46964503b6340d4244d1c19e90808f399a3c862c`)
+
+   -  :ref:`ref-classes-uki`: Make `initramfs` optional
+      (:oecore_rev:`909d3ba1fa925c105681c091af00965fc4aac191`)
+
+   -  ``cpan_build``: Disable ``.packlist`` and HTML doc
+      (:oecore_rev:`3c2bb7bce1da68e31a60de044ee1dd9abb2eadc1`)
+
+   -  :ref:`ref-classes-useradd`: Drop ``groupmems`` from :term:`sysroot` setup,
+      as ``groupmems`` was `removed <https://github.com/shadow-maint/shadow/pull/1601>`__
+      from `shadow` version 4.20.0
+      (:oecore_rev:`de0bf5771644edbe317ee9ad89cca4bc8836cf12`)
+
+   -  :ref:`ref-classes-image_types`: Make ``oe_mkext234fs`` reproducible
+      (:oecore_rev:`8d1d548e36fa8426f20f43a514f0dd60b699f86b`)
+
+   -  :ref:`ref-classes-pypi`: Only set ``downloadprefix`` in :term:`SRC_URI` if needed
+      (:oecore_rev:`be391d8a8b7d4898063ceae1fbd707bfd2218be3`)
 
 Known Issues in |yocto-ver|
 ---------------------------
 
+N/A
+
 Recipe License changes in |yocto-ver|
 -------------------------------------
 

-- 
2.55.0


