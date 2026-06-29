Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD6EBC43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 14:46:29 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.93804.1782744385721329859
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 07:46:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=16KVXSB0;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0FE061A0D1D
	for <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 14:46:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D336D5FF96
	for <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 14:46:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 05F6A106F18B0;
	Mon, 29 Jun 2026 16:46:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782744383; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7YKq54goylUYWeKKHlPYXB2O4JFVtCppwkIjhi2PANw=;
	b=16KVXSB0hrwdAdDQUGFzJLqP9eud9BeEznVvxwZW6OMww3xklwNGCEDA171Kl2Dv2gGNJY
	NvBj5XoFeKIFTA6mDstlbBAjeTfHom+eOf1R3NzI7ymkQVSU+bBbwIB3RyX6F2itw3N5Uc
	dIP3Ny2jj+Rmg9Q3mvXyCcAQbSsTR8r4sF2gsC6EawY4OlZCSf1VggmAMCdMkZARVd6QLj
	ZfTMMRmW6EUTIf59VNvLpPYG7HtEt3K7/PlEzKulLr9qNzu+gPq/9kN2hgWbmEcbkHwSv8
	yvK8btABF+gl3qzTawZzr/+RKby7wY8BGgOQu7aihkG35K7/PTpgAYlo7bEPZA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 29 Jun 2026 16:46:16 +0200
Subject: [PATCH 7/7] migration-guides/migration/release-notes-6.1.rst:
 cover recent changes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-master-updates-1-v1-7-ad9b047f9ff0@bootlin.com>
References: <20260629-master-updates-1-v1-0-ad9b047f9ff0@bootlin.com>
In-Reply-To: <20260629-master-updates-1-v1-0-ad9b047f9ff0@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12147;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=0Cjh16vOZTY/HLBgSi8hk6NleJw4H0yF8fmvDV2yPwA=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqQoU4y+LWBwXOQ/A11c7VGRycfN5C4ClQ5a77m
 SqtMdqkOSaJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCakKFOAAKCRDRgEFAKaOo
 Nnr+D/9bcw8CsxUe6hSVZ81DSRU0DlQghEFuyfsFy0WRcYZNHTo3FupLJMTyXpQSmlfWEkCrf4t
 H+7eD/X9X1l9F77MRxmgINbAPk13ZO9Fwgv8u0WuPI8i6gBnjlihNiZXViXZwKqutAX1Za1rITV
 DBLKFG/9IwpUe0xmcuEK5OyOVqmujjo635TlSbGcnPJfMJ7ZG9fOK4IusqnYE7KyI6gvXdk8mLM
 9iB98Xwnd3E8KGc2+KC6J8886puB4+knf3DW8zZuZQFwUpoChVC5rZF0esZ3aoz1qzXQFFd5Sy8
 p0HRX/KhYDlTMTbDcQiw6CJpKFgHZdNnP1wrHlVvxJGlHKjUXhJ4dodJfVOw87shKnPgr1tYou3
 CDO9TnmaBNEkI/wjl+txYKSqrGJj5y2+meIJQw9ajE3FQ5EcaEoKQSF7zI1xfJdEWXIEYZUNNL2
 7whRdv8THYGiInRAhqSQyWd+xRgfAgdD4oZURjAuyqkfRJUJeht2ymrRogCDCmiH7XnlyYpNjcw
 yVC8wr28x4K7LIjNnDEcivBs14PG4OjSk93f0z/O4iuGBNiQTsagD3oWUtnYK1SEiceeCFVpDNr
 EkvIpyeS0DspsiOBpUK2RdukoDjg/yntGc+9/cMHRD0/a/5Ym2H+CfpUHYVJbzEpMsfResIF/05
 9yb0xGp4TaHV+ig==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 14:46:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9980

Cover upstream changes:

