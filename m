Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.4586.1600196814720395820
 for <docs@lists.yoctoproject.org>;
 Tue, 15 Sep 2020 12:06:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mark.morton@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 08FJ6Crn013605
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <docs@lists.yoctoproject.org>; Tue, 15 Sep 2020 12:06:43 -0700
Received: from san-mmorton-lx1.corp.ad.wrs.com (147.11.4.21) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Tue, 15 Sep 2020 12:06:22 -0700
From: "Mark Morton" <Mark.Morton@windriver.com>
To: <docs@lists.yoctoproject.org>
Subject: [PATCH] Updated codeblocks and links part 2 for consistency, minor edits
Date: Tue, 15 Sep 2020 12:01:12 -0700
Message-ID: <20200915190112.16269-1-mark.morton@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by mail5.wrs.com id 08FJ6Crn013605
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Mark Morton <mark.morton@windriver.com>
---
 .../test-manual/test-manual-intro.rst         | 31 +++++++++----------
 .../test-manual-understand-autobuilder.rst    | 18 +++++------
 2 files changed, 22 insertions(+), 27 deletions(-)

diff --git a/documentation/test-manual/test-manual-intro.rst b/documentat=
ion/test-manual/test-manual-intro.rst
index d68ab73f4..62e23a297 100644
--- a/documentation/test-manual/test-manual-intro.rst
+++ b/documentation/test-manual/test-manual-intro.rst
@@ -27,14 +27,14 @@ loaded with information from the README files and not=
es from key
 engineers:
=20
 -  *yocto-autobuilder2:* This
-   `README.md <http://git.yoctoproject.org/clean/cgit.cgi/yocto-autobuil=
der2/tree/README.md>`__
+   :yocto-git:`README.md </cgit.cgi/yocto-autobuilder2/tree/README.md>`
    is the main README which detials how to set up the Yocto Project
    Autobuilder. The ``yocto-autobuilder2`` repository represents the
    Yocto Project's console UI plugin to Buildbot and the configuration
    necessary to configure Buildbot to perform the testing the project
    requires.
=20
--  *yocto-autobuilder-helper:* This `README <http://git.yoctoproject.org=
/clean/cgit.cgi/yocto-autobuilder-helper/tree/README/>`__
+-  *yocto-autobuilder-helper:* This :yocto-git:`README </cgit.cgi/yocto-=
autobuilder-helper/tree/README/>`
    and repository contains Yocto Project Autobuilder Helper scripts and
    configuration. The ``yocto-autobuilder-helper`` repository contains
    the "glue" logic that defines which tests to run and how to run them.
@@ -65,9 +65,9 @@ that the Yocto Project customizes using code from the
 resulting UI plug-in allows you to visualize builds in a way suited to
 the project's needs.
=20
-A helper layer provides configuration and job management through
+A ``helper`` layer provides configuration and job management through
 scripts found in the ``yocto-autobuilder-helper`` repository. The
-helper layer contains the bulk of the build configuration
+``helper`` layer contains the bulk of the build configuration
 information and is release-specific, which makes it highly customizable
 on a per-project basis. The layer is CI system-agnostic and contains a
 number of Helper scripts that can generate build configurations from
@@ -137,10 +137,8 @@ thefollowing types of tests:
=20
    $ bitbake image -c testimage=20
   =20
-   The tests utilize the
-   :ref:`testimage* <ref-classes-testimage*>`
-   classes and the
-   :ref:`ref-tasks-testimage` task.
+   The tests utilize the :ref:`testimage* <ref-classes-testimage*>`
+   classes and the :ref:`ref-tasks-testimage` task.
=20
 -  *Layer Testing:* The Autobuilder has the possibility to test whether
    specific layers work with the test of the system. The layers tested
@@ -155,9 +153,11 @@ thefollowing types of tests:
    ":yocto_wiki:`Ptest </wiki/Ptest>`" Wiki page for more
    information on Ptest.
=20
--  *SDK Testing:* Image tests initiated through the following command: $
-   bitbake image -c testsdk The tests utilize the
-   :ref:`testsdk <ref-classes-testsdk>` class and
+-  *SDK Testing:* Image tests initiated through the following command::=20
+
+   $ bitbake image -c testsdk=20
+  =20
+   The tests utilize the :ref:`testsdk <ref-classes-testsdk>` class and
    the ``do_testsdk`` task.
=20
 -  *Unit Testing:* Unit tests on various components of the system run
@@ -253,12 +253,9 @@ Tests map into the codebase as follows:
    -  These tests build an image, boot it, and run tests against the
       image's content.
