Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web09.2170.1603847917886966492
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Oct 2020 18:18:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=jIFseIvv;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 63C7B20B36E7; Tue, 27 Oct 2020 18:18:37 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 63C7B20B36E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1603847917;
	bh=vv5EUQwA/6Z9PTmA6JX5UwVmCCQD6TVjb/Znxl132cc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jIFseIvvIL828nMkmBbAfdOqKw/Pu1A31O4W7GtdPNGV0vc0j0y/Ik1BAuIuOZy/5
	 LTtp7chNsGFFo6IPmGxLXNiL8ycVxzrrhLy/eZkdgy8z1CJmnU80f2gY5BsK+HeL5A
	 nlOUCJPo8g4BAAqpGjujID+7mkLBB4P9NGdbgx10=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 2/7] ref-manual: fix for features_check class change
Date: Tue, 27 Oct 2020 18:18:30 -0700
Message-Id: <091a23d7231445d4a2f12ccc86454f75a084892b.1603839557.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1603839557.git.paul.eggleton@linux.microsoft.com>
References: <cover.1603839557.git.paul.eggleton@linux.microsoft.com>

From: Paul Eggleton <paul.eggleton@microsoft.com>

distro_features_check was renamed to features_check and extended to
support MACHINE_FEATURES, COMBINED_FEATURES and ANY_OF_*_FEATURES in
dunfell, but the documentation still needed to be updated.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/ref-classes.rst   | 41 +++++++++++++++++++-----------
 documentation/ref-manual/ref-variables.rst | 26 ++++++++++++++-----
 2 files changed, 46 insertions(+), 21 deletions(-)

diff --git a/documentation/ref-manual/ref-classes.rst b/documentation/ref-manual/ref-classes.rst
index 028729f..249b58e 100644
--- a/documentation/ref-manual/ref-classes.rst
+++ b/documentation/ref-manual/ref-classes.rst
@@ -501,21 +501,6 @@ Support for other version control systems such as Subversion is limited
 due to BitBake's automatic fetch dependencies (e.g.
 ``subversion-native``).
 
-.. _ref-classes-distro_features_check:
-
-``distro_features_check.bbclass``
-=================================
-
-The ``distro_features_check`` class allows individual recipes to check
-for required and conflicting
-:term:`DISTRO_FEATURES`.
-
-This class provides support for the
-:term:`REQUIRED_DISTRO_FEATURES` and
-:term:`CONFLICT_DISTRO_FEATURES`
-variables. If any conditions specified in the recipe using the above
-variables are not met, the recipe will be skipped.
-
 .. _ref-classes-distutils:
 
 ``distutils*.bbclass``
@@ -656,6 +641,32 @@ Finally, here is an example that sets the root password to "1876*18":
        usermod -P 1876*18 root; \
        "
 
+.. _ref-classes-features_check:
+
+``features_check.bbclass``
+=================================
+
+The ``features_check`` class allows individual recipes to check
+for required and conflicting
+:term:`DISTRO_FEATURES`, :term:`MACHINE_FEATURES` or :term:`COMBINED_FEATURES`.
+
+This class provides support for the following variables:
+
+- :term:`REQUIRED_DISTRO_FEATURES`
+- :term:`CONFLICT_DISTRO_FEATURES`
+- :term:`ANY_OF_DISTRO_FEATURES`
+- ``REQUIRED_MACHINE_FEATURES``
+- ``CONFLICT_MACHINE_FEATURES``
+- ``ANY_OF_MACHINE_FEATURES``
+- ``REQUIRED_COMBINED_FEATURES``
+- ``CONFLICT_COMBINED_FEATURES``
+- ``ANY_OF_COMBINED_FEATURES``
+
+If any conditions specified in the recipe using the above
+variables are not met, the recipe will be skipped, and if the
+build system attempts to build the recipe then an error will be
+triggered.
+
 .. _ref-classes-fontcache:
 
 ``fontcache.bbclass``
diff --git a/documentation/ref-manual/ref-variables.rst b/documentation/ref-manual/ref-variables.rst
index 0603ba9..a7315cf 100644
--- a/documentation/ref-manual/ref-variables.rst
+++ b/documentation/ref-manual/ref-variables.rst
@@ -132,6 +132,18 @@ system and gives an overview of their function and contents.
       ":ref:`update-alternatives.bbclass <ref-classes-update-alternatives>`"
       section.
 
+   :term:`ANY_OF_DISTRO_FEATURES`
+      When inheriting the
+      :ref:`features_check <ref-classes-features_check>`
+      class, this variable identifies a list of distribution features where
+      at least one must be enabled in the current configuration in order
+      for the OpenEmbedded build system to build the recipe. In other words,
+      if none of the features listed in ``ANY_OF_DISTRO_FEATURES``
+      appear in ``DISTRO_FEATURES`` within the current configuration, then
+      the recipe will be skipped, and if the build system attempts to build
+      the recipe then an error will be triggered.
+      
+
    :term:`APPEND`
       An override list of append strings for each target specified with
       :term:`LABELS`.
@@ -1300,12 +1312,13 @@ system and gives an overview of their function and contents.
 
    :term:`CONFLICT_DISTRO_FEATURES`
       When inheriting the
-      :ref:`distro_features_check <ref-classes-distro_features_check>`
+      :ref:`features_check <ref-classes-features_check>`
       class, this variable identifies distribution features that would be
       in conflict should the recipe be built. In other words, if the
       ``CONFLICT_DISTRO_FEATURES`` variable lists a feature that also
-      appears in ``DISTRO_FEATURES`` within the current configuration, an
-      error occurs and the build stops.
+      appears in ``DISTRO_FEATURES`` within the current configuration, then
+      the recipe will be skipped, and if the build system attempts to build
+      the recipe then an error will be triggered.
 
    :term:`COPYLEFT_LICENSE_EXCLUDE`
       A space-separated list of licenses to exclude from the source
@@ -6122,13 +6135,14 @@ system and gives an overview of their function and contents.
 
    :term:`REQUIRED_DISTRO_FEATURES`
       When inheriting the
-      :ref:`distro_features_check <ref-classes-distro_features_check>`
+      :ref:`features_check <ref-classes-features_check>`
       class, this variable identifies distribution features that must exist
       in the current configuration in order for the OpenEmbedded build
       system to build the recipe. In other words, if the
       ``REQUIRED_DISTRO_FEATURES`` variable lists a feature that does not
-      appear in ``DISTRO_FEATURES`` within the current configuration, an
-      error occurs and the build stops.
+      appear in ``DISTRO_FEATURES`` within the current configuration, then
+      the recipe will be skipped, and if the build system attempts to build
+      the recipe then an error will be triggered.
 
    :term:`RM_WORK_EXCLUDE`
       With ``rm_work`` enabled, this variable specifies a list of recipes
-- 
1.8.3.1

