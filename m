Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37908.1793174721891402408
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Oct 2026 01:05:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ksTvQ33I;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 34C121A1374
	for <docs@lists.yoctoproject.org>; Wed, 28 Oct 2026 08:05:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0237660769
	for <docs@lists.yoctoproject.org>; Wed, 28 Oct 2026 08:05:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 10A551032906B;
	Wed, 28 Oct 2026 09:05:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793174719; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=M6k/2f+9tZYUhghujiiDUbenubNwQKccn/KifXJPBEo=;
	b=ksTvQ33INjazimnexGyMuzbkgPCHskUGX0iyWWmUp1LjLwmU/F42eTUUt9XoZaKP648WaE
	/U09GK92BoHAIj1I8+nsdGZhszIIVT+UZs6WHOsP2UmpUJS/lEPMR1APX+TJwmJOp6WF0f
	Svlh6XKPOaIGUNl9fXsH7PH4dYVwB9lwgx01AoZ/tHR+4huLVFjePCIIgVFVE1drLkQMjL
	PzeqHMmb+Ho36Zm4t23HqNvKy/FxMeYWvPTA6TGimtwp5h00SzvBncc7blnzuDbFbuF6XJ
	YQHegiNIN/vVBzL6ejVOiG6xu825T/3bSeORs8PkXJeIdJzaEV6GJg9OerYwYw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 28 Oct 2026 09:04:58 +0100
Subject: [PATCH 6/8] docs-wide: tag sections
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-tags-v1-6-d5ad01019eae@bootlin.com>
References: <20261028-tags-v1-0-d5ad01019eae@bootlin.com>
In-Reply-To: <20261028-tags-v1-0-d5ad01019eae@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Antonin Godard <antonin.godard@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=40918;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=1Q5iiEW6iKOiC4pwRew7WCk1ekFvx/VHB5CRh4o8a2U=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBq4ay4uNUjnFKY8rok3v2CmotDVuY1+TskN6AUV
 bfKawDp8gWJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCauGsuAAKCRDRgEFAKaOo
 NjaBEACODh/U+Bja1nj0D3jPCfRt0CspB8O9VzWTXShlFftCb4jp98ZAgoC9OA0CwXqgyAvBRE0
 4wBE+NDKp3/VRQ15yAiaVidsN3Kuwoo554SS2MxCsBj5MVJFzVednD7wT1iPcUtNHfGLv8aack8
 n7HcDI2Ru8FlHBlEImi0P5PfJmcKzXVAobiObvH/tuS7Tpt75po7XKNMCTF9OXcNyshDrSGsg4Z
 rLAQiVqyl5+arKSr1U/0RI3GznnvwIZhYRANxrorM4q8EB5jfWukurlmsM5ni0MwSDlpRj8PQw0
 Doq3inkGaBC1v/8EmXbNDGrCWXg8Hd2IJuo1gd2DzTeEKer80VCjEjeotCc121AY4Vt4qiFDgzk
 PYnjWze4Fsre6Rz8Lf+6FO4q/jWOqzFESzukkXqE1gy/mcbE9TtiZy8+fopzTXDnkOH1Q0SEf7I
 KsZ+g8kFADE3E+lP75LDI6UJzaVxQ96SLhzdVuM8XxkXRNrGsEIduirTOkFWM94XaMi91HhHur3
 Z73872ODJqWtFWOmaIiKv1aIrNRXA4tRe+60PLotx6mM2EzU8CwBDsLl6o6rOHmfndAVWmgSimQ
 7MCTyTLpvDIjTivvafQ8gBFHYgB1wt46MSdIQ2LyfXm8+3AAolR5lx0jHSfl0TJNxQtly3C86oG
 qGLoJ4BFSSXzsNw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Wed, 28 Oct 2026 08:05:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10734

Make use of the sphinx-tags extension to tag section with category.

After this commit, the following tags (with appearance count) are created:

- app-dev (2)
- build-configuration (7)
- cli-tool (8)
- config-fragments (2)
- contributing (5)
- conventions (2)
- debugging (7)
- devtool (3)
- distro (1)
- fakeroot (1)
- flashing (2)
- hash-equivalence (2)
- host-configuration (12)
- image-customization (2)
- libraries (2)
- license-compliance (2)
- linux-kernel (1)
- multiconfig (1)
- oe-concepts (5)
- packaging (1)
- profiling (1)
- pseudo (1)
- qemu (1)
- release-process (2)
- reproducibility (1)
- runtime-testing (2)
- sdk (1)
- security (7)
- sstate (3)
- target-configuration (5)
- toolchains (4)
- wic (2)

The rationale was to create distinctive tags that could allow sections
from different parts of the documentation to be linked together.

Some tags only have one count: those still improve discoverability when
looking at the tags overview page.

