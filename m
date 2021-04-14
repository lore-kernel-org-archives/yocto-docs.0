Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web09.6166.1618359599801143802
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Apr 2021 17:19:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=jxE5YQnx;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 6579520B8778; Tue, 13 Apr 2021 17:19:57 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6579520B8778
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1618359597;
	bh=d+W30j0L5PzUEq2xXBvpJOcuHPcLqRYqn3u+HxLQacA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jxE5YQnx3ocHUApScv5ON5qwCMrx2rPDvREtAvErZWoRsGlO2n3AQ2cwkpTo2zjLZ
	 9+FyKqXyKcMfp/JHMob2P8bQvtbXPg1dxbYdTo9BRTRfdWuQaok5IzQckRgaB0sM4x
	 0JRe1SdcvP+bdmpyrK8Npc7pHk4NgdvAK2edKUiY=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 12/13] ref-manual: add migration section for 3.3 release
Date: Tue, 13 Apr 2021 17:19:53 -0700
Message-Id: <d8b43077bf92ad403028cbf37b61c4a6349f9370.1618358456.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1618358456.git.paul.eggleton@linux.microsoft.com>
References: <cover.1618358456.git.paul.eggleton@linux.microsoft.com>

From: Paul Eggleton <paul.eggleton@microsoft.com>

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/migration-3.3.rst | 144 +++++++++++++++++++++++++++++
 documentation/ref-manual/migration.rst     |   1 +
 2 files changed, 145 insertions(+)
 create mode 100644 documentation/ref-manual/migration-3.3.rst

