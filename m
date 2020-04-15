Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web11.19653.1586971363955200185
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Apr 2020 10:22:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=feo2N5ix;
 spf=pass (domain: gmail.com, ip: 209.85.219.66, mailfrom: maxime.roussinbelanger@gmail.com)
Received: by mail-qv1-f66.google.com with SMTP id v38so463516qvf.6
        for <docs@lists.yoctoproject.org>; Wed, 15 Apr 2020 10:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D5DGSN0D+ny6n92lBJN8U4N5iJMN66Lub5vFMyZDX8U=;
        b=feo2N5ixQBnV7T+EnVSHgvGxs21k8cJ32rHS3Mnsd6Ca3QjqKWVlV1Tqu+V3WSt3tK
         TN8GeY8y2egitlXbH8BzpMB1ZQD2IO6maySYBuUwll5frFaqkM7MncuJuHLxf1bPYasr
         thjqQvLlrNTE0tlNXuZwrxAUrCVqud1oTlOC3A7InQRR/VpA7nxQ2TFjoFPkC/GdJZ+J
         GyldL9KvlD5/f8bOShdXgkFF9dbTmBoTgr+8xMMjT/vQs8wMa1nQCsFPmXQ73XMoqt2y
         LWJMBbXlNspz9dyyhP+FZwT8s/4ObvzuhiZia8NKLZnXrIsEqrfKd9/ZINWogWSuLqpk
         l0HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D5DGSN0D+ny6n92lBJN8U4N5iJMN66Lub5vFMyZDX8U=;
        b=FGaHVjJekew2IqYKZEKT2GI8DsOhwb0zb+xoMZY/zM0JrHqvJ2dfnbumUj/7tDHrZY
         QJ31usnqUKFILHRxNVYrOigK/4tL/CW5lC+UtI5G5wEcRVQQexhPf6bVNuIEUvlMn4nN
         EdmbBMEI98qKfsVgLhjLTo7kCSnpjVkmVY4WvUgBKSU+s6vauIvSt8uI+f0jTWZq2gi6
         i9YSDub4wyhnOUenO7hJMPEQoahmHM3NktYPlnnfAeiWMXj3aaGipLl2C/bVvJP21sId
         HZXIDbVQoBvto0a3UwH/y7MQ5iQjuf3dk7J3tzJtFbd/6NdoQFi/O0am0U/QlEODkZ3x
         sezA==
X-Gm-Message-State: AGi0PuaZ0cvrFHFtZWsCsy/2DiSGiIqz1WiBIO6kQz/5exHyU/Vv3QF6
	hOADxE0x6bTA35czy3/y9d8CfMLocMU=
X-Google-Smtp-Source: APiQypJGJLBaClVMXW8Uh4A6ZqYf4vo8uYU7s7dkNVv8VBWGigCwTn+eqHQ2qAF7USQUdW2o2pj6PQ==
X-Received: by 2002:a05:6214:1801:: with SMTP id o1mr5983124qvw.224.1586971362813;
        Wed, 15 Apr 2020 10:22:42 -0700 (PDT)
Return-Path: <maxime.roussinbelanger@gmail.com>
Received: from mbedesk.Sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.gmail.com with ESMTPSA id f188sm12902862qkd.101.2020.04.15.10.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 10:22:42 -0700 (PDT)
From: =?UTF-8?B?TWF4aW1lIFJvdXNzaW4tQsOpbGFuZ2Vy?= <maxime.roussinbelanger@gmail.com>
To: docs@lists.yoctoproject.org
Cc: jeff.dagenais@gmail.com,
	champagne.guillaume.c@gmail.com,
	=?UTF-8?q?Maxime=20Roussin-B=C3=A9langer?= <maxime.roussinbelanger@gmail.com>
Subject: [PATCH v2] dev-manual: remove postinst false statement
Date: Wed, 15 Apr 2020 13:22:40 -0400
Message-Id: <20200415172240.26085-1-maxime.roussinbelanger@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This outdated section contradicts the real behavior expressed in the next
paragraph

Signed-off-by: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>
---
v2: sent to correct mailing list
 
 documentation/dev-manual/dev-manual-common-tasks.xml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/documentation/dev-manual/dev-manual-common-tasks.xml b/documentation/dev-manual/dev-manual-common-tasks.xml
index 2b8868b62..8404d1c27 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.xml
+++ b/documentation/dev-manual/dev-manual-common-tasks.xml
@@ -3284,8 +3284,6 @@
                 The script defined in the post-installation function is
                 called when the root filesystem is created.
                 If the script succeeds, the package is marked as installed.
-                If the script fails, the package is marked as unpacked and
-                the script is executed when the image boots again.
                 <note>
                     Any RPM post-installation script that runs on the target
                     should return a 0 exit code.
-- 
2.20.1

