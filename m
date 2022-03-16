Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DBFFC433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 18:33:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.381.1647455588420418452
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Mar 2022 11:33:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F403D1476
	for <docs@lists.yoctoproject.org>; Wed, 16 Mar 2022 11:33:07 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A46B83F766
	for <docs@lists.yoctoproject.org>; Wed, 16 Mar 2022 11:33:07 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH] classes: update Python class documentation
Date: Wed, 16 Mar 2022 18:33:05 +0000
Message-Id: <20220316183305.885500-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 16 Mar 2022 18:33:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2614

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 documentation/ref-manual/classes.rst | 61 ++++++++++++++++------------
 1 file changed, 36 insertions(+), 25 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-man=
ual/classes.rst
index 4dd0901623..60fcd98928 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -602,22 +602,6 @@ variables are not met, the recipe will be skipped, a=
nd if the
 build system attempts to build the recipe then an error will be
 triggered.
=20
-.. _ref-classes-flit_core:
-
-``flit_core.bbclass``
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-The ``flit_core`` class enables building Python modules which declare
-the  `PEP-517 <https://www.python.org/dev/peps/pep-0517/>`__ compliant
-``flit_core.buildapi`` ``build-backend`` in the ``[build-system]``
-section of ``pyproject.toml`` (See `PEP-518 <https://www.python.org/dev/=
peps/pep-0518/>`__).
-
-Python modules built with ``flit_core.buildapi`` are pure Python (no
-``C`` or ``Rust`` extensions).
-
-The resulting ``wheel`` (See `PEP-427 <https://www.python.org/dev/peps/p=
ep-0427/>`__)
-is installed with the :ref:`python_pep517 <ref-classes-python_pep517>` c=
lass.
-
 .. _ref-classes-fontcache:
=20
 ``fontcache.bbclass``
@@ -1978,20 +1962,48 @@ When inherited by a recipe, the ``perlnative`` cl=
ass supports using the
 native version of Perl built by the build system rather than using the
 version provided by the build host.
=20
+.. _ref-classes-python_flit_core:
+
+``python_flit_core.bbclass``
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+The ``python_flit_core`` class enables building Python modules which dec=
lare
+the  `PEP-517 <https://www.python.org/dev/peps/pep-0517/>`__ compliant
+``flit_core.buildapi`` ``build-backend`` in the ``[build-system]``
+section of ``pyproject.toml`` (See `PEP-518 <https://www.python.org/dev/=
peps/pep-0518/>`__).
+
+Python modules built with ``flit_core.buildapi`` are pure Python (no
+``C`` or ``Rust`` extensions).
+
+Internally this uses the :ref:`python_pep517 <ref-classes-python_pep517>=
` class.
+
 .. _ref-classes-python_pep517:
=20
 ``python_pep517.bbclass``
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
=20
-The ``python_pep517`` class installs a Python ``wheel`` binary archive (=
see
-`PEP-517 <https://peps.python.org/pep-0517/>`__).
+The ``python_pep517`` class builds and installs a Python ``wheel`` binar=
y
+archive (see `PEP-517 <https://peps.python.org/pep-0517/>`__).
+
+Recipes wouldn't inherit this directly, instead typically another class =
will
+inherit this, add the relevant native dependencies, and set
+:term:`PEP517_BUILD_API` to the Python class which implements the PEP-51=
7 build
+API.
+
+Examples of classes which do this are :ref:`python_flit_core
+<ref-classes-python_flit_core>`, :ref:`setuptools_build_meta
+<ref-classes-setuptools_build_meta>`, and :ref:`python_poetry_core
+<ref-classes-python_poetry_core>`.
+
+.. _ref-classes-python_poetry_core:
+
+``python_poetry_core.bbclass``
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
-The Python ``wheel`` can be built with several classes, including :ref:`=
flit_core <ref-classes-flit_core>`,
-:ref:`setuptools_build_meta <ref-classes-setuptools_build_meta>`, and :r=
ef:`setuptools3 <ref-classes-setuptools3>`.
+The ``python_poetry_core`` class enables building Python modules which u=
se the
+`Poetry Core <https://python-poetry.org>`__ build system.
=20
-The path to the wheel to be installed is defined by :term:`PEP517_WHEEL_=
PATH`.
-This defaults to ``${D}/dist`` and should be respected by the builder cl=
ass
-(such as :ref:`flit_core <ref-classes-flit_core>`).
+Internally this uses the :ref:`python_pep517 <ref-classes-python_pep517>=
` class.
=20
 .. _ref-classes-pixbufcache:
=20
@@ -2362,8 +2374,7 @@ section of ``pyproject.toml`` (See `PEP-518 <https:=
//www.python.org/dev/peps/pep
 Python modules built with ``setuptools.build_meta`` can be pure Python o=
r
 include ``C`` or ``Rust`` extensions).
=20
-The resulting ``wheel`` (See `PEP-427 <https://www.python.org/dev/peps/p=
ep-0427/>`__)
-is installed with the :ref:`python_pep517 <ref-classes-python_pep517>` c=
lass.
+Internally this uses the :ref:`python_pep517 <ref-classes-python_pep517>=
` class.
=20
 .. _ref-classes-setuptools3:
=20
--=20
2.25.1


