Return-Path: <bhstalel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E937CAC5A7
	for <webhook@archiver.kernel.org>; Sun, 21 Sep 2025 13:20:51 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.29218.1758460849176437580
 for <docs@lists.yoctoproject.org>;
 Sun, 21 Sep 2025 06:20:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D5Os1Gq5;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: bhstalel@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3ecdd162cd1so621218f8f.2
        for <docs@lists.yoctoproject.org>; Sun, 21 Sep 2025 06:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758460847; x=1759065647; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MvBMqOmrOiqMjZSwf7b7n8PPnVt9lfvmgikkO8Y15ss=;
        b=D5Os1Gq5h3YL0/DfCPOmaQjOykyJGvD8o7Q8wMvbJusUNLxOxuSwCUz6CDXs1NGaNo
         CTre/GBBvLsACwqsWlEaosOUErLpLNa1VMNwroqQlcX1iFENH9bd4Gd/lnzAWab99p6C
         4yRYmCyIK9KeaNGUS5wT/FfHY23KT3GYf5GaAJ7LSAXn1ql6oPWxOoXy9QXKbhm3HUvC
         8Z8sf9/VVld2q4E9ZzlbmlMrsQMh1hFFVGBFJ0PZEb9OFCpQ29n0yt+Amys3CDmizVL5
         TB6dpioKZMvd0iVTQr2F3I6CgvQnD96GLTeyOTH7B9XRLMANfofVsq4kHXUnb4Jfwwsa
         uFLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758460847; x=1759065647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MvBMqOmrOiqMjZSwf7b7n8PPnVt9lfvmgikkO8Y15ss=;
        b=bai5PQW89Ba+U18GriVT0KlGqNeGKrgkxwt8ogQ521L1Oeaa/nYqdR3JSzBdc+g9NF
         JlWlptROuC+OAm/hC8Uswxa/hzBxkP3ZV0Zw8qkjU+51OSaJx8p4g6Lbt8ghCj4PWqnh
         rMZuwegCHf2b1ZacUiHOsI9btmhHwkrN6V4dHpBPJnBqTHguZqIlSyrMY6D7T4a1kIjC
         aiIRVQXEazxHzUZiwdA+oyWuoWtXIPdeAH3Hsqk1dpZzIZia+pOD+bxOifIQHWGg2Yk/
         XE835gYeoVMbvQZmsmFG1buFoytJ7OpwazLWlHZi1BNWY9m7Dhqxt8iRcXjnI1QVrpJe
         q25g==
X-Gm-Message-State: AOJu0Yw2QaLMdQSw30aH++6g9RDyA5visPkiGg1eDrLra1a3oBmU4Nxq
	KNBWnrl0Ca5cBoaFMcGWTPFgrNvTLz91KJx0lziP2OSgsnXMHQ5+RPeV7PQ5MQ==
X-Gm-Gg: ASbGncta6ubW7xJut7BV9M9Fnz48Hu+EDCUmW2m6apiO6okrt/5pl6h1M0NrfwsV7mN
	mmmG9hjINcJD9LWMhrqh+pAngSJDytNINJGC6tJYWMsYJ4jr64zpWEfV/kQMjH40lxMR8dUt2/z
	Kb3Bv9LoiSaIp9LT5T+AImrg53RWCBDARzGONfGVspGwoefwtAJpBeBUsV5+XeL3E04biEu6mNL
	jUC9Y/+7sh8+cNJQyZtDXEPfbCkZ/ADnbUcsvTWTuvKS9JNXfSBSYpstWrwm/8224hccrRbVfxK
	BJJzfDlSu8RazpcCP9fCZl6ZYZWoFXzJi8aBWXZ998JLdb4AMO0HI/gVadmMrGg9/2TWqRfNguP
	wgaUyRygXVTlSmfuzdbA=
X-Google-Smtp-Source: AGHT+IHuV+0n9RQy1QVw13l489ndbZ4Q+6sYr9w0+k9Y1be9VNXM907YyoH4g3hc784HS98hwH6tLQ==
X-Received: by 2002:a05:600c:1e20:b0:45d:f7e7:f595 with SMTP id 5b1f17b1804b1-467f2243688mr50490165e9.7.1758460847036;
        Sun, 21 Sep 2025 06:20:47 -0700 (PDT)
Received: from techleef ([102.104.117.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-464f0aac3fdsm157558025e9.1.2025.09.21.06.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 06:20:46 -0700 (PDT)
From: Talel BELHAJ SALEM <bhstalel@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Talel BELHAJ SALEM <bhstalel@gmail.com>
Subject: [PATCH 0/2] Document some checks in externalsrc that could fail the build
Date: Sun, 21 Sep 2025 14:20:31 +0100
Message-ID: <20250921132033.31644-1-bhstalel@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 21 Sep 2025 13:20:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7565


Talel BELHAJ SALEM (2):
  dev-manual/building.rst: add note about globally inheriting
    externalsrc class
  dev-manual/building.rst: add note about externalsrc variables absolute
    paths

 documentation/dev-manual/building.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

-- 
2.51.0