Tags are only compatible with the regular HTML build (not
singlehtml or epub). For that reason use the .. only directive to show
them only for splithtml.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/contributor-guide/identify-component.rst               | 4 ++++
 documentation/contributor-guide/recipe-style-guide.rst               | 4 ++++
 documentation/contributor-guide/report-defect.rst                    | 4 ++++
 documentation/contributor-guide/submit-changes.rst                   | 4 ++++
 documentation/conventions.rst                                        | 4 ++++
 documentation/dev-manual/bblock.rst                                  | 3 +++
 documentation/dev-manual/bmaptool.rst                                | 4 ++++
 documentation/dev-manual/build-quality.rst                           | 3 +++
 documentation/dev-manual/building.rst                                | 3 +++
 documentation/dev-manual/creating-fragments.rst                      | 4 ++++
 documentation/dev-manual/custom-distribution.rst                     | 4 ++++
 documentation/dev-manual/custom-template-configuration-directory.rst | 3 +++
 documentation/dev-manual/customizing-images.rst                      | 3 +++
 documentation/dev-manual/debugging.rst                               | 3 +++
 documentation/dev-manual/development-shell.rst                       | 3 +++
 documentation/dev-manual/device-manager.rst                          | 3 +++
 documentation/dev-manual/devtool.rst                                 | 4 ++++
 documentation/dev-manual/disk-space.rst                              | 4 ++++
 documentation/dev-manual/efficiently-fetching-sources.rst            | 3 +++
 documentation/dev-manual/error-reporting-tool.rst                    | 3 +++
 documentation/dev-manual/external-scm.rst                            | 3 +++
 documentation/dev-manual/external-toolchain.rst                      | 4 ++++
 documentation/dev-manual/gobject-introspection.rst                   | 3 +++
 documentation/dev-manual/hashequivserver.rst                         | 4 ++++
 documentation/dev-manual/init-manager.rst                            | 4 ++++
 documentation/dev-manual/layers.rst                                  | 3 +++
 documentation/dev-manual/libraries.rst                               | 3 +++
 documentation/dev-manual/licenses.rst                                | 3 +++
 documentation/dev-manual/limiting-resources.rst                      | 4 ++++
 documentation/dev-manual/multiconfig.rst                             | 4 ++++
 documentation/dev-manual/new-machine.rst                             | 3 +++
 documentation/dev-manual/new-recipe.rst                              | 3 +++
 documentation/dev-manual/packages.rst                                | 3 +++
 documentation/dev-manual/poky-manual-setup.rst                       | 4 ++++
 documentation/dev-manual/prebuilt-libraries.rst                      | 3 +++
 documentation/dev-manual/python-development-shell.rst                | 3 +++
 documentation/dev-manual/qemu.rst                                    | 4 ++++
 documentation/dev-manual/quilt.rst                                   | 3 +++
 documentation/dev-manual/sbom.rst                                    | 4 ++++
 documentation/dev-manual/speeding-up-build.rst                       | 3 +++
 documentation/dev-manual/sstate-mirrors-setup.rst                    | 4 ++++
 documentation/dev-manual/start.rst                                   | 4 ++++
 documentation/dev-manual/temporary-source-code.rst                   | 4 ++++
 documentation/dev-manual/upgrading-recipes.rst                       | 3 +++
 documentation/dev-manual/wayland.rst                                 | 3 +++
 documentation/dev-manual/wic.rst                                     | 3 +++
 documentation/dev-manual/x32-psabi.rst                               | 3 +++
 documentation/kernel-dev/index.rst                                   | 4 ++++
 documentation/overview-manual/concepts.rst                           | 4 ++++
 documentation/overview-manual/development-environment.rst            | 4 ++++
 documentation/overview-manual/yp-intro.rst                           | 4 ++++
 documentation/profile-manual/index.rst                               | 4 ++++
 documentation/ref-manual/devtool-reference.rst                       | 4 ++++
 documentation/ref-manual/fragments.rst                               | 4 ++++
 documentation/ref-manual/kickstart.rst                               | 4 ++++
 documentation/ref-manual/release-process.rst                         | 4 ++++
 documentation/sdk-manual/index.rst                                   | 4 ++++
 documentation/security-manual/build-process-security.rst             | 4 ++++
 documentation/security-manual/read-only-rootfs.rst                   | 3 +++
 documentation/security-manual/securing-images.rst                    | 3 +++
 documentation/security-manual/sstate-signing.rst                     | 4 ++++
 documentation/security-manual/vulnerabilities.rst                    | 3 +++
 documentation/security-reference/index.rst                           | 4 ++++
 documentation/test-manual/ptest.rst                                  | 4 ++++
 documentation/test-manual/reproducible-builds.rst                    | 4 ++++
 documentation/test-manual/runtime-testing.rst                        | 3 +++
 documentation/test-manual/test-process.rst                           | 4 ++++
 documentation/toaster-manual/index.rst                               | 4 ++++
 68 files changed, 242 insertions(+)

diff --git a/documentation/contributor-guide/identify-component.rst b/documentation/contributor-guide/identify-component.rst
index 3fbd9553e..760801a67 100644
--- a/documentation/contributor-guide/identify-component.rst
+++ b/documentation/contributor-guide/identify-component.rst
@@ -20,3 +20,7 @@ If the issue is in the core metadata layer (OpenEmbedded-Core) or in BitBake,
 issues can be reported in the :yocto_bugs:`Yocto Project Bugzilla <>`. The
 :yocto_lists:`yocto </g/yocto>` mailing list is a general "catch-all" location
 where questions can be sent if you can't work out where something should go.
+
+.. only:: splithtml
+
+   .. tags:: contributing
diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/documentation/contributor-guide/recipe-style-guide.rst
index fe12a8e6d..38c15813f 100644
--- a/documentation/contributor-guide/recipe-style-guide.rst
+++ b/documentation/contributor-guide/recipe-style-guide.rst
@@ -440,3 +440,7 @@ you can use `Git` configuration settings::
 
 .. note::
    Patches generated or updated by ``devtool`` are created with no signature.
+
+.. only:: splithtml
+
+   .. tags:: contributing, conventions
diff --git a/documentation/contributor-guide/report-defect.rst b/documentation/contributor-guide/report-defect.rst
index 8ef133b84..23b8a5e93 100644
--- a/documentation/contributor-guide/report-defect.rst
+++ b/documentation/contributor-guide/report-defect.rst
@@ -65,3 +65,7 @@ medium and long term. We do encourage people to file bugs so issues are
 at least known about. It helps other users when they find somebody having
 the same issue as they do, and an issue that is unknown is much less likely
 to ever be fixed!
+
+.. only:: splithtml
+
+   .. tags:: contributing
diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
index 589545074..9eafb239d 100644
--- a/documentation/contributor-guide/submit-changes.rst
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -898,3 +898,7 @@ Foundation policy, specifically:
    Additionally, the contributor should provide notice and attribution of such
    third party rights, along with information about the applicable license
    terms, with their contribution.
