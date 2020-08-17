Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web12.43383.1597672428292693648
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Aug 2020 06:53:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AF/cQ3k1;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: vvavrychuk@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id i6so12323807edy.5
        for <docs@lists.yoctoproject.org>; Mon, 17 Aug 2020 06:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/sYTu3TTSx+QuvYsYCM+ictLrQDRDOxlNQ5z7Agn2Wg=;
        b=AF/cQ3k1qg6qhWGHStCVAmTJOoMc/HBgUXQB7qyaFyCH1EhRtiL2S8Tx3u/qAWx4d8
         awcpQTLh1QOXnYTCWSxDMGGsvFGwaihgIneB5kR1KBgQI/CdF6WSkoLWTRJjcNU8cgN+
         Q979UP8iGRx6y/Y/iJHWKGbpbwJFFUL8hhWavw7hVPWrIZrZuHLaaO0khkXMKzoMUoZD
         Ur1TrJe/dmte2PuBf4QobRaXxZH6BD1/TdiBIb1o0V3Ob/JAbhQC/YVtwxJVe2MrU/kb
         0kk5UIoo/NcwTpAzisAnS8uQ+GueIsFKQtULr71mwt7TUng4oY8sFnAXokwxgGcOjYE8
         6WvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/sYTu3TTSx+QuvYsYCM+ictLrQDRDOxlNQ5z7Agn2Wg=;
        b=dLlQTANg5HPNPvTV7BDfyoC1U8HtJizXltR/pLtdmv+sUsRgMY7Xv7dKwyolknIajM
         fZ1RZGqYyYQJoLEWGzP2Ok1uAoxSkOHxJkHHARWIL6E7jqYwSbkp+0cbun4uIS8rxnHy
         7+P2DA2jcDa1vVHxMexuCsSpvYVHjlygTTk6njTfK51Uihw1H5lldlqGkp2aA196laWy
         rbjPvjJ+So3+V9M3xkCrmHiUOWCccugTDbEeJ8hicWjoeA0wvC8NB773740wHNArBQjF
         XiLuhDA9/8X5KqA2RPINlSw2tndo+AcLGF0fx43I7HMVaIL74YZ0U3uph8Sc8mkV8iG8
         47qQ==
X-Gm-Message-State: AOAM533ARWmiPeeio5hWypYyGNx30Ir4Q8A1JxhmT/YT02ei6R2wAQvy
	ErBn76TKot+ILFJIc5NzGnTbzxUqyLpjiA==
X-Google-Smtp-Source: ABdhPJwHJZNevE1YAeN36n7r+PEHC26JLgBiHduhx2IcLSMIPtWSgRMg7+1pfFxMbIduByx/+Dh0uw==
X-Received: by 2002:a05:6402:c85:: with SMTP id cm5mr15335897edb.350.1597672426597;
        Mon, 17 Aug 2020 06:53:46 -0700 (PDT)
Return-Path: <vvavrychuk@gmail.com>
Received: from glva-laptop.open-synergy.com ([213.174.19.120])
        by smtp.gmail.com with ESMTPSA id x96sm13664387ede.17.2020.08.17.06.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 06:53:45 -0700 (PDT)
From: "Vasyl Vavrychuk" <vvavrychuk@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Vasyl Vavrychuk <vvavrychuk@gmail.com>
Subject: [PATCH 1/2] ref-manual: Fix mistake in base class description.
Date: Mon, 17 Aug 2020 16:53:41 +0300
Message-Id: <20200817135342.18570-1-vvavrychuk@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clearly, previous sentense speaks about definitions in classes which
can be overrided or extended in other classes.

Signed-off-by: Vasyl Vavrychuk <vvavrychuk@gmail.com>
---
 documentation/ref-manual/ref-classes.xml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/ref-classes.xml b/documentation/ref-manual/ref-classes.xml
index 1dcd5fdd03..1f353b3c30 100644
--- a/documentation/ref-manual/ref-classes.xml
+++ b/documentation/ref-manual/ref-classes.xml
@@ -191,7 +191,7 @@
         tasks such as fetching, unpacking, configuring (empty by default),
         compiling (runs any <filename>Makefile</filename> present), installing
         (empty by default) and packaging (empty by default).
-        These classes are often overridden or extended by other classes
+        These definitions are often overridden or extended by other classes
         such as the
         <link linkend='ref-classes-autotools'><filename>autotools</filename></link>
         class or the
-- 
2.23.0

