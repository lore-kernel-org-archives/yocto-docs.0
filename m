Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7C0BC4707E
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:51:59 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.3540.1650591648702699935
 for <docs@lists.yoctoproject.org>;
 Thu, 21 Apr 2022 18:40:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=pqhMvvyJ;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id E973020E658B; Thu, 21 Apr 2022 18:40:47 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E973020E658B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1650591647;
	bh=9BoXcvF4brZIgqZyZ3TxpEHwtx3BHlXCz4ACV6NRQXM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=pqhMvvyJV0GWrrGKzs9JJb5kHX9E+z91PrXdxckKZ03IvG/aZoGLpCh3Y+UBeobSa
	 G7/t23dngwh4OmovMNAskbjURWRy12Cv55LJxrIeb57AaNlB37p0rrftlNqOHfj+M7
	 NM8NtivTE/A+DXJlcZ13W2Ib+zisGpVppa3axPSg=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 8/9] migration-guides: complete migration guide for 4.0
Date: Thu, 21 Apr 2022 18:40:41 -0700
Message-Id: 
 <f0106e362d6b4b4e827c1aa8533511a3684df927.1650591341.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1650591341.git.paul.eggleton@linux.microsoft.com>
References: <cover.1650591341.git.paul.eggleton@linux.microsoft.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 Apr 2022 16:51:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2827

From: Paul Eggleton <paul.eggleton@microsoft.com>

* Make some corrections to preliminary set of entries
* Move out entries that were more appropriate for the release notes
  (i.e. that are more additions rather than changes that require the
  user to make changes)
* Add new entries based on commits in the kirkstone branch

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/migration-guides/migration-4.0.rst | 346 +++++++++++++++--------
 1 file changed, 221 insertions(+), 125 deletions(-)

diff --git a/documentation/migration-guides/migration-4.0.rst b/documentation/migration-guides/migration-4.0.rst
index 202999e..6725e25 100644
--- a/documentation/migration-guides/migration-4.0.rst
+++ b/documentation/migration-guides/migration-4.0.rst
@@ -1,61 +1,74 @@
 Release 4.0 (kirkstone)
 =======================
 
+Migration notes for 4.0 (kirkstone)
+-----------------------------------
+
 This section provides migration information for moving to the Yocto
 Project 4.0 Release (codename "kirkstone") from the prior release.
 
