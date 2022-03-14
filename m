Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BB8DC433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 17:07:55 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.28663.1647277674040672140
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Mar 2022 10:07:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A78AFD6E
	for <docs@lists.yoctoproject.org>; Mon, 14 Mar 2022 10:07:53 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 572813F66F
	for <docs@lists.yoctoproject.org>; Mon, 14 Mar 2022 10:07:53 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH] Update documentation for Python packaging changes
Date: Mon, 14 Mar 2022 17:07:50 +0000
Message-Id: <20220314170750.1858689-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 14 Mar 2022 17:07:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2603

A number of classes and variables have been renamed, so update the
documentation as needed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 documentation/ref-manual/classes.rst   | 45 ++++++++++++++++----------
 documentation/ref-manual/variables.rst | 28 ++++------------
 2 files changed, 35 insertions(+), 38 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-man=
ual/classes.rst
index cba9793332..ef869e4cc1 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -634,7 +634,7 @@ Python modules built with ``flit_core.buildapi`` are =
pure Python (no
 ``C`` or ``Rust`` extensions).
=20
 The resulting ``wheel`` (See `PEP-427 <https://www.python.org/dev/peps/p=
ep-0427/>`__)
-is installed with the :ref:`pip_install_wheel <ref-classes-pip_install_w=
heel>` class.
+is installed with the :ref:`python_pep517 <ref-classes-python_pep517>` c=
lass.
=20
 .. _ref-classes-fontcache:
=20
@@ -1996,25 +1996,20 @@ When inherited by a recipe, the ``perlnative`` cl=
ass supports using the
 native version of Perl built by the build system rather than using the
 version provided by the build host.
=20
-.. _ref-classes-pip_install_wheel:
+.. _ref-classes-python_pep517:
=20
-``pip_install_wheel.bbclass``
+``python_pep517.bbclass``
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
=20
-The ``pip_install_wheel`` class uses ``pip`` to install a Python ``wheel=
``
-binary archive format (See `PEP-427 <https://www.python.org/dev/peps/pep=
-0427/>`__)
+The ``python_pep517`` class installs a Python ``wheel`` binary archive (=
see
+`PEP-517 <https://peps.python.org/pep-0517/>`__).
=20
 The Python ``wheel`` can be built with several classes, including :ref:`=
flit_core <ref-classes-flit_core>`,
 :ref:`setuptools_build_meta <ref-classes-setuptools_build_meta>`, and :r=
ef:`setuptools3 <ref-classes-setuptools3>`.
=20
-The absolute path to the built ``wheel`` to be installed is defined by :=
term:`PYPA_WHEEL` which can be
-overriden for recipes where the filename or version number of the wheel =
are not easily
-determined by the defaults. Other variables which can be used to customi=
ze the behavior
-of the ``pip_install_wheel`` class include:
-
-- :term:`PIP_INSTALL_ARGS`
-- :term:`PIP_INSTALL_PACKAGE`
-- :term:`PIP_INSTALL_DIST_PATH`
+The path to the wheel to be installed is defined by :term:`PEP517_WHEEL_=
PATH`.
+This defaults to ``${D}/dist`` and should be respected by the builder cl=
ass
+(such as :ref:`flit_core <ref-classes-flit_core>`).
=20
 .. _ref-classes-pixbufcache:
=20
@@ -2386,7 +2381,7 @@ Python modules built with ``setuptools.build_meta``=
 can be pure Python or
 include ``C`` or ``Rust`` extensions).
=20
 The resulting ``wheel`` (See `PEP-427 <https://www.python.org/dev/peps/p=
ep-0427/>`__)
-is installed with the :ref:`pip_install_wheel <ref-classes-pip_install_w=
heel>` class.
+is installed with the :ref:`python_pep517 <ref-classes-python_pep517>` c=
lass.
=20
 .. _ref-classes-setuptools3:
=20
@@ -2411,9 +2406,25 @@ uses these build systems, the recipe needs to inhe=
rit the ``setuptools3`` class.
=20
    .. note::
