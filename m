Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18287C79FA3
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 16:03:12 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67374.1767628984158703219
 for <docs@lists.yoctoproject.org>;
 Mon, 05 Jan 2026 08:03:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=J3RHoaPa;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7CF601A266B
	for <docs@lists.yoctoproject.org>; Mon,  5 Jan 2026 16:03:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5333260726
	for <docs@lists.yoctoproject.org>; Mon,  5 Jan 2026 16:03:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C7DB1103C8567;
	Mon,  5 Jan 2026 17:03:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767628982; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oAErYyWjWBmN7eAGx2FzKN/ykjKCe4k9MOKmCee7hBI=;
	b=J3RHoaPaPshNU+3jRQ3WGTLuBWoy7lYmYw3+k8NzB1LFq37qCRBsjPGt7KvLA5SRMYfxCd
	jbd2IpgUNlPI2ZI94lIcb0oQkwRkcbFZLGkaeNMkqXGot20r+RKGIpQ3aSikOLONBzR3HK
	GYNBMQE51MSa7IsRzR8h2veNiEaWNy/TpeeE61rpPmQkV8l/1QMBD4upnMzLknkxtVzyiY
	i1es4o4Cn2S+6byVQcMMvMTmKUJWYRIA993Q+o/IrYQAzOsl/iYKv2Mf8f+I+XDhYEc6wB
	JA6TcNT+T3rj/nmfEgkO05LL5pFbt6x5MaS8EDFOnQfWKERNxgMF3t/u1rHVyA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 05 Jan 2026 17:02:55 +0100
Subject: [PATCH 1/3] overview-manual/yp-intro.rst: fix SDK type in bullet
 list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-update-workflow-diagram-v1-1-fc1c6f402064@bootlin.com>
References: <20260105-update-workflow-diagram-v1-0-fc1c6f402064@bootlin.com>
In-Reply-To: <20260105-update-workflow-diagram-v1-0-fc1c6f402064@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1101;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=EHSE1IPzTwa4Wfh8sgw/yvlzdPvbW4dWS6ftGWWnSWQ=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpW+C0u0uUIOerrsmVverTjcIxbWM4D/PyzFXjD
 CxfgKkaqquJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaVvgtAAKCRDRgEFAKaOo
 Nt4jD/4pHmc80VJ5WzkGvbyt+mxqCLrDwxJffDXxzbEy54LIi2qRHCWGhJWCiYHsN1tYuoNE0OU
 RBPSeV/z4+CXpGzhHdSpVmnwbJj84QPc2CzFsjAPI3NwvsWkBNl+jO1LOwkd+cB53WfkoaPkG0U
 MpD2+MU04JbIIGNI+edZPjGccJk3GKtWhBEJ0JIDmjhKqA1tDbaBcUsMhSKpDYCLDVZ+zSLhJt3
 UleFyojYaUuMBcozNKmqDg8487dR7TYruWP8vVF9dRwXb7zug66TBJ55G0QKz6EsEB4Swc3KAGN
 Je08gXJMuoSSSWWbpA7nCVgM09EBdkHueb3BCHXjxEbt4J8bSYpZ/44zUV2ax/98O0QeszZiY1v
 ZFwtFF4wB3zjHAmD6+qhTm75b6C2dL4RCBOya+FybfJOVQhL+L+nj0GEI9fTplAop85C7yeYOkf
 VZr/HRM4FupmVhefNYFW5BABZZyxkR+C6c3ywvbyXnbUuN8sHiA39C5ywRb0ECQYQoBHPnTvsDt
 Rv4qCpeXFhDa7bcAL1VnS5dlgOzHUZi9LH1UuWLJ8N4kYiHCbsZ7wx89VMg+Ep68K9X10oSMzcc
 ErLg033VYZEJ34zQegNB0Q724LvCS7FZ+KZYu5yhj/V0UTRbGjml+ZCi4NxXU1r81g2l/4HTyGG
 U+rCv+8OEu1GlTw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 05 Jan 2026 16:03:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8391

The YP generates an SDK by default, which can be meta-toolchain, an
image-specific one, or an extensible SDK (eSDK). Don't be specific in
this bullet list.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/overview-manual/yp-intro.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
index dc4d5125d..5cc39b31b 100644
--- a/documentation/overview-manual/yp-intro.rst
+++ b/documentation/overview-manual/yp-intro.rst
@@ -762,7 +762,8 @@ Here is a brief summary of the "workflow":
    package feed that is used to create the final root file image.
 
 #. The build system generates the file system image and a customized
-   Extensible SDK (eSDK) for application development in parallel.
+   :doc:`SDK </sdk-manual/index>` (Software Development Kit) for application
+   development in parallel.
 
 For a very detailed look at this workflow, see the
 ":ref:`overview-manual/concepts:openembedded build system concepts`" section.

-- 
2.52.0