-Recipe changes
---------------
-
-- To use more `inclusive language <https://inclusivenaming.org/>`__
-  in the code and documentation, some variables have been renamed or even
-  deleted. BitBake will stop with an error when renamed or removed variables
-  still exist in your recipes or configuration.
-
-  Please note that the change applies also to environmental variables, so
-  make sure you use a fresh environment for your build.
-
-  The following variables have changed their names:
-
-  - ``BB_ENV_WHITELIST`` became :term:`BB_ENV_PASSTHROUGH`
-  - ``BB_ENV_EXTRAWHITE`` became :term:`BB_ENV_PASSTHROUGH_ADDITIONS`
-  - ``BB_HASHBASE_WHITELIST`` became :term:`BB_BASEHASH_IGNORE_VARS`
-  - ``BB_HASHCONFIG_WHITELIST`` became :term:`BB_HASHCONFIG_IGNORE_VARS`
-  - ``BB_HASHTASK_WHITELIST`` became ``BB_TASKHASH_IGNORE_TASKS``
-  - ``BB_SETSCENE_ENFORCE_WHITELIST`` became ``BB_SETSCENE_ENFORCE_IGNORE_TASKS``
-  - ``CVE_CHECK_PN_WHITELIST`` became :term:`CVE_CHECK_SKIP_RECIPE`
-  - ``CVE_CHECK_WHITELIST`` became :term:`CVE_CHECK_IGNORE`
-  - ``ICECC_USER_CLASS_BL`` became :term:`ICECC_CLASS_DISABLE`
-  - ``ICECC_SYSTEM_CLASS_BL`` became :term:`ICECC_CLASS_DISABLE`
-  - ``ICECC_USER_PACKAGE_WL`` became :term:`ICECC_RECIPE_ENABLE`
-  - ``ICECC_USER_PACKAGE_BL`` became :term:`ICECC_RECIPE_DISABLE`
-  - ``ICECC_SYSTEM_PACKAGE_BL`` became :term:`ICECC_RECIPE_DISABLE`
-  - ``LICENSE_FLAGS_WHITELIST`` became :term:`LICENSE_FLAGS_ACCEPTED`
-  - ``MULTI_PROVIDER_WHITELIST`` became :term:`BB_MULTI_PROVIDER_ALLOWED`
-  - ``PNBLACKLIST`` became :term:`SKIP_RECIPE`
-  - ``SDK_LOCAL_CONF_BLACKLIST`` became :term:`ESDK_LOCALCONF_REMOVE`
-  - ``SDK_LOCAL_CONF_WHITELIST`` became :term:`ESDK_LOCALCONF_ALLOW`
-  - ``SDK_INHERIT_BLACKLIST`` became :term:`ESDK_CLASS_INHERIT_DISABLE`
-  - ``SSTATE_DUPWHITELIST`` became ``SSTATE_ALLOW_OVERLAP_FILES``
-  - ``SYSROOT_DIRS_BLACKLIST`` became :term:`SYSROOT_DIRS_IGNORE`
-  - ``UNKNOWN_CONFIGURE_WHITELIST`` became :term:`UNKNOWN_CONFIGURE_OPT_IGNORE`
-
-  In addition, ``BB_STAMP_WHITELIST``, ``BB_STAMP_POLICY``, ``INHERIT_BLACKLIST``
-  and ``TUNEABI_WHITELIST`` have been removed.
-
-  Many internal variable names have been also renamed accordingly.
-
-  In addition, in the ``cve-check`` output, the CVE issue status ``Whitelisted``
-  has been renamed to ``Ignored``.
-
-  A :oe_git:`convert-variable-renames.py
-  </openembedded-core/tree/scripts/contrib/convert-variable-renames.py>`
-  script is provided to convert your recipes and configuration,
-  and also warns you about the use of problematic words. The script performs
-  changes and you need to review them before committing. An example warning
-  looks like::
-
-     poky/scripts/lib/devtool/upgrade.py needs further work at line 275 since it contains abort
+.. _migration-4.0-inclusive-language:
+
+Inclusive language improvements
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+To use more `inclusive language <https://inclusivenaming.org/>`__
+in the code and documentation, some variables have been renamed, and
+some have been deleted where they are no longer needed. In many cases the
+new names are also easier to understand. BitBake will stop with an error when
+renamed or removed variables still exist in your recipes or configuration.
+
+Please note that the change applies also to environmental variables, so
+make sure you use a fresh environment for your build.
+
+The following variables have changed their names:
+
+- ``BB_ENV_WHITELIST`` became :term:`BB_ENV_PASSTHROUGH`
+- ``BB_ENV_EXTRAWHITE`` became :term:`BB_ENV_PASSTHROUGH_ADDITIONS`
+- ``BB_HASHBASE_WHITELIST`` became :term:`BB_BASEHASH_IGNORE_VARS`
+- ``BB_HASHCONFIG_WHITELIST`` became :term:`BB_HASHCONFIG_IGNORE_VARS`
+- ``BB_HASHTASK_WHITELIST`` became ``BB_TASKHASH_IGNORE_TASKS``
+- ``BB_SETSCENE_ENFORCE_WHITELIST`` became ``BB_SETSCENE_ENFORCE_IGNORE_TASKS``
+- ``CVE_CHECK_PN_WHITELIST`` became :term:`CVE_CHECK_SKIP_RECIPE`
+- ``CVE_CHECK_WHITELIST`` became :term:`CVE_CHECK_IGNORE`
+- ``ICECC_USER_CLASS_BL`` became :term:`ICECC_CLASS_DISABLE`
+- ``ICECC_SYSTEM_CLASS_BL`` became :term:`ICECC_CLASS_DISABLE`
+- ``ICECC_USER_PACKAGE_WL`` became :term:`ICECC_RECIPE_ENABLE`
+- ``ICECC_USER_PACKAGE_BL`` became :term:`ICECC_RECIPE_DISABLE`
+- ``ICECC_SYSTEM_PACKAGE_BL`` became :term:`ICECC_RECIPE_DISABLE`
+- ``LICENSE_FLAGS_WHITELIST`` became :term:`LICENSE_FLAGS_ACCEPTED`
+- ``MULTI_PROVIDER_WHITELIST`` became :term:`BB_MULTI_PROVIDER_ALLOWED`
+- ``PNBLACKLIST`` became :term:`SKIP_RECIPE`
+- ``SDK_LOCAL_CONF_BLACKLIST`` became :term:`ESDK_LOCALCONF_REMOVE`
+- ``SDK_LOCAL_CONF_WHITELIST`` became :term:`ESDK_LOCALCONF_ALLOW`
+- ``SDK_INHERIT_BLACKLIST`` became :term:`ESDK_CLASS_INHERIT_DISABLE`
+- ``SSTATE_DUPWHITELIST`` became ``SSTATE_ALLOW_OVERLAP_FILES``
+- ``SYSROOT_DIRS_BLACKLIST`` became :term:`SYSROOT_DIRS_IGNORE`
+- ``UNKNOWN_CONFIGURE_WHITELIST`` became :term:`UNKNOWN_CONFIGURE_OPT_IGNORE`
+- ``WHITELIST_<license>`` became ``INCOMPATIBLE_LICENSE_EXCEPTIONS``
+
+In addition, ``BB_STAMP_WHITELIST``, ``BB_STAMP_POLICY``, ``INHERIT_BLACKLIST``,
+``TUNEABI``, ``TUNEABI_WHITELIST``, and ``TUNEABI_OVERRIDE`` have been removed.
+
+Many internal variable names have been also renamed accordingly.
+
+In addition, in the ``cve-check`` output, the CVE issue status ``Whitelisted``
+has been renamed to ``Ignored``.
+
+The :term:`BB_DISKMON_DIRS` variable value now uses the term ``HALT``
+instead of ``ABORT``.
+
+A :oe_git:`convert-variable-renames.py
+</openembedded-core/tree/scripts/contrib/convert-variable-renames.py>`
+script is provided to convert your recipes and configuration,
+and also warns you about the use of problematic words. The script performs
+changes and you need to review them before committing. An example warning
+looks like::
+
+    poky/scripts/lib/devtool/upgrade.py needs further work at line 275 since it contains abort
+    
+Fetching changes
+~~~~~~~~~~~~~~~~
 
 - Because of the uncertainty in future default branch names in git repositories,
   it is now required to add a branch name to all URLs described
