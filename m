Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C89CD767EE
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 16:56:39 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.17357.1730393792727672345
 for <docs@lists.yoctoproject.org>;
 Thu, 31 Oct 2024 09:56:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=etP5s1TI;
 spf=pass (domain: baylibre.com, ip: 209.85.128.46, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43158625112so9660645e9.3
        for <docs@lists.yoctoproject.org>; Thu, 31 Oct 2024 09:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730393791; x=1730998591; darn=lists.yoctoproject.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1o4G8h3x5SaYs0gPXX1YI/0UiKbBxnmoxTFZP1kdGuY=;
        b=etP5s1TIQFfA522dZuSphl/jXM6ekHLR4J3GCBefOenGklzAVRskA0/icbss4Qbbs2
         z3QAiq6//Li66j+MhN8c0NaXBgURzYKcE7b9C0bmNBW7NoaLhaOQHAKpqdZEGMLDPNXb
         falozo82w13BCTOfn42z9w9ovILO9Wkc7bY1+pt2T3P7ASxVNkJHh/XQeQm5xokMv/VO
         MzJkpHaoGdsWtzEXy8IcTCB/04uSxEW+dyaa3m2CaSpD98EimkJ8l2Rqo+uAO6h9JaiY
         Y5OUPm/ct1mwhjctUsfrK3Q3mM9Ii/V8Eto2uQ8SbC+T9KD64IX7tbw01hOVM+xwy2B4
         /Pbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730393791; x=1730998591;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1o4G8h3x5SaYs0gPXX1YI/0UiKbBxnmoxTFZP1kdGuY=;
        b=GIa6Px5QVXEnneknmh1TalHcgwROoUAa3NjAv3iRbgzXuNhbYL6vCIZ5dRbYckyhyu
         5pLe4/s+/43tL3Fjs5yL/IraXgLcfNKJIWtabG0KQjwq9RKLIm549V+d91w/nGL/zS3T
         KJ4LFU/lwziX/9KWejhXY+0wTgU6Dd6xau8p/L4tUQfmVXSvMeQ0g539+WZuiwoqSkh2
         4jJOYTkpp7VdyWAoLBDKf6DN8Bxnar1BMFNLt0UrQK8i12wQ+0sT9mzYbXWRF8t1WZKq
         W2kIbNL71CULBwldimw7fVvwhO4GD8jY4SzM3h/BG9aFedIewHvomtlumAaQsmoiWIiU
         xyTg==
X-Gm-Message-State: AOJu0YwYiRG2/aAiYDbFoS49EZYRg7WYHv5wXahvPGV+jDkaKgIJ3KJ8
	tP7O9TE6UfQtNw1FWjozLVSRFulT4u141cutvrf6D5pBPhtLqG+WWc/gY603b01h/RSI6iUyrCt
	ou94=
X-Google-Smtp-Source: AGHT+IFBQOiMcfpK4hIbGzZ+uvEQKu1UxpugD8rYvtvt5/jE9oGFgE2FW67chhhs8xQqYz3H+XGxnA==
X-Received: by 2002:a05:600c:4f14:b0:42b:a7c7:5667 with SMTP id 5b1f17b1804b1-4328327ec52mr4895605e9.25.1730393790391;
        Thu, 31 Oct 2024 09:56:30 -0700 (PDT)
Received: from [192.168.1.64] (2a02-8428-e55b-1101-1e41-304e-170b-482f.rev.sfr.net. [2a02:8428:e55b:1101:1e41:304e:170b:482f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10e747csm2660525f8f.64.2024.10.31.09.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 09:56:30 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 31 Oct 2024 17:56:16 +0100
Subject: [PATCH 1/5] README: add instruction to run Vale on a subset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-add-bblock-documentation-v1-1-32b89093bbda@baylibre.com>
References: <20241031-add-bblock-documentation-v1-0-32b89093bbda@baylibre.com>
In-Reply-To: <20241031-add-bblock-documentation-v1-0-32b89093bbda@baylibre.com>
To: docs@lists.yoctoproject.org, Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.14.2
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 31 Oct 2024 16:56:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5638

make stylecheck runs Vale on the whole documentation which can be long
and reports a lot of errors/warnings. We can run Vale on a subset using
the VALEDOCS variable, so update documentation to highlight it.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 documentation/README | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/documentation/README b/documentation/README
index c888b666a8632a1d6f576c68e4f9ca966d79f134..6a4db97d65b9c23828163d8b548485b2e302bc97 100644
--- a/documentation/README
+++ b/documentation/README
@@ -142,6 +142,13 @@ To run Vale:
 
  $ make stylecheck
 
+Style checking the whole documentation might take some time and generate a
+lot of warnings/errors, thus one can run Vale on a subset:
+
+  $ make stylecheck VALEDOCS=<file>
+  $ make stylecheck VALEDOCS="<file1> <file2>"
+  $ make stylecheck VALEDOCS=<dir>
+
 Link checking the Yocto Project documentation
 =============================================
 

-- 
2.47.0


