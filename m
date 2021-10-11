Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 945CCC433EF
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 07:27:50 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.8641.1633937268763856789
 for <docs@lists.yoctoproject.org>;
 Mon, 11 Oct 2021 00:27:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.200,
 mailfrom: foss@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 401EF20011;
	Mon, 11 Oct 2021 07:27:44 +0000 (UTC)
Date: Mon, 11 Oct 2021 09:27:42 +0200
From: Quentin Schulz <foss@0leil.net>
To: docs@lists.yoctoproject.org,
 Paul Eggleton <paul.eggleton@linux.microsoft.com>
Subject: Re: [docs] [PATCH 4/5] migration-3.4: add additional migration info
In-Reply-To: 
 <129dc5bafa57d3dda6794565ba3fb0065fb5865a.1633924455.git.paul.eggleton@linux.microsoft.com>
References: <cover.1633924455.git.paul.eggleton@linux.microsoft.com>
 <129dc5bafa57d3dda6794565ba3fb0065fb5865a.1633924455.git.paul.eggleton@linux.microsoft.com>
Message-ID: <09A10548-4A44-4600-8561-BB4CDCA47DE9@0leil.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 11 Oct 2021 07:27:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1985

Hi Paul,

On October 11, 2021 5:57:56 AM GMT+02:00, Paul Eggleton <paul=2Eeggleton@l=
inux=2Emicrosoft=2Ecom> wrote:
>From: Paul Eggleton <paul=2Eeggleton@microsoft=2Ecom>
>
>Add migration instructions gathered by combing the commits in this
>release=2E
>
>Signed-off-by: Paul Eggleton <paul=2Eeggleton@microsoft=2Ecom>
>---
> documentation/migration-guides/migration-3=2E4=2Erst | 176 +++++++++++++=
++++++++++
> 1 file changed, 176 insertions(+)
>
>diff --git a/documentation/migration-guides/migration-3=2E4=2Erst b/docum=
entation/migration-guides/migration-3=2E4=2Erst
>index 3df5b69=2E=2E4d656e8 100644
>--- a/documentation/migration-guides/migration-3=2E4=2Erst
>+++ b/documentation/migration-guides/migration-3=2E4=2Erst
>@@ -85,3 +85,179 @@ with other syntax improvements and simplifications fo=
r usability=2E It also means
> BitBake no longer has to guess and maintain large lookup lists just in c=
ase
> e=2Eg=2E ``functionname`` in ``my_functionname`` is an override, and thu=
s should improve
> efficiency=2E
>+
>+
>+New host dependencies
>+---------------------
>+
>+The ``lz4c``, ``pzstd`` and ``zstd`` commands are now required to be
>+installed on the build host to support LZ4 and Zstandard compression
>+functionality=2E These are typically provided by ``lz4`` and ``zstd``
>+packages in most Linux distributions=2E Alternatively they are available
>+as part of ``buildtools-tarball`` if your distribution does not provide
>+them=2E For more information see
>+:ref:`ref-manual/system-requirements:required packages for the build hos=
t`=2E
>+
>+
>+Removed recipes
>+---------------
>+
>+The following recipes have been removed in this release:
>+
>+- ``assimp``: problematic from a licensing perspective and no longer
>+  needed by anything else
>+- ``clutter-1=2E0``: legacy component moved to meta-gnome
>+- ``clutter-gst-3=2E0``: legacy component moved to meta-gnome
>+- ``clutter-gtk-1=2E0``: legacy component moved to meta-gnome
>+- ``cogl-1=2E0``: legacy component moved to meta-gnome
>+- ``core-image-clutter``: removed along with clutter
>+- ``linux-yocto``: removed version 5=2E4 recipes (5=2E14 and 5=2E10 stil=
l
>+  provided)
>+- ``mklibs-native``: not actively tested and upstream mklibs still
>+  requires Python 2
>+- ``mx-1=2E0``: obsolete (last release 2012) and isn't used by anything =
in
>+  any known layer
>+- ``packagegroup-core-clutter``: removed along with clutter
>+
>+
>+Removed classes
>+---------------
>+
>+- ``clutter``: moved to meta-gnome along with clutter itself
>+- ``image-mklibs``: not actively tested and upstream mklibs still
>+  requires Python 2
>+- ``meta``: no longer useful=2E Recipes that need to skip installing
>+  packages should inherit ``nopackages`` instead=2E
>+
>+
>+Prelinking disabled by default
>+------------------------------
>+
>+Recent tests have shown that prelinking works only when PIE is not
>+enabled (see `here <https://rlbl=2Eme/prelink-1>`__ and `here <https://r=
lbl=2Eme/prelink-2>`__),
>+and as PIE is both a desirable security feature, and the only
>+configuration provided and tested by the Yocto Project, there is
>+simply no sense in continuing to enable prelink=2E
>+
>+There's also a concern that no one is maintaining the code, and there
>+are open bugs (including `this serious one <https://bugzilla=2Eyoctoproj=
ect=2Eorg/show_bug=2Ecgi?id=3D14429>`__)=2E
>+Given that prelink does intricate address arithmetic and rewriting
>+of binaries the best option is to disable the feature=2E It is recommend=
ed
>+that you consider disabling this feature in your own configuration if
>+it is currently enabled=2E
>+
>+
>+Virtual runtime provides
>+------------------------
>+
>+Recipes shouldn't use the ``virtual/`` string in :term:`RPROVIDES` and
>+:term:`RDEPENDS` - it is confusing because ``virtual/`` has no special
>+meaning in :term:`RPROVIDES` and :term:`RDEPENDS` (unlike in the
>+corresponding build-time :term:`PROVIDES` and :term:`DEPENDS`)=2E
>+
>+
>+Tune files moved to architecture-specific directories
>+-----------------------------------------------------
>+
>+The tune files found in ``conf/machine/include`` have now been moved
>+into their respective architecture name directories under that same
>+location; e=2Eg=2E x86 tune files have moved into an ``x86`` subdirector=
y,
>+MIPS tune files have moved into a ``mips`` subdirectory, etc=2E
>+The ARM tunes have an extra level (``armv8a``, ``armv8m``, etc=2E) and
>+some have been renamed to make them uniform with the rest of the tunes=
=2E
>+See `this commit <http://git=2Eyoctoproject=2Eorg/cgit/cgit=2Ecgi/poky/c=
ommit/?id=3D1d381f21f5f13aa0c4e1a45683ed656ebeedd37d>`__
>+for reference=2E
>+
>+If you have any references to tune files (e=2Eg=2E in custom machine
>+configuration files) they will need to be updated=2E
>+
>+
>+Extensible SDK host extension
>+-----------------------------
>+
>+For a normal SDK, some layers append to :term:`TOOLCHAIN_HOST_TASK`
>+unconditionally which is fine, until the eSDK tries to override the
>+variable to its own values=2E Instead of installing packages specified
>+in this variable it uses native recipes instead - a very different
>+approach=2E This has led to confusing errors when binaries are added
>+to the SDK but not relocated=2E
>+
>+To avoid these issues, a new ``TOOLCHAIN_HOST_TASK_ESDK`` variable has
>+been created=2E If you wish to extend what is installed in the host
>+portion of the eSDK then you will now need to set this variable=2E
>+
>+
>+Package/recipe splitting
>+------------------------
>+
>+- ``perl-cross`` has been split out from the main ``perl`` recipe to
>+  its own ``perlcross`` recipe for maintenance reasons=2E If you have
>+  bbappends for the perl recipe then these may need extending=2E
>+
>+- The ``wayland`` recipe now packages its binaries in a
>+  ``wayland-tools`` package rather than putting them into
>+  ``wayland-dev``=2E
>+
>+- Xwayland has been split out of the xserver-xorg tree and thus is now
>+  in its own ``xwayland`` recipe=2E If you need Xwayland in your image
>+  then you may now need to add it explicitly=2E
>+
>+
>+Image / SDK generation changes
>+------------------------------
>+
>+- Recursive dependencies on the ``do_build`` task are now disabled when
>+  building SDKs=2E These are generally not needed; in the unlikely event
>+  that you do encounter problems then it will probably be as a result of
>+  missing explicit dependencies that need to be added=2E
>+
>+- Errors during "complementary" package installation (e=2Eg=2E for ``*-d=
bg``
>+  and ``*-dev`` packages) during image construction are no longer
>+  ignored=2E Historically some of these packages had installation proble=
ms,
>+  that is no longer the case=2E In the unlikely event that you see error=
s
>+  as a result, you will need to fix the installation/packaging issues=2E
>+
>+- When building an image, only packages that will be used in building
>+  the image (i=2Ee=2E the first entry in :term:`PACKAGE_CLASSES`) will b=
e
>+  produced if multiple package types are enabled (which is not a typical
>+  configuration)=2E If in your CI system you need to have the original
>+  behaviour, use ``bitbake --runall build <target>``=2E
>+