+
+.. only:: splithtml
+
+   .. tags:: contributing
diff --git a/documentation/conventions.rst b/documentation/conventions.rst
index 3bba4223a..aeb360cf4 100644
--- a/documentation/conventions.rst
+++ b/documentation/conventions.rst
@@ -54,3 +54,7 @@ command:
 
    # This is a comment, not a command to run as root.
    $ bitbake core-image-minimal
+
+.. only:: splithtml
+
+   .. tags:: conventions
diff --git a/documentation/dev-manual/bblock.rst b/documentation/dev-manual/bblock.rst
index b9d6606a9..bd4afd0bd 100644
--- a/documentation/dev-manual/bblock.rst
+++ b/documentation/dev-manual/bblock.rst
@@ -127,3 +127,6 @@ the following::
   SIGGEN_LOCKEDSIGS_x86_64 += "python3-native:do_create_manifest:24f0abbec221d27bbb2909b6e846288b12cab419f1faf9f5006ed80423d37e28"
   SIGGEN_LOCKEDSIGS_x86_64 += "python3-native:do_addto_recipe_sysroot:bcb6a1905f113128de3f88d702b706befd6a786267c045ee82532759a7c214d7"
 
+.. only:: splithtml
+
+   .. tags:: host-configuration, cli-tool
diff --git a/documentation/dev-manual/bmaptool.rst b/documentation/dev-manual/bmaptool.rst
index b145974c6..c60904603 100644
--- a/documentation/dev-manual/bmaptool.rst
+++ b/documentation/dev-manual/bmaptool.rst
@@ -64,3 +64,7 @@ For help on the ``bmaptool`` command, use the following command::
    is simply a transitional package which exists solely to
    ensure backward compatibility and smooth upgrades from
    older installations.
+
+.. only:: splithtml
+
+   .. tags:: cli-tool, flashing
diff --git a/documentation/dev-manual/build-quality.rst b/documentation/dev-manual/build-quality.rst
index dc10d1f05..8be07cdbb 100644
--- a/documentation/dev-manual/build-quality.rst
+++ b/documentation/dev-manual/build-quality.rst
@@ -406,3 +406,6 @@ Here is a sample screenshot of the interface:
 .. image:: figures/buildhistory-web.png
    :width: 100%
 
+.. only:: splithtml
+
+   .. tags:: cli-tool, build-configuration
diff --git a/documentation/dev-manual/building.rst b/documentation/dev-manual/building.rst
index d36a523f5..69f212f34 100644
--- a/documentation/dev-manual/building.rst
+++ b/documentation/dev-manual/building.rst
@@ -852,3 +852,6 @@ directory:
          those recipes to set :term:`SRCREV` to specific versions of the
          software.
 
+.. only:: splithtml
+
+   .. tags:: build-configuration
diff --git a/documentation/dev-manual/creating-fragments.rst b/documentation/dev-manual/creating-fragments.rst
index cd87341e9..42efa785a 100644
--- a/documentation/dev-manual/creating-fragments.rst
+++ b/documentation/dev-manual/creating-fragments.rst
@@ -144,3 +144,7 @@ You can then use the :ref:`ref-bitbake-config-build-enable-fragment` command to
 set a value to the ``CUSTOM_VARIABLE`` variable::
 
    $ bitbake-config-build enable-fragment custom-builtin-fragment/somevalue
+
+.. only:: splithtml
+
+   .. tags:: build-configuration, config-fragments
diff --git a/documentation/dev-manual/custom-distribution.rst b/documentation/dev-manual/custom-distribution.rst
index 7129439dd..6d8968022 100644
--- a/documentation/dev-manual/custom-distribution.rst
+++ b/documentation/dev-manual/custom-distribution.rst
@@ -139,3 +139,7 @@ This is fine, however if you do this you should keep the following in mind:
 -  More generally, the Poky distribution configuration enables a lot more
    than you likely need for your production use case. You should evaluate *every*
    configuration choice made in your copy to determine if it is needed.
+
+.. only:: splithtml
+
+   .. tags:: build-configuration, distro
diff --git a/documentation/dev-manual/custom-template-configuration-directory.rst b/documentation/dev-manual/custom-template-configuration-directory.rst
index 7febc8c4a..2160d94e4 100644
--- a/documentation/dev-manual/custom-template-configuration-directory.rst
+++ b/documentation/dev-manual/custom-template-configuration-directory.rst
@@ -50,3 +50,6 @@ when running the ``oe-init-build-env`` setup script. These can be
 edited further if needed to improve or change the build configurations
 available to the users, and provide useful summaries and detailed usage notes.
 
+.. only:: splithtml
+
+   .. tags:: build-configuration
diff --git a/documentation/dev-manual/customizing-images.rst b/documentation/dev-manual/customizing-images.rst
index ab12e342b..15f2a8a6d 100644
--- a/documentation/dev-manual/customizing-images.rst
+++ b/documentation/dev-manual/customizing-images.rst
@@ -220,3 +220,6 @@ unsets the variable in a configuration file::
 Having no default hostname in the filesystem is suitable for
 environments that use dynamic hostnames such as virtual machines.
 
+.. only:: splithtml
+
+   .. tags:: image-customization
diff --git a/documentation/dev-manual/debugging.rst b/documentation/dev-manual/debugging.rst
index 62e19a6c8..a7370ce6e 100644
--- a/documentation/dev-manual/debugging.rst
+++ b/documentation/dev-manual/debugging.rst
@@ -1276,3 +1276,6 @@ Here are some other tips that you might find useful:
       that are purely internal and have a limited scope (e.g. internal
       variables used to implement a single ``.bbclass`` file).
 
