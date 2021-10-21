Return-Path: <daiane.angolini@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAF1DC433EF
	for <webhook@archiver.kernel.org>; Thu, 21 Oct 2021 18:16:19 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web12.1789.1634840178993622643
 for <docs@lists.yoctoproject.org>;
 Thu, 21 Oct 2021 11:16:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=f2pij6iH;
 spf=pass (domain: foundries.io, ip: 209.85.222.179,
 mailfrom: daiane.angolini@foundries.io)
Received: by mail-qk1-f179.google.com with SMTP id bl14so2355887qkb.4
        for <docs@lists.yoctoproject.org>;
 Thu, 21 Oct 2021 11:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2qQStVcCgviXNGvGdEVJ34Lqin01cjBVWuaebdGcwP0=;
        b=f2pij6iH9toGHIJsK+cQFE1yG1HPTL4ztyi19Tw8zrmawKdgoCJFXgxS91PFeJsx1d
         BbyygFFQ1Ie7/6eiXdyNJCJXCHiBZkfruscxbri9WUhgAAOsHerN8l8Fttzw9Jv+tDc0
         ReizLbMS6A0lRj3ddISIHmtQvnFl4g205nSDXiFUQ44BDCP1EO1brAo8DJqOHeGrAQRE
         s87PttRPCDcnnZIBGm6dtQhbOE76VsYiWNosddGo6+BFuBBF6kVF8XwC9yQm4rlPLXVF
         QuJOjhTnN3OZekT9Q/XkEd2jvxNRsdYCM//rO6HVqEF18q1A6tX3TL1Gep+EtSqkykHV
         5w0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2qQStVcCgviXNGvGdEVJ34Lqin01cjBVWuaebdGcwP0=;
        b=Nl5UZviFk0luhTMzst4PIETZ5NTwnYLgMqNLaE64XX84anTmIj/DJ/0clgWTVxYj7e
         ZPb2cVzUIKZEVVbaE4Cge7ezG8o+wbDqsfoja/CdVe7mVGxykKr3YjcbUjgtDR2gkprP
         qetvhtlhrcjFXptmQd6Ea2vX/22dyO5eam6EThua5b6RCJUMYiP1/XiIgwedfHuR6BKW
         vG8b8srYaHbMwsFKz6OZWJPwzLi3ELjmiOIP7pQY6xfOtPn9xtXokFQuXuq09AEmU1T4
         f7b5qEOZ8839AwoGq2ywUEyKlk1lnN56lRfSn5f1p81yMJDBcwL1hUggEhSyzbmTRgu3
         LrVg==
X-Gm-Message-State: AOAM53038uwGvdploO3CWv/BAH+Ib8oLtKH5Oqk05gbDTU8Kdnqt1Ohl
	wBTFxuQ/gYGdxxBikyVbaTKW7LBQd7oK7A==
X-Google-Smtp-Source: 
 ABdhPJyUT6tQId/zkNN0RjS4X9r4nVnic1DiDcvHbqwDMcybJZrrt5wcvXPHOXFqdR2E7R2bMqvdvA==
X-Received: by 2002:a37:a87:: with SMTP id 129mr5740959qkk.107.1634840177895;
        Thu, 21 Oct 2021 11:16:17 -0700 (PDT)
Received: from localhost.localdomain
 ([2804:14c:3bac:19c0:6b87:7214:310a:48bd])
        by smtp.gmail.com with ESMTPSA id
 v21sm3274781qtc.93.2021.10.21.11.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 11:16:17 -0700 (PDT)
From: Daiane Angolini <daiane.angolini@foundries.io>
To: docs@lists.yoctoproject.org
Cc: Daiane Angolini <daiane.angolini@foundries.io>
Subject: [docs v2] ref-manual: Update how to set a useradd password
Date: Thu, 21 Oct 2021 15:16:04 -0300
Message-Id: <20211021181604.4077605-1-daiane.angolini@foundries.io>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 Oct 2021 18:16:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2032

Partial fix for [YOCTO 14605]

Signed-off-by: Daiane Angolini <daiane.angolini@foundries.io>
---
changes since v2:
- changing suggested encrypt algoritm (512->256)
- resultant -> resulting
- closing quote around ${PASSW}

 documentation/ref-manual/classes.rst | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 79af45ada..8747c4b08 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -590,19 +590,25 @@ Here is an example that uses this class in an image recipe::
        "
 
 Here is an example that adds two users named "tester-jim" and "tester-sue" and assigns
-passwords::
+passwords. First on host, create the password hash::
+
+   mkpasswd -m sha256crypt tester01
+
+The resulting hash is set to a variable and used in ``useradd`` command parameters.
+Remember to escape the character ``$``::
 
    inherit extrausers
+   PASSWD = "\$6\$kt.uxYMp9O9.Yxqd\$SBaJTucixmPm7/WjFL2CjUGMHTqtw8KPK0yxpYw.tGWWHlnOwkUwZ0Pa6vR724Te/E5./V.wua4HT/h0li8Lw/"
    EXTRA_USERS_PARAMS = "\
-       useradd -P tester01 tester-jim; \
-       useradd -P tester01 tester-sue; \
+       useradd -p '${PASSWD}' tester-jim; \
+       useradd -p '${PASSWD}' tester-sue; \
        "
 
-Finally, here is an example that sets the root password to "1876*18"::
+Finally, here is an example that sets the root password::
 
    inherit extrausers
    EXTRA_USERS_PARAMS = "\
-       usermod -P 1876*18 root; \
+       usermod -p '${PASSWD}' root; \
        "
 
 .. _ref-classes-features_check:
-- 
2.30.2


