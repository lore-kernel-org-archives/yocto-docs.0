Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web09.8619.1582293624555431839
 for <docs@lists.yoctoproject.org>;
 Fri, 21 Feb 2020 06:00:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BHhLDESq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id k11so2182709wrd.9
        for <docs@lists.yoctoproject.org>; Fri, 21 Feb 2020 06:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=stBjCQtaqljob2OUkp+328lzrR7afp2CeQjP5wIMYPA=;
        b=BHhLDESqfOX4S+c47k6saG41u0nx+GMbgccy95T2i6gD/shsjkmDuWT7yKS8tX96Ul
         HpKMIs45kIU0PzwafrXlb3uPvwxkqD+ARCNVdozpMoQj92AuMvcC5oNZRtQ9AeJHzs+L
         m0y6CV0ymzBK63a8NHX8Dpw/RsK0xOEwAoP80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=stBjCQtaqljob2OUkp+328lzrR7afp2CeQjP5wIMYPA=;
        b=lMrGL2vKWQH0BV8EnKCU/pEy8id406Ymbx0juvnN6TSaFnKPlB7CZZHNzJApdkOugD
         yezrPFsQuWH3b/p+5ezWUn6OrHRGlBmux75bqm0f0hjvmJDxENcjAmzzxpw67/ZpoqpZ
         SKLRGLPvv8X7Ah3jot7+a1qgWugpDsFzMJz3TL3+m4xFulNfZYBtxAx+7oDHQIAEUHWp
         p5j50cdAy9FkTNKWb1spicm5I197JH1yyodHIVWVRv5s2eXr86dJsPtWdShHjWgvnjxF
         nrVzdBxy71HPFPz9kl8wA1L1Ma1XYxKujyt34SLRDFXUpD33pnIJSMiJOkVq96ee9Wmx
         kV5A==
X-Gm-Message-State: APjAAAV1gwZv901Ub9YD3WrGh0omM+Y+WhXc0bJlkbgtsNpoybA+gOkR
	Dq94Vfie1fnLTY06mNs6XWr2SAQc9NY=
X-Google-Smtp-Source: APXvYqxCscKhiBpdleNozXKnzOTJuuE2KIX86IzMIzSs4+M2lMt5g6BnnDdShtaxZk4YHq6OZ56Gfg==
X-Received: by 2002:a5d:6a88:: with SMTP id s8mr48664226wru.173.1582293622524;
        Fri, 21 Feb 2020 06:00:22 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id z1sm3797742wmf.42.2020.02.21.06.00.20
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2020 06:00:20 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH] dev-manual-common-tasks: Fix runall reference
Date: Fri, 21 Feb 2020 14:00:16 +0000
Message-Id: <20200221140017.215415-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

[YOCTO #13715]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/dev-manual/dev-manual-common-tasks.xml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/dev-manual/dev-manual-common-tasks.xml b/documentation/dev-manual/dev-manual-common-tasks.xml
index d230ea90a..9da92e86a 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.xml
+++ b/documentation/dev-manual/dev-manual-common-tasks.xml
@@ -10822,7 +10822,7 @@
                 Use the following BitBake command form to fetch all the
                 necessary sources without starting the build:
                 <literallayout class='monospaced'>
-     $ bitbake -c <replaceable>target</replaceable> runall="fetch"
+     $ bitbake -c <replaceable>target</replaceable> --runall=fetch
                 </literallayout>
                 This variation of the BitBake command guarantees that you
                 have all the sources for that BitBake target should you
-- 
2.25.0

