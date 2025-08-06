Return-Path: <erik@awto.se>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62D72C87FCB
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 12:35:42 +0000 (UTC)
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [85.215.255.22])
 by mx.groups.io with SMTP id smtpd.web10.24075.1754483732572554065
 for <docs@lists.yoctoproject.org>;
 Wed, 06 Aug 2025 05:35:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@awto.se header.s=strato-dkim-0002 header.b=GMUn43Rl;
 dkim=pass header.i=@awto.se header.s=strato-dkim-0003 header.b=do7YHBvz;
 spf=pass (domain: awto.se, ip: 85.215.255.22, mailfrom: erik@awto.se)
ARC-Seal: i=1; a=rsa-sha256; t=1754483730; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=dHoEraGNABpf3M0I87xgV2dXVhLHUw1KNsSz3pWaEbk0PfJPhvR12PKiDEC05tTWEk
    V/3qS6ZvSzYcZhvSw+Gy80DVqk7+mzxIArrB8cENTKJFelVQlXPntYrbkXEYGml19ybo
    YNfCO7fE6sMpNyU4Wz4K4fPLVJNMwEbBTShPonNn3+rYDEt3nzZvFwBnY2/K1XiGB2kr
    oR/UBxxZc9AxPOeiuP898IBGUn9+C0+2Rii1wNzRhbXsDUHPmS6btnx1znK2GWzdFhIc
    Jij1dHPcnqPTdK+LUgJp9lkTtsmacwnePnopm2HprYhBUdPeVDY/4j9J3HdlB1KBR6mD
    JL4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1754483730;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=n/YIz6gzCOWJBIu7OLGrqf8apTAW/2ZerTkrmQdbrfs=;
    b=Ea8kViAzLH/NR/mloD+pZ6NkiNg1ammUIDbPmSjCdgJ/F7/7TaMitaieesLUaFEVP7
    orjq7PJUcdVjroZxwmHrXcR5lhnH8OZfmLBb0zvD8utMM/xZY7vxt91c2XVmdpMHVWb7
    HuUnrkxoVVWCCA1u7xvj5EWTwGzpzpuibHvzylnQ3Z0y/UKsDQEtd1E9vsiaXddmcK05
    hqy/fexG5Uz55aKlEugfSqCTpXot9tkEsp9Ttja3KwYfk+ffWXUQ7+utmpQ1m9mp0rlR
    UI1C2prkxkXGBw7URQfCf6CIkJSv9harhQunLidfrBaWjchhNzHyC36qLMozKIaLEOui
    qpmQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1754483730;
    s=strato-dkim-0002; d=awto.se;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=n/YIz6gzCOWJBIu7OLGrqf8apTAW/2ZerTkrmQdbrfs=;
    b=GMUn43RlTgwo7zsX5NdPU1FcFgYCmHrrVofA2DJes3gj6ahkhKvQ4QaYSe+AtLfpYb
    /W5enHtYegp4Kk8d9C/2ofOPwdhxNigSftI9tNTZsD5glT/3CryTxa4gmsMMDVYlAk2l
    h+S5TSe95drwUlhIwY9GwSUWj4OcjFWG7liF8fv4OK6x32nBZVcyYkSbownMJguaI4tM
    W+PCVNHDkhGNnkOskhaBEKPjVj9XgXjeSbwh/I+Zxk09TMFYN6kSS+3/xTKi75pXN+Lt
    1EDv1zk84Z/5H1YE8Il2MSjUy6g8o0WHpY4vIXA4TFAR1/ja9Jw68k432xvO0jfsBFZ0
    3Fow==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1754483730;
    s=strato-dkim-0003; d=awto.se;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=n/YIz6gzCOWJBIu7OLGrqf8apTAW/2ZerTkrmQdbrfs=;
    b=do7YHBvz7scViAN5RRv66h+iydCC6mlyg90mZHMA2fqxAbguDBXhsH339Mrr4D/Qc+
    H/JvIf2+r5SwJ1/G21Dg==
X-RZG-AUTH: ":KX4NfmCpbOtr2h56gDJdGbPh106htHVWsoECWG/YnktJkgLQ91FC2f8c"
Received: from erik-ThinkPad-T14-Gen-5.local
    by smtp.strato.de (RZmta 52.1.2 AUTH)
    with ESMTPSA id Q694e6176CZUQcz
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 6 Aug 2025 14:35:30 +0200 (CEST)
From: Erik Lindsten <erik@awto.se>
To: docs@lists.yoctoproject.org
Cc: Erik Lindsten <erik@awto.se>
Subject: [PATCH] overview-manual/yp-intro.rst: fix broken link to article
Date: Wed,  6 Aug 2025 14:35:27 +0200
Message-ID: <20250806123528.44117-1-erik@awto.se>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 06 Aug 2025 12:35:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7435

Signed-off-by: Erik Lindsten <erik@awto.se>
---
 documentation/overview-manual/yp-intro.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
index 40e9693a8..8fa17b191 100644
--- a/documentation/overview-manual/yp-intro.rst
+++ b/documentation/overview-manual/yp-intro.rst
@@ -28,7 +28,7 @@ platforms as well as software stacks that can be maintained and scaled.
 
 For further introductory information on the Yocto Project, you might be
 interested in this
-`article <https://www.embedded.com/electronics-blogs/say-what-/4458600/Why-the-Yocto-Project-for-my-IoT-Project->`__
+`article <https://www.embedded.com/why-the-yocto-project-for-my-iot-project/>`__
 by Drew Moseley and in this short introductory
 `video <https://www.youtube.com/watch?v=utZpKM7i5Z4>`__.
 

