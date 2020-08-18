Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.72291.1597774429303598332
 for <docs@lists.yoctoproject.org>;
 Tue, 18 Aug 2020 11:13:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RTHZfKTO;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id g15so5696409plj.6
        for <docs@lists.yoctoproject.org>; Tue, 18 Aug 2020 11:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=6c9lFJS3Z7cDHB/phGD2Arb8wFoz4pkIOSHNJtbQldo=;
        b=RTHZfKTO2qk06tpyYlUkqG0dDGh3XM20T8y60lVqttwkLG/N+LG6eu42g4bG/qoUKV
         kARvIXNQDGhtyUg6T3w1buIMtJ2zcnkXzMUY7I7Kl2X+oFtAAI82eggYyK5AUc+CQQxr
         DBvRWd3R01XMEHQLH7k8nrVomejAc+WDcLK6o4O67QqF7bGUS9oSwyMa69L+PQHUtL3h
         TOPAYJ/RtgJdFHisUg5m60bF9xVUNlaG/mX+3rFFAd2yMhcGd8QUllx30XJD2dbdir3r
         23Xmeok56g1msOG5gIYhaU8pEQThJ21KiKPuZux/2e6gamYDJwM6nzIsKk6OehuNtjql
         FSVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=6c9lFJS3Z7cDHB/phGD2Arb8wFoz4pkIOSHNJtbQldo=;
        b=kUsflraucZYN9+tfjJ7uTqAJcU/0n/1bPE7rmdgJFtl/2LwT1hg6iwdVJTYophZEbY
         03kdiFOHFrzs2KblCv30PUOnQZbSOzyA3vZj+5l+sj5cMlR9w1inkG0V061Bp/kB8AGA
         LwF4Q8sl2iqRyFzDdZiL1AaKWjkL3+T1+e0hP46X4SqmQM9797mzAZ2A96uOvC8aEo2R
         usxR/eTbWGN4r2pJiRokwjz02AeSsgIOKqManX8zcThyo8WLvXEb/UmFONNksneonm5J
         GZEwaDoDCpCReNTLugJX2GhUVP8R8ukmYwftEn/Xjm0FPZ+DjFvh729nkE7MYm4/f1nI
         kc6Q==
X-Gm-Message-State: AOAM532N960E0P5mrvw3k/+Rf49p9x+7EzKb2rdNHJq55MOBPVSqphpb
	Rl5kjq4XvsjfPnGaCseJp8f/Gm7vIEE=
X-Google-Smtp-Source: ABdhPJxX9q6NsT0Fitl60X3bxnHdALM3NFFklRRGTV+l/NwzxoWZ/CEIMiP9l+ojdIfc23uVn3yNRg==
X-Received: by 2002:a17:90a:d70c:: with SMTP id y12mr962040pju.31.1597774428502;
        Tue, 18 Aug 2020 11:13:48 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:3543:531d:382f:ed2a])
        by smtp.gmail.com with ESMTPSA id t33sm22795503pga.72.2020.08.18.11.13.46
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2020 11:13:47 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [master][dunfell][zeus][PATCH] migration.xml: Use Fixed release ref instead of var
Date: Tue, 18 Aug 2020 11:13:45 -0700
Message-Id: <20200818181345.12733-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

[Yocto # 13867]

Because we use &DISTRO in the corresponding XML, when we
generate the doc *today* it says 3.0.2, but it should be
set to 2.3. So we shouldn't be using &DISTRO.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 documentation/ref-manual/migration.xml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/migration.xml b/documentation/ref-manual/migration.xml
index d3d5b16bd..a24452b23 100644
--- a/documentation/ref-manual/migration.xml
+++ b/documentation/ref-manual/migration.xml
@@ -4115,7 +4115,7 @@ $ runqemu qemux86-64 tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.
                     </literallayout>
                     You must now supply a recipe for
                     <replaceable>recipe</replaceable> as part of the command.
-                    Prior to the Yocto Project &DISTRO; release, it was not
+                    Prior to the Yocto Project 2.3 release, it was not
                     necessary to provide the script with the command.
                     </para></listitem>
                 <listitem><para>
-- 
2.17.1

