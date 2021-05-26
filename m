Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web12.6640.1622031789859449896
 for <docs@lists.yoctoproject.org>;
 Wed, 26 May 2021 05:23:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=X8qAA5W/;
 spf=pass (domain: linaro.org, ip: 209.85.221.43, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wr1-f43.google.com with SMTP id g17so689970wrs.13
        for <docs@lists.yoctoproject.org>; Wed, 26 May 2021 05:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WpMkUtawi5X6dXZnXbEkJjNWvU1GqMsZ2SK40SmG7aQ=;
        b=X8qAA5W/VEYZC0N0tBtS+GHEa0qLyYqa+46m0kmiOCGtdNva9ihlLfvtwkF7mOR3JT
         XaDXpSB2BbZNnma4darCUSaYVJ3otsTXYFjS+jBAgtY1X+7dYZEk6m2J4a3MvXERnSEo
         yQnz72odCWmyQicIUdRztpM8jl1d2auVIm5E6ls+4974yMbyrSFwFvX4u89zLYInSXcI
         AseXz8y7CXxjspCOrf8wjy21kN0rqlsaq0k8Of6suDOo3LLa1eTI8KhSdcmGL84yLZTJ
         3DZvi8JVijYYwsDZ/gWELWEI9t479aLSzvzsdQGhpEFhNkgWEzPqVc/6bARTEl1yTQnG
         x4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WpMkUtawi5X6dXZnXbEkJjNWvU1GqMsZ2SK40SmG7aQ=;
        b=WR64glbnuYt8shQV7CZxBUPPs0Q00X5IAV05p7dX9JKHubti4Fut7Tw8TFZ8hv1hrL
         u31owhYJEYbrtBgiLQwP+DrP9hTtC7h3VgLEXTJMLBUXlU6eTy/utlURInAf2ztUQjyI
         uD+/BnAVMSFhulcbJ0vjjcB09f0J5NIgl6TnVZ5kwVlUvpQ1W7O3DV6FwDV9fm/1ZSbD
         4z3XEC/3AaQS4JlifqhROHCputr1Ecpjdw0LcsvkgUCAZBmNa6kps9YxttAFjAWC1GuE
         auYVRiKzXrE+/QxgaZ7L5OifMWUeEse3y+QwDD8X9XTRpjNwA6uiESBfRMVVsGAFnLSO
         uruA==
X-Gm-Message-State: AOAM533PkTlAdRiA8+UeyvHtcV9EjHm/MFXHvr75vzQrbcanig8iRNmd
	Ps+Fv53GKDX9tQAwDnrV8eX+R5ODpsvHJgag
X-Google-Smtp-Source: ABdhPJzU9+QHb3anVkhKBBIndWXQmrvGegTyPXsaL7hOTNgZJwqKcAd5XWLvZTnBCmc05J2kVN2llA==
X-Received: by 2002:a5d:6d84:: with SMTP id l4mr30331122wrs.213.1622031788266;
        Wed, 26 May 2021 05:23:08 -0700 (PDT)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from matterhorn.localdomain ([2a01:e0a:1b9:3e10:97e3:5361:aa3:23fb])
        by smtp.gmail.com with ESMTPSA id m7sm20817639wrv.35.2021.05.26.05.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 05:23:07 -0700 (PDT)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 2/3] index: remove links to releases manual and index
Date: Wed, 26 May 2021 14:22:49 +0200
Message-Id: <20210526122250.2552376-3-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526122250.2552376-1-nicolas.dechesne@linaro.org>
References: <20210526122250.2552376-1-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Keep the links in the left side navigation bar, but remove them from
the main page.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 documentation/index.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/documentation/index.rst b/documentation/index.rst
index 7b70ebc02..a0b652677 100644
--- a/documentation/index.rst
+++ b/documentation/index.rst
@@ -39,6 +39,7 @@ Welcome to the Yocto Project Documentation
 .. toctree::
    :maxdepth: 1
    :caption: Manuals/Variable Index
+   :hidden:
 
    genindex
    Current/Previous Version Specific Manuals <releases>
-- 
2.31.1

