Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28695CD6E56
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 10:59:29 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17492.1780484366006044817
 for <docs@lists.yoctoproject.org>;
 Wed, 03 Jun 2026 03:59:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dCSMeQpA;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45eec22fab7so3415688f8f.3
        for <docs@lists.yoctoproject.org>; Wed, 03 Jun 2026 03:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780484364; x=1781089164; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6lYcTFmpvKgT3bz9dYV072vUDPA8+Q28vAaiRdH4wag=;
        b=dCSMeQpAtIW7aEAGpuF0+MJKHzW1yZXKxSsi6AFFuqYDMyFw8Z5tRiCpD0YFKA+rXA
         OE9WlUdMyBXNAIUQof4Ifq1Ffqd3uFsTcI0FBc17yLYH4/Wa5moXO6Ica03ztXv6/Vwo
         exBfippNunEomFzqsqYZ/w9AD1E5u2L3bNriKIxwCBZA9ux3c/+LFEWv7ePOvKLmoDRW
         dGOIVAlNxhlKITs8hiBT2bq2L4KsMoACeI0vY5zkYPRoTGKkLizHt2pLZ3M+KKIdqDZ2
         mBRJn7bsNEjYl5fbirBbNw4Ro7CyOIu9+UzGGCIpbi/4WGxLnJ6iK0TOw7TDnnrD8T/S
         86hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780484364; x=1781089164;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6lYcTFmpvKgT3bz9dYV072vUDPA8+Q28vAaiRdH4wag=;
        b=ND7beKFFvsS82s3Kq0W6JyWYn3JRgEeCLTIeCA6Z5tICxO/WEHt2xE/aPBEQVX9bw7
         Mjxu0p31+4nKiiHImCpJidhA1zzg/F1xtJ0y9RChbJiUGHZjeAPVs9I3FM6KBu6fVuF3
         uaBCdithbNiB/Ar/rzpP6OFz7+RqBiCkC7EEhW1eS2oDAnpa0e01O2wsGXBcJDwU4d0d
         ApgAwdfXX3+FVYwAHum6gWZ0Xr30yZHrWT5WZAqAwDY+DbY4TPM5t2Kbvh+LpaqE6bsJ
         CrZcmDemWfydaz79EEY2sShgJxEHsI9m9+bJ12bQ3PpotNBYI5SFOcTWomEtyWBgZ0a4
         09UA==
X-Gm-Message-State: AOJu0YxSKpRSZ+rnbFozfF6uIWIYApPsCiTcHL3vuHQObFl2ZYVNyCUs
	xxT+5f3ZrvkxZ6edmzt0x/pw3P0OpZK4bTCvX59tcxRSa5nuxU0KNb8Y71w3+w==
X-Gm-Gg: Acq92OHKJWTiJBZ60/Jr/9fjftrCeR7a4mJDRW2UoZbVAEjT1wDoWn93j1VS1h4FLfk
	AqIiRUVnIwJGK9zEJcYsO/f9ZF8s5SMt2ng8wYTCSR/v5AFN/SoDkrQOUeFyGEO/W8jr8qreJAp
	L2OBcgAgdnaFZUahOlbljQ6hxWDieoO8OksrFiLMXdoTHtPg6GouUDeCo6iNkwXuGoMTYBMQyG1
	wqzTlO9oYXG9yeo9wPcdztRz8oUuKpO0WtIJicU8dH7ke6YRFssD2vMLsvgkqaYS5gshDlGe5RF
	gKSLjxSWXc9VGgCkgM9A0J55nq/hiODdSzCOyAFL0NXC1iNIs1vFlm7MPiPEpOwrCV+pqoKTOi2
	mPJE+EnB4LRLNRt7OtArOxaKWvNnEDWBBfsfE4IKWkFhIum3fUJChrhsfX8FpC1hGeQG2r0K/ge
	Nn7+7vadQi2jmUVSrBmbm8cngUONya4huFpvUn+3xL1/hhNdtJEEoIC9gox0Vi1gdZ1zhWp4L0T
	kTFQwSUWApgvfLXiAI1Qc6TA3MvxWncpLY=
X-Received: by 2002:adf:fe4d:0:b0:45e:64b3:af44 with SMTP id ffacd0b85a97d-460218701c2mr3145820f8f.36.1780484364108;
        Wed, 03 Jun 2026 03:59:24 -0700 (PDT)
Received: from host2.home (88-170-249-143.subs.proxad.net. [88.170.249.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f35fb24sm7136498f8f.34.2026.06.03.03.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 03:59:23 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@ygreky.com>
To: docs@lists.yoctoproject.org
Cc: Marta Rybczynska <marta.rybczynska@ygreky.com>
Subject: [PATCH] security-team.rst: update my email address
Date: Wed,  3 Jun 2026 12:59:13 +0200
Message-ID: <20260603105914.26433-1-marta.rybczynska@ygreky.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 03 Jun 2026 10:59:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9557

Update my email address.

Signed-off-by: Marta Rybczynska <marta.rybczynska@ygreky.com>
---
 documentation/security-reference/security-team.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/security-reference/security-team.rst b/documentation/security-reference/security-team.rst
index b77365382..776dea568 100644
--- a/documentation/security-reference/security-team.rst
+++ b/documentation/security-reference/security-team.rst
@@ -105,6 +105,6 @@ information in the subject line.
 
 -  Richard Purdie: <richard.purdie [at] linuxfoundation [dot] org> `Public key <https://keys.openpgp.org/search?q=richard.purdie%40linuxfoundation.org>`__
 
--  Marta Rybczynska: <marta DOT rybczynska [at] syslinbit [dot] com> `Public key <https://keys.openpgp.org/search?q=marta.rybczynska@syslinbit.com>`__
+-  Marta Rybczynska: <marta DOT rybczynska [at] ygreky [dot] com> `Public key <https://keys.openpgp.org/search?q=marta.rybczynska@syslinbit.com>`__
 
 -  Steve Sakoman: <steve [at] sakoman [dot] com> `Public key <https://keys.openpgp.org/search?q=steve%40sakoman.com>`__
-- 
2.53.0


