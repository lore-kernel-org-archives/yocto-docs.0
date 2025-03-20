Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FD4FC35FFA
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 00:34:36 +0000 (UTC)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
 by mx.groups.io with SMTP id smtpd.web10.1998.1742430849861929088
 for <docs@lists.yoctoproject.org>;
 Wed, 19 Mar 2025 17:34:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=vegaJyr8;
 spf=pass (domain: linaro.org, ip: 209.85.222.46, mailfrom: javier.tia@linaro.org)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-86d377306ddso87850241.2
        for <docs@lists.yoctoproject.org>; Wed, 19 Mar 2025 17:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742430849; x=1743035649; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y59giNKtwyBUQBtmmF9ISweqvTgmhAj61z+4ZJqKxaA=;
        b=vegaJyr8RKPpGw4PlExc9L2O/gw8R6hqvMNUvwiC7JxdS4DmlxEi5/9c7p6VDTs0lw
         aZ8qalPMmXSZaRxrff4ZSktQ18SnusVCtuSakTh5HkEA8FF2N1kHnjyK1mi90/EyKrzF
         K9r+9myCsjigbGziJlM4mEjDtN/3n8NKNn/l5p8ilCSHzM15tUW27cHe3psCTH1W1mxn
         P4E/tiDknXSlHKWBkZpMUXhfCm4mnPcPBwSPyKn+CEWSVK0vCgMc32ekJEjMZVWS2xv0
         pNvTVjxrqkEfdLkFMgRiZiN/MPo29n4XgvDazJ9C87NfsHL07d6BvkC0KqfOrZwuyx/T
         vL5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742430849; x=1743035649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y59giNKtwyBUQBtmmF9ISweqvTgmhAj61z+4ZJqKxaA=;
        b=ESKLI6VT+gpbk+7mYJEEKUffbbx9G0zjoqYIDRPFKUDASEF3VZB1Xe0B3LGwAIBnwc
         PaRPRcUvZqmV/j3v5Skp4TZPy8acLy7DvVuPD9gvYNtgVEE/xlNvvCBIjUTt/V3Q6fMB
         5rttPOXvyHTB2N9bJyQUE1UjlgQm2A/HV+oJHdRFTg67TX1Rj3Gk+dMz0mTM0JfMRRem
         C0qyI8y5QZI2EpXK2cRTSRcEgxb5Cjj4jsuETix9xLmpAMFS0Mn+MADcyOQ3V1tdFsDd
         809CygxNiEvwkdED91KSjV7i6mhTTD0nHa6dkFda5+FpSfBqIVbyV48XidC4JaWaLtsv
         VXbw==
X-Gm-Message-State: AOJu0YxQdVMwe1z7NM9CBdkHUkDnjHISFRnsFZNp2T7Xm/pm+NNCIgg1
	WbXs+88gbufRMrShSGwtJh0AKrYb0COzXsd8N8YFPny2c0i350GRrTqNmGS90og=
X-Gm-Gg: ASbGncsa1ersucZwVjNOBlMXJiGK3sH8036Tu0XxNdlOdNEJ0fl89RPOUzKLh7RVQEn
	TwPbcgK8Aor6fr5alUn5g+tHrRFNWDrdOuFaVkA97ehx3Gjwn7B+a3db5L11RHxNUv1aICqepjt
	gvrtfrnUjp+GzZa8KYiWKm2LK6i0/Rw9uJEzesOZ8dXJj55U35IP8S8akSzlSlFHTR5y+hH7Eu2
	Y4li0rnBpLq0TDA5pjRWQ/ztwhmijGUXXFOwyVYBn95c8nWcWEgV6NpUgZTJMzIiGbk+fDFxcb7
	dvkOT8Zvk+QC/9uDCgifAhQ/jnuEco01NBm9vLILOrgg0rjySyTovnrfGESEU16rE7vKLHS6
X-Google-Smtp-Source: AGHT+IFX3e5zE4cUr99LyZRS8dRiK35Vea/WOVKXYczCyLRcA/DmP0sJ+cRW8kb4EO+SlV3wHxXebw==
X-Received: by 2002:a05:6102:161f:b0:4bb:eb4a:f9ec with SMTP id ada2fe7eead31-4c4ec8111d0mr3491502137.16.1742430848888;
        Wed, 19 Mar 2025 17:34:08 -0700 (PDT)
Received: from localhost.localdomain ([170.246.157.153])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-86d90d68da8sm2676704241.6.2025.03.19.17.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 17:34:08 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: bitbake-devel@lists.openembedded.org
Cc: docs@lists.yoctoproject.org,
	Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: [PATCH] doc: Mention `if [[ somecondition ]]` is not supported
Date: Wed, 19 Mar 2025 18:33:58 -0600
Message-ID: <20250320003358.977774-1-javier.tia@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 20 Mar 2025 00:34:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6595

I keep forgetting using `if [[ somecondition ]]` is not supported.

Signed-off-by: Javier Tia <javier.tia@linaro.org>
---
 doc/bitbake-user-manual/bitbake-user-manual-metadata.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst b/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
index 415fbf6d6..5474e154f 100644
--- a/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
+++ b/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
@@ -1381,6 +1381,10 @@ To make use of this technique, you need the following things in place:
    To call your modified version of the function as defined in your recipe,
    call it as ``do_foo``.
 
+   .. note::
+
+      Conditional expression using ``[[ somecondition ]]`` is not supported.
+
 With these conditions met, your single recipe can freely choose between
 the original function as defined in the class file and the modified
 function in your recipe. If you do not set up these conditions, you are
-- 
2.49.0