@@ -70,7 +83,8 @@ Recipe changes
 - Because of `GitHub dropping support for the git:
   protocol <https://github.blog/2021-09-01-improving-git-protocol-security-github/>`__,
   recipes now need to use ``;protocol=https`` at the end of GitHub
-  URLs. The same script as above can be used to convert the recipes.
+  URLs. The same ``convert-srcuri`` script mentioned above can be used to convert
+  your recipes.
 
 - Network access from tasks is now disabled by default on kernels which support
   this feature (on most recent distros such as CentOS 8 and Debian 11 onwards).
@@ -84,87 +98,169 @@ Recipe changes
   usually undermines fetcher source mirroring, image and licence manifests, software
   auditing and supply chain security.
 
-- The :term:`TOPDIR` variable and the current working directory are no longer modified
-  when parsing recipes. Any code depending on that behaviour will no longer work.
-
-- The ``append``, ``prepend`` and ``remove`` operators can now only be combined with
-  ``=`` and ``:=`` operators. To the exception of the ``append`` plus ``+=`` and
-  ``prepend`` plus ``=+`` combinations, all combinations could be factored up to the
-  ``append``, ``prepend`` or ``remove`` in the combination. This brought a lot of
-  confusion on how the override style syntax operators work and should be used.
-  Therefore, those combinations can simply be replaced by a single ``append``,
-  ``prepend`` or ``remove`` operator without any additional change.
-  For the ``append`` plus ``+=`` (and ``prepend`` plus ``=+``) combinations,
-  the content should be prefixed (respectively suffixed) by a space to maintain
-  the same behavior.  You can learn more about override style syntax operators
-  (``append``, ``prepend`` and ``remove``) in the BitBake documentation:
-  :ref:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata:appending and prepending (override style syntax)`
-  and :ref:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata:removal (override style syntax)`.
+License changes
+~~~~~~~~~~~~~~~
 
