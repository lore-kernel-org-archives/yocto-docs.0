Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA554CA1005
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 06:17:35 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.70793.1756793845237720700
 for <docs@lists.yoctoproject.org>;
 Mon, 01 Sep 2025 23:17:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=elYNhM+F;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b042ec947e4so253739566b.0
        for <docs@lists.yoctoproject.org>; Mon, 01 Sep 2025 23:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756793844; x=1757398644; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=koXfBQs0zab77gaOQkSVbvWIsfCCnvfFqaOpsqUoDf4=;
        b=elYNhM+FJxe1TXQ7Q8eCzYGv7xe43b0G6QP98zlutDiWrEt7Tb9juCbcsY8ic/0bGc
         BvuFxEuzj3HIiqAw90WGa3BIozwNyy2Q+bTjfptKG1N1b/r2H4VW8o/LLCylFwzkHiOO
         PlIoz/+LJENEXbUCtNcXV5WV7nvOJXWvLNxxs/ASEIoE5+LPdZB/+yfAZ2JFPT0nXbit
         LEP4rAUXZbxKEGGD3ElDFZ3RnBQpXVVC84NYCWMSRqzsp7Z2moYHKVj+jadHsJTsHtAS
         hda2ExVLIMKrmiDeW/edfbY1ynlnyz7kttYn/uopIkDxuAqpQe2Z0r8DjCwBa0aD+HPi
         OG9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756793844; x=1757398644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=koXfBQs0zab77gaOQkSVbvWIsfCCnvfFqaOpsqUoDf4=;
        b=PastIkccSpQpwhdi38BCWDEXJNJpG++rk1NJBbYWVi+wN/h2N3ncF1yibDotGSRxRy
         7LCx9sI77QVySBLnZma0FvJEwGpkYh/i6WgXAAq0jbFY9fdVsbNmIsSlvzN2I1vfopK3
         bAAMZpi+AiwsLf1ZGMX+Px5jMH46HgbdpOTd6xjF46H7xE/MtqKxdADpDYm0o4G2xOnL
         8ZnmISGJ3pEVd5K+D0ACROlydTJsX4askWG4z2NFIpS3MCHERKJU5zTcgp3ID3x/xKq7
         qCoBaApNXn1z5va6utI7FnmzPgAfcbTl7uQSFbgs2yRwHrjAQNodCzKCBSb3jUo0W16C
         F9qg==
X-Gm-Message-State: AOJu0YzxoNOC/4MeKW4AKJtW679TAVzcJTWGLWUSJH9/yTxqQ9yJwvvT
	Ywd/bdhiHC8F8+0kS8mf4QOy/W/DCYDsfF01pZS2ZKax2fliZj3WJXJhi4JMpA==
X-Gm-Gg: ASbGncvK7WMViCjFBcPiH/6GHpLr5W43LgHpLQpro5XctqQvnCNhAuzAlP5ukhhZw+X
	Mc7Tct3h1rkZMvIeJNiPb72L3XgE1fX1P2XUgpA+k7PwxaD/k9+cY3P4WiJckAlrTjC3X3MJvgH
	RtooGDttXF60h9DVt1wWRD6aDzUurrQtjOgDepYYF2SxAQ7vRKDuwwhX/3jgdVqLFObdfPaEH03
	d6t3VynsnyHG/B/fdwt+0Tlidjpy2/KvFymfvCYo5zrb9w9WEulRJgkxJYb96PkrKTRIi+87isG
	BZSUFKFnKi6AyjD45qY/QKPnDMKJq3coFBnfs5f+H/gS7IYQJPSH3yNgO4u5V6WsvcGzKozfaUa
	hyU3G5IPAj/lIcUPvriAVBjV9ABfSu54=
X-Google-Smtp-Source: AGHT+IEb72v5N8TUHNEBlT6Apv8gHMQe8rSIZpbDlV+Wu+qCOApWR8n52LrWedpDjqwQ79t32wBYXA==
X-Received: by 2002:a17:907:7f0a:b0:afe:ad45:acf5 with SMTP id a640c23a62f3a-b01d9755fb1mr1022239266b.34.1756793843450;
        Mon, 01 Sep 2025 23:17:23 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afefcc1c6fdsm1043560466b.75.2025.09.01.23.17.22
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 23:17:23 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH] migration-5.3.rst: update removed recipes list
Date: Tue,  2 Sep 2025 08:17:22 +0200
Message-ID: <20250902061722.2226405-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 02 Sep 2025 06:17:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7479

Add a note about the removed xf86-input-mouse and xf86-input-vmmouse recipes.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 documentation/migration-guides/migration-5.3.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/migration-guides/migration-5.3.rst b/documentation/migration-guides/migration-5.3.rst
index 97e41605f4..2d2f8d91ad 100644
--- a/documentation/migration-guides/migration-5.3.rst
+++ b/documentation/migration-guides/migration-5.3.rst
@@ -174,6 +174,11 @@ The following recipes have been removed in this release:
    removed in May 2024 with dfa482f1998 ("python3-requests: cleanup RDEPENDS"),
    and there is no other user of this variable.
 
+-  ``xf86-input-mouse``: The project has stopped supporting Linux.
+
+-  ``xf86-input-vmmouse``: It has a runtime dependency on ``xf86-input-mouse``,
+   which stopped supporting Linux.
+
 Removed :term:`PACKAGECONFIG` entries
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 

