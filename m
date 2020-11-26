Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.2949.1606384126810316822
 for <docs@lists.yoctoproject.org>;
 Thu, 26 Nov 2020 01:48:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Ybe+zaNm;
 spf=pass (domain: linaro.org, ip: 209.85.128.52, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wm1-f52.google.com with SMTP id 1so1716029wme.3
        for <docs@lists.yoctoproject.org>; Thu, 26 Nov 2020 01:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kNccjX2wVCje9A2v3/3twGQ7tWHXukOr2zNvQ9y+9Xc=;
        b=Ybe+zaNmWS8V6g2yW4fEHBfqB8BSOGL4xbV7N+H+mFH6ojKD1kqsYpuUrS7HbmQwSQ
         YDtQhRS4hoZ70vu6D/bcxwb/SjPW/V18p6d0oz6CJU5c1jKEHSJQuzx5yzQVKzGN3h9K
         1hInO0TLecVgETXijmf2a7JcBtmPc8clD7r0OhWH3rwQ4vvWK67LWwOgMV5LNgJOQkJj
         VeZ4ALO1NGvkEyEBGO5VFBGuBQgWt/JBE0hYe4jn23yRkx/8vpT9P3juRQWa4rLg/fU8
         EL1i8mWg+mxKMHnazsXcrfzR5AE56spYoOxNDdIPD++d0VuAzo88N6Y5mZyiZZ7Ax4lM
         aGbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kNccjX2wVCje9A2v3/3twGQ7tWHXukOr2zNvQ9y+9Xc=;
        b=VYtVuzlnMvzmloFpIhcsl3S8akjnLv1WgWK380JKi7sYJnCIaFdoiHbRw1SQ1/6Urv
         pUPjM78G1Kidvan8bORTYubEYoJiWVBnxrfAcM4J3dWpwdogHpWdpoc1kNgvpskXx/Xx
         73BDGa6LSm8nBoGBnlscgxRPTOMJtBBeVGuuEeYK/mLtkyWOuIwNYFq1MGSaxZeV74/P
         kNgwGD/hrWpmE95yVZreT+HulLEosA/LEt7GH2lw1jcby1kB4z2NKKvGLd/oJscjgw9r
         pyZaZwBqfJZdAhkrmEY63jVHy0G8zVE2VAG2uIdqr6Ri3iWYCqyDSWuuvyZWFp/v18SO
         rsFw==
X-Gm-Message-State: AOAM533aWQzpp5GkTUZwhckKf2YRW5ujMCzLoK9iLlLItoi/XEiNrxKd
	Q+rVO9Fl378MLeRII8teKvQvt8HjFHaMkMpv
X-Google-Smtp-Source: ABdhPJzuXvRUNx8iVBrgYbZTEQ8Enqhs/5FsTcK9G0zH6I6UwBR6wQREwFYa4V8puSxIjbNQd7xB0Q==
X-Received: by 2002:a1c:c3d7:: with SMTP id t206mr1411684wmf.91.1606384125041;
        Thu, 26 Nov 2020 01:48:45 -0800 (PST)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from matterhorn.localdomain ([2a01:e0a:1b9:3e10:6883:56ff:2b71:f8a3])
        by smtp.gmail.com with ESMTPSA id a12sm8759590wrq.58.2020.11.26.01.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 01:48:44 -0800 (PST)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 5/7] sdk-manual: replace labels with references to section title
Date: Thu, 26 Nov 2020 10:48:25 +0100
Message-Id: <20201126094827.95641-6-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201126094827.95641-1-nicolas.dechesne@linaro.org>
References: <20201126094827.95641-1-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 documentation/sdk-manual/sdk-appendix-obtain.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/sdk-manual/sdk-appendix-obtain.rst b/documentation/sdk-manual/sdk-appendix-obtain.rst
index 1a2e4c387..6b7128c27 100644
--- a/documentation/sdk-manual/sdk-appendix-obtain.rst
+++ b/documentation/sdk-manual/sdk-appendix-obtain.rst
@@ -91,7 +91,7 @@ build the SDK installer. Follow these steps:
    (i.e. a local
    ``poky`` repository). See the ":ref:`dev-manual/dev-manual-start:cloning the \`\`poky\`\` repository`" and
    possibly the ":ref:`dev-manual/dev-manual-start:checking out by branch in poky`" and
-   ":ref:`checkout-out-by-tag-in-poky`" sections
+   ":ref:`dev-manual/dev-manual-start:checking out by tag in poky`" sections
    all in the Yocto Project Development Tasks Manual for information on
    how to clone the ``poky`` repository and check out the appropriate
    branch for your work.
-- 
2.29.2