-- :ref:`allarch <ref-classes-allarch>` packagegroups can no longer depend on packages
-  which use :term:`PKG` renaming such as :ref:`ref-classes-debian`.
+- The ambiguous "BSD" license has been removed from the ``common-licenses`` directory.
+  Each recipe that fetches or builds BSD-licensed code should specify the proper
+  version of the BSD license in its :term:`LICENSE` value.
 
-- :term:`LICENSE` definitions now have to use `SPDX identifiers <https://spdx.org/licenses/>`__.
-  A :oe_git:`convert-spdx-licenses.py </openembedded-core/tree/scripts/contrib/convert-spdx-licenses.py>`
+- :term:`LICENSE` variable values should now use `SPDX identifiers <https://spdx.org/licenses/>`__.
+  If they do not, by default a warning will be shown. A
+  :oe_git:`convert-spdx-licenses.py </openembedded-core/tree/scripts/contrib/convert-spdx-licenses.py>`
   script can be used to update your recipes.
-
-- :term:`SRC_URI`: a new :ref:`bitbake:bitbake-user-manual/bitbake-user-manual-fetching:crate fetcher (\`\`crate://\`\`)`
-  is available for Rust packages.
-
-Class changes
--------------
-
-- The ``distutils*.bbclasses`` have been moved to ``meta-python``. The classes and
-  `DISTUTILS*` variables have been removed from the documentation.
-
-- ``blacklist.bbclass`` is removed and the functionality moved to the
-  :ref:`base <ref-classes-base>` class with a more descriptive
-  ``varflag`` named :term:`SKIP_RECIPE` which will use the `SkipRecipe()`
-  function. The usage will remain the same::
-
-     SKIP_RECIPE[my-recipe] = "Reason for skipping recipe"
-
-- The Python package build process based on `wheels <https://pythonwheels.com/>`__.
+  
+- :term:`INCOMPATIBLE_LICENSE` should now use `SPDX identifiers <https://spdx.org/licenses/>`__.
+  Additionally, wildcarding is now limited to specifically supported values -
+  see the :term:`INCOMPATIBLE_LICENSE` documentation for further information.
+
+- The ``AVAILABLE_LICENSES`` variable has been removed. This variable was a performance
+  liability and is highly dependent on which layers are added to the configuration,
+  which can cause signature issues for users. In addition the ``available_licenses()``
+  function has been removed from the :ref:`license <ref-classes-license>` class as
+  it is no longer needed.
+  
+Removed recipes
+~~~~~~~~~~~~~~~
+
+The following recipes have been removed in this release:
+
+- ``dbus-test``: merged into main dbus recipe
+- ``libid3tag``: moved to meta-oe - no longer needed by anything in OE-Core
+- ``libportal``: moved to meta-gnome - no longer needed by anything in OE-Core
+- ``linux-yocto``: removed version 5.14 recipes (5.15 and 5.10 still provided)
+- ``python3-nose``: has not changed since 2016 upstream, and no longer needed by anything in OE-Core
+- ``rustfmt``: not especially useful as a standalone recipe
+
+Python changes
+~~~~~~~~~~~~~~
+     
+- ``distutils`` has been deprecated upstream in Python 3.10 and thus the ``distutils*``
+  classes have been moved to ``meta-python``. Recipes that inherit the ``distutils*``
+  classes should be updated to inherit ``setuptools*`` equivalents instead.
+  
+- The Python package build process is now based on `wheels <https://pythonwheels.com/>`__.
   Here are the new Python packaging classes that should be used:
