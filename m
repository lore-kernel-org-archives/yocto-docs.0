Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.4764.1618480756777368687
 for <docs@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 02:59:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=JQyOupDk;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 06D5020B87C2; Thu, 15 Apr 2021 02:59:15 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 06D5020B87C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1618480756;
	bh=nvIDB7irVu2ls5qJnlwVARA/a0NDn90GfhW6r8hizMo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=JQyOupDkVUxnmwuYR/4kk9MtIwe2QxzCZnwkGEMUhap/Kz8VN+9+MQ4R01EowEqIe
	 bJehIQqaACxNsWXCk8XQYOv8sVDn9zlRKpuePxlTWzellUQ6ySbUMuQXWg2BXl/Zw0
	 tmRerNKMxY4T4zX8dwjNXB3GFJb9L1vWOeG6Hn4s=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH v2 14/14] ref-manual: add mention of DISTUTILS_SETUP_PATH
Date: Thu, 15 Apr 2021 02:59:12 -0700
Message-Id: <7ff88e25ab0c53a59c89b4ef54813a6ade861a17.1618480508.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1618480508.git.paul.eggleton@linux.microsoft.com>
References: <cover.1618480508.git.paul.eggleton@linux.microsoft.com>

From: Paul Eggleton <paul.eggleton@microsoft.com>

Add a variable glossary entry and corresponding 3.3 migration
section entry for DISTUTILS_SETUP_PATH.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/migration-3.3.rst | 29 +++++++++++++++++++++++++++++
 documentation/ref-manual/variables.rst     | 13 +++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/documentation/ref-manual/migration-3.3.rst b/documentation/ref-manual/migration-3.3.rst
index db1619e..4fb51a3 100644
--- a/documentation/ref-manual/migration-3.3.rst
+++ b/documentation/ref-manual/migration-3.3.rst
@@ -74,6 +74,35 @@ Some example recipes where this change has been made: ``gpgme``, ``libcap-ng``,
 ``python3-pycairo``.
 
 
+.. _migration-3.3-distutils-path:
+
+``setup.py`` path for python modules
+------------------------------------
+
+In a Python module, sometimes ``setup.py`` can be buried deep in the
+source tree. Previously this was handled in recipes by setting :term:`S` to
+point to the subdirectory within the source where ``setup.py`` is located.
+However with the recent :ref:`pseudo <overview-manual/concepts:fakeroot and pseudo>`
+changes, some Python modules make changes to files beneath ``${S}``, for
+example::
+
+   S = "${WORKDIR}/git/python/pythonmodule"
+
+then in ``setup.py`` it works with source code in a relative fashion, such
+as ``../../src``. This causes pseudo to abort as it isn't able to track
+the paths properly. This release introduces a new :term:`DISTUTILS_SETUP_PATH`
+variable so that recipes can specify it explicitly, for example::
+
+   S = "${WORKDIR}/git"
+   DISTUTILS_SETUP_PATH = "${S}/python/pythonmodule"
+
+Recipes that inherit from :ref:`distutils3 <ref-classes-distutils3>` (or
+:ref:`setuptools3 <ref-classes-setuptools3>` which itself inherits
+:ref:`distutils3 <ref-classes-distutils3>`) that also set :term:`S` to
+point to a Python module within a subdirectory in the aforementioned
+manner should be changed to set :term:`DISTUTILS_SETUP_PATH` instead.
+
+
 .. _migration-3.3-bitbake:
 
 BitBake changes
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index aab062b..ea0fa2d 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1978,6 +1978,19 @@ system and gives an overview of their function and contents.
       is included in the default value of
       :term:`OVERRIDES`.
 
+   :term:`DISTUTILS_SETUP_PATH`
+      When used by recipes that inherit the
+      :ref:`distutils3 <ref-classes-distutils3>` or
+      :ref:`setuptools3 <ref-classes-setuptools3>` class, this variable should
+      be used to specify the directory in which the ``setup.py`` file is
+      located if it is not at the root of the source tree (as specified by
+      :term:`S`). For example, in a recipe where the sources are fetched from
+      a Git repository and ``setup.py`` is in a ``python/pythonmodule``
+      subdirectory, you would have this::
+
+         S = "${WORKDIR}/git"
+         DISTUTILS_SETUP_PATH = "${S}/python/pythonmodule"
+
    :term:`DL_DIR`
       The central download directory used by the build process to store
       downloads. By default, ``DL_DIR`` gets files suitable for mirroring
-- 
1.8.3.1

