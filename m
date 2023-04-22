Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41D2DC7EE20
	for <webhook@archiver.kernel.org>; Sat, 22 Apr 2023 03:20:26 +0000 (UTC)
Received: from mail2.g23.pair.com (mail2.g23.pair.com [66.39.132.40])
 by mx.groups.io with SMTP id smtpd.web11.1298.1682133619179948090
 for <docs@lists.yoctoproject.org>;
 Fri, 21 Apr 2023 20:20:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 66.39.132.40, mailfrom: bluelightning@bluelightning.org)
Received: from mail2.g23.pair.com (localhost [127.0.0.1])
	by mail2.g23.pair.com (Postfix) with ESMTP id 94628E756B;
	Fri, 21 Apr 2023 23:20:18 -0400 (EDT)
Received: from linc.fritz.box (unknown [161.29.131.251])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mail2.g23.pair.com (Postfix) with ESMTPSA id C56B5E7656;
	Fri, 21 Apr 2023 23:20:17 -0400 (EDT)
From: Paul Eggleton <bluelightning@bluelightning.org>
To: docs@lists.yoctoproject.org
Cc: michael.opdenacker@bootlin.com
Subject: [PATCH 15/17] migration-guides: extend migration guide for 4.2
Date: Sat, 22 Apr 2023 15:19:51 +1200
Message-Id: <40a4ed6333162daf67a2294126eaff3596580cef.1682133339.git.bluelightning@bluelightning.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682133339.git.bluelightning@bluelightning.org>
References: <cover.1682133339.git.bluelightning@bluelightning.org>
MIME-Version: 1.0
X-Scanned-By: mailmunge 3.11 on 66.39.132.40
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 22 Apr 2023 03:20:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3866

* Reorder and extend existing info a little
* Add additional sections after combing through changes

Signed-off-by: Paul Eggleton <bluelightning@bluelightning.org>
---
 .../migration-guides/migration-4.2.rst        | 196 +++++++++++++++---
 1 file changed, 162 insertions(+), 34 deletions(-)

diff --git a/documentation/migration-guides/migration-4.2.rst b/documenta=
tion/migration-guides/migration-4.2.rst
index c2ec8af8a45..1db6fbca42e 100644
--- a/documentation/migration-guides/migration-4.2.rst
+++ b/documentation/migration-guides/migration-4.2.rst
@@ -9,22 +9,47 @@ Migration notes for 4.2 (mickledore)
 This section provides migration information for moving to the Yocto
 Project 4.2 Release (codename "mickledore") from the prior release.
=20
+.. _migration-4.2-supported-distributions:
+
+Supported distributions
+~~~~~~~~~~~~~~~~~~~~~~~
+
+This release supports running BitBake on new GNU/Linux distributions:
+
+-  Fedora 36 and 37
+-  AlmaLinux 8.7 and 9.1
+-  OpenSuse 15.4
+
+On the other hand, some earlier distributions are no longer supported:
+
+-  Debian 10.x
+-  Fedora 34 and 35
+-  AlmaLinux 8.5
+
+See :ref:`all supported distributions <system-requirements-supported-dis=
tros>`.
+
 .. _migration-4.2-python-3.8:
=20
 Python 3.8 is now the minimum required Python version version
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=20
-BitBake and OpenEmbedded-Core are now relying on Python 3.8,
+BitBake and OpenEmbedded-Core now require Python 3.8 or newer,
 making it a requirement to use a distribution providing at least this
-version, or to use :term:`buildtools`.
+version, or to install a :term:`buildtools` tarball.
=20
 .. _migration-4.2-gcc-8.0:
=20
-gcc 8.0 is now the minumum required GNU C compiler version
+gcc 8.0 is now the minimum required GNU C compiler version
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=20
 This version, released in 2018, is a minimum requirement
-to build the ``mesa-native`` recipe.
+to build the ``mesa-native`` recipe and as the latter is in the
+default dependency chain when building QEMU this has now been
+made a requirement for all builds.
+
+In the event that your host distribution does not provide this
+or a newer version of gcc, you can install a
+:term:`buildtools-extended` tarball.
=20
 .. _migration-4.2-new-nvd-api:
=20
@@ -48,7 +73,7 @@ Here are minor changes that you may notice:
 Rust: mandatory checksums for crates
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=20
-This release now supports checksums for Rust crates and make
+This release now supports checksums for Rust crates and makes
 them mandatory for each crate in a recipe. See :yocto_git:`python3_bcryp=
t recipe changes
 </poky/commit/?h=3Dmickledore&id=3D0dcb5ab3462fdaaf1646b05a00c7150eea711=
a9a>`
 for example.
