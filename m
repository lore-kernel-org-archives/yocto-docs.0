Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.6097.1618359599770352551
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Apr 2021 17:19:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=WUSf6SkN;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 2EABD20B83E8; Tue, 13 Apr 2021 17:19:56 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 2EABD20B83E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1618359597;
	bh=84OE9IsSgqJcA390Iz1vii/MKe1g4EkpR7aBzyxhH8o=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=WUSf6SkNKaZWYh3kHU9Q0ykFX37VcXDHYVtmaLhcv/f2ALVBmUKfrxpiRVLOG4Xmf
	 2HmrqReVT/UXOZygxYnaOJSZmKfLQ8zppjGT1AWHf7JrVcmtaYTW6WL/BcNbE1NyKr
	 T//2tGwMCb+3Zn9s1VTahlNVnNUpsN3gkQJCHf1I=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 07/13] ref-manual: add python3targetconfig class and remove python 2 references
Date: Tue, 13 Apr 2021 17:19:48 -0700
Message-Id: <288eafdd13b6a66f33a81b60f25f540f33968a23.1618358456.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1618358456.git.paul.eggleton@linux.microsoft.com>
References: <cover.1618358456.git.paul.eggleton@linux.microsoft.com>

From: Paul Eggleton <paul.eggleton@microsoft.com>

Add the recently added python3targetconfig class. Also, we no longer
have the python 2 classes, remove all references to those.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/classes.rst       | 67 +++++++-----------------------
 documentation/ref-manual/migration-2.6.rst |  2 +-
 documentation/ref-manual/variables.rst     | 10 ++---
 3 files changed, 20 insertions(+), 59 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 6d9779f..52a50fa 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -501,29 +501,6 @@ Support for other version control systems such as Subversion is limited
 due to BitBake's automatic fetch dependencies (e.g.
 ``subversion-native``).
 
-.. _ref-classes-distutils:
-
-``distutils*.bbclass``
-======================
-
-The ``distutils*`` classes support recipes for Python version 2.x
-extensions, which are simple. These recipes usually only need to point
-to the source's archive and then inherit the proper class. Building is
-split into two methods depending on which method the module authors
-used.
-
--  Extensions that use an Autotools-based build system require Autotools
-   and the classes based on ``distutils`` in their recipes.
-
--  Extensions that use build systems based on ``distutils`` require the
-   ``distutils`` class in their recipes.
-
--  Extensions that use build systems based on ``setuptools`` require the
-   :ref:`setuptools <ref-classes-setuptools>` class in their recipes.
-
-The ``distutils-common-base`` class is required by some of the
-``distutils*`` classes to provide common Python2 support.
-
 .. _ref-classes-distutils3:
 
 ``distutils3*.bbclass``
@@ -542,15 +519,9 @@ used.
    ``distutils`` class in their recipes.
 
 -  Extensions that use build systems based on ``setuptools3`` require
-   the :ref:`setuptools3 <ref-classes-setuptools>` class in their
+   the :ref:`setuptools3 <ref-classes-setuptools3>` class in their
    recipes.
 
-The ``distutils3*`` classes either inherit their corresponding
-``distutils*`` class or replicate them using a Python3 version instead
-(e.g. ``distutils3-base`` inherits ``distutils-common-base``, which is
-the same as ``distutils-base`` but inherits ``python3native`` instead of
-``pythonnative``).
-
 .. _ref-classes-externalsrc:
 
 ``externalsrc.bbclass``
@@ -2138,13 +2109,13 @@ For information on setting up and running ptests, see the
 ":ref:`dev-manual/common-tasks:testing packages with ptest`"
 section in the Yocto Project Development Tasks Manual.
 
-.. _ref-classes-python-dir:
+.. _ref-classes-python3-dir:
 
-``python-dir.bbclass``
-======================
+``python3-dir.bbclass``
+=======================
 
-The ``python-dir`` class provides the base version, location, and site
-package location for Python.
+The ``python3-dir`` class provides the base version, location, and site
+package location for Python 3.
 
 .. _ref-classes-python3native:
 
@@ -2155,14 +2126,17 @@ The ``python3native`` class supports using the native version of Python
 3 built by the build system rather than support of the version provided
 by the build host.
 