+.. only:: splithtml
+
+   .. tags:: debugging
diff --git a/documentation/dev-manual/development-shell.rst b/documentation/dev-manual/development-shell.rst
index be26bcffc..c3bc6dd98 100644
--- a/documentation/dev-manual/development-shell.rst
+++ b/documentation/dev-manual/development-shell.rst
@@ -80,3 +80,6 @@ terminal window.
    -  It is also worth noting that ``devshell`` still works over X11
       forwarding and similar situations.
 
+.. only:: splithtml
+
+   .. tags:: debugging
diff --git a/documentation/dev-manual/device-manager.rst b/documentation/dev-manual/device-manager.rst
index cc27b667a..be7f9c53b 100644
--- a/documentation/dev-manual/device-manager.rst
+++ b/documentation/dev-manual/device-manager.rst
@@ -72,3 +72,6 @@ your :ref:`structure-build-conf-local.conf` configuration file::
    # VIRTUAL-RUNTIME_dev_manager = "busybox-mdev"
    # VIRTUAL-RUNTIME_dev_manager = "systemd"
 
+.. only:: splithtml
+
+   .. tags:: build-configuration
diff --git a/documentation/dev-manual/devtool.rst b/documentation/dev-manual/devtool.rst
index 3abec4a41..9de9e1352 100644
--- a/documentation/dev-manual/devtool.rst
+++ b/documentation/dev-manual/devtool.rst
@@ -1760,3 +1760,7 @@ target machine.
    device (e.g. RPM or OPKG). Consequently, you should not intermingle
    ``devtool deploy-target`` and package manager operations on the target
    device. Doing so could result in a conflicting set of files.
+
+.. only:: splithtml
+
+   .. tags:: app-dev, cli-tool, devtool
diff --git a/documentation/dev-manual/disk-space.rst b/documentation/dev-manual/disk-space.rst
index ee02b2670..4a013a80d 100644
--- a/documentation/dev-manual/disk-space.rst
+++ b/documentation/dev-manual/disk-space.rst
@@ -59,3 +59,7 @@ Run ``sstate-cache-management.py`` for more details about this script.
    As this command is much more cautious and selective, removing only cache files,
    it will execute much slower than the simple ``find`` command described above.
    Therefore, it may not be your best option to trim huge cache directories.
+
+.. only:: splithtml
+
+   .. tags:: host-configuration
diff --git a/documentation/dev-manual/efficiently-fetching-sources.rst b/documentation/dev-manual/efficiently-fetching-sources.rst
index ab72e8dd2..a4df5e524 100644
--- a/documentation/dev-manual/efficiently-fetching-sources.rst
+++ b/documentation/dev-manual/efficiently-fetching-sources.rst
@@ -66,3 +66,6 @@ variation of the BitBake command guarantees that you have all the
 sources for that BitBake target should you disconnect from the Internet
 and want to do the build later offline.
 
+.. only:: splithtml
+
+   .. tags:: host-configuration
diff --git a/documentation/dev-manual/error-reporting-tool.rst b/documentation/dev-manual/error-reporting-tool.rst
index dabade078..ee93877bb 100644
--- a/documentation/dev-manual/error-reporting-tool.rst
+++ b/documentation/dev-manual/error-reporting-tool.rst
@@ -81,3 +81,6 @@ If you want to set up your own error reporting server, you can obtain
 the code from the Git repository at :yocto_git:`/error-report-web/`.
 Instructions on how to set it up are in the README document.
 
+.. only:: splithtml
+
+   .. tags:: cli-tool, contributing, debugging
diff --git a/documentation/dev-manual/external-scm.rst b/documentation/dev-manual/external-scm.rst
index bab5055f7..da0f250ad 100644
--- a/documentation/dev-manual/external-scm.rst
+++ b/documentation/dev-manual/external-scm.rst
@@ -69,3 +69,6 @@ development source for numerous packages.
    The ``poky-bleeding`` distribution is not tested on a regular basis. Keep
    this in mind if you use it.
 
+.. only:: splithtml
+
+   .. tags:: host-configuration
diff --git a/documentation/dev-manual/external-toolchain.rst b/documentation/dev-manual/external-toolchain.rst
index 94b4e67a8..50a6cbb18 100644
--- a/documentation/dev-manual/external-toolchain.rst
+++ b/documentation/dev-manual/external-toolchain.rst
@@ -40,3 +40,7 @@ supporting GNU toolchains released by ARM.
 
 You can find further information by reading about the :term:`TCMODE` variable
 in the Yocto Project Reference Manual's variable glossary.
+
+.. only:: splithtml
+
+   .. tags:: toolchains
diff --git a/documentation/dev-manual/gobject-introspection.rst b/documentation/dev-manual/gobject-introspection.rst
index 8203f17f0..0f6834515 100644
--- a/documentation/dev-manual/gobject-introspection.rst
+++ b/documentation/dev-manual/gobject-introspection.rst
@@ -153,3 +153,6 @@ Here are know issues in GObject Introspection Support:
    under 32-bit host machines. In particular, "qemumips64" is known to
    not work under i686.
 
+.. only:: splithtml
+
+   .. tags:: target-configuration
diff --git a/documentation/dev-manual/hashequivserver.rst b/documentation/dev-manual/hashequivserver.rst
index 0a67e79b6..a17456daa 100644
--- a/documentation/dev-manual/hashequivserver.rst
+++ b/documentation/dev-manual/hashequivserver.rst
@@ -127,3 +127,7 @@ This will make Hash Equivalence related changes be printed on the console, such
 as::
 
    NOTE: Task <recipe.bb>:do_<task> unihash changed to dc0da29c62a2d78d8d853fbb9c173778fe7d6fa4a68c67494b17afffe8ca1894