@@ -66,25 +91,6 @@ follow these steps:
 #.  Copy and paste the output of BitBake about the missing checksums int=
o the
     ``${BPN}-crates.inc`` file.
=20
-.. _migration-4.2-supported-distributions:
-
-Supported distributions
-~~~~~~~~~~~~~~~~~~~~~~~
-
-This release supports running BitBake on new GNU/Linux distributions:
-
--  Fedora 36 and 37
--  AlmaLinux 8.7 and 9.1
--  OpenSuse 15.4
-
-On the other hand, some earlier distributions are no longer supported:
-
--  Debian 10.x
--  Fedora 34 and 35
--  AlmaLinux 8.5
-
-See :ref:`all supported distributions <system-requirements-supported-dis=
tros>`.
-
=20
 .. _migration-4.2-addpylib:
=20
@@ -107,15 +113,6 @@ make modules available for use sooner than the curre=
nt BBPATH-based approach.
 For more information, see :ref:`bitbake-user-manual/bitbake-user-manual-=
metadata:extending python library code`.
=20
=20
-.. _migration-4.2-misc-changes:
-
-Miscellaneous changes
-~~~~~~~~~~~~~~~~~~~~~
-
--  The ``OEBasic`` signature handler (see :term:`BB_SIGNATURE_HANDLER`) =
has been
-   removed.
- =20
-
 .. _migration-4.2-removed-variables:
=20
 Removed variables
@@ -124,6 +121,10 @@ Removed variables
 The following variables have been removed:
=20
 -  ``SERIAL_CONSOLE``, deprecated since version 2.6, replaced by :term:`=
SERIAL_CONSOLES`.
+-  ``PACKAGEBUILDPKGD``, a mostly internal variable in the ref:`ref-clas=
ses-package`
+   class was rarely used to customise packaging. If you were using this =
in your custom
+   recipes or bbappends, you will need to switch to using :term:`PACKAGE=
_PREPROCESS_FUNCS`
+   or :term:`PACKAGESPLITFUNCS` instead.
=20
 .. _migration-4.2-removed-recipes:
=20
@@ -136,6 +137,8 @@ The following recipes have been removed in this relea=
se:
 -  ``python3-strict-rfc3339``: unmaintained and not needed by anything i=
n
    :oe_git:`openembedded-core </openembedded-core>`
    or :oe_git:`meta-openembedded </meta-openembedded>`.
+-  ``linux-yocto``: removed version 5.19 recipes (6.1 and 5.15 still pro=
vided)
+
=20
 .. _migration-4.2-removed-classes:
=20
@@ -144,5 +147,130 @@ Removed classes
=20
 The following classes have been removed in this release:
=20
--  ``rust-bin``: no longer used in Poky
+-  ``rust-bin``: no longer used
+-  ``package_tar``: could not be used for actual packaging, and thus not=
 particularly useful.
+
+
+LAYERSERIES_COMPAT for custom layers and devtool workspace
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Some layer maintainers have been setting :term:`LAYERSERIES_COMPAT` in t=
heir
+layer's ``conf/layer.conf`` to the value of ``LAYERSERIES_CORENAMES`` to
+effectively bypass the compatibility check - this is no longer permitted=
.
+Layer maintainers should set :term:`LAYERSERIES_COMPAT` appropriately to
+help users understand the compatibility status of the layer.
+
+Additionally, the :term:`LAYERSERIES_COMPAT` value for the devtool works=
pace
+layer is now set at the time of creation, thus if you upgrade with the
+workspace layer enabled and you wish to retain it, you will need to manu=
ally
+update the :term:`LAYERSERIES_COMPAT` value in ``workspace/conf/layer.co=
nf``
+(or remove the path from :term:`BBLAYERS` in ``conf/bblayers.conf`` and
+delete/move the ``workspace`` directory out of the way if you no longer
+need it).
=20
+
+.. _migration-4.2-runqemu-slirp:
+
+runqemu now limits slirp host port forwarding to localhost
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+With default slirp port forwarding configuration in runqemu, qemu
+previously listened on TCP ports 2222 and 2323 on all IP addresses
+available on the build host. Most use cases with runqemu only need
+it for localhost and it is not safe to run qemu images with root
+login without password enabled and listening on all available,
+possibly Internet reachable network interfaces. Thus, in this
+release we limit qemu port forwarding to localhost (127.0.0.1).
+
+However, if you need the qemu machine to be reachable from the
+network, then it can be enabled via ``conf/local.conf`` or machine
+config variable ``QB_SLIRP_OPT``::
+
+   QB_SLIRP_OPT =3D "-netdev user,id=3Dnet0,hostfwd=3Dtcp::2222-:22"
+
+
+.. _migration-4.2-patch-qa:
+
+Patch QA checks
+~~~~~~~~~~~~~~~
+
+The QA checks for patch fuzz and Upstream-Status have been reworked
+slightly in this release. The Upstream-Status checking is now configurab=
le
+from :term:`WARN_QA` / :term:`ERROR_QA` (``patch-status-core`` for the
+core layer, and ``patch-status-noncore`` for other layers).
+
+The ``patch-fuzz`` and ``patch-status-core`` checks are now in the defau=
lt
+value of :term:`ERROR_QA` so that they will cause the build to fail
+if triggered. If you prefer to avoid this you will need to adjust the va=
lue
+of :term:`ERROR_QA` in your configuration as desired.
+
+
+.. _migration-4.2-mesa:
+
+Native/nativesdk mesa usage and graphics drivers
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+This release includes mesa 23.0, and with that mesa release it is not lo=
nger
+possible to use drivers from the host system, as mesa upstream has added=
 strict
