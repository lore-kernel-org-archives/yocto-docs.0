Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web12.4177.1606292974271153272
 for <docs@lists.yoctoproject.org>;
 Wed, 25 Nov 2020 00:29:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=m93dTcBm;
 spf=pass (domain: linaro.org, ip: 209.85.128.67, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wm1-f67.google.com with SMTP id w24so1317795wmi.0
        for <docs@lists.yoctoproject.org>; Wed, 25 Nov 2020 00:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2huasl+H1skUGiZAHV8yKX7E9UwYuTVKOalUUm2eFWU=;
        b=m93dTcBmfvodhmgUuoVlAFY5kndfeBN4Pr6ouzngiu0Uxo4fIDOr6JXyQvX48ACvsr
         AkbxKcYbUoU+/We6BmI/f5U0ZAHkW90DpslgwwdGZ694rEuZu9IhTFYQXUtxeYoq2DTS
         rS/OLkq00AY2JPW5uc0ki3ZKotDZIsmxEtNXyCM7kpgoxQgXLqbcwN6LRZP44uU3rKBK
         xT18wvH6hHvb6nEgz/ZnLEoXMtu8l9T1IrMz5obxsVzOO85PySesibDtrjcLR1R3BtQl
         nonQ7+pp+LcEO+iwr1OeR/w98mIuZlJ2U5sKYT986zeG7ZzZsOOzSF4L+y+lRxebleTg
         LYKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2huasl+H1skUGiZAHV8yKX7E9UwYuTVKOalUUm2eFWU=;
        b=W3vPJ0vibgU9VYLNcDmQ9P/0b8KgW/vYuZIifr1r7xE8nTLuSEh7+/f4zqzh8XeTo+
         e4X3ntWnH1D2ou/vdyhTFf7qhPfC1BwW0Q++kiOY90MDhegTLM04EYo1+WXdRopQJJeA
         +21lVYCJ9B5UdMG4COR/PwySZ1Z0H50GendgkDJ6/PsHVSnZbxOhVxo/ldvoMQlzA4Cb
         5rsV4InqPDUA1BEjVwokfkv6SPm4+WO/kCmpvCoxLYyHOx3XLcq7gWBlx8hdwoSs4hDV
         3tr9JUpv37bjY4GPheRxdg6tnoT6YJVsrmYy/0t3SsjMWQgU5GbUIBo0VoC+vZyq27yk
         IVjw==
X-Gm-Message-State: AOAM530ebxTUrjdMIWisXqcOGGBWd13mTT2fz6SGbYqYSwMgNjeXLLOd
	DtLUNBnhUWC+Qr/1LB+++WObYU/edUrx1Ttwljg=
X-Google-Smtp-Source: ABdhPJw9+ZwsB3OkQ7CEdP3bHvt41qCdnZ2Mi9Gexoc/bF15QjN7LEgfXIsodQn0i+TDkN4H3m5kBw==
X-Received: by 2002:a7b:c00b:: with SMTP id c11mr2555845wmb.175.1606292972470;
        Wed, 25 Nov 2020 00:29:32 -0800 (PST)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from matterhorn.localdomain ([2a01:e0a:1b9:3e10:6883:56ff:2b71:f8a3])
        by smtp.gmail.com with ESMTPSA id e1sm3750490wra.22.2020.11.25.00.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 00:29:32 -0800 (PST)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH] sphinx: add .vscode in .gitignore
Date: Wed, 25 Nov 2020 09:29:21 +0100
Message-Id: <20201125082921.42212-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 documentation/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/documentation/.gitignore b/documentation/.gitignore
index 21bb72530..c44580b08 100644
--- a/documentation/.gitignore
+++ b/documentation/.gitignore
@@ -1,2 +1,3 @@
 _build/
 Pipfile.lock
+.vscode/
-- 
2.29.2

