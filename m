Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.217])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12185.1794071111972844092
 for <docs@lists.yoctoproject.org>;
 Sat, 07 Nov 2026 09:05:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@awto.se header.s=strato-dkim-0002 header.b=YYBiyxxL;
 dkim=pass header.i=@awto.se header.s=strato-dkim-0003 header.b=+jYB1Xaq;
 spf=pass (domain: awto.se, ip: 81.169.146.217, mailfrom: erik@awto.se)
ARC-Seal: i=1; a=rsa-sha256; t=1794071110; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=flqk5fL+Ded5+lusrmWGQuHO54BDLHWGezL8V7UjgWl6mRLT7msu/hmsCk+AlMQHR6
    92TpxpyLV++g5Jk0Z9R7QDwq0HL6mzQpz+DIR3OHRRRQUjhVUbavJ6hYAmNBfd3EhhqD
    eENndGsnB3vE+BKEPFLw1dTVdpMiAoX4rK4ZzsNbA66H67ePUl8CBYVVvWq0fEABi02K
    eeX76OKzC1JnELF2tWO8uFiNN5QNo9FwmQYdwRKSa6/sF0UVqFW8V1PkrL7+kQlxhFXP
    XsOkK7UmXCXCQul32UYzQIpsr5DM2QlfdHG6rS+mEmTBYijxCPL9u/ricI0kNvv4Pi8s
    6bqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1794071110;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=vXd/WFI3yZVT8lkUoobG8CMVtRcATNqS+hlWb72zBcc=;
    b=hEABO5ls8fuYcEywtSupT/Bh0ra7H7DnXOAR0nXCfcQKfu8E7L1uCKLCSyc1WEzIAD
    wQT1vpad5qFakB9uQ6hc4AdScVOY6hxZc9VnVlENeKn6nwV5lJOAriI8Xt0XDcr3w+E2
    d93htiZ1gTzKqeFj7GzW1jy5NIntwpzrqlOUbP7T88zFoe5k4awOfMT4TjPRm1LriV1z
    6VhkH1UI8SxLS0lNEGzT6ON1uCHJPk/ASAWxvh+mvAq95mXduBJovlitboDSfkIL1T6L
    kzlpTaPu57KNRJaqQVpJgPJsjbrKHueDqjsCzWkWWx2rpbBOGuBpsNEka49yhFaRu349
    T/XA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1794071110;
    s=strato-dkim-0002; d=awto.se;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=vXd/WFI3yZVT8lkUoobG8CMVtRcATNqS+hlWb72zBcc=;
    b=YYBiyxxLVXa0dnLbDdCMR+t4TMMLSBME9wbmqSmihGf6ixyYHuN7CfMBhq5aZCNWvK
    DWN409JR2O94N4i3r+3pxbNQNdWjp7VQg1S9qyPrZT1nP8HDdyv1rp66kToZOGawcUHU
    +JUSXpBq6G7Ux3bxNsO5D1lazswn6JXplEruTCmMkp7UhpmSVRIt4XLQcg5YO8g/SUpy
    V7s7ovqxZPvD6R/wq7TADN542ooA79RXV/GodJcov8cxRzn4B0jF4yWl62oe7OqaNWtf
    h1Ct+Pqkx47NVsv7/D+HpHFsSfq52XV0UzK/aY6lkT6sDbrd+w77KAzqkiHTs7VxySrx
    vr6A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1794071110;
    s=strato-dkim-0003; d=awto.se;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=vXd/WFI3yZVT8lkUoobG8CMVtRcATNqS+hlWb72zBcc=;
    b=+jYB1XaqH97/qqYtfzKYVYCCdsixSN/FIofXCQqzcLIZcCI6HWtJ+VGILW9191+ig6
    HY4sD8sPoOm2mbuGJ/BA==
X-RZG-AUTH: ":KX4NfmCpbOtr2h56gDJdGbPh106htHVWsoECWG/Ym0sGLwlH95NuGYZh"
Received: from erik-desktop.tailfdfae0.ts.net
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qa186c2A7H5AIWV
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 7 Nov 2026 18:05:10 +0100 (CET)
From: Erik Lindsten <erik@awto.se>
To: docs@lists.yoctoproject.org
Cc: Erik Lindsten <erik@awto.se>
Subject: [PATCH] migration-guides/release-notes-5.0.17.rst: fix the oecore download URL
Date: Sat,  7 Nov 2026 18:04:37 +0100
Message-ID: <20261107170437.86075-2-erik@awto.se>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Sat, 07 Nov 2026 17:05:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10780

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