+
+.. only:: splithtml
+
+   .. tags:: hash-equivalence, host-configuration
diff --git a/documentation/dev-manual/init-manager.rst b/documentation/dev-manual/init-manager.rst
index c9d344a88..d7e81d29a 100644
--- a/documentation/dev-manual/init-manager.rst
+++ b/documentation/dev-manual/init-manager.rst
@@ -160,3 +160,7 @@ increasing levels of complexity and functionality:
 
 .. [#footnote-systemd-size] Using systemd increases the ``core-image-minimal``
    image size by 160\% for ``qemux86-64`` on Mickledore (4.2), compared to SysVinit.
+
+.. only:: splithtml
+
+   .. tags:: target-configuration
diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
index 5c8bf32b4..0f0629e9f 100644
--- a/documentation/dev-manual/layers.rst
+++ b/documentation/dev-manual/layers.rst
@@ -986,3 +986,6 @@ above:
    Both the ``create-layers-setup`` and the ``setup-layers`` provided several additional options
    that customize their behavior - you are welcome to study them via ``--help`` command line parameter.
 
+.. only:: splithtml
+
+   .. tags:: oe-concepts
diff --git a/documentation/dev-manual/libraries.rst b/documentation/dev-manual/libraries.rst
index d7b9f0cfc..142d33e9e 100644
--- a/documentation/dev-manual/libraries.rst
+++ b/documentation/dev-manual/libraries.rst
@@ -236,3 +236,6 @@ the following in your recipe::
 
    DEPENDS = "clutter-1.8"
 
+.. only:: splithtml
+
+   .. tags:: libraries, target-configuration
diff --git a/documentation/dev-manual/licenses.rst b/documentation/dev-manual/licenses.rst
index 46a5a69dd..be6de5097 100644
--- a/documentation/dev-manual/licenses.rst
+++ b/documentation/dev-manual/licenses.rst
@@ -531,3 +531,6 @@ the license from the fetched source::
 
    NO_GENERIC_LICENSE[Firmware-Abilis] = "LICENSE.Abilis.txt"
 
+.. only:: splithtml
+
+   .. tags:: license-compliance, target-configuration
diff --git a/documentation/dev-manual/limiting-resources.rst b/documentation/dev-manual/limiting-resources.rst
index 93c20c44c..a34d33085 100644
--- a/documentation/dev-manual/limiting-resources.rst
+++ b/documentation/dev-manual/limiting-resources.rst
@@ -147,3 +147,7 @@ details.
    This variable has no effect when any of :term:`BB_PRESSURE_MAX_CPU`,
    :term:`BB_PRESSURE_MAX_IO` or :term:`BB_PRESSURE_MAX_MEMORY` is set, as it
    was designed for systems that do not have pressure information available.
+
+.. only:: splithtml
+
+   .. tags:: host-configuration
diff --git a/documentation/dev-manual/multiconfig.rst b/documentation/dev-manual/multiconfig.rst
index 58ff95c17..c8662ad3d 100644
--- a/documentation/dev-manual/multiconfig.rst
+++ b/documentation/dev-manual/multiconfig.rst
@@ -310,3 +310,7 @@ We can then add a :ref:`ref-tasks-install` task to ``my-parent-firmware``::
 
 Doing the above will allow the firmware binary to be transferred and packaged
 into the Linux context and rootfs.
+
+.. only:: splithtml
+
+   .. tags:: multiconfig, toolchains
diff --git a/documentation/dev-manual/new-machine.rst b/documentation/dev-manual/new-machine.rst
index b4d29027b..09cd0c4c3 100644
--- a/documentation/dev-manual/new-machine.rst
+++ b/documentation/dev-manual/new-machine.rst
@@ -116,3 +116,6 @@ Here is an example for "qemuarm" machine::
    DISPLAY_DPI=150
    DISPLAY_SUBPIXEL_ORDER=vrgb
 
+.. only:: splithtml
+
+   .. tags:: oe-concepts
diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-manual/new-recipe.rst
index a270d82b5..159b35330 100644
--- a/documentation/dev-manual/new-recipe.rst
+++ b/documentation/dev-manual/new-recipe.rst
@@ -1676,3 +1676,6 @@ in the BitBake User Manual.
    might wish to use. If in doubt, you should check with multiple
    implementations --- including those from BusyBox.
 
+.. only:: splithtml
+
+   .. tags:: oe-concepts
diff --git a/documentation/dev-manual/packages.rst b/documentation/dev-manual/packages.rst
index 380d806be..17b960b80 100644
--- a/documentation/dev-manual/packages.rst
+++ b/documentation/dev-manual/packages.rst
@@ -1171,3 +1171,6 @@ packages::
 
    PACKAGE_ADD_METADATA_IPK = "Vendor: CustomIpk\nGroup:Applications/Spreadsheets"
 
+.. only:: splithtml
+
+   .. tags:: packaging
diff --git a/documentation/dev-manual/poky-manual-setup.rst b/documentation/dev-manual/poky-manual-setup.rst
index ca8539b6b..76a889315 100644
--- a/documentation/dev-manual/poky-manual-setup.rst
+++ b/documentation/dev-manual/poky-manual-setup.rst
@@ -160,3 +160,7 @@ an entire Linux distribution, including the toolchain, from source.
 
 #.  **Exit QEMU:** Exit QEMU by either clicking on the shutdown icon or by typing
     ``Ctrl-C`` in the QEMU transcript window from which you evoked QEMU.
+
+.. only:: splithtml
+
+   .. tags:: build-configuration
diff --git a/documentation/dev-manual/prebuilt-libraries.rst b/documentation/dev-manual/prebuilt-libraries.rst
index 9cc8bd2d9..fa1091010 100644
--- a/documentation/dev-manual/prebuilt-libraries.rst
+++ b/documentation/dev-manual/prebuilt-libraries.rst
@@ -207,3 +207,6 @@ versioned library example. The "magic" is setting the :term:`SOLIBS` and
            install -m 0755 ${UNPACKDIR}/libfoo.so ${D}${libdir}
    }
 