-.. _ref-classes-pythonnative:
+.. _ref-classes-python3targetconfig:
 
-``pythonnative.bbclass``
-========================
+``python3targetconfig.bbclass``
+===============================
 
-When inherited by a recipe, the ``pythonnative`` class supports using
-the native version of Python built by the build system rather than using
-the version provided by the build host.
+The ``python3targetconfig`` class supports using the native version of Python
+3 built by the build system rather than support of the version provided
+by the build host, except that the configuration for the target machine
+is accessible (such as correct installation directories). This also adds a
+dependency on target ``python3``, so should only be used where appropriate
+in order to avoid unnecessarily lengthening builds.
 
 .. _ref-classes-qemu:
 
@@ -2323,22 +2297,13 @@ additional configuration options you want to pass SCons command line.
 The ``sdl`` class supports recipes that need to build software that uses
 the Simple DirectMedia Layer (SDL) library.
 
-.. _ref-classes-setuptools:
-
-``setuptools.bbclass``
-======================
-
-The ``setuptools`` class supports Python version 2.x extensions that use
-build systems based on ``setuptools``. If your recipe uses these build
-systems, the recipe needs to inherit the ``setuptools`` class.
-
 .. _ref-classes-setuptools3:
 
 ``setuptools3.bbclass``
 =======================
 
 The ``setuptools3`` class supports Python version 3.x extensions that
-use build systems based on ``setuptools3``. If your recipe uses these
+use build systems based on ``setuptools``. If your recipe uses these
 build systems, the recipe needs to inherit the ``setuptools3`` class.
 
 .. _ref-classes-sign_rpm:
diff --git a/documentation/ref-manual/migration-2.6.rst b/documentation/ref-manual/migration-2.6.rst
index 0517b0a..823d3cb 100644
--- a/documentation/ref-manual/migration-2.6.rst
+++ b/documentation/ref-manual/migration-2.6.rst
@@ -118,7 +118,7 @@ For names of recipes removed because of this repository change, see the
 ---------------------------------------------------------------------------------------------------
 
 Previously, it was possible for Python recipes that inherited the
-:ref:`distutils <ref-classes-distutils>` and
+``distutils`` and
 :ref:`distutils3 <ref-classes-distutils3>` classes to fetch code
 during the :ref:`ref-tasks-configure` task to satisfy
 dependencies mentioned in ``setup.py`` if those dependencies were not
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index a97f858..2e3cc22 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6029,9 +6029,7 @@ system and gives an overview of their function and contents.
    :term:`PYTHON_ABI`
       When used by recipes that inherit the
       :ref:`distutils3 <ref-classes-distutils3>`,
-      :ref:`setuptools3 <ref-classes-setuptools3>`,
-      :ref:`distutils <ref-classes-distutils>`, or
-      :ref:`setuptools <ref-classes-setuptools>` classes, denotes the
+      :ref:`setuptools3 <ref-classes-setuptools3>` classes, denotes the
       Application Binary Interface (ABI) currently in use for Python. By
       default, the ABI is "m". You do not have to set this variable as the
       OpenEmbedded build system sets it for you.
@@ -6040,16 +6038,14 @@ system and gives an overview of their function and contents.
       names used when installing the Python headers and libraries in
       sysroot (e.g. ``.../python3.3m/...``).
 
-      Recipes that inherit the ``distutils`` class during cross-builds also
+      Recipes that inherit the ``distutils3`` class during cross-builds also
       use this variable to locate the headers and libraries of the
       appropriate Python that the extension is targeting.
 
    :term:`PYTHON_PN`
       When used by recipes that inherit the
       `distutils3 <ref-classes-distutils3>`,
-      :ref:`setuptools3 <ref-classes-setuptools3>`,
-      :ref:`distutils <ref-classes-distutils>`, or
-      :ref:`setuptools <ref-classes-setuptools>` classes, specifies the
+      :ref:`setuptools3 <ref-classes-setuptools3>` classes, specifies the
       major Python version being built. For Python 3.x, ``PYTHON_PN`` would
       be "python3". You do not have to set this variable as the
       OpenEmbedded build system automatically sets it for you.
-- 
1.8.3.1

