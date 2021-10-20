Return-Path: <daiane.angolini@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FB5DC433F5
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 17:06:05 +0000 (UTC)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
 [209.85.222.50])
 by mx.groups.io with SMTP id smtpd.web09.207.1634749562544465125
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Oct 2021 10:06:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=GkYTH2RP;
 spf=pass (domain: foundries.io, ip: 209.85.222.50,
 mailfrom: daiane.angolini@foundries.io)
Received: by mail-ua1-f50.google.com with SMTP id a17so7880488uax.12
        for <docs@lists.yoctoproject.org>;
 Wed, 20 Oct 2021 10:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ByVwDNYb0qp5INcxGBMGeYu81vU2vcWm47bQc9Flw9I=;
        b=GkYTH2RPv9SvaZWdABgcuhPAKiUbnTTTwb9EXpo3B5qBJmjVSpbef7VJTSPzbQrQuu
         o43EBkwYTqqPV2Nm1RJRxhO+z4dRngAP7IJqLOXZC+M3G5tLy71I9CEDIlCD09pfoc4u
         ea307Q78PcH54f5gPclpQ0nrhnQQenBHY4rbzQOyzMyKWInR83W3u4ikrQ81FpDNVdGI
         KdNQt1NcQUdnBgTn0zz6WQ5SDAnY2szpnII4Viv5niU5HnDWu8w8Dtloikxj4rOzcmL5
         TwZr+aRcIScT+Qa7dhgja0xSDBE59UwdgRW8vt45g8h0xWjMNRveCv5W4RJtcE4PPJ09
         zbkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ByVwDNYb0qp5INcxGBMGeYu81vU2vcWm47bQc9Flw9I=;
        b=dcO7aT9tnSowVfw7v2IT6YcL4rlrOj5gFplRAvDFmkpAIUINomm7RxNaz8aVWhFqoh
         p9BNEFQeSho0Utmuii2mAD+iODFnxfxxDanHM+I99ZIODXxemBpa+CSvyrxpVhOAhe0C
         bIw3hbwOwzY7Qs8oXhY5ji+tn8scd44oHGjlre8PvzKNZpZj1N9u3JqpjkO1j6ecob/i
         Dqk2c+a7I1erRhPA9dkfDsCCbslMz1WPR16A7TzY0rk3yAoQYMSuXfmkEIsi8tH1xGtE
         0/0mdvLtwnCESOESO79zWWUVMGpriGz45g3kidy997LfORA9zKfVh3BGbsVdG1d7IAZT
         0awA==
X-Gm-Message-State: AOAM532NkqMw+hWy7OdfRQigBdtVPKUGWa2wOfTqSfrdgO3Po5sCVOjw
	yTVoKToJ6JCW9/XJ1Njpm8wpKiq3LL6kJw==
X-Google-Smtp-Source: 
 ABdhPJw1Ti0kWZpfqinRIMoCPkPVCEY49NcmGEkcjxM9Ild2upwh4Ej2WE6XMkl8q5n6IXYAFo/v9w==
X-Received: by 2002:a9f:32c2:: with SMTP id f2mr471543uac.51.1634749561263;
        Wed, 20 Oct 2021 10:06:01 -0700 (PDT)
Received: from localhost.localdomain
 ([2804:14c:3bac:19c0:95c5:19d6:e9b6:bd8c])
        by smtp.gmail.com with ESMTPSA id
 v3sm1672847vkv.19.2021.10.20.10.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 10:06:00 -0700 (PDT)
From: Daiane Angolini <daiane.angolini@foundries.io>
To: docs@lists.yoctoproject.org
Cc: Daiane Angolini <daiane.angolini@foundries.io>
Subject: [PATCH] ref-manual: Update how to set a useradd password
Date: Wed, 20 Oct 2021 14:05:49 -0300
Message-Id: <20211020170549.526108-1-daiane.angolini@foundries.io>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Oct 2021 17:06:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2014

Partial fix for [YOCTO 14605]

Signed-off-by: Daiane Angolini <daiane.angolini@foundries.io>
---
 documentation/ref-manual/classes.rst | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index ffaad9bfc..b09f83b28 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -590,19 +590,25 @@ Here is an example that uses this class in an image recipe::
        "
 
 Here is an example that adds two users named "tester-jim" and "tester-sue" and assigns
-passwords::
+passwords. First on host, create the password hash::
+
+   mkpasswd -m sha512crypt tester01
+
+The resultant hash is set to a variable and used in ``useradd`` command parameters.
+Remember to escape the character ``$``::
 
    inherit extrausers
+   PASSWD = "\$6\$kt.uxYMp9O9.Yxqd\$SBaJTucixmPm7/WjFL2CjUGMHTqtw8KPK0yxpYw.tGWWHlnOwkUwZ0Pa6vR724Te/E5./V.wua4HT/h0li8Lw/"
    EXTRA_USERS_PARAMS = "\
-       useradd -P tester01 tester-jim; \
-       useradd -P tester01 tester-sue; \
+       useradd -p '${PASSWD} tester-jim; \
+       useradd -p '${PASSWD} tester-sue; \
        "
 
-Finally, here is an example that sets the root password to "1876*18"::
+Finally, here is an example that sets the root password::
 
    inherit extrausers
    EXTRA_USERS_PARAMS = "\
-       usermod -P 1876*18 root; \
+       usermod -p '${PASSWD} root; \
        "
 
 .. _ref-classes-features_check:
-- 
2.30.2


