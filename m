Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB9DEC02185
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 23:37:59 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.32773.1736811474347219790
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Jan 2025 15:37:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=euLk8aau;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43618283dedso46510155e9.3
        for <docs@lists.yoctoproject.org>; Mon, 13 Jan 2025 15:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736811472; x=1737416272; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h69HiAb1DPNqbA11KfY9tg6cMYrctp7TvS57zryS2Qw=;
        b=euLk8aaujp0IaKPkqWGm4DNOXefIc1/tlq9R96rFboXo2qMmqcSVJvfmoX2qbijMzk
         uQOsnxcuvI2q+BoGQJ0ZA23BEmwQz5DF4oZP80UArCGgvLAwmmkDJhR1QL4R1mEAvG1H
         zzZiRNH0fWPz2ZFwuo3I0EssmbZLpjA57y1zvzz/39YO4OgSlmOLtDYWb64QN0nQMKjs
         d7oLXD96dkjLgha2vVXjoNeuxYETxZYjri2JyJJzWDwDl6Q5qDC5RUXzmNOKWXi7SUh/
         xAZF4i8IdyTyMx80X2+2fqMBGAB4uvBh02cp0710CR/MBr5qo4Svc3c9niLTLAIG6Gn+
         dW6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736811472; x=1737416272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h69HiAb1DPNqbA11KfY9tg6cMYrctp7TvS57zryS2Qw=;
        b=TKTnqALfjHA44e73fiyZkCpCR1+8Rtnvj4jZR+NyLQdxv9LsNYJ7TTRyaXtRIZO1l3
         HMr7Kl8xePctk9UwVmaw2dyga/ZI3IC0eKQ3EwCslX5hXcVaRvB/M05AzGpmPy12L+MF
         76ZgkFeRMq3ec6SUy7viaYcv2B4F5F/NR2BoQz4PexVHXllkFgJ5CyPnZM0pIxB656H7
         oVIMZzjZ3CdVKGB6r7zuU7ZWjDxoFlbTT2ItxwBw5FCsXwfo+o46ynnspP2XLuad7AWs
         XOJaXrC+z0KVriNfZCKk5djCZ6R6TNv/HhP/LJ7pE34DQzfW8excVe3FQi9NV3dcbyGR
         6ezw==
X-Gm-Message-State: AOJu0Yz07kMgg+jXRs5/I1d/zllxSIyZ30I/vDQWA++fsf90vpw47Qww
	K/C9ox/Jzy5Q9h2UJBM8EKfwncdeCkxpBk/DNBcCg9fJXB/8Gqzw9bu+Zusr
X-Gm-Gg: ASbGncvBNAzBm9RthVju3OGSiY9HBjxuNjhnZHAedUqFUCwO4Fa5/HHZ7vlyFLpvV6i
	/9Wle5RFKH8DWTMq0SlnIwWdYzyP88H8jQZprF0zea6PFPRPXjM2ZTjj4l5/+5yiywm+iEaTimm
	TwibwXH/hUTl9dRd9d43nFSKcMuWhKMZo+tAEE9hCUcEUwG0SLdW96P1EzaAmaavYVYKFr7J7oH
	qbXSDtpBnbOO+aV8By/HaYpI54felwqrO9l71zlYEwrWcL+o/akbIdaj/mleydNaI+ZO1Q6oRaT
	d2U=
X-Google-Smtp-Source: AGHT+IHiWwHcMu9C1WEQKrAsv7wu7aZ0xlwWjWQgzPwglFzM0bt/A7iRJQv8oGIr4WDHfqzc8fnTQA==
X-Received: by 2002:a05:6000:18ac:b0:382:3c7b:9ae with SMTP id ffacd0b85a97d-38a872de120mr21844975f8f.16.1736811472434;
        Mon, 13 Jan 2025 15:37:52 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bddbf50a2sm2898727f8f.43.2025.01.13.15.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 15:37:52 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@gmail.com>,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v3 3/3] sdk-manual: extensible.rst: remove confusing post-install-logging
Date: Tue, 14 Jan 2025 00:31:18 +0100
Message-ID: <20250113233736.4181201-4-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250113233736.4181201-1-adrian.freihofer@siemens.com>
References: <20250113233736.4181201-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 13 Jan 2025 23:37:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6097

From: Adrian Freihofer <adrian.freihofer@gmail.com>

This is a fix for 22dc5b3be3b1fbdb9447999b71f79db055271826, which has
completely replaced debug-tweaks. But in the context of devtool ide-sdk
and the comment in the example, the post-install-logging-image feature
doesn't really make much sense. Therefore, remove it.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 documentation/sdk-manual/extensible.rst | 1 -
 1 file changed, 1 deletion(-)

diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
index 3733997fac4..1cb1bb47c2c 100644
--- a/documentation/sdk-manual/extensible.rst
+++ b/documentation/sdk-manual/extensible.rst
@@ -658,7 +658,6 @@ The extensible SDK supports two different development modes.
          allow-empty-password \
          allow-root-login \
          empty-root-password \
-         post-install-logging \
       "
 
       # Remote debugging needs gdbserver on the target device
-- 
2.47.1