- openembedded-core: 2946e238d2 to 4a72f62d32
- bitbake: 941cfe74c19 to 7e3489ab3ec
- meta-yocto: a67ae0e83d to 366fa2f21b

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/migration-6.1.rst   |   7 +
 .../migration-guides/release-notes-6.1.rst         | 221 ++++++++++++++++++++-
 2 files changed, 227 insertions(+), 1 deletion(-)

diff --git a/documentation/migration-guides/migration-6.1.rst b/documentation/migration-guides/migration-6.1.rst
index d39c9072a..8786cd699 100644
--- a/documentation/migration-guides/migration-6.1.rst
+++ b/documentation/migration-guides/migration-6.1.rst
@@ -78,6 +78,13 @@ And::
 Removed recipes
 ---------------
 
+-  ``libdazzle``, ``libhandy``: no longer a dependency of the ``epiphany`` recipe, moved to
+   `meta-gnome` (in `meta-openembedded`)
+   (:oecore_rev:`32d91b67b71de89e0e7cc7525371aec123655908`)
+
+-  ``libpcre``: obsolete project now replaced by ``libpcre2``
+   (:oecore_rev:`057cccd9576e1dd0f947fbfc390bc06b210f71cb`)
+
 Removed :term:`PACKAGECONFIG` options
 -------------------------------------
 
diff --git a/documentation/migration-guides/release-notes-6.1.rst b/documentation/migration-guides/release-notes-6.1.rst
index c101ddcfa..a0b99c676 100644
--- a/documentation/migration-guides/release-notes-6.1.rst
+++ b/documentation/migration-guides/release-notes-6.1.rst
@@ -26,16 +26,137 @@ New Features / Enhancements in |yocto-ver|
 
 -  Kernel-related changes:
 
+   -  :ref:`ref-classes-kernel-module-split`: return list of values in
+      ``extract_modinfo``
+      (:oecore_rev:`43da9b93bdf40bc4f2fb81687e80b94571232d5b`)
+
+   -  :ref:`ref-classes-kernel`: Disable module tarball deployment
+      (:term:`MODULE_TARBALL_DEPLOY`) by default
+      (:oecore_rev:`f51d48c9eb0bcb630525566091c66ec1af4d770e`)
+
+   -  :ref:`ref-classes-kernel-fit-image`: Validate key files expected by
+      ``mkimage`` for the selected algorithm
+      (:oecore_rev:`7570ab598d10a08fa046d3e8f5897424193240e1`)
+
+   -  ``linux-yocto``: remove CVE exclusion list as
+      :ref:`ref-classes-sbom-cve-check` does this itself
+      (:oecore_rev:`596ad6c397c5ca264c6c257283ea78095562e67c`)
+
+   -  :ref:`ref-classes-kernel-fit-image`: Do not include ``kernel`` property in
+      DTBO configuration sub-nodes
+      (:oecore_rev:`06ed34005957a6afb88270603df5e545941546b0`)
+
+   -  :ref:`ref-classes-kernel-fit-image`: Fix operation with
+      :term:`KERNEL_DTBVENDORED` set to "1"
+      (:oecore_rev:`4297b94c3728cd2e320d75b68c508e12ab127719`)
+
 -  New core recipes:
 
+   -  ``python3-vcs-versioning``: added as a new dependency of the
+      ``python3-setuptools-scm`` recipe
+      (:oecore_rev:`507bb5234cc13377ba27b8708f798a0815c3485f`)
+
+   -  ``cgo-helloworld``: a Go example recipe with `cgo
+      <https://go.dev/wiki/cgo>`__ enabled
+      (:oecore_rev:`204e4f7398ca0e8847a026c5b4f46685760af90a`)
+
+   -  ``python3-qemu-qmp``: added as a new dependency of QEMU
+      (:oecore_rev:`5babf4e57c20eb54674c323b3527f9b922f17e1e`)
+
+   -  ``jansson``: add a recipe from ``meta-oe``, as it is a new hard dependency
+      of the ``igt-gpu-tools`` recipe
+      (:oecore_rev:`2b6e7d092b4a21930186682ebf085848b2e49de5`)
+
 -  New core classes:
 
