Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD469C433FE
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 03:58:04 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.7232.1633924683540962690
 for <docs@lists.yoctoproject.org>;
 Sun, 10 Oct 2021 20:58:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=BgQOHkA8;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 0074C20B8799; Sun, 10 Oct 2021 20:58:02 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 0074C20B8799
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1633924683;
	bh=EFPtyRS2u4Rblu68JyBn8ydFnJ/auIweBpKM3lupBdw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=BgQOHkA8dfZkXQHjd0jWhGf64Gjw1oOheDwBsFz0IMWoXCkibzqf0Y798UluLl/3C
	 dH5c4ZiRanE/3hqzOVKnbsmjm2Bobq/0A6vtfsisXujLk2Ag+5aOLlmz7+zHfQydqD
	 2uMgVS+4gdYp/njimdFvZWdIv0623Ej0k5BOrDIs=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 4/5] migration-3.4: add additional migration info
Date: Sun, 10 Oct 2021 20:57:56 -0700
Message-Id: 
 <129dc5bafa57d3dda6794565ba3fb0065fb5865a.1633924455.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1633924455.git.paul.eggleton@linux.microsoft.com>
References: <cover.1633924455.git.paul.eggleton@linux.microsoft.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 11 Oct 2021 03:58:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1982

From: Paul Eggleton <paul.eggleton@microsoft.com>

Add migration instructions gathered by combing the commits in this
release.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/migration-guides/migration-3.4.rst | 176 +++++++++++++++++++++++
 1 file changed, 176 insertions(+)

diff --git a/documentation/migration-guides/migration-3.4.rst b/documentation/migration-guides/migration-3.4.rst
index 3df5b69..4d656e8 100644
--- a/documentation/migration-guides/migration-3.4.rst
+++ b/documentation/migration-guides/migration-3.4.rst
@@ -85,3 +85,179 @@ with other syntax improvements and simplifications for usability. It also means
 BitBake no longer has to guess and maintain large lookup lists just in case
 e.g. ``functionname`` in ``my_functionname`` is an override, and thus should improve
 efficiency.