-  :ref:`python-flit_core <ref-classes-python_flit_core>`,
-  :ref:`setuptools_python-build_meta <ref-classes-python_setuptools_build_meta>`
-  and :ref:`python_poetry_core <ref-classes-python_poetry_core>`.
-
-- ``image-prelink.bbclass`` class is removed.
-
-- New :ref:`overlayfs <ref-classes-overlayfs>` and
-  :ref:`overlayfs-etc <ref-classes-overlayfs-etc>` classes are available
-  to make it easier to overlay read-only filesystems (for example)
-  with `OverlayFS <https://en.wikipedia.org/wiki/OverlayFS>`__.
-
-Configuration changes
----------------------
-
-- The Yocto Project now allows to reuse Shared State from its autobuilder.
-  If the network connection between our server and your machine is faster
-  than you would build recipes, you can try to speed up your builds
-  by using such Share State and Hash Equivalence by setting::
-
-     BB_SIGNATURE_HANDLER = "OEEquivHash"
-     BB_HASHSERVE = "auto"
-     BB_HASHSERVE_UPSTREAM = "typhoon.yocto.io:8687"
-     SSTATE_MIRRORS ?= "file://.* https://sstate.yoctoproject.org/&YOCTO_DOC_VERSION;/PATH;downloadfilename=PATH"
+  :ref:`python_flit_core <ref-classes-python_flit_core>`,
+  :ref:`python_setuptools_build_meta <ref-classes-python_setuptools_build_meta>`
+  and :ref:`python_poetry_core <ref-classes-python_poetry_core>`.  
+
+- The :ref:`setuptools3 <ref-classes-setuptools3>` class ``do_install()`` task now
+  installs the ``wheel`` binary archive. In current versions of ``setuptools`` the
+  legacy ``setup.py install`` method is deprecated. If the ``setup.py`` cannot be used
+  with wheels, for example it creates files outside of the Python module or standard
+  entry points, then :ref:`setuptools3_legacy <ref-classes-setuptools3_legacy>` should
+  be used instead.
+
+Prelink removed
+~~~~~~~~~~~~~~~
+
+Prelink has been dropped by ``glibc`` upstream in 2.36. It already caused issues with
+binary corruption, has a number of open bugs and is of questionable benefit
+without disabling load address randomization and PIE executables.
+    
+We disabled prelinking by default in the honister (3.4) release, but left it able
+to be enabled if desired. However, without glibc support it cannot be maintained
+any further, so all of the prelinking functionality has been removed in this release.
+If you were enabling the ``image-prelink`` class in :term:`INHERIT`, :term:`IMAGE_CLASSES`,
+:term:`USER_CLASSES` etc in your configuration, then you will need to remove the
+reference(s).
+
+Reproducible as standard
+~~~~~~~~~~~~~~~~~~~~~~~~
+
+Reproducibility is now considered as standard functionality, thus the 
+``reproducible`` class has been removed and its previous contents merged into the
+:ref:`base <ref-classes-base>` class. If you have references in your configuration to
+``reproducible`` in :term:`INHERIT`, :term:`USER_CLASSES` etc. then they should be
+removed.
+
+Additionally, the ``BUILD_REPRODUCIBLE_BINARIES`` variable is no longer used.
+Specifically for the kernel, if you wish to enable build timestamping functionality
+that is normally disabled for reproducibility reasons, you can do so by setting
+a new :term:`KERNEL_DEBUG_TIMESTAMPS` variable to "1".
 
 Supported host distribution changes
------------------------------------
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-- New support for `AlmaLinux <https://en.wikipedia.org/wiki/AlmaLinux>`__
+- Support for `AlmaLinux <https://en.wikipedia.org/wiki/AlmaLinux>`__
   hosts replacing `CentOS <https://en.wikipedia.org/wiki/CentOS>`__.
   The following distribution versions were dropped: CentOS 8, Ubuntu 16.04 and Fedora 30, 31 and 32.
 
