Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13C09C67861
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 14:56:12 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.139245.1712674569350853754
 for <docs@lists.yoctoproject.org>;
 Tue, 09 Apr 2024 07:56:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=jGjjq+lg;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-343b92e54f5so4290693f8f.0
        for <docs@lists.yoctoproject.org>; Tue, 09 Apr 2024 07:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712674567; x=1713279367; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J9VicHkb4OzGNE7jVfT46223AE2cQeNYUc6kOxtnq1U=;
        b=jGjjq+lgb1HuLZE4mhhR15jY8/l+OhkyEO2KCQLQrDOYfUu3S1ouL1/y6Lq1a1iS4b
         AbETA338QMoI3424hoxqVsIZhimWsuVOjTaoHSLPGRQVzOfv9MVJcxy9JKnyKC3Gdz2s
         0jRhhMW6CdSEs6kPZRx+3ATskOoJtmkYuL79AgDohvYyH6D7mAMamQbC6hDcDbsALPYk
         9YYVZaRHtdzGTooMP3btq6EhxGAXVZOdpvLhH2rJZFimGxQwPqwYG0cZAAQjLqAL4slW
         FiWZFYsMm2O5coqeZQStGNEM0FuPJuwNyNfJ3U55+7KYISSgH/UTQe0uE1zjdawulr5N
         wTkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712674567; x=1713279367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J9VicHkb4OzGNE7jVfT46223AE2cQeNYUc6kOxtnq1U=;
        b=s1jNwmFtyqrIUjqwThGCPhaH97nQUH/X/m4j77oTKHVoAVbFpmSXr+yiRTD8Gn9+YO
         hBSAFDSOSMyhpn2zpBmDLCWlN3z8uAeJ+fwcKZDnl9jAFsFTWBhNdqlke9+fs/u67a4S
         h+axA6Q3VN/2pHGlTrOBOJNu6Ha6zdhBnPFhztUp/1Dwd4Ve4aMsKVwjfXenHETqKXMe
         lKt2nEVHklaNQ6pLspU/MHOQtS95JJR1ZyLg4rUVy0cabts8KFt9SifMU1xzmlPQojbx
         8oGHy3xxS7Ent4cREjaVykM73x7oa/7yXTtB2ZlG5EQKteO9qpdSjkpMdo1RLDhu8dqN
         ACGg==
X-Gm-Message-State: AOJu0YyRZKXaP3r0AhIOFQPRYwcYct7ilftZFKDmcW9SuUwLZN1kMe/h
	58Lb1QUJWCtMrxDK5MUrIYH0vYRP/LXkXcTKeQFy403oo97plscTZ+d53w8BxJZiletyFf9L4s8
	6
X-Google-Smtp-Source: AGHT+IHGnydQVYj1oK6Wnq53JnfJhgcQ5k5v4+tEq4+Rn/TAU+2EpSVLvyRgvFR1zrnzZSBsn1ucuQ==
X-Received: by 2002:a05:6000:124f:b0:343:85f5:63f1 with SMTP id j15-20020a056000124f00b0034385f563f1mr7354604wrx.40.1712674567384;
        Tue, 09 Apr 2024 07:56:07 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id r24-20020adfb1d8000000b00341b451a31asm11788693wra.36.2024.04.09.07.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 07:56:06 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH 1/2] ref-manual: variables: document CVE_DB_INCR_UPDATE_AGE_THRES variable
Date: Tue,  9 Apr 2024 16:55:43 +0200
Message-Id: <20240409145544.3115398-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240409145544.3115398-1-yoann.congal@smile.fr>
References: <20240409145544.3115398-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 09 Apr 2024 14:56:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5093

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 documentation/ref-manual/variables.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 52062b63f..97abb398c 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1688,6 +1688,11 @@ system and gives an overview of their function and contents.
       The list of package names (:term:`PN`) for which
       CVEs (Common Vulnerabilities and Exposures) are ignored.
 
+   :term:`CVE_DB_INCR_UPDATE_AGE_THRES`
+      Specifies the maximum age of the CVE database in seconds for an
+      incremental update (instead of a full-download). Use "0" to force a
+      full-download.
+
    :term:`CVE_DB_UPDATE_INTERVAL`
       Specifies the CVE database update interval in seconds, as used by
       ``cve-update-db-native``. The default value is "86400" i.e. once a day
-- 
2.39.2


