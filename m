Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web09.6631.1622031788803675241
 for <docs@lists.yoctoproject.org>;
 Wed, 26 May 2021 05:23:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=puh5ZO9f;
 spf=pass (domain: linaro.org, ip: 209.85.128.45, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wm1-f45.google.com with SMTP id n17-20020a7bc5d10000b0290169edfadac9so388984wmk.1
        for <docs@lists.yoctoproject.org>; Wed, 26 May 2021 05:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fGpXnNL8X5n1xjrCpfTUCLPcx5NkVDft+BwmT568usU=;
        b=puh5ZO9fz+QAgJGtks6QU4vSWoEndTjB+C0uKhH917nXRr5PqPhsGNY+PGAL0amk8D
         LgTWU8FXWRkpddPvC/FBItx3OJjGUr4cHiP9RtZ9vkRU9HN+bX+k/UfVUj1l4PK28HB0
         /4ZylD84fjIKX3mSxL1n87j+7PBLvyj+w8Je7bu82QnpkXZqfXhm8kmkXMcQeMmCTcaj
         86wgs2bKX4qPrkDMyhY+2X2K2As+cl6stoLZ3I16YRUcXFLxrcX6sZh3dkSiYPFd2ghC
         y9CN6LdBDr26A1GmKPoxUFZVJtokZQqzLC18oScGceRSYsaqs8x/+G0idlCZ/WN9spHw
         D0Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fGpXnNL8X5n1xjrCpfTUCLPcx5NkVDft+BwmT568usU=;
        b=jWH16eUZk4GgJ20aOj3AKg3J4SwFndRQhAOwINte9vXonpUVj7I6islqrfp+wO1Wqr
         r7VvEsh4jQKyeZQbxaT50GLq+vmBxwtvXWBvLWVmsoXGs0oLk9Vp6aGTbpV47DRTyX4I
         m/i4ZkuqTtBdSuj4pf+m+oy3j900m2+T/voQ1+itrukt7JmlAGNUQkUEU93K07H4it60
         cemo1qkZQ4/zFMm10xBfkoMZpnMqrbJPYRmUEBUk9Z/E7pMskbaFCUafTzsQ48LfA3cQ
         lONQdv+aV5c/kY5FrVYzG2sS+BYy3lAA2N3U9jw4e2QH2Hrh9TkTiivHS+sf+hAysa2a
         ag3g==
X-Gm-Message-State: AOAM533KncnNwEziBWmltAQ8y8HkGmCXG3PXTzn81Oe1UB6xjAhoqNkY
	+RklipksVX4WGtqbvZHhkdHz18kraIgbf94F
X-Google-Smtp-Source: ABdhPJyFrjbRrQtnaV2p0Lje7FtI1p9wyiKPKfLVnruWraZC0DBJIreiklgbKAefVwV8kxwZP/3GJA==
X-Received: by 2002:a1c:9a4a:: with SMTP id c71mr3219782wme.136.1622031786776;
        Wed, 26 May 2021 05:23:06 -0700 (PDT)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from matterhorn.localdomain ([2a01:e0a:1b9:3e10:97e3:5361:aa3:23fb])
        by smtp.gmail.com with ESMTPSA id m7sm20817639wrv.35.2021.05.26.05.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 05:23:06 -0700 (PDT)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 0/3] A couple of changes on the documentation main page
Date: Wed, 26 May 2021 14:22:47 +0200
Message-Id: <20210526122250.2552376-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A few simple changes to try to improve the content of the main page. I
am still hoping that we can have a more graphical main page
eventually. I really like
https://projectacrn.github.io/latest/index.html for example (also
managed with Sphinx)

Nicolas Dechesne (3):
  index: remove the link/section to 'mega manual' from main page
  index: remove links to releases manual and index
  index: split releases manuals and indexes into two section in the tree

 documentation/index.rst | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

-- 
2.31.1