-Changes for release notes
--------------------------
-
-- Share State cache: now using `ZStandard (zstd) <https://en.wikipedia.org/wiki/Zstd>`__
-  instead of Gzip compression, for better performance.
-
-- BitBake has an improved ``setscene`` task display.
+- ``gcc`` version 7.5 is now required at minimum on the build host. For older
+  host distributions where this is not available, you can use the
+  ``buildtools-extended-tarball`` (easily installable using
+  ``scripts/install-buildtools``).
+
+_append/_prepend in combination with other operators
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The ``append``, ``prepend`` and ``remove`` operators can now only be combined with
+``=`` and ``:=`` operators. To the exception of the ``append`` plus ``+=`` and
+``prepend`` plus ``=+`` combinations, all combinations could be factored up to the
+``append``, ``prepend`` or ``remove`` in the combination. This brought a lot of
+confusion on how the override style syntax operators work and should be used.
+Therefore, those combinations should be replaced by a single ``append``,
+``prepend`` or ``remove`` operator without any additional change.
+For the ``append`` plus ``+=`` (and ``prepend`` plus ``=+``) combinations,
+the content should be prefixed (respectively suffixed) by a space to maintain
+the same behavior.  You can learn more about override style syntax operators
+(``append``, ``prepend`` and ``remove``) in the BitBake documentation:
+:ref:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata:appending and prepending (override style syntax)`
+and :ref:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata:removal (override style syntax)`.
+
+Miscellaneous changes
+~~~~~~~~~~~~~~~~~~~~~
+  
+- ``blacklist.bbclass`` is removed and the functionality moved to the
+  :ref:`base <ref-classes-base>` class with a more descriptive
+  ``varflag`` variable named :term:`SKIP_RECIPE` which will use the `bb.parse.SkipRecipe()`
+  function. The usage remains the same, for example::
 
-- This release fixes the reproducibility issues with ``rust-llvm`` and ``golang``.
-  Recipes in OpenEmbedded-Core are now fully reproducible.
+     SKIP_RECIPE[my-recipe] = "Reason for skipping recipe"
 
+- :ref:`allarch <ref-classes-allarch>` packagegroups can no longer depend on packages
+  which use :term:`PKG` renaming such as :ref:`ref-classes-debian`. Such packagegroups
+  recipes should be changed to avoid inheriting :ref:`allarch <ref-classes-allarch>`.
+
+- The ``lnr`` script has been removed. ``lnr`` implemented the same behaviour as `ln --relative --symbolic`,
+  since at the time of creation `--relative` was only available in coreutils 8.16
+  onwards which was too new for the older supported distros. Current supported host
+  distros have a new enough version of coreutils, so it is no longer needed. If you have
+  any calls to ``lnr`` in your recipes or classes, they should be replaced with
+  `ln --relative --symbolic` or `ln -rs` if you prefer the short version.
+
+- The ``package_qa_handle_error()`` function formerly in the :ref:`insane <ref-classes-insane>`
+  class has been moved and renamed - if you have any references in your own custom
+  classes they should be changed to ``oe.qa.handle_error()``.
+
+- When building ``perl``, Berkeley db support is no longer enabled by default, since
+  Berkeley db is largely obsolete. If you wish to reenable it, you can append ``bdb``
+  to :term:`PACKAGECONFIG` in a ``perl`` bbappend or ``PACKAGECONFIG:pn-perl`` at
+  the configuration level.
+
+- For the ``xserver-xorg`` recipe, the ``xshmfence``, ``xmlto`` and ``systemd`` options
+  previously supported in :term:`PACKAGECONFIG` have been removed, as they are no
+  longer supported since the move from building it with autotools to meson in this release.
+
+- For the ``libsdl2`` recipe, various X11 features are now disabled by default (primarily
+  for reproducibility purposes in the native case) with options in :term:`EXTRA_OECMAKE`
+  within the recipe. These can be changed within a bbappend if desired. See the
+  ``libsdl2`` recipe for more details.
+
+- The ``cortexa72-crc`` and ``cortexa72-crc-crypto`` tunes have been removed since
+  the crc extension is now enabled by default for cortexa72. Replace any references to
+  these with ``cortexa72`` and ``cortexa72-crypto`` respectively.
+  
+- The Python development shell (previously known as ``devpyshell``) feature has been
+  renamed to ``pydevshell``. To start it you should now run::
+
+     bitbake <target> -c pydevshell
+
+- The ``packagegroups-core-full-cmdline-libs`` packagegroup is no longer produced, as
+  libraries should normally be brought in via dependencies. If you have any references
+  to this then remove them.
+  
+- The :term:`TOPDIR` variable and the current working directory are no longer modified
+  when parsing recipes. Any code depending on the previous behaviour will no longer
+  work - change any such code to explicitly use appropriate path variables instead.
-- 
1.8.3.1


