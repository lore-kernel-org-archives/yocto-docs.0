Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.6082.1618359599635864188
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Apr 2021 17:19:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=XCj5qns0;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 23DF920B83DB; Tue, 13 Apr 2021 17:19:56 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 23DF920B83DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1618359597;
	bh=3vjopC/EYzasOZ71plR8jDoxFCf69rJHZ4QQi3DuKac=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=XCj5qns0oAZJVIbqAAMOVgAa1H6Xy3YxctRCa7DMF3+Ji/MjNR4gFLI0FmhmLQaEk
	 Gzt8f6oCtDbSgKFqkQA5JmHrL8Xsmtp9XHlkrPVXYNZOlNGgH7eBdfEOYMwvSHzeTP
	 2ftWgeaWXZNbd/Vg1JQxDHy1Jjyy37AydPwuwyxM=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 06/13] ref-manual: add REQUIRED_VERSION and adjust PREFERRED_VERSION entry
Date: Tue, 13 Apr 2021 17:19:47 -0700
Message-Id: <9a02215494bae33c57e9fd7f6924e995713c7b1c.1618358456.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1618358456.git.paul.eggleton@linux.microsoft.com>
References: <cover.1618358456.git.paul.eggleton@linux.microsoft.com>

From: Paul Eggleton <paul.eggleton@microsoft.com>

Add REQUIRED_VERSION, add a reference to it in PREFERRED_VERSION and
adjust the opening statement to read slightly better.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/variables.rst | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index ef61339..a97f858 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5798,10 +5798,10 @@ system and gives an overview of their function and contents.
          exclusive alternative providers.
 
    :term:`PREFERRED_VERSION`
-      If multiple versions of recipes exist, this variable determines which
-      version is given preference. You must always suffix the variable with
-      the :term:`PN` you want to select, and you should set the
-      :term:`PV` accordingly for precedence.
+      If there are multiple versions of a recipe available, this variable
+      determines which version should be given preference. You must always
+      suffix the variable with the :term:`PN` you want to select, and you
+      should set the :term:`PV` accordingly for precedence.
 
       The ``PREFERRED_VERSION`` variable supports limited wildcard use
       through the "``%``" character. You can use the character to match any
@@ -5859,6 +5859,10 @@ system and gives an overview of their function and contents.
          The ``\_forcevariable`` override is not handled specially. This override
          only works because the default value of ``OVERRIDES`` includes "forcevariable".
 
+      If a recipe with the specified version is not available, a warning
+      message will be shown. See :term:`REQUIRED_VERSION` if you want this
+      to be an error instead.
+
    :term:`PREMIRRORS`
       Specifies additional paths from which the OpenEmbedded build system
       gets source code. When the build system searches for source code, it
@@ -6216,6 +6220,16 @@ system and gives an overview of their function and contents.
       the recipe will be skipped, and if the build system attempts to build
       the recipe then an error will be triggered.
 
+   :term:`REQUIRED_VERSION`
+      If there are multiple versions of a recipe available, this variable
+      determines which version should be given preference. ``REQUIRED_VERSION``
+      works in exactly the same manner as :term:`PREFERRED_VERSION`, except
+      that if the specified version is not available then an error message
+      is shown and the build fails immediately.
+
+      If both ``REQUIRED_VERSION`` and ``PREFERRED_VERSION`` are set for
+      the same recipe, the ``REQUIRED_VERSION`` value applies.
+
    :term:`RM_WORK_EXCLUDE`
       With ``rm_work`` enabled, this variable specifies a list of recipes
       whose work directories should not be removed. See the
-- 
1.8.3.1