=20
-   -  The code for these tests resides in
-      ``meta/lib/oeqa/runtime/cases/``.
+   -  The code for these tests resides in ``meta/lib/oeqa/runtime/cases/=
``.
=20
-   -  You need to set the
-      :term:`IMAGE_CLASSES`
-      variable as follows::
+   -  You need to set the :term:`IMAGE_CLASSES` variable as follows::
      =20
       IMAGE_CLASSES +=3D "testimage"
=20
@@ -321,7 +318,7 @@ Test Examples
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 This section provides example tests for each of the tests listed in the
-`How Tests Map to Areas of Code <#test-test-mapping>`__ section.
+:ref:`test-manual/test-manual-intro:How Tests Map to Areas of Code` sect=
ion.
=20
 For oeqa tests, testcases for each area reside in the main test
 directory at ``meta/lib/oeqa/selftest/cases`` directory.
diff --git a/documentation/test-manual/test-manual-understand-autobuilder=
.rst b/documentation/test-manual/test-manual-understand-autobuilder.rst
index 0d987d245..691e4de39 100644
--- a/documentation/test-manual/test-manual-understand-autobuilder.rst
+++ b/documentation/test-manual/test-manual-understand-autobuilder.rst
@@ -82,11 +82,11 @@ For each given target in a build, the Autobuilder exe=
cutes several
 steps. These are configured in ``yocto-autobuilder2/builders.py`` and
 roughly consist of:
=20
-1. *Run ``clobberdir``*
+1. *Run clobberdir*.
=20
    This cleans out any previous build. Old builds are left around to
    allow easier debugging of failed builds. For additional information,
-   see :ref:`test-clobberdir`.
+   see :ref:`test-manual/test-manual-understand-autobuilder:clobberdir`.
=20
 2. *Obtain yocto-autobuilder-helper*
=20
@@ -110,7 +110,7 @@ roughly consist of:
    from the ``layerinfo.json`` file to help understand the
    configuration. It will also use a local cache of repositories to
    speed up the clone checkouts. For additional information, see
-   :ref:`test-autobuilder-clone-cache`.
+   :ref:`test-manual/test-manual-understand-autobuilder:Autobuilder Clon=
e Cache`.
=20
    This step has two possible modes of operation. If the build is part
    of a parent build, its possible that all the repositories needed may
@@ -153,7 +153,7 @@ special script that moves files to a special location=
, rather than
 deleting them. Files in this location are deleted by an ``rm`` command,
 which is run under ``ionice -c 3``. For example, the deletion only
 happens when there is idle IO capacity on the Worker. The Autobuilder
-Worker Janitor runs this deletion. See :ref:`test-autobuilder-worker-jan=
itor`.
+Worker Janitor runs this deletion. See :ref:`test-manual/test-manual-und=
erstand-autobuilder:Autobuilder Worker Janitor`.
=20
 .. _test-autobuilder-clone-cache:
=20
@@ -165,8 +165,7 @@ on the Autobuilder. We therefore have a stash of comm=
only used
 repositories pre-cloned on the Workers. Data is fetched from these
 during clones first, then "topped up" with later revisions from any
 upstream when necesary. The cache is maintained by the Autobuilder
-Worker Janitor. See :ref:`Autobuilder Worker
-Janitor`.
+Worker Janitor. See :ref:`test-manual/test-manual-understand-autobuilder=
:Autobuilder Worker Janitor`.
=20
 .. _test-autobuilder-worker-janitor:
=20
@@ -174,8 +173,7 @@ Autobuilder Worker Janitor
 --------------------------
=20
 This is a process running on each Worker that performs two basic
-operations, including background file deletion at IO idle (see Target
-Execution: clobberdir :ref:`test-list-tgt-exec-clobberdir`) and
+operations, including background file deletion at IO idle (see :ref:`tes=
t-manual/test-manual-understand-autobuilder:Autobuilder Target Execution =
Overview`: Run clobberdir) and
 maintainenance of a cache of cloned repositories to improve the speed
 the system can checkout repositories.
=20
@@ -196,7 +194,7 @@ Shared SSTATE_DIR
=20
 The Workers are all connected over NFS which allows the ``sstate``
 directory to be shared between them. This means once a Worker has built
-an artefact, all the others can benefit from it. Usage of the directory
+an artifact, all the others can benefit from it. Usage of the directory
 within the directory is designed for sharing over NFS.
=20
 .. _test-resulttool:
@@ -263,7 +261,7 @@ of post-build steps, including:
    generated to the remote server.
=20
 4. Cleanup the build directory using
-   :ref:`test-clobberdir` if the build was successful,
+   :ref:`test-manual/test-manual-understand-autobuilder:clobberdir` if t=
he build was successful,
    else rename it to =E2=80=9Cbuild-renamed=E2=80=9D for potential futur=
e debugging.
=20
 .. _test-deploying-yp-autobuilder:
--=20
2.17.1

