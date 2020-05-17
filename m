Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
 by mx.groups.io with SMTP id smtpd.web11.27095.1589738260460600069
 for <docs@lists.yoctoproject.org>;
 Sun, 17 May 2020 10:57:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=c0Ut7E+Y;
 spf=pass (domain: gmail.com, ip: 209.85.216.68, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f68.google.com with SMTP id q9so3714512pjm.2
        for <docs@lists.yoctoproject.org>; Sun, 17 May 2020 10:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=wkK2jOGzx5gZqQSUtOl26OO32jw3hwC/STDOPY5hcG4=;
        b=c0Ut7E+YIZceXigwTLWjucpXxzjdPkJ+2XaJPtaKMfcgNlwRBkKr6gwxueFxTvAClm
         U00683MWCFPCxQrIwsim2d9HBGNXR3bzUE48E/ZMja9waRNfMMGBp/4p6etEvZgxJzPG
         5/gHrsJazvtHSgdP3gIr4/FiO2N+b3D+UVmqOlYGDzrhzTEOhiXDr7XVtyPKoZwf/ZEt
         PvTNP6KBpiaFFtX641IGiEy1JO/uNtWWsh8yU0jNd606ZRZSDl1R0Zk+bEsqfMamAmub
         V5U/qflvIlV7nj9ArD67cGHlXL5xAjo95UG11VJXolGx/icGQuAcl5Mf5czdqaVELyhE
         uEWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=wkK2jOGzx5gZqQSUtOl26OO32jw3hwC/STDOPY5hcG4=;
        b=BJGDIqqEy0rlkKlz2IAoN1kiDLfXS2Z6mL5/k+xkocvuzR0P6RweA1b8mEH/HN23Yk
         XQgIb0lFWPZ0BKJvKsuIe2RtlcI9bhnREoPhNeziLm3KpbMn9BQkmUxj9p15/b//x9Eq
         Jp1WvbWt4mEIa8nlqbK79IFrunL0kqHIvbI5N0WcbGLzvnwvlCjZrjbPoVleIcBo+pzT
         8u2F4CgoD9Aq+RnWwM5eo7uCl32SFokbMATMCx15zOxGTSiSKPcBUze82z3EDvXnYKiQ
         qAhAy/QnrAz+XJrp49H3urWu9IcfgEqpPc/2TMHR/lyyhB9DAlIFxq+2E2//xOG7yv2I
         JLWQ==
X-Gm-Message-State: AOAM531hSgnkHpigw0Pl5gC4BOETq9ay35wndd0GZx8sc9D/AfyajBWE
	Lt2IAINjA4NXH/cCDf3YUByMz8PW
X-Google-Smtp-Source: ABdhPJwyKUcFzFj0b/QyWI1/YmwPbG+NHrGBRiuM428ojIQ4o5qrlG/7+38M5xbGtU+q9NfLx50U9w==
X-Received: by 2002:a17:90a:f404:: with SMTP id ch4mr14891742pjb.123.1589738259821;
        Sun, 17 May 2020 10:57:39 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:f0e2:1a5f:63ed:f38])
        by smtp.gmail.com with ESMTPSA id f70sm6665341pfa.17.2020.05.17.10.57.39
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2020 10:57:39 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH] README: drop email cc
Date: Sun, 17 May 2020 10:57:38 -0700
Message-Id: <20200517175738.15312-1-akuster808@gmail.com>
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