+.. only:: splithtml
+
+   .. tags:: libraries
diff --git a/documentation/dev-manual/python-development-shell.rst b/documentation/dev-manual/python-development-shell.rst
index 034100ae8..7e1a5c9c1 100644
--- a/documentation/dev-manual/python-development-shell.rst
+++ b/documentation/dev-manual/python-development-shell.rst
@@ -47,3 +47,6 @@ controls what type of shell is opened.
 When you are finished using ``pydevshell``, you can exit the shell
 either by using Ctrl+d or closing the terminal window.
 
+.. only:: splithtml
+
+   .. tags:: debugging
diff --git a/documentation/dev-manual/qemu.rst b/documentation/dev-manual/qemu.rst
index d7e0b2f2f..856a372fb 100644
--- a/documentation/dev-manual/qemu.rst
+++ b/documentation/dev-manual/qemu.rst
@@ -477,3 +477,7 @@ command line:
       readable or writable and "slirp-enabled".
 
 -  ``publicvnc``: Enables a VNC server open to all hosts.
+
+.. only:: splithtml
+
+   .. tags:: debugging, qemu
diff --git a/documentation/dev-manual/quilt.rst b/documentation/dev-manual/quilt.rst
index 59240705a..5c589572d 100644
--- a/documentation/dev-manual/quilt.rst
+++ b/documentation/dev-manual/quilt.rst
@@ -87,3 +87,6 @@ Follow these general steps:
 
       SRC_URI += "file://my_changes.patch"
 
+.. only:: splithtml
+
+   .. tags:: app-dev, cli-tool
diff --git a/documentation/dev-manual/sbom.rst b/documentation/dev-manual/sbom.rst
index 45b63ed8e..0783c6a6d 100644
--- a/documentation/dev-manual/sbom.rst
+++ b/documentation/dev-manual/sbom.rst
@@ -96,3 +96,7 @@ See also Joshua Watt's presentations
 at FOSDEM 2023 and
 `SPDX in the Yocto Project <https://fosdem.org/2024/schedule/event/fosdem-2024-3318-spdx-in-the-yocto-project/>`__
 at FOSDEM 2024.
+
+.. only:: splithtml
+
+   .. tags:: license-compliance, security
diff --git a/documentation/dev-manual/speeding-up-build.rst b/documentation/dev-manual/speeding-up-build.rst
index 262935313..10e73a597 100644
--- a/documentation/dev-manual/speeding-up-build.rst
+++ b/documentation/dev-manual/speeding-up-build.rst
@@ -107,3 +107,6 @@ that can help you speed up the build:
          the static libraries. If so, you might need to exclude them as
          well.
 
+.. only:: splithtml
+
+   .. tags:: host-configuration
diff --git a/documentation/dev-manual/sstate-mirrors-setup.rst b/documentation/dev-manual/sstate-mirrors-setup.rst
index e69aa00d1..92abd4387 100644
--- a/documentation/dev-manual/sstate-mirrors-setup.rst
+++ b/documentation/dev-manual/sstate-mirrors-setup.rst
@@ -192,3 +192,7 @@ module, the following logs are shown:
 Some artifacts may be found (returning 200 above). Some others will not be found
 because the expected artifacts on the client is not present on the server, in
 which case the client will rebuild the task (and its dependencies).
+
+.. only:: splithtml
+
+   .. tags:: host-configuration, sstate
diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index 81466ca40..7d3ba99fc 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -537,3 +537,7 @@ Where To Go From Here
 -  Configure your build: follow :ref:`overview-manual/concepts:User Configuration`.
 
 -  Learn how and what to build with :term:`BitBake`: follow :doc:`/dev-manual/building`.
+
+.. only:: splithtml
+
+   .. tags:: host-configuration
diff --git a/documentation/dev-manual/temporary-source-code.rst b/documentation/dev-manual/temporary-source-code.rst
index cb27d2207..b8bdf80e0 100644
--- a/documentation/dev-manual/temporary-source-code.rst
+++ b/documentation/dev-manual/temporary-source-code.rst
@@ -73,3 +73,7 @@ build system uses to build the package would be as follows::
    To learn how to use ``devtool`` to add, modify, upgrade recipes and more,
    see the :ref:`dev-manual/devtool:Using the \`\`devtool\`\` command-line tool`
    section of this Development Tasks Manual.
+
+.. only:: splithtml
+
+   .. tags:: debugging
diff --git a/documentation/dev-manual/upgrading-recipes.rst b/documentation/dev-manual/upgrading-recipes.rst
index f4b9df241..41cb39f96 100644
--- a/documentation/dev-manual/upgrading-recipes.rst
+++ b/documentation/dev-manual/upgrading-recipes.rst
@@ -397,3 +397,6 @@ To manually upgrade recipe versions, follow these general steps:
    builds work and any testing is successful, you can create commits for
    any changes in the layer holding your upgraded recipe.
 
+.. only:: splithtml
+
+   .. tags:: devtool
diff --git a/documentation/dev-manual/wayland.rst b/documentation/dev-manual/wayland.rst
index ec8ed86c1..5f814f9d3 100644
--- a/documentation/dev-manual/wayland.rst
+++ b/documentation/dev-manual/wayland.rst
@@ -88,3 +88,6 @@ the CLI, you need to do the following after your image is built:
 
       user@machine:~$ weston
 
+.. only:: splithtml
+
+   .. tags:: image-customization
diff --git a/documentation/dev-manual/wic.rst b/documentation/dev-manual/wic.rst
index 85160bbdf..2f8351cd4 100644
--- a/documentation/dev-manual/wic.rst
+++ b/documentation/dev-manual/wic.rst
@@ -795,3 +795,6 @@ the existing kernel, and then inserts a new kernel:
 
       Using ``bmaptool`` is generally 10 to 20 times faster than using ``dd``.
 