=20
-     The ``setuptools3`` class ``do_install()`` task now calls ``pip ins=
tall``
-     to install the ``wheel`` binary archive. In current versions of
-     ``setuptools`` the legacy ``setup.py install`` method is deprecated=
.
+     The ``setuptools3`` class ``do_install()`` task now installs the ``=
wheel``
+     binary archive. In current versions of ``setuptools`` the legacy ``=
setup.py
+     install`` method is deprecated. If the ``setup.py`` cannot be used =
with
+     wheels, for example it creates files outside of the Python module o=
r
+     standard entry points, then :ref:`setuptools3_legacy
+     <ref-classes-setuptools3_legacy>` should be used.
+
+.. _ref-classes-setuptools3_legacy:
+
+``setuptools3_legacy.bbclass``
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
+
+The ``setuptools3_legacy`` class supports Python version 3.x extensions =
that use
+build systems based on ``setuptools`` (e.g. only have a ``setup.py`` and=
 have
+not migrated to the official ``pyproject.toml`` format). Unlike
+``setuptools3.bbclass``, this uses the traditional ``setup.py`` ``build`=
` and
+``install`` commands and not wheels. This use of ``setuptools`` like thi=
s is
+`deprecated <https://github.com/pypa/setuptools/blob/main/CHANGES.rst#v5=
830>`_
+but still relatively common.
=20
 .. _ref-classes-setuptools3-base:
=20
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
index 005456f0c4..d08e6cf0ec 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5569,6 +5569,12 @@ system and gives an overview of their function and=
 contents.
=20
       :term:`PE` is the default value of the :term:`PKGE` variable.
=20
+   :term:`PEP517_WHEEL_PATH`
+      When used by recipes that inherit the
+      :ref:`python_pep517 <ref-classes-python_pep517>` class,
+      denotes the path to ``dist/`` (short for distribution) where the
+      binary archive ``wheel`` is built.
+
    :term:`PF`
       Specifies the recipe or package name and includes all version and
       revision numbers (i.e. ``glibc-2.13-r20+svnr15508/`` and
@@ -5577,23 +5583,10 @@ system and gives an overview of their function an=
d contents.
=20
    :term:`PIP_INSTALL_ARGS`
       When used by recipes that inherit the
-      :ref:`pip_install_wheel <ref-classes-pip_install_wheel>` class,
+      :ref:`python_pep517 <ref-classes-python_pep517>` class,
       denotes the arguments passed to ``pip install`` to adjust the
       behavior of how the ``wheel`` is installed.
=20
-   :term:`PIP_INSTALL_DIST_PATH`
-      When used by recipes that inherit the
-      :ref:`pip_install_wheel <ref-classes-pip_install_wheel>` class,
-      denotes the path to ``dist/`` (short for distribution) where the
-      binary archive ``wheel`` is built. This is used in part to create
-      the :term:`PYPA_WHEEL` variable.
-
-   :term:`PIP_INSTALL_PACKAGE`
-      When used by recipes that inherit the
-      :ref:`pip_install_wheel <ref-classes-pip_install_wheel>` class,
-      denotes the name of the package portion of the ``wheel`` filename.
-      This is used in part to create the :term:`PYPA_WHEEL` variable.
-
    :term:`PIXBUF_PACKAGES`
       When inheriting the :ref:`pixbufcache <ref-classes-pixbufcache>`
       class, this variable identifies packages that contain the pixbuf
@@ -6021,13 +6014,6 @@ system and gives an overview of their function and=
 contents.
=20
       :term:`PV` is the default value of the :term:`PKGV` variable.
=20
-   :term:`PYPA_WHEEL`
-      When used by recipes that inherit the
-      :ref:`pip_install_wheel <ref-classes-pip_install_wheel>` class, de=
notes
-      the absolute path to the built ``wheel`` to be installed. Normally=
 the
-      defaults which use :term:`PIP_INSTALL_PACKAGE` and :term:`PIP_INST=
ALL_DIST_PATH`
-      to build the path to the ``wheel`` should be sufficient.
-
    :term:`PYTHON_ABI`
       When used by recipes that inherit the
       :ref:`setuptools3 <ref-classes-setuptools3>` class, denotes the
--=20
2.25.1


