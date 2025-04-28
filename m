Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA24DC369D5
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 20:13:11 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.58265.1745871181911443976
 for <docs@lists.yoctoproject.org>;
 Mon, 28 Apr 2025 13:13:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=hkR8PgN4;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-202504282012583243feac728379e528-rtelbj@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202504282012583243feac728379e528
        for <docs@lists.yoctoproject.org>;
        Mon, 28 Apr 2025 22:12:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=yaY6I4/Pbig439hKshdVWBEuGYaZLkX8EkwaeYr4vt0=;
 b=hkR8PgN4XtnLcUl4e/0JR4ejx/JU0HehEtHhZrQCaxRkOiKETrxm1F0EilbgomVL7xDl4d
 pNESLHfsVDBfcZ1MqLEmG8nfaDOucUDsyMtuRNg+4nWsZm0rJ9G/JKyKLmAsuC7Eyvv6v7rR
 D6xBQILCd9vj5uB7OvlE2rkdbRSDtoUXN8ml25eTQ53UgUZ95zvMF3gPIHF9NXlTlP/9gNip
 ZnGFSZAsO11FUA0FHixzoOSvDRXOy6+bU/kem3h6yBbb3YsyOdkp5ezJN3/pOm5/Lg0sih9h
 42gCJwuv3teMHaXSU1t+7Q6XWaVXvczl01HYkrNX2rV6nb188mnqymoQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH] ref-manual: kernel-fitimage.bbclass does not use SPL_SIGN_KEYNAME
Date: Mon, 28 Apr 2025 22:12:43 +0200
Message-ID: <20250428201243.596148-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 28 Apr 2025 20:13:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6786

From: Adrian Freihofer <adrian.freihofer@siemens.com>

The kernel-fitimage.bbclass uses the UBOOT_* variables. The SPL_*
variables are handled by uboot-sign.bbclass.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 documentation/ref-manual/variables.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index d17f81036b7..c22abd4a8e5 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8766,7 +8766,7 @@ system and gives an overview of their function and contents.
       class.
 
    :term:`SPL_SIGN_KEYNAME`
-      The name of keys used by the :ref:`ref-classes-kernel-fitimage` class
+      The name of keys used by the :ref:`ref-classes-uboot-sign` class
       for signing U-Boot FIT image stored in the :term:`SPL_SIGN_KEYDIR`
       directory. If we have for example a ``dev.key`` key and a ``dev.crt``
       certificate stored in the :term:`SPL_SIGN_KEYDIR` directory, you will
-- 
2.49.0


