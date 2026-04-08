Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DC7D1073CB0
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 13:05:46 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.105733.1775653543689918062
 for <docs@lists.yoctoproject.org>;
 Wed, 08 Apr 2026 06:05:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qTkoyDdL;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: adam.blank.g@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b9d166ed21cso255669866b.1
        for <docs@lists.yoctoproject.org>; Wed, 08 Apr 2026 06:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775653542; x=1776258342; darn=lists.yoctoproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/DpN3Yp+1TuFypoXtARJpE8oOROaA/L+p57nGQgaa0s=;
        b=qTkoyDdLjZXaBZspihRj7PRilth7FBVspJ3VN6iEneGwKXlFsWB4MoYLKgAwnIS6ea
         H4f3KJ876/FAhbH8D/3QQoHtVE2vfkRM+i90xoi/EGv2xZMfNDg4cuXSnBeDQSoASFi5
         U1NFRz60n0C6idEwc554hKIOYSHj6H2oZFf73GaFu3OtnShH6Fh4KHkv5BdwGP4aVyaM
         voKLhzzKgtu8KqBXnTpL0/rwJEgfdtmnC41JgCXE1kz794IzJ2O00nfIKwVC54Z7s1In
         WQXVbwnpQ9JS03B6/4IZU83ZBa8q0KiRQnFk9N0n0QZ1SBU1ITMF7wGtvjLstm7h1ZpD
         +kOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775653542; x=1776258342;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/DpN3Yp+1TuFypoXtARJpE8oOROaA/L+p57nGQgaa0s=;
        b=SL4FISa+iDRw8zc2h7Fh4FPx143X5/JEohrn76UZqouVpy7RJRaorPOZM0Z6jYWuYc
         qdPBC3ouy8nsWMll2luZDrU0v9hG62HLOCQD1nDItuPhbQzWCncZHXgxbGnosww8xkLp
         AP1oxKLwZNShMUPAeFOXfLycKjhE4xxr38EpgplTF/fq8vy3IifKkPzLb01IcL0llwV4
         1U6mElXal8HO3+VRwKiZXm9/XkqFE1/xVgLF4Ks+2pxYR2lOHwsEzzDJ3ay2pPjW/ul+
         sy/VhdSXyZH/FI9bhKpv+8yQSPOMuisZwt/oye62RjxrxygSOT0oC1t4ECBAA8voEeNb
         Bi0A==
X-Gm-Message-State: AOJu0YzHIlrqLKSuTQtAYUOlQhQbt/o2efNd54M0lWkNbLQ44sOxhxnx
	C6CqjhSJ8QxyREJY1sVBBFCRylYP7U7of5PA5NEdDYOWRrIhXPS72070
X-Gm-Gg: AeBDieuf94HGRDAsw6xnHlJWz4C+Rp98hSn8UYJu/1l+IaRcIWHSedHdv2PoQ9nh38C
	QZojGzBY8AehAl5Wcxbep18T4EiGy5NZuMSzZByXMUYkOozyfyRV8maDcEuqfWwb6tqIU7Z7Zw9
	9e0sU6+5WwjtQ9tp3lpt+N6VzuNb6GmKwK9SEzKWMN0cw1jZpIei4ej9p4IvH6SnB2ufpO1JVv2
	gJM/GUMzU36rKotLicnUKB5DIUFQkSVtxaFcLYAhKEWbrakqlTEQnkDEJfJuZONHUh6XWVe68Hg
	cbzIKOmxhJSOSIijk/F+4HuopP8Ika/ASaQxY1+jK5G85zHomMNimnDT0FTal8/3P83wu2Haubm
	YJNCIe4GTR0sp0OhVpDph2o86q5Tbobz0Gpoln3u8mFTS3X71ciS2uPMtyWL7ry2oxKv6f08jOO
	Gcam7AsphhCfH4aFK/plpg4Qvu4gM0Nw==
X-Received: by 2002:a17:907:3e8a:b0:b97:b210:a91a with SMTP id a640c23a62f3a-b9c67549dd7mr906346366b.13.1775653541536;
        Wed, 08 Apr 2026 06:05:41 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:a312:c8a8:7a00:dab4:c153:72eb:4100])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3ca94715sm656643166b.21.2026.04.08.06.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 06:05:41 -0700 (PDT)
From: Adam Blank <adam.blank.g@gmail.com>
Date: Wed, 08 Apr 2026 15:05:30 +0200
Subject: [PATCH 6/6] ref-manual/variables.rst: correct a reference to
 STAGING_DIR*
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-staging_and_packaging_vars-v1-6-387f482308e5@gmail.com>
References: <20260408-staging_and_packaging_vars-v1-0-387f482308e5@gmail.com>
In-Reply-To: <20260408-staging_and_packaging_vars-v1-0-387f482308e5@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Adam Blank <adam.blank.g@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775653534; l=1173;
 i=adam.blank.g@gmail.com; s=20251027; h=from:subject:message-id;
 bh=HcgpPM1f7uBFrncJmnP5Ww4lljBX+hv/L6CSZOoGzpk=;
 b=8ZKPOhaa1Kn2jSfwXnHuQiUtNefuivLeZMGo10VZ2uez1XCIany8sL0cpLxVwpYfDR9b/72kb
 XZCc2tljxiYDumVjnLdrexIs13lgOLC4xWX63xoEVLpB7/vj0I0qr9E
X-Developer-Key: i=adam.blank.g@gmail.com; a=ed25519;
 pk=5t8u8IPKPL1CUykIX2JYa+1iHdXRdN5MqI7ik/fbvEM=
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 08 Apr 2026 13:05:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9205

The reference to STAGING_DIR* variables in the description of
DEPENDS was misleading, as it pointed at STAGING_DIR which is
unrelated in this context.

Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
---
 documentation/ref-manual/variables.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 67176917c..fbc2b78d9 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -2225,7 +2225,7 @@ system and gives an overview of their function and contents.
 
       The practical effect of the previous assignment is that all files
       installed by bar will be available in the appropriate staging sysroot,
-      given by the :term:`STAGING_DIR* <STAGING_DIR>` variables, by the time
+      given by the :term:`STAGING_DIR* <STAGING_DIR_HOST>` variables, by the time
       the :ref:`ref-tasks-configure` task for ``foo`` runs. This mechanism is
       implemented by having :ref:`ref-tasks-configure` depend on the
       :ref:`ref-tasks-populate_sysroot` task of each recipe listed in

-- 
2.43.0