+checks for matching builds between drivers and libraries that load them.
+
+This is particularly relevant when running QEMU built within the build
+system. A check has been added to runqemu so that there is a helpful err=
or
+when there is no native/nativesdk opengl/virgl support available.
+
+To support this, a number of drivers have been enabled when building ``m=
esa-native``.
+The one major dependency pulled in by this change is ``llvm-native`` whi=
ch will
+add a few minutes to the build on a modern machine. If this is undesirab=
le, you
+can set the value of :term:`DISTRO_FEATURES_NATIVE` in your configuratio=
n such
+that ``opengl`` is excluded.
+
+
+.. _migration-4.2-misc-changes:
+
+Miscellaneous changes
+~~~~~~~~~~~~~~~~~~~~~
+
+-  The :term:`IMAGE_NAME` variable is now set based on :term:`IMAGE_LINK=
_NAME`. This
+   means that if you are setting :term:`IMAGE_LINK_NAME` to "" to disabl=
e unversioned
+   image symlink creation, you also now need to set :term:`IMAGE_NAME` t=
o still have
+   a reasonable value e.g.::
+
+      IMAGE_LINK_NAME =3D ""
+      IMAGE_NAME =3D "${IMAGE_BASENAME}${IMAGE_MACHINE_SUFFIX}${IMAGE_VE=
RSION_SUFFIX}"
+
+-  In ``/etc/os-release``, the ``VERSION_CODENAME`` field is now used in=
stead of
+   ``DISTRO_CODENAME`` (though its value is still set from the :term:`DI=
STRO_CODENAME`
+   variable) for better conformance to standard os-release usage. If you=
 have runtime
+   code reading this from ``/etc/os-release`` it may need to be updated.
+
+-  The kmod recipe now enables OpenSSL support by default in order to su=
pport module
+   signing. If you do not need this and wish to reclaim some space/avoid=
 the dependency
+   you should set :term:`PACKAGECONFIG` in a kmod bbappend (or ``PACKAGE=
CONFIG:pn-kmod``
+   at the configuration level) to exclude ``openssl``.
+
+-  The ``OEBasic`` signature handler (see :term:`BB_SIGNATURE_HANDLER`) =
has been
+   removed. It is unlikely that you would have selected to use this, but=
 if you have
+   you will need to remove this setting.
+
+-  The :ref:`ref-classes-package` class now checks if package names conf=
lict via
+   ``PKG:${PN}`` override during ``do_package``. If you receive the asso=
ciated error
+   you will need to address the :term:`PKG` usage so that the conflict i=
s resolved.
+
+-  openssh no longer uses :term:`RRECOMMENDS` to pull in ``rng-tools``, =
since rngd
+   is no longer needed as of Linux kernel 5.6. If you still need ``rng-t=
ools``
+   installed for other reasons, you should add ``rng-tools`` explicitly =
to your
+   image. If you additionally need rngd to be started as a service you w=
ill also
+   need to add the ``rng-tools-service`` package as that has been split =
out.
+
+-  The cups recipe no longer builds with the web interface enabled, savi=
ng ~1.8M of
+   space in the final image. If you wish to enable it, you should set
+   :term:`PACKAGECONFIG` in a cups bbappend (or ``PACKAGECONFIG:pn-cups`=
` at the
+   configuration level) to include ``webif``.
+
+-  The :ref:`ref-classes-scons` class now passes a ``MAXLINELENGTH`` arg=
ument to
+   scons in order to fix an issue with scons and command line lengths wh=
en ccache is
+   enabled. However, some recipes may be using older scons versions whic=
h don't support
+   this argument. If that is the case you can set the following in the r=
ecipe in order
+   to disable this::
+
+      SCONS_MAXLINELENGTH =3D ""
--=20
2.34.1


