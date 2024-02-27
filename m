Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8E18C54E55
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 14:01:51 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.12835.1709042503833579326
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Feb 2024 06:01:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ykfh5/Dm;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 630441C000D;
	Tue, 27 Feb 2024 14:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709042502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Req8qhJCUKJBLt4gmlceJnQCG1fZxDf++joCYlmeCUs=;
	b=Ykfh5/DmJtewSzwseYBTmeQxw5E5x64lP3w7wxc8wjK257o4gf+QFzJpOsIFJBpWtO+I5i
	hMsaHMkUfIl3KdrKfkml9guVqeepyy8C/6iHBKhXypCdKF7x1llrUlzZrpkrtm08mOR1t0
	PHUqvoraKnlf2yRE/5zxhW3jL2iVLH4SU692O2p8BrB02IvPDLcIDr3uR7b4tGXasD43qF
	9VORGvJBT614dFpndXBjITsXG3rkt7aNaTZfsBVUrm+Fr1r7ABc0TkMip3VhHBWoEbJuak
	yIiOrCqLCSdGXa0482aLYOPnul+Oom0STQzKbdavsQOKvIAdVO5Wo4Jm3uwMzQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH 16/16] ref-manual: system-requirements: remove outdated note
Date: Tue, 27 Feb 2024 15:01:28 +0100
Message-Id: <20240227140128.481522-17-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240227140128.481522-1-michael.opdenacker@bootlin.com>
References: <20240227140128.481522-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Feb 2024 14:01:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4907

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

To align this document with the version in the master branch

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/system-requirements.rst | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 41f8077d60..b45c863005 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -175,12 +175,6 @@ Here are the packages needed to build Project documentation manuals::
    $ sudo apt install git make inkscape texlive-latex-extra
    $ sudo apt install sphinx python3-saneyaml python3-sphinx-rtd-theme
 
-   .. note::
-
-      It is currently not possible to build out documentation from Debian 8
-      (Jessie) because of outdated ``pip3`` and ``python3``. ``python3-sphinx``
-      is too outdated.
-
 Fedora Packages
 ---------------
 
-- 
2.34.1


