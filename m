Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web12.18719.1624086475436846441
 for <docs@lists.yoctoproject.org>;
 Sat, 19 Jun 2021 00:07:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.178.232, mailfrom: foss@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id 3E617200002;
	Sat, 19 Jun 2021 07:07:51 +0000 (UTC)
From: "Quentin Schulz" <foss@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss@0leil.net>
Subject: [PATCH] docs: replace remaining ``FOO`` by :term:`FOO`
Date: Sat, 19 Jun 2021 09:07:35 +0200
Message-Id: <20210619070735.3998-1-foss@0leil.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A few occurences appeared between the time the original patch was sent
and it was applied, this fixes it.

Also, the original patch didn't take into account lowercase terms, this
is now fixed, see module_autoload for example.

Finally, as is often the case with regexp, there was a typo in it that
didn't make it match as much as it should have.

The script that is used to do the replacement of ``FOO`` by :term:`FOO`
is the following Python code:

import re
from pathlib import Path
from runpy import run_module
import contextlib
import io
import sys

re_term = re.compile(r'variables.html#term-([a-zA-Z_0-9]*)')
terms = []
new_terms = set()

with contextlib.redirect_stdout(io.StringIO()) as f:
    run_module('sphinx.ext.intersphinx', run_name='__main__')

objects = f.getvalue()

match = re_term.search(objects)
while match:
    if match.group(1):
        terms.append(match.group(1))
    match = re_term.search(objects, match.end())

for rst in Path('.').rglob('*.rst'):
    with open(rst, 'r') as f:
        content = "".join(f.readlines())
    for term in terms:
        content = re.sub(r'``({})``(?!.*\s+[~=-]{{{:d},}})'.format(term, len(term)), r':term:`\1`', content)

    with open(rst, 'w') as f:
        f.write(content)

This script takes one argument as input: an objects.inv. Bitbake's can
be gotten from https://docs.yoctoproject.org/bitbake/objects.inv. The
objetcs.inv from the current git repo can be gotten from
documentation/_build/html/objetcs.inv after running `make html`.

Note that this excludes from replacement terms that appear in section
titles as it requires refs to be changed too. This can be automated too
if need be but right now it looks a bit confusing to have an anchor link
(for sections) also have a term/reference link in it. I am not sure this
is desired today.

This is the result of two runs of the aforementioned script, once with
Bitbake objects.inv and once with this repo's.

Fixes: ba49d9babfcb "docs: replace ``FOO`` by :term:`FOO` where possible"

Signed-off-by: Quentin Schulz <foss@0leil.net>
---
 documentation/bsp-guide/bsp.rst               |  2 +-
 documentation/dev-manual/common-tasks.rst     | 24 ++++----
 documentation/kernel-dev/common.rst           |  8 +--
 .../migration-guides/migration-1.5.rst        |  4 +-
 .../migration-guides/migration-1.7.rst        |  2 +-
 .../migration-guides/migration-2.1.rst        |  4 +-
 .../migration-guides/migration-2.2.rst        |  4 +-
 .../migration-guides/migration-2.3.rst        |  2 +-
 .../migration-guides/migration-2.4.rst        |  6 +-
 .../migration-guides/migration-2.5.rst        |  4 +-
 .../migration-guides/migration-2.6.rst        |  2 +-
 .../migration-guides/migration-2.7.rst        |  2 +-
 .../migration-guides/migration-3.0.rst        |  2 +-
 documentation/overview-manual/concepts.rst    |  6 +-
 documentation/ref-manual/classes.rst          | 10 ++--
 documentation/ref-manual/faq.rst              |  2 +-
 documentation/ref-manual/kickstart.rst        |  2 +-
 documentation/ref-manual/qa-checks.rst        |  2 +-
 documentation/ref-manual/variables.rst        | 60 +++++++++----------
 19 files changed, 74 insertions(+), 74 deletions(-)

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index 5c43f53d0..5f62376d6 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -1365,7 +1365,7 @@ Project Reference Manual.
 -  :term:`IMAGE_INSTALL`:
    Specifies packages to install into an image through the
    :ref:`image <ref-classes-image>` class. Recipes
-   use the ``IMAGE_INSTALL`` variable.
+   use the :term:`IMAGE_INSTALL` variable.
 
 -  ``do_image_wic[depends]``: A task that is constructed during the
    build. In this example, the task depends on specific tools in order
diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 762636a17..ba8f23ecb 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -268,7 +268,7 @@ following list:
       quickly.
 
       In summary, you need to place all files referenced from
-      ``SRC_URI`` in a machine-specific subdirectory within the layer in
+      :term:`SRC_URI` in a machine-specific subdirectory within the layer in
       order to restrict those files to machine-specific builds.
 
 -  *Perform Steps to Apply for Yocto Project Compatibility:* If you want
@@ -1305,7 +1305,7 @@ scanning directory locations for local files in :term:`SRC_URI`.
 
 The :term:`SRC_URI` variable in your recipe must define each unique location
 for your source files. It is good practice to not hard-code version
-numbers in a URL used in ``SRC_URI``. Rather than hard-code these
+numbers in a URL used in :term:`SRC_URI`. Rather than hard-code these
 values, use ``${``\ :term:`PV`\ ``}``,
 which causes the fetch process to use the version specified in the
 recipe filename. Specifying the version in this manner means that
