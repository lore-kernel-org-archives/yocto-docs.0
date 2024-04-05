Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4B6DCD129C
	for <webhook@archiver.kernel.org>; Fri,  5 Apr 2024 14:35:17 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.13748.1712327712656916046
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Apr 2024 07:35:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=XncftLuL;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 231F0C000C;
	Fri,  5 Apr 2024 14:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712327711;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ewKwjonDgwI6zHrqBXay87gvL11EfnlaQLXQ7fhUxaI=;
	b=XncftLuLehYkvTpvENylMg6QezGAlpcWILNqX+oWOs20z6AWvS0qk3/PdKLc4+VROOt46o
	TTnOy0N0pj3eDLphtsiFqs5UshOWEV0R/rIk1jOQkhbWTZTaGuQziRpeTwEo3e2z+URUtZ
	0fTW1J2AV/ohxv8VWAKjRQ6FiZfq5ReTgaw4CI43pyCbvX74OKcll2/KRuFgiJwK1zxk7s
	HKZtPknZ3JV97vJakGB5BF2+kBlAcxpGPhiASG+DAdsI/XQAlWcdtEvdkHBMyme8TUntOE
	jamTGqGUHXd1Q0jup4k2Bt1TDz+zklyjYYGH3al5Msmde47w8Uj1DyMXyljHTg==
From: joaomarcos.costa@bootlin.com
To: docs@lists.yoctoproject.org
Cc: thomas.petazzoni@bootlin.com,
	michael.opdenacker@bootlin.com,
	Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Subject: [PATCH v1 4/6] migration: end sentences with a dot
Date: Fri,  5 Apr 2024 16:34:51 +0200
Message-ID: <20240405143453.2281900-5-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240405143453.2281900-1-joaomarcos.costa@bootlin.com>
References: <20240405143453.2281900-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: joaomarcos.costa@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Apr 2024 14:35:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5079

From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>

It seems coherent with the previous release notes.

Signed-off-by: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
---
 documentation/migration-guides/migration-5.0.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/documentation/migration-guides/migration-5.0.rst b/documentation/migration-guides/migration-5.0.rst
index 157a95733..b03b7ec8c 100644
--- a/documentation/migration-guides/migration-5.0.rst
+++ b/documentation/migration-guides/migration-5.0.rst
@@ -89,13 +89,13 @@ Removed variables
 
 The following variables have been removed:
 
--  ``DEPLOY_DIR_TAR``
+-  ``DEPLOY_DIR_TAR``.
 -  ``PYTHON_PN`` - Python 2 has been removed, leaving Python 3 as the sole
    major version. Therefore, an abstraction to differentiate both versions is
    no longer needed.
--  ``oldincludedir``
--  ``USE_L10N`` - previously deprecated, and now removed
--  ``CVE_SOCKET_TIMEOUT``
+-  ``oldincludedir``.
+-  ``USE_L10N`` - previously deprecated, and now removed.
+-  ``CVE_SOCKET_TIMEOUT``.
 
 .. _migration-5.0-removed-recipes:
 
@@ -106,7 +106,7 @@ The following recipes have been removed in this release:
 
 - ``libcroco``: deprecated and archived by the Gnome Project.
 - ``linux-yocto``: version 6.1 (version 6.6 provided instead).
-- ``zvariant``: fails to build with newer Rust
+- ``zvariant``: fails to build with newer Rust.
 - ``systemtap-uprobes``: obsolete.
 
 .. _migration-5.0-removed-classes:
-- 
2.43.0