+.. only:: splithtml
+
+   .. tags:: cli-tool, flashing, wic
diff --git a/documentation/dev-manual/x32-psabi.rst b/documentation/dev-manual/x32-psabi.rst
index 4ee5a5379..ec671b313 100644
--- a/documentation/dev-manual/x32-psabi.rst
+++ b/documentation/dev-manual/x32-psabi.rst
@@ -52,3 +52,6 @@ the x32 psABI. Here is an example::
 
    $ bitbake core-image-sato
 
+.. only:: splithtml
+
+   .. tags:: target-configuration
diff --git a/documentation/kernel-dev/index.rst b/documentation/kernel-dev/index.rst
index bd20e371e..417e52150 100644
--- a/documentation/kernel-dev/index.rst
+++ b/documentation/kernel-dev/index.rst
@@ -17,4 +17,8 @@ Yocto Project Linux Kernel Development Manual
    maint-appx
    faq
 
+.. only:: splithtml
+
+   .. tags:: linux-kernel
+
 .. include:: /boilerplate.rst
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 1e9c6d3a6..cca4764a8 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -2371,3 +2371,7 @@ executes to accomplish that.
 
 .. image:: svg/bitbake_tasks_map.*
    :width: 100%
+
+.. only:: splithtml
+
+   .. tags:: fakeroot, hash-equivalence, oe-concepts, pseudo, toolchains, sstate
diff --git a/documentation/overview-manual/development-environment.rst b/documentation/overview-manual/development-environment.rst
index 920908577..08b7af040 100644
--- a/documentation/overview-manual/development-environment.rst
+++ b/documentation/overview-manual/development-environment.rst
@@ -630,3 +630,7 @@ source licensing during the lifecycle of a product created using the
 Yocto Project, see the
 ":ref:`dev-manual/licenses:maintaining open source license compliance during your product's lifecycle`"
 section in the Yocto Project Development Tasks Manual.
+
+.. only:: splithtml
+
+   .. tags:: host-configuration
diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
index ef7e66d03..fcf7ab561 100644
--- a/documentation/overview-manual/yp-intro.rst
+++ b/documentation/overview-manual/yp-intro.rst
@@ -751,3 +751,7 @@ helpful for getting started:
    dependencies for libraries or for other recipes as well as
    configuration and compilation options. Related recipes are
    consolidated into a layer.
+
+.. only:: splithtml
+
+   .. tags:: oe-concepts
diff --git a/documentation/profile-manual/index.rst b/documentation/profile-manual/index.rst
index 0270932ca..b5a9b5552 100644
--- a/documentation/profile-manual/index.rst
+++ b/documentation/profile-manual/index.rst
@@ -15,4 +15,8 @@ Yocto Project Profiling and Tracing Manual
    usage
    examples
 
+.. only:: splithtml
+
+   .. tags:: debugging, profiling
+
 .. include:: /boilerplate.rst
diff --git a/documentation/ref-manual/devtool-reference.rst b/documentation/ref-manual/devtool-reference.rst
index 3445d1b4e..76ad38149 100644
--- a/documentation/ref-manual/devtool-reference.rst
+++ b/documentation/ref-manual/devtool-reference.rst
@@ -690,3 +690,7 @@ and create a remote debugging configuration for the recipe. Similarly to
 For further details on the ``devtool ide-sdk`` command, see the
 ":doc:`/sdk-manual/extensible`" chapter in the Yocto Project Application
 Development and the Extensible Software Development Kit (eSDK) manual.
+
+.. only:: splithtml
+
+   .. tags:: devtool
diff --git a/documentation/ref-manual/fragments.rst b/documentation/ref-manual/fragments.rst
index c5640b826..2a04c4a96 100644
--- a/documentation/ref-manual/fragments.rst
+++ b/documentation/ref-manual/fragments.rst
@@ -289,3 +289,7 @@ The ``core/yocto-autobuilder/multilib-x86-lib64`` fragment enables
 :ref:`multilib <dev-manual/libraries:Combining Multiple Versions of Library
 Files into One Image>` configurations for supporting 64-bit libraries on 32-bit
 :wikipedia:`X86 <X86>` builds.
+
+.. only:: splithtml
+
+   .. tags:: cli-tool, config-fragments
diff --git a/documentation/ref-manual/kickstart.rst b/documentation/ref-manual/kickstart.rst
index 14aff6025..2918d778b 100644
--- a/documentation/ref-manual/kickstart.rst
+++ b/documentation/ref-manual/kickstart.rst
@@ -243,3 +243,7 @@ the current file. For example:
    include common.wks.inc
 
    bootloader --configfile="directdisk-bootloader-config.cfg"
+
+.. only:: splithtml
+
+   .. tags:: wic
diff --git a/documentation/ref-manual/release-process.rst b/documentation/ref-manual/release-process.rst
index a75d916bf..430eb1e76 100644
--- a/documentation/ref-manual/release-process.rst
+++ b/documentation/ref-manual/release-process.rst
@@ -389,3 +389,7 @@ takes the Autobuilder workers several hours.
 Finally, in addition to the Autobuilder's tests, the Yocto Project QA
 team also performs testing on a variety of platforms, which includes
 actual hardware, to ensure expected results.
+
+.. only:: splithtml
+
+   .. tags:: release-process
diff --git a/documentation/sdk-manual/index.rst b/documentation/sdk-manual/index.rst
index a5c35caba..53638f1a5 100644
--- a/documentation/sdk-manual/index.rst
+++ b/documentation/sdk-manual/index.rst
@@ -18,4 +18,8 @@ Yocto Project Application Development and Software Development Kits (SDK/eSDK) M
    appendix-customizing
    appendix-customizing-standard
 
+.. only:: splithtml
+
+   .. tags:: sdk, toolchains
+
 .. include:: /boilerplate.rst