+   -  :ref:`ref-classes-python_uv_build`: used to build Python recipe with
+      ``uv_build``, a slimmed down version of ``uv``
+      (:oecore_rev:`c535a9f5dbdc5d8ddb4a2438604456b8084a73aa`)
+
+   -  :ref:`ref-classes-upstream-stable-release-point`: helper class for setting
+      the :term:`UPSTREAM_STABLE_RELEASE_REGEX` variable with
+      :term:`STABLE_VERSION_PARTS`
+      (:oecore_rev:`a1e069d04cb13e990b362804bd56a4935338ef96`)
+
 -  New variables:
 
+   -  :term:`UBOOT_FIT_CONF_DESC` allows configuring the description property
+      of the configuration node of a U-Boot FIT image
+      (:oecore_rev:`df16e4a3900f53245cc8d9a92e277aead56a7369`)
+
+-  :term:`OpenEmbedded-Core (OE-Core)` library changes:
+
+   -  ``oe/lsb``: Only read ``/etc/os-release``
+      (:oecore_rev:`1331c5f2c49e448bc32ec364b13fecfdcf5e05f4`)
+
+   -  ``oe/utils``: Drop ``all_distro_features()``
+      (:oecore_rev:`28d32a940ff46ca80db75e8ed24a3e26eec95599`)
+
 -  Global configuration changes:
 
+   -  ``bitbake.conf``: define a new ``firmwaredir`` variable (which by default
+      points to ``/lib/firmware``). This variable was adopted in
+      several recipes to replace ``${nonarch_base_libdir}/firmware``
+      (:oecore_rev:`2b75c7ba5e3aa6fc57d7b4afe59e2277b4d87de1`)
+
+   -  :ref:`ref-classes-useradd`: Add support for the :term:`USERMOD_PARAM`
+      variable, acting as a replacement of the :term:`GROUPMEMS_PARAM` variable
+      (:oecore_rev:`b8da733ab12c64503a353d5ceb2eb63fed95d851`,
+      :oecore_rev:`cec67e24ac94554e092f8ab18b42e09b4feba77e`)
+
+      Show a deprecation warning if :term:`GROUPMEMS_PARAM` is used
+      (:oecore_rev:`06f48de92f4b8d7116cd1ce8ba5bc0bd7f8eda9e`)
+
+   -  :ref:`ref-classes-useradd`: Switch from ``--root`` to ``--prefix`` option
+      (:oecore_rev:`a7b846ba7d6d63a5e59939d75d9c5fe3e4cbb0e9`)
+
+   -  :ref:`ref-classes-extrauser`: Switch from using --root to --prefix
+      (:oecore_rev:`8f20f792482bcecc58a0c51ec7947339eb6e2a61`)
+
 -  BitBake changes:
 