+
+
+New host dependencies
+---------------------
+
+The ``lz4c``, ``pzstd`` and ``zstd`` commands are now required to be
+installed on the build host to support LZ4 and Zstandard compression
+functionality. These are typically provided by ``lz4`` and ``zstd``
+packages in most Linux distributions. Alternatively they are available
+as part of ``buildtools-tarball`` if your distribution does not provide
+them. For more information see
+:ref:`ref-manual/system-requirements:required packages for the build host`.
+
+
+Removed recipes
+---------------
+
+The following recipes have been removed in this release:
+
+- ``assimp``: problematic from a licensing perspective and no longer
+  needed by anything else
+- ``clutter-1.0``: legacy component moved to meta-gnome
+- ``clutter-gst-3.0``: legacy component moved to meta-gnome
+- ``clutter-gtk-1.0``: legacy component moved to meta-gnome
+- ``cogl-1.0``: legacy component moved to meta-gnome
+- ``core-image-clutter``: removed along with clutter
+- ``linux-yocto``: removed version 5.4 recipes (5.14 and 5.10 still
+  provided)
+- ``mklibs-native``: not actively tested and upstream mklibs still
+  requires Python 2
+- ``mx-1.0``: obsolete (last release 2012) and isn't used by anything in
+  any known layer
+- ``packagegroup-core-clutter``: removed along with clutter
+
+
+Removed classes
+---------------
+
+- ``clutter``: moved to meta-gnome along with clutter itself
+- ``image-mklibs``: not actively tested and upstream mklibs still
+  requires Python 2
+- ``meta``: no longer useful. Recipes that need to skip installing
+  packages should inherit ``nopackages`` instead.
+
+
+Prelinking disabled by default
+------------------------------
+
+Recent tests have shown that prelinking works only when PIE is not
+enabled (see `here <https://rlbl.me/prelink-1>`__ and `here <https://rlbl.me/prelink-2>`__),
+and as PIE is both a desirable security feature, and the only
+configuration provided and tested by the Yocto Project, there is
+simply no sense in continuing to enable prelink.
+
+There's also a concern that no one is maintaining the code, and there
+are open bugs (including `this serious one <https://bugzilla.yoctoproject.org/show_bug.cgi?id=14429>`__).
+Given that prelink does intricate address arithmetic and rewriting
+of binaries the best option is to disable the feature. It is recommended
+that you consider disabling this feature in your own configuration if
+it is currently enabled.
+
+
+Virtual runtime provides
+------------------------
+
+Recipes shouldn't use the ``virtual/`` string in :term:`RPROVIDES` and
+:term:`RDEPENDS` - it is confusing because ``virtual/`` has no special
+meaning in :term:`RPROVIDES` and :term:`RDEPENDS` (unlike in the
+corresponding build-time :term:`PROVIDES` and :term:`DEPENDS`).
+
+
+Tune files moved to architecture-specific directories
+-----------------------------------------------------
+
+The tune files found in ``conf/machine/include`` have now been moved
+into their respective architecture name directories under that same
+location; e.g. x86 tune files have moved into an ``x86`` subdirectory,
+MIPS tune files have moved into a ``mips`` subdirectory, etc.
+The ARM tunes have an extra level (``armv8a``, ``armv8m``, etc.) and
+some have been renamed to make them uniform with the rest of the tunes.
+See `this commit <http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=1d381f21f5f13aa0c4e1a45683ed656ebeedd37d>`__
+for reference.
+
+If you have any references to tune files (e.g. in custom machine
+configuration files) they will need to be updated.
+
+
+Extensible SDK host extension
+-----------------------------
+
+For a normal SDK, some layers append to :term:`TOOLCHAIN_HOST_TASK`
+unconditionally which is fine, until the eSDK tries to override the
+variable to its own values. Instead of installing packages specified
+in this variable it uses native recipes instead - a very different
+approach. This has led to confusing errors when binaries are added
+to the SDK but not relocated.
+
+To avoid these issues, a new ``TOOLCHAIN_HOST_TASK_ESDK`` variable has
+been created. If you wish to extend what is installed in the host
+portion of the eSDK then you will now need to set this variable.
+
+
+Package/recipe splitting
+------------------------
+
+- ``perl-cross`` has been split out from the main ``perl`` recipe to
+  its own ``perlcross`` recipe for maintenance reasons. If you have
+  bbappends for the perl recipe then these may need extending.
+
+- The ``wayland`` recipe now packages its binaries in a
+  ``wayland-tools`` package rather than putting them into
+  ``wayland-dev``.
+
+- Xwayland has been split out of the xserver-xorg tree and thus is now
+  in its own ``xwayland`` recipe. If you need Xwayland in your image
+  then you may now need to add it explicitly.
+
+
+Image / SDK generation changes
+------------------------------
+
+- Recursive dependencies on the ``do_build`` task are now disabled when
+  building SDKs. These are generally not needed; in the unlikely event
+  that you do encounter problems then it will probably be as a result of
+  missing explicit dependencies that need to be added.
+
+- Errors during "complementary" package installation (e.g. for ``*-dbg``
+  and ``*-dev`` packages) during image construction are no longer
+  ignored. Historically some of these packages had installation problems,
+  that is no longer the case. In the unlikely event that you see errors
+  as a result, you will need to fix the installation/packaging issues.
+
+- When building an image, only packages that will be used in building
+  the image (i.e. the first entry in :term:`PACKAGE_CLASSES`) will be
+  produced if multiple package types are enabled (which is not a typical
+  configuration). If in your CI system you need to have the original
+  behaviour, use ``bitbake --runall build <target>``.
+
+- The ``-lic`` package is no longer automacally added to
+  :term:`RRECOMMENDS` for every other package when
+  :term:`LICENSE_CREATE_PACKAGE` is set to "1". If you wish all license
+  packages to be installed corresponding to packages in your image, then
+  you should instead add the new ``lic-pkgs`` feature to
+  :term:`IMAGE_FEATURES`.
+
+
+Miscellaneous
+-------------
+
+- Certificates are now properly checked when bitbake fetches sources
+  over HTTPS. If you receive errors as a result for your custom recipes,
+  you will need to use a mirror or address the issue with the operators
+  of the server in question.
+
+- ``avahi`` has had its GTK+ support disabled by default. If you wish to
+  re-enable it, set ``AVAHI_GTK = "gtk3"`` in a bbappend for the
+  ``avahi`` recipe or in your custom distro configuration file.
+
+- Setting the ``BUILD_REPRODUCIBLE_BINARIES`` variable to "0" no longer
+  uses a strangely old fallback date of April 2011, it instead disables
+  building reproducible binaries as you would logically expect.
+
+- Setting noexec/nostamp/fakeroot varflags to any value besides "1" will
+  now trigger a warning. These should be either set to "1" to enable, or
+  not set at all to disable.
+
+- The previously deprecated ``COMPRESS_CMD`` and
+  ``CVE_CHECK_CVE_WHITELIST`` variables have been removed. Use
+  ``CONVERSION_CMD`` and :term:`CVE_CHECK_WHITELIST` respectively
+  instead.
+
+- The obsolete ``oe_machinstall`` function previously provided in the
+  :ref:`utils <ref-classes-utils>` class has been removed. For
+  machine-specific installation it is recommended that you use the
+  built-in override support in the fetcher or overrides in general
+  instead.
-- 
1.8.3.1