diff --git a/documentation/security-manual/build-process-security.rst b/documentation/security-manual/build-process-security.rst
index 0c8da967a..ec1ef068a 100644
--- a/documentation/security-manual/build-process-security.rst
+++ b/documentation/security-manual/build-process-security.rst
@@ -48,3 +48,7 @@ consider that:
    being set up in such a way that if such an issue were ever discovered, which at
    some point could happen, the build environments themselves could be simply
    destroyed and rebuilt cleanly, i.e. they're disposable.
+
+.. only:: splithtml
+
+   .. tags:: security
diff --git a/documentation/security-manual/read-only-rootfs.rst b/documentation/security-manual/read-only-rootfs.rst
index 823ddcecd..bdd073001 100644
--- a/documentation/security-manual/read-only-rootfs.rst
+++ b/documentation/security-manual/read-only-rootfs.rst
@@ -87,3 +87,6 @@ make sure that you configure processes and applications that attempt
 these types of writes do so to directories with write access (e.g.
 ``/tmp`` or ``/var/run``).
 
+.. only:: splithtml
+
+   .. tags:: security
diff --git a/documentation/security-manual/securing-images.rst b/documentation/security-manual/securing-images.rst
index 3aa55c2aa..105739090 100644
--- a/documentation/security-manual/securing-images.rst
+++ b/documentation/security-manual/securing-images.rst
@@ -138,3 +138,6 @@ The Yocto Project provides tools for making your image more secure. You
 can find these tools in the ``meta-security`` layer of the
 :yocto_git:`Yocto Project Source Repositories <>`.
 
+.. only:: splithtml
+
+   .. tags:: security
diff --git a/documentation/security-manual/sstate-signing.rst b/documentation/security-manual/sstate-signing.rst
index 74a5d6bf0..c7a751be9 100644
--- a/documentation/security-manual/sstate-signing.rst
+++ b/documentation/security-manual/sstate-signing.rst
@@ -283,3 +283,7 @@ Let's verify that signature verification works:
 
    As you can see, this does not prevent :term:`BitBake` from continuing, but
    the real task is executed instead of re-using the shared state.
+
+.. only:: splithtml
+
+   .. tags:: host-configuration, security, sstate
diff --git a/documentation/security-manual/vulnerabilities.rst b/documentation/security-manual/vulnerabilities.rst
index 38fbd2c7e..e8e368e28 100644
--- a/documentation/security-manual/vulnerabilities.rst
+++ b/documentation/security-manual/vulnerabilities.rst
@@ -515,3 +515,6 @@ Example of output for a CVE rejected by the Linux CNA:
       "description": "Rejected by CNA"
    }
 
+.. only:: splithtml
+
+   .. tags:: security
diff --git a/documentation/security-reference/index.rst b/documentation/security-reference/index.rst
index c20a54d1a..bf3a77d57 100644
--- a/documentation/security-reference/index.rst
+++ b/documentation/security-reference/index.rst
@@ -11,4 +11,8 @@ Yocto Project Security Reference
    security-team
    reporting-vulnerabilities
 
+.. only:: splithtml
+
+   .. tags:: security
+
 .. include:: /boilerplate.rst
diff --git a/documentation/test-manual/ptest.rst b/documentation/test-manual/ptest.rst
index 2b8672214..10019705c 100644
--- a/documentation/test-manual/ptest.rst
+++ b/documentation/test-manual/ptest.rst
@@ -184,3 +184,7 @@ test. Here is what you have to do for each recipe:
    ``install-ptest`` to run the tests. If this is not enough, you need
    to create a ``do_install_ptest`` function and make sure it gets
    called after the "make install-ptest" completes.
+
+.. only:: splithtml
+
+   .. tags:: runtime-testing
diff --git a/documentation/test-manual/reproducible-builds.rst b/documentation/test-manual/reproducible-builds.rst
index 4e39cf3f7..e57b5ed25 100644
--- a/documentation/test-manual/reproducible-builds.rst
+++ b/documentation/test-manual/reproducible-builds.rst
@@ -165,3 +165,7 @@ You can have finer control on the test with:
 - :term:`OEQA_REPRODUCIBLE_TEST_TARGET`: lists recipes to be built,
 - :term:`OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS`: lists recipes that will
   be built using :ref:`Shared State <overview-manual/concepts:Shared State>`.
+
+.. only:: splithtml
+
+   .. tags:: reproducibility
diff --git a/documentation/test-manual/runtime-testing.rst b/documentation/test-manual/runtime-testing.rst
index 5a7193f01..251eb3294 100644
--- a/documentation/test-manual/runtime-testing.rst
+++ b/documentation/test-manual/runtime-testing.rst
@@ -598,3 +598,6 @@ Once the test is complete, the packages are removed from the DUT::
          ]
      }
 
+.. only:: splithtml
+
+   .. tags:: runtime-testing
diff --git a/documentation/test-manual/test-process.rst b/documentation/test-manual/test-process.rst
index 00215385b..102638b1d 100644
--- a/documentation/test-manual/test-process.rst
+++ b/documentation/test-manual/test-process.rst
@@ -97,3 +97,7 @@ The next steps include:
 
 -  A final decision on whether to release is made by the YP TSC who have
    final oversight on release readiness.
+
+.. only:: splithtml
+
+   .. tags:: release-process
diff --git a/documentation/toaster-manual/index.rst b/documentation/toaster-manual/index.rst
index 3ff4c6913..b9c008378 100644
--- a/documentation/toaster-manual/index.rst
+++ b/documentation/toaster-manual/index.rst
@@ -15,4 +15,8 @@ Toaster User Manual
    setup-and-use
    reference
 
+.. only:: splithtml
+
+   .. tags:: host-configuration
+
 .. include:: /boilerplate.rst

-- 
2.55.0