diff --git a/documentation/ref-manual/migration-3.3.rst b/documentation/ref-manual/migration-3.3.rst
new file mode 100644
index 0000000..8dfbe7f
--- /dev/null
+++ b/documentation/ref-manual/migration-3.3.rst
@@ -0,0 +1,144 @@
+Moving to the Yocto Project 3.3 Release
+=======================================
+
+This section provides migration information for moving to the Yocto
+Project 3.3 Release from the prior release.
+
+
+.. _migration-3.3-minimum-system-requirements:
+
+Minimum system requirements
+---------------------------
+
+You will now need at least Python 3.6 installed on your build host. Most recent
+distributions provide this, but should you be building on a distribution that
+does not have it, you can use the ``buildtools-tarball`` (easily installable
+using ``scripts/install-buildtools``) - see
+:ref:`ref-manual/system-requirements:required git, tar, python and gcc versions`
+for details.
+
+
+.. _migration-3.3-removed-recipes:
+
+Removed recipes
+---------------
+
+The following recipes have been removed:
+
+- ``go-dep``: obsolete with the advent of go modules
+- ``gst-validate``: replaced by ``gst-devtools``
+- ``linux-yocto``: removed 5.8 version recipes (5.4 / 5.10 still provided)
+- ``vulkan-demos``: replaced by ``vulkan-samples``
+
+
+.. _migration-3.3-common-license-only-versions:
+
+Single version common license file naming
+-----------------------------------------
+
+Some license files in ``meta/files/common-licenses`` have been renamed to match
+current SPDX naming conventions:
+
+- AGPL-3.0 -> AGPL-3.0-only
+- GPL-1.0 -> GPL-1.0-only
+- GPL-2.0 -> GPL-2.0-only
+- GPL-3.0 -> GPL-3.0-only
+- LGPL-2.0 -> LGPL-2.0-only
+- LGPL-2.1 -> LGPL-2.1-only
+- LGPL-3.0 -> LGPL-3.0-only
+
+Additionally, corresponding "-or-later" suffixed files have been added e.g.
+``GPL-2.0-or-later``.
+
+It is not required that you change :term:`LICENSE` values as there are mappings
+from the original names in place; however, in rare cases where you have a recipe
+which sets :term:`LIC_FILES_CHKSUM` to point to file(s) in
+``meta/files/common-licenses`` (which in any case is not recommended) you will
+need to update those.
+
+
+.. _migration-3.3-python3targetconfig:
+
+New ``python3targetconfig`` class
+---------------------------------
+
+A new :ref:`python3targetconfig <ref-classes-python3targetconfig>` class has been
+created for situations where you would previously have inherited the
+``python3native`` class but need access to target configuration data (such as
+correct installation directories). Recipes where this situation applies should
+be changed to inherit ``python3targetconfig`` instead of ``python3native``. This
+also adds a dependency on target ``python3``, so it should only be used where
+appropriate in order to avoid unnecessarily lengthening builds.
+
+Some example recipes where this change has been made: ``gpgme``, ``libcap-ng``,
+``python3-pycairo``.
+
+
+.. _migration-3.3-bitbake:
+
+BitBake changes
+---------------
+
+- BitBake is now configured to use a default ``umask`` of ``022`` for all tasks
+  (specified via a new ``BB_DEFAULT_UMASK`` variable). If needed, ``umask`` can
+  still be set on a per-task basis via the ``umask`` varflag on the task
+  function, but that is unlikely to be necessary in most cases.
+
+- If a version specified in :term:`PREFERRED_VERSION` is not available this
+  will now trigger a warning instead of just a note, making such issues more
+  visible.
+
+
+.. _migration-3.3-packaging:
+
+Packaging changes
+-----------------
+
+The following packaging changes have been made; in all cases the main package
+still depends upon the split out packages so you should not need to do anything
+unless you want to take advantage of the improved granularity:
+
+- ``dbus``: ``-common`` and ``-tools`` split out
+- ``iproute2``: split ip binary to its own package
+- ``net-tools``: split ``mii-tool`` into its own package
+- ``procps``: split ``ps`` and ``sysctl`` into their own packages
+- ``rpm``: split build and extra functionality into separate packages
+- ``sudo``: split ``sudo`` binary into ``sudo-sudo`` and libs into ``sudo-lib``
+- ``systemtap``: examples, python scripts and runtime material split out
+- ``util-linux``: ``libuuid`` has been split out to its own
+  ``util-linux-libuuid`` recipe (and corresponding packages) to avoid circular
+  dependencies if ``libgcrypt`` support is enabled in ``util-linux``.
+  (``util-linux`` depends upon ``util-linux-libuuid``.)
+
+
+.. _migration-3.3-misc:
+
+Miscellaneous changes
+---------------------
+
+- The default poky :term:`DISTRO_VERSION` value now uses the core metadata's
+  git hash (i.e. :term:`METADATA_REVISION`) rather than the date (i.e.
+  :term:`DATE`) to reduce one small source of non-reproducibility. You can
+  of course specify your own ``DISTRO_VERSION`` value as desired
+  (particularly if you create your own custom distro configuration).
+- The :ref:`ccache <ref-classes-ccache>` class now uses ``ccache`` from the
+  build host rather than building ``ccache-native`` (due to circular
+  dependencies in ccache 4.0 that are impractical to resolve otherwise), so
+  if you enable it you will now need to have ``ccache`` installed on your
+  host system.
+- ``adwaita-icon-theme`` version 3.34.3 has been added back, and is selected
+  as the default via :term:`PREFERRED_VERSION` in
+  ``meta/conf/distro/include/default-versions.inc`` due to newer versions
+  not working well with ``librsvg`` 2.40. ``librsvg`` is not practically
+  upgradeable at the moment as it has been ported to Rust, and Rust is not
+  (yet) in OE-Core, but this will change in a future release.
+- ``ffmpeg`` is now configured to disable GPL-licensed portions by default
+  to make it harder to accidentally violate the GPL. To explicitly enable GPL
+  licensed portions, add ``gpl`` to :term:`PACKAGECONFIG` for ``ffmpeg``
+  using a bbappend (or use ``PACKAGECONFIG_append_pn-ffmpeg = " gpl"`` in
+  your configuration.)
+- ``connman`` is now set to conflict with ``systemd-networkd`` as they
+  overlap functionally and may interfere with each other at runtime.
+- Canonical SPDX license names are now used in image license manifests in
+  order to avoid aliases of the same license from showing up together (e.g.
+  ``GPLv2`` and ``GPL-2.0``)
diff --git a/documentation/ref-manual/migration.rst b/documentation/ref-manual/migration.rst
index 8d64a7d..a01d4ee 100644
--- a/documentation/ref-manual/migration.rst
+++ b/documentation/ref-manual/migration.rst
@@ -28,4 +28,5 @@ notes for a given release.
    migration-3.0
    migration-3.1
    migration-3.2
+   migration-3.3
 
-- 
1.8.3.1

