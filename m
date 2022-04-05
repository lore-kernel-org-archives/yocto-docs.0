Return-Path: <abongwabonalais@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96359C55191
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:49 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web10.3798.1649148849418718592
 for <docs@lists.yoctoproject.org>;
 Tue, 05 Apr 2022 01:54:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iTAA3lbI;
 spf=pass (domain: gmail.com, ip: 209.85.160.173,
 mailfrom: abongwabonalais@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id i4so9973567qti.7
        for <docs@lists.yoctoproject.org>;
 Tue, 05 Apr 2022 01:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zHby8bmq+1vFmLV7Rv4z3dwac6MUy2MBTbi9v2Ewizs=;
        b=iTAA3lbIIvou+uy55gwpQC8PhzQBHoVFW4yEZu2KW0dJZmxgng/XC7E0cHN6KgqrVD
         P2bjkYqcdMnL3mgFTHPmO1C9G1PvEO5NllJfpNrgQMjcE2+uCaHc5RJSwkDBxLCyp8c3
         Zzzgrh50DaftMyUGXSjflOQbI1Pr0Wa3q2IAlEI6B/1h4nyIWfVKKeC4HEDLwwZGoSO0
         BtDT1xqJhtczqVkCALjxTrMlOM6x6unYRpyx3bCkgO/iD9ctmb6qb4taigp8hvQTNhQY
         J0pMpaSEJFeDTO4ldnkttSoj1rtpNb5+2BF/tPtUrsHjJXfrnoyrP4x0cy+8oii2iytg
         HKrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zHby8bmq+1vFmLV7Rv4z3dwac6MUy2MBTbi9v2Ewizs=;
        b=GFMmXxrgy1hOVOZhF7NUg12gTFkg4pxm52kWL5mQ+XAOKOoYUXMNuJgBY4lB/WZJhJ
         vD4grodny2rUZm0DP3aIml6PHbon/Bvy3Tpya6Ad5Cx+tF1S+i8f1bKZgnnVULimlFIx
         xblSk1cFfg8vs/UR9KuaWAngOiCkyWbXKUjufym1I2s0QOwO013ij5Kv6oh3Aynp1fAi
         I4WbDtuJFPIDYuuuDUBDC/L8e+zPLRpbx48f9grvDMGVURE27AhmU3HzRPoJxHxVzJsU
         bYb03aiI5f0k6hIOedtkwQH+MaWTQs35gjyYhuo/EcpEd18aWM1gIghOv1pyE9AEK9jr
         8vmw==
X-Gm-Message-State: AOAM530JMwFpyTjCSXrrIluiEunf5F9DXzk54ZBY9ZYoWEfaCJjd0V7N
	fgDqJAXsMO6P9+uBbtql5tAcbqqT97g=
X-Google-Smtp-Source: 
 ABdhPJy3FVLCPay6UAfGHFqaNtjNX4gbObep9GB2KoS7QZF904/63v0JPlXlClkwqp7N7H8ln6ANOg==
X-Received: by 2002:a05:622a:138e:b0:2e1:e80c:a02a with SMTP id
 o14-20020a05622a138e00b002e1e80ca02amr2027830qtk.546.1649148848453;
        Tue, 05 Apr 2022 01:54:08 -0700 (PDT)
Received: from localhost.localdomain ([41.202.219.243])
        by smtp.gmail.com with ESMTPSA id
 d22-20020a05620a167600b0067d8efed4d4sm7809249qko.26.2022.04.05.01.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 01:54:08 -0700 (PDT)
From: Abongwa Bonalais Amahnui <abongwabonalais@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Abongwa Bonalais Amahnui <abongwabonalais@gmail.com>
Subject: [PATCH] Added quotes around variables to prevent word splitting.
Date: Tue,  5 Apr 2022 09:53:16 +0100
Message-Id: <20220405085316.40154-1-abongwabonalais@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 05 Apr 2022 17:24:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2753

Signed-off-by: Abongwa Bonalais Amahnui <abongwabonalais@gmail.com>
---
 oe-init-build-env         | 4 ++--
 scripts/oe-setup-builddir | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/oe-init-build-env b/oe-init-build-env
index 8c1bd54e57..38333ab858 100755
--- a/oe-init-build-env
+++ b/oe-init-build-env
@@ -42,8 +42,8 @@ fi
 unset THIS_SCRIPT
 
 export OEROOT
-. $OEROOT/scripts/oe-buildenv-internal &&
-    TEMPLATECONF="$TEMPLATECONF" $OEROOT/scripts/oe-setup-builddir || {
+. "$OEROOT"/scripts/oe-buildenv-internal &&
+    TEMPLATECONF="$TEMPLATECONF" "$OEROOT"/scripts/oe-setup-builddir || {
     unset OEROOT
     return 1
 }
diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index d4ac074ad9..54048e62ec 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -42,7 +42,7 @@ if [ -f "$BUILDDIR/conf/templateconf.cfg" ]; then
     TEMPLATECONF=$(cat "$BUILDDIR/conf/templateconf.cfg")
 fi
 
-. $OEROOT/.templateconf
+. "$OEROOT"/.templateconf
 
 if [ ! -f "$BUILDDIR/conf/templateconf.cfg" ]; then
     echo "$TEMPLATECONF" >"$BUILDDIR/conf/templateconf.cfg"
@@ -79,7 +79,7 @@ example, select a different MACHINE (target hardware). See conf/local.conf
 for more information as common configuration options are commented.
 
 EOM
-    cp -f $OECORELOCALCONF "$BUILDDIR/conf/local.conf"
+    cp -f "$OECORELOCALCONF" "$BUILDDIR/conf/local.conf"
     SHOWYPDOC=yes
 fi
 
@@ -100,7 +100,7 @@ EOM
     # to replace it for compatibility.
     sed -e "s|##OEROOT##|$OEROOT|g" \
         -e "s|##COREBASE##|$OEROOT|g" \
-        $OECORELAYERCONF > "$BUILDDIR/conf/bblayers.conf"
+        "$OECORELAYERCONF" > "$BUILDDIR/conf/bblayers.conf"
     SHOWYPDOC=yes
 fi
 
@@ -125,5 +125,5 @@ fi
 if [ -z "$OECORENOTESCONF" ]; then
     OECORENOTESCONF="$OEROOT/meta/conf/conf-notes.txt"
 fi
-[ ! -r "$OECORENOTESCONF" ] || cat $OECORENOTESCONF
+[ ! -r "$OECORENOTESCONF" ] || cat "$OECORENOTESCONF"
 unset OECORENOTESCONF
-- 
2.25.1


