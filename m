Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CA32C433EF
	for <webhook@archiver.kernel.org>; Mon,  1 Nov 2021 12:00:00 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.42746.1635767999638455812
 for <docs@lists.yoctoproject.org>;
 Mon, 01 Nov 2021 05:00:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=G2SFgv69;
 spf=pass (domain: gmail.com, ip: 209.85.208.175,
 mailfrom: uvv.mail@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id y8so406329ljm.4
        for <docs@lists.yoctoproject.org>;
 Mon, 01 Nov 2021 04:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AVSUizKESGnHvP9GCH+g1FScrYeaZghaiovRhvIKc3Q=;
        b=G2SFgv692mY3vo1XFq/syaRhoVDJ7Vv/DCEJL6pEk3kTDE+hLvxG8h4WzumnxH3+z4
         c4+vSsYXu/xH1ADtByy4GkoUuG2/Z03HSdgALTi4+m7h7qXFMISCzLZWWsIBMdYSBfvC
         vw2GGvayNoQpSmFZ0unnm0GdG5KPNLbKCJr4tHbKUxjB9vJ+UnwOXndMU6AmepBDPga/
         I3daSLgcTIi8UXP7JP5zvCJYCGVxIwzL/VJ3x8OQDG9GwS34EGnAd+u9TEbBChRtUbWV
         L3Lwn1ICy9CR+BWG/CJJjlIoB+62nKz7OR08h0T6YBlDx0m0gMT3yUYGgbR5lYQj5YaM
         kRTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AVSUizKESGnHvP9GCH+g1FScrYeaZghaiovRhvIKc3Q=;
        b=aqiVcwVTvYoI8mWkA/oeGmp9nxh6EcDXO18UPhg+fctpCK391v6LUbEKiPhJSs11f6
         Pa6NVlss5ryWpsAXRPl6oVg4I0FShGFtuGphSaS/8iN28GJJB8VMIPIvwtxmXbKANnY2
         DbxEiQQ1LbRI38oXkKqxlN7Mps9mhkfH4TmJ9P/qS37JZYB7VBAJ4x+Dk6Eqiu4QrlIl
         ipEpKqh2FcGScRHvIC0GF+RRMbDntaz1PWi+DwTQcZ12hxleUe4iZNOsQtaJ0h63DG+b
         Ml0O9ZRd0TOh3uVydxr1NPahV7j+4qCsFZIDLm7vlv+HBAxv1RWA4I2lNAikP0UCjz5Y
         oh/Q==
X-Gm-Message-State: AOAM531/APU2E7Ml6YDQWHJSGGizrgUcf1zQMmAyWQu1mr78Pz24x7/w
	MhFUyi0a/wKTKwwxaM+rcP+kkTV/swLqtyLVLg4=
X-Google-Smtp-Source: 
 ABdhPJw2LBR7jDKBbh+XLlf08yZn/GsUCElpitFE9yS56T8XSKpEHhcpTaRDX8B0JsV63vL0UYk3ew==
X-Received: by 2002:a2e:3906:: with SMTP id g6mr21544200lja.291.1635767997373;
        Mon, 01 Nov 2021 04:59:57 -0700 (PDT)
Received: from slackware.local ([185.253.97.12])
        by smtp.gmail.com with ESMTPSA id
 h14sm1395847lfv.83.2021.11.01.04.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 04:59:56 -0700 (PDT)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH] ref-manual: update  overlayfs class
Date: Mon,  1 Nov 2021 12:58:42 +0100
Message-Id: <20211101115842.17956-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 01 Nov 2021 12:00:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2057

Describe how to use a generated helper service to set up a proper
systemd dependency chain.

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 documentation/ref-manual/classes.rst | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 9b1ead66b..1638f6ea0 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1742,7 +1742,8 @@ Then you can specify writable directories on a recipe basis (e.g. in my-applicat
 
 To support several mount points you can use a different variable flag. Assuming we
 want to have a writable location on the file system, but do not need that the data
-survives a reboot, then we could have a ``mnt-overlay.mount`` unit for a ``tmpfs`` file system.
+survives a reboot, then we could have a ``mnt-overlay.mount`` unit for a ``tmpfs`` 
+file system.
 
 In your machine configuration::
 
@@ -1752,6 +1753,22 @@ and then in your recipe::
 
   OVERLAYFS_WRITABLE_PATHS[mnt-overlay] = "/usr/share/another-application"
 
+On a practical note, your application recipe might use several mount points,
+therefore you'd like your application to start only when all overlays are mounted
+otherwise you might end up in a situation when application would write to an actual
+underlying file system (if it allows it) or could't write at all (for RO file systems).
+To achieve that :ref:`overlayfs <ref-classes-overlayfs>` provides another helper 
+service, which you can use to set dependencies on. The systemd dependency chain makes
+sure the service start only when all ``overlayfs`` mount points used in the recipe 
+are mounted. File name is fixed to ``${PN}-overlays.service``, so you can depend only 
+on this service in your application service file. E.g. if you have a recipe 
+``application.bb`` and a corresponding start-up service ``application.service``, you 
+can add dependencies as follows::
+
+  [Unit]
+  After=application-overlays.service
+  Requires=application-overlays.service
+
 .. note::
 
    The class does not support the ``/etc`` directory itself, because ``systemd`` depends on it.
-- 
2.28.0