+   -  The ``git-make-shallow`` utility script was dropped along with its test
+      cases. It was replaced by Git native shallow fetches
+      :bitbake_rev:`0223ec6f6319b58b740dbbb463dcd190bc85339a`
+
+   -  Replace ``codegen`` with ``ast.unparse()``
+      (:bitbake_rev:`76dd6d69c59c1686be2dfb3fc5b72c2a9df34871`)
+
+   -  ``fetch/git``:
+
+      -  Fix leaking of temporary directory
+         (:bitbake_rev:`c7ebe03c7ebe266795d20c5b722129a0fad86668`)
+
+      -  Fix trailing slash in clone command causing double slash in alternates
+         (:bitbake_rev:`797b0a348d7426d03459e577feacd3488fdeee47`)
+
+      -  Accept SHA256 revisions
+         (:bitbake_rev:`707ba7e3f218e9d9fff2649ca4be11e2cf3b45ac`)
+
+   -  Unpack RPMs with ``--no-absolute-filenames``
+      (:bitbake_rev:`1b1a71586aa93678c1d9ca40ef2c6fa518f89356`)
+
+   -  ``tinfoil``: Only allow one process progress bar at once
+      (:bitbake_rev:`d6bc0e5ec549a4f984cb3d470dd3c04d0ea46fde`)
+
+   -  ``bitbake-setup``: add a "notes" item to ``bitbake-setup`` configuration
+      files which create a "conf-notes.txt" file in the :term:`Build Directory`
+      (:bitbake_rev:`020a5ba24c7df53eacf834deb87216053ccd38db`)
+
+   -  ``lib``: Drop ``pyinotify``, as it wasn't used by :term:`BitBake` anymore
+      (:bitbake_rev:`d20e7dcbd8b6b47273222b5281b956aab58b3351`)
+
+   -  ``fetch2/crate``: support user-defined protocols
+      (:bitbake_rev:`22a993aed05baecb06bcf9b6875eb43bf543a1a0`)
+
+-  SPDX-related changes:
+
+   -  Add SHA 512 support
+      (:oecore_rev:`383a5a63963a063b3cec0f38dcba1c394911c3a5`)
+
+   -  Add custom annotations to recipe packages
+      (:oecore_rev:`e5a4a7d7c1916d88456838fbb31ee87d6a1e48ab`)
+
 -  QEMU / ``runqemu`` changes:
 
 -  Documentation changes:
@@ -48,7 +169,47 @@ New Features / Enhancements in |yocto-ver|
 
 -  Testing-related changes:
 
--  Utility script changes:classes
+   - :ref:`ref-classes-ptest` support was added for the following recipes:
+
+      -  ``go``
+      -  ``libatomic-ops``
+      -  ``libxslt``
+      -  ``python3-vcs-versioning``
+
+   -  ``meta-selftest``: add a ``usegroup-deponly`` recipe to test
+      :term:`USERADD_DEPENDS` only
+      (:oecore_rev:`36eac58184a22ba972f8613bd9f564e0f6bd1680`)
+
+   -  ``python3``: use a ``SKIPPED_TESTS`` variable instead of test skip patches
+      (:oecore_rev:`a8b2baa6020f96468a98200619ec37c460694c4c`)
+
+-  Utility script changes:
+
+   -  ``scripts/cve-json-to-text.py``: simplify ``getopt`` argument parsing
+      (:oecore_rev:`a92dfe569844189344fbb5ea0521b2bf7dbf0623`)
+
+   -  ``devtool``:
+
+      -  Disable GPG signing when setting up source tree repos
+         (:oecore_rev:`b5c84b07b87eafb4f68f7662b6cf26d8b73e3247`)
+
+      -  ``upgrade`` command: extract changelog between versions
+         (:oecore_rev:`ddd54d6d9760e6c049ef82f250c81a10592d409d`)
+
+   -  ``upgrade`` command: add a ``--stable`` option
+      (:oecore_rev:`1e86aa039108621b2af734ef358a1e9d3c4d88d8`)
+
+   -  ``oe-pkgdata-util``: fix empty ``runtime-rprovides`` directory handling
+      (:oecore_rev:`678c1c2077316b6b81ba9be000528b50dca19ca6`,
+      :oecore_rev:`dbca656205a7d9a9a9b0aa25b4ad6562af9c5180`)
+
+   -  ``recipeutils``: add optional ``stable_upgrade`` parameter to
+      ``get_recipe_upgrade_status``, to add the possibility of doing stable
+      version upgrades of recipes
+      (:oecore_rev:`1ed8fdda035dcc21f3df71c0c996973224f4f683`)
+
+   -  ``install-buildtools``: auto-discover environment setup script via glob
+      (:oecore_rev:`1105378e967a812f3bdc3fcc25bb7fd5350cca6c`)
 
 -  Clang/LLVM related changes:
 
@@ -58,18 +219,76 @@ New Features / Enhancements in |yocto-ver|
 
 -  :ref:`ref-classes-insane` / :ref:`ref-classes-sanity` classes related changes:
 
