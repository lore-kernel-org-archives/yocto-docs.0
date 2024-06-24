Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44A85C2BD09
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 22:12:41 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web10.155916.1719267160155982454
 for <docs@lists.yoctoproject.org>;
 Mon, 24 Jun 2024 15:12:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=cHz7XaHP;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.178, mailfrom: jdmason@kudzu.us)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dff36345041so4824293276.3
        for <docs@lists.yoctoproject.org>; Mon, 24 Jun 2024 15:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1719267159; x=1719871959; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8upqY4S9OQNBJNpqQhT3F962OVunX2DSTy4NMPq6DoA=;
        b=cHz7XaHP6yNWDCsNetQZD75lPa6zcz+skkJfbin22ibJozsxzfHVgmY+Iswx+xoQ3V
         uBKmYV7NIiQnhZ4JBKpBfBrMyKF009sCcfLAerTtIHsUZk7gcbqQLSN68A5LXenCZBCx
         uUtAmg/2HbWQ7WG/OIMOoiRJ3o0Ns8vWBO1WZWrNkByPsmnql5QHCOb7KfAR0QDuhH8r
         9AXqAvWZtjUac/SZnEgfI3w/Owm3objYeGnHEZ4I2kxf662SVSvZVot6zv8sFTOLWl/+
         q8SAlfDIOnJbCuDjmTof//NLR1Y1RKBixmWEEv0fom7gZO46iRj9qGpChfJV8qFtTi1Z
         pVOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719267159; x=1719871959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8upqY4S9OQNBJNpqQhT3F962OVunX2DSTy4NMPq6DoA=;
        b=LoJ848wQeNwpX0IL2I4wQINObRwzTJP6xH1xVH5X70Ex+vTz19h+e2/r1V1634Dx/k
         L4J88UfH23t6U0N2Nqz9/aifgo0lUq2uAVzd1gyOxRcTwm7QBFPdJZMtiDO8m0W3g2B2
         inXRjDdulsUOZTZ6YJleHasflvIFq6Gimf63a372rJGmSz5QqMzsSc7MOGthHczVE33A
         dXREBXcrus6NJuto9/5Oie7bEk6I4O5j0g87ByiEa0KdtzuJjpxPr8Rp48aYstZFbqiA
         evwot2X78brI5lKHYG69+rVMbErU6qagfrCKjg+9aiVS+jewV/qh3lfSSg9m+8RRFPxN
         t8aQ==
X-Gm-Message-State: AOJu0YyFEZnzOhWQk1PXZ60OubjX8Z4Toxge4QNytvXtk8y+onZlVTos
	4Eiq6rkfY2e4bBMQ0P0VLVJb3/3jObLOw1JSX5QkcGi3hoEE5IvMXq2+zl09k8qC3TfwbyTRIi4
	=
X-Google-Smtp-Source: AGHT+IGOzFOQ2hAOHxVTFJOXJSSwUM/jqzG0wR6tzIgPcmiHnLEQOr+yXnllmXKhrWfCM1pVxC3Jww==
X-Received: by 2002:a25:add9:0:b0:dfb:b53:aaf3 with SMTP id 3f1490d57ef6-e0304042e33mr4960497276.64.1719267158878;
        Mon, 24 Jun 2024 15:12:38 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e02e62633d7sm3556334276.29.2024.06.24.15.12.38
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 15:12:38 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
To: docs@lists.yoctoproject.org
Subject: [PATCH] docs: modify reference from python2.py to python.py
Date: Mon, 24 Jun 2024 18:12:38 -0400
Message-Id: <20240624221238.424162-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 24 Jun 2024 22:12:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5301

python2.py referenced does not exist.  Change the reference to the
existing python.py oeqa file.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 documentation/test-manual/intro.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/test-manual/intro.rst b/documentation/test-manual/intro.rst
index c31fd11c7a04..7e56217d7664 100644
--- a/documentation/test-manual/intro.rst
+++ b/documentation/test-manual/intro.rst
@@ -458,7 +458,7 @@ the ``devtool build`` command within the eSDK.
 
 These tests are run against built SDKs. The tests can assume that an SDK
 has already been extracted and its environment file has been sourced. A
-simple example from ``meta/lib/oeqa/sdk/cases/python2.py`` contains the
+simple example from ``meta/lib/oeqa/sdk/cases/python.py`` contains the
 following::
 
    class Python3Test(OESDKTestCase):
-- 
2.30.2


