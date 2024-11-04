Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AB20E6B27E
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 15:59:24 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.61218.1730735954816905506
 for <docs@lists.yoctoproject.org>;
 Mon, 04 Nov 2024 07:59:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=MpLHz+PI;
 spf=pass (domain: baylibre.com, ip: 209.85.221.44, mailfrom: jstephan@baylibre.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-37d4a5ecc44so2825288f8f.2
        for <docs@lists.yoctoproject.org>; Mon, 04 Nov 2024 07:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730735953; x=1731340753; darn=lists.yoctoproject.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z3xYPS4k43N3lCIhGgD+nFHt+agzmm2tM+Cy1qabH/Q=;
        b=MpLHz+PI1aOqCQtpDItD++k91adQbMS0eqnopXO8o/LaNrMee7HcQJoImi0HlofpVq
         YKD/j9+2IMI7KMglEGdL2mBk9nfGqp3c2YpGJbytU2R7jo7Dp5EOYwj1V1vVDx1IwpSN
         GOGkoeJ+GEu3QBZY2W645oc36ehGMZXPvDeZKwO/zIadu37C23C34J8vKDJd2cXT+YE5
         6G/QO6KY5Brq6ahXYtmLqS5nV21S8akMe/fNqIsLSr9Rnzg2wePwHROd6rOIvFg9/eqY
         RvYJw6qwdQikbgGeJ3RxkQbOI8kI9SSDkwSAu19BZgp8/m7gkihJSP/vEGVmcxFb7XJz
         viCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730735953; x=1731340753;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z3xYPS4k43N3lCIhGgD+nFHt+agzmm2tM+Cy1qabH/Q=;
        b=lDFfywgwIT/IU0gKWuNODRLcCFPQTQm0zAWCwjNzKCyaBfQ+9lHqkEg+RBJ2CBX/d6
         JcVBlAUkb3R/W/gLamZ6dKRhzVmTakbwPqfh80lpyDdjQY3f8IH6JFc9X3nE1LqznEwP
         Z3xSZuZ3b2swONW7R5jfOwcjpNq1ahYUT1A69jk1h/TdKNaRrCJoOEjVWq2SJiBTFUV6
         y0SiPcl1w71+sXTn6Si10HNkkxsxX0DOo/GpZRyyiJr3/BwSBhrW9yfS+3aw26Znd2Eg
         Yx94lAnhBQ76bUzBZqzupWgLvfWurHbkqAPHAOxmKKQBgoJ3+Of7ZR2mr+tJqk27Yyc6
         oLBg==
X-Gm-Message-State: AOJu0YxN7YoPjye/5ptx9k+cx981vYgx7xgBklfE9kt6vzaPH3iBhmBH
	4yCqGLWIM2SwMQrtpHGAhhZbWBGD7GkKIhpCRE4zJhIs8CzqpSv9RjVuPZdFc5QIE4hfkvrwc2B
	YFEA=
X-Google-Smtp-Source: AGHT+IFPI8pGrbWrGM8Pdi5uP4ITGYLPriqndREG39khJbd/qTYL7uHd4oTTz+CebUxYJWaTIUsKdw==
X-Received: by 2002:a5d:6946:0:b0:37c:d2f0:7331 with SMTP id ffacd0b85a97d-38060fff529mr23458581f8f.0.1730735952990;
        Mon, 04 Nov 2024 07:59:12 -0800 (PST)
Received: from [192.168.42.0] (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10d49d4sm13581732f8f.34.2024.11.04.07.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 07:59:12 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
Date: Mon, 04 Nov 2024 16:59:12 +0100
Subject: [PATCH v2 1/2] README: add instruction to run Vale on a subset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241104-add-bblock-documentation-v2-1-74a8a2cff0f8@baylibre.com>
References: <20241104-add-bblock-documentation-v2-0-74a8a2cff0f8@baylibre.com>
In-Reply-To: <20241104-add-bblock-documentation-v2-0-74a8a2cff0f8@baylibre.com>
To: docs@lists.yoctoproject.org, Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.14.2
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 04 Nov 2024 15:59:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5668

make stylecheck runs Vale on the whole documentation which can be long
and reports a lot of errors/warnings. We can run Vale on a subset using
the VALEDOCS variable, so update documentation to highlight it.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 documentation/README | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/documentation/README b/documentation/README
index c888b666a8632a1d6f576c68e4f9ca966d79f134..8ac8d5236793774586abddfd89cf1b3daa680edc 100644
--- a/documentation/README
+++ b/documentation/README
@@ -142,6 +142,14 @@ To run Vale:
 
  $ make stylecheck
 
+Style checking the whole documentation might take some time and generate a
+lot of warnings/errors, thus one can run Vale on a subset of files or
+directories:
+
+  $ make stylecheck VALEDOCS=<file>
+  $ make stylecheck VALEDOCS="<file1> <file2>"
+  $ make stylecheck VALEDOCS=<dir>
+
 Link checking the Yocto Project documentation
 =============================================
 

-- 
2.47.0


