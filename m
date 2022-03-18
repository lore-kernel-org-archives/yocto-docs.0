Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A5A0C433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 16:29:50 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web12.11749.1647620989397787956
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 09:29:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=h8Fxtuw5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id
 123-20020a1c1981000000b0038b3616a71aso5052652wmz.4
        for <docs@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 09:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=iC8y2v90POU5hqjTjO9t/J6kIzuXbNvXKLNUkrCbXOI=;
        b=h8Fxtuw5Gq61NeVnneJtrzLGKcK8bbmwE81s7KbjJqizDmsZaVrd2QyeCxgKzP5A50
         DGFwTsx/JwYku9+EtMZyuo+eeDVVka0UJbeXubbJpMPz72v+PXQPiZvdy9i4rQLejupb
         PJYeS/+Xe9uxfdA48Gml39QyBMc3agdQdLvLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iC8y2v90POU5hqjTjO9t/J6kIzuXbNvXKLNUkrCbXOI=;
        b=ex+SZFDyzF9fJ5CCTctMjJP5fOJBAbGJylNp1arCaw7Z6RYqx2a58TA8yn6ybvVLhb
         7oBkjPEjgRqtMn4x4uBYDv5R1Xk1N/owEQMv/gPF47I8WGRIW4AMWgJDZnh1/ilJ4ygh
         r1vHjs7VDiCA8hHhrBh9ZqMsqDzLTbkOJEbNWBoATBLbbaNgJx8wRDlbGcagrANlH8FC
         AzcZnvRHNBcEWqCtVFPSV5DZbK/q6x+qOM4aIbFzE8J7kRTeZodIifMoI9vAhm+9tDbD
         s372NWTN80t6UzJuw852+n+jmhrHc9Nzn19EZRNdSt6kjM1rfGdJ7QPJnhD0qshf1dqT
         M3Bw==
X-Gm-Message-State: AOAM53036bjHbai++74SI7986V8TCtMUvOzrkMhM46XVCvo1oSRwYMnk
	k70kZibpr1p0ga+RkvNUU6aEAe7upAuSBEa2
X-Google-Smtp-Source: 
 ABdhPJxMvPFj5iOEkS2VoyOsXq6gHnCJUDmQzJdVJEg/qYfhFLdpNgkOv7dppCJkgtIsTUkQ4HzeGA==
X-Received: by 2002:a05:600c:4b83:b0:38c:49b5:5bfc with SMTP id
 e3-20020a05600c4b8300b0038c49b55bfcmr13952128wmp.33.1647620987451;
        Fri, 18 Mar 2022 09:29:47 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:ac92:797e:3dcd:ed37])
        by smtp.gmail.com with ESMTPSA id
 v2-20020adf8b42000000b001edc38024c9sm7397469wra.65.2022.03.18.09.29.46
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Mar 2022 09:29:47 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH 2/2] set_versions: Handle older non-active releases
Date: Fri, 18 Mar 2022 16:29:45 +0000
Message-Id: <20220318162945.1072835-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220318162945.1072835-1-richard.purdie@linuxfoundation.org>
References: <20220318162945.1072835-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Mar 2022 16:29:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2642

Ensure older non-active releases are shown in the switchers.js
release list.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/set_versions.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index d9f57112b..394e3f7e4 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -145,6 +145,9 @@ with open("poky.yaml.in", "r") as r, open("poky.yaml", "w") as w:
 
 print("poky.yaml generated from poky.yaml.in")
 
+if ourseries not in activereleases:
+    activereleases.append(ourseries)
+
 with open("sphinx-static/switchers.js.in", "r") as r, open("sphinx-static/switchers.js", "w") as w:
     lines = r.readlines()
     for line in lines:
-- 
2.32.0