I think we should also update the comment in the local=2Econf=2Esample and=
 local=2Econf=2Esample=2Eextended in meta-poky to reflect that=2E

https://git=2Eyoctoproject=2Eorg/cgit/cgit=2Ecgi/poky/tree/meta-poky/conf/=
local=2Econf=2Esample#n95

>+- The ``-lic`` package is no longer automacally added to

s/automacally/automatically/

Otherwise, looks good to me=2E Thanks for the patches!

Cheers,
Quentin

>+  :term:`RRECOMMENDS` for every other package when
>+  :term:`LICENSE_CREATE_PACKAGE` is set to "1"=2E If you wish all licens=
e
>+  packages to be installed corresponding to packages in your image, then
>+  you should instead add the new ``lic-pkgs`` feature to
>+  :term:`IMAGE_FEATURES`=2E
>+
>+
>+Miscellaneous
>+-------------
>+
>+- Certificates are now properly checked when bitbake fetches sources
>+  over HTTPS=2E If you receive errors as a result for your custom recipe=
s,
>+  you will need to use a mirror or address the issue with the operators
>+  of the server in question=2E
>+
>+- ``avahi`` has had its GTK+ support disabled by default=2E If you wish =
to
>+  re-enable it, set ``AVAHI_GTK =3D "gtk3"`` in a bbappend for the
>+  ``avahi`` recipe or in your custom distro configuration file=2E
>+
>+- Setting the ``BUILD_REPRODUCIBLE_BINARIES`` variable to "0" no longer
>+  uses a strangely old fallback date of April 2011, it instead disables
>+  building reproducible binaries as you would logically expect=2E
>+
>+- Setting noexec/nostamp/fakeroot varflags to any value besides "1" will
>+  now trigger a warning=2E These should be either set to "1" to enable, =
or
>+  not set at all to disable=2E
>+
>+- The previously deprecated ``COMPRESS_CMD`` and
>+  ``CVE_CHECK_CVE_WHITELIST`` variables have been removed=2E Use
>+  ``CONVERSION_CMD`` and :term:`CVE_CHECK_WHITELIST` respectively
>+  instead=2E
>+
>+- The obsolete ``oe_machinstall`` function previously provided in the
>+  :ref:`utils <ref-classes-utils>` class has been removed=2E For
>+  machine-specific installation it is recommended that you use the
>+  built-in override support in the fetcher or overrides in general
>+  instead=2E

