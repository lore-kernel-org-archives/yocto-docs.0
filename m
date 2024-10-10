Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E0D6CF11D0
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 12:10:59 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.41789.1728562258213691997
 for <docs@lists.yoctoproject.org>;
 Thu, 10 Oct 2024 05:10:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=iyzII3t/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B00E9FF807;
	Thu, 10 Oct 2024 12:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728562256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yhiRbXObUt1XFnndQg/NG0X7Kn103Ne9H5cAAQsJIYs=;
	b=iyzII3t/XBCN11ZR1vkW2tBbUYLJmm/h9L9izSju/B8uW1GnuCmne8typmCplkeen2j83C
	sWW7oJ7KARUTOFYnetcRx6QMIXcyeEf+o1gpclT5nYwcDTXdSOl0eaXZzCO/psf6USwynK
	+ORLa4ql4TmZa4EoYoSh7ULZwulptjWBb+SawR8CPs6tQVRBXYnkA+P69nIVe2AU5/HgJR
	x2pSVRYRgkuiMIh3hmY/x/YAbHH0y25b6djWz2n7d/Cwngy/f0AvPkbJLoX7nX8AL/bYO1
	KmNXSDH6kLwwFkoqBcFvN3G0btuVekl/n9PSptDSNnnIu5hKEJazxStqosD68w==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 10 Oct 2024 14:10:28 +0200
Subject: [PATCH v3 03/16] ref-manual: add new retain class and variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-release-note-5-1-v3-3-2cef1a58f1ab@bootlin.com>
References: <20241010-release-note-5-1-v3-0-2cef1a58f1ab@bootlin.com>
In-Reply-To: <20241010-release-note-5-1-v3-0-2cef1a58f1ab@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>, 
 Paul Eggleton <paul.eggleton@microsoft.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3706;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=adorck5GqEtHtIM24hJlenN4ry555WHxGyvDPIMY+I4=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnB8RNFJkzoXxJtjIAm9KmsbkXwX7K7XtyFXO5U
 hYpQgd/cB+JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZwfETQAKCRDRgEFAKaOo
 NmlvEACGiCKf270Dhl+ngTZcnlb5DhiTNGyEDvhyPCjtFNIcxZkEPOkTTrO5Gu2FFP9eF5RWOsi
 SWncNyiotoeBPcdQbE2sM0HC9d8QVVUTtF18GqjhkqpYFHGQ8acH4tKumxqpvjjXhoysMBmcUZp
 +TiqgcHKYKfjrPHCP/26destvyMuAOL9Qn4yI/ZvP15HvAkrZFAV2EkaP7tN2UGzF+RlgcJljsb
 ceXwBWK2tc3hxnyNsi3lUp3p8PF0qcRnKq4jEWYwdg61cp7ulyA1zSQ3U4dUZw+N/vjEDZx1qlD
 x4Lwm7qoaaJnL/i2jslKxNQykwKde2P9dYkbNuowQhC/RlwggAeriXHTq+WPkFxDMk+OizA/QvW
 EqBEsqIdRgpmPZfDfGx7yqClFFVRAGsMLqIS1WnXMTFqmCiptyHePjEhxkYUjYv0JrE+YrRpmKt
 OaroZf7KkIv1ZdbEq7brLUu3MZH6lGpZbT8HUThz8T28zG5avmlh2Cdm9c0blfpoILj8j7S9eXL
 8RgJSMLhsybufqRbcbQeCHTQBJzJX41c98fW0o50UFOPyBaCpaKGbX70r4MPnDgkVUbXk+auwRI
 JgUeAxoIYUOrbZfMSvedE7Nebg7SAel0izJFTjdcDnrlxp+pFp0ea3bTe4rQoUApji2UZZvtyQw
 CTMMuIibxnf6+TA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 10 Oct 2024 12:10:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5456

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
index dd97a63c0..853e50cf9 100644
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