@@ -2743,7 +2743,7 @@ recognizes the machine as "crownbay".
 The most important variables you must set in your machine configuration
 file or include from a lower-level configuration file are as follows:
 
--  ``TARGET_ARCH`` (e.g. "arm")
+-  :term:`TARGET_ARCH` (e.g. "arm")
 
 -  ``PREFERRED_PROVIDER_virtual/kernel``
 
@@ -2751,9 +2751,9 @@ file or include from a lower-level configuration file are as follows:
 
 You might also need these variables:
 
--  ``SERIAL_CONSOLES`` (e.g. "115200;ttyS0 115200;ttyS1")
+-  :term:`SERIAL_CONSOLES` (e.g. "115200;ttyS0 115200;ttyS1")
 
--  ``KERNEL_IMAGETYPE`` (e.g. "zImage")
+-  :term:`KERNEL_IMAGETYPE` (e.g. "zImage")
 
 -  :term:`IMAGE_FSTYPES` (e.g. "tar.gz jffs2")
 
@@ -3277,7 +3277,7 @@ The actual directory depends on several things:
 
 -  :term:`EXTENDPE`: The epoch - (if
    :term:`PE` is not specified, which is
-   usually the case for most recipes, then ``EXTENDPE`` is blank).
+   usually the case for most recipes, then :term:`EXTENDPE` is blank).
 
 -  :term:`PV`: The recipe version.
 
@@ -4167,7 +4167,7 @@ your tunings to best consider build times and package feed maintenance.
       If :term:`DISTRO` settings change or fundamental configuration settings
       such as the filesystem layout, you need to work with a clean :term:`TMPDIR`.
       Sharing :term:`TMPDIR` under these circumstances might work but since it is
-      not guaranteed, you should use a clean ``TMPDIR``.
+      not guaranteed, you should use a clean :term:`TMPDIR`.
 
 -  *Enable the Appropriate Package Architecture:* By default, the
    OpenEmbedded build system enables three levels of package
@@ -4392,7 +4392,7 @@ directory:
       INHERIT += "own-mirrors"
       BB_NO_NETWORK = "1"
 
-   The ``SOURCE_MIRROR_URL`` and ``own-mirror``
+   The :term:`SOURCE_MIRROR_URL` and ``own-mirror``
    class set up the system to use the downloads directory as your "own
    mirror". Using the :term:`BB_NO_NETWORK` variable makes sure that
    BitBake's fetching process in step 3 stays local, which means files
@@ -4676,7 +4676,7 @@ needed.
 
 For the most part, the Multilib class extension works automatically to
 extend the package name from ``${PN}`` to ``${MLPREFIX}${PN}``, where
-``MLPREFIX`` is the particular multilib (e.g. "lib32-" or "lib64-").
+:term:`MLPREFIX` is the particular multilib (e.g. "lib32-" or "lib64-").
 Standard variables such as
 :term:`DEPENDS`,
 :term:`RDEPENDS`,
@@ -6258,7 +6258,7 @@ the following:
    software being packaged. Do not confuse :term:`PV` with the binary
    package version.
 
--  ``PR``: The recipe revision.
+-  :term:`PR`: The recipe revision.
 
 -  :term:`SRCPV`: The OpenEmbedded
    build system uses this string to help define the value of :term:`PV` when
@@ -7946,8 +7946,8 @@ output from this command::
    Here are some notes on using the ``buildhistory-collect-srcrevs`` command:
 
    -  By default, only values where the :term:`SRCREV` was not hardcoded
-      (usually when ``AUTOREV`` is used) are reported. Use the ``-a``
-      option to see all ``SRCREV`` values.
+      (usually when :term:`AUTOREV` is used) are reported. Use the ``-a``
+      option to see all :term:`SRCREV` values.
 
    -  The output statements might not have any effect if overrides are
       applied elsewhere in the build system configuration. Use the
diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index de62df5b1..a97140b0b 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -81,7 +81,7 @@ section:
    variable to include kernel modules.
 
    In this example we wish to build for qemux86 so we must set the
-   ``MACHINE`` variable to "qemux86" and also add the "kernel-modules".
+   :term:`MACHINE` variable to "qemux86" and also add the "kernel-modules".
    As described we do this by appending to ``conf/local.conf``::
 
       MACHINE = "qemux86"
@@ -259,7 +259,7 @@ section:
    variable to include kernel modules.
 
    In this example we wish to build for qemux86 so we must set the
-   ``MACHINE`` variable to "qemux86" and also add the "kernel-modules".
+   :term:`MACHINE` variable to "qemux86" and also add the "kernel-modules".
    As described we do this by appending to ``conf/local.conf``::
 
       MACHINE = "qemux86"
@@ -588,7 +588,7 @@ recipe is processed.
    added to the Yocto Project.
 
    In general, however, the Yocto Project maintainers take care of
-   moving the ``SRC_URI``-specified configuration options to the
+   moving the :term:`SRC_URI`-specified configuration options to the
    kernel's ``meta`` branch. Not only is it easier for BSP developers
    not to have to put those configurations in the branch,
    but having the maintainers do it allows them to apply 'global'
