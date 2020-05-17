Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web12.27572.1589741479107808236
 for <docs@lists.yoctoproject.org>;
 Sun, 17 May 2020 11:51:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=g5Lj92qL;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id 23so3797120pfy.8
        for <docs@lists.yoctoproject.org>; Sun, 17 May 2020 11:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=wkK2jOGzx5gZqQSUtOl26OO32jw3hwC/STDOPY5hcG4=;
        b=g5Lj92qLL/OQ0IKhyQJt/fC5jGFGVvE2QWZozOibu5+CZFB2wJYUHubmC6qj41lE9r
         WkG+kA+kNVhqyQbH0nsBoQBmc2a8wpVNXJG7Wu04qsEGMJRi0Gm8FFzwsxtqmGZHmo2Y
         26y+3fKDFIjiuzOwrOP6Z1wqeQqo18su3on0D+Zp55BAc/6XtCRh/LdSn3PKO1aG0Fjx
         qreRPfPWMDANuBhqgtCbQp8DpcR2PYBEPhJB68sc9Vnc/1XG9RFJYsSB1uuJA2jaMCsn
         J0Zxpqd8wZwrrYaAIAhtjknyEyJXdcQMu0mkpYU4H/E+ADFozQeRv28E/iNpFLg7Kd9t
         uq/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=wkK2jOGzx5gZqQSUtOl26OO32jw3hwC/STDOPY5hcG4=;
        b=CHHquV35MNmbhv2TH3AuEUmrVaWuucVsa6aHlTcqzTNVmovMLehmCnHGKEhSPhswx3
         o81yCmijY8UQhMzB2qZQGN0ompI3oT8jSBprtu+5by7WebCv9ABCa91fB4uF394btDS3
         4xGfd6yG8RU0KmCuBg0+UOvYZyeEQ2saospgc540noAKpx9yFxG0ID2sP4vZC56CY7IH
         fTi4VJ/K0ZllLiYXgvx6dam9LR54JIUYCPRDZpamd85N9iqGwarRKbEnPH3kTlQY+BHr
         T3ZDTRJmWG2TO3VAkDZ/KX24pU7mVA0HB8pUha6spLaX8eB3b3Yg+A6yTta1xEEj83lY
         0c7w==
X-Gm-Message-State: AOAM5326dS3+fuEvRXEcoKR3/Mbkto04oY54Bft3youvDyAyeBudbhVv
	nFFDSgnsWx5lt3be30VgmsK9JXpw
X-Google-Smtp-Source: ABdhPJyH6IJJLdS+CXUNv35/6mrmBPVJgvrTc+AVBjcEcvkGEzdHLxYV1F7COP4UnkX3NDtZ4qRK0A==
X-Received: by 2002:a63:e702:: with SMTP id b2mr11794096pgi.158.1589741478148;
        Sun, 17 May 2020 11:51:18 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:f0e2:1a5f:63ed:f38])
        by smtp.gmail.com with ESMTPSA id w14sm6038760pgo.75.2020.05.17.11.51.16
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2020 11:51:17 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [warrior][PATCH] README: drop email cc
Date: Sun, 17 May 2020 11:51:15 -0700
Message-Id: <20200517185115.15661-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 README | 1 -
 1 file changed, 1 deletion(-)

diff --git a/README b/README
index 62c2a3ffbb..f3d0214171 100644
--- a/README
+++ b/README
@@ -22,4 +22,3 @@ Now you can just do 'git send-email origin/master' to send all local patches.
 
 Git repository: http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/
 Mailing list: docs@lists.yoctoproject.org
-Please cc: Scott Rifenbark <srifenbark@gmail.com> on changes.
-- 
2.17.1

