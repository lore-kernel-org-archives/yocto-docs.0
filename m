Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.6639.1622031789030189529
 for <docs@lists.yoctoproject.org>;
 Wed, 26 May 2021 05:23:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=VcgYjSvR;
 spf=pass (domain: linaro.org, ip: 209.85.221.51, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wr1-f51.google.com with SMTP id z17so915175wrq.7
        for <docs@lists.yoctoproject.org>; Wed, 26 May 2021 05:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Kj+rXg3mvKEzCHbzl4U3naa6cYHZUdVwvbdEI2SGZno=;
        b=VcgYjSvR8PQdCHB/pcw4U7ARdyYpQYRBUU6K2/qeCMHtAKj2m3ziqZYbb7QESO7/GP
         zS9YvRDXekKRFTePGkoCvqtYuTkhpQP8RS2UoaiTnntgntURILDZtvt6fxK2HMq6scaY
         vW5vS3Lh3hFnYuVfMZmd0ZK1lngYAGOcdvnPdHZRLTKR0A9ctJoZqEbACZi51pADkmYa
         Fxp6RPvfV23QkVfGiY3O4ubswCd9ObnpCyNs4SRlkYtO1QdAdyieqo2YCBMd5+TK3Lm2
         PM8AZv5PGFcEZ2vh6sxM1GW7zXqlyPlFRMQF95NcTAjXwjFJspt25JxOV57JDY8bTVcI
         Exrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Kj+rXg3mvKEzCHbzl4U3naa6cYHZUdVwvbdEI2SGZno=;
        b=RcjtZ9g5xx9GV0HrazEvh9PmekHO35oiESxiZ8IHLkRYrguZHr4Sok8bZX9YKQanNT
         u9bsK6yJCrQQn6EiyuAQyKl/0WbWzEXosdvyWiWELWesEm0x7nFTdpg2JBGf9GvI+iOJ
         KtmQpFtYOTMRuwI+0+7rpTqjlOBVPOyHwux0Mw65nDz9hZ8mIvfsu1voxzndFcWpZtzr
         7lMNGQzWXHfJi4xTJBzwflxDp9s6l0ObOlidD3mc7ECioACkFti5NTJUboWIZlEwUWOA
         VsCX/lLxWXAAFFgxmfL6AwrnN9A6N2DA1PPEx+/Jtw5Xeidd5ZGzM0MAmLYmjAcUE/EB
         MBhg==
X-Gm-Message-State: AOAM530oKmyzf21M0o4J5nda7s8BGRxGoewVrg1gqv5nnnC7YNmJelf/
	lCudZHZx7vMbY9s9e0392WU/YPg7ohzD7LnX
X-Google-Smtp-Source: ABdhPJxnlyhsyE8dJq1e+z7r2x/c7kaMSAl2a7m2RCYDefc4BFNH3rC1rZPMRBhaKs1pEFVSkg6tgw==
X-Received: by 2002:adf:f50e:: with SMTP id q14mr32683645wro.408.1622031787425;
        Wed, 26 May 2021 05:23:07 -0700 (PDT)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from matterhorn.localdomain ([2a01:e0a:1b9:3e10:97e3:5361:aa3:23fb])
        by smtp.gmail.com with ESMTPSA id m7sm20817639wrv.35.2021.05.26.05.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 05:23:06 -0700 (PDT)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 1/3] index: remove the link/section to 'mega manual' from main page
Date: Wed, 26 May 2021 14:22:48 +0200
Message-Id: <20210526122250.2552376-2-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526122250.2552376-1-nicolas.dechesne@linaro.org>
References: <20210526122250.2552376-1-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'megamanuel' can be selected using the drop down menu on the
documentation website. It was reported it is confusing to have it on
the main page (and in the left side bar) as well. Let's remove it.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 documentation/index.rst | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/documentation/index.rst b/documentation/index.rst
index 6aeeb2197..7b70ebc02 100644
--- a/documentation/index.rst
+++ b/documentation/index.rst
@@ -36,12 +36,6 @@ Welcome to the Yocto Project Documentation
    Test Environment Manual <test-manual/index>
    bitbake
 
-.. toctree::
-   :maxdepth: 1
-   :caption: 'Mega' Manual
-
-   All-in-one 'Mega' Manual <https://docs.yoctoproject.org/singleindex.html>
-
 .. toctree::
    :maxdepth: 1
    :caption: Manuals/Variable Index
-- 
2.31.1