@@ -730,7 +730,7 @@ a Raspberry Pi 2, which is based on the Broadcom 2708/2709 chipset::
 
 Aside from modifying your kernel recipe and providing your own
 ``defconfig`` file, you need to be sure no files or statements set
-``SRC_URI`` to use a ``defconfig`` other than your "in-tree" file (e.g.
+:term:`SRC_URI` to use a ``defconfig`` other than your "in-tree" file (e.g.
 a kernel's ``linux-``\ `machine`\ ``.inc`` file). In other words, if the
 build system detects a statement that identifies an "out-of-tree"
 ``defconfig`` file, that statement will override your
diff --git a/documentation/migration-guides/migration-1.5.rst b/documentation/migration-guides/migration-1.5.rst
index e956d9fff..e1ba4a9a1 100644
--- a/documentation/migration-guides/migration-1.5.rst
+++ b/documentation/migration-guides/migration-1.5.rst
@@ -124,7 +124,7 @@ The following directory changes exist:
    need to refer to this directory. The ``runqemu`` script now uses this
    variable to find images and kernel binaries and will use BitBake to
    determine the directory. Alternatively, you can set the
-   ``DEPLOY_DIR_IMAGE`` variable in the external environment.
+   :term:`DEPLOY_DIR_IMAGE` variable in the external environment.
 
 -  When buildhistory is enabled, its output is now written under the
    :term:`Build Directory` rather than
@@ -333,7 +333,7 @@ Following is a list of short entries describing other changes:
    :term:`BAD_RECOMMENDATIONS` supports
    pre-renamed package names.
 
--  ``classes/rootfs_rpm``: Implement ``BAD_RECOMMENDATIONS`` for RPM.
+-  ``classes/rootfs_rpm``: Implement :term:`BAD_RECOMMENDATIONS` for RPM.
 
 -  ``systemd``: Remove ``systemd_unitdir`` if ``systemd`` is not in
    :term:`DISTRO_FEATURES`.
diff --git a/documentation/migration-guides/migration-1.7.rst b/documentation/migration-guides/migration-1.7.rst
index c3a50eec8..8c642da20 100644
--- a/documentation/migration-guides/migration-1.7.rst
+++ b/documentation/migration-guides/migration-1.7.rst
@@ -13,7 +13,7 @@ The QEMU recipe now uses a number of
 :term:`PACKAGECONFIG` options to enable various
 optional features. The method used to set defaults for these options
 means that existing ``local.conf`` files will need to be modified to
-append to ``PACKAGECONFIG`` for ``qemu-native`` and ``nativesdk-qemu``
+append to :term:`PACKAGECONFIG` for ``qemu-native`` and ``nativesdk-qemu``
 instead of setting it. In other words, to enable graphical output for
 QEMU, you should now have these lines in ``local.conf``::
 
diff --git a/documentation/migration-guides/migration-2.1.rst b/documentation/migration-guides/migration-2.1.rst
index 6c5ed965d..3135d69ca 100644
--- a/documentation/migration-guides/migration-2.1.rst
+++ b/documentation/migration-guides/migration-2.1.rst
@@ -62,12 +62,12 @@ Makefile Environment Changes
 ----------------------------
 
 :term:`EXTRA_OEMAKE` now defaults to "" instead of
-"-e MAKEFLAGS=". Setting ``EXTRA_OEMAKE`` to "-e MAKEFLAGS=" by default
+"-e MAKEFLAGS=". Setting :term:`EXTRA_OEMAKE` to "-e MAKEFLAGS=" by default
 was a historical accident that has required many classes (e.g.
 ``autotools``, ``module``) and recipes to override this default in order
 to work with sensible build systems. When upgrading to the release, you
 must edit any recipe that relies upon this old default by either setting
-``EXTRA_OEMAKE`` back to "-e MAKEFLAGS=" or by explicitly setting any
+:term:`EXTRA_OEMAKE` back to "-e MAKEFLAGS=" or by explicitly setting any
 required variable value overrides using :term:`EXTRA_OEMAKE`, which is
 typically only needed when a Makefile sets a default value for a
 variable that is inappropriate for cross-compilation using the "="
diff --git a/documentation/migration-guides/migration-2.2.rst b/documentation/migration-guides/migration-2.2.rst
index d6dacdf34..cbdc6a739 100644
--- a/documentation/migration-guides/migration-2.2.rst
+++ b/documentation/migration-guides/migration-2.2.rst
@@ -271,7 +271,7 @@ update the references to ensure they continue to work.
 The :term:`IMGDEPLOYDIR` variable was introduced to allow sstate caching of
 image creation results. Image recipes defining custom :term:`IMAGE_CMD` or
 doing postprocessing on the generated images need to be adapted to use
-``IMGDEPLOYDIR`` instead of :term:`DEPLOY_DIR_IMAGE`. ``IMAGE_MANIFEST``
+:term:`IMGDEPLOYDIR` instead of :term:`DEPLOY_DIR_IMAGE`. :term:`IMAGE_MANIFEST`
 creation and symlinking of the most recent image file will fail otherwise.
 
 .. _migration-2.2-bitbake-changes:
@@ -292,7 +292,7 @@ The following changes took place for BitBake:
    change is more in-line with how the other fetchers work for source
    control systems. Recipes that fetch from Perforce will need to be
    updated to use :term:`SRCREV` in place of specifying the source revision
-   within ``SRC_URI``.
+   within :term:`SRC_URI`.
 
 -  Some of BitBake's internal code structures for accessing the recipe
    cache needed to be changed to support the new multi-configuration
diff --git a/documentation/migration-guides/migration-2.3.rst b/documentation/migration-guides/migration-2.3.rst
index 886d579f9..b79bc541c 100644
--- a/documentation/migration-guides/migration-2.3.rst
+++ b/documentation/migration-guides/migration-2.3.rst
@@ -36,7 +36,7 @@ Consider the following:
    has a ``pkg_postinst`` that calls ``systemctl`` if "systemd" is in
    :term:`DISTRO_FEATURES`. In the example,
    ``systemd-systemctl-native`` is added to :term:`PACKAGE_WRITE_DEPS`,
-   which is also conditional on "systemd" being in ``DISTRO_FEATURES``.
+   which is also conditional on "systemd" being in :term:`DISTRO_FEATURES`.
 
 -  Examine Recipes that Use ``SSTATEPOSTINSTFUNCS``: You need to
    examine any recipe that uses ``SSTATEPOSTINSTFUNCS`` and determine
diff --git a/documentation/migration-guides/migration-2.4.rst b/documentation/migration-guides/migration-2.4.rst
index 07f2bef62..cab81356d 100644
--- a/documentation/migration-guides/migration-2.4.rst
+++ b/documentation/migration-guides/migration-2.4.rst
@@ -51,7 +51,7 @@ occurred:
       ``su`` is normally provided through the shadow file format. The
       main ``util-linux`` package has runtime dependencies (i.e.
       :term:`RDEPENDS`) on the ``util-linux-su`` package
-      when "pam" is in ``DISTRO_FEATURES``.
+      when "pam" is in :term:`DISTRO_FEATURES`.
 
    -  The ``switch_root`` program is now packaged in a separate
       "util-linux-switch-root" package for small initramfs images that
@@ -72,10 +72,10 @@ occurred:
    change also eliminates needing to pull in the entire ``initscripts``
    package. The main ``initscripts`` package has a runtime dependency
    (i.e. :term:`RDEPENDS`) on the ``sushell`` package when "selinux" is in
-   ``DISTRO_FEATURES``.
+   :term:`DISTRO_FEATURES`.
 
 -  ``glib-2.0``: The ``glib-2.0`` package now has a recommended
-   runtime dependency (i.e. ``RRECOMMENDS``) on the ``shared-mime-info``
+   runtime dependency (i.e. :term:`RRECOMMENDS`) on the ``shared-mime-info``
    package, since large portions of GIO are not useful without the MIME
    database. You can remove the dependency by using the
    :term:`BAD_RECOMMENDATIONS` variable if
diff --git a/documentation/migration-guides/migration-2.5.rst b/documentation/migration-guides/migration-2.5.rst
index d14580df2..79f804fa1 100644
--- a/documentation/migration-guides/migration-2.5.rst
+++ b/documentation/migration-guides/migration-2.5.rst
@@ -278,12 +278,12 @@ The following are additional changes:
    performance and compression. In order to build a live image with
    squashfs+lz4 compression enabled you should now set
    ``LIVE_ROOTFS_TYPE = "squashfs-lz4"`` and ensure that ``live`` is in
-   ``IMAGE_FSTYPES``.
+   :term:`IMAGE_FSTYPES`.
 
 -  Recipes with an unconditional dependency on ``libpam`` are only
    buildable with ``pam`` in :term:`DISTRO_FEATURES`. If the dependency is
    truly optional then it is recommended that the dependency be
-   conditional upon ``pam`` being in ``DISTRO_FEATURES``.
+   conditional upon ``pam`` being in :term:`DISTRO_FEATURES`.
 
 -  For EFI-based machines, the bootloader (``grub-efi`` by default) is
    installed into the image at /boot. Wic can be used to split the
diff --git a/documentation/migration-guides/migration-2.6.rst b/documentation/migration-guides/migration-2.6.rst
index 3216ed5ae..a8c56ede7 100644
--- a/documentation/migration-guides/migration-2.6.rst
+++ b/documentation/migration-guides/migration-2.6.rst
@@ -430,7 +430,7 @@ The following miscellaneous changes occurred:
    .. note::
 
       ``genericx86`` and ``genericx86-64`` retain ``kernel-modules`` as part of
-      the ``RRECOMMENDS`` variable setting.
+      the :term:`RRECOMMENDS` variable setting.
 
 -  The ``LGPLv2_WHITELIST_GPL-3.0`` variable has been removed. If you
    are setting this variable in your configuration, set or append it to
diff --git a/documentation/migration-guides/migration-2.7.rst b/documentation/migration-guides/migration-2.7.rst
index 25d92296c..69bd39060 100644
--- a/documentation/migration-guides/migration-2.7.rst
+++ b/documentation/migration-guides/migration-2.7.rst
@@ -72,7 +72,7 @@ License Value Corrections
 The following corrections have been made to the
 :term:`LICENSE` values set by recipes:
 
-- *socat*: Corrected ``LICENSE`` to be "GPLv2" rather than "GPLv2+".
+- *socat*: Corrected :term:`LICENSE` to be "GPLv2" rather than "GPLv2+".
 - *libgfortran*: Set license to "GPL-3.0-with-GCC-exception".
 - *elfutils*: Removed "Elfutils-Exception" and set to "GPLv2" for shared libraries
 
diff --git a/documentation/migration-guides/migration-3.0.rst b/documentation/migration-guides/migration-3.0.rst
index 163c6201c..20c7026e8 100644
--- a/documentation/migration-guides/migration-3.0.rst
+++ b/documentation/migration-guides/migration-3.0.rst
@@ -243,7 +243,7 @@ The following sanity check changes occurred.
 -  Setting ``DEPENDS_${PN}`` anywhere (i.e. typically in a recipe) now
    triggers an error. The error is triggered because
    :term:`DEPENDS` is not a package-specific variable
-   unlike RDEPENDS. You should set ``DEPENDS`` instead.
+   unlike RDEPENDS. You should set :term:`DEPENDS` instead.
 
 -  systemd currently does not work well with the musl C library because
    only upstream officially supports linking the library with glibc.
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 642ef15fe..1e5f0f903 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -774,7 +774,7 @@ Build Directory's hierarchy:
 
    -  :term:`BPN`: The name of the recipe
       used to build the package. The :term:`BPN` variable is a version of
-      the ``PN`` variable but with common prefixes and suffixes removed.
+      the :term:`PN` variable but with common prefixes and suffixes removed.
 
    -  :term:`PV`: The version of the
       recipe used to build the package.
@@ -1918,7 +1918,7 @@ shared state files. Here is an example::
 
 .. note::
 
-   The shared state directory (``SSTATE_DIR``) is organized into two-character
+   The shared state directory (:term:`SSTATE_DIR`) is organized into two-character
    subdirectories, where the subdirectory names are based on the first two
    characters of the hash.
    If the shared state directory structure for a mirror has the same structure
@@ -2028,7 +2028,7 @@ dependencies, you must manually declare the dependencies.
 
    .. note::
 
-      By default, ``foo-dev`` also has an ``RDEPENDS``-style dependency on
+      By default, ``foo-dev`` also has an :term:`RDEPENDS`-style dependency on
       ``foo``, because the default value of ``RDEPENDS_${PN}-dev`` (set in
       bitbake.conf) includes "${PN}".
 
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 09878c480..5ea019666 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -116,7 +116,7 @@ It's useful to have some idea of how the tasks defined by the
 
 -  :ref:`ref-tasks-compile` - Runs ``make`` with
    arguments that specify the compiler and linker. You can pass
-   additional arguments through the ``EXTRA_OEMAKE`` variable.
+   additional arguments through the :term:`EXTRA_OEMAKE` variable.
 
 -  :ref:`ref-tasks-install` - Runs ``make install`` and
    passes in ``${``\ :term:`D`\ ``}`` as ``DESTDIR``.
@@ -995,7 +995,7 @@ are meant to detect real or potential problems in the packaged
 output. So exercise caution when disabling these checks.
 
 Here are the tests you can list with the :term:`WARN_QA` and
-``ERROR_QA`` variables:
+:term:`ERROR_QA` variables:
 
 -  ``already-stripped:`` Checks that produced binaries have not
    already been stripped prior to the build system extracting debug
@@ -1030,7 +1030,7 @@ Here are the tests you can list with the :term:`WARN_QA` and
    adds a dependency on the ``initscripts-functions`` package to
    packages that install an initscript that refers to
    ``/etc/init.d/functions``. The recipe should really have an explicit
-   ``RDEPENDS`` for the package in question on ``initscripts-functions``
+   :term:`RDEPENDS` for the package in question on ``initscripts-functions``
    so that the OpenEmbedded build system is able to ensure that the
    ``initscripts`` recipe is actually built and thus the
    ``initscripts-functions`` package is made available.
@@ -1200,7 +1200,7 @@ Here are the tests you can list with the :term:`WARN_QA` and
    turn into ``FILES = "xyz"``.
 
 -  ``rpaths:`` Checks for rpaths in the binaries that contain build
-   system paths such as ``TMPDIR``. If this test fails, bad ``-rpath``
+   system paths such as :term:`TMPDIR`. If this test fails, bad ``-rpath``
    options are being passed to the linker commands and your binaries
    have potential security issues.
 
@@ -1273,7 +1273,7 @@ themselves.
 
 The ``kernel`` class handles building Linux kernels. The class contains
 code to build all kernel trees. All needed headers are staged into the
-``STAGING_KERNEL_DIR`` directory to allow out-of-tree module builds
+:term:`STAGING_KERNEL_DIR` directory to allow out-of-tree module builds
 using the :ref:`module <ref-classes-module>` class.
 
 This means that each built kernel module is packaged separately and
diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index 640ef77d0..c7322e762 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -292,7 +292,7 @@ download directory. If that location fails, Poky tries
 :term:`MIRRORS` in that order.
 
 Assuming your distribution is "poky", the OpenEmbedded build system uses
-the Yocto Project source ``PREMIRRORS`` by default for SCM-based
+the Yocto Project source :term:`PREMIRRORS` by default for SCM-based
 sources, upstreams for normal tarballs, and then falls back to a number
 of other mirrors including the Yocto Project source mirror if those
 fail.
diff --git a/documentation/ref-manual/kickstart.rst b/documentation/ref-manual/kickstart.rst
index a7443f9ea..fc723ccbe 100644
--- a/documentation/ref-manual/kickstart.rst
+++ b/documentation/ref-manual/kickstart.rst
@@ -208,7 +208,7 @@ supports the following options:
    bootloader times out and boots the default option.
 
 -  ``--append``: Specifies kernel parameters. These parameters will be
-   added to the syslinux ``APPEND`` or ``grub`` kernel command line.
+   added to the syslinux :term:`APPEND` or ``grub`` kernel command line.
 
 -  ``--configfile``: Specifies a user-defined configuration file for
    the bootloader. You can provide a full pathname for the file or a
diff --git a/documentation/ref-manual/qa-checks.rst b/documentation/ref-manual/qa-checks.rst
index a105acc2c..0ef203c70 100644
--- a/documentation/ref-manual/qa-checks.rst
+++ b/documentation/ref-manual/qa-checks.rst
@@ -604,7 +604,7 @@ Errors and Warnings
     so using ${:term:`BPN`} rather than ${:term:`PN`} as the latter will change
     for different variants of the same recipe e.g. when :term:`BBCLASSEXTEND`
     or multilib are being used. This check will fail if a reference to ``${PN}``
-    is found within the ``SRC_URI`` value - change it to ``${BPN}`` instead.
+    is found within the :term:`SRC_URI` value - change it to ``${BPN}`` instead.
 
 
 .. _qa-check-unhandled-features-check:
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 71c2e11d9..8bcbae792 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -280,7 +280,7 @@ system and gives an overview of their function and contents.
          S = "${WORKDIR}/${BP}"
 
       You can separate the (:term:`S`) directory and the directory pointed to
-      by the ``B`` variable. Most Autotools-based recipes support
+      by the :term:`B` variable. Most Autotools-based recipes support
       separating these directories. The build system defaults to using
       separate directories for ``gcc`` and some kernel recipes.
 
@@ -553,7 +553,7 @@ system and gives an overview of their function and contents.
          BB_SERVER_TIMEOUT = "20"
 
       If you want the server to never be unloaded,
-      set ``BB_SERVER_TIMEOUT`` to "-1".
+      set :term:`BB_SERVER_TIMEOUT` to "-1".
 
    :term:`BBCLASSEXTEND`
       Allows you to extend a recipe so that it builds variants of the
@@ -577,7 +577,7 @@ system and gives an overview of their function and contents.
          variants by rewriting variable values and applying overrides such
          as ``_class-native``. For example, to generate a native version of
          a recipe, a :term:`DEPENDS` on "foo" is rewritten
-         to a ``DEPENDS`` on "foo-native".
+         to a :term:`DEPENDS` on "foo-native".
 
          Even when using :term:`BBCLASSEXTEND`, the recipe is only parsed once.
          Parsing once adds some limitations. For example, it is not
@@ -892,13 +892,13 @@ system and gives an overview of their function and contents.
       the :term:`BUILD_CFLAGS` and
       :term:`BUILDSDK_CFLAGS` default values.
 
-      The default value of the ``BUILD_OPTIMIZATION`` variable is "-O2
+      The default value of the :term:`BUILD_OPTIMIZATION` variable is "-O2
       -pipe".
 
    :term:`BUILD_OS`
       Specifies the operating system in use on the build host (e.g.
       "linux"). The OpenEmbedded build system sets the value of
-      ``BUILD_OS`` from the OS reported by the ``uname`` command - the
+      :term:`BUILD_OS` from the OS reported by the ``uname`` command - the
       first word, converted to lower-case characters.
 
    :term:`BUILD_PREFIX`
@@ -1114,7 +1114,7 @@ system and gives an overview of their function and contents.
 
       .. note::
 
-         ``CLASSOVERRIDE`` gets its default "class-target" value from the
+         :term:`CLASSOVERRIDE` gets its default "class-target" value from the
          ``bitbake.conf`` file.
 
       As an example, the following override allows you to install extra
@@ -1205,7 +1205,7 @@ system and gives an overview of their function and contents.
 
    :term:`COMPONENTS_DIR`
       Stores sysroot components for each recipe. The OpenEmbedded build
-      system uses ``COMPONENTS_DIR`` when constructing recipe-specific
+      system uses :term:`COMPONENTS_DIR` when constructing recipe-specific
       sysroots for other recipes.
 
       The default is
@@ -1611,7 +1611,7 @@ system and gives an overview of their function and contents.
             ":ref:`overview-manual/concepts:automatically added runtime dependencies`"
             section in the Yocto Project Overview and Concepts Manual,
             runtime dependencies will often be added automatically, meaning
-            ``DEPENDS`` alone is sufficient for most recipes.
+            :term:`DEPENDS` alone is sufficient for most recipes.
 
          -  Counterintuitively, :term:`DEPENDS` is often necessary even for
             recipes that install precompiled components. For example, if
@@ -1652,7 +1652,7 @@ system and gives an overview of their function and contents.
       "package_deb".
 
       The BitBake configuration file initially defines the
-      ``DEPLOY_DIR_DEB`` variable as a sub-folder of
+      :term:`DEPLOY_DIR_DEB` variable as a sub-folder of
       :term:`DEPLOY_DIR`::
 
          DEPLOY_DIR_DEB = "${DEPLOY_DIR}/deb"
@@ -2568,7 +2568,7 @@ system and gives an overview of their function and contents.
    :term:`FONT_EXTRA_RDEPENDS`
       When inheriting the :ref:`fontcache <ref-classes-fontcache>` class,
       this variable specifies the runtime dependencies for font packages.
-      By default, the ``FONT_EXTRA_RDEPENDS`` is set to "fontconfig-utils".
+      By default, the :term:`FONT_EXTRA_RDEPENDS` is set to "fontconfig-utils".
 
    :term:`FONT_PACKAGES`
       When inheriting the :ref:`fontcache <ref-classes-fontcache>` class,
@@ -3005,7 +3005,7 @@ system and gives an overview of their function and contents.
 
          -  If an image recipe uses the "inherit image" line and you are
             setting :term:`IMAGE_FSTYPES` inside the recipe, you must set
-            ``IMAGE_FSTYPES`` prior to using the "inherit image" line.
+            :term:`IMAGE_FSTYPES` prior to using the "inherit image" line.
 
          -  Due to the way the OpenEmbedded build system processes this
             variable, you cannot update its contents by using ``_append``
@@ -3334,13 +3334,13 @@ system and gives an overview of their function and contents.
    :term:`IMGDEPLOYDIR`
       When inheriting the :ref:`image <ref-classes-image>` class directly or
       through the :ref:`core-image <ref-classes-core-image>` class, the
-      ``IMGDEPLOYDIR`` points to a temporary work area for deployed files
+      :term:`IMGDEPLOYDIR` points to a temporary work area for deployed files
       that is set in the ``image`` class as follows::
 
          IMGDEPLOYDIR = "${WORKDIR}/deploy-${PN}-image-complete"
 
       Recipes inheriting the ``image`` class should copy files to be
-      deployed into ``IMGDEPLOYDIR``, and the class will take care of
+      deployed into :term:`IMGDEPLOYDIR`, and the class will take care of
       copying them into :term:`DEPLOY_DIR_IMAGE` afterwards.
 
    :term:`INC_PR`
@@ -3698,7 +3698,7 @@ system and gives an overview of their function and contents.
       - qemu
       - mips
 
-      You define the ``KARCH`` variable in the :ref:`kernel-dev/advanced:bsp descriptions`.
+      You define the :term:`KARCH` variable in the :ref:`kernel-dev/advanced:bsp descriptions`.
 
    :term:`KBRANCH`
       A regular expression used by the build process to explicitly identify
@@ -4653,7 +4653,7 @@ system and gives an overview of their function and contents.
 
    :term:`module_autoload`
       This variable has been replaced by the :term:`KERNEL_MODULE_AUTOLOAD`
-      variable. You should replace all occurrences of ``module_autoload``
+      variable. You should replace all occurrences of :term:`module_autoload`
       with additions to :term:`KERNEL_MODULE_AUTOLOAD`, for example::
 
          module_autoload_rfcomm = "rfcomm"
@@ -4684,9 +4684,9 @@ system and gives an overview of their function and contents.
       You must use the kernel module name override.
 
       Run ``man modprobe.d`` in the shell to find out more information on
-      the exact syntax you want to provide with ``module_conf``.
+      the exact syntax you want to provide with :term:`module_conf`.
 
-      Including ``module_conf`` causes the OpenEmbedded build system to
+      Including :term:`module_conf` causes the OpenEmbedded build system to
       populate the ``/etc/modprobe.d/modname.conf`` file with
       ``modprobe.d`` syntax lines. Here is an example that adds the options
       ``arg1`` and ``arg2`` to a module named ``mymodule``::
@@ -4876,7 +4876,7 @@ system and gives an overview of their function and contents.
       information, see the ":ref:`dev-manual/common-tasks:using a development shell`" section in
       the Yocto Project Development Tasks Manual.
 
-      You can use the following values for the ``OE_TERMINAL`` variable:
+      You can use the following values for the :term:`OE_TERMINAL` variable:
 
       - auto
       - gnome
@@ -5260,7 +5260,7 @@ system and gives an overview of their function and contents.
          PACKAGECONFIG[f2] = "\
               ... and so on and so on ...
 
-      The ``PACKAGECONFIG`` variable itself specifies a space-separated
+      The :term:`PACKAGECONFIG` variable itself specifies a space-separated
       list of the features to enable. Following the features, you can
       determine the behavior of each feature by providing up to six
       order-dependent arguments, which are separated by commas. You can
@@ -5600,7 +5600,7 @@ system and gives an overview of their function and contents.
 
       If applicable, the :term:`PN` variable also contains any special suffix
       or prefix. For example, using ``bash`` to build packages for the
-      native machine, ``PN`` is ``bash-native``. Using ``bash`` to build
+      native machine, :term:`PN` is ``bash-native``. Using ``bash`` to build
       packages for the target and for Multilib, :term:`PN` would be ``bash``
       and ``lib64-bash``, respectively.
 
@@ -5670,7 +5670,7 @@ system and gives an overview of their function and contents.
          :term:`PR` does not need to be increased for changes that do not change the
          package contents or metadata.
 
-      Because manually managing ``PR`` can be cumbersome and error-prone,
+      Because manually managing :term:`PR` can be cumbersome and error-prone,
       an automated solution exists. See the
       ":ref:`dev-manual/common-tasks:working with a pr service`" section
       in the Yocto Project Development Tasks Manual for more information.
@@ -6042,7 +6042,7 @@ system and gives an overview of their function and contents.
 
       In the example,
       the development package depends on the ``perl`` package. Thus, the
-      ``RDEPENDS`` variable has the ``${PN}-dev`` package name as part of
+      :term:`RDEPENDS` variable has the ``${PN}-dev`` package name as part of
       the variable.
 
       .. note::
@@ -7079,7 +7079,7 @@ system and gives an overview of their function and contents.
 
    :term:`SRC_URI_OVERRIDES_PACKAGE_ARCH`
       By default, the OpenEmbedded build system automatically detects
-      whether ``SRC_URI`` contains files that are machine-specific. If so,
+      whether :term:`SRC_URI` contains files that are machine-specific. If so,
       the build system automatically changes :term:`PACKAGE_ARCH`. Setting this
       variable to "0" disables this behavior.
 
@@ -7292,7 +7292,7 @@ system and gives an overview of their function and contents.
 
             ``-native`` recipes are not installed into host paths like such
             as ``/usr``. Rather, these recipes are installed into
-            ``STAGING_DIR_NATIVE``. When compiling ``-native`` recipes,
+            :term:`STAGING_DIR_NATIVE`. When compiling ``-native`` recipes,
             standard build environment variables such as
             :term:`CPPFLAGS` and
             :term:`CFLAGS` are set up so that both host paths
@@ -7726,13 +7726,13 @@ system and gives an overview of their function and contents.
       Specifies the prefix used for the toolchain binary target tools.
 
       Depending on the type of recipe and the build target,
-      ``TARGET_PREFIX`` is set as follows:
+      :term:`TARGET_PREFIX` is set as follows:
 
       -  For recipes building for the target machine, the value is
          "${:term:`TARGET_SYS`}-".
 
       -  For native recipes, the build system sets the variable to the
-         value of ``BUILD_PREFIX``.
+         value of :term:`BUILD_PREFIX`.
 
       -  For native SDK recipes (``nativesdk``), the build system sets the
          variable to the value of :term:`SDK_PREFIX`.
@@ -7778,7 +7778,7 @@ system and gives an overview of their function and contents.
       separate to avoid potential conflicts.
 
       In the ``defaultsetup.conf`` file, the default value of
-      ``TCLIBCAPPEND`` is "-${TCLIBC}". However, distros such as poky,
+      :term:`TCLIBCAPPEND` is "-${TCLIBC}". However, distros such as poky,
       which normally only support one ``libc`` variant, set
       :term:`TCLIBCAPPEND` to "" in their distro configuration file resulting
       in no suffix being applied.
@@ -7960,7 +7960,7 @@ system and gives an overview of their function and contents.
       ``BaseTarget`` class, which is an abstract class that cannot be used
       as a value of :term:`TEST_TARGET`.
 
-      You can provide the following arguments with ``TEST_TARGET``:
+      You can provide the following arguments with :term:`TEST_TARGET`:
 
       -  *"qemu":* Boots a QEMU image and runs the tests. See the
          ":ref:`dev-manual/common-tasks:enabling runtime tests on qemu`" section
@@ -8298,7 +8298,7 @@ system and gives an overview of their function and contents.
       In this example, "sd" is selected as the configuration of the possible four for the
       :term:`UBOOT_MACHINE`. The "sd" configuration defines
       "mx6qsabreauto_config" as the value for :term:`UBOOT_MACHINE`, while the
-      "sdcard" specifies the ``IMAGE_FSTYPES`` to use for the U-Boot image.
+      "sdcard" specifies the :term:`IMAGE_FSTYPES` to use for the U-Boot image.
 
       For more information on how the :term:`UBOOT_CONFIG` is handled, see the
       :ref:`uboot-config <ref-classes-uboot-config>`
@@ -8357,7 +8357,7 @@ system and gives an overview of their function and contents.
    :term:`UBOOT_MKIMAGE_DTCOPTS`
       Options for the device tree compiler passed to mkimage '-D'
       feature while creating FIT image in :ref:`kernel-fitimage <ref-classes-kernel-fitimage>` class.
-      If ``UBOOT_MKIMAGE_DTCOPTS`` is not set then kernel-fitimage will not
+      If :term:`UBOOT_MKIMAGE_DTCOPTS` is not set then kernel-fitimage will not
       pass the ``-D`` option to mkimage.
 
    :term:`UBOOT_MKIMAGE_SIGN`
-- 
2.20.1

