Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDABFCEDDB8
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 15:25:01 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.19647.1728487495763330343
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Oct 2024 08:24:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=XLyPuXgo;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 26DDC240007;
	Wed,  9 Oct 2024 15:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728487494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HLZQ4AJ6AhVJP7P2XPb1pMMarPiHYYEkRMty0FpCBnc=;
	b=XLyPuXgoWP0bW4oRSvfl6B5QzH48tgmgSmy4WZdN9ilB1MelfhSNWRH6Q6yB+ecINjlLpE
	hFBbZVJhRZh1tTzcYbISe661Kdt9O6UZgSTwai8t+BLQtbORCxO6ScbL4qFZoH3VXJmzu2
	9zOBGuhurOAeykoYRJMaxRnohqDOEK7DShgk3ClmD7WA6GpvqdywJimd+vp7yoAanDMVuN
	/i1AHLRUHpq1WY9jI3BxX7JPxdE7tz4LLF0dRZ3cUObh0NkL4v4YwVqYJnezkzpd5pcNSS
	sF5k56iCEvPc3EkaQnz0C8D81EpbTIXwM92dt5Seb1Ve+t20nS/M+v9kp3aoKA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 09 Oct 2024 17:24:11 +0200
Subject: [PATCH v2 03/16] ref-manual: add new retain class and variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241009-release-note-5-1-v2-3-7d484f7e7b6f@bootlin.com>
References: <20241009-release-note-5-1-v2-0-7d484f7e7b6f@bootlin.com>
In-Reply-To: <20241009-release-note-5-1-v2-0-7d484f7e7b6f@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>, 
 Paul Eggleton <paul.eggleton@microsoft.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3706;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=ryHE27ycjFTgnJUc90O3ELecvNsd6Vt2UvYcUMcnO/M=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnBqBD6v7ClME1eGpVzRuKHAm92UcMS6dYGMXIT
 IVQV5MTiqiJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZwagQwAKCRDRgEFAKaOo
 NobtEADFgq0uXCYO3aZT8Qo34nDeXgzf0wiuwQnIrF4nmbt7eh6m1RrKgNJrUWSM5eXbtCtOOHR
 5sIOcKxBRMTD9PTL5CFi1HYG1E7p+BQEl9l/p4pldJ7e8ZRQAxN+IvDRrOvbe06x/C20vZpqeLP
 ptBcc/8eC4nJDlL8ihnT7bqS7DRqYYIyWEJqWY7p/ZQP6DIU7qp/exoNQQYe+1A9FBCgHrknYXR
 ZV5wb2dEotJwZCbz0Ixq6XJ7lw8xad7FD5iLyQnNMkBvCz6HbLLcSNZzCW0M095UVEGwVbkDbUu
 ndY7CDcVqW9NTNhC85BgK3ej8waRxfIV9xqJAXjtzVfsjlmVTvkFSuESXfDLukhs59LtlMgX9i2
 eCJ1b3q4o8Xf5xSN3xhMB9O4HbPaeG4r4E13a/qytzfQo6b+uzTIXd6COSr18kHhU/z17JjeU1v
 sINyWN1zk0gke6cpr7xAjIrPjsBE4gvTyGD9MEVZVa6NADi1kcDm+q8dRZNp4SHt7oTRv8/UH27
 38h8lVstmdt1uCiHfuO+PArzOB1we2GC2o/L9S9gE8lkn8kH40t3vEMgEUGD5STTGupYRafm5z9
 +z0RcWQ7Ewa9sY+HdUDyvGqlk5NZevnkdCUGVin2vLXxxluUlzSgcF9yxeeZwuXVvqmLj4KubSa
 OhpuPVl+tzS/pQw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Oct 2024 15:25:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5432

Document the new `retain` class with its configuration variables in the
variable index.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst   | 17 +++++++++++++++++
 documentation/ref-manual/variables.rst | 35 ++++++++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 46d77d0e5..9f6e42725 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -2728,6 +2728,23 @@ commit, and log. From the information, report files using a JSON format
 are created and stored in
 ``${``\ :term:`LOG_DIR`\ ``}/error-report``.
 
+.. _ref-classes-retain:
+
+``retain``
+==========
+
+The :ref:`ref-classes-retain` class can be used to create a tarball of the work
+directory for a recipe when one of its tasks fails, or any other nominated
+directories. It is useful in cases where the environment in which builds are run
+is ephemeral or otherwise inaccessible for examination during debugging.
+
+To enable, add the following to your configuration::
+
+   INHERIT += "retain"
+
+The class can be disabled for specific recipes using the :term:`RETAIN_ENABLED`
+variable.
+
 .. _ref-classes-rm-work:
 
 ``rm_work``
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 0236c8c9c..1e37132ed 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7137,6 +7137,41 @@ system and gives an overview of their function and contents.
       If both :term:`REQUIRED_VERSION` and :term:`PREFERRED_VERSION` are set
       for the same recipe, the :term:`REQUIRED_VERSION` value applies.
 
+   :term:`RETAIN_DIRS_ALWAYS`
+      When inheriting the :ref:`ref-classes-retain` class, this variable holds
+      space-separated recipe-specific directories to always save in a tarball
+      whether the recipe build has failed or not.
+
+   :term:`RETAIN_DIRS_FAILURE`
+      When inheriting the :ref:`ref-classes-retain` class, this variable holds
+      space-separated recipe-specific directories to save in a tarball on
+      failure of the recipe's build.
+
+   :term:`RETAIN_DIRS_GLOBAL_ALWAYS`
+      When inheriting the :ref:`ref-classes-retain` class, this variable holds
+      space-separated directories that are not specific to a recipe to save in a
+      tarball whether the build has failed or not.
+
+   :term:`RETAIN_DIRS_GLOBAL_FAILURE`
+      When inheriting the :ref:`ref-classes-retain` class, this variable holds
+      space-separated directories that are not specific to a recipe to save in a
+      tarball on build failure.
+
+   :term:`RETAIN_ENABLED`
+      Disables the creation of a tarball of the work directory done by the
+      :ref:`ref-classes-retain` class. Can be set to specific recipes to disable
+      the class when the class was inherited globally with :term:`INHERIT`.
+
+   :term:`RETAIN_OUTDIR`
+      When inheriting the :ref:`ref-classes-retain` class, this variable
+      specifies the directory where to save the tarball of the work directory.
+      The default directory is ``${TMPDIR}/retain``.
+
+   :term:`RETAIN_TARBALL_SUFFIX`
+      When inheriting the :ref:`ref-classes-retain` class, this variable
+      specifies the suffix of the tarball of the work directory. The default
+      suffix is ``${DATETIME}.tar.gz``.
+
    :term:`RM_WORK_EXCLUDE`
       With :ref:`ref-classes-rm-work` enabled, this variable
       specifies a list of recipes whose work directories should not be removed.

-- 
2.46.0


