Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC738106F2FF
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 08:28:20 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42825.1774513690629616866
 for <docs@lists.yoctoproject.org>;
 Thu, 26 Mar 2026 01:28:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Zx7PQ06z;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A8A88C56684;
	Thu, 26 Mar 2026 08:28:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8A6FC5FDEB;
	Thu, 26 Mar 2026 08:28:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2E48710450D28;
	Thu, 26 Mar 2026 09:28:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774513687; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FH3VlhDEPdiGBesYsexX+oRNbxfyDCHyqU7hXf4vcC4=;
	b=Zx7PQ06zHqDfLS0uJfkOQ64ounFzYbCCTqPBStdUAPtcHbLuO3iU4B9HeCgZiWYF6MPdo7
	JLz8QBCIhbnHVOUCNy7cCwjDrSPvUP4oioFzQRQxVdE6GwoHqWSXq96DYGFTgJQIcSjyDc
	8ZWhCjCJtfM2WaPCOiUSxReV3io4HHPVOSyd94s8QHL14cDgeYMf8noKYiTM0WLuggvWSU
	iSeYDmwCnQD5fXCDLryZpYQOih1VY9+uqlrUkDKHxPBGw5fz6sPdD6VZHwA/0Hv0j3l4zX
	p5rdq39G1GXxSY2/NX2Wxw+J5ESY/T4YXunrw+xrCx4bI4fDDm/DsovvRO+ewA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Mar 2026 09:28:05 +0100
Message-Id: <DHCKLP69J7YE.1Y7HHPEXU80KI@bootlin.com>
Subject: Re: [docs] [PATCH v3 1/1] ref-manual/dev-manual: document new SPDX
 variables and capabilities
Cc: <stefano.tondo.ext@siemens.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <stondo@gmail.com>, <docs@lists.yoctoproject.org>
References: <20260323133143.1185958-1-stefano.tondo.ext@siemens.com>
 <20260323133143.1185958-2-stefano.tondo.ext@siemens.com>
In-Reply-To: <20260323133143.1185958-2-stefano.tondo.ext@siemens.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 26 Mar 2026 08:28:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9130

Hi,

Thanks, merged on master-next with the following syntax fixes:

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-man=
ual/variables.rst
index f0a0d1646..e1da9f630 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -9271,11 +9271,11 @@ system and gives an overview of their function and =
contents.
       The value of this variable is the base prefix used to look up the
       agent's details. The following sub-variables are read using that pre=
fix:
=20
-      - ``<PREFIX>_name``: display name of the supplier (required)
-      - ``<PREFIX>_type``: agent type: ``organization``, ``person``,
-        ``software``, or ``agent`` (optional, defaults to ``agent``)
-      - ``<PREFIX>_comment``: free-text comment (optional)
-      - ``<PREFIX>_id_email``: contact e-mail address (optional)
+      -  ``<PREFIX>_name``: display name of the supplier (required)
+      -  ``<PREFIX>_type``: agent type: ``organization``, ``person``,
+         ``software``, or ``agent`` (optional, defaults to ``agent``)
+      -  ``<PREFIX>_comment``: free-text comment (optional)
+      -  ``<PREFIX>_id_email``: contact e-mail address (optional)
=20
       The simplest approach is to use the variable itself as its own prefi=
x,
       so the sub-variable names follow directly from
@@ -9428,8 +9428,8 @@ system and gives an overview of their function and co=
ntents.
       The sub-variables follow the same agent prefix convention as
       :term:`SPDX_IMAGE_SUPPLIER`:
=20
-      - ``SPDX_INVOKED_BY_name``: display name of the invoking agent
-      - ``SPDX_INVOKED_BY_type``: agent type, such as ``software`` for a C=
I system
+      -  ``SPDX_INVOKED_BY_name``: display name of the invoking agent
+      -  ``SPDX_INVOKED_BY_type``: agent type, such as ``software`` for a =
CI system
=20
       Example (CI pipeline invoking the build)::
=20
@@ -9483,8 +9483,8 @@ system and gives an overview of their function and co=
ntents.
       The sub-variables follow the same agent prefix convention as
       :term:`SPDX_IMAGE_SUPPLIER`:
=20
-      - ``SPDX_ON_BEHALF_OF_name``: display name of the commissioning agen=
t
-      - ``SPDX_ON_BEHALF_OF_type``: agent type, such as ``organization``
+      -  ``SPDX_ON_BEHALF_OF_name``: display name of the commissioning age=
nt
+      -  ``SPDX_ON_BEHALF_OF_type``: agent type, such as ``organization``
=20
       Example (CI system building on behalf of a customer organization)::
=20

Antonin

