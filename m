Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82F91C624A4
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 02:13:09 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21073.1788142380054920004
 for <docs@lists.yoctoproject.org>;
 Sun, 30 Aug 2026 19:13:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Mome0luY;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-9390dd46b45so153621785a.0
        for <docs@lists.yoctoproject.org>; Sun, 30 Aug 2026 19:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788142379; x=1788747179; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vCqZU9R4lTcNNgw+wDMorh0eItmLnsjrlIpWJoFztVg=;
        b=Mome0luYrXaInmF4dlV3hrQJwLnaNRus93YQPryWgwplZVm2Mf7Qn2m8nCIKCd6Q1E
         p9g8xeS31Nye5kLShoI4VTv554PzG9mr5q/B4vsx4gzNrjCUFHlJRIaEmuvmnpJKE9Nm
         0p18j55YpneudzyFhvEaBEjla0lGAXixkEeIraen/uYb3HOwIrIqLzZTw07pkWN9bsFf
         Zvb3Flu8MGSx0E/vBePKFS5gbKo/PrVypHvQmFBNq1OKIl8MvPdnyLFzelEa2Jh7VZC2
         J2X2pImv8L81bqN5uTu46su47rlbrbLujfCCW5j3sJh3j2LD6kKdGLjKGpJSqUOPR7Mt
         f96w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788142379; x=1788747179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vCqZU9R4lTcNNgw+wDMorh0eItmLnsjrlIpWJoFztVg=;
        b=VAVx99PpT/TZIJVVc83VpCY0z9g06BBu4z34x5kVu1xoPmwlCUGeGZUdB032CAlHvD
         ectxqm1MEG4QrBMK6B7v75F+9UzXqYlLEsem92W1MvuBZir59JLXTOWqyEXOIvBvHrX4
         Wm+2CvFvwY22MPR2p0q2kJUA6EuQ38alze7pFCMX1BbmEqaIsk+Kd0dQ81oQDRR65rLO
         3VASEIfXMGrKbV0W33tr+miNbHFRcRrK1AgIuV0xQTkwsQWXG3CYUpk0sBp+c02RAsg9
         gcev9gVg7EbONFRE5TTmRkUWeqquA7UZCrT8QvOOdG/flmgZ6dStu3Dz0pQy+6vWTLN3
         NV5w==
X-Gm-Message-State: AFuF++kycLCygmT3/PPE6FK4aC1d3L4vx2gBnfg9kG+7JThA59+3pVoX
	vuk9fSzuRdxCNqbBgjtnDcarVsStQBSKaa9QfEG9+RulXdA3JGlT8aCS8rWoL81S
X-Gm-Gg: AR+sD130MV+xCxqGgdoSLE6ebCVAYE4FwsjoeAHPEEbZ2rpIo6ieaZtRbXVOoAgU7Nx
	bgFU0mWNWYvZe4kUFVrjgH1RsC3klaqdCwUqb6MSrIhdQp7j+VEJe5gyPC5uQzWmuHwVWVkFjKY
	QvAo7UvlhQWmP+5AIhIBJTEhr/yZBIPRKFxT2n2vWWmMR+L4eSDaTC6o0PUMm/K8ssZKw8iJYaE
	MDsPGOeEnw5idWblBjOCyovzp2bKq4t50EGMMOKQQo5LI/BnIR2xxnuYBQCnmvyQ8h/XBX1J6lg
	XfCT6TsxAJwW7V0ky8uTW6VoD3M+Rl///kAL+R0imo+3aX4JUxfImD+eLDZcwtrFB53G/lD/XYy
	2eLV9oFDqHXhiJR47w2ZcaAaTlJo9sqplStgF0JK+c7BMiycnKEvTjlAL4bjQCnBTMbMB0lRiN1
	9Agz3u9ltFUdAG7iPNieo5+PuZ6U3M2ge6ewsbaPXQgVYcQJF7D6tJmIbx9Ror93sA33KAIuwYe
	0nmnUg7R3F4yYrcq6UdkFEAdfl6WQ==
X-Received: by 2002:a05:620a:4506:b0:936:2fa5:387a with SMTP id af79cd13be357-93913990a9bmr2346954785a.43.1788142378886;
        Sun, 30 Aug 2026 19:12:58 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93918b0f825sm660825185a.40.2026.08.30.19.12.57
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 19:12:58 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 1/4] ref-manual: drop the full stop from the QB_SMP example
Date: Sun, 30 Aug 2026 22:12:52 -0400
Message-ID: <20260831021255.4064163-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 31 Aug 2026 02:13:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10407

The full stop belongs to the sentence, not to the value. BitBake rejects
the line as printed.

AI-Generated: codex/claude opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 documentation/ref-manual/variables.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index ae9cbfddf906..95454698f969 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8266,7 +8266,7 @@ system and gives an overview of their function and contents.
 
       For example::
 
-         QB_SMP = "-smp 8".
+         QB_SMP = "-smp 8"
 
    :term:`QB_TAP_NAMESERVER`
 
-- 
2.50.0.173.g8b6f19ccfc3a