+   -  Add a check that :term:`SOURCE_MIRROR_URL` is defined when
+      :ref:`ref-classes-own-mirrors` is used
+      (:oecore_rev:`6d989b9d15266ca0b3650c93ac961cffc3e82c14`)
+
+   -  Add a check for build host ``HOME`` directory in packaged files
+      (:oecore_rev:`81bbe42edbed590389a1b0ed4b1a58a6738dc760`)
+
 -  Security changes:
 
 -  :ref:`ref-classes-sbom-cve-check`-related changes:
 
 -  New :term:`PACKAGECONFIG` options for individual recipes:
 
+   -  ``libportal``: ``gtk4``
+   -  ``librsvg``: ``avif``, ``gdkpixbuf``
+   -  ``perf``: ``bpf-skel``, ``llvm``
+   -  ``p11-kit``: ``systemd``, ``trust``
+   -  ``wpa-supplicant``: ``suiteb``, ``mbo``, ``wnm``
+
 -  systemd related changes:
 
 -  U-Boot related changes:
 
 -  Miscellaneous changes:
 
+   -  ``pulseaudio``: split pactl into a dedicated client subpackage
+      (:oecore_rev:`31dd308b3fe68a6142738100e8ad18a09bccbce6`)
+
+   -  ``u-boot-tools``: Add dependency on ``libyaml`` for ``dtschema`` validation
+      (:oecore_rev:`02e09e036e5d037b29f2a53d63c2231535da1a5e`)
+
+   -  ``p11-kit``: rewrite packaging to provide additional ``p11-kit-modules``
+      and ``p11-kit-remote`` packages
+      (:oecore_rev:`7511a8624e79ab5c9fc242bcf3c6b74c828c8584`)
+
+   -  ``harfbuzz``: improve packaging
+      (:oecore_rev:`fb39870f27b19af790244a20ae9887923df8e464`)
+
+   -  :ref:`ref-classes-sstate`: Detect broken shared state paths containing
+      :term:`TMPDIR`
+      (:oecore_rev:`907af8fb448e2f9ecf8e0439f2d8c7c397fb873f`)
+
+   -  ``gcr``: package the ssh-agent into a separate package
+      (:oecore_rev:`c9579094da0a6a178cab9f370ab7cb0e414d6ca9`)
+
+   -  ``initramfs-framework``: ``overlayroot``: use ``switch_root`` instead of
+      ``chroot``
+      (:oecore_rev:`848c368291b59ce6e928cdc973f94b34a6cdaa12`)
+
+   -  ``glibc``: disable automatic ``libatomic`` linking
+      (:oecore_rev:`677f0acc96072e65442158519589cea4294a88f9`)
+
+   -  :ref:`ref-classes-uboot-sign`: sign SPL FIT into a copy of the SPL DTB
+      (:oecore_rev:`79584fe7e7efec4fc9153217d74b1d48774df911`)
+
+   -  :ref:`ref-classes-archiver`: Properly remove artifacts when configuration changes
+      (:oecore_rev:`4b0ac92f28caa8b7ae7d645afbeff1ebc34b36dc`)
+
+   -  ``wget``: disable NTLM support
+      (:oecore_rev:`4eb7e98020eb5b87990f5fd5929adf7e333dc038`)
+
+   -  ``vex``: drop obsolete conflict check with ``cve-check`` class
+      (:oecore_rev:`ddb00a3eaeb5fa7c84636aad9fb841f61cd99fa7`)
+
+   -  :ref:`ref-classes-toaster`: Support layers that are not Git repositories
+      (:oecore_rev:`3fb96cc91dc4e625502751b64ac982e5ba6f0cb8`)
+
+   -  :ref:`ref-classes-go-vendor`: Remove vendor symlink
+      (:oecore_rev:`d3cbc285a257f132a17ec042ddb11eef136c6d2b`)
+
 Known Issues in |yocto-ver|
 ---------------------------
 

-- 
2.54.0


