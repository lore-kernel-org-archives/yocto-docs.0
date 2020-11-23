Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.39629.1606154543919915596
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Nov 2020 10:02:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=H3ARVyfg;
 spf=pass (domain: konsulko.com, ip: 209.85.221.41, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f41.google.com with SMTP id s8so19462596wrw.10
        for <docs@lists.yoctoproject.org>; Mon, 23 Nov 2020 10:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N+GfTC8f/lYgxiLQuk0m9TECSZq2vaakCNe96S5oYUw=;
        b=H3ARVyfgpZDICl2Fb26Fi0rPSE09wuKbITwIFbouN6IWHeoONFrKvSVpHWDzGkxFkw
         0WSL18IpVleBwWeCT1fNnKGWOhozALC2ynQLGj3mru1FUKTTyJF4gIU2GqYh2SJrACWC
         ccqRbgRGm+dRXLIfsV/gSqQG8yDko7CQr9Bo8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N+GfTC8f/lYgxiLQuk0m9TECSZq2vaakCNe96S5oYUw=;
        b=Bll1lenYf0wfkxVwFqf+jjFmSmFpXXcZfkyhwmnk4/ALjFry0znzpeVvkn69ppr+Uk
         68sHNCr52RTbjLtjdM+CYbOP13P46+9nkpQ/IlN3v6y4klWu0KCHMj+G5SUPemcDJXlv
         v0UC/8xYM8R39x2LqJZ70AcCUuM+Cza8KSzpb081cB9VKJLORa//lyB+Ryte0+FkzLCW
         makhRM6wFdXqjE6JBViFqGeEuSY6+5eWOrTzoCA5MvtJy+1HJ5uGN5AqjO4dhaKk2alE
         3Hco8U2i9P5gHyAHRzm5wrY8lNk3hxg21hRt3VtbBY0/682kzg5J9AzjmJjUkHMG1Y0l
         T1yA==
X-Gm-Message-State: AOAM5319RwtjsSBGSqnNqklJSI8tO+obX7GmlaYOK334m+uSb/WZfOoI
	NlmXcWmuDZpUkJo96FgVmTSgbEWpBMNsgQ==
X-Google-Smtp-Source: ABdhPJxqx/7gLfdSE0nI769L0Vj33uWo1J/9HHYsUC2xUiSExrkvgJ+9ljCP5OPHMONLsbYSP6vjWg==
X-Received: by 2002:adf:e7d0:: with SMTP id e16mr964235wrn.114.1606154542114;
        Mon, 23 Nov 2020 10:02:22 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from deb10.home.b5net.uk (cpc76148-clif11-2-0-cust524.12-4.cable.virginm.net. [82.1.54.13])
        by smtp.gmail.com with ESMTPSA id v8sm117315wmg.28.2020.11.23.10.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 10:02:21 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH v3 0/7] Improve contribution guidelines
Date: Mon, 23 Nov 2020 18:02:12 +0000
Message-Id: <20201123180219.1966-1-pbarker@konsulko.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since v2:

    * Drop patches which have been accepted into master already.

    * Use variables DISTRO_NAME_NO_CAP and DISTRO_NAME_NO_CAP_MINUS_ONE when
      referring to next branches.

    * Fix minor typo.

Paul Barker (7):
  dev-manual-common-tasks: Fix refs to testing branches
  dev-manual-common-tasks: Update & move patchwork reference
  dev-manual-common-tasks: Tidy up patch submission process
  dev-manual-common-tasks: Describe git-send-email accurately
  dev-manual-common-tasks: Describe how to handle patch feedback
  dev-manual-common-tasks: Describe how to propose changes to stable
    branches
  dev-manual-common-tasks: Re-order patch submission instructions

 .../dev-manual/dev-manual-common-tasks.rst    | 340 +++++++++++-------
 1 file changed, 210 insertions(+), 130 deletions(-)

-- 
2.20.1

