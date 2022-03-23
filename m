Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12F3AC433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 11:17:50 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.7869.1648034269124795353
 for <docs@lists.yoctoproject.org>;
 Wed, 23 Mar 2022 04:17:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XRuvQc8c;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id u16so1627119wru.4
        for <docs@lists.yoctoproject.org>;
 Wed, 23 Mar 2022 04:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RmZDeLdbr/pCalfJKUtMqAnDxoK3sa8j64tP+ovTgQU=;
        b=XRuvQc8cwJ7YRl8tuLRYvcWyFKp6wzLVqpXLtN/2iegz2LFurE2/NOUkee4nGfx9IJ
         EpxhijTT40nnvcfuUNrxKktIRagAPWhxukCAHs36wxmKbSl0k+Tqqk4GmHG7V70PZWCq
         HLzSD8iquE9tzt5SvNK0KOC08M7qIRwT6poAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RmZDeLdbr/pCalfJKUtMqAnDxoK3sa8j64tP+ovTgQU=;
        b=xIJE5mXPCuQoR8gJ8Puwgr54cvKfIoQWcxQmvI3RSUEOqtJX92ICB7xsqoBKCIeNPr
         U1uNaSkr3QFlQ+WbtJ2lknlCsSMrkhw4AJX02hi/YR2F3J5SPmrasQ/zLEind6WzCEgA
         s1favlt/iXdShjimDgflaZBR7VAoqoD5Ux76vnqTUGm7wgmnmGGPSvmECDAtOdqWRdQK
         SBaGVrdTo4iVaxY+4UnaulHtj91EEOmHbVWQELn0D5V4ZUOrhNzFzd0qaFyfEHDWLDDX
         U6iH80EFMdgA6WsDcMUWvQrzAJlQn4oE6EM6Ll19ssSGOU/ehJWooQaY436+SLV0DOxj
         G2PQ==
X-Gm-Message-State: AOAM532UrbFjW7dY/pvtKN0NWaG5+qewhfT8KtLV3MOpdvm6/xY+hN0i
	xuCPlc7XzN4H/n7tKkVs2nd7lCLZDN3fEMym
X-Google-Smtp-Source: 
 ABdhPJxKo2KnZMGbmt7rONiAIURhKSIkIDMKuN2W0iZ1yA5EceNuO3TeK7LCme8bd949XANaUOpOJQ==
X-Received: by 2002:a5d:5846:0:b0:204:1a79:f1ab with SMTP id
 i6-20020a5d5846000000b002041a79f1abmr10085378wrf.520.1648034266938;
        Wed, 23 Mar 2022 04:17:46 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:aaba:716e:9c38:ad87])
        by smtp.gmail.com with ESMTPSA id
 u12-20020a5d6dac000000b00204119d37d0sm7503182wrs.26.2022.03.23.04.17.46
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 04:17:46 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH] set_versions: Handle dev branch in switchers correctly
Date: Wed, 23 Mar 2022 11:17:45 +0000
Message-Id: <20220323111745.1266678-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 23 Mar 2022 11:17:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2702

The dev branch is being displayed in switchers under two different
headings, 4.0.999 and dev (4.0). Add an additional conditional to fix that.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/set_versions.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index af237f29e..b2859381e 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -220,7 +220,7 @@ with open("sphinx-static/switchers.js.in", "r") as r, open("sphinx-static/switch
                     version = version + "." + versions[-1]
                 versions.append(version)
                 w.write("    '%s': '%s',\n" % (version, version))
-            if ourversion not in versions:
+            if ourversion not in versions and ourbranch != devbranch:
                 w.write("    '%s': '%s',\n" % (ourversion, ourversion))
         else:
             w.write(line)
-- 
2.32.0


