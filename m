Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01BF5C3A589
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 09:24:44 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.4277.1665393876871503044
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 02:24:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=osUwOk0Q;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 739EE20EC33F; Mon, 10 Oct 2022 02:24:36 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 739EE20EC33F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1665393876;
	bh=5Fm3cvWyt1UVzs7H+XCdz47e2HtrQGaVDAHom+b+l1o=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=osUwOk0QDRyFLi9wMIB33ktzONcjLwV+Me+LmTqlG+k3hztmXiqG54VT3v6/03jpZ
	 JjvGJky2Mu3nt9cB9kECr21VmCd2w1TX44VublsO1AjfCdeOzMSq34/jl5B9RxP8FU
	 MZqnh88UQLNMSDKrIjfx75my73TUhvDonliRVhbs=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 14/34] ref-manual: add pypi class
Date: Mon, 10 Oct 2022 02:24:00 -0700
Message-Id: 
 <724a266846bef0af109ff0e5740217008f85872b.1665392835.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
References: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Oct 2022 09:24:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3314

From: Paul Eggleton <paul.eggleton@microsoft.com>

Add missing documentation for the pypi class.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/classes.rst   | 14 ++++++++++++++
 documentation/ref-manual/variables.rst |  8 ++++++++
 2 files changed, 22 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index d94db03..f6bbee5 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -2005,6 +2005,20 @@ When inherited by a recipe, the ``perlnative`` class supports using the
 native version of Perl built by the build system rather than using the
 version provided by the build host.
 
+.. _ref-classes-pypi:
+
+``pypi.bbclass``
+================
+
+The ``pypi`` class sets variables appropriately for recipes that build
+Python modules from `PyPI <https://pypi.org/>`__, the Python Package Index.
+By default it determines the PyPI package name based upon BPN (stripping the
+"python-" or "python3-" prefix off if present), however in some cases you may
+need to set it manually in the recipe by setting :term:`PYPI_PACKAGE`.
+
+Variables set by the ``pypi`` class include :term:`SRC_URI`, :term:`SECTION`,
+:term:`HOMEPAGE`, :term:`UPSTREAM_CHECK_URI`, and :term:`UPSTREAM_CHECK_REGEX`.
+
 .. _ref-classes-python_flit_core:
 
 ``python_flit_core.bbclass``
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index e4304d1..ceb6b0e 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6219,6 +6219,14 @@ system and gives an overview of their function and contents.
 
       :term:`PV` is the default value of the :term:`PKGV` variable.
 
+   :term:`PYPI_PACKAGE`
+      When inheriting the :ref:`pypi <ref-classes-pypi>` class, specifies the
+      `PyPI <https://pypi.org/>`__ package name to be built. The default value
+      is set based upon :term:`BPN` (stripping any "python-" or "python3-"
+      prefix off if present), however for some packages it will need to be set
+      explicitly if that will not match the package name (e.g. where the
+      package name has a prefix, underscores, uppercase letters etc.)
+
    :term:`PYTHON_ABI`
       When used by recipes that inherit the
       :ref:`setuptools3 <ref-classes-setuptools3>` class, denotes the
-- 
1.8.3.1


