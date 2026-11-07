Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [85.215.255.20])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12170.1794070909795200999
 for <docs@lists.yoctoproject.org>;
 Sat, 07 Nov 2026 09:01:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@awto.se header.s=strato-dkim-0002 header.b=RqlINub2;
 dkim=pass header.i=@awto.se header.s=strato-dkim-0003 header.b=nJhZRJHF;
 spf=pass (domain: awto.se, ip: 85.215.255.20, mailfrom: erik@awto.se)
ARC-Seal: i=1; a=rsa-sha256; t=1794070907; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=BLiKqjEg09O9B3Cn6GJD8CUHse2k/t0kl0GZ8bOp/v8HZFDo6Cf5oCjfCcREFu2KPA
    px+X0gq7lTgfVHv4T5kN2ctWPllWtgQPj3iKdVHRj/xGL48+DKjdmRI64yDFlKU1H18F
    NFKRl81AdOaB8g2xAJx+e3kdSmeXANp7POfhb0rJvxYhitdrGhnBCTyeTbR66nMlMTxU
    911jQnnKyB847IGZbxpFzJCi7MXXRGZqVOGZymDLHra0B8MkfetBXTw6YW1fAjg7Q+RC
    fhJI2cSlI50dcGGKOrx6voGe952FLTLn1aVsMAhbd0Y7X+ldIfL0ljAg9iohyY4GQ26L
    5+2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1794070907;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=vXd/WFI3yZVT8lkUoobG8CMVtRcATNqS+hlWb72zBcc=;
    b=L1jqLO3PRsEOKlH6lIt/YOJa7IRPfu4kMGbYON8jzmYYY2MZRu0PuBk8TJrnA1EOEO
    aiHJq3dAXMsK+Hwy0nkx2mQUKnOhUVjVwPLO2zxaBtTEF+1xVPoBuOcdFItXabNYmEcc
    Qci8T4zAFi+hkssCJwefTbbxZjdGN88CqnKpmZPGLoNEqXiWBx9ITYX1B1cHZh/a399s
    Rf3bB3/v8ZQcujCIpmo1B/Sd2ql0/t5w9A2ZMDI2EC6cLdsXKboetsw5q3oFq7ABcBZ8
    Lcenc8oFgpM7jLHAH2Ldoq5ATSMWMrRt7WXNgBO7sEuSLTCXyhqSaMTV+hTZgobkgRhr
    ZB1w==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1794070907;
    s=strato-dkim-0002; d=awto.se;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=vXd/WFI3yZVT8lkUoobG8CMVtRcATNqS+hlWb72zBcc=;
    b=RqlINub2AAxzCqCRS0jVOFhnxlacKc76BttRzdKTiekH/i+UbA93JY029pCdAWYMEz
    fpg/DjlAkFqiZDU97sZeI91ksipYOZPOMCiDGFZP8QGXI0fwUJFqRAT2F80H1u5MKXFR
    uk70tLClGAXgFUoVtILGGQAHZB4t4ouHf+Il9kDMimq1eJTWPjTr/Dwls38fYaQJrW2S
    RI4lxbee8gOX8flKfmWJ/FB0GCdNHJp1nzOAGwTops+VyvG9M0cLpA/AbxkmntxINec5
    wPsqDd1AESb0WZi45g2p6c1JdOtrAtom5uHRLYxdRYca3yCTh//uf6olX8Tu6XccSbcf
    qAnA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1794070907;
    s=strato-dkim-0003; d=awto.se;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=vXd/WFI3yZVT8lkUoobG8CMVtRcATNqS+hlWb72zBcc=;
    b=nJhZRJHFyxnKOdF7agry/fe2MArYkXMPfeXJPC01EY2pcKcYBAHJe1gXt+BI6xcJy2
    45ZawlqzeJ78ddy1IvAg==
X-RZG-AUTH: ":KX4NfmCpbOtr2h56gDJdGbPh106htHVWsoECWG/Ym0sGLwlH95NuGYZh"
Received: from erik-desktop.tailfdfae0.ts.net
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qa186c2A7H1lIVi
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 7 Nov 2026 18:01:47 +0100 (CET)
From: Erik Lindsten <erik@awto.se>
To: docs@lists.yoctoproject.org
Cc: Erik Lindsten <erik@awto.se>
Subject: [PATCH 2/2] migration-guides/release-notes-5.0.17.rst: fix the oecore download URL
Date: Sat,  7 Nov 2026 18:01:35 +0100
Message-ID: <20261107170135.84816-2-erik@awto.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107170135.84816-1-erik@awto.se>
References: <20261107170135.84816-1-erik@awto.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Sat, 07 Nov 2026 17:01:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10778

The downloads.yoctoproject.org link was missing the trailing "2" of the
.tar.bz2 extension and returned 404.

Signed-off-by: Erik Lindsten <erik@awto.se>
---
 documentation/migration-guides/release-notes-5.0.17.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/migration-guides/release-notes-5.0.17.rst b/documentation/migration-guides/release-notes-5.0.17.rst
index f9adfc8..016bd22 100644
--- a/documentation/migration-guides/release-notes-5.0.17.rst
+++ b/documentation/migration-guides/release-notes-5.0.17.rst
@@ -215,7 +215,7 @@ openembedded-core
 -  sha: a948d75acf76a392d170129ce6eb6f5fe45082d95b4fd28045aac58b8373cb26
 -  Download Locations:
 
-   https://downloads.yoctoproject.org/releases/yocto/yocto-5.0.17/oecore-52380df998b3a8fe6a091f8547434a3231320a8e.tar.bz
+   https://downloads.yoctoproject.org/releases/yocto/yocto-5.0.17/oecore-52380df998b3a8fe6a091f8547434a3231320a8e.tar.bz2
 
    https://mirrors.edge.kernel.org/yocto/yocto/yocto-5.0.17/oecore-52380df998b3a8fe6a091f8547434a3231320a8e.tar.bz2
 
-- 
2.53.0

