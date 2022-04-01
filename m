Return-Path: <abongwabonalais@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91573C43217
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 14:43:47 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.1173.1648831050059559973
 for <docs@lists.yoctoproject.org>;
 Fri, 01 Apr 2022 09:37:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=auEEUGb0;
 spf=pass (domain: gmail.com, ip: 209.85.221.47,
 mailfrom: abongwabonalais@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id h23so5022318wrb.8
        for <docs@lists.yoctoproject.org>;
 Fri, 01 Apr 2022 09:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TMraniO6+pZGE5s61OsC049OU4uSdlYhTXZb8e9v630=;
        b=auEEUGb0vR5tmKmwdAhTIBxRk2iSpGyueuXi3223OwKOJM/2jzoz9mOViF6P/91D+e
         Rz0TW7VMs3PVwNh6uIcylaMMemouO0QSjkcJ5kY/Xz95wuNZEhNrw6qm3o0NQz69FAlh
         gfzvOdyTQsaSWAHtcq6WaSc8I8Bwo+AWatTZmVQkxA0RpYGW05iid6bguF/kvudnlNQq
         e2EIzroZKm2JH5xrSdb3Zr5mZmb7tsJ6AXIunLz3ObH0qB68TNpwnTJe6jhl74FS9K35
         iHVZrB7vDD7UDdbieBjmAJU2FO7ExH3LnMPuvZQgdNtasBjadCoGCtjJJrs7SH4iFxS8
         4qeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TMraniO6+pZGE5s61OsC049OU4uSdlYhTXZb8e9v630=;
        b=Ey7bZazlwb2B5H2GXkKSokJSMQ8DHZeQ1EqPAv3uERJtUqSDQVzpnMV4XZbSyx8JvY
         +K8ZV8roCYVAqjhUeu4F/pfhwso4YYZmmWodQ8U/eyTD1lwVIYbtZ+Pu//tphSACLVh5
         wjApqldNdnMVP+h81UP2X2WehVi8yzw343pPFzJ818vjw5rx+Jvx6/yE9cLU6NOL/Fan
         YHbXwbMSPgxROSwWYgqG+aAsio30ogZMLjdKWdyiw5worbqWFtIZpz3bmEUa3vblbe2I
         qJErHi+ZuU5Du99PhOttshDvHC6Ei3HPk/EhY5IozTmwHp1J4nV0nJm347ZlR2xuHF6O
         Hm8Q==
X-Gm-Message-State: AOAM532sgoLmmPbag1BDRaCVFZldrIjugu9uARcW8RuDa6SI2qjzARAm
	gX6SJOkYSDtkWQ3zjCCNAm57p4NhMRo=
X-Google-Smtp-Source: 
 ABdhPJxxeQ9vOtn4lQi/YYPgb5h8r6y93FezNeTFADYX/CU29MhMnukWlE0PZtR/qrAMoPAL8b+iRA==
X-Received: by 2002:a05:6000:15c3:b0:204:1185:7033 with SMTP id
 y3-20020a05600015c300b0020411857033mr8174042wry.625.1648831048037;
        Fri, 01 Apr 2022 09:37:28 -0700 (PDT)
Received: from localhost.localdomain ([154.72.153.145])
        by smtp.gmail.com with ESMTPSA id
 ba23-20020a0560001c1700b00205ec84327dsm2698514wrb.116.2022.04.01.09.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 09:37:27 -0700 (PDT)
From: Abongwa Amahnui Bonalais <abongwabonalais@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Abongwa Amahnui Bonalais <abongwabonalais@gmail.com>
Subject: [PATCH] added precise directory for local.conf,
 changing it from local.conf to conf/local.conf
Date: Fri,  1 Apr 2022 17:36:49 +0100
Message-Id: <20220401163649.20625-1-abongwabonalais@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 04 Apr 2022 14:43:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2747

---
 documentation/brief-yoctoprojectqs/index.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index ad5d8a950..12cab1db7 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -250,7 +250,7 @@ an entire Linux distribution, including the toolchain, from source.
       This is relevant only when your network and the server that you use
       can download these artifacts faster than you would be able to build them.
 
-      To use such mirrors, uncomment the below lines in your ``local.conf``
+      To use such mirrors, uncomment the below lines in your ``conf/local.conf``
       file in the :term:`Build Directory`::
 
          BB_SIGNATURE_HANDLER = "OEEquivHash"
-- 
2.25.1


