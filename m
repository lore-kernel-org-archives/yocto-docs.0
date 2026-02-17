Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B88FE68158
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 09:52:45 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8713.1771321958094946688
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Feb 2026 01:52:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=SwMbxO/Q;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EDDD74E40A1B
	for <docs@lists.yoctoproject.org>; Tue, 17 Feb 2026 09:52:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B5E6D606D1
	for <docs@lists.yoctoproject.org>; Tue, 17 Feb 2026 09:52:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 16AD11036894B;
	Tue, 17 Feb 2026 10:52:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771321955; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=wDKqJVIj4P9eiWbmTBLHW4wjxfK1CPsE9CupHXOzvps=;
	b=SwMbxO/QiK6C0vb/PZBrhl4QdJqrJx3MCzdIBGlJTivrgWAKNKq7kFo/IK+Vk0jkgw3tE2
	uxM0k6cfJ8HXWpxLjlh2doPw0tnjV2YsTijnIjovTCu+ngSCghJaJYWQZAGVvfYF1HqWu4
	oFsD2t3o8Y4xV8mvBQEC2A6MwAfOYVLiUGX5sPXDDkgZ+FtxxCVJ+DbrIsGY3fD7QvDoWH
	IKXJtE5JP6iCEUSeP14UKYirNLiQfpFIPSSyPTOweRH+SNTRFdThS3kCO2eOI/mhi2+czB
	8X5JJNy4fbGykobwMKbkEMyY/3rd5Hq/DwiD9wCHLCpaRAYp3rDtN67JsP0aIg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 17 Feb 2026 10:52:22 +0100
Subject: [PATCH] docs-wide: remove Bazaar fetcher references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-remove-bzr-references-v1-1-8cdadbc3499c@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWM0QqCQBBFf0XmuQV3hTX6legh17s2gmvMlITiv
 zfl2z1cztlIIQylS7WRYGHluRj4U0XpcS8DHPfGFOoQ6+BbJ5jmBa5bxWaGoCSoa31skNM55ty
 QuU/7+PPvXm8H67sbkV6/GO37F1U5uHx5AAAA
X-Change-ID: 20260217-remove-bzr-references-7163efc86ff3
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3048;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=srtVpXGVk0S0xj5yp+19lhGcvz1JVRDOrWtgGCET6XI=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBplDpisiYL8IsEzZq7RdHIpKDZUCBRhUxrmo62J
 tjpxOVsLF+JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaZQ6YgAKCRDRgEFAKaOo
 NlkmEACQxo6Y3XV9pnmwZKwD7scpHqapqeOWmmf29gOq4+PwFpI3RDibYVlVxqlCq0TmmROcB6V
 otSzMPS7FPj/Pwok+CU0i6z2jxWpkSro2g8OMfGoreC7Xnmcf2kUJAYw6zpnVNyyHEIt8G4suFl
 vjyzl37ts0LdCwG7gomtLt450grBA7LgUFVJYYsshXw/zzHgH7pnTUtA2Nsw81sYzijSxhv2POb
 NFM2cfovuT6HBqMwDrll8Am/O72QqcpUVqDEZt0qDQxTtsy56d3f/P4f9w9EYT6XHPt3DyT3zRB
 tgO4OERgMbgYn7R5zheyz6jINFF8qXN6pp2IxpEtEkTa3afZcFmy7iPzGDfhwR+OUC7b5sHgIX8
 CiSwEz+kF5MRPzI/CY6Em/WRnW7MGt7mFFoMG0gju5vdZbl9Eia3O7AjYKUkvZq/CuDoHfpe1qk
 93DO/P97WV+LUecwJwp4CmERKGd1Wr2Lb2g2OOKBtsddPylTDUTpZwV1a2vyjs+giZv0y5XR6Qk
 Q24O5WowSi3d7EYFBrv2kkjlue2pw9hWmB4vjw0qotUm3j/1GfMM9X7WiuI6iQ+VB23Rz2oAG7y
 siozSw+bcDuhiRulOSnKCse+TSlenaZ5YvvwvZwBVHzTgEukyyfehKnC0MwrsEO+yVxJwzfaTRk
 co3bmVxGfivXZbQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Feb 2026 09:52:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8932

Remove the Bazaar fetcher references as it was deprecated in [1].

This fixes the following build issue on master:

  .../ref-manual/variables.rst:1506: WARNING: term not in glossary: 'bitbake:BZRDIR' [ref.term]

[1]: https://git.openembedded.org/bitbake/commit/?id=8e057d54f09ca0a1fb64c716da6b66f0ce4555b0

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/external-scm.rst        | 2 +-
 documentation/migration-guides/migration-1.3.rst | 2 --
 documentation/ref-manual/variables.rst           | 5 +----
 3 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/documentation/dev-manual/external-scm.rst b/documentation/dev-manual/external-scm.rst
index 896b1b5ac7..3ca9079b3a 100644
--- a/documentation/dev-manual/external-scm.rst
+++ b/documentation/dev-manual/external-scm.rst
@@ -9,7 +9,7 @@ notice new recipe changes added to the SCM and then build the resulting
 packages that depend on the new recipes by using the latest versions.
 This only works for SCMs from which it is possible to get a sensible
 revision number for changes. Currently, you can do this with Apache
-Subversion (SVN), Git, and Bazaar (BZR) repositories.
+Subversion (SVN) and Git.
 
 To enable this behavior, the :term:`PV` of
 the recipe needs to include a ``+`` sign in its assignment.
diff --git a/documentation/migration-guides/migration-1.3.rst b/documentation/migration-guides/migration-1.3.rst
index 95f7e3572b..594320d5e1 100644
--- a/documentation/migration-guides/migration-1.3.rst
+++ b/documentation/migration-guides/migration-1.3.rst
@@ -77,8 +77,6 @@ URIs:
 
 -  ``svn://``
 
--  ``bzr://``
-
 -  ``hg://``
 
 -  ``osc://``
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 208b5e43d1..fb4581bae1 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1507,9 +1507,6 @@ system and gives an overview of their function and contents.
       splitting the output executable file. Set the variable to "0" to get
       a single output executable file.
 
-   :term:`BZRDIR`
-      See :term:`bitbake:BZRDIR` in the BitBake manual.
-
    :term:`CACHE`
       Specifies the directory BitBake uses to store a cache of the
       :term:`Metadata` so it does not need to be parsed every time
@@ -9372,7 +9369,7 @@ system and gives an overview of their function and contents.
 
    :term:`SRCREV`
       The revision of the source code used to build the package. This
-      variable applies to Subversion, Git, Mercurial, and Bazaar only. Note
+      variable applies to Subversion, Git, and Mercurial only. Note
       that if you want to build a fixed revision and you want to avoid
       performing a query on the remote repository every time BitBake parses
       your recipe, you should specify a :term:`SRCREV` that is a full revision

---
base-commit: 98840d241c681c5bd4080db57b3bd9d9f0740b94
change-id: 20260217-remove-bzr-references-7163efc86ff3


