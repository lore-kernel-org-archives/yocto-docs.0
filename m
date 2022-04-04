Return-Path: <abongwabonalais@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6039EC636FA
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:46 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web09.34657.1649076926179505200
 for <docs@lists.yoctoproject.org>;
 Mon, 04 Apr 2022 05:55:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MHvDWl8D;
 spf=pass (domain: gmail.com, ip: 209.85.128.42,
 mailfrom: abongwabonalais@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id h16so5893268wmd.0
        for <docs@lists.yoctoproject.org>;
 Mon, 04 Apr 2022 05:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qDkx8Xffct4qKp+gE5Ij/rZGLD3nYLYCZDL1IG+LmLQ=;
        b=MHvDWl8DMYq5RfYjbZOTaMYN68N90EFTa3RjS3wxNffJ4YrZ9CwKkeX4YV8xGtnpiB
         Tvrt3+pAbI0KXIg+Opu61foT+0cfBv5WiGgl1MJaH+dZrdw6hViF253hdSup1/4Vf3KM
         rNdy7e8WXCrlszDa6kfYkftOb4evvPvBebXP2gIOSA9NPwYM3xfxWTH3ECVD+7DjeoXw
         jAB2+w4SL0NQqVrexJofSTqyeHuxOmjwcrenvEJxZxdYEMMd2h82EFtTa64uM+OJ/L7d
         x//XGL7K0rCCW8nzmS6NvX+kQgVw1kmqsD0MuhsubabORB7BW5aBsuEcA68q08Rsaeai
         OxJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qDkx8Xffct4qKp+gE5Ij/rZGLD3nYLYCZDL1IG+LmLQ=;
        b=vlL0W7PH5yoWOqkcmVK6Z2osBnHAry9Y0Io0RnpSUohHbREEIScNohp2uH1ISvZW+y
         snw2F9AWTAv3q8Q8jbdx/D5emaNunB5vPulOVQW9u4GgMV0snZ+VlGUnSOmUQ7QyK1AX
         e+a2l3CFWGhOMGfMimaXiXTNTTJ0wQ8CUa+y0dRFG5UGgsEcwpPWz4QO6rI+Uq2kkTIe
         BEvNy0cndIUsppe064CgS3ChTaUysUBxZeYuXVZBgrk2+BT9Qpit97Yn263tfItHMSj7
         aY/OCZ18cYOSl0l9w5jd8DCVsLCz+Sm7Pion8ENXqzgkDp1q+7P68NsRZymoTod54rV1
         GKvQ==
X-Gm-Message-State: AOAM532hlqaYcmH5fChZp18690ABIKeV332a2+ciTj7DU0NQ+yBMQR1R
	ZAXtbLugtTlkJEOWnxP78WPHO0aZE0TmnQ==
X-Google-Smtp-Source: 
 ABdhPJyJnsBxX2DRjeHThC0qUDps5UbUURVSRYzvy7QutsTQDn/NtRSplDdkF8B49Bdn2A/wwY3DJQ==
X-Received: by 2002:a05:600c:4f15:b0:38c:b729:4838 with SMTP id
 l21-20020a05600c4f1500b0038cb7294838mr19196560wmq.132.1649076924386;
        Mon, 04 Apr 2022 05:55:24 -0700 (PDT)
Received: from localhost.localdomain ([154.72.153.150])
        by smtp.gmail.com with ESMTPSA id
 k2-20020a1ca102000000b0038c78fdd59asm17500415wme.39.2022.04.04.05.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 05:55:24 -0700 (PDT)
From: Abongwa Bonalais Amahnui <abongwabonalais@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Abongwa Bonalais Amahnui <abongwabonalais@gmail.com>
Subject: [PATCH] Added command used to add the signed-off-by line.
Date: Mon,  4 Apr 2022 13:54:35 +0100
Message-Id: <20220404125435.8545-1-abongwabonalais@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 04 Apr 2022 18:46:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2752

Signed-off-by: Abongwa Bonalais Amahnui <abongwabonalais@gmail.com>
---
 documentation/dev-manual/common-tasks.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 9d4aaa5a6..4e4311021 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -10595,7 +10595,8 @@ Preparing Changes for Submission
    following these accepted conventions:
 
    -  Be sure to include a "Signed-off-by:" line in the same style as
-      required by the Linux kernel. Adding this line signifies that you,
+      required by the Linux kernel.This can be done by using the ``git commit -s`` command.
+      Adding this line signifies that you,
       the submitter, have agreed to the Developer's Certificate of
       Origin 1.1 as follows:
 
-- 
2.25.1


